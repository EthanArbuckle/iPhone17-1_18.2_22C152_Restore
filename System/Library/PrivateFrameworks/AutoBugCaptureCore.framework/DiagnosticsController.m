@interface DiagnosticsController
+ (id)loggingStateCache;
+ (void)initialize;
- (BOOL)_loadLoggingSupport;
- (BOOL)validateActionsDictionary:(id)a3;
- (BOOL)validateActionsDictionaryContent:(id)a3 identifier:(id)a4;
- (BOOL)validateDiagnosticsConfiguration:(id)a3;
- (BOOL)validateOSLogPreferencesProtocol:(id)a3;
- (BOOL)validateSettingsDictionary:(id)a3;
- (BOOL)validateSettingsNodeContents:(id)a3 identifier:(id)a4;
- (BOOL)validateSettingsNodeDictionary:(id)a3 identifier:(id)a4 isDefault:(BOOL)a5;
- (DiagnosticsController)initWithConfiguration:(id)a3;
- (NSMutableDictionary)actionsDict;
- (NSMutableDictionary)settingsDict;
- (NSNumber)autoBugCaptureGID;
- (NSNumber)autoBugCaptureUID;
- (NSString)autoBugCapturePath;
- (id)actionsDictionaryForProcess:(id)a3 logLevel:(id)a4 diagnosticExtensions:(id)a5;
- (id)consolidatedLogLevelSetsFromActions:(id)a3;
- (id)defaultsDictionaryWithAlwaysRunActions:(id)a3;
- (id)diagActionsForSignature:(id)a3;
- (id)diagActionsForSignature:(id)a3 commonActions:(id)a4;
- (id)diagExtensionCollector;
- (id)diagnosticExtensionsForDiagnosticCase:(id)a3 enableCommonActions:(id)a4;
- (unint64_t)collectDiagnosticExtensionFilesForDiagnosticCase:(id)a3 parameters:(id)a4 options:(id)a5 queue:(id)a6 reply:(id)a7;
- (void)applyLogLevel:(id)a3 forIdentifier:(id)a4 logSettingType:(unint64_t)a5;
- (void)applyLogLevelSets:(id)a3;
- (void)configureWithDiagnosticActions:(id)a3;
- (void)consolidateLoggingLevelsIntoSet:(id)a3 withCurrentState:(id)a4;
- (void)dealloc;
- (void)lowerLoggingForDiagnosticCase:(id)a3;
- (void)lowerLoggingForIdentifier:(id)a3;
- (void)raiseLoggingForActions:(id)a3 identifier:(id)a4;
- (void)raiseLoggingForDiagnosticCase:(id)a3;
- (void)setActionsDict:(id)a3;
- (void)setAutoBugCaptureGID:(id)a3;
- (void)setAutoBugCapturePath:(id)a3;
- (void)setAutoBugCaptureUID:(id)a3;
- (void)setSettingsDict:(id)a3;
@end

@implementation DiagnosticsController

+ (void)initialize
{
  v5[3] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26BDF5900;
  v4[1] = &unk_26BDF5918;
  v5[0] = @"process";
  v5[1] = @"subsystem";
  v4[2] = &unk_26BDF5930;
  v5[2] = @"category";
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  v3 = (void *)LogSettingToString;
  LogSettingToString = v2;
}

- (DiagnosticsController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DiagnosticsController;
  v5 = [(DiagnosticsController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(DiagnosticsController *)v5 configureWithDiagnosticActions:v4];
  }

  return v6;
}

- (void)dealloc
{
  if (gLoggingSupportDyLibHandle)
  {
    dlclose((void *)gLoggingSupportDyLibHandle);
    gLoggingSupportDyLibHandle = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)DiagnosticsController;
  [(DiagnosticsController *)&v3 dealloc];
}

- (BOOL)_loadLoggingSupport
{
  if (_loadLoggingSupport_symbolLoadOnce != -1) {
    dispatch_once(&_loadLoggingSupport_symbolLoadOnce, &__block_literal_global_8);
  }
  return _loadLoggingSupport_symbolsLoaded;
}

void __44__DiagnosticsController__loadLoggingSupport__block_invoke()
{
  gLoggingSupportDyLibHandle = (uint64_t)dlopen("/System/Library/PrivateFrameworks/LoggingSupport.framework/LoggingSupport", 6);
  if (!gLoggingSupportDyLibHandle)
  {
    v6 = diagcollectLogHandle();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    __int16 v11 = 0;
    v7 = "Failed to load LoggingSupport.framework";
    objc_super v8 = (uint8_t *)&v11;
LABEL_21:
    v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_22;
  }
  gOSLogPreferencesManager = (uint64_t)objc_getClass("OSLogPreferencesManager");
  gOSLogPreferencesSubsystem = (uint64_t)objc_getClass("OSLogPreferencesSubsystem");
  gOSLogPreferencesProcess = (uint64_t)objc_getClass("OSLogPreferencesProcess");
  Class Class = objc_getClass("OSLogPreferencesCategory");
  gOSLogPreferencesCategory = (uint64_t)Class;
  if (gOSLogPreferencesManager) {
    BOOL v1 = gOSLogPreferencesSubsystem == 0;
  }
  else {
    BOOL v1 = 1;
  }
  int v4 = !v1 && gOSLogPreferencesProcess != 0 && Class != 0;
  _loadLoggingSupport_symbolsLoaded = v4;
  v5 = diagcollectLogHandle();
  v6 = v5;
  if (v4 != 1)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v7 = "Failed to load OSLogPreferences* classes from LoggingSupport.framework";
    objc_super v8 = buf;
    goto LABEL_21;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    __int16 v13 = 0;
    v7 = "Successfully loaded OSLogPreferences* classes from LoggingSupport.framework.";
    objc_super v8 = (uint8_t *)&v13;
    v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_INFO;
LABEL_22:
    _os_log_impl(&dword_209DBA000, v9, v10, v7, v8, 2u);
  }
LABEL_23:
}

- (void)configureWithDiagnosticActions:(id)a3
{
  id v4 = a3;
  v5 = +[ABCAdministrator sharedInstance];
  v6 = [v5 configurationManager];
  int v7 = [v6 autoBugCaptureRegularPayloads];

  if (v7)
  {
    if ([(DiagnosticsController *)self validateDiagnosticsConfiguration:v4])
    {
      objc_super v8 = (void *)MEMORY[0x263EFF9A0];
      v9 = [v4 objectForKeyedSubscript:@"DIAGNOSTIC_ACTIONS"];
      os_log_type_t v10 = [v8 dictionaryWithDictionary:v9];
      actionsDict = self->_actionsDict;
      self->_actionsDict = v10;

      v12 = (void *)MEMORY[0x263EFF9A0];
      __int16 v13 = [v4 objectForKeyedSubscript:@"DIAGNOSTIC_SETTINGS"];
      v14 = [v12 dictionaryWithDictionary:v13];
      settingsDict = self->_settingsDict;
      self->_settingsDict = v14;
    }
  }
  else
  {
    v16 = diagcollectLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_DEFAULT, "Not configuring for platforms without payloads", v17, 2u);
    }
  }
}

- (BOOL)validateDiagnosticsConfiguration:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"DIAGNOSTIC_ACTIONS"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v6 = [(DiagnosticsController *)self validateActionsDictionary:v5];
    int v7 = diagcollectLogHandle();
    objc_super v8 = v7;
    if (v6)
    {
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_11;
      }
      LOWORD(v24) = 0;
      v9 = "Finished validating actions dictionary.";
      os_log_type_t v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
    }
    else
    {
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      LOWORD(v24) = 0;
      v9 = "Validation Failure: Errors detected while validating actions dictionary!";
      os_log_type_t v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_209DBA000, v10, v11, v9, (uint8_t *)&v24, 2u);
  }
  else
  {
    objc_super v8 = diagcollectLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      __int16 v13 = NSStringFromClass(v12);
      int v24 = 138412546;
      v25 = v5;
      __int16 v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_ERROR, "Unexpected object %@ (%@) found for actions dictionary!", (uint8_t *)&v24, 0x16u);
    }
    LOBYTE(v6) = 0;
  }
LABEL_11:

  v14 = [v4 objectForKeyedSubscript:@"DIAGNOSTIC_SETTINGS"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v15 = [(DiagnosticsController *)self validateSettingsDictionary:v14];
    v16 = diagcollectLogHandle();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v24) = 0;
        v18 = "Finished validating settings dictionary.";
        v19 = v17;
        os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
LABEL_20:
        _os_log_impl(&dword_209DBA000, v19, v20, v18, (uint8_t *)&v24, 2u);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      v18 = "Validation Failure: Errors detected while validating settings dictionary!";
      v19 = v17;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      goto LABEL_20;
    }
  }
  else
  {
    v17 = diagcollectLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      int v24 = 138412546;
      v25 = v14;
      __int16 v26 = 2112;
      v27 = v22;
      _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_ERROR, "Unexpected object %@ (%@) found for settings dictionary!", (uint8_t *)&v24, 0x16u);
    }
    LOBYTE(v15) = 0;
  }

  return v6 && v15;
}

- (BOOL)validateActionsDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [a3 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    char v8 = 1;
    v9 = &dword_209DBA000;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        os_log_type_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = v11;
          if ([v12 length])
          {
            __int16 v13 = [(NSMutableDictionary *)self->_actionsDict objectForKeyedSubscript:v12];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [(DiagnosticsController *)self validateActionsDictionaryContent:v13 identifier:v12];
            }
            else if (v13)
            {
              v16 = v4;
              v17 = self;
              v18 = v9;
              v19 = diagcollectLogHandle();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                os_log_type_t v20 = (objc_class *)objc_opt_class();
                v21 = NSStringFromClass(v20);
                *(_DWORD *)buf = 138412290;
                uint64_t v28 = v21;
                _os_log_impl(v18, v19, OS_LOG_TYPE_DEBUG, "Found unexpected class for actions value: %@ (should be NSDictionary)", buf, 0xCu);
              }
              char v8 = 0;
              v9 = v18;
              self = v17;
              id v4 = v16;
            }
          }
          else
          {
            __int16 v13 = diagcollectLogHandle();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(v9, v13, OS_LOG_TYPE_DEBUG, "Actions identifiers must not be empty", buf, 2u);
            }
            char v8 = 0;
          }
        }
        else
        {
          if (!v11) {
            continue;
          }
          v12 = diagcollectLogHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            v14 = (objc_class *)objc_opt_class();
            BOOL v15 = NSStringFromClass(v14);
            *(_DWORD *)buf = 138412290;
            uint64_t v28 = v15;
            _os_log_impl(v9, v12, OS_LOG_TYPE_DEBUG, "Found unexpected class for actions identifier: %@ (should be NSString)", buf, 0xCu);
          }
          char v8 = 0;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (!v6) {
        goto LABEL_27;
      }
    }
  }
  char v8 = 1;
