@interface AccessoryTimeSyncPlugin
- ($85CD2974BE96D4886BB301820D1C36C2)t1;
- (AccessoryTimeSyncPlugin)init;
- (AccessoryTimeSyncPlugin)initWithClock:(id)a3 daemonCore:(id)a4;
- (BOOL)_connectToServer;
- (BOOL)_sendTimeWithUncertainty:(double)a3;
- (BOOL)attemptConnect;
- (TMDaemonCore)daemonCore;
- (TMMonotonicClock)clock;
- (double)lastDelay;
- (double)lastSendTime;
- (double)lastUncertaintyUpdate;
- (int)syncState;
- (void)_addNotificationObservers;
- (void)_connectToServer;
- (void)_getTimeFromAccessory;
- (void)_sendClientArrivedToServer;
- (void)_setSystemTime:(id)a3;
- (void)dealloc;
- (void)didSetTime:(double)a3 withUncertainty:(double)a4 fromSource:(id)a5 lastInput:(id)a6;
- (void)sendXPCMessage:(id)a3;
- (void)setClock:(id)a3;
- (void)setDaemonCore:(id)a3;
- (void)setLastDelay:(double)a3;
- (void)setLastSendTime:(double)a3;
- (void)setLastUncertaintyUpdate:(double)a3;
- (void)setSyncState:(int)a3;
- (void)setT1:(id)a3;
@end

@implementation AccessoryTimeSyncPlugin

- (AccessoryTimeSyncPlugin)init
{
  return 0;
}

- (AccessoryTimeSyncPlugin)initWithClock:(id)a3 daemonCore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)AccessoryTimeSyncPlugin;
  id v9 = [(AccessoryTimeSyncPlugin *)&v28 init];
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "in init", buf, 2u);
    }
    objc_storeWeak((id *)v9 + 5, v8);
    objc_storeStrong((id *)v9 + 6, a3);
    v10 = (void *)*((void *)v9 + 1);
    *((void *)v9 + 1) = 0;

    [v9 _addNotificationObservers];
    id WeakRetained = objc_loadWeakRetained((id *)v9 + 5);
    v12 = [WeakRetained workloop];
    dispatch_source_t v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v12);
    v14 = (void *)*((void *)v9 + 2);
    *((void *)v9 + 2) = v13;

    dispatch_source_set_timer(*((dispatch_source_t *)v9 + 2), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    v15 = *((void *)v9 + 2);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __52__AccessoryTimeSyncPlugin_initWithClock_daemonCore___block_invoke;
    handler[3] = &unk_C518;
    v16 = (dispatch_source_t *)v9;
    v26 = v16;
    dispatch_source_set_event_handler(v15, handler);
    dispatch_activate(*((dispatch_object_t *)v9 + 2));
    id v17 = objc_loadWeakRetained((id *)v9 + 5);
    v18 = [v17 workloop];
    dispatch_source_t v19 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v18);
    dispatch_source_t v20 = v16[3];
    v16[3] = v19;

    dispatch_source_set_timer(v16[3], 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    v21 = v16[3];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __52__AccessoryTimeSyncPlugin_initWithClock_daemonCore___block_invoke_6;
    v23[3] = &unk_C518;
    v24 = v16;
    dispatch_source_set_event_handler(v21, v23);
    dispatch_activate(v16[3]);
  }
  return (AccessoryTimeSyncPlugin *)v9;
}

id __52__AccessoryTimeSyncPlugin_initWithClock_daemonCore___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "request sync timer fired", v3, 2u);
  }
  return [*(id *)(a1 + 32) _getTimeFromAccessory];
}

id __52__AccessoryTimeSyncPlugin_initWithClock_daemonCore___block_invoke_6(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sync state timer fired", v3, 2u);
  }
  return [*(id *)(a1 + 32) setSyncState:0];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  dispatch_source_cancel((dispatch_source_t)self->_requestTimer);
  dispatch_source_cancel((dispatch_source_t)self->_syncStateTimer);
  if (self->isConnectionActive) {
    xpc_connection_cancel(self->_serverConnection);
  }
  v4.receiver = self;
  v4.super_class = (Class)AccessoryTimeSyncPlugin;
  [(AccessoryTimeSyncPlugin *)&v4 dealloc];
}

