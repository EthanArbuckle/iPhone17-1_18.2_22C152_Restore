@interface CMErrorUtils
+ (id)CMErrorWithCode:(int)a3;
+ (id)CMErrorWithCode:(int)a3 userInfo:(id)a4;
@end

@implementation CMErrorUtils

+ (id)CMErrorWithCode:(int)a3 userInfo:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, *(uint64_t *)&a3);
  v8 = objc_msgSend_bundleWithIdentifier_(MEMORY[0x1E4F28B50], v7, @"com.apple.coremotion");
  if ((a3 - 104) >= 8)
  {
    v12 = v8;
    v13 = (void *)MEMORY[0x1E4F28588];
    v14 = @"Failure reason unknown.";
    v15 = (void *)MEMORY[0x1E4F28568];
    v16 = @"Unknown failure.";
    v17 = @"Rotate the device around to calibrate.";
    v18 = @"Unable to calibrate device until it is rotated.";
    v19 = @"Device needs to be moved.";
    switch(a3)
    {
      case 'd':
        return 0;
      case 'e':
        goto LABEL_10;
      case 'f':
        v17 = @"Location Services must be available and enabled for System Services > Compass Calibration.";
        v18 = @"Unable to access location.";
        v19 = @"Failed to get true north.";
LABEL_10:
        uint64_t v20 = objc_msgSend_localizedStringForKey_value_table_(v8, v9, (uint64_t)v19, &stru_1EDFD5D50, 0);
        objc_msgSend_setObject_forKeyedSubscript_(v6, v21, v20, *v15);
        v13 = (void *)MEMORY[0x1E4F285A0];
        v15 = (void *)MEMORY[0x1E4F28588];
        v16 = v18;
        v14 = v17;
        goto LABEL_11;
      case 'g':
LABEL_11:
        uint64_t v22 = objc_msgSend_localizedStringForKey_value_table_(v12, v9, (uint64_t)v16, &stru_1EDFD5D50, 0);
        objc_msgSend_setObject_forKeyedSubscript_(v6, v23, v22, *v15);
        uint64_t v25 = objc_msgSend_localizedStringForKey_value_table_(v12, v24, (uint64_t)v14, &stru_1EDFD5D50, 0);
        objc_msgSend_setObject_forKeyedSubscript_(v6, v26, v25, *v13);
        if (!a4) {
          goto LABEL_4;
        }
        goto LABEL_3;
      default:
        if (qword_1EB3BE898 == -1) {
          goto LABEL_14;
        }
        while (1)
        {
          dispatch_once(&qword_1EB3BE898, &unk_1EDFD1BA0);
LABEL_14:
          v27 = off_1EB3BE890;
          if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 68289539;
            int v31 = 0;
            __int16 v32 = 2082;
            v33 = "";
            __int16 v34 = 2082;
            v35 = "assert";
            __int16 v36 = 2081;
            v37 = "0";
            _os_log_impl(&dword_1902AF000, v27, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CMError must be defined\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
            if (qword_1EB3BE898 != -1) {
              dispatch_once(&qword_1EB3BE898, &unk_1EDFD1BA0);
            }
          }
          v28 = off_1EB3BE890;
          if (os_signpost_enabled((os_log_t)off_1EB3BE890))
          {
            *(_DWORD *)buf = 68289539;
            int v31 = 0;
            __int16 v32 = 2082;
            v33 = "";
            __int16 v34 = 2082;
            v35 = "assert";
            __int16 v36 = 2081;
            v37 = "0";
            _os_signpost_emit_with_name_impl(&dword_1902AF000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CMError must be defined", "{\"msg%{public}.0s\":\"CMError must be defined\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
            if (qword_1EB3BE898 != -1) {
              dispatch_once(&qword_1EB3BE898, &unk_1EDFD1BA0);
            }
          }
          v29 = off_1EB3BE890;
          if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 68289539;
            int v31 = 0;
            __int16 v32 = 2082;
            v33 = "";
            __int16 v34 = 2082;
            v35 = "assert";
            __int16 v36 = 2081;
            v37 = "0";
            _os_log_impl(&dword_1902AF000, v29, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CMError must be defined\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          }
          abort_report_np();
        }
    }
  }
  if (a4) {
LABEL_3:
  }
    objc_msgSend_addEntriesFromDictionary_(v6, v9, (uint64_t)a4);
LABEL_4:
  v10 = (void *)MEMORY[0x1E4F28C58];

  return (id)objc_msgSend_errorWithDomain_code_userInfo_(v10, v9, @"CMErrorDomain", a3, v6);
}

+ (id)CMErrorWithCode:(int)a3
{
  return (id)objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, a2, *(uint64_t *)&a3, 0);
}

@end