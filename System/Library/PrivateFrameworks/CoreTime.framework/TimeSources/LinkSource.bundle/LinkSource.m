void sub_2EEC(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  void v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void v23[7];
  void v24[7];

  v2 = [*(id *)(a1 + 32) destinationsIncludingTinker:*(unsigned __int8 *)(a1 + 64)];
  v3 = [*(id *)(a1 + 32) idsService];
  v4 = *(void *)(a1 + 40);
  v24[0] = &__kCFBooleanTrue;
  v23[0] = IDSSendMessageOptionDirectMessaging;
  v23[1] = IDSSendMessageOptionLocalDeliveryKey;
  v5 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 65)];
  v24[1] = v5;
  v23[2] = IDSSendMessageOptionNonWakingKey;
  v6 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 66)];
  v7 = *(void *)(a1 + 48);
  v24[2] = v6;
  v24[3] = v7;
  v23[3] = IDSSendMessageOptionQueueOneIdentifierKey;
  v23[4] = IDSSendMessageOptionRequireBluetoothKey;
  v24[4] = &__kCFBooleanTrue;
  v24[5] = &__kCFBooleanFalse;
  v23[5] = IDSSendMessageOptionEnforceRemoteTimeoutsKey;
  v23[6] = IDSSendMessageOptionFireAndForgetKey;
  v24[6] = &__kCFBooleanTrue;
  v8 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:7];
  v21 = 0;
  v22 = 0;
  v9 = [v3 sendData:v4 toDestinations:v2 priority:300 options:v8 identifier:&v22 error:&v21];
  v10 = v22;
  v11 = v21;

  v12 = TIMELINK_FACILITY;
  if (!v9 || v11)
  {
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_ERROR)) {
      sub_96C8((uint64_t)v11, v12);
    }

    v10 = 0;
  }
  else if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG))
  {
    sub_9650((uint64_t)v10, v12);
  }
  v13 = [*(id *)(a1 + 32) workloop];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_31B4;
  v17[3] = &unk_103B8;
  v14 = *(id *)(a1 + 56);
  v19 = v11;
  v20 = v14;
  v18 = v10;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, v17);
}

uint64_t sub_31B4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_32AC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dataReceived:*(void *)(a1 + 40)];
}

void sub_3534(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *(void *)(a1 + 48);
  }
  id v4 = v2;
  [v2 didSendDataIdentifier:*(void *)(a1 + 40) withError:v3];
}

void sub_37B4(uint64_t a1)
{
  id v2 = +[NRPairedDeviceRegistry sharedInstance];
  if ([v2 isPaired]) {
    id v3 = &dword_0 + 1;
  }
  else {
    id v3 = [*(id *)(a1 + 32) isGizmo];
  }

  id v4 = [*(id *)(a1 + 32) daemonCore];
  [v4 setAccurateThresholds:v3];
}

void sub_3BE0(uint64_t a1, void *a2)
{
  id v3 = [a2 workloop];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5A90;
  block[3] = &unk_10540;
  block[4] = a2;
  dispatch_async(v3, block);
}

id *sub_3E40(id *result)
{
  if (result[7] == &off_10478)
  {
    v1 = result;
    if (([result[4] isEqualToString:@"automaticTimeEnabled"] & 1) == 0) {
      sub_9848();
    }
    id v2 = v1[5];
    if (v2 != objc_loadWeakRetained((id *)v1[6] + 6)) {
      sub_981C();
    }

    id v3 = v1[6];
    return (id *)[v3 syncAutomaticTimeEnabled];
  }
  return result;
}

void sub_4494(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) daemonCore];
  unsigned int v3 = [v2 isAutomaticTimeEnabled];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v4 + 16))
    {
      *(unsigned char *)(v4 + 16) = 1;
      dispatch_time_t v5 = dispatch_time(0, 8000000000);
      v6 = [*(id *)(a1 + 32) workloop];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_4590;
      v8[3] = &unk_10408;
      v7 = *(void **)(a1 + 40);
      v8[4] = *(void *)(a1 + 32);
      id v9 = v7;
      dispatch_after(v5, v6, v8);
    }
  }
}

id sub_4590(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _systemTimeChanged:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  return result;
}