- (void)_addNotificationObservers
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)handleServerArrivedNotification, @"com.apple.coreaccessories.TimeSyncServerArrived", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_super v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)handleNotification, @"com.apple.coreaccessories.AcctoolTestGetTime", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)handleNotification, @"com.apple.coreaccessories.AcctoolTestSendTime", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_setSystemTime:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemonCore);
  v6 = [WeakRetained workloop];
  dispatch_assert_queue_V2(v6);

  if ([(AccessoryTimeSyncPlugin *)self syncState])
  {
    [(AccessoryTimeSyncPlugin *)self setSyncState:2];
    id v7 = [(TMMonotonicClock *)self->_clock machTime];
    id v8 = (unint64_t *)malloc_type_calloc(1uLL, 0x30uLL, 0x1000040EED21634uLL);
    size_t bytes = xpc_data_get_bytes(v4, v8, 0, 0x30uLL);
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v32[1] = v10;
    long long v33 = v10;
    v32[0] = v10;
    long long v11 = *(_OWORD *)v8;
    long long v12 = *((_OWORD *)v8 + 2);
    long long v35 = *((_OWORD *)v8 + 1);
    long long v36 = v12;
    *(_OWORD *)buf = v11;
    sntp_packet_ntoh((long long *)buf, (uint64_t)v32);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)&buf[4] = DWORD2(v33);
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = HIDWORD(v33);
      *(_WORD *)&buf[14] = 1024;
      LODWORD(v35) = WORD4(v32[0]);
      WORD2(v35) = 1024;
      *(_DWORD *)((char *)&v35 + 6) = WORD5(v32[0]);
      WORD5(v35) = 1024;
      HIDWORD(v35) = HIDWORD(v32[0]);
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "received packet with utc:%u.%u \nunc:%04X.%04X \nref:%u", buf, 0x20u);
    }
    if (bytes)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __42__AccessoryTimeSyncPlugin__setSystemTime___block_invoke;
      block[3] = &unk_C518;
      block[4] = self;
      if (_setSystemTime__onceToken != -1) {
        dispatch_once(&_setSystemTime__onceToken, block);
      }
      unint64_t v30 = sntp_timestamp_ntoh(v8[3]);
      unint64_t v29 = sntp_timestamp_gettime();
      *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v37 = v13;
      long long v38 = v13;
      long long v35 = v13;
      long long v36 = v13;
      *(_OWORD *)buf = v13;
      long long v14 = *(_OWORD *)v8;
      long long v15 = *((_OWORD *)v8 + 2);
      long long v27 = *((_OWORD *)v8 + 1);
      long long v28 = v15;
      *(_OWORD *)location = v14;
      sntp_client_process_response((unsigned __int8 *)location, &v30, &v29, (uint64_t)buf);
      free(v8);
      location[0] = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(location, self);
      clock = self->_clock;
      id v17 = objc_loadWeakRetained((id *)&self->_daemonCore);
      v18 = [v17 workloop];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = __42__AccessoryTimeSyncPlugin__setSystemTime___block_invoke_12;
      v19[3] = &unk_C560;
      objc_copyWeak(&v20, location);
      long long v23 = v36;
      long long v24 = v37;
      long long v25 = v38;
      long long v21 = *(_OWORD *)buf;
      long long v22 = v35;
      v19[4] = self;
      [(TMMonotonicClock *)clock montonicTimeForMachTime:v7 toQueue:v18 withCompletionHandler:v19];

      objc_destroyWeak(&v20);
      objc_destroyWeak(location);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AccessoryTimeSyncPlugin could not fetch xpc data.", buf, 2u);
      }
      free(v8);
      [(AccessoryTimeSyncPlugin *)self setSyncState:0];
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "received packet that was not expected in idle sync state, ignoring", buf, 2u);
  }
}

void __42__AccessoryTimeSyncPlugin__setSystemTime___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "accessory time input request timer set to fire at max interval", v3, 2u);
  }
  dispatch_time_t v2 = dispatch_time(0, 43200000000000);
  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 16), v2, 0x274A48A78000uLL, 0xDF8475800uLL);
}