LABEL_27:

  return v8 & 1;
}

- (BOOL)validateActionsDictionaryContent:(id)a3 identifier:(id)a4
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v67 = a4;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v6 = [v5 allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v77 objects:v91 count:16];
  if (!v7)
  {
    char v9 = 1;
    goto LABEL_121;
  }
  uint64_t v8 = v7;
  char v9 = 1;
  uint64_t v10 = *(void *)v78;
  id v62 = v5;
  uint64_t v63 = *(void *)v78;
  v61 = v6;
  do
  {
    uint64_t v11 = 0;
    uint64_t v64 = v8;
    do
    {
      if (*(void *)v78 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v66 = v11;
      v12 = *(void **)(*((void *)&v77 + 1) + 8 * v11);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v13 = v12;
        v14 = [v5 objectForKeyedSubscript:v13];
        v65 = v14;
        if ([v13 isEqualToString:@"oslog"])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v68 = v13;
            BOOL v15 = v14;
            long long v73 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            long long v76 = 0u;
            v16 = [v15 allKeys];
            uint64_t v17 = [v16 countByEnumeratingWithState:&v73 objects:v90 count:16];
            if (!v17) {
              goto LABEL_54;
            }
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v74;
            while (1)
            {
              uint64_t v20 = 0;
              do
              {
                if (*(void *)v74 != v19) {
                  objc_enumerationMutation(v16);
                }
                v21 = *(void **)(*((void *)&v73 + 1) + 8 * v20);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v22 = v21;
                  long long v23 = v15;
                  long long v24 = [v15 objectForKeyedSubscript:v22];
                  if ([v22 isEqualToString:@"level"])
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v25 = v24;
                      if ([v25 length])
                      {
                        if (([v25 isEqualToString:@"default"] & 1) == 0
                          && ([v25 isEqualToString:@"info"] & 1) == 0
                          && ([v25 isEqualToString:@"debug"] & 1) == 0
                          && ([v25 isEqualToString:@"none"] & 1) == 0)
                        {
                          long long v26 = diagcollectLogHandle();
                          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412290;
                            v83 = v25;
                            _os_log_impl(&dword_209DBA000, v26, OS_LOG_TYPE_DEBUG, "Unknown OSLog level: %@", buf, 0xCu);
                          }
                          goto LABEL_45;
                        }
                      }
                      else
                      {
                        long long v26 = diagcollectLogHandle();
                        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_209DBA000, v26, OS_LOG_TYPE_DEBUG, "OSLog level setting must not be empty", buf, 2u);
                        }
                        char v9 = 0;
LABEL_45:
                      }
LABEL_46:

LABEL_47:
                      BOOL v15 = v23;
                      goto LABEL_48;
                    }
                    if (!v24) {
                      goto LABEL_47;
                    }
                    long long v25 = diagcollectLogHandle();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                    {
LABEL_40:
                      uint64_t v30 = (objc_class *)objc_opt_class();
                      v31 = NSStringFromClass(v30);
                      *(_DWORD *)buf = 138413058;
                      v83 = v67;
                      __int16 v84 = 2112;
                      v85 = v68;
                      __int16 v86 = 2112;
                      v87 = v22;
                      __int16 v88 = 2112;
                      v89 = v31;
                      _os_log_impl(&dword_209DBA000, v25, OS_LOG_TYPE_DEBUG, "Found unexpected class for value of oslog settings key %@.%@.%@: %@ (should be NSString)", buf, 0x2Au);
                    }
                  }
                  else if (([v22 isEqualToString:@"process"] & 1) != 0 {
                         || ([v22 isEqualToString:@"category"] & 1) != 0
                  }
                         || [v22 isEqualToString:@"subsystem"])
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v25 = v24;
                      if (![v25 length])
                      {
                        v29 = diagcollectLogHandle();
                        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412290;
                          v83 = v22;
                          _os_log_impl(&dword_209DBA000, v29, OS_LOG_TYPE_DEBUG, "OSLog %@ identifier must not be empty", buf, 0xCu);
                        }

                        char v9 = 0;
                      }
                      goto LABEL_46;
                    }
                    long long v25 = diagcollectLogHandle();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
                      goto LABEL_40;
                    }
                  }
                  else
                  {
                    long long v25 = diagcollectLogHandle();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412802;
                      v83 = v67;
                      __int16 v84 = 2112;
                      v85 = v68;
                      __int16 v86 = 2112;
                      v87 = v22;
                      _os_log_impl(&dword_209DBA000, v25, OS_LOG_TYPE_DEBUG, "Found unsupported oslog settings key: %@.%@.%@", buf, 0x20u);
                    }
                  }
                  char v9 = 0;
                  goto LABEL_46;
                }
                if (!v21) {
                  goto LABEL_49;
                }
                v22 = diagcollectLogHandle();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                {
                  v27 = (objc_class *)objc_opt_class();
                  uint64_t v28 = NSStringFromClass(v27);
                  *(_DWORD *)buf = 138412802;
                  v83 = v67;
                  __int16 v84 = 2112;
                  v85 = v68;
                  __int16 v86 = 2112;
                  v87 = v28;
                  _os_log_impl(&dword_209DBA000, v22, OS_LOG_TYPE_DEBUG, "Found unexpected class for oslog settings key in %@.%@: %@ (should be NSString)", buf, 0x20u);
                }
                char v9 = 0;
LABEL_48:

LABEL_49:
                ++v20;
              }
              while (v18 != v20);
              uint64_t v32 = [v16 countByEnumeratingWithState:&v73 objects:v90 count:16];
              uint64_t v18 = v32;
              if (!v32)
              {
LABEL_54:

                uint64_t v6 = v61;
                id v5 = v62;
                uint64_t v10 = v63;
                uint64_t v8 = v64;
                goto LABEL_55;
              }
            }
          }
          if (!v14) {
            goto LABEL_110;
          }
          BOOL v15 = diagcollectLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            v39 = (objc_class *)objc_opt_class();
            NSStringFromClass(v39);
            v41 = v40 = v13;
            *(_DWORD *)buf = 138412802;
            v83 = v67;
            __int16 v84 = 2112;
            v85 = v40;
            __int16 v86 = 2112;
            v87 = v41;
            v42 = v15;
            v43 = "Found unexpected class for value of actions key %@.%@: %@ (should be NSDictionary)";
            goto LABEL_107;
          }
          goto LABEL_108;
        }
        if ([v13 isEqualToString:@"process"])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v14 length]) {
              goto LABEL_110;
            }
            BOOL v15 = diagcollectLogHandle();
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_108;
            }
            *(_WORD *)buf = 0;
            v36 = v15;
            v37 = "OSLog process identifier must not be empty";
            uint32_t v38 = 2;
LABEL_103:
            _os_log_impl(&dword_209DBA000, v36, OS_LOG_TYPE_DEBUG, v37, buf, v38);
            goto LABEL_108;
          }
          if (!v14) {
            goto LABEL_110;
          }
          BOOL v15 = diagcollectLogHandle();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_108;
          }
LABEL_106:
          v58 = (objc_class *)objc_opt_class();
          NSStringFromClass(v58);
          v41 = v40 = v13;
          *(_DWORD *)buf = 138412802;
          v83 = v67;
          __int16 v84 = 2112;
          v85 = v40;
          __int16 v86 = 2112;
          v87 = v41;
          v42 = v15;
          v43 = "Found unexpected class for value of actions key %@.%@: %@ (should be NSString)";
LABEL_107:
          _os_log_impl(&dword_209DBA000, v42, OS_LOG_TYPE_DEBUG, v43, buf, 0x20u);

          __int16 v13 = v40;
LABEL_108:
          char v9 = 0;
          goto LABEL_109;
        }
        if ([v13 isEqualToString:@"level"])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v14) {
              goto LABEL_110;
            }
            BOOL v15 = diagcollectLogHandle();
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_108;
            }
            goto LABEL_106;
          }
          BOOL v15 = v14;
          if ([v15 length])
          {
            if (([v15 isEqualToString:@"default"] & 1) != 0
              || ([v15 isEqualToString:@"info"] & 1) != 0
              || ([v15 isEqualToString:@"debug"] & 1) != 0
              || ([v15 isEqualToString:@"none"] & 1) != 0)
            {
              goto LABEL_109;
            }
            v44 = v15;
            v45 = v13;
            v46 = diagcollectLogHandle();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v83 = v44;
              v47 = v46;
              v48 = "Unsupported OSLog level: %@";
              uint32_t v49 = 12;
              goto LABEL_116;
            }
          }
          else
          {
            v44 = v15;
            v45 = v13;
            v46 = diagcollectLogHandle();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              v47 = v46;
              v48 = "OSLog level setting must not be empty";
              uint32_t v49 = 2;
LABEL_116:
              _os_log_impl(&dword_209DBA000, v47, OS_LOG_TYPE_DEBUG, v48, buf, v49);
            }
          }

          char v9 = 0;
          __int16 v13 = v45;
          BOOL v15 = v44;
          goto LABEL_109;
        }
        if (![v13 isEqualToString:@"diagExt"])
        {
          BOOL v15 = diagcollectLogHandle();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_108;
          }
          *(_DWORD *)buf = 138412546;
          v83 = v67;
          __int16 v84 = 2112;
          v85 = v13;
          v36 = v15;
          v37 = "Found unsupported actions key: %@.%@";
          uint32_t v38 = 22;
          goto LABEL_103;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v14) {
            goto LABEL_110;
          }
          BOOL v15 = diagcollectLogHandle();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_108;
          }
          goto LABEL_106;
        }
        v68 = v13;
        BOOL v15 = v14;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        uint64_t v50 = [v15 countByEnumeratingWithState:&v69 objects:v81 count:16];
        if (!v50) {
          goto LABEL_55;
        }
        uint64_t v51 = v50;
        uint64_t v52 = *(void *)v70;
        while (2)
        {
          uint64_t v53 = 0;
LABEL_85:
          if (*(void *)v70 != v52) {
            objc_enumerationMutation(v15);
          }
          v54 = *(void **)(*((void *)&v69 + 1) + 8 * v53);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (![v54 length])
            {
              v55 = diagcollectLogHandle();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_209DBA000, v55, OS_LOG_TYPE_DEBUG, "Diagnostic Extension identifiers must not be empty", buf, 2u);
              }
              goto LABEL_94;
            }
          }
          else if (v54)
          {
            v55 = diagcollectLogHandle();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            {
              v56 = (objc_class *)objc_opt_class();
              v57 = NSStringFromClass(v56);
              *(_DWORD *)buf = 138412290;
              v83 = v57;
              _os_log_impl(&dword_209DBA000, v55, OS_LOG_TYPE_DEBUG, "Found unexpected class for Diagnostic Extension identifiers: %@ (should be NSString)", buf, 0xCu);
            }
LABEL_94:

            char v9 = 0;
          }
          if (v51 == ++v53)
          {
            uint64_t v51 = [v15 countByEnumeratingWithState:&v69 objects:v81 count:16];
            if (!v51)
            {
              uint64_t v10 = v63;
              uint64_t v8 = v64;
LABEL_55:
              __int16 v13 = v68;
LABEL_109:

              v14 = v65;
LABEL_110:

LABEL_111:
              goto LABEL_112;
            }
            continue;
          }
          goto LABEL_85;
        }
      }
      if (v12)
      {
        v33 = diagcollectLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          v34 = (objc_class *)objc_opt_class();
          v35 = NSStringFromClass(v34);
          *(_DWORD *)buf = 138412546;
          v83 = v67;
          __int16 v84 = 2112;
          v85 = v35;
          _os_log_impl(&dword_209DBA000, v33, OS_LOG_TYPE_DEBUG, "Found unexpected class for actions key %@: %@ (should be NSString)", buf, 0x16u);
        }
        char v9 = 0;
        __int16 v13 = v33;
        goto LABEL_111;
      }
