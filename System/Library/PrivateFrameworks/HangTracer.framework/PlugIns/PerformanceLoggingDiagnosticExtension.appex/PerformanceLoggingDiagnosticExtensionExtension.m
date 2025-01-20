@interface PerformanceLoggingDiagnosticExtensionExtension
- (BOOL)setEPLKeysForParameters:(id)a3 error:(id *)a4;
- (BOOL)setEPLKeysForParameters:(id)a3 error:(id *)a4 domain:(__CFString *)a5;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)keyWithPrefix:(id)a3;
- (id)linkRMEAndGetEPLProfilePath;
- (id)sysdiagnoseParamsFromDEParams:(id)a3;
- (id)takeSysdiagnose:(id)a3 error:(id *)a4;
- (void)enableReportMemoryException:(BOOL)a3;
@end

@implementation PerformanceLoggingDiagnosticExtensionExtension

- (id)keyWithPrefix:(id)a3
{
  if (a3)
  {
    v4 = +[NSString stringWithFormat:@"%@.%@", @"HTEPL", a3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)sysdiagnoseParamsFromDEParams:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableDictionary dictionary];
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"shouldCreateTarBall"];

    if (v5)
    {
      v6 = [v3 objectForKeyedSubscript:@"shouldCreateTarBall"];
      [v4 setObject:v6 forKeyedSubscript:@"shouldCreateTarBall"];
    }
    else
    {
      [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"shouldCreateTarBall"];
    }
    v9 = [v3 objectForKeyedSubscript:@"forceDiagnostic"];

    if (v9)
    {
      v10 = [v3 objectForKeyedSubscript:@"forceDiagnostic"];
      [v4 setObject:v10 forKeyedSubscript:@"forceDiagnostic"];
    }
    else
    {
      [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"forceDiagnostic"];
    }
    v26[0] = @"HangTracerTailspins";
    CFStringRef v24 = @"maxSizeMB";
    v11 = +[NSNumber numberWithUnsignedInteger:55];
    v25 = v11;
    v12 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v27[0] = v12;
    v26[1] = @"ForceResetTailspins";
    CFStringRef v22 = @"maxSizeMB";
    v13 = +[NSNumber numberWithUnsignedInteger:175];
    v23 = v13;
    v14 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v27[1] = v14;
    v26[2] = @"crashes_and_spins/MemoryExceptions";
    CFStringRef v20 = @"maxSizeMB";
    v15 = +[NSNumber numberWithUnsignedInteger:50];
    v21 = v15;
    v16 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v27[2] = v16;
    v17 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
    [v4 setObject:v17 forKeyedSubscript:@"capOverride"];

    id v8 = v4;
  }
  else
  {
    v7 = shared_pl_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DE parameters are nil", v19, 2u);
    }

    id v8 = 0;
  }

  return v8;
}

- (id)takeSysdiagnose:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = shared_pl_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Attempting to take sysdiagnose", buf, 2u);
  }

  if (v5)
  {
    id v13 = 0;
    v7 = +[Libsysdiagnose sysdiagnoseWithMetadata:v5 withError:&v13];
    id v8 = v13;
    v9 = v8;
    if (a4) {
      *a4 = v8;
    }
    v10 = shared_pl_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Returned sysdiagnose path: %@", buf, 0xCu);
    }

    goto LABEL_13;
  }
  v11 = shared_pl_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "sysdiagnose parameters dictionary is nil", buf, 2u);
  }

  if (a4)
  {
    v9 = +[NSDictionary dictionaryWithObject:@"sysdiagnose parameters dictionary is nil" forKey:NSLocalizedDescriptionKey];
    +[NSError errorWithDomain:@"EPLErrorDomain" code:1 userInfo:v9];
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  v7 = 0;
LABEL_14:

  return v7;
}

- (id)linkRMEAndGetEPLProfilePath
{
  if (qword_100016028 != -1) {
    dispatch_once(&qword_100016028, &stru_100010498);
  }
  if (qword_100016020)
  {
    v2 = [(id)qword_100016020 getEPLProfilePath];
    id v3 = shared_pl_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Successfully resolved EPLProfilePath dynamically", buf, 2u);
    }
  }
  else
  {
    id v3 = shared_pl_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "RMECacheEnumerator symbol cannot be found", v5, 2u);
    }
    v2 = 0;
  }

  return v2;
}