id sub_4978(double *a1)
{
  v7[0] = @"local_rtc_s";
  id v2 = +[NSNumber numberWithDouble:a1[4]];
  v8[0] = v2;
  v7[1] = @"remote_rtc_s";
  unsigned int v3 = +[NSNumber numberWithDouble:a1[5]];
  v8[1] = v3;
  v7[2] = @"unc_s";
  uint64_t v4 = +[NSNumber numberWithDouble:a1[6]];
  v8[2] = v4;
  dispatch_time_t v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

void sub_4A84(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:@"TMSource"];
    if (v4)
    {
      dispatch_time_t v5 = (void *)v4;
      uint64_t v6 = [v3 objectForKeyedSubscript:@"TMCurrentTime"];
      if (v6)
      {
        v7 = (void *)v6;
        uint64_t v8 = [v3 objectForKeyedSubscript:@"TMRtcTime"];
        if (v8)
        {
          id v9 = (void *)v8;
          v10 = [v3 objectForKeyedSubscript:@"TMTimeError"];

          if (v10)
          {
            v11 = [*(id *)(a1 + 32) link];
            v12 = [v3 objectForKeyedSubscript:@"TMCurrentTime"];
            [v12 doubleValue];
            double v14 = v13;
            v15 = [v3 objectForKeyedSubscript:@"TMRtcTime"];
            [v15 doubleValue];
            double v17 = v16;
            v18 = [v3 objectForKeyedSubscript:@"TMTimeError"];
            [v18 doubleValue];
            double v20 = v19;
            v21 = [v3 objectForKeyedSubscript:@"TMSource"];
            v22 = [v3 objectForKeyedSubscript:@"TMTimeReliable"];
            objc_msgSend(v11, "sendTime:localRTC:uncertainty:source:reliable:", v21, objc_msgSend(v22, "BOOLValue"), v14, v17, v20);

            goto LABEL_13;
          }
          goto LABEL_11;
        }
      }
    }
LABEL_11:
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_ERROR)) {
      sub_9BEC();
    }
    goto LABEL_13;
  }
  v23 = (void *)TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_ERROR)) {
    sub_9C60(v23);
  }
LABEL_13:
}

void sub_4CB0(uint64_t a1, double a2, double a3)
{
  if (a2 <= 0.0)
  {
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_ERROR)) {
      sub_9D04();
    }
    [*(id *)(a1 + 32) significantTimeChange];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    v12[0] = @"TMLSSourceDevice";
    v11[0] = @"TMSource";
    v11[1] = @"TMCurrentTime";
    v7 = +[NSNumber numberWithDouble:*(double *)(a1 + 48)];
    v12[1] = v7;
    v11[2] = @"TMTimeError";
    uint64_t v8 = +[NSNumber numberWithDouble:a3];
    v12[2] = v8;
    v11[3] = @"TMRtcTime";
    id v9 = +[NSNumber numberWithDouble:a2];
    v12[3] = v9;
    v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v10);
  }
}

void sub_54E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained testAndApplySystemTime];
}

id sub_5A90(uint64_t a1)
{
  [*(id *)(a1 + 32) significantTimeChange];
  id v2 = *(void **)(a1 + 32);

  return [v2 systemTimeZoneChanged];
}

const __CFString *lazy cache variable for type metadata for String(int a1)
{
  int v1 = a1 - 999;
  CFStringRef result = @"TMLSSourceUser";
  switch(v1)
  {
    case 0:
      sub_9EBC();
    case 1:
      return result;
    case 2:
      CFStringRef result = @"TMLSSourceComputed";
      break;
    case 3:
      CFStringRef result = @"TMLSSourceComputedReliable";
      break;
    case 4:
      CFStringRef result = @"TMLSSourceDevice";
      break;
    default:
      CFStringRef result = @"TMLSSourceUnknown";
      break;
  }
  return result;
}

id lazy cache variable for type metadata for String(void *a1)
{
  id v1 = a1;
  if (qword_15ED8 != -1) {
    dispatch_once(&qword_15ED8, &stru_105A8);
  }
  id v2 = [(id)qword_15ED0 objectForKeyedSubscript:v1];
  id v3 = v2;
  if (v2) {
    id v4 = [v2 unsignedIntegerValue];
  }
  else {
    id v4 = &stru_3D8 + 20;
  }

  return v4;
}