LABEL_112:
      uint64_t v11 = v66 + 1;
    }
    while (v66 + 1 != v8);
    uint64_t v59 = [v6 countByEnumeratingWithState:&v77 objects:v91 count:16];
    uint64_t v8 = v59;
  }
  while (v59);
LABEL_121:

  return v9 & 1;
}

- (BOOL)validateSettingsDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [a3 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    BOOL v8 = 1;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = v10;
          v12 = [(NSMutableDictionary *)self->_settingsDict objectForKeyedSubscript:v11];
          if ([v11 length])
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              __int16 v13 = v12;
              BOOL v8 = [(DiagnosticsController *)self validateSettingsNodeDictionary:v13 identifier:v11 isDefault:[v11 isEqualToString:@"DEFAULTS"]];
              goto LABEL_20;
            }
            if (v12)
            {
              __int16 v13 = diagcollectLogHandle();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                v16 = (objc_class *)objc_opt_class();
                uint64_t v17 = NSStringFromClass(v16);
                *(_DWORD *)buf = 138412546;
                long long v24 = v11;
                __int16 v25 = 2112;
                long long v26 = v17;
                _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEBUG, "Found unexpected class for settings domain node %@: %@ (should be NSDictionary)", buf, 0x16u);
              }
LABEL_19:
              BOOL v8 = 0;
LABEL_20:
            }
            goto LABEL_22;
          }
          __int16 v13 = diagcollectLogHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEBUG, "Settings domain identifier must not be empty", buf, 2u);
          }
          goto LABEL_19;
        }
        if (!v10) {
          continue;
        }
        uint64_t v11 = diagcollectLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v14 = (objc_class *)objc_opt_class();
          BOOL v15 = NSStringFromClass(v14);
          *(_DWORD *)buf = 138412290;
          long long v24 = v15;
          _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEBUG, "Found unexpected class for settings domain identifier: %@ (should be NSString)", buf, 0xCu);
        }
        BOOL v8 = 0;
LABEL_22:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (!v6) {
        goto LABEL_27;
      }
    }
  }
  BOOL v8 = 1;
LABEL_27:

  return v8;
}

- (BOOL)validateSettingsNodeDictionary:(id)a3 identifier:(id)a4 isDefault:(BOOL)a5
{
  BOOL v32 = a5;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (__CFString *)a4;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [v6 allKeys];
  uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 1;
    uint64_t v11 = *(void *)v35;
    id v31 = v6;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(obj);
        }
        __int16 v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v14 = v13;
          BOOL v15 = [v6 objectForKeyedSubscript:v14];
          if (![v14 length])
          {
            v16 = diagcollectLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v7;
              _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_DEBUG, "Found empty key in node %@", buf, 0xCu);
            }
            goto LABEL_31;
          }
          if (v32)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v15)
              {
                v16 = diagcollectLogHandle();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v17 = (objc_class *)objc_opt_class();
                  uint64_t v18 = NSStringFromClass(v17);
                  *(_DWORD *)buf = 138412802;
                  v39 = v7;
                  __int16 v40 = 2112;
                  v41 = v14;
                  __int16 v42 = 2112;
                  v43 = v18;
                  long long v19 = v16;
                  long long v20 = "Found unexpected class for value of default node key %@.%@: %@ (should be NSArray)";
                  goto LABEL_30;
                }
                goto LABEL_31;
              }
LABEL_33:

              goto LABEL_34;
            }
LABEL_25:
            v27 = NSString;
            id v25 = v15;
            v16 = [v27 stringWithFormat:@"%@.%@", v7, v14];
            BOOL v26 = [(DiagnosticsController *)self validateSettingsNodeContents:v25 identifier:v16];
LABEL_26:
            char v10 = v26;

            id v6 = v31;
          }
          else
          {
            if ([v14 isEqualToString:@"alwaysRun"])
            {
              long long v23 = diagcollectLogHandle();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v39 = @"alwaysRun";
                __int16 v40 = 2112;
                v41 = v7;
                __int16 v42 = 2112;
                v43 = v14;
                _os_log_impl(&dword_209DBA000, v23, OS_LOG_TYPE_DEBUG, "Warning: Node key %@ is reserved for default dictionaries. (Found at %@.%@)", buf, 0x20u);
              }

              char v10 = 0;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v24 = NSString;
              id v25 = v15;
              v16 = [v24 stringWithFormat:@"%@.%@", v7, v14];
              BOOL v26 = [(DiagnosticsController *)self validateSettingsNodeDictionary:v25 identifier:v16 isDefault:[v14 isEqualToString:@"DEFAULTS"]];
              goto LABEL_26;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              goto LABEL_25;
            }
            if (!v15) {
              goto LABEL_33;
            }
            v16 = diagcollectLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v28 = (objc_class *)objc_opt_class();
              uint64_t v18 = NSStringFromClass(v28);
              *(_DWORD *)buf = 138412802;
              v39 = v7;
              __int16 v40 = 2112;
              v41 = v14;
              __int16 v42 = 2112;
              v43 = v18;
              long long v19 = v16;
              long long v20 = "Found unexpected class for value of node key %@.%@: %@ (should be NSArray or NSDictionary)";
LABEL_30:
              _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_DEBUG, v20, buf, 0x20u);

              id v6 = v31;
            }
LABEL_31:
            char v10 = 0;
          }

          goto LABEL_33;
        }
        v14 = diagcollectLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          long long v21 = (objc_class *)objc_opt_class();
          long long v22 = NSStringFromClass(v21);
          *(_DWORD *)buf = 138412546;
          v39 = v7;
          __int16 v40 = 2112;
          v41 = v22;
          _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_DEBUG, "Found unexpected class for key in node %@: %@ (should be NSString)", buf, 0x16u);
        }
        char v10 = 0;
LABEL_34:
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (!v9) {
        goto LABEL_38;
      }
    }
  }
  char v10 = 1;
LABEL_38:

  return v10 & 1;
}

- (BOOL)validateSettingsNodeContents:(id)a3 identifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    char v10 = 1;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v12 length]) {
            continue;
          }
          __int16 v13 = diagcollectLogHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v22 = v6;
            _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEBUG, "Action identifiers must not be empty. (%@)", buf, 0xCu);
          }
        }
        else
        {
          __int16 v13 = diagcollectLogHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v14 = (objc_class *)objc_opt_class();
            BOOL v15 = NSStringFromClass(v14);
            *(_DWORD *)buf = 138412546;
            id v22 = v6;
            __int16 v23 = 2112;
            long long v24 = v15;
            _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEBUG, "Found unexpected class for action identifiers in node key %@: %@ (should be NSString)", buf, 0x16u);
          }
        }

        char v10 = 0;
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (!v8) {
        goto LABEL_17;
      }
    }
  }
  char v10 = 1;
LABEL_17:

  return v10 & 1;
}

+ (id)loggingStateCache
{
  if (loggingStateCache_m_pred != -1) {
    dispatch_once(&loggingStateCache_m_pred, &__block_literal_global_126);
  }
  uint64_t v2 = (void *)loggingStateCache_stateDict;

  return v2;
}

uint64_t __42__DiagnosticsController_loggingStateCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v1 = loggingStateCache_stateDict;
  loggingStateCache_stateDict = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (id)diagExtensionCollector
{
  deCollector = self->deCollector;
  if (!deCollector)
  {
    id v4 = +[ABCAdministrator sharedInstance];
    id v5 = [v4 configurationManager];

    id v6 = [DiagnosticExtensionController alloc];
    uint64_t v7 = [v5 logArchivePath];
    uint64_t v8 = [(DiagnosticExtensionController *)v6 initWithDestinationDirectory:v7];
    uint64_t v9 = self->deCollector;
    self->deCollector = v8;

    deCollector = self->deCollector;
  }

  return deCollector;
}

- (id)defaultsDictionaryWithAlwaysRunActions:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  if ([v3 count]) {
    [v4 setObject:v3 forKey:@"alwaysRun"];
  }

  return v4;
}

- (id)actionsDictionaryForProcess:(id)a3 logLevel:(id)a4 diagnosticExtensions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v11 = [v7 length];
  if (v8 && v11)
  {
    [v10 setObject:v7 forKey:@"process"];
    [v10 setObject:v8 forKey:@"level"];
  }
  if ([v9 count]) {
    [v10 setObject:v9 forKey:@"diagExt"];
  }

  return v10;
}