void __42__AccessoryTimeSyncPlugin__setSystemTime___block_invoke_12(uint64_t a1, double a2, double a3)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = sntp_calc_delay(a1 + 48);
  double v9 = sntp_datestamp_to_double(v7, v8);
  uint64_t v10 = sntp_calc_error(a1 + 48);
  double v12 = sntp_datestamp_to_double(v10, v11);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v13 = *(unsigned __int16 *)(a1 + 92);
    int v14 = *(unsigned __int16 *)(a1 + 94);
    int v15 = *(unsigned __int16 *)(a1 + 88);
    int v16 = *(unsigned __int16 *)(a1 + 90);
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)unint64_t v29 = v13;
    *(_WORD *)&v29[4] = 1024;
    *(_DWORD *)&v29[6] = v14;
    LOWORD(v30) = 1024;
    *(_DWORD *)((char *)&v30 + 2) = v15;
    HIWORD(v30) = 1024;
    *(_DWORD *)v31 = v16;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "header dispersion: %u.%u header delay: %u.%u", buf, 0x1Au);
  }
  double v17 = v9 + v12 + a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218752;
    *(double *)unint64_t v29 = v12;
    *(_WORD *)&v29[8] = 2048;
    double v30 = v9;
    *(_WORD *)v31 = 2048;
    *(double *)&v31[2] = a3;
    __int16 v32 = 2048;
    double v33 = v9 + v12 + a3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "error: %lf delay: %lf rtcUnc: %lf total: %lf", buf, 0x2Au);
  }
  [WeakRetained setLastDelay:v9];
  if (v12 >= 65535.6554)
  {
    id v18 = objc_loadWeakRetained(WeakRetained + 5);
    objc_msgSend(v18, "setAccessoryUnc_s:", 1.79769313e308);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __42__AccessoryTimeSyncPlugin__setSystemTime___block_invoke_12_cold_2(v12);
    }
  }
  uint64_t v19 = sntp_calc_mean(a1 + 48);
  double v21 = sntp_datestamp_to_double(v19, v20) - (kCFAbsoluteTimeIntervalSince1970 + 2208988800.0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)unint64_t v29 = v21;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "utcTime: %lf", buf, 0xCu);
  }
  if (v21 >= 0.0)
  {
    if (v12 < 65535.6554)
    {
      id v22 = objc_loadWeakRetained(WeakRetained + 5);
      objc_msgSend(v22, "setAccessoryUnc_s:", v12);

      if ((*(unsigned char *)(a1 + 96) & 1) == 0)
      {
        id v23 = objc_loadWeakRetained(WeakRetained + 5);
        objc_msgSend(v23, "accessoryUnc_s");
        objc_msgSend(v23, "setAccessoryUnc_s:", v24 + 5.0);
      }
      *((double *)WeakRetained + 10) = a2;
      long long v25 = +[TMTime timeWithUtc_s:type metadata for __ObjC utcUnc_s:v21 rtc_s:v17 sf:a2 source:1.0];
      id v26 = objc_loadWeakRetained(WeakRetained + 5);
      long long v27 = [v25 dictionary];
      [v26 setSourceTime:v27];
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    __42__AccessoryTimeSyncPlugin__setSystemTime___block_invoke_12_cold_1(v21);
  }
  AnalyticsSendEventLazy();
  [*(id *)(a1 + 32) setSyncState:0];
}

id __42__AccessoryTimeSyncPlugin__setSystemTime___block_invoke_16(uint64_t a1)
{
  v17[0] = @"calculated_delay";
  dispatch_time_t v2 = +[NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v18[0] = v2;
  v17[1] = @"header_dispersion";
  unint64_t v3 = sntp_timestamp_from_shortstamp(*(_DWORD *)(a1 + 92));
  uint64_t v4 = sntp_timestamp_to_datestamp(v3);
  v6 = +[NSNumber numberWithDouble:sntp_datestamp_to_double(v4, v5)];
  v18[1] = v6;
  v17[2] = @"header_delay";
  unint64_t v7 = sntp_timestamp_from_shortstamp(*(_DWORD *)(a1 + 88));
  uint64_t v8 = sntp_timestamp_to_datestamp(v7);
  uint64_t v10 = +[NSNumber numberWithDouble:sntp_datestamp_to_double(v8, v9)];
  v18[2] = v10;
  v17[3] = @"header_ref";
  unint64_t v11 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 96)];
  v18[3] = v11;
  v17[4] = @"header_stratum";
  double v12 = +[NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 85)];
  v18[4] = v12;
  v17[5] = @"rtc_reset_detected";
  int v13 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 128)];
  v18[5] = v13;
  v17[6] = @"rtc_s";
  int v14 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v18[6] = v14;
  int v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:7];

  return v15;
}

