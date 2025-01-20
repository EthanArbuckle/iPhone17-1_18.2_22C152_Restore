@interface CSPowerAssertionAccessory
- (CSPowerAssertionAccessory)initWithName:(id)a3 timeout:(double)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation CSPowerAssertionAccessory

- (void).cxx_destruct
{
}

- (void)invalidate
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  IOReturn v3 = IOPMAssertionRelease(self->_assertionID);
  v4 = CSLogContextFacilityCoreSpeech;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      name = self->_name;
      int v7 = 136315394;
      v8 = "-[CSPowerAssertionAccessory invalidate]";
      __int16 v9 = 2114;
      v10 = name;
      _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Fail to release power assertion %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_name;
    int v7 = 136315394;
    v8 = "-[CSPowerAssertionAccessory invalidate]";
    __int16 v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Successfully released power assertion %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)dealloc
{
  if (self->_assertionID) {
    [(CSPowerAssertionAccessory *)self invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)CSPowerAssertionAccessory;
  [(CSPowerAssertionAccessory *)&v3 dealloc];
}

- (CSPowerAssertionAccessory)initWithName:(id)a3 timeout:(double)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v7 = (__CFString *)a3;
  if (+[CSUtils deviceRequirePowerAssertionHeld])
  {
    v26.receiver = self;
    v26.super_class = (Class)CSPowerAssertionAccessory;
    v8 = [(CSPowerAssertionAccessory *)&v26 init];
    __int16 v9 = (IOPMAssertionID *)v8;
    if (v8)
    {
      p_name = &v8->_name;
      objc_storeStrong((id *)&v8->_name, a3);
      v9[2] = 0;
      uint64_t v11 = v9 + 2;
      if (a4 == 0.0)
      {
        IOReturn v12 = IOPMAssertionCreateWithName(@"PreventUserIdleSystemSleep", 0xFFu, @"com.apple.corespeech.powerassertion", v9 + 2);
        if (*v11) {
          BOOL v13 = v12 == 0;
        }
        else {
          BOOL v13 = 0;
        }
        if (!v13) {
          goto LABEL_16;
        }
        uint64_t v14 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *p_name;
          *(_DWORD *)buf = 136315394;
          v28 = "-[CSPowerAssertionAccessory initWithName:timeout:]";
          __int16 v29 = 2114;
          v30 = v15;
          v16 = "%s Taking power assertion %{public}@";
          v17 = v14;
          uint32_t v18 = 22;
LABEL_21:
          _os_log_impl(&dword_1BA1A5000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        }
      }
      else
      {
        IOReturn v20 = IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", @"com.apple.corespeech.powerassertion", 0, v7, 0, a4, @"TimeoutActionRelease", v9 + 2);
        if (*v11) {
          BOOL v21 = v20 == 0;
        }
        else {
          BOOL v21 = 0;
        }
        if (!v21)
        {
LABEL_16:
          v22 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v28 = "-[CSPowerAssertionAccessory initWithName:timeout:]";
            _os_log_error_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_ERROR, "%s Could not take power assertion", buf, 0xCu);
          }

          __int16 v9 = 0;
          goto LABEL_22;
        }
        uint64_t v23 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          v24 = *p_name;
          *(_DWORD *)buf = 136315650;
          v28 = "-[CSPowerAssertionAccessory initWithName:timeout:]";
          __int16 v29 = 2114;
          v30 = v24;
          __int16 v31 = 2050;
          double v32 = a4;
          v16 = "%s Taking power assertion %{public}@ for a max of %{public}lf seconds";
          v17 = v23;
          uint32_t v18 = 32;
          goto LABEL_21;
        }
      }
    }
LABEL_22:
    self = v9;
    v19 = self;
    goto LABEL_23;
  }
  v19 = 0;
LABEL_23:

  return v19;
}

@end