- (id)consolidatedLogLevelSetsFromActions:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DiagnosticsController *)self actionsDict];
  id v51 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = diagcollectLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v63 = (__CFString *)[v4 count];
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEBUG, "Consolidating log levels from %ld actions", buf, 0xCu);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v59;
    uint64_t v52 = v5;
    uint64_t v54 = *(void *)v59;
    do
    {
      uint64_t v10 = 0;
      uint64_t v53 = v8;
      do
      {
        if (*(void *)v59 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v58 + 1) + 8 * v10)];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = v11;
          uint64_t v13 = [v12 objectForKeyedSubscript:@"process"];
          uint64_t v14 = [v12 objectForKeyedSubscript:@"level"];
          objc_opt_class();
          uint64_t v57 = v14;
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = (id)v14;
              id v16 = (id)v13;
              long long v17 = [v51 objectForKeyedSubscript:@"process"];
              if (!v17)
              {
                long long v17 = [MEMORY[0x263EFF9A0] dictionary];
                [v51 setObject:v17 forKeyedSubscript:@"process"];
              }
              long long v18 = [v17 objectForKeyedSubscript:v16];
              long long v19 = [v15 maximumLogLevelString:v18];

              [v17 setObject:v19 forKeyedSubscript:v16];
              id v5 = v52;
              uint64_t v8 = v53;
              uint64_t v14 = v57;
              goto LABEL_20;
            }
          }
          if (v13 | v14)
          {
            long long v17 = diagcollectLogHandle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              id v22 = (objc_class *)objc_opt_class();
              __int16 v23 = NSStringFromClass(v22);
              long long v24 = (objc_class *)objc_opt_class();
              id v25 = NSStringFromClass(v24);
              *(_DWORD *)buf = 138413058;
              uint64_t v63 = @"process";
              __int16 v64 = 2112;
              v65 = @"level";
              __int16 v66 = 2112;
              v67 = v23;
              __int16 v68 = 2112;
              long long v69 = v25;
              _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_DEBUG, "Found unexpected class for keys %@,%@ in the action dictionary (should be NSString): %@,%@", buf, 0x2Au);

              uint64_t v8 = v53;
            }
LABEL_20:
          }
          uint64_t v26 = [v12 objectForKeyedSubscript:@"oslog"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v26)
            {
              v27 = diagcollectLogHandle();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                long long v36 = (objc_class *)objc_opt_class();
                NSStringFromClass(v36);
                long long v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                uint64_t v63 = @"oslog";
                __int16 v64 = 2112;
                v65 = v37;
                _os_log_impl(&dword_209DBA000, v27, OS_LOG_TYPE_DEBUG, "Found unexpected class for key %@ in the action dictionary (should be NSDictionary): %@", buf, 0x16u);
              }
              goto LABEL_54;
            }
LABEL_55:

            uint64_t v9 = v54;
            goto LABEL_56;
          }
          v27 = v26;
          uint64_t v28 = [v27 objectForKeyedSubscript:@"level"];
          v29 = [v27 objectForKeyedSubscript:@"process"];
          uint64_t v30 = [v27 objectForKeyedSubscript:@"category"];
          uint64_t v31 = [v27 objectForKeyedSubscript:@"subsystem"];
          BOOL v32 = (void *)v31;
          v56 = (void *)v30;
          if (!v28)
          {
            v33 = diagcollectLogHandle();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_53;
            }
            *(_WORD *)buf = 0;
            long long v34 = v33;
            long long v35 = "OSLog setting requires a level to be specified.";
LABEL_36:
            _os_log_impl(&dword_209DBA000, v34, OS_LOG_TYPE_DEBUG, v35, buf, 2u);
            goto LABEL_53;
          }
          if (v29 && v31)
          {
            v33 = diagcollectLogHandle();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              long long v34 = v33;
              long long v35 = "OSLog setting should identify a process or subsystem, not both.";
              goto LABEL_36;
            }
LABEL_53:

            id v5 = v52;
            uint64_t v8 = v53;
LABEL_54:

            uint64_t v14 = v57;
            goto LABEL_55;
          }
          if (v30 && !v31)
          {
            v33 = diagcollectLogHandle();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_53;
            }
            *(_WORD *)buf = 0;
            long long v34 = v33;
            long long v35 = "OSLog setting requires a subsystem identifier when specifying a category.";
            goto LABEL_36;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v33 = v28;
            if (v29)
            {
              objc_opt_class();
              isKindOfClass Class = objc_opt_isKindOfClass();
              if (v56)
              {
                if ((isKindOfClass & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (v32)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        goto LABEL_53;
                      }
                    }
                  }
                }
              }
            }
            v46 = v29;
            v39 = v29;
            id v47 = v56;
            id v48 = v32;
            uint64_t v50 = v39;
            if ([(__CFString *)v39 length])
            {
              uint32_t v49 = [v51 objectForKeyedSubscript:@"process"];
              if (!v49)
              {
                uint32_t v49 = [MEMORY[0x263EFF9A0] dictionary];
                objc_msgSend(v51, "setObject:forKeyedSubscript:");
              }
              uint64_t v45 = [v49 objectForKeyedSubscript:v39];
              v44 = -[NSObject maximumLogLevelString:](v33, "maximumLogLevelString:");
              objc_msgSend(v49, "setObject:forKeyedSubscript:");
              v29 = v46;
              goto LABEL_48;
            }
            v29 = v46;
            if ([v48 length])
            {
              if ([v47 length])
              {
                uint32_t v49 = [v51 objectForKeyedSubscript:@"category"];
                if (!v49)
                {
                  uint32_t v49 = [MEMORY[0x263EFF9A0] dictionary];
                  objc_msgSend(v51, "setObject:forKeyedSubscript:");
                }
                uint64_t v45 = [NSString stringWithFormat:@"%@:%@", v47, v48];
                v44 = [v49 objectForKeyedSubscript:v45];
                v43 = -[NSObject maximumLogLevelString:](v33, "maximumLogLevelString:");
                [v49 setObject:v43 forKeyedSubscript:v45];
              }
              else
              {
                uint32_t v49 = [v51 objectForKeyedSubscript:@"subsystem"];
                if (!v49)
                {
                  uint32_t v49 = [MEMORY[0x263EFF9A0] dictionary];
                  objc_msgSend(v51, "setObject:forKeyedSubscript:");
                }
                uint64_t v45 = [v49 objectForKeyedSubscript:v48];
                v44 = -[NSObject maximumLogLevelString:](v33, "maximumLogLevelString:");
                objc_msgSend(v49, "setObject:forKeyedSubscript:");
              }
LABEL_48:
            }
          }
          else
          {
            v33 = diagcollectLogHandle();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_53;
            }
            __int16 v40 = (objc_class *)objc_opt_class();
            NSStringFromClass(v40);
            uint64_t v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            uint64_t v63 = @"level";
            __int16 v64 = 2112;
            v65 = v50;
            _os_log_impl(&dword_209DBA000, v33, OS_LOG_TYPE_DEBUG, "Found unexpected class for key %@ in the oslog settings dictionary (should be NSString): %@", buf, 0x16u);
          }

          goto LABEL_53;
        }
        if (!v11) {
          goto LABEL_57;
        }
        v12 = diagcollectLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          long long v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          long long v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          uint64_t v63 = v21;
          _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEBUG, "Found unexpected class in actions (should be NSDictionary): %@", buf, 0xCu);
        }
LABEL_56:

LABEL_57:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v41 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
      uint64_t v8 = v41;
    }
    while (v41);
  }

  return v51;
}

- (id)diagActionsForSignature:(id)a3
{
  return [(DiagnosticsController *)self diagActionsForSignature:a3 commonActions:0];
}

- (id)diagActionsForSignature:(id)a3 commonActions:(id)a4
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v6 = (__CFString *)a3;
  id v71 = a4;
  uint64_t v7 = [(__CFString *)v6 objectForKeyedSubscript:@"domain"];
  long long v70 = [(__CFString *)v6 objectForKeyedSubscript:@"type"];
  __int16 v68 = [(__CFString *)v6 objectForKeyedSubscript:@"subtype"];
  uint64_t v8 = @"additional";
  v67 = [(__CFString *)v6 objectForKeyedSubscript:@"additional"];
  uint64_t v9 = [(__CFString *)v6 objectForKeyedSubscript:@"detected"];
  if (v9) {
    uint64_t v10 = (__CFString *)v9;
  }
  else {
    uint64_t v10 = &stru_26BDE2C70;
  }
  long long v69 = v7;
  if (([v7 isEqualToString:@"UIPerformance"] & 1) != 0
    || [v7 isEqualToString:@"Performance"]
    && [v70 isEqualToString:@"MemoryResourceException"])
  {
    uint64_t v11 = diagcollectLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEBUG, "Will skip evaluating common diagnostic extension actions based on signature match", buf, 2u);
    }

    LOBYTE(v12) = 0;
    uint64_t v7 = v69;
  }
  else
  {
    LOBYTE(v12) = 1;
  }
  if (v71)
  {
    LODWORD(v12) = [v71 BOOLValue];
    uint64_t v13 = diagcollectLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = "not ";
      if (v12) {
        uint64_t v14 = "";
      }
      *(_DWORD *)buf = 136315138;
      long long v77 = (__CFString *)v14;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEBUG, "Will %sevaluate common diagnostic extension actions based on client request", buf, 0xCu);
    }

    uint64_t v7 = v69;
  }
  long long v75 = [MEMORY[0x263EFF9A0] dictionary];
  if ([v7 length] && objc_msgSend(v70, "length"))
  {
    [v75 setObject:@"type" forKeyedSubscript:@"domain"];
    if ([v70 length] && objc_msgSend(v68, "length"))
    {
      [v75 setObject:@"subtype" forKeyedSubscript:@"type"];
      if (![v68 length]) {
        goto LABEL_32;
      }
      if (![v67 length]) {
        goto LABEL_32;
      }
      [v75 setObject:@"additional" forKeyedSubscript:@"subtype"];
      if (![v67 length] || !-[__CFString length](v10, "length")) {
        goto LABEL_32;
      }
LABEL_31:
      [v75 setObject:@"detected" forKeyedSubscript:v8];
      goto LABEL_32;
    }
    if ([v70 length])
    {
      uint64_t v8 = @"type";
      if ([(__CFString *)v10 length]) {
        goto LABEL_31;
      }
    }
  }
  else if ([v7 length])
  {
    uint64_t v8 = @"domain";
    if ([(__CFString *)v10 length]) {
      goto LABEL_31;
    }
  }
LABEL_32:
  id v73 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v15 = [(DiagnosticsController *)self settingsDict];
  id v16 = @"domain";
  long long v18 = v16;
  long long v19 = "ttlduration";
  if (v15)
  {
    long long v20 = 0;
    *(void *)&long long v17 = 134218242;
    long long v66 = v17;
    long long v72 = v10;
    char v74 = v12;
    while (1)
    {
      long long v21 = diagcollectLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        id v22 = @"Top Level";
        if (v20) {
          id v22 = v20;
        }
        *(_DWORD *)buf = 138412290;
        long long v77 = v22;
        _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_DEBUG, "Processing actions for [%@]", buf, 0xCu);
      }

      char v23 = v20 ? 1 : v12;
      if (v23) {
        break;
      }
      long long v24 = diagcollectLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        long long v77 = v6;
        _os_log_impl(&dword_209DBA000, v24, OS_LOG_TYPE_INFO, "Skipped evaluating common diagnostic extension actions for signature: %@", buf, 0xCu);
      }