void sub_5C00(id a1)
{
  v3[0] = @"TMLSSourceUser";
  v3[1] = @"TMLSSourceComputed";
  v4[0] = &off_11228;
  v4[1] = &off_11240;
  v3[2] = @"TMLSSourceComputedReliable";
  v3[3] = @"TMLSSourceDevice";
  v4[2] = &off_11258;
  v4[3] = &off_11270;
  v3[4] = @"TMLSSourceUnknown";
  v4[4] = &off_11288;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:5];
  id v2 = (void *)qword_15ED0;
  qword_15ED0 = v1;
}

double TMLSHackedRTC()
{
  size_t v4 = 8;
  unint64_t v5 = 0;
  if ((byte_15EE0 & 1) == 0)
  {
    if (sysctlnametomib("kern.monotonicclock_usecs", dword_15EE4, (size_t *)&dword_15E58))
    {
      v0 = TIMELINK_FACILITY;
      double v1 = -1.0;
      if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_ERROR)) {
        sub_9F98(v0);
      }
      return v1;
    }
    if (qword_15F18 != -1) {
      dispatch_once(&qword_15F18, &stru_105C8);
    }
    *(double *)&qword_15F08 = *(double *)&qword_15F10 * 0.5;
    byte_15EE0 = 1;
  }
  if (!sysctl(dword_15EE4, dword_15E58, &v5, &v4, 0, 0)) {
    return *(double *)&qword_15F08 + (double)v5 / 1000000.0;
  }
  id v2 = (void *)TIMELINK_FACILITY;
  double v1 = -1.0;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_ERROR)) {
    sub_9EE8(v2);
  }
  return v1;
}

void sub_5E28(id a1)
{
  qword_15F10 = 0x3FF0000000000000;
  size_t v1 = 8;
  unint64_t v2 = 0;
  if (sysctlbyname("kern.monotonicclock_rate_usecs", &v2, &v1, 0, 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_9FDC();
    }
  }
  else
  {
    *(double *)&qword_15F10 = (double)v2 / 1000000.0;
  }
}

id sub_6E90(uint64_t a1)
{
  v9[0] = @"error";
  unint64_t v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) code]);
  v10[0] = v2;
  v9[1] = @"msg";
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"kTMLSLinkMsgKey"];
  size_t v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 intValue]);
  v10[1] = v4;
  v9[2] = @"src";
  unint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"kTMLSLinkSourceKey"];
  uint64_t v6 = +[NSNumber numberWithUnsignedInt:lazy cache variable for type metadata for String(v5)];
  v10[2] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

id sub_6FF8(uint64_t a1)
{
  CFStringRef v4 = @"error";
  size_t v1 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) code]);
  unint64_t v5 = v1;
  unint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_70B4(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 objectForKeyedSubscript:@"kTMLSLinkMsgKey"];
  id v3 = [v2 intValue];
  CFStringRef v4 = v3;
  if v3 < 0xD && ((0x1BF3u >> (char)v3))
  {
    CFStringRef v4 = *(&off_107A0 + (int)v3);
  }
  else
  {
    unint64_t v5 = +[NSAssertionHandler currentHandler];
    uint64_t v6 = +[NSString stringWithUTF8String:"NSString *msgTypeString(TMLS_MSG_TYPE)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"TMLSLink.m", 83, @"Unknown TMLS_MSG_TYPE: %lld", v4);
  }
  v7 = [v1 objectForKeyedSubscript:@"kTMLSLinkSourceKey"];

  if (v7)
  {
    CFStringRef v4 = +[NSString stringWithFormat:@"%@-%@", v4, v7];
  }

  return v4;
}

id sub_71E8(uint64_t a1)
{
  CFStringRef v4 = @"error";
  id v1 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) code]);
  unint64_t v5 = v1;
  unint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_7934(uint64_t a1)
{
  v9[0] = @"error";
  unint64_t v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) code]);
  v10[0] = v2;
  v9[1] = @"msg";
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"kTMLSLinkMsgKey"];
  CFStringRef v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 intValue]);
  v10[1] = v4;
  v9[2] = @"src";
  unint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"kTMLSLinkSourceKey"];
  uint64_t v6 = +[NSNumber numberWithUnsignedInt:lazy cache variable for type metadata for String(v5)];
  v10[2] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

