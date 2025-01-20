@interface VCPSystemMonitor
- (VCPSystemMonitor)init;
- (id)checkFullyCharged;
- (int)disable;
- (int)enable;
- (int64_t)checkPluggedIn;
- (int64_t)checkScreenLocked;
- (int64_t)recommendedState;
- (unint64_t)checkThermalPressure;
- (void)checkFreeSpace;
- (void)dealloc;
- (void)reset;
@end

@implementation VCPSystemMonitor

- (VCPSystemMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)VCPSystemMonitor;
  v2 = [(VCPSystemMonitor *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_powerToken = -1;
    *(void *)&v2->_chargedToken = -1;
    freeSpaceTimer = v2->_freeSpaceTimer;
    v2->_freeSpaceTimer = 0;
    v2->_recommendedState = 2;
  }
  return v3;
}

- (void)reset
{
  p_int powerToken = &self->_powerToken;
  int powerToken = self->_powerToken;
  if (powerToken != -1) {
    notify_cancel(powerToken);
  }
  int screenToken = self->_screenToken;
  if (screenToken != -1) {
    notify_cancel(screenToken);
  }
  int chargedToken = self->_chargedToken;
  if (chargedToken != -1) {
    notify_cancel(chargedToken);
  }
  int thermalToken = self->_thermalToken;
  if (thermalToken != -1) {
    notify_cancel(thermalToken);
  }
  freeSpaceTimer = self->_freeSpaceTimer;
  if (freeSpaceTimer)
  {
    dispatch_source_cancel(freeSpaceTimer);
    freeSpaceTimer = self->_freeSpaceTimer;
  }
  *(void *)p_int powerToken = -1;
  *((void *)p_powerToken + 1) = -1;
  self->_freeSpaceTimer = 0;
}

- (void)dealloc
{
  [(VCPSystemMonitor *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)VCPSystemMonitor;
  [(VCPSystemMonitor *)&v3 dealloc];
}

- (int64_t)checkPluggedIn
{
  double v3 = IOPSGetTimeRemainingEstimate();
  if (self->_powerToken == -1 || v3 == -1.0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v5 = VCPLogInstance();
      os_log_type_t v6 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v5, v6))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to query whether device is plugged-in", (uint8_t *)&v14, 2u);
      }
    }
    self->_recommendedState = 5;
    return -1;
  }
  else
  {
    int v8 = MediaAnalysisLogLevel();
    if (v8 >= 7)
    {
      v9 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v9, v10))
      {
        v11 = "unplugged";
        if (v3 == -2.0) {
          v11 = "plugged-in";
        }
        int v14 = 136315138;
        v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Device is %s", (uint8_t *)&v14, 0xCu);
      }
    }
    if (v3 != -2.0 && self->_recommendedState == 2)
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v12 = VCPLogInstance();
        os_log_type_t v13 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v12, v13))
        {
          LOWORD(v14) = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "Device is unplugged", (uint8_t *)&v14, 2u);
        }
      }
      self->_recommendedState = 3;
    }
    return v3 == -2.0;
  }
}

- (int64_t)checkScreenLocked
{
  uint64_t state64 = 0;
  int screenToken = self->_screenToken;
  if (screenToken == -1 || notify_get_state(screenToken, &state64))
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v4 = VCPLogInstance();
      os_log_type_t v5 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v4, v5))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, v5, "Failed to query whether screen is locked", buf, 2u);
      }
    }
    self->_recommendedState = 5;
    return -1;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v7, v8))
      {
        if (state64) {
          v9 = "locked";
        }
        else {
          v9 = "unlocked";
        }
        *(_DWORD *)buf = 136315138;
        v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Screen is %s", buf, 0xCu);
      }
    }
    uint64_t v10 = state64;
    if (!state64)
    {
      if (self->_recommendedState == 2)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v11 = VCPLogInstance();
          os_log_type_t v12 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v11, v12))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, v12, "Screen is unlocked", buf, 2u);
          }
        }
        self->_recommendedState = 3;
        uint64_t v10 = state64;
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    return v10 != 0;
  }
}

- (id)checkFullyCharged
{
  if (qword_100252908 != -1) {
    dispatch_once(&qword_100252908, &stru_10021F100);
  }
  if (!byte_100252900) {
    goto LABEL_10;
  }
  if (self->_chargedToken == -1) {
    goto LABEL_7;
  }
  if (IOPSGetPercentRemaining())
  {
    if (byte_100252900)
    {
LABEL_7:
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        double v3 = VCPLogInstance();
        os_log_type_t v4 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v3, v4))
        {
          *(_WORD *)buf = 0;
          os_log_type_t v5 = "Failed to query whether device is fully charged";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v3, v4, v5, buf, 2u);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      goto LABEL_15;
    }
LABEL_10:
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      double v3 = VCPLogInstance();
      os_log_type_t v4 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v3, v4))
      {
        *(_WORD *)buf = 0;
        os_log_type_t v5 = "Device does not have active battery";
        goto LABEL_13;
      }
LABEL_14:
    }
LABEL_15:
    self->_recommendedState = 5;
    v16[0] = @"FullyCharged";
    v16[1] = @"IsCharging";
    v17[0] = &off_10022F9D0;
    v17[1] = &off_10022F9D0;
    os_log_type_t v6 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    goto LABEL_16;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    os_log_type_t v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 67109120;
      int v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Device is not fully charged (Battery %d%%)", buf, 8u);
    }
  }
  self->_recommendedState = 5;
  v12[0] = @"FullyCharged";
  uint64_t v10 = +[NSNumber numberWithInteger:0];
  v12[1] = @"IsCharging";
  v13[0] = v10;
  v11 = +[NSNumber numberWithInteger:0];
  v13[1] = v11;
  os_log_type_t v6 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