LABEL_72:

      v43 = [(__CFString *)v6 objectForKeyedSubscript:v18];

      if ([(__CFString *)v43 length])
      {
        v44 = [v15 objectForKeyedSubscript:v43];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v45 = v44;

          v46 = diagcollectLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_209DBA000, v46, OS_LOG_TYPE_DEBUG, "We have another level to look into.", buf, 2u);
          }
          goto LABEL_88;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {

          v46 = v44;
          if ([v46 count])
          {
            [v73 addObjectsFromArray:v46];
            id v47 = diagcollectLogHandle();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v48 = [v46 count];
              *(_DWORD *)buf = 134218498;
              long long v77 = (__CFString *)v48;
              __int16 v78 = 2112;
              id v79 = v10;
              __int16 v80 = 2112;
              v81 = v46;
              uint32_t v49 = v47;
              os_log_type_t v50 = OS_LOG_TYPE_DEBUG;
              id v51 = "Added %ld actions for %@: %@";
              uint32_t v52 = 32;
              goto LABEL_85;
            }
            goto LABEL_86;
          }
          goto LABEL_87;
        }
        if (v44)
        {

          v46 = diagcollectLogHandle();
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            goto LABEL_87;
          }
          uint64_t v53 = (objc_class *)objc_opt_class();
          id v47 = NSStringFromClass(v53);
          *(_DWORD *)buf = 138412290;
          long long v77 = (__CFString *)v47;
          uint32_t v49 = v46;
          os_log_type_t v50 = OS_LOG_TYPE_ERROR;
          id v51 = "Found unexpected class: %@";
          goto LABEL_84;
        }
        uint64_t v45 = [v15 objectForKeyedSubscript:v10];

        if (!v45)
        {
          v46 = v15;
          goto LABEL_88;
        }
        v46 = [v15 objectForKeyedSubscript:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {

          id v47 = diagcollectLogHandle();
          if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
            goto LABEL_86;
          }
          *(_DWORD *)buf = 138412290;
          long long v77 = (__CFString *)v46;
          uint32_t v49 = v47;
          os_log_type_t v50 = OS_LOG_TYPE_ERROR;
          id v51 = "Unexpectedly found a dictionary instead of an array: %@";
LABEL_84:
          uint32_t v52 = 12;
LABEL_85:
          _os_log_impl(&dword_209DBA000, v49, v50, v51, buf, v52);
LABEL_86:

LABEL_87:
          uint64_t v45 = 0;
LABEL_88:

          goto LABEL_89;
        }
        objc_opt_class();
        isKindOfClass Class = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v47 = v46;
          if (![v47 count]) {
            goto LABEL_86;
          }
          [v73 addObjectsFromArray:v47];
          v56 = diagcollectLogHandle();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v57 = [v47 count];
            *(_DWORD *)buf = 134218498;
            long long v77 = (__CFString *)v57;
            __int16 v78 = 2112;
            id v79 = v10;
            __int16 v80 = 2112;
            v81 = v47;
            long long v58 = v56;
            os_log_type_t v59 = OS_LOG_TYPE_DEBUG;
            long long v60 = "Added %ld actions for %@: %@";
            uint32_t v61 = 32;
            goto LABEL_103;
          }
        }
        else
        {
          if (!v46) {
            goto LABEL_87;
          }
          id v47 = diagcollectLogHandle();
          if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
            goto LABEL_86;
          }
          id v62 = (objc_class *)objc_opt_class();
          v56 = NSStringFromClass(v62);
          *(_DWORD *)buf = 138412290;
          long long v77 = (__CFString *)v56;
          long long v58 = v47;
          os_log_type_t v59 = OS_LOG_TYPE_ERROR;
          long long v60 = "Found unexpected class: %@";
          uint32_t v61 = 12;
LABEL_103:
          _os_log_impl(&dword_209DBA000, v58, v59, v60, buf, v61);
        }

        goto LABEL_86;
      }
      uint64_t v45 = 0;
      v44 = v15;
LABEL_89:

      uint64_t v54 = [v75 objectForKeyedSubscript:v18];

      id v15 = v45;
      long long v18 = v54;
      long long v20 = v43;
      if (!v45)
      {

        uint64_t v7 = v69;
        long long v19 = "logarchivettlduration" + 10;
        goto LABEL_106;
      }
    }
    long long v24 = [v15 objectForKeyedSubscript:@"DEFAULTS"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v24) {
        goto LABEL_72;
      }
      uint64_t v12 = diagcollectLogHandle();
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
      {
        BOOL v32 = (objc_class *)objc_opt_class();
        v33 = NSStringFromClass(v32);
        *(_DWORD *)buf = 138412546;
        long long v77 = @"DEFAULTS";
        __int16 v78 = 2112;
        id v79 = v33;
        _os_log_impl(&dword_209DBA000, (os_log_t)v12, OS_LOG_TYPE_DEBUG, "Found unexpected class for key %@ (should be NSDictionary): %@", buf, 0x16u);
      }
      goto LABEL_71;
    }
    uint64_t v12 = v24;
    id v25 = diagcollectLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v25, OS_LOG_TYPE_DEBUG, "Evaluating default actions.", buf, 2u);
    }

    uint64_t v26 = [(id)v12 objectForKeyedSubscript:@"alwaysRun"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = v26;
      if ([v27 count])
      {
        [v73 addObjectsFromArray:v27];
        uint64_t v28 = diagcollectLogHandle();
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
LABEL_58:

          goto LABEL_59;
        }
        uint64_t v29 = [v27 count];
        *(_DWORD *)buf = v66;
        long long v77 = (__CFString *)v29;
        __int16 v78 = 2112;
        id v79 = v27;
        uint64_t v30 = v28;
        uint64_t v31 = "Added %ld always run actions: %@";
LABEL_57:
        _os_log_impl(&dword_209DBA000, v30, OS_LOG_TYPE_DEBUG, v31, buf, 0x16u);
        goto LABEL_58;
      }
    }
    else
    {
      if (!v26) {
        goto LABEL_60;
      }
      v27 = diagcollectLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        long long v34 = (objc_class *)objc_opt_class();
        uint64_t v28 = NSStringFromClass(v34);
        *(_DWORD *)buf = 138412546;
        long long v77 = @"alwaysRun";
        __int16 v78 = 2112;
        id v79 = v28;
        uint64_t v30 = v27;
        uint64_t v31 = "Found unexpected class for key %@ (should be NSArray): %@";
        goto LABEL_57;
      }
    }
LABEL_59:

LABEL_60:
    long long v35 = objc_msgSend((id)v12, "objectForKeyedSubscript:", v10, v66);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v36 = v35;
      if ([v36 count])
      {
        [v73 addObjectsFromArray:v36];
        long long v37 = diagcollectLogHandle();
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
LABEL_68:

          uint64_t v10 = v72;
          goto LABEL_69;
        }
        uint64_t v38 = [v36 count];
        *(_DWORD *)buf = 134218498;
        long long v77 = (__CFString *)v38;
        __int16 v78 = 2112;
        id v79 = v72;
        __int16 v80 = 2112;
        v81 = v36;
        v39 = v37;
        __int16 v40 = "Added %ld default actions for %@: %@";
        uint32_t v41 = 32;
LABEL_67:
        _os_log_impl(&dword_209DBA000, v39, OS_LOG_TYPE_DEBUG, v40, buf, v41);
        goto LABEL_68;
      }
    }
    else
    {
      if (!v35)
      {
LABEL_70:

LABEL_71:
        LOBYTE(v12) = v74;
        goto LABEL_72;
      }
      long long v36 = diagcollectLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        __int16 v42 = (objc_class *)objc_opt_class();
        long long v37 = NSStringFromClass(v42);
        *(_DWORD *)buf = 138412546;
        long long v77 = v72;
        __int16 v78 = 2112;
        id v79 = v37;
        v39 = v36;
        __int16 v40 = "Found unexpected class for key %@ (should be NSArray): %@";
        uint32_t v41 = 22;
        goto LABEL_67;
      }
    }
LABEL_69:

    goto LABEL_70;
  }
  uint64_t v54 = v16;
LABEL_106:
  uint64_t v63 = diagcollectLogHandle();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v64 = [v73 count];
    *(_DWORD *)buf = *((void *)v19 + 67);
    long long v77 = (__CFString *)v64;
    __int16 v78 = 2112;
    id v79 = v73;
    _os_log_impl(&dword_209DBA000, v63, OS_LOG_TYPE_DEBUG, "Result: Found %ld actions: %@", buf, 0x16u);
  }

  return v73;
}

- (void)consolidateLoggingLevelsIntoSet:(id)a3 withCurrentState:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [a4 allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = diagcollectLogHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            long long v20 = v11;
            _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEBUG, "sesstionState: %@", buf, 0xCu);
          }

          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 3221225472;
          v13[2] = __74__DiagnosticsController_consolidateLoggingLevelsIntoSet_withCurrentState___block_invoke;
          v13[3] = &unk_263FC3B80;
          id v14 = v5;
          [v11 enumerateKeysAndObjectsUsingBlock:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v8);
  }
}

void __74__DiagnosticsController_consolidateLoggingLevelsIntoSet_withCurrentState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = diagcollectLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        long long v17 = v5;
        __int16 v18 = 2112;
        id v19 = v6;
        _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEBUG, "key: %@ object: %@", buf, 0x16u);
      }

      uint64_t v8 = v6;
      if (([v5 isEqualToString:@"process"] & 1) != 0
        || ([v5 isEqualToString:@"subsystem"] & 1) != 0
        || [v5 isEqualToString:@"category"])
      {
        uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
        if (!v9)
        {
          uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
          [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v5];
        }
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __74__DiagnosticsController_consolidateLoggingLevelsIntoSet_withCurrentState___block_invoke_149;
        v14[3] = &unk_263FC3B80;
        id v15 = v9;
        uint64_t v10 = v9;
        [v8 enumerateKeysAndObjectsUsingBlock:v14];
      }
      else
      {
        uint64_t v10 = diagcollectLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          long long v17 = v5;
          _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEBUG, "Found unsupported log set key %@", buf, 0xCu);
        }
      }
      goto LABEL_13;
    }
  }
  uint64_t v8 = diagcollectLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v11);
    uint64_t v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138412546;
    long long v17 = v10;
    __int16 v18 = 2112;
    id v19 = v13;
    _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEBUG, "Found unexpected class %@/%@ for consolidated action set (should be NSString/NSDictionary).", buf, 0x16u);