void sub_7A9C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
  unint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 48)];
  unsigned int v3 = [v2 isEqualToString:*(void *)(a1 + 40)];
  CFStringRef v4 = TIMELINK_FACILITY;
  BOOL v5 = os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      int v10 = 138412546;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "retrying %@ (%@) after send failure", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 32) sendData:*(void *)(a1 + 56) localOnly:1 nonWaking:0];
  }
  else if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = 138412802;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    v15 = v2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%@ (%@) superseded by %@, not retrying", (uint8_t *)&v10, 0x20u);
  }
}

void sub_8124(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "sendData: %@ withIdentifier: %@", buf, 0x16u);
  }
  if (v5)
  {
    [*(id *)(*(void *)(a1 + 40) + 16) setObject:*(void *)(a1 + 32) forKeyedSubscript:v5];
    [*(id *)(*(void *)(a1 + 40) + 32) setObject:v5 forKeyedSubscript:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v9 = TIMELINK_FACILITY;
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_ERROR)) {
      sub_A498(a1, (uint64_t)v6, v9);
    }
    id v12 = v6;
    id v13 = *(id *)(a1 + 32);
    AnalyticsSendEventLazy();
    int v10 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"kTMLSLinkMsgKey", _NSConcreteStackBlock, 3221225472, sub_8304, &unk_10670);
    unsigned int v11 = [v10 intValue];

    if (v11 == 7) {
      [*(id *)(a1 + 40) setSyncState:0];
    }
  }
}

id sub_8304(uint64_t a1)
{
  v10[0] = &off_11348;
  v9[0] = @"assertion";
  v9[1] = @"error";
  unint64_t v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) code]);
  v10[1] = v2;
  v9[2] = @"msg";
  unsigned int v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"kTMLSLinkMsgKey"];
  CFStringRef v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 intValue]);
  v10[2] = v4;
  void v9[3] = @"src";
  id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"kTMLSLinkSourceKey"];
  id v6 = +[NSNumber numberWithUnsignedInt:lazy cache variable for type metadata for String(v5)];
  void v10[3] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

id sub_8580(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCompatibilityState];
}

id sub_87B8(uint64_t a1)
{
  v7[0] = @"raw";
  unint64_t v2 = +[NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 32)];
  v8[0] = v2;
  v7[1] = @"old";
  unsigned int v3 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 34)];
  v8[1] = v3;
  v7[2] = @"new";
  CFStringRef v4 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 35)];
  v8[2] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

void sub_8A7C(uint64_t a1, double a2, double a3)
{
  CFStringRef v4 = TIMELINK_FACILITY;
  if (a2 <= 0.0)
  {
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = *(void **)(a1 + 32);
      id v12 = v4;
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = [v11 syncState];
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "convertBTTime, machTime is not valid, sync state %d", buf, 8u);
    }
    [*(id *)(a1 + 32) sendBTConversionFailure];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218496;
      double v17 = a2;
      __int16 v18 = 2048;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      double v21 = a3;
      _os_log_debug_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "convertBTTime, montonicTimeForMachTime, calling didSyncLocalRTC with localRTC: %f, remoteRTC: %f, uncertainty: %f", buf, 0x20u);
    }
    v15[0] = &off_11360;
    uint64_t v7 = +[NSNumber numberWithDouble:a2, @"kTMLSLinkMsgKey", @"kTMLSLinkRTCKey"];
    v15[1] = v7;
    v14[2] = @"kTMLSLinkRemoteRTCKey";
    uint64_t v8 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
    v15[2] = v8;
    v14[3] = @"kTMLSLinkUncertaintyKey";
    uint64_t v9 = +[NSNumber numberWithDouble:*(double *)(a1 + 48) + a3];
    v15[3] = v9;
    int v10 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];

    [*(id *)(a1 + 32) sendData:v10 localOnly:0 nonWaking:0 includeTinker:1];
    [*(id *)(a1 + 32) setSyncState:4];
  }
}

id sub_9128(uint64_t a1)
{
  v6[0] = @"old";
  unint64_t v2 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(a1 + 32) + 44)];
  v6[1] = @"new";
  v7[0] = v2;
  unsigned int v3 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  v7[1] = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

void sub_9310(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleSyncTimer];
}

