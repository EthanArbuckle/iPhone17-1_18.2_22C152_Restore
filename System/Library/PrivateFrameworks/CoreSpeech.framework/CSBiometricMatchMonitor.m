@interface CSBiometricMatchMonitor
+ (id)sharedInstance;
- (BKDevice)biometricDevice;
- (BOOL)getLastBiometricMatchEvent:(BOOL *)a3 atTime:(unint64_t *)a4;
- (CSBiometricMatchMonitor)init;
- (CSBiometricMatchMonitorDelegate)delegate;
- (unint64_t)getBiometricMatchResultForTriggerTimeStamp:(unint64_t)a3;
- (void)device:(id)a3 matchEventOccurred:(id)a4;
- (void)setBiometricDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startObserving;
@end

@implementation CSBiometricMatchMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometricDevice, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setBiometricDevice:(id)a3
{
}

- (BKDevice)biometricDevice
{
  return self->_biometricDevice;
}

- (void)setDelegate:(id)a3
{
}

- (CSBiometricMatchMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSBiometricMatchMonitorDelegate *)WeakRetained;
}

- (unint64_t)getBiometricMatchResultForTriggerTimeStamp:(unint64_t)a3
{
  if (!a3)
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSBiometricMatchMonitor getBiometricMatchResultForTriggerTimeStamp:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s triggerTimeStamp is nil - Bailing out", buf, 0xCu);
    }
    return 0;
  }
  unsigned __int8 v14 = 0;
  uint64_t v13 = 0;
  CSMachAbsoluteTimeToMachContinuousTime();
  if (![(CSBiometricMatchMonitor *)self getLastBiometricMatchEvent:&v14 atTime:&v13])
  {
    v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSBiometricMatchMonitor getBiometricMatchResultForTriggerTimeStamp:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s No biometric information available", buf, 0xCu);
    }
    return 0;
  }
  CSMachAbsoluteTimeGetTimeInterval();
  double v5 = v4;
  int v6 = v14;
  v7 = CSLogContextFacilityCoreSpeech;
  BOOL v8 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (v6 && v5 < 3.0)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[CSBiometricMatchMonitor getBiometricMatchResultForTriggerTimeStamp:]";
      __int16 v17 = 2048;
      double v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Biometric match happened in last %f secs", buf, 0x16u);
    }
    return 1;
  }
  else
  {
    if (v8)
    {
      CFStringRef v12 = @"MATCH";
      v16 = "-[CSBiometricMatchMonitor getBiometricMatchResultForTriggerTimeStamp:]";
      *(_DWORD *)buf = 136315650;
      if (!v6) {
        CFStringRef v12 = @"MIS-MATCH";
      }
      __int16 v17 = 2112;
      double v18 = *(double *)&v12;
      __int16 v19 = 2048;
      double v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Biometric match result: %@ happened in last %f secs", buf, 0x20u);
      int v6 = v14;
    }
    if (v6) {
      return 3;
    }
    else {
      return 2;
    }
  }
}

- (void)device:(id)a3 matchEventOccurred:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    int v14 = 136315650;
    v15 = "-[CSBiometricMatchMonitor device:matchEventOccurred:]";
    __int16 v16 = 1024;
    unsigned int v17 = [v7 result];
    __int16 v18 = 2048;
    id v19 = [v7 timeStamp];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s BiometricMatchEventOccurred: result = %u, timeStamp = %llu", (uint8_t *)&v14, 0x1Cu);
  }
  if (v7)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v13, "biometricMatchMonitorDidReceiveMatchAttempt:atTime:", objc_msgSend(v7, "result"), objc_msgSend(v7, "timeStamp"));
    }
  }
}

- (BOOL)getLastBiometricMatchEvent:(BOOL *)a3 atTime:(unint64_t *)a4
{
  biometricDevice = self->_biometricDevice;
  if (!biometricDevice)
  {
    v15 = CSLogContextFacilityCoreSpeech;
    BOOL v14 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR);
    if (!v14) {
      return v14;
    }
    *(_DWORD *)buf = 136315138;
    id v19 = "-[CSBiometricMatchMonitor getLastBiometricMatchEvent:atTime:]";
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s ERR: Biometric device is nil - Bailing out", buf, 0xCu);
LABEL_15:
    LOBYTE(v14) = 0;
    return v14;
  }
  id v17 = 0;
  id v7 = [(BKDevice *)biometricDevice lastMatchEventWithError:&v17];
  id v8 = v17;
  v9 = CSLogContextFacilityCoreSpeech;
  BOOL v10 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[CSBiometricMatchMonitor getLastBiometricMatchEvent:atTime:]";
      __int16 v20 = 2112;
      v21[0] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s BiometricMatchEvents unavailable with error %@", buf, 0x16u);
    }

    goto LABEL_15;
  }
  if (v10)
  {
    v11 = v9;
    unsigned int v12 = [v7 result];
    id v13 = [v7 timeStamp];
    *(_DWORD *)buf = 136315650;
    id v19 = "-[CSBiometricMatchMonitor getLastBiometricMatchEvent:atTime:]";
    __int16 v20 = 1024;
    LODWORD(v21[0]) = v12;
    WORD2(v21[0]) = 2048;
    *(void *)((char *)v21 + 6) = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s BiometricMatchEvent: result = %u, timeStamp = %llu", buf, 0x1Cu);
  }
  if (a3) {
    *a3 = [v7 result];
  }
  if (a4) {
    *a4 = (unint64_t)[v7 timeStamp];
  }

  LOBYTE(v14) = 1;
  return v14;
}

- (void)startObserving
{
  biometricDevice = self->_biometricDevice;
  if (biometricDevice) {
    [(BKDevice *)biometricDevice setDelegate:self];
  }
}

- (CSBiometricMatchMonitor)init
{
  v15.receiver = self;
  v15.super_class = (Class)CSBiometricMatchMonitor;
  v2 = [(CSBiometricMatchMonitor *)&v15 init];
  if (v2)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v3 = (void *)qword_1002A37C0;
    uint64_t v19 = qword_1002A37C0;
    if (!qword_1002A37C0)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10006E4B0;
      v21 = &unk_100253440;
      v22 = &v16;
      sub_10006E4B0((uint64_t)buf);
      v3 = (void *)v17[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v16, 8);
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2050000000;
    double v5 = (void *)qword_1002A37D0;
    uint64_t v19 = qword_1002A37D0;
    if (!qword_1002A37D0)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10006E520;
      v21 = &unk_100253440;
      v22 = &v16;
      sub_10006E520((uint64_t)buf);
      double v5 = (void *)v17[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v16, 8);
    id v7 = [v6 availableDevices];
    id v8 = [v7 firstObject];
    id v14 = 0;
    uint64_t v9 = [v4 deviceWithDescriptor:v8 error:&v14];
    id v10 = v14;
    biometricDevice = v2->_biometricDevice;
    v2->_biometricDevice = (BKDevice *)v9;

    if (v10 || !v2->_biometricDevice)
    {
      unsigned int v12 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[CSBiometricMatchMonitor init]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Failed to create biometricdevice with error %@", buf, 0x16u);
      }
    }
  }
  return v2;
}

+ (id)sharedInstance
{
  if (CSIsHorseman() & 1) != 0 || (+[CSUtils isDarwinOS])
  {
    id v2 = 0;
  }
  else
  {
    if (qword_1002A37B8 != -1) {
      dispatch_once(&qword_1002A37B8, &stru_10024FC90);
    }
    id v2 = (id)qword_1002A37B0;
  }
  return v2;
}

@end