LABEL_13:
  }
}

void __74__DiagnosticsController_consolidateLoggingLevelsIntoSet_withCurrentState___block_invoke_149(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = v6;
    uint64_t v9 = [v7 objectForKeyedSubscript:v5];
    uint64_t v10 = [v8 maximumLogLevelString:v9];

    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v5];
  }
  else
  {
    uint64_t v11 = diagcollectLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      id v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      int v16 = 138412546;
      long long v17 = v13;
      __int16 v18 = 2112;
      id v19 = v15;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEBUG, "Found unexpected class %@/%@ for log level setting (should be NSString/NSString).", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)raiseLoggingForActions:(id)a3 identifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![v7 length])
  {
    id v8 = diagcollectLogHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    LOWORD(v15) = 0;
    id v14 = "A valid identifier is required when raising log levels!";
LABEL_16:
    _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v15, 2u);
    goto LABEL_17;
  }
  if (![v6 count])
  {
    id v8 = diagcollectLogHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    LOWORD(v15) = 0;
    id v14 = "No actions to raise log levels for.";
    goto LABEL_16;
  }
  id v8 = +[DiagnosticsController loggingStateCache];
  uint64_t v9 = [(DiagnosticsController *)self consolidatedLogLevelSetsFromActions:v6];
  uint64_t v10 = diagcollectLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 134217984;
    uint64_t v16 = [v9 count];
    _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEBUG, "Consolidated actions to %ld set(s) of log level adjustments", (uint8_t *)&v15, 0xCu);
  }

  if ([v9 count])
  {
    uint64_t v11 = diagcollectLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138412290;
      uint64_t v16 = (uint64_t)v7;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEBUG, "Storing logging state for session: %@", (uint8_t *)&v15, 0xCu);
    }

    [v8 setObject:v9 forKeyedSubscript:v7];
    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    [(DiagnosticsController *)self consolidateLoggingLevelsIntoSet:v12 withCurrentState:v8];
    uint64_t v13 = diagcollectLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEBUG, "Applying the consolidated log levels", (uint8_t *)&v15, 2u);
    }

    [(DiagnosticsController *)self applyLogLevelSets:v12];
  }

LABEL_17:
}

- (void)lowerLoggingForIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = +[DiagnosticsController loggingStateCache];
    id v6 = [v5 objectForKeyedSubscript:v4];
    if ([v6 count])
    {
      [v5 setObject:0 forKeyedSubscript:v4];
      id v7 = diagcollectLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v4;
        _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEBUG, "Removed logging state for session: %@", buf, 0xCu);
      }

      id v8 = [MEMORY[0x263EFF9A0] dictionary];
      [(DiagnosticsController *)self consolidateLoggingLevelsIntoSet:v8 withCurrentState:v5];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __51__DiagnosticsController_lowerLoggingForIdentifier___block_invoke;
      v11[3] = &unk_263FC3B80;
      id v12 = v8;
      uint64_t v9 = v8;
      [v6 enumerateKeysAndObjectsUsingBlock:v11];
      uint64_t v10 = diagcollectLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEBUG, "Apply the consolidated log levels", buf, 2u);
      }

      [(DiagnosticsController *)self applyLogLevelSets:v9];
    }
    else
    {
      uint64_t v9 = diagcollectLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v4;
        _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEBUG, "No logging state for session: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v5 = diagcollectLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEBUG, "A valid identifier is required when lowering log levels!", buf, 2u);
    }
  }
}

void __51__DiagnosticsController_lowerLoggingForIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (([v5 isEqualToString:@"process"] & 1) != 0
    || ([v5 isEqualToString:@"subsystem"] & 1) != 0
    || [v5 isEqualToString:@"category"])
  {
    id v19 = v6;
    id v7 = v6;
    id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    if (!v8)
    {
      id v8 = [MEMORY[0x263EFF9A0] dictionary];
      [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v5];
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v9 = objc_msgSend(v7, "allKeys", v7);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;
            uint64_t v16 = [v8 objectForKeyedSubscript:v15];
            if (!v16) {
              [v8 setObject:@"reset" forKeyedSubscript:v15];
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v11);
    }

    uint64_t v17 = v18;
    id v6 = v19;
  }
  else
  {
    uint64_t v17 = diagcollectLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v5;
      _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_DEBUG, "Unsupported log setting type: %@", buf, 0xCu);
    }
  }
}

- (void)applyLogLevelSets:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__DiagnosticsController_applyLogLevelSets___block_invoke;
  v3[3] = &unk_263FC3B80;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

void __43__DiagnosticsController_applyLogLevelSets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqualToString:@"process"])
  {
    uint64_t v7 = 1;
  }
  else if ([v5 isEqualToString:@"subsystem"])
  {
    uint64_t v7 = 2;
  }
  else
  {
    int v8 = [v5 isEqualToString:@"category"];
    uint64_t v7 = 3;
    if (!v8) {
      uint64_t v7 = 0;
    }
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__DiagnosticsController_applyLogLevelSets___block_invoke_2;
  v9[3] = &unk_263FC3BA8;
  v9[4] = *(void *)(a1 + 32);
  v9[5] = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
}

uint64_t __43__DiagnosticsController_applyLogLevelSets___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) applyLogLevel:a3 forIdentifier:a2 logSettingType:*(void *)(a1 + 40)];
}

- (BOOL)validateOSLogPreferencesProtocol:(id)a3
{
  id v3 = a3;
  BOOL v4 = (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0;

  return v4;
}

- (void)applyLogLevel:(id)a3 forIdentifier:(id)a4 logSettingType:(unint64_t)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(DiagnosticsController *)self _loadLoggingSupport];
  uint64_t v11 = diagcollectLogHandle();
  uint64_t v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = (void *)LogSettingToString;
      id v14 = [NSNumber numberWithUnsignedInteger:a5];
      id v15 = [v13 objectForKeyedSubscript:v14];
      int v46 = 138412546;
      unint64_t v47 = (unint64_t)v15;
      __int16 v48 = 2112;
      uint64_t v49 = (uint64_t)v9;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEBUG, " - %@ identifier: %@", (uint8_t *)&v46, 0x16u);
    }
    switch(a5)
    {
      case 3uLL:
        uint64_t v17 = [v9 componentsSeparatedByString:@":"];
        if ([v17 count] == 2)
        {
          __int16 v18 = [v17 objectAtIndexedSubscript:0];
          id v19 = [v17 objectAtIndexedSubscript:1];
          long long v20 = (void *)[objc_alloc((Class)gOSLogPreferencesSubsystem) initWithName:v18];
          uint64_t v12 = [objc_alloc((Class)gOSLogPreferencesCategory) initWithName:v19 subsystem:v20];
        }
        else
        {
          uint64_t v12 = 0;
        }

        break;
      case 2uLL:
        uint64_t v16 = [objc_alloc((Class)gOSLogPreferencesSubsystem) initWithName:v9];
        goto LABEL_13;
      case 1uLL:
        uint64_t v16 = [objc_alloc((Class)gOSLogPreferencesProcess) initWithBundleID:v9];
LABEL_13:
        uint64_t v12 = v16;
        break;
      default:
        long long v21 = diagcollectLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          int v46 = 134217984;
          unint64_t v47 = a5;
          _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_DEBUG, "Unsupported log setting type: %ld", (uint8_t *)&v46, 0xCu);
        }

        uint64_t v12 = 0;
        break;
    }
    BOOL v22 = [(DiagnosticsController *)self validateOSLogPreferencesProtocol:v12];
    long long v23 = diagcollectLogHandle();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
    if (!v22)
    {
      if (v24)
      {
        int v46 = 138412290;
        unint64_t v47 = (unint64_t)v12;
        BOOL v32 = "OSLogPreferences object %@ no longer conforms to our expected definition!";
        v33 = v23;
        uint32_t v34 = 12;
LABEL_53:
        _os_log_impl(&dword_209DBA000, v33, OS_LOG_TYPE_DEBUG, v32, (uint8_t *)&v46, v34);
      }
LABEL_54:

      goto LABEL_55;
    }
    if (v24)
    {
      if ([v12 isLocked]) {
        id v25 = @"On";
      }
      else {
        id v25 = @"Off";
      }
      uint64_t v26 = [v12 effectiveEnabledLevel];
      uint64_t v27 = [v12 enabledLevel];
      uint64_t v28 = [v12 effectivePersistedLevel];
      uint64_t v29 = [v12 persistedLevel];
      int v46 = 138413570;
      unint64_t v47 = (unint64_t)v12;
      __int16 v48 = 2112;
      uint64_t v49 = (uint64_t)v25;
      __int16 v50 = 2048;
      uint64_t v51 = v26;
      __int16 v52 = 2048;
      uint64_t v53 = v27;
      __int16 v54 = 2048;
      uint64_t v55 = v28;
      __int16 v56 = 2048;
      uint64_t v57 = v29;
      _os_log_impl(&dword_209DBA000, v23, OS_LOG_TYPE_DEBUG, "(Before) OSLogPreferences: %@, isLocked: %@, effectiveEnabled:%ld, enabled:%ld effectivePersisted: %ld, persisted: %ld", (uint8_t *)&v46, 0x3Eu);
    }

    if ([v12 isLocked])
    {
      long long v23 = diagcollectLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v30 = (objc_class *)objc_opt_class();
        uint64_t v31 = NSStringFromClass(v30);
        int v46 = 138412290;
        unint64_t v47 = (unint64_t)v31;
        _os_log_impl(&dword_209DBA000, v23, OS_LOG_TYPE_DEBUG, "No means to adjust log levels!! (%@ is locked)", (uint8_t *)&v46, 0xCu);
      }
      goto LABEL_54;
    }
    if ([v8 isEqualToString:@"info"])
    {
      uint64_t v35 = 3;
    }
    else if ([v8 isEqualToString:@"debug"])
    {
      uint64_t v35 = 4;
    }
    else if ([v8 isEqualToString:@"none"])
    {
      uint64_t v35 = 0;
    }
    else
    {
      if ([v8 isEqualToString:@"reset"])
      {
        long long v36 = diagcollectLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v46) = 0;
          _os_log_impl(&dword_209DBA000, v36, OS_LOG_TYPE_DEBUG, "Resetting log level", (uint8_t *)&v46, 2u);
        }

        [v12 reset];
