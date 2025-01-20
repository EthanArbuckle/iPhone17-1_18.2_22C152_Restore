@interface BTAudioPersonalizedVolumeDevice
- (BTAudioPersonalizedVolumeDevice)init;
- (BTAudioPersonalizedVolumeDevice)initWithBluetoothInfo:(unsigned int)a3 deviceAddr:(id)a4;
- (OS_dispatch_queue)avNotificationMonitorQueue;
- (id).cxx_construct;
- (id)_getCurrentManualVolumeUpdatesDictionary:(id)a3 forCoreAnalyticSubmission:(BOOL)a4;
- (id)getVolumeForCurrentAudioCategory:(id)a3;
- (unsigned)_getCurrentAudioCategoryFromString:(id)a3;
- (unsigned)_getManualVolumeUpdateReasonFromString:(id)a3;
- (void)NotifyManualVolumeChanged:(id)a3 shouldUpdateBuds:(BOOL)a4;
- (void)dealloc;
- (void)invalidate;
- (void)setAvNotificationMonitorQueue:(id)a3;
- (void)startManualVolumeUpdateTimer;
- (void)updateVolumeActiveAudioCategoryMap:(unsigned __int8)a3 audioCategory:(id)a4;
@end

@implementation BTAudioPersonalizedVolumeDevice

- (BTAudioPersonalizedVolumeDevice)init
{
  v3.receiver = self;
  v3.super_class = (Class)BTAudioPersonalizedVolumeDevice;
  result = [(BTAudioPersonalizedVolumeDevice *)&v3 init];
  result->_sendManualVolumeUpdate = 1;
  result->_manualUpdateDispatchBlock = 0;
  return result;
}

- (BTAudioPersonalizedVolumeDevice)initWithBluetoothInfo:(unsigned int)a3 deviceAddr:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)BTAudioPersonalizedVolumeDevice;
  v6 = [(BTAudioPersonalizedVolumeDevice *)&v10 init];
  v6->_deviceID = a3;
  v6->_bdAddr = (NSString *)[objc_alloc((Class)NSString) initWithString:a4];
  v6->_sendManualVolumeUpdate = 1;
  v6->_manualUpdateDispatchBlock = 0;
  v7 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
  v6->_volumeAudioCategoryMap = v7;
  [(NSMutableDictionary *)v7 setObject:+[NSNumber numberWithInt:100] forKey:@"Audio/Video"];
  [(NSMutableDictionary *)v6->_volumeAudioCategoryMap setObject:+[NSNumber numberWithInt:100] forKey:@"PhoneCall"];
  [(NSMutableDictionary *)v6->_volumeAudioCategoryMap setObject:+[NSNumber numberWithInt:100] forKey:@"VoiceCommand"];
  v8 = qword_A19D8;
  if (os_log_type_enabled((os_log_t)qword_A19D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = a4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Initializing Personalized Volume Device %@ ", buf, 0xCu);
  }
  return v6;
}

