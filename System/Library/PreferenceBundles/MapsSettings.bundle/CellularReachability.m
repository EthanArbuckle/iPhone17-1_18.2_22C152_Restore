@interface CellularReachability
+ (unint64_t)cellularStatus;
@end

@implementation CellularReachability

+ (unint64_t)cellularStatus
{
  if (+[PSCellularDataSettingsDetail deviceSupportsCellularData])
  {
    unsigned __int8 v2 = +[PSCellularDataSettingsDetail isEnabled];
    v3 = MAPSGetDeviceConnectionLog();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (v2)
    {
      if (v4)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Fetching cellular data policy from CT...", buf, 2u);
      }

      if (qword_8E2C0) {
        goto LABEL_16;
      }
      v7 = MAPSGetDeviceConnectionLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Creating CT server connection for cellular data request...", buf, 2u);
      }

      qword_8E2C0 = _CTServerConnectionCreateOnTargetQueue();
      if (qword_8E2C0)
      {
LABEL_16:
        v8 = +[NSBundle mainBundle];
        [v8 bundleIdentifier];
        uint64_t v9 = _CTServerConnectionCopyCellularUsagePolicy();

        uint64_t v10 = (int)v9;
        uint64_t v11 = v9 >> 32;
      }
      else
      {
        v12 = MAPSGetDeviceConnectionLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "No CT server connection; cannot fetch cellular data policy.",
            buf,
            2u);
        }

        uint64_t v11 = 0;
        uint64_t v10 = 0;
      }
      v13 = MAPSGetDeviceConnectionLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v15 = v10;
        __int16 v16 = 2048;
        uint64_t v17 = v11;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Could not fetch a cellular data usage policy from CT (domain: %lu, error: %lu)", buf, 0x16u);
      }

      return 2;
    }
    else
    {
      if (v4)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Global cellular data setting is disabled", buf, 2u);
      }

      return 1;
    }
  }
  else
  {
    v5 = MAPSGetDeviceConnectionLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Device does not support cellular data", buf, 2u);
    }

    return 0;
  }
}

@end