- (void)enableReportMemoryException:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(PerformanceLoggingDiagnosticExtensionExtension *)self linkRMEAndGetEPLProfilePath];
  id v5 = v4;
  if (v4)
  {
    if (v3)
    {
      v6 = objc_alloc_init((Class)NSDateComponents);
      [v6 setDay:2];
      v7 = +[NSCalendar currentCalendar];
      id v8 = +[NSDate date];
      v9 = [v7 dateByAddingComponents:v6 toDate:v8 options:0];

      v59[0] = @"FullDiagLimit";
      v59[1] = @"LiteDiagLimit";
      v60[0] = &off_100011B98;
      v60[1] = &off_100011BB0;
      v59[2] = @"PerProcessLimit";
      v59[3] = @"ExpirationDate";
      v60[2] = &off_100011BC8;
      v60[3] = v9;
      v10 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:4];
      id v52 = 0;
      v11 = +[NSPropertyListSerialization dataWithPropertyList:v10 format:100 options:0 error:&v52];
      id v12 = v52;
      id v13 = v12;
      if (!v11)
      {
        v19 = shared_pl_log_handle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v36 = [v13 localizedDescription];
          *(_DWORD *)buf = 138412546;
          id v54 = v5;
          __int16 v55 = 2112;
          v56 = v36;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Failed to write ReportMemoryException plist at %@ due to serialization error: %@", buf, 0x16u);
        }
        goto LABEL_34;
      }
      id v49 = v12;
      id v14 = v5;
      int v15 = open((const char *)[v14 UTF8String], 1538, 420);
      if (v15 == -1)
      {
        v19 = shared_pl_log_handle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v54 = v14;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Failed to write ReportMemoryException plist at %@: Could not open file descriptor", buf, 0xCu);
        }
        goto LABEL_33;
      }
      int v16 = v15;
      v48 = v7;
      NSFileAttributeKey v57 = NSFileProtectionKey;
      NSFileProtectionType v58 = NSFileProtectionNone;
      uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      v18 = +[NSFileManager defaultManager];
      id v51 = 0;
      v47 = (void *)v17;
      LODWORD(v17) = [v18 setAttributes:v17 ofItemAtPath:v14 error:&v51];
      v19 = v51;

      if (!v17)
      {
        v23 = shared_pl_log_handle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v44 = [v19 localizedDescription];
          *(_DWORD *)buf = 138412546;
          id v54 = v14;
          __int16 v55 = 2112;
          v56 = v44;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Failed to write ReportMemoryException plist at %@ due to attributes error: %@", buf, 0x16u);
        }
        goto LABEL_32;
      }
      id v20 = v11;
      ssize_t v21 = write(v16, [v20 bytes], (size_t)objc_msgSend(v20, "length"));
      CFStringRef v22 = shared_pl_log_handle();
      v23 = v22;
      if (v21 == -1)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v45 = __error();
          v46 = strerror(*v45);
          *(_DWORD *)buf = 138412546;
          id v54 = v14;
          __int16 v55 = 2080;
          v56 = v46;
          CFStringRef v24 = "Failed to write ReportMemoryException plist at %@ with error %s";
          v25 = v23;
          os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
          uint32_t v27 = 22;
          goto LABEL_31;
        }
      }
      else if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v14;
        CFStringRef v24 = "Successfully wrote ReportMemoryException plist at %@";
        v25 = v23;
        os_log_type_t v26 = OS_LOG_TYPE_INFO;
        uint32_t v27 = 12;
LABEL_31:
        _os_log_impl((void *)&_mh_execute_header, v25, v26, v24, buf, v27);
      }
LABEL_32:

      close(v16);
      v7 = v48;
LABEL_33:
      id v13 = v49;
LABEL_34:

      goto LABEL_35;
    }
    id v28 = v4;
    int v29 = truncate((const char *)[v28 UTF8String], 0);
    v30 = shared_pl_log_handle();
    v31 = v30;
    if (v29 == -1)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v37 = __error();
        v38 = strerror(*v37);
        *(_DWORD *)buf = 138412546;
        id v54 = v28;
        __int16 v55 = 2080;
        v56 = v38;
        v32 = "Failed to truncate ReportMemoryException plist at %@ with error %s";
        v33 = v31;
        os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
        uint32_t v35 = 22;
        goto LABEL_18;
      }
    }
    else if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v28;
      v32 = "Successfully truncated ReportMemoryException plist at %@";
      v33 = v31;
      os_log_type_t v34 = OS_LOG_TYPE_INFO;
      uint32_t v35 = 12;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v33, v34, v32, buf, v35);
    }

    v39 = +[NSFileManager defaultManager];
    id v50 = 0;
    unsigned int v40 = [v39 removeItemAtPath:v28 error:&v50];
    v6 = v50;

    v41 = shared_pl_log_handle();
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
    if (v40)
    {
      if (v42)
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v28;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Successfully deleted ReportMemoryException plist at %@", buf, 0xCu);
      }
    }
    else if (v42)
    {
      v43 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v54 = v28;
      __int16 v55 = 2112;
      v56 = v43;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Failed to delete ReportMemoryException plist at %@ with error %@", buf, 0x16u);
    }
    goto LABEL_35;
  }
  v6 = shared_pl_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to write ReportMemoryException plist: EPLProfilePath is nil", buf, 2u);
  }
