@interface APGreenTeaLogger
- (APGreenTeaLogger)init;
- (ct_green_tea_logger_s)logger;
- (void)dealloc;
- (void)willAccessLocation;
- (void)willTransmitLocationFor:(unint64_t)a3;
@end

@implementation APGreenTeaLogger

- (APGreenTeaLogger)init
{
  v4.receiver = self;
  v4.super_class = (Class)APGreenTeaLogger;
  v2 = [(APGreenTeaLogger *)&v4 init];
  if (v2) {
    v2->_logger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
  }
  return v2;
}

- (void)willAccessLocation
{
  [(APGreenTeaLogger *)self logger];
  v2 = getCTGreenTeaOsLogHandle();
  v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235F4E000, v3, OS_LOG_TYPE_INFO, "Accessing location for ad targeting", buf, 2u);
  }

  objc_super v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_235F4E000, v4, OS_LOG_TYPE_INFO, "Accessing location for ad targeting", v5, 2u);
  }
}

- (ct_green_tea_logger_s)logger
{
  return self->_logger;
}

- (void)dealloc
{
  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)APGreenTeaLogger;
  [(APGreenTeaLogger *)&v3 dealloc];
}

- (void)willTransmitLocationFor:(unint64_t)a3
{
  uint64_t v16 = v3;
  uint64_t v17 = v4;
  switch(a3)
  {
    case 0uLL:
      [(APGreenTeaLogger *)self logger];
      v5 = getCTGreenTeaOsLogHandle();
      v6 = v5;
      if (v5)
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_235F4E000, v6, OS_LOG_TYPE_INFO, "Transmitting location to store platform for ad targeting", v15, 2u);
        }
      }

      v7 = APLogForCategory();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_23;
      }
      *(_WORD *)v15 = 0;
      v8 = "Transmitting location to store platform ad targeting (SLP)";
      break;
    case 1uLL:
      [(APGreenTeaLogger *)self logger];
      v9 = getCTGreenTeaOsLogHandle();
      v10 = v9;
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_235F4E000, v10, OS_LOG_TYPE_INFO, "Transmitting location to store platform for ad targeting", v15, 2u);
      }

      v7 = APLogForCategory();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_23;
      }
      *(_WORD *)v15 = 0;
      v8 = "Transmitting location to store platform for ad targeting (TT)";
      break;
    case 2uLL:
      [(APGreenTeaLogger *)self logger];
      v11 = getCTGreenTeaOsLogHandle();
      v12 = v11;
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_235F4E000, v12, OS_LOG_TYPE_INFO, "Transmitting location to store platform for ad targeting", v15, 2u);
      }

      v7 = APLogForCategory();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_23;
      }
      *(_WORD *)v15 = 0;
      v8 = "Transmitting location to store platform for ad targeting (PP)";
      break;
    case 3uLL:
      [(APGreenTeaLogger *)self logger];
      v13 = getCTGreenTeaOsLogHandle();
      v14 = v13;
      if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_235F4E000, v14, OS_LOG_TYPE_INFO, "Transmitting location to store platform for ad targeting", v15, 2u);
      }

      v7 = APLogForCategory();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_23;
      }
      *(_WORD *)v15 = 0;
      v8 = "Transmitting location to store platform for ad targeting (DP)";
      break;
    default:
      return;
  }
  _os_log_impl(&dword_235F4E000, v7, OS_LOG_TYPE_INFO, v8, v15, 2u);
LABEL_23:
}

@end