- (BOOL)_sendTimeWithUncertainty:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemonCore);
  v6 = [WeakRetained workloop];
  dispatch_assert_queue_V2(v6);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)&uint8_t buf[4] = a3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AccessoryTimeSyncPlugin in _sendTimeWithUncertainty:%lf", buf, 0xCu);
  }
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v24 = v7;
  long long v25 = v7;
  *(_OWORD *)buf = v7;
  unint64_t v8 = sntp_timestamp_gettime();
  create_sntp_time_payload(v8, (uint64_t)buf, a3);
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v18 = v9;
  long long v19 = v9;
  *(_OWORD *)size_t bytes = v9;
  *(_OWORD *)unint64_t v20 = *(_OWORD *)buf;
  long long v21 = v24;
  long long v22 = v25;
  sntp_packet_hton((long long *)v20, (uint64_t)bytes);
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, "xpcEventName", "sendTimeToAccessory");
  CFDataRef v11 = CFDataCreate(kCFAllocatorDefault, bytes, 48);
  BytePtr = CFDataGetBytePtr(v11);
  xpc_dictionary_set_data(v10, "sntpPacket", BytePtr, 0x30uLL);
  [(AccessoryTimeSyncPlugin *)self sendXPCMessage:v10];
  if (v11) {
    CFRelease(v11);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)unint64_t v20 = 67110656;
    *(_DWORD *)&v20[4] = DWORD2(v25);
    *(_WORD *)&v20[8] = 1024;
    *(_DWORD *)&v20[10] = HIDWORD(v25);
    *(_WORD *)&v20[14] = 1024;
    LODWORD(v21) = *(unsigned __int16 *)&buf[8];
    WORD2(v21) = 1024;
    *(_DWORD *)((char *)&v21 + 6) = *(unsigned __int16 *)&buf[10];
    WORD5(v21) = 1024;
    HIDWORD(v21) = *(_DWORD *)&buf[12];
    LOWORD(v22) = 1024;
    *(_DWORD *)((char *)&v22 + 2) = (buf[0] >> 3) & 7;
    WORD3(v22) = 1024;
    DWORD2(v22) = buf[0] & 7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sending packet with utc:%u.%u \nunc:%04X.%04X \nref:%u \nversion:%d \nmode:%d", v20, 0x2Cu);
  }
  long long v14 = *(_OWORD *)buf;
  long long v15 = v24;
  long long v16 = v25;
  AnalyticsSendEventLazy();
  -[AccessoryTimeSyncPlugin setSyncState:](self, "setSyncState:", 0, _NSConcreteStackBlock, 3221225472, __52__AccessoryTimeSyncPlugin__sendTimeWithUncertainty___block_invoke, &__block_descriptor_80_e19___NSDictionary_8__0l, v14, v15, v16);

  return 1;
}

id __52__AccessoryTimeSyncPlugin__sendTimeWithUncertainty___block_invoke(uint64_t a1)
{
  v16[0] = @"header_dispersion";
  unint64_t v2 = sntp_timestamp_from_shortstamp(*(_DWORD *)(a1 + 40));
  uint64_t v3 = sntp_timestamp_to_datestamp(v2);
  unint64_t v5 = +[NSNumber numberWithDouble:sntp_datestamp_to_double(v3, v4)];
  v17[0] = v5;
  v16[1] = @"header_delay";
  unint64_t v6 = sntp_timestamp_from_shortstamp(*(_DWORD *)(a1 + 36));
  uint64_t v7 = sntp_timestamp_to_datestamp(v6);
  long long v9 = +[NSNumber numberWithDouble:sntp_datestamp_to_double(v7, v8)];
  v17[1] = v9;
  v16[2] = @"header_ref";
  xpc_object_t v10 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 44)];
  v17[2] = v10;
  v16[3] = @"header_stratum";
  CFDataRef v11 = +[NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 33)];
  v17[3] = v11;
  v16[4] = @"header_mode";
  double v12 = +[NSNumber numberWithUnsignedChar:*(unsigned char *)(a1 + 32) & 7];
  v17[4] = v12;
  v16[5] = @"header_version";
  int v13 = +[NSNumber numberWithUnsignedChar:(*(unsigned __int8 *)(a1 + 32) >> 3) & 7];
  v17[5] = v13;
  long long v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:6];

  return v14;
}