LABEL_35:
}

- (BOOL)setEPLKeysForParameters:(id)a3 error:(id *)a4 domain:(__CFString *)a5
{
  id v8 = a3;
  v9 = v8;
  if (v8)
  {
    v10 = [v8 objectForKeyedSubscript:@"EnableEnhancedPerformanceLogging"];
    v11 = v10;
    if (v10)
    {
      if ([v10 BOOLValue])
      {
        if (configureTailspinForEPL(1))
        {
          persistAndUnredactLogs(1);
          [(PerformanceLoggingDiagnosticExtensionExtension *)self enableReportMemoryException:1];
          id v12 = +[NSDate date];
          [v12 timeIntervalSinceReferenceDate];
          +[PLPreferences setDouble:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"EPLTimeoutTimestampSec"] key:a5 domain:v13 + 172800.0];
          +[PLPreferences setBool:1 key:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"EPLEnabled"] domain:a5];
          +[PLPreferences setBool:1 key:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"HangTracerEnableAppActivationLogging"] domain:@"com.apple.hangtracer"];
          +[PLPreferences setBool:1 key:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"HangTracerEnabled"] domain:a5];
          +[PLPreferences setBool:1 key:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"HangTracerEnableTailspin"] domain:a5];
          +[PLPreferences setBool:1 key:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"HangTracerEnableSignpostMonitoring"] domain:a5];
          +[PLPreferences setBool:1 key:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"HangTracerEnableWorkflowResponsiveness"] domain:a5];
          +[PLPreferences setBool:1 key:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"HangTracerCollectOSSignpostsDeferred"] domain:a5];
          +[PLPreferences setBool:0 key:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"HangTracerShouldUploadToDiagPipe"] domain:a5];
          +[PLPreferences setString:@"compressed" key:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"HangTracerKeepTailspinsWithFormat"] domain:a5];
          +[PLPreferences setInteger:55 key:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"HangTracerSavedTailspinsMaxMB"] domain:a5];

LABEL_11:
          if (a4) {
            *a4 = 0;
          }
          BOOL v14 = 1;
          goto LABEL_21;
        }
        if (!a4) {
          goto LABEL_20;
        }
        +[NSString stringWithFormat:@"Failed to apply config object, tailspin enablement state will not change (enabled = %{BOOL}d)", 1];
      }
      else
      {
        persistAndUnredactLogs(0);
        +[PLPreferences removeKey:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"EPLEnabled"] domain:a5];
        +[PLPreferences removeKey:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"HangTracerEnableAppActivationLogging"] domain:@"com.apple.hangtracer"];
        +[PLPreferences removeKey:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"HangTracerEnabled"] domain:a5];
        +[PLPreferences removeKey:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"HangTracerEnableTailspin"] domain:a5];
        +[PLPreferences removeKey:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"HangTracerEnableSignpostMonitoring"] domain:a5];
        +[PLPreferences removeKey:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"HangTracerEnableWorkflowResponsiveness"] domain:a5];
        +[PLPreferences removeKey:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"HangTracerCollectOSSignpostsDeferred"] domain:a5];
        +[PLPreferences removeKey:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"HangTracerKeepTailspinsWithFormat"] domain:a5];
        +[PLPreferences removeKey:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"HangTracerSavedTailspinsMaxMB"] domain:a5];
        +[PLPreferences removeKey:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"HangTracerShouldUploadToDiagPipe"] domain:a5];
        +[PLPreferences removeKey:[(PerformanceLoggingDiagnosticExtensionExtension *)self keyWithPrefix:@"EPLTimeoutTimestampSec"] domain:a5];
        if (configureTailspinForEPL(0)) {
          goto LABEL_11;
        }
        if (!a4) {
          goto LABEL_20;
        }
        +[NSString stringWithFormat:@"Failed to apply config object, tailspin enablement state will not change (enabled = %{BOOL}d)", 0];
      int v16 = };
      uint64_t v17 = +[NSDictionary dictionaryWithObject:v16 forKey:NSLocalizedDescriptionKey];
      *a4 = +[NSError errorWithDomain:@"EPLErrorDomain" code:3 userInfo:v17];
    }
    else if (a4)
    {
      int v15 = +[NSDictionary dictionaryWithObject:@"Enhanced Performance Logging key not found in parameters" forKey:NSLocalizedDescriptionKey];
      *a4 = +[NSError errorWithDomain:@"EPLErrorDomain" code:2 userInfo:v15];
    }
