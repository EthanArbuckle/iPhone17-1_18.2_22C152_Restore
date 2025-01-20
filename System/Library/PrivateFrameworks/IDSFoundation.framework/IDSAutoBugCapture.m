@interface IDSAutoBugCapture
+ (void)triggerCaptureWithEvent:(int64_t)a3 context:(id)a4 completion:(id)a5;
+ (void)triggerCaptureWithEvent:(int64_t)a3 destinations:(id)a4 context:(id)a5 completion:(id)a6;
@end

@implementation IDSAutoBugCapture

+ (void)triggerCaptureWithEvent:(int64_t)a3 destinations:(id)a4 context:(id)a5 completion:(id)a6
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = objc_opt_class();
  if (objc_msgSend_isSupported(v12, v13, v14, v15))
  {
    if (qword_1E944F1A8 != -1) {
      dispatch_once(&qword_1E944F1A8, &unk_1EEFCD6B8);
    }
    if (qword_1E944F1B0)
    {
      v16 = @"Unknown";
      v17 = @"Push Token";
      switch(a3)
      {
        case 200:
        case 201:
        case 202:
        case 203:
        case 204:
        case 205:
        case 210:
          v16 = @"Registration";
          goto LABEL_11;
        case 206:
LABEL_16:
          v27 = @"PushTokenChangedUnexpectedly";
          goto LABEL_33;
        case 207:
        case 209:
          v16 = @"System";
          goto LABEL_11;
        case 208:
          goto LABEL_11;
        case 211:
          goto LABEL_10;
        default:
          if ((unint64_t)(a3 - 100) < 8) {
LABEL_10:
          }
            v16 = @"Delivery";
LABEL_11:
          v17 = v16;
          v27 = @"Unknown";
          switch(a3)
          {
            case 200:
              v27 = @"RegistrationFailed";
              break;
            case 201:
              v27 = @"AccountStateError";
              break;
            case 202:
              v27 = @"ECKeyLoadingFailed";
              break;
            case 203:
              v27 = @"SMSQuotaExhausted";
              break;
            case 204:
              v27 = @"SMSTimeoutFailure";
              break;
            case 205:
              v27 = @"AttemptRateExceeded";
              break;
            case 206:
              goto LABEL_16;
            case 207:
              v27 = @"TooManyFileDescriptors";
              break;
            case 208:
              break;
            case 209:
              v27 = @"TooManyPortsAllocated";
              break;
            case 210:
              v27 = @"MissingKTAccountKey";
              break;
            case 211:
              v27 = @"ExcessiveQueryCacheEntries";
              break;
            default:
              switch(a3)
              {
                case 'd':
                  v27 = @"ECCEncryptionFailed";
                  break;
                case 'e':
                  v27 = @"ECCDecryptionFailed";
                  break;
                case 'f':
                  v27 = @"NiceRateLimited";
                  break;
                case 'g':
                  v27 = @"QueryRateLimited";
                  break;
                case 'h':
                  v27 = @"SecondaryEncryptionFailed";
                  break;
                case 'i':
                  v27 = @"SecondaryDecryptionFailed";
                  break;
                case 'j':
                  v27 = @"DifferedQueryCacheResults";
                  break;
                case 'k':
                  v27 = @"SenderKeyNotFound";
                  break;
                default:
                  goto LABEL_33;
              }
              break;
          }
LABEL_33:
          v28 = (void *)MEMORY[0x1E4F28F80];
          id v26 = (id)qword_1E944F1B0;
          v32 = objc_msgSend_processInfo(v28, v29, v30, v31);
          v36 = objc_msgSend_processName(v32, v33, v34, v35);
          v23 = objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_(v26, v37, @"IDS", v38, v17, v27, v10, v36, 0);

          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = sub_19DABD310;
          v40[3] = &unk_1E5974A30;
          id v41 = v11;
          objc_msgSend_snapshotWithSignature_withIDSDestinations_validFor_delay_events_payload_actions_reply_(v26, v39, (uint64_t)v23, 0.0, v9, 0, 0, 0, v40, 0.0);
          id v20 = v41;
          break;
      }
    }
    else
    {
      v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v42 = *MEMORY[0x1E4F28228];
      v43[0] = @"Failed to weak link SymptomDiagnosticReporter reporter";
      v19 = (void *)MEMORY[0x1E4F1C9E8];
      id v20 = 0;
      v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v19, v21, (uint64_t)v43, v22, &v42, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v18, v24, @"IDSAutoBugCaptureErrorDomain", v25, -100, v23);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, id))v11 + 2))(v11, 0, v26);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
  }
}

+ (void)triggerCaptureWithEvent:(int64_t)a3 context:(id)a4 completion:(id)a5
{
}

@end