- (void)_getTimeFromAccessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemonCore);
  unint64_t v4 = [WeakRetained workloop];
  dispatch_assert_queue_V2(v4);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AccessoryTimeSyncPlugin in _getTimeFromAccessory.", buf, 2u);
  }
  if ([(AccessoryTimeSyncPlugin *)self syncState])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = [(AccessoryTimeSyncPlugin *)self syncState];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v5;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_getTimeFromAccessory called in sync state: %d, ignoring", buf, 8u);
    }
  }
  else
  {
    [(AccessoryTimeSyncPlugin *)self setSyncState:1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __48__AccessoryTimeSyncPlugin__getTimeFromAccessory__block_invoke;
    block[3] = &unk_C518;
    block[4] = self;
    if (_getTimeFromAccessory_onceToken != -1) {
      dispatch_once(&_getTimeFromAccessory_onceToken, block);
    }
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v6, "xpcEventName", "getTimeFromAccessory");
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v14 = v7;
    long long v15 = v7;
    *(_OWORD *)buf = v7;
    unint64_t v8 = sntp_timestamp_gettime();
    create_sntp_request_payload(v8, (uint64_t)v11);
    sntp_packet_hton(v11, (uint64_t)buf);
    CFDataRef v9 = CFDataCreate(kCFAllocatorDefault, buf, 48);
    BytePtr = CFDataGetBytePtr(v9);
    xpc_dictionary_set_data(v6, "sntpPacket", BytePtr, 0x30uLL);
    [(AccessoryTimeSyncPlugin *)self sendXPCMessage:v6];
    if (v9) {
      CFRelease(v9);
    }
  }
}

void __48__AccessoryTimeSyncPlugin__getTimeFromAccessory__block_invoke(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "accessory time input request timer set to fire at min interval", v3, 2u);
  }
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 16), v2, 0x3B9ACA00uLL, 0xDF8475800uLL);
}

- (void)_sendClientArrivedToServer
{
  xpc_object_t message = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(message, "xpcEventName", "timeSyncClientArrived");
  xpc_connection_send_message(self->_serverConnection, message);
}

- (BOOL)attemptConnect
{
  if (self->isConnectionActive) {
    return 1;
  }
  if ([(AccessoryTimeSyncPlugin *)self _connectToServer])
  {
    [(AccessoryTimeSyncPlugin *)self _sendClientArrivedToServer];
    return 1;
  }
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v4)
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AccessoryTimeSyncPlugin Client unable to connect to TimeSync server.", v5, 2u);
    return 0;
  }
  return result;
}

- (void)sendXPCMessage:(id)a3
{
  id v4 = a3;
  xpc_object_t message = v4;
  if (!self->isConnectionActive || (unsigned int v5 = v4, (serverConnection = self->_serverConnection) == 0))
  {
    if (![(AccessoryTimeSyncPlugin *)self attemptConnect]) {
      goto LABEL_6;
    }
    serverConnection = self->_serverConnection;
    unsigned int v5 = message;
  }
  xpc_connection_send_message(serverConnection, v5);
LABEL_6:
}

- (BOOL)_connectToServer
{
  serverConnection = self->_serverConnection;
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (!serverConnection)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Connecting to XPC server...", buf, 2u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_daemonCore);
    unint64_t v8 = [WeakRetained workloop];
    if (!v8) {
      -[AccessoryTimeSyncPlugin _connectToServer]();
    }

    id v9 = objc_loadWeakRetained((id *)&self->_daemonCore);
    xpc_object_t v10 = [v9 workloop];
    mach_service = xpc_connection_create_mach_service("com.apple.timed.accessory-timesync", v10, 0);
    double v12 = self->_serverConnection;
    self->_serverConnection = mach_service;

    if (self->_serverConnection)
    {
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      int v13 = self->_serverConnection;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = __43__AccessoryTimeSyncPlugin__connectToServer__block_invoke;
      v15[3] = &unk_C5D0;
      objc_copyWeak(&v16, (id *)buf);
      v15[4] = self;
      xpc_connection_set_event_handler(v13, v15);
      xpc_connection_resume(self->_serverConnection);
      BOOL v6 = 1;
      self->isConnectionActive = 1;
      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
      return v6;
    }
    BOOL v6 = 0;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v6;
    }
    *(_WORD *)buf = 0;
    unsigned int v5 = "Failed to connect to TimeSync server.";
    goto LABEL_4;
  }
  if (v4)
  {
    *(_WORD *)buf = 0;
    unsigned int v5 = "Client already connected to TimeSync server.";
LABEL_4:
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
  }
  return 0;
}