LABEL_48:
        long long v23 = diagcollectLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          if ([v12 isLocked]) {
            uint32_t v41 = @"On";
          }
          else {
            uint32_t v41 = @"Off";
          }
          uint64_t v42 = [v12 effectiveEnabledLevel];
          uint64_t v43 = [v12 enabledLevel];
          uint64_t v44 = [v12 effectivePersistedLevel];
          uint64_t v45 = [v12 persistedLevel];
          int v46 = 138413570;
          unint64_t v47 = (unint64_t)v12;
          __int16 v48 = 2112;
          uint64_t v49 = (uint64_t)v41;
          __int16 v50 = 2048;
          uint64_t v51 = v42;
          __int16 v52 = 2048;
          uint64_t v53 = v43;
          __int16 v54 = 2048;
          uint64_t v55 = v44;
          __int16 v56 = 2048;
          uint64_t v57 = v45;
          BOOL v32 = "(After) OSLogPreferences: %@, isLocked: %@, effectiveEnabled: %ld, enabled: %ld effectivePersisted: %ld, persisted: %ld";
          v33 = v23;
          uint32_t v34 = 62;
          goto LABEL_53;
        }
        goto LABEL_54;
      }
      uint64_t v35 = 1;
    }
    long long v37 = diagcollectLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      int v46 = 138412546;
      unint64_t v47 = (unint64_t)v8;
      __int16 v48 = 2048;
      uint64_t v49 = v35;
      _os_log_impl(&dword_209DBA000, v37, OS_LOG_TYPE_DEBUG, "Requesting log level change to: %@ (%ld)", (uint8_t *)&v46, 0x16u);
    }

    if ([v12 enabledLevel] < v35 || [v12 persistedLevel] < v35)
    {
      [v12 setEnabledLevel:v35];
      [v12 setPersistedLevel:v35];
      uint64_t v38 = diagcollectLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v39 = [v12 persistedLevel];
        uint64_t v40 = [v12 enabledLevel];
        int v46 = 138413058;
        unint64_t v47 = (unint64_t)v8;
        __int16 v48 = 2048;
        uint64_t v49 = v35;
        __int16 v50 = 2048;
        uint64_t v51 = v39;
        __int16 v52 = 2048;
        uint64_t v53 = v40;
        _os_log_impl(&dword_209DBA000, v38, OS_LOG_TYPE_DEBUG, "Adjusted log level to: %@ (%ld) - p:%ld | e:%ld", (uint8_t *)&v46, 0x2Au);
      }
    }
    goto LABEL_48;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v46) = 0;
    _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_ERROR, "The dynamic loading of LoggingSupport failed", (uint8_t *)&v46, 2u);
  }
LABEL_55:
}

- (void)raiseLoggingForDiagnosticCase:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = diagcollectLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 caseId];
    int v11 = 138412290;
    uint64_t v12 = v6;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEBUG, "raiseLoggingForDiagnosticCase: %@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v7 = [v4 caseId];
  id v8 = [v7 UUIDString];

  id v9 = [v4 signature];
  if ([v8 length] && objc_msgSend(v9, "count"))
  {
    BOOL v10 = [(DiagnosticsController *)self diagActionsForSignature:v9];
    [(DiagnosticsController *)self raiseLoggingForActions:v10 identifier:v8];
  }
}

- (void)lowerLoggingForDiagnosticCase:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = diagcollectLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 caseId];
    int v9 = 138412290;
    BOOL v10 = v6;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEBUG, "lowerLoggingForDiagnosticCase: %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = [v4 caseId];
  id v8 = [v7 UUIDString];

  if ([v8 length]) {
    [(DiagnosticsController *)self lowerLoggingForIdentifier:v8];
  }
}

- (id)diagnosticExtensionsForDiagnosticCase:(id)a3 enableCommonActions:(id)a4
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v40 = a4;
  id v6 = diagcollectLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [v42 caseId];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v7;
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEBUG, "diagnosticExtensionsForDiagnosticCase: %@", buf, 0xCu);
  }
  id v8 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  uint64_t v43 = [v42 signature];
  uint64_t v44 = [(DiagnosticsController *)self actionsDict];
  if ([v43 count])
  {
    int v9 = [(DiagnosticsController *)self diagActionsForSignature:v43 commonActions:v40];
    BOOL v10 = diagcollectLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = [v9 count];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEBUG, "Looking up diagnostic extensions in %ld actions: %@", buf, 0x16u);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obj = v9;
    uint64_t v49 = [obj countByEnumeratingWithState:&v61 objects:v73 count:16];
    if (v49)
    {
      uint64_t v48 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v62 != v48) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v14 = v13;
            uint64_t v51 = [v44 objectForKeyedSubscript:v14];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = v51;
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x2020000000;
              LOBYTE(v66) = 1;
              os_log_t oslog = v15;
              unint64_t v47 = [v15 objectForKeyedSubscript:@"matchFilter"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v16 = v47;
                *(void *)&long long v70 = 0;
                *((void *)&v70 + 1) = &v70;
                uint64_t v71 = 0x2020000000;
                char v72 = 1;
                v57[0] = MEMORY[0x263EF8330];
                v57[1] = 3221225472;
                v57[2] = __83__DiagnosticsController_diagnosticExtensionsForDiagnosticCase_enableCommonActions___block_invoke;
                v57[3] = &unk_263FC3BD0;
                id v58 = v43;
                os_log_type_t v59 = buf;
                long long v60 = &v70;
                [v16 enumerateKeysAndObjectsUsingBlock:v57];
                if (!*(unsigned char *)(*((void *)&v70 + 1) + 24)) {
                  *(unsigned char *)(*(void *)&buf[8] + 24) = 1;
                }

                _Block_object_dispose(&v70, 8);
              }
              if (*(unsigned char *)(*(void *)&buf[8] + 24))
              {
                int v46 = [oslog objectForKeyedSubscript:@"diagExt"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v17 = v46;
                  long long v53 = 0u;
                  long long v54 = 0u;
                  long long v55 = 0u;
                  long long v56 = 0u;
                  __int16 v18 = v17;
                  uint64_t v19 = [v18 countByEnumeratingWithState:&v53 objects:v69 count:16];
                  if (!v19) {
                    goto LABEL_32;
                  }
                  uint64_t v20 = *(void *)v54;
                  while (1)
                  {
                    for (uint64_t j = 0; j != v19; ++j)
                    {
                      if (*(void *)v54 != v20) {
                        objc_enumerationMutation(v18);
                      }
                      BOOL v22 = *(void **)(*((void *)&v53 + 1) + 8 * j);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v23 = v22;
                        [v8 addObject:v23];
                      }
                      else
                      {
                        if (!v22) {
                          continue;
                        }
                        long long v23 = diagcollectLogHandle();
                        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                        {
                          BOOL v24 = (objc_class *)objc_opt_class();
                          id v25 = NSStringFromClass(v24);
                          LODWORD(v70) = 138412290;
                          *(void *)((char *)&v70 + 4) = v25;
                          _os_log_impl(&dword_209DBA000, v23, OS_LOG_TYPE_DEBUG, "Found unexpected class: %@ (expected NSString)", (uint8_t *)&v70, 0xCu);
                        }
                      }
                    }
                    uint64_t v19 = [v18 countByEnumeratingWithState:&v53 objects:v69 count:16];
                    if (!v19)
                    {
LABEL_32:

                      goto LABEL_42;
                    }
                  }
                }
                if (v46)
                {
                  __int16 v18 = diagcollectLogHandle();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v30 = (objc_class *)objc_opt_class();
                    uint64_t v31 = NSStringFromClass(v30);
                    LODWORD(v70) = 138412290;
                    *(void *)((char *)&v70 + 4) = v31;
                    _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_DEBUG, "Found unexpected class: %@ (expected NSArray)", (uint8_t *)&v70, 0xCu);
                  }
LABEL_42:
                }
              }
              else
              {
              }
              _Block_object_dispose(buf, 8);
LABEL_45:
            }
            else if (v51)
            {
              diagcollectLogHandle();
              os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v28 = (objc_class *)objc_opt_class();
                uint64_t v29 = NSStringFromClass(v28);
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v29;
                _os_log_impl(&dword_209DBA000, oslog, OS_LOG_TYPE_DEBUG, "Found unexpected class: %@ (expected NSDictionary)", buf, 0xCu);
              }
              goto LABEL_45;
            }

            goto LABEL_47;
          }
          id v14 = diagcollectLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v26 = (objc_class *)objc_opt_class();
            uint64_t v27 = NSStringFromClass(v26);
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v27;
            _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_DEBUG, "Found unexpected class: %@ (expected NSString)", buf, 0xCu);
          }
LABEL_47:
        }
        uint64_t v49 = [obj countByEnumeratingWithState:&v61 objects:v73 count:16];
      }
      while (v49);
    }
  }
  BOOL v32 = +[SystemProperties sharedInstance];
  int v33 = [v32 customerSeedBuild];

  if (v33)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    long long v66 = __Block_byref_object_copy__2;
    v67 = __Block_byref_object_dispose__2;
    id v68 = objc_alloc_init(MEMORY[0x263EFF980]);
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __83__DiagnosticsController_diagnosticExtensionsForDiagnosticCase_enableCommonActions___block_invoke_186;
    v52[3] = &unk_263FC3BF8;
    v52[4] = buf;
    [v8 enumerateObjectsUsingBlock:v52];
    if ([*(id *)(*(void *)&buf[8] + 40) count])
    {
      [v8 removeObjectsInArray:*(void *)(*(void *)&buf[8] + 40)];
      uint32_t v34 = diagcollectLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        uint64_t v35 = [*(id *)(*(void *)&buf[8] + 40) count];
        LODWORD(v70) = 134217984;
        *(void *)((char *)&v70 + 4) = v35;
        _os_log_impl(&dword_209DBA000, v34, OS_LOG_TYPE_INFO, "Removed %ld diagnostic extensions that were not privacy approved for CustomerSeed", (uint8_t *)&v70, 0xCu);
      }
    }
    _Block_object_dispose(buf, 8);
  }
  long long v36 = diagcollectLogHandle();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    uint64_t v37 = [v8 count];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v37;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_209DBA000, v36, OS_LOG_TYPE_INFO, "Found %ld diagnostic extensions: %@", buf, 0x16u);
  }

  uint64_t v38 = [v8 array];

  return v38;
}

