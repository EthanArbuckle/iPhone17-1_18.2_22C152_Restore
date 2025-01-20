@interface CBRTPLCParams
- (BOOL)loadParametersFromService:(unsigned int)a3;
- (CBRTPLCParams)initWithService:(unsigned int)a3;
- (CBRTPLCRecoveryCurveParams)recoveryCurve;
- (void)dealloc;
@end

@implementation CBRTPLCParams

- (BOOL)loadParametersFromService:(unsigned int)a3
{
  v29 = self;
  SEL v28 = a2;
  io_registry_entry_t v27 = a3;
  if (a3)
  {
    int v23 = 0;
    char v22 = load_int_from_edt(v27, @"supports-rtplc", &v23) & 1;
    if (v22 && v23)
    {
      v18 = 0;
      if (v29->_log)
      {
        v7 = v29->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        v7 = inited;
      }
      v18 = v7;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v4 = v18;
        os_log_type_t v5 = v17;
        __os_log_helper_16_0_0(v16);
        _os_log_impl(&dword_1BA438000, v4, v5, "RTPLC is supported", v16, 2u);
      }
      return 1;
    }
    else
    {
      v21 = 0;
      if (v29->_log)
      {
        v11 = v29->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v10 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v10 = init_default_corebrightness_log();
        }
        v11 = v10;
      }
      v21 = v11;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v21;
        os_log_type_t v9 = v20;
        __os_log_helper_16_0_0(v19);
        _os_log_impl(&dword_1BA438000, v8, v9, "RTPLC is not supported", v19, 2u);
      }
      return 0;
    }
  }
  else
  {
    v26 = 0;
    if (v29->_log)
    {
      v15 = v29->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v14 = init_default_corebrightness_log();
      }
      v15 = v14;
    }
    v26 = v15;
    char v25 = 16;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      log = v26;
      os_log_type_t type = v25;
      __os_log_helper_16_0_0(v24);
      _os_log_error_impl(&dword_1BA438000, log, type, "Service is null", v24, 2u);
    }
    return 0;
  }
}

- (CBRTPLCParams)initWithService:(unsigned int)a3
{
  uint64_t v10 = self;
  SEL v9 = a2;
  unsigned int v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CBRTPLCParams;
  uint64_t v10 = [(CBRTPLCParams *)&v7 init];
  if (!v10) {
    return v10;
  }
  os_log_t v3 = os_log_create("com.apple.CoreBrightness.BacklightNode", "RTPLC");
  v10->_log = (OS_os_log *)v3;
  if ([(CBRTPLCParams *)v10 loadParametersFromService:v8])
  {
    v4 = [CBRTPLCRecoveryCurveParams alloc];
    uint64_t v5 = [(CBRTPLCRecoveryCurveParams *)v4 initWithService:v8];
    v10->_recoveryCurve = (CBRTPLCRecoveryCurveParams *)v5;
    if (v10->_recoveryCurve) {
      return v10;
    }
  }

  uint64_t v10 = 0;
  return 0;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;

  if (v4->_log)
  {

    v4->_log = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBRTPLCParams;
  [(CBRTPLCParams *)&v2 dealloc];
}

- (CBRTPLCRecoveryCurveParams)recoveryCurve
{
  return self->_recoveryCurve;
}

@end