void __43__AccessoryTimeSyncPlugin__connectToServer__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  id WeakRetained = (xpc_connection_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    unint64_t v8 = xpc_dictionary_get_value(v3, "xpcEventName");
    string_ptr = xpc_string_get_string_ptr(v8);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v19 = string_ptr;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AccessoryTimeSyncPlugin: received event name:%s", buf, 0xCu);
    }
    if (!strcmp(string_ptr, "setSystemTime"))
    {
      xpc_object_t v10 = xpc_dictionary_get_value(v3, "sntpPacket");
      CFDataRef v11 = [(xpc_connection_t *)WeakRetained daemonCore];
      double v12 = [v11 workloop];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = __43__AccessoryTimeSyncPlugin__connectToServer__block_invoke_61;
      v16[3] = &unk_C5A8;
      v16[4] = *(void *)(a1 + 32);
      id v17 = v10;
      id v13 = v10;
      dispatch_async(v12, v16);
    }
  }
  else
  {
    if (type != (xpc_type_t)&_xpc_type_error)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
LABEL_6:
        *((unsigned char *)WeakRetained + 32) = 0;
        xpc_connection_cancel(WeakRetained[1]);
        xpc_connection_t v7 = WeakRetained[1];
        WeakRetained[1] = 0;

        goto LABEL_18;
      }
      *(_WORD *)buf = 0;
      BOOL v6 = "AccessoryTimeSyncPlugin: Unexpected data, invalidating the connection.";
LABEL_5:
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      goto LABEL_6;
    }
    if (v3 != &_xpc_error_connection_interrupted && v3 != &_xpc_error_termination_imminent)
    {
      BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v3 == &_xpc_error_connection_invalid)
      {
        if (!v15) {
          goto LABEL_6;
        }
        *(_WORD *)buf = 0;
        BOOL v6 = "AccessoryTimeSyncPlugin: received connection invdalid message.";
      }
      else
      {
        if (!v15) {
          goto LABEL_6;
        }
        *(_WORD *)buf = 0;
        BOOL v6 = "AccessoryTimeSyncPlugin: Unexpected error dictionary, invalidating the connection.";
      }
      goto LABEL_5;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AccessoryTimeSyncPlugin: will terminate soon", buf, 2u);
    }
  }
LABEL_18:
}

id __43__AccessoryTimeSyncPlugin__connectToServer__block_invoke_61(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setSystemTime:*(void *)(a1 + 40)];
}

- (void)didSetTime:(double)a3 withUncertainty:(double)a4 fromSource:(id)a5 lastInput:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemonCore);
  id v13 = [WeakRetained workloop];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __75__AccessoryTimeSyncPlugin_didSetTime_withUncertainty_fromSource_lastInput___block_invoke;
  v16[3] = &unk_C5F8;
  objc_copyWeak(v19, &location);
  v19[1] = *(id *)&a3;
  v19[2] = *(id *)&a4;
  id v17 = v10;
  id v18 = v11;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(v13, v16);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