LABEL_16:
  return v6;
}

- (unint64_t)checkThermalPressure
{
  uint64_t state64 = 0;
  int thermalToken = self->_thermalToken;
  if (thermalToken == -1 || notify_get_state(thermalToken, &state64))
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      os_log_type_t v4 = VCPLogInstance();
      os_log_type_t v5 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v4, v5))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, v5, "Failed to query thermal pressure level", buf, 2u);
      }
    }
    self->_recommendedState = 5;
    return -1;
  }
  else if (state64)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v7, v8))
      {
        *(_WORD *)os_log_type_t v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Device is under thermal pressure", v9, 2u);
      }
    }
    self->_recommendedState = 5;
    return state64;
  }
  else
  {
    return 0;
  }
}

- (void)checkFreeSpace
{
  double v3 = +[NSFileManager defaultManager];
  os_log_type_t v4 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
  os_log_type_t v5 = objc_msgSend(v4, "vcp_mediaAnalysisDirectory");
  os_log_type_t v6 = [v5 stringByDeletingLastPathComponent];

  v7 = [v3 attributesOfFileSystemForPath:v6 error:0];
  os_log_type_t v8 = v7;
  if (!v7 || ([v7 objectForKey:NSFileSystemFreeSize], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      uint64_t v10 = 0;
      goto LABEL_17;
    }
    os_log_type_t v13 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v13, v16))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v16, "Failed to query free space", (uint8_t *)&v17, 2u);
    }
    uint64_t v10 = 0;
    goto LABEL_15;
  }
  uint64_t v10 = (void *)v9;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v11 = VCPLogInstance();
    os_log_type_t v12 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v11, v12))
    {
      int v17 = 134217984;
      double v18 = (double)(unint64_t)[v10 unsignedLongLongValue] * 0.0009765625 * 0.0009765625;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Free space: %0.1f MB", (uint8_t *)&v17, 0xCu);
    }
  }
  if ((unint64_t)[v10 unsignedLongLongValue] >> 21 <= 4)
  {
    if ((int)MediaAnalysisLogLevel() < 5)
    {
LABEL_17:
      self->_recommendedState = 5;
      goto LABEL_18;
    }
    os_log_type_t v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = [v10 unsignedLongLongValue];
      int v17 = 134217984;
      double v18 = *(double *)&v15;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Insufficient free space (%llu bytes)", (uint8_t *)&v17, 0xCu);
    }
LABEL_15:

    goto LABEL_17;
  }
LABEL_18:
}

- (int)enable
{
  p_int thermalToken = &self->_thermalToken;
  if (self->_thermalToken == -1)
  {
    self->_recommendedState = 2;
    p_int powerToken = &self->_powerToken;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001658F0;
    handler[3] = &unk_10021E0D0;
    handler[4] = self;
    notify_register_dispatch("com.apple.system.powersources.source", &self->_powerToken, (dispatch_queue_t)&_dispatch_main_q, handler);
    [(VCPSystemMonitor *)self checkPluggedIn];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    void v17[2] = sub_1001658F8;
    v17[3] = &unk_10021E0D0;
    v17[4] = self;
    notify_register_dispatch("com.apple.springboard.lockstate", &self->_screenToken, (dispatch_queue_t)&_dispatch_main_q, v17);
    [(VCPSystemMonitor *)self checkScreenLocked];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = sub_100165900;
    v16[3] = &unk_10021E0D0;
    v16[4] = self;
    notify_register_dispatch("com.apple.system.powersources.timeremaining", &self->_chargedToken, (dispatch_queue_t)&_dispatch_main_q, v16);
    id v5 = [(VCPSystemMonitor *)self checkFullyCharged];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100165924;
    v15[3] = &unk_10021E0D0;
    v15[4] = self;
    notify_register_dispatch(kOSThermalNotificationPressureLevelName, p_thermalToken, (dispatch_queue_t)&_dispatch_main_q, v15);
    [(VCPSystemMonitor *)self checkThermalPressure];
    os_log_type_t v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    freeSpaceTimer = self->_freeSpaceTimer;
    self->_freeSpaceTimer = v6;

    os_log_type_t v8 = self->_freeSpaceTimer;
    if (v8)
    {
      dispatch_source_set_timer(v8, 0, 0x45D964B800uLL, 0x6FC23AC00uLL);
      uint64_t v9 = self->_freeSpaceTimer;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10016592C;
      v14[3] = &unk_100219FC8;
      v14[4] = self;
      dispatch_source_set_event_handler(v9, v14);
      dispatch_resume((dispatch_object_t)self->_freeSpaceTimer);
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v10 = VCPLogInstance();
      os_log_type_t v11 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v10, v11))
      {
        *(_WORD *)os_log_type_t v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Failed to query free space", v13, 2u);
      }
    }
    if (*p_thermalToken != -1
      && *p_powerToken != -1
      && self->_screenToken != -1
      && self->_chargedToken != -1
      && self->_freeSpaceTimer)
    {
      return 0;
    }
    [(VCPSystemMonitor *)self reset];
    self->_recommendedState = 5;
  }
  return -18;
}

- (int)disable
{
  if (self->_thermalToken == -1) {
    return -18;
  }
  [(VCPSystemMonitor *)self reset];
  return 0;
}

- (int64_t)recommendedState
{
  return self->_recommendedState;
}

- (void).cxx_destruct
{
}

@end