- (void)dealloc
{
  [(BTAudioPersonalizedVolumeDevice *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BTAudioPersonalizedVolumeDevice;
  [(BTAudioPersonalizedVolumeDevice *)&v3 dealloc];
}

- (void)invalidate
{
  bdAddr = self->_bdAddr;
  if (bdAddr)
  {

    self->_bdAddr = 0;
  }
  id manualUpdateDispatchBlock = self->_manualUpdateDispatchBlock;
  if (manualUpdateDispatchBlock)
  {
    if (!dispatch_block_testcancel(self->_manualUpdateDispatchBlock))
    {
      dispatch_block_cancel(manualUpdateDispatchBlock);
      id manualUpdateDispatchBlock = self->_manualUpdateDispatchBlock;
    }
    _Block_release(manualUpdateDispatchBlock);
    self->_id manualUpdateDispatchBlock = 0;
  }
  volumeAudioCategoryMap = self->_volumeAudioCategoryMap;
  if (volumeAudioCategoryMap)
  {

    self->_volumeAudioCategoryMap = 0;
  }
}

- (void)updateVolumeActiveAudioCategoryMap:(unsigned __int8)a3 audioCategory:(id)a4
{
  if (!a4)
  {
    uint64_t v8 = qword_A19D8;
    if (!os_log_type_enabled((os_log_t)qword_A19D8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v14) = 0;
    v9 = "BTAudioAVNotificationMonitor: returning as audioCategory is nil";
    objc_super v10 = v8;
    uint32_t v11 = 2;
    goto LABEL_13;
  }
  uint64_t v5 = a3;
  if ([a4 isEqualToString:kMXSessionAudioCategory_PhoneCall])
  {
    CFStringRef v7 = @"PhoneCall";
LABEL_10:
    [(NSMutableDictionary *)self->_volumeAudioCategoryMap removeObjectForKey:v7];
    [(NSMutableDictionary *)self->_volumeAudioCategoryMap setObject:+[NSNumber numberWithUnsignedChar:v5] forKey:v7];
    goto LABEL_11;
  }
  if ([a4 isEqualToString:kMXSessionAudioCategory_AudioVideo])
  {
    CFStringRef v7 = @"Audio/Video";
    goto LABEL_10;
  }
  if ([a4 isEqualToString:kMXSessionAudioCategory_VoiceCommand])
  {
    CFStringRef v7 = @"VoiceCommand";
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v12 = qword_A19D8;
  if (!os_log_type_enabled((os_log_t)qword_A19D8, OS_LOG_TYPE_DEFAULT)) {
    return;
  }
  volumeAudioCategoryMap = self->_volumeAudioCategoryMap;
  int v14 = 138412290;
  v15 = volumeAudioCategoryMap;
  v9 = "BTAudioAVNotificationMonitor: _volumeAudioCategoryMap %@";
  objc_super v10 = v12;
  uint32_t v11 = 12;
LABEL_13:
  _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
}

- (id)getVolumeForCurrentAudioCategory:(id)a3
{
  uint64_t v5 = +[NSNumber numberWithInt:0];
  if (!a3)
  {
    uint64_t v8 = v5;
    v9 = qword_A19D8;
    if (os_log_type_enabled((os_log_t)qword_A19D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "BTAudioAVNotificationMonitor: returning as audioCategory is nil", v12, 2u);
    }
    return v8;
  }
  if ([a3 isEqualToString:kMXSessionAudioCategory_PhoneCall])
  {
    if ([(NSMutableDictionary *)self->_volumeAudioCategoryMap objectForKeyedSubscript:@"PhoneCall"])
    {
      volumeAudioCategoryMap = self->_volumeAudioCategoryMap;
      CFStringRef v7 = @"PhoneCall";
LABEL_13:
      return [(NSMutableDictionary *)volumeAudioCategoryMap objectForKeyedSubscript:v7];
    }
    goto LABEL_16;
  }
  if (![a3 isEqualToString:kMXSessionAudioCategory_AudioVideo])
  {
    if ([a3 isEqualToString:kMXSessionAudioCategory_VoiceCommand])
    {
      if ([(NSMutableDictionary *)self->_volumeAudioCategoryMap objectForKeyedSubscript:@"VoiceCommand"])
      {
        volumeAudioCategoryMap = self->_volumeAudioCategoryMap;
        CFStringRef v7 = @"VoiceCommand";
        goto LABEL_13;
      }
      goto LABEL_16;
    }
    uint32_t v11 = qword_A19D8;
    if (os_log_type_enabled((os_log_t)qword_A19D8, OS_LOG_TYPE_ERROR)) {
      sub_63248((uint64_t)a3, v11);
    }
    return +[NSNumber numberWithInt:0];
  }
  if ([(NSMutableDictionary *)self->_volumeAudioCategoryMap objectForKeyedSubscript:@"Audio/Video"])
  {
    volumeAudioCategoryMap = self->_volumeAudioCategoryMap;
    CFStringRef v7 = @"Audio/Video";
    goto LABEL_13;
  }
LABEL_16:

  return +[NSNumber numberWithInt:0];
}

- (unsigned)_getManualVolumeUpdateReasonFromString:(id)a3
{
  if ([a3 isEqualToString:@"Top-Down"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"Bottom-Up"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"PersonalizedVolume"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"PVRampEndInEarStatusChanged"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"PVRampEndRampAchieved"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"PVRampEndAudioCategoryConfigChanged"]) {
    return 5;
  }
  return 0;
}

- (unsigned)_getCurrentAudioCategoryFromString:(id)a3
{
  if ([a3 isEqualToString:kMXSessionAudioCategory_AudioVideo]) {
    return 0;
  }
  if ([a3 isEqualToString:kMXSessionAudioCategory_PhoneCall]) {
    return 1;
  }
  if ([a3 isEqualToString:kMXSessionAudioCategory_VoiceCommand]) {
    return 2;
  }
  return 0;
}

- (id)_getCurrentManualVolumeUpdatesDictionary:(id)a3 forCoreAnalyticSubmission:(BOOL)a4
{
  CFStringRef v7 = (NSNumber *)[a3 objectForKeyedSubscript:@"CurrentAudioCategory"];
  if (a4)
  {
    uint64_t v8 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[BTAudioPersonalizedVolumeDevice _getCurrentAudioCategoryFromString:](self, "_getCurrentAudioCategoryFromString:", [a3 objectForKeyedSubscript:@"CurrentAudioCategory"]));
    [a3 objectForKeyedSubscript:@"ReasonForManualUpdate"];
    v9 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[BTAudioPersonalizedVolumeDevice _getManualVolumeUpdateReasonFromString:](self, "_getManualVolumeUpdateReasonFromString:", [a3 objectForKeyedSubscript:@"ReasonForManualUpdate"]));
  }
  else
  {
    uint64_t v8 = v7;
    v9 = (NSNumber *)[a3 objectForKeyedSubscript:@"ReasonForManualUpdate"];
  }
  objc_super v10 = v9;
  v12[0] = @"CurrentAudioCategory";
  v12[1] = @"CurrentVolume";
  v13[0] = v8;
  v13[1] = -[BTAudioPersonalizedVolumeDevice getVolumeForCurrentAudioCategory:](self, "getVolumeForCurrentAudioCategory:", [a3 objectForKeyedSubscript:@"CurrentAudioCategory"]);
  v12[2] = @"IsPersonalizedVolumeUpdate";
  v13[2] = objc_msgSend(a3, "objectForKeyedSubscript:");
  v12[3] = @"ManualVolumeUpdate";
  v13[3] = objc_msgSend(a3, "objectForKeyedSubscript:");
  v12[4] = @"RampInProgress";
  v13[4] = objc_msgSend(a3, "objectForKeyedSubscript:");
  v12[5] = @"PersonalizedVolumeEnabled";
  v13[5] = objc_msgSend(a3, "objectForKeyedSubscript:");
  v12[6] = @"BundleID";
  v12[7] = @"ReasonForManualUpdate";
  v13[6] = objc_msgSend(a3, "objectForKeyedSubscript:");
  v13[7] = v10;
  return +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:8];
}

- (void)NotifyManualVolumeChanged:(id)a3 shouldUpdateBuds:(BOOL)a4
{
  BOOL v4 = a4;
  CFStringRef v7 = qword_A19D8;
  if (os_log_type_enabled((os_log_t)qword_A19D8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL sendManualVolumeUpdate = self->_sendManualVolumeUpdate;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v16 = sendManualVolumeUpdate;
    *(_WORD *)&v16[4] = 2112;
    *(void *)&v16[6] = a3;
    __int16 v17 = 1024;
    LODWORD(v18) = v4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "BTAudioPersonalizedVolumeDevice::NotifyManualVolumeChanged _sendManualVolumeUpdate %d manualVolumeUpdate %@ shouldUpdateBuds %d", buf, 0x18u);
  }
  if (self->_sendManualVolumeUpdate)
  {
    [(BTAudioPersonalizedVolumeDevice *)self startManualVolumeUpdateTimer];
    id v9 = [(BTAudioPersonalizedVolumeDevice *)self _getCurrentManualVolumeUpdatesDictionary:a3 forCoreAnalyticSubmission:1];
    id v10 = [(BTAudioPersonalizedVolumeDevice *)self _getCurrentManualVolumeUpdatesDictionary:a3 forCoreAnalyticSubmission:0];
    v14[6] = _NSConcreteStackBlock;
    v14[7] = 3221225472;
    v14[8] = sub_12984;
    v14[9] = &unk_8DBB0;
    v14[10] = v9;
    int v11 = AnalyticsSendEventLazy();
    uint64_t v12 = qword_A19D8;
    if (os_log_type_enabled((os_log_t)qword_A19D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v16 = @"com.apple.Bluetooth.PersonalizedVolumeManualUpdateV2";
      *(_WORD *)&v16[8] = 1024;
      *(_DWORD *)&v16[10] = v11;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "BT Stats for metric '%@' sent to CoreAnalytics with result %u manualVolumeUpdate: %@", buf, 0x1Cu);
    }
    if (v4)
    {
      unsigned int deviceID = self->_deviceID;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1298C;
      v14[3] = &unk_8DBD8;
      v14[4] = self;
      v14[5] = v10;
      sub_44BA4(qword_A2350, deviceID, v14);
    }
  }
  -[BTAudioPersonalizedVolumeDevice updateVolumeActiveAudioCategoryMap:audioCategory:](self, "updateVolumeActiveAudioCategoryMap:audioCategory:", objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"ManualVolumeUpdate"), "intValue"), objc_msgSend(a3, "objectForKeyedSubscript:", @"CurrentAudioCategory"));
}

- (void)startManualVolumeUpdateTimer
{
  id manualUpdateDispatchBlock = self->_manualUpdateDispatchBlock;
  if (manualUpdateDispatchBlock)
  {
    if (!dispatch_block_testcancel(self->_manualUpdateDispatchBlock))
    {
      dispatch_block_cancel(manualUpdateDispatchBlock);
      id manualUpdateDispatchBlock = self->_manualUpdateDispatchBlock;
    }
    _Block_release(manualUpdateDispatchBlock);
    self->_id manualUpdateDispatchBlock = 0;
  }
  self->_BOOL sendManualVolumeUpdate = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12B04;
  block[3] = &unk_8DC00;
  block[4] = self;
  self->_id manualUpdateDispatchBlock = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
  avNotificationMonitorQueue = self->_avNotificationMonitorQueue;
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  dispatch_after(v5, (dispatch_queue_t)avNotificationMonitorQueue, self->_manualUpdateDispatchBlock);
}

- (OS_dispatch_queue)avNotificationMonitorQueue
{
  return self->_avNotificationMonitorQueue;
}

- (void)setAvNotificationMonitorQueue:(id)a3
{
  self->_avNotificationMonitorQueue = (OS_dispatch_queue *)a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end