void sub_9560(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_957C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id sub_959C()
{
  return [v0 syncState];
}

void sub_95C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 8u);
}

void sub_95D8(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "TMLSTransport, sendData, message: %d", (uint8_t *)v2, 8u);
}

void sub_9650(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "TMLSTransport, sent message: %@", (uint8_t *)&v2, 0xCu);
}

void sub_96C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "TMLSTransport failed to send (%@)", (uint8_t *)&v2, 0xCu);
}

void sub_9740(void *a1, void *a2)
{
  uint64_t v3 = a1;
  int v4 = 134217984;
  id v5 = [a2 length];
  _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "TMLSTransport, incomingData, size: %ld", (uint8_t *)&v4, 0xCu);
}

void sub_97DC()
{
  sub_5AD8();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "Link initialized via @selector(-initWithClock:), time will not be transferred", v1, 2u);
}

void sub_981C()
{
  __assert_rtn("-[TMLSLinkSource observeValueForKeyPath:ofObject:change:context:]_block_invoke", "TMLSLinkSource.m", 181, "object == _daemonCore");
}

void sub_9848()
{
}

void sub_9874()
{
}

void sub_98A0()
{
  sub_5ACC();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_0, v1, OS_LOG_TYPE_DEBUG, "setCompanionTimeZone:%@ (was %@)", v2, 0x16u);
}

void sub_9928()
{
}

void sub_9954(void *a1, void *a2)
{
  __int16 v3 = a1;
  uint64_t v4 = [a2 companionTimeZone];
  sub_5ACC();
  _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "syncTimeZone: %@", v5, 0xCu);
}

void sub_99F8()
{
}

void sub_9A24()
{
}

void sub_9A50()
{
  sub_5AD8();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "significantTimeChange", v1, 2u);
}

void sub_9A90()
{
}

void sub_9ABC()
{
  sub_5AD8();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "systemTimeZoneChanged", v1, 2u);
}

void sub_9AFC(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "_systemTimeChanged: shouldSendTime(%d)", (uint8_t *)v2, 8u);
}

void sub_9B78()
{
  sub_5ACC();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "systemTimeChanged:%@", v1, 0xCu);
}

void sub_9BEC()
{
  sub_5ACC();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Pending data unexpected data: %@", v1, 0xCu);
}

void sub_9C60(void *a1)
{
  os_log_t v1 = a1;
  objc_opt_class();
  sub_5ACC();
  id v3 = v2;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "Pending data unexpected type: %@", v4, 0xCu);
}

void sub_9D04()
{
  sub_5AD8();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Failed to convert mach to RTC on significant time change", v1, 2u);
}

void sub_9D44()
{
  sub_5AD8();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Received time over TMLSLink on a companion device", v1, 2u);
}

void sub_9D84()
{
  sub_5ACC();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "didReceiveAutomaticTimeEnabled, %@, %d", v2, 0x12u);
}

void sub_9E0C()
{
}

void sub_9E38()
{
}

void sub_9E64()
{
}

void sub_9E90()
{
}

void sub_9EBC()
{
}

void sub_9EE8(void *a1)
{
  os_log_t v1 = a1;
  int v2 = *__error();
  __int16 v3 = __error();
  int v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  __int16 v6 = 2080;
  uint64_t v7 = v4;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "Error occurred %d %s\n", (uint8_t *)v5, 0x12u);
}

void sub_9F98(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Error occurred, no mib to monotonicclock_usecs conversion\n", v1, 2u);
}

void sub_9FDC()
{
  int v0 = *__error();
  os_log_t v1 = __error();
  int v2 = strerror(*v1);
  v3[0] = 67109378;
  v3[1] = v0;
  __int16 v4 = 2080;
  id v5 = v2;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "CoreTime: Error reading kern.monotonicclock_rate_usecs: %d %s\n", (uint8_t *)v3, 0x12u);
}

void sub_A084()
{
  sub_5AD8();
  sub_9560(&dword_0, v0, v1, "TMLSLink, initWithDelegate", v2, v3, v4, v5, v6);
}

void sub_A0B8()
{
}

void sub_A0E4()
{
}

void sub_A110()
{
  sub_5AD8();
  sub_9560(&dword_0, v0, v1, "TMLS_MSG_SEND_TIME", v2, v3, v4, v5, v6);
}