LABEL_20:
    BOOL v14 = 0;
    goto LABEL_21;
  }
  if (a4)
  {
    v11 = +[NSDictionary dictionaryWithObject:@"Parameters dictionary is nil" forKey:NSLocalizedDescriptionKey];
    +[NSError errorWithDomain:@"EPLErrorDomain" code:1 userInfo:v11];
    BOOL v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

    goto LABEL_22;
  }
  BOOL v14 = 0;
LABEL_22:

  return v14;
}

- (BOOL)setEPLKeysForParameters:(id)a3 error:(id *)a4
{
  return [(PerformanceLoggingDiagnosticExtensionExtension *)self setEPLKeysForParameters:a3 error:a4 domain:@"com.apple.da"];
}

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  if (qword_100016030 != -1) {
    dispatch_once(&qword_100016030, &stru_1000104B8);
  }
  [(id)qword_100016010 lock];
  if (byte_100016038)
  {
    id v5 = shared_pl_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PLDE is already handling a request...ignoring this request", buf, 2u);
    }

    [(id)qword_100016010 unlock];
    v6 = &__NSArray0__struct;
  }
  else
  {
    byte_100016038 = 1;
    [(id)qword_100016010 unlock];
    id v23 = 0;
    [(PerformanceLoggingDiagnosticExtensionExtension *)self setEPLKeysForParameters:v4 error:&v23];
    id v7 = v23;
    id v8 = shared_pl_log_handle();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [v7 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }
      [(id)qword_100016010 lock];
      byte_100016038 = 0;
      [(id)qword_100016010 unlock];
      v6 = &__NSArray0__struct;
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = [v4 objectForKeyedSubscript:@"EnableEnhancedPerformanceLogging"];
        *(_DWORD *)buf = 138412290;
        v25 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Posting notification regarding EPL state change: %@", buf, 0xCu);
      }
      notify_post(EPL_STATE_CHANGED_NOTIFICATION);
      id v12 = [v4 objectForKeyedSubscript:@"EnableEnhancedPerformanceLogging"];
      if (v12)
      {
        double v13 = [v4 objectForKeyedSubscript:@"EnableEnhancedPerformanceLogging"];
        unsigned __int8 v14 = [v13 BOOLValue];

        if (v14)
        {
          id v12 = 0;
        }
        else
        {
          int v15 = [(PerformanceLoggingDiagnosticExtensionExtension *)self sysdiagnoseParamsFromDEParams:v4];
          id v22 = 0;
          id v12 = [(PerformanceLoggingDiagnosticExtensionExtension *)self takeSysdiagnose:v15 error:&v22];
          id v16 = v22;
          if (v16)
          {
            uint64_t v17 = shared_pl_log_handle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v18 = [v16 localizedDescription];
              *(_DWORD *)buf = 138412290;
              v25 = v18;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to take sysdiagnose with error: %@", buf, 0xCu);
            }
          }
          [(PerformanceLoggingDiagnosticExtensionExtension *)self enableReportMemoryException:0];
          cleanupDiagnosticLogsDirectory(@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/HangTracer/");
        }
      }
      v6 = +[NSMutableArray array];
      if (v12)
      {
        v19 = shared_pl_log_handle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Constructing DEAttachmentItem for sysdiagnose file", buf, 2u);
        }

        id v20 = +[DEAttachmentItem attachmentWithPath:v12];
        [v20 setDeleteOnAttach:&__kCFBooleanTrue];
        [v6 addObject:v20];
      }
      [(id)qword_100016010 lock];
      byte_100016038 = 0;
      [(id)qword_100016010 unlock];
    }
  }

  return v6;
}

@end