void __83__DiagnosticsController_diagnosticExtensionsForDiagnosticCase_enableCommonActions___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = v7;
      id v10 = v8;
      uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
      uint64_t v12 = diagcollectLogHandle();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v11)
      {
        if (v13)
        {
          int v19 = 138412802;
          uint64_t v20 = v9;
          __int16 v21 = 2112;
          BOOL v22 = v11;
          __int16 v23 = 2112;
          id v24 = v10;
          _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEBUG, "Found filter key '%@' with value '%@' in signature dictionary. (Expecting to match '%@')", (uint8_t *)&v19, 0x20u);
        }

        if ([v11 isEqualToString:v10]) {
          goto LABEL_14;
        }
        uint64_t v14 = *(void *)(a1 + 40);
      }
      else
      {
        if (v13)
        {
          int v19 = 138412290;
          uint64_t v20 = v9;
          _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEBUG, "Did not find applicable filter key '%@' in signature dictionary. Allowing.", (uint8_t *)&v19, 0xCu);
        }

        uint64_t v14 = *(void *)(a1 + 48);
      }
      *(unsigned char *)(*(void *)(v14 + 8) + 24) = 0;
      *a4 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  int v9 = diagcollectLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    id v17 = (objc_class *)objc_opt_class();
    __int16 v18 = NSStringFromClass(v17);
    int v19 = 138413058;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    BOOL v22 = v16;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    uint64_t v26 = v18;
    _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_ERROR, "Found unexpected class in actions filter dictionary! key: %@ (%@) value: %@ (%@)", (uint8_t *)&v19, 0x2Au);
  }
LABEL_15:
}

void __83__DiagnosticsController_diagnosticExtensionsForDiagnosticCase_enableCommonActions___block_invoke_186(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([v3 isEqualToString:@"com.apple.DiagnosticExtensions.tailspin"] & 1) == 0
    && ([v3 isEqualToString:@"com.apple.osx-tailspin"] & 1) == 0
    && ([v3 isEqualToString:@"com.apple.DiagnosticExtensions.Microstackshot"] & 1) == 0
    && ([v3 isEqualToString:@"com.apple.PowerlogCore.diagnosticextension"] & 1) == 0
    && ([v3 isEqualToString:@"com.apple.DiagnosticExtensions.Cellular"] & 1) == 0
    && ([v3 isEqualToString:@"com.apple.Search.framework.SpotlightDiagnostic"] & 1) == 0
    && ([v3 isEqualToString:@"com.apple.diagnosticextensions.osx.spotlight"] & 1) == 0)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
    id v4 = diagcollectLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_ERROR, "Flagging DiagnosticExtension %@ as not privacy approved for CustomerSeed", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (unint64_t)collectDiagnosticExtensionFilesForDiagnosticCase:(id)a3 parameters:(id)a4 options:(id)a5 queue:(id)a6 reply:(id)a7
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v60 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = a6;
  id v15 = a7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = diagcollectLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v74 = (uint64_t)v13;
      _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_DEBUG, "Found diagnostic extensions options dictionary: %@", buf, 0xCu);
    }

    id v17 = [v13 objectForKeyedSubscript:@"diagextcommon"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v17;
      int v19 = diagcollectLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v74 = (uint64_t)v18;
        _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_DEBUG, "Enable common diagnostic extensions: %@", buf, 0xCu);
      }
    }
    else
    {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }
  uint64_t v20 = [(DiagnosticsController *)self diagnosticExtensionsForDiagnosticCase:v60 enableCommonActions:v18];
  uint64_t v21 = [v20 count];
  BOOL v22 = diagcollectLogHandle();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
  if (v21)
  {
    long long v53 = self;
    id v54 = v18;
    long long v55 = v14;
    if (v23)
    {
      uint64_t v24 = [v20 count];
      *(_DWORD *)buf = 134218498;
      uint64_t v74 = v24;
      __int16 v75 = 2112;
      long long v76 = v20;
      __int16 v77 = 2112;
      id v78 = v12;
      _os_log_impl(&dword_209DBA000, v22, OS_LOG_TYPE_DEBUG, "Ready to collect from %ld diagnostic extensions (%@) with parameters: %@", buf, 0x20u);
    }
    id v56 = v13;

    __int16 v52 = v20;
    __int16 v25 = [MEMORY[0x263EFFA08] setWithArray:v20];
    uint64_t v51 = [v25 count];
    id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __105__DiagnosticsController_collectDiagnosticExtensionFilesForDiagnosticCase_parameters_options_queue_reply___block_invoke;
    v70[3] = &unk_263FC3B80;
    id v59 = v26;
    id v71 = v59;
    id v57 = v12;
    [v12 enumerateKeysAndObjectsUsingBlock:v70];
    id v27 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id obj = v25;
    uint64_t v28 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v67 != v30) {
            objc_enumerationMutation(obj);
          }
          BOOL v32 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          int v33 = diagcollectLogHandle();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v74 = (uint64_t)v32;
            _os_log_impl(&dword_209DBA000, v33, OS_LOG_TYPE_DEBUG, "Will call Diag Extension: %@", buf, 0xCu);
          }

          uint32_t v34 = [v59 objectForKeyedSubscript:v32];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v35 = [v34 mutableCopy];
          }
          else
          {
            if (v34)
            {
              long long v36 = diagcollectLogHandle();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                uint64_t v37 = (objc_class *)objc_opt_class();
                uint64_t v38 = NSStringFromClass(v37);
                *(_DWORD *)buf = 138412546;
                uint64_t v74 = (uint64_t)v38;
                __int16 v75 = 2112;
                long long v76 = v34;
                _os_log_impl(&dword_209DBA000, v36, OS_LOG_TYPE_ERROR, "Expected NSDictionary, but found unexpected class %@ as a DE parameter: %@", buf, 0x16u);
              }
            }
            uint64_t v35 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v51);
          }
          uint64_t v39 = (void *)v35;

          [v39 setObject:@"com.apple.symptomsd" forKeyedSubscript:@"DEExtensionHostAppKey"];
          if (([v32 isEqualToString:@"com.apple.DiagnosticExtensions.WiFi"] & 1) != 0
            || [v32 isEqualToString:@"com.apple.diagnosticextensions.osx.wifi"])
          {
            id v40 = objc_msgSend(v60, "signature", v51);
            uint32_t v41 = [v40 objectForKeyedSubscript:@"subtype"];

            [v39 setObject:v41 forKeyedSubscript:@"trigger"];
          }
          if (objc_msgSend(v39, "count", v51))
          {
            [v27 setValue:v39 forKey:v32];
          }
          else
          {
            id v42 = [MEMORY[0x263EFF9D0] null];
            [v27 setValue:v42 forKey:v32];
          }
          [v60 addRequiredAttachmentType:@"diagext" pattern:v32];
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
      }
      while (v29);
    }
    uint64_t v43 = obj;

    uint64_t v44 = [(DiagnosticsController *)v53 diagExtensionCollector];
    uint64_t v45 = [v60 caseId];
    int v46 = [v45 UUIDString];
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __105__DiagnosticsController_collectDiagnosticExtensionFilesForDiagnosticCase_parameters_options_queue_reply___block_invoke_220;
    v63[3] = &unk_263FC3C20;
    id v65 = v15;
    uint64_t v14 = v55;
    long long v64 = v55;
    [v44 collectDEPayloadsWithIdentifier:v46 diagnosticExtensionsWithParameters:v27 queue:v64 reply:v63];

    id v13 = v56;
    id v12 = v57;
    id v18 = v54;
    unint64_t v47 = v51;
    uint64_t v20 = v52;
  }
  else
  {
    if (v23)
    {
      uint64_t v48 = [v60 caseId];
      uint64_t v49 = [v48 UUIDString];
      *(_DWORD *)buf = 138412290;
      uint64_t v74 = (uint64_t)v49;
      _os_log_impl(&dword_209DBA000, v22, OS_LOG_TYPE_DEBUG, "No matching diagnostic extensions found for the case ID %@", buf, 0xCu);
    }
    if (!v15)
    {
      unint64_t v47 = 0;
      goto LABEL_42;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __105__DiagnosticsController_collectDiagnosticExtensionFilesForDiagnosticCase_parameters_options_queue_reply___block_invoke_223;
    block[3] = &unk_263FC3970;
    id v62 = v15;
    dispatch_async(v14, block);
    unint64_t v47 = 0;
    uint64_t v43 = v62;
  }

LABEL_42:
  return v47;
}

void __105__DiagnosticsController_collectDiagnosticExtensionFilesForDiagnosticCase_parameters_options_queue_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
  else
  {
    uint64_t v7 = diagcollectLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = (objc_class *)objc_opt_class();
      int v9 = NSStringFromClass(v8);
      id v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      int v12 = 138413058;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 2112;
      int v19 = v11;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "Dropping unexpected content from DE parameters. key (%@): %@, value (%@): %@", (uint8_t *)&v12, 0x2Au);
    }
  }
}

void __105__DiagnosticsController_collectDiagnosticExtensionFilesForDiagnosticCase_parameters_options_queue_reply___block_invoke_220(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = diagcollectLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEFAULT, "Collecting Diagnostic Extension payloads failed with error: %@", buf, 0xCu);
    }
  }
  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    int v9 = *(NSObject **)(a1 + 32);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __105__DiagnosticsController_collectDiagnosticExtensionFilesForDiagnosticCase_parameters_options_queue_reply___block_invoke_221;
    v10[3] = &unk_263FC2E88;
    id v12 = v8;
    id v11 = v5;
    dispatch_async(v9, v10);
  }
}

uint64_t __105__DiagnosticsController_collectDiagnosticExtensionFilesForDiagnosticCase_parameters_options_queue_reply___block_invoke_221(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __105__DiagnosticsController_collectDiagnosticExtensionFilesForDiagnosticCase_parameters_options_queue_reply___block_invoke_223(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)autoBugCapturePath
{
  return self->_autoBugCapturePath;
}

- (void)setAutoBugCapturePath:(id)a3
{
}

- (NSNumber)autoBugCaptureGID
{
  return self->_autoBugCaptureGID;
}

- (void)setAutoBugCaptureGID:(id)a3
{
}

- (NSNumber)autoBugCaptureUID
{
  return self->_autoBugCaptureUID;
}

- (void)setAutoBugCaptureUID:(id)a3
{
}

- (NSMutableDictionary)actionsDict
{
  return self->_actionsDict;
}

- (void)setActionsDict:(id)a3
{
}

- (NSMutableDictionary)settingsDict
{
  return self->_settingsDict;
}

- (void)setSettingsDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsDict, 0);
  objc_storeStrong((id *)&self->_actionsDict, 0);
  objc_storeStrong((id *)&self->_autoBugCaptureUID, 0);
  objc_storeStrong((id *)&self->_autoBugCaptureGID, 0);
  objc_storeStrong((id *)&self->_autoBugCapturePath, 0);

  objc_storeStrong((id *)&self->deCollector, 0);
}

@end