void __75__AccessoryTimeSyncPlugin_didSetTime_withUncertainty_fromSource_lastInput___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 64);
    double v5 = *(double *)(a1 + 32);
    double v6 = *(double *)(a1 + 40);
    *(_DWORD *)unint64_t v29 = 134218754;
    *(void *)&v29[4] = v3;
    *(_WORD *)&v29[12] = 2048;
    *(void *)&v29[14] = v4;
    *(_WORD *)&v29[22] = 2112;
    double v30 = v5;
    __int16 v31 = 2112;
    double v32 = v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "didSetTime,%lf,withUncertainty,%lf,fromSource,%@,lastInput,%@", v29, 0x2Au);
  }
  xpc_connection_t v7 = [WeakRetained daemonCore];
  unsigned __int8 v8 = [v7 isAutomaticTimeEnabled];

  if (v8)
  {
    if ([*(id *)(a1 + 40) isEqualToString:type metadata for __ObjC])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v29 = 0;
        id v9 = "didSetTime called in response to Accessory input, ignoring";
LABEL_9:
        uint32_t v10 = 2;
LABEL_10:
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, v29, v10);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
    if ([WeakRetained syncState])
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      unsigned int v11 = [WeakRetained syncState];
      *(_DWORD *)unint64_t v29 = 67109120;
      *(_DWORD *)&v29[4] = v11;
      id v9 = "didSetTime called in sync state: %d, ignoring";
      uint32_t v10 = 8;
      goto LABEL_10;
    }
    [WeakRetained setSyncState:3];
    TMGetKernelMonotonicClock();
    double v13 = v12;
    double v14 = v12 - *((double *)WeakRetained + 9);
    id v15 = objc_loadWeakRetained(WeakRetained + 5);
    objc_msgSend(v15, "accessoryUnc_s");
    double v17 = v16;

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v18 = WeakRetained[9];
      *(_DWORD *)unint64_t v29 = 134218752;
      *(double *)&v29[4] = v13;
      *(_WORD *)&v29[12] = 2048;
      *(void *)&v29[14] = v18;
      *(_WORD *)&v29[22] = 2048;
      double v30 = v14;
      __int16 v31 = 2048;
      double v32 = v17;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "rtc_s,%lf,lastSend,%lf,elapsed,%lf,acc_unc_s,%lf", v29, 0x2Au);
    }
    if (v17 >= 65535.6554 || *((double *)WeakRetained + 9) == 0.0 || v14 <= 0.0 || v14 >= 86400.0)
    {
      if (v17 < 1.79769313e308)
      {
        double v20 = v13 - *((double *)WeakRetained + 10);
        if (v20 > 0.0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            id v21 = WeakRetained[10];
            *(_DWORD *)unint64_t v29 = 134218496;
            *(double *)&v29[4] = v13;
            *(_WORD *)&v29[12] = 2048;
            *(void *)&v29[14] = v21;
            *(_WORD *)&v29[22] = 2048;
            double v30 = v20;
            _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "rtc_s,%lf,lastUpdate,%lf,elapsed,%lf", v29, 0x20u);
          }
          double v17 = v17 + v20 * 0.000005;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            id v22 = objc_loadWeakRetained(WeakRetained + 5);
            objc_msgSend(v22, "accessoryUnc_s");
            *(_DWORD *)unint64_t v29 = 134218240;
            *(void *)&v29[4] = v23;
            *(_WORD *)&v29[12] = 2048;
            *(double *)&v29[14] = v17;
            _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "accessory uncertainty (%lf) propagated accessory uncertainty (%lf)", v29, 0x16u);
          }
        }
      }
      double v24 = *(double *)(a1 + 64) + *((double *)WeakRetained + 8) + 5.0;
      if (v24 <= v17)
      {
        if (v24 <= 65535.6554)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            id v26 = objc_loadWeakRetained(WeakRetained + 5);
            objc_msgSend(v26, "accessoryUnc_s");
            *(_DWORD *)unint64_t v29 = 134218240;
            *(double *)&v29[4] = v24;
            *(_WORD *)&v29[12] = 2048;
            *(void *)&v29[14] = v27;
            _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "potential accessory uncertainty (%lf) accessory uncertainty (%lf)", v29, 0x16u);
          }
          if (*((unsigned char *)WeakRetained + 32))
          {
            *((double *)WeakRetained + 9) = v13;
            id v28 = objc_loadWeakRetained(WeakRetained + 5);
            objc_msgSend(v28, "setAccessoryUnc_s:", v24);

            *((double *)WeakRetained + 10) = v13;
            [WeakRetained _sendTimeWithUncertainty:v24];
            goto LABEL_11;
          }
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_37;
          }
          *(_WORD *)unint64_t v29 = 0;
          long long v19 = "not attempting to send time to accessory until connection is active";
          uint32_t v25 = 2;
          goto LABEL_36;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)unint64_t v29 = 134218240;
          *(double *)&v29[4] = v24;
          *(_WORD *)&v29[12] = 2048;
          *(void *)&v29[14] = 0x40EFFFF4F8A0902ELL;
          long long v19 = "estimate has higher uncertainty (%lf) than can be represented by sntp_shortstamp (%lf), not sending time";
          goto LABEL_35;
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)unint64_t v29 = 134218240;
        *(double *)&v29[4] = v17;
        *(_WORD *)&v29[12] = 2048;
        *(double *)&v29[14] = v24;
        long long v19 = "accessory has lower uncertainty (%lf) than new estimate (%lf), not sending time";
        goto LABEL_35;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)unint64_t v29 = 134218240;
      *(void *)&v29[4] = 0x40F5180000000000;
      *(_WORD *)&v29[12] = 2048;
      *(double *)&v29[14] = v14;
      long long v19 = "not attempting to send time because throttle interval (%lf) > elapsed time (%lf)";
