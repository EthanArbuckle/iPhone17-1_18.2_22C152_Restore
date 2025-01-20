@interface IMBatteryStatus
- (BOOL)isCharging;
- (IMBatteryStatusTestDelegate)testDelegate;
- (void)setTestDelegate:(id)a3;
@end

@implementation IMBatteryStatus

- (BOOL)isCharging
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1A6228190](self, a2);
  if (qword_1EB4A5D08 != -1) {
    dispatch_once(&qword_1EB4A5D08, &unk_1EF2BF2E0);
  }
  if (qword_1EB4A5D18 != -1) {
    dispatch_once(&qword_1EB4A5D18, &unk_1EF2C0560);
  }
  if (qword_1EB4A5D28 != -1) {
    dispatch_once(&qword_1EB4A5D28, &unk_1EF2C0AC0);
  }
  if (qword_1EB4A5D38 != -1) {
    dispatch_once(&qword_1EB4A5D38, &unk_1EF2BFC60);
  }
  if (qword_1EB4A5D48 != -1) {
    dispatch_once(&qword_1EB4A5D48, &unk_1EF2BFDE0);
  }
  if (off_1EB4A5D30 && off_1EB4A5D00 && off_1EB4A5D10 && off_1EB4A5D20 && byte_1EB4A5D40 == 1)
  {
    uint64_t v4 = off_1EB4A5D00("IOPMPowerSource");
    if (v4)
    {
      uint64_t v5 = off_1EB4A5D10(dword_1E94FF05C, v4);
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *MEMORY[0x1E4F1CF80];
        int v8 = objc_msgSend((id)off_1EB4A5D20(v5, @"IsCharging", *MEMORY[0x1E4F1CF80], 0), "BOOLValue");
        uint64_t v9 = objc_msgSend((id)off_1EB4A5D20(v6, @"ExternalConnected", v7, 0), "BOOLValue");
        int v10 = objc_msgSend((id)off_1EB4A5D20(v6, @"FullyCharged", v7, 0), "BOOLValue");
        if (IMOSLoggingEnabled())
        {
          v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v12 = @"NO";
            if (v8) {
              v13 = @"YES";
            }
            else {
              v13 = @"NO";
            }
            if (v9) {
              v14 = @"YES";
            }
            else {
              v14 = @"NO";
            }
            int v22 = 138412802;
            v23 = v13;
            __int16 v24 = 2112;
            v25 = v14;
            if (v10) {
              v12 = @"YES";
            }
            __int16 v26 = 2112;
            v27 = v12;
            _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Battery status isChargingPerIOKit %@ isExternalConnected %@ isFullyCharged %@", (uint8_t *)&v22, 0x20u);
          }
        }
        off_1EB4A5D30(v6);
        uint64_t v15 = 1;
        goto LABEL_45;
      }
      if (IMOSLoggingEnabled())
      {
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          LOWORD(v22) = 0;
          _os_log_impl(&dword_1A0772000, v18, OS_LOG_TYPE_INFO, "Failed to load service for _kIOMasterPortDefault", (uint8_t *)&v22, 2u);
        }
LABEL_43:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1A0772000, v18, OS_LOG_TYPE_INFO, "Unable to load a service for IOPMPowerSource", (uint8_t *)&v22, 2u);
      }
      goto LABEL_43;
    }
    uint64_t v15 = 0;
    uint64_t v9 = 0;
LABEL_45:
    uint64_t v17 = 1;
    goto LABEL_46;
  }
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "One or more weak linked symbols were not loaded.", (uint8_t *)&v22, 2u);
    }
  }
  uint64_t v15 = 0;
  uint64_t v17 = 0;
  uint64_t v9 = 0;
LABEL_46:
  v19 = [(IMBatteryStatus *)self testDelegate];

  if (v19)
  {
    v20 = [(IMBatteryStatus *)self testDelegate];
    [v20 chargingCalledWithResult:v15 isCharging:v9 frameworksLoadedOk:v17];
  }
  return v9;
}

- (IMBatteryStatusTestDelegate)testDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testDelegate);

  return (IMBatteryStatusTestDelegate *)WeakRetained;
}

- (void)setTestDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end