void sub_A144()
{
}

void sub_A170()
{
  sub_5AD8();
  sub_9560(&dword_0, v0, v1, "TMLS_MSG_SYNC_RTC_INIT", v2, v3, v4, v5, v6);
}

void sub_A1A4()
{
  sub_5AD8();
  sub_9560(&dword_0, v0, v1, "TMLS_MSG_SEND_TIMEZONE", v2, v3, v4, v5, v6);
}

void sub_A1D8()
{
  sub_5AD8();
  sub_9560(&dword_0, v0, v1, "TMLS_MSG_SEND_DRIFT", v2, v3, v4, v5, v6);
}

void sub_A20C()
{
  sub_5AD8();
  sub_9560(&dword_0, v0, v1, "TMLS_MSG_SEND_RESET", v2, v3, v4, v5, v6);
}

void sub_A240()
{
  sub_5AD8();
  sub_9560(&dword_0, v0, v1, "TMLS_MSG_CONVERT_BT_TIME", v2, v3, v4, v5, v6);
}

void sub_A274()
{
  sub_5AD8();
  sub_9560(&dword_0, v0, v1, "TMLS_MSG_CONVERT_BT_TIME_FINAL", v2, v3, v4, v5, v6);
}

void sub_A2A8()
{
  sub_5AD8();
  sub_9560(&dword_0, v0, v1, "TMLS_MSG_CONVERT_BT_TIME_FAILURE", v2, v3, v4, v5, v6);
}

void sub_A2DC()
{
  sub_5AD8();
  sub_9560(&dword_0, v0, v1, "TMLS_MSG_SEND_AUTOMATIC_TIME_ENABLED", v2, v3, v4, v5, v6);
}

void sub_A310(void *a1)
{
  id v2 = a1;
  sub_959C();
  sub_95B4();
  sub_95C0(&dword_0, v1, v3, "TMLS_MSG_CONVERT_BT_TIME_FINAL sent successfully, syncState %d", v4);
}

void sub_A398(void *a1)
{
  id v2 = a1;
  sub_959C();
  sub_95B4();
  sub_957C(&dword_0, v3, v4, "sendSyncRTCRequest called in sync-state %d, ignoring", v5, v6, v7, v8, v9);
}

void sub_A418(void *a1)
{
  id v2 = a1;
  sub_959C();
  sub_95B4();
  sub_957C(&dword_0, v3, v4, "attempted to handle conversion failure on companion, sync state %d, ignoring", v5, v6, v7, v8, v9);
}

void sub_A498(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to send data: %@ reason:%@", (uint8_t *)&v4, 0x16u);
}

void sub_A524()
{
  sub_5AD8();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "doSyncRTC called on companion", v1, 2u);
}

void sub_A564(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "didUpdateDeviceRegistryCompatibilityState: %@", (uint8_t *)&v2, 0xCu);
}

void sub_A5DC(void *a1)
{
  id v2 = a1;
  sub_959C();
  sub_95B4();
  sub_957C(&dword_0, v3, v4, "convertBTTime, machTime in future, sync state %d, dropping message", v5, v6, v7, v8, v9);
}

void sub_A65C(uint64_t a1, NSObject *a2, double a3)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "convertBTTime, montonicTimeForMachTime, calling didSyncLocalRTC with localMacTime: %lld, remoteRTC: %f", (uint8_t *)&v3, 0x16u);
}

void sub_A6E0()
{
  sub_5AD8();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "restartSync called when idle, not restarting", v1, 2u);
}

void sub_A720(void *a1)
{
  id v2 = a1;
  sub_959C();
  sub_95B4();
  sub_957C(&dword_0, v3, v4, "restartSync called on companion, state %d, ignoring", v5, v6, v7, v8, v9);
}

void sub_A7A0(void *a1)
{
  id v2 = a1;
  sub_959C();
  sub_95B4();
  sub_95C0(&dword_0, v1, v3, "restartSync from state %d", v4);
}

void sub_A828(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a1 + 44);
  v4[0] = 67109120;
  v4[1] = v3;
  sub_95C0(&dword_0, a2, a3, "removing syncTimer, sync state %d", (uint8_t *)v4);
}