LABEL_35:
      uint32_t v25 = 22;
LABEL_36:
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v19, v29, v25);
    }
LABEL_37:
    objc_msgSend(WeakRetained, "setSyncState:", 0, *(_OWORD *)v29, *(void *)&v29[16]);
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v29 = 0;
    id v9 = "didSetTime called while manual time is enabled, ignoring";
    goto LABEL_9;
  }
LABEL_11:
}

- (void)setSyncState:(int)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemonCore);
  double v6 = [WeakRetained workloop];
  dispatch_assert_queue_V2(v6);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int syncState = self->_syncState;
    v13[0] = 67109376;
    v13[1] = syncState;
    __int16 v14 = 1024;
    int v15 = a3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cmd,syncStateTransition,old,%d,new,%d", (uint8_t *)v13, 0xEu);
  }
  int v8 = self->_syncState;
  if (a3 && !v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "activating sync state timeout", (uint8_t *)v13, 2u);
    }
    dispatch_time_t v9 = dispatch_time(0, 500000000);
    syncStateTimer = self->_syncStateTimer;
    uint64_t v11 = -1;
    uint64_t v12 = 25000000;
LABEL_15:
    dispatch_source_set_timer((dispatch_source_t)syncStateTimer, v9, v11, v12);
    self->_int syncState = a3;
    return;
  }
  if (!a3 && v8 || a3 == 2 && v8 == 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "cancelling sync state timeout", (uint8_t *)v13, 2u);
    }
    syncStateTimer = self->_syncStateTimer;
    dispatch_time_t v9 = -1;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    goto LABEL_15;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    -[AccessoryTimeSyncPlugin setSyncState:]();
  }
}

- (TMDaemonCore)daemonCore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemonCore);

  return (TMDaemonCore *)WeakRetained;
}

- (void)setDaemonCore:(id)a3
{
}

- (TMMonotonicClock)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
}

- ($85CD2974BE96D4886BB301820D1C36C2)t1
{
  return ($85CD2974BE96D4886BB301820D1C36C2)self->_t1;
}

- (void)setT1:(id)a3
{
  self->_t1 = ($609671E5F2BB97ED6567905A5E454B31)a3;
}

- (int)syncState
{
  return self->_syncState;
}

- (double)lastDelay
{
  return self->_lastDelay;
}

- (void)setLastDelay:(double)a3
{
  self->_lastDelay = a3;
}

- (double)lastSendTime
{
  return self->_lastSendTime;
}

- (void)setLastSendTime:(double)a3
{
  self->_lastSendTime = a3;
}

- (double)lastUncertaintyUpdate
{
  return self->_lastUncertaintyUpdate;
}

- (void)setLastUncertaintyUpdate:(double)a3
{
  self->_lastUncertaintyUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clock, 0);
  objc_destroyWeak((id *)&self->_daemonCore);
  objc_storeStrong((id *)&self->_syncStateTimer, 0);
  objc_storeStrong((id *)&self->_requestTimer, 0);

  objc_storeStrong((id *)&self->_serverConnection, 0);
}

void __42__AccessoryTimeSyncPlugin__setSystemTime___block_invoke_12_cold_1(double a1)
{
  int v1 = 134217984;
  double v2 = a1;
  _os_log_fault_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "accessory provided negative UTC time: %lf, not passing to timed", (uint8_t *)&v1, 0xCu);
}

void __42__AccessoryTimeSyncPlugin__setSystemTime___block_invoke_12_cold_2(double a1)
{
  int v1 = 134217984;
  double v2 = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "accessory error: %f, likely clock reset", (uint8_t *)&v1, 0xCu);
}

- (void)_connectToServer
{
}

- (void)setSyncState:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "sync state is already in the desired state, likely threading issue", v0, 2u);
}

@end