void sub_A89C(int *a1, NSObject *a2, uint64_t a3)
{
  int v3 = *a1;
  v4[0] = 67109120;
  v4[1] = v3;
  sub_95C0(&dword_0, a2, a3, "scheduling syncTimer, sync state %d", (uint8_t *)v4);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return _sysctlnametomib(a1, a2, a3);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

uint64_t xpc_set_event()
{
  return _xpc_set_event();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_clock(void *a1, const char *a2, ...)
{
  return [a1 clock];
}

id objc_msgSend_coarseMonotonicTime(void *a1, const char *a2, ...)
{
  return [a1 coarseMonotonicTime];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_companionTimeZone(void *a1, const char *a2, ...)
{
  return [a1 companionTimeZone];
}

id objc_msgSend_compatibilityState(void *a1, const char *a2, ...)
{
  return [a1 compatibilityState];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createSyncTimer(void *a1, const char *a2, ...)
{
  return [a1 createSyncTimer];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentQueue(void *a1, const char *a2, ...)
{
  return [a1 currentQueue];
}

id objc_msgSend_daemonCore(void *a1, const char *a2, ...)
{
  return [a1 daemonCore];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doBTConversionFailure(void *a1, const char *a2, ...)
{
  return [a1 doBTConversionFailure];
}

id objc_msgSend_doSyncRTC(void *a1, const char *a2, ...)
{
  return [a1 doSyncRTC];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_handleSyncTimer(void *a1, const char *a2, ...)
{
  return [a1 handleSyncTimer];
}

id objc_msgSend_idsService(void *a1, const char *a2, ...)
{
  return [a1 idsService];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isAutomaticTimeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAutomaticTimeEnabled];
}

id objc_msgSend_isCompatible(void *a1, const char *a2, ...)
{
  return [a1 isCompatible];
}

id objc_msgSend_isGizmo(void *a1, const char *a2, ...)
{
  return [a1 isGizmo];
}

id objc_msgSend_isLastRTCSampleValid(void *a1, const char *a2, ...)
{
  return [a1 isLastRTCSampleValid];
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return [a1 isPaired];
}

id objc_msgSend_lastRTCSample(void *a1, const char *a2, ...)
{
  return [a1 lastRTCSample];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_link(void *a1, const char *a2, ...)
{
  return [a1 link];
}

id objc_msgSend_machTime(void *a1, const char *a2, ...)
{
  return [a1 machTime];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_reliability(void *a1, const char *a2, ...)
{
  return [a1 reliability];
}

id objc_msgSend_resetSystemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 resetSystemTimeZone];
}

id objc_msgSend_restartSync(void *a1, const char *a2, ...)
{
  return [a1 restartSync];
}

id objc_msgSend_sendBTConversionFailure(void *a1, const char *a2, ...)
{
  return [a1 sendBTConversionFailure];
}

id objc_msgSend_sendReset(void *a1, const char *a2, ...)
{
  return [a1 sendReset];
}

id objc_msgSend_sendSyncRequest(void *a1, const char *a2, ...)
{
  return [a1 sendSyncRequest];
}

id objc_msgSend_setupThresholds(void *a1, const char *a2, ...)
{
  return [a1 setupThresholds];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_significantTimeChange(void *a1, const char *a2, ...)
{
  return [a1 significantTimeChange];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_syncAutomaticTimeEnabled(void *a1, const char *a2, ...)
{
  return [a1 syncAutomaticTimeEnabled];
}

id objc_msgSend_syncRTC(void *a1, const char *a2, ...)
{
  return [a1 syncRTC];
}

id objc_msgSend_syncState(void *a1, const char *a2, ...)
{
  return [a1 syncState];
}

id objc_msgSend_syncTimeZone(void *a1, const char *a2, ...)
{
  return [a1 syncTimeZone];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_systemTimeZoneChanged(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZoneChanged];
}

id objc_msgSend_testAndApplySystemTime(void *a1, const char *a2, ...)
{
  return [a1 testAndApplySystemTime];
}

id objc_msgSend_timeProvider(void *a1, const char *a2, ...)
{
  return [a1 timeProvider];
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return [a1 transport];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateCompatibilityState(void *a1, const char *a2, ...)
{
  return [a1 updateCompatibilityState];
}

id objc_msgSend_workloop(void *a1, const char *a2, ...)
{
  return [a1 workloop];
}