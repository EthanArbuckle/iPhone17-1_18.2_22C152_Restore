@interface AXValidationManager
+ (id)sharedInstance;
- (AXValidationManager)init;
- (AXValidationReportingServices)validationReportingServices;
- (BOOL)_client:(id)a3 validateClass:(id)a4 hasClassMethod:(id)a5 withFullSignature:(const char *)a6 argList:(char *)a7;
- (BOOL)_client:(id)a3 validateClass:(id)a4 hasMethod:(id)a5 methodType:(int)a6;
- (BOOL)_client:(id)a3 validateClass:(id)a4 hasMethod:(id)a5 methodType:(int)a6 returnType:(id)a7 arguments:(id)a8;
- (BOOL)_client:(id)a3 validateClass:(id)a4 hasSwiftField:(id)a5 withTypeString:(const char *)a6 isAnyClass:(BOOL)a7;
- (BOOL)_client:(id)a3 validateStruct:(id)a4 hasSwiftField:(id)a5 withTypeString:(const char *)a6 isAnyClass:(BOOL)a7;
- (BOOL)_client:(id)a3 validateSwiftEnum:(id)a4 hasCase:(id)a5 withTypeString:(const char *)a6 isAnyClass:(BOOL)a7;
- (BOOL)_client:(id)a3 validateType:(id)a4 hasSwiftField:(id)a5 handleSwiftValidationProblems:(id)a6;
- (BOOL)client:(id)a3 validateClass:(id)a4;
- (BOOL)client:(id)a3 validateClass:(id)a4 conformsToProtocol:(id)a5;
- (BOOL)client:(id)a3 validateClass:(id)a4 hasClassMethod:(id)a5 withFullSignature:(const char *)a6;
- (BOOL)client:(id)a3 validateClass:(id)a4 hasInstanceMethod:(id)a5 withFullSignature:(const char *)a6;
- (BOOL)client:(id)a3 validateClass:(id)a4 hasInstanceMethod:(id)a5 withFullSignature:(const char *)a6 argList:(char *)a7;
- (BOOL)client:(id)a3 validateClass:(id)a4 hasInstanceVariable:(id)a5 withType:(const char *)a6;
- (BOOL)client:(id)a3 validateClass:(id)a4 hasProperty:(id)a5 customGetter:(id)a6 customSetter:(id)a7 withType:(const char *)a8;
- (BOOL)client:(id)a3 validateClass:(id)a4 hasProperty:(id)a5 withType:(const char *)a6;
- (BOOL)client:(id)a3 validateClass:(id)a4 hasSwiftField:(id)a5 withSwiftType:(const char *)a6;
- (BOOL)client:(id)a3 validateClass:(id)a4 hasSwiftFieldOfAnyClass:(id)a5;
- (BOOL)client:(id)a3 validateClass:(id)a4 isKindOfClass:(id)a5;
- (BOOL)client:(id)a3 validateProtocol:(id)a4 conformsToProtocol:(id)a5;
- (BOOL)client:(id)a3 validateProtocol:(id)a4 hasMethod:(id)a5 isInstanceMethod:(BOOL)a6 isRequired:(BOOL)a7;
- (BOOL)client:(id)a3 validateProtocol:(id)a4 hasOptionalClassMethod:(id)a5;
- (BOOL)client:(id)a3 validateProtocol:(id)a4 hasOptionalInstanceMethod:(id)a5;
- (BOOL)client:(id)a3 validateProtocol:(id)a4 hasRequiredClassMethod:(id)a5;
- (BOOL)client:(id)a3 validateProtocol:(id)a4 hasRequiredInstanceMethod:(id)a5;
- (BOOL)client:(id)a3 validateSwiftEnum:(id)a4;
- (BOOL)client:(id)a3 validateSwiftEnum:(id)a4 hasCase:(id)a5;
- (BOOL)client:(id)a3 validateSwiftEnum:(id)a4 hasCase:(id)a5 withSwiftType:(const char *)a6;
- (BOOL)client:(id)a3 validateSwiftEnum:(id)a4 hasCaseOfAnyClass:(id)a5;
- (BOOL)client:(id)a3 validateSwiftStruct:(id)a4;
- (BOOL)client:(id)a3 validateSwiftStruct:(id)a4 hasSize:(int64_t)a5;
- (BOOL)client:(id)a3 validateSwiftStruct:(id)a4 hasSwiftField:(id)a5 withSwiftType:(const char *)a6;
- (BOOL)client:(id)a3 validateSwiftStruct:(id)a4 hasSwiftFieldOfAnyClass:(id)a5;
- (BOOL)forceDoNotReport;
- (BOOL)installSafeCategoriesOffMainThread;
- (BOOL)installSafeCategory:(id)a3;
- (BOOL)installSafeCategory:(id)a3 canInteractWithTargetClass:(BOOL)a4;
- (BOOL)installSwiftDynamicReplacementUnit:(id)a3 inBundle:(id)a4 withPrecondition:(id)a5;
- (BOOL)isDebugBuild;
- (BOOL)shouldCrashOnError;
- (BOOL)shouldLogToConsole;
- (BOOL)shouldPerformValidationChecks;
- (BOOL)shouldReportToServer;
- (BOOL)validateClass:(id)a3;
- (BOOL)validateClass:(id)a3 conformsToProtocol:(id)a4;
- (BOOL)validateClass:(id)a3 hasClassMethod:(id)a4 withFullSignature:(const char *)a5;
- (BOOL)validateClass:(id)a3 hasInstanceMethod:(id)a4 withFullSignature:(const char *)a5;
- (BOOL)validateClass:(id)a3 hasInstanceVariable:(id)a4 withType:(const char *)a5;
- (BOOL)validateClass:(id)a3 hasProperty:(id)a4 customGetter:(id)a5 customSetter:(id)a6 withType:(const char *)a7;
- (BOOL)validateClass:(id)a3 hasProperty:(id)a4 withType:(const char *)a5;
- (BOOL)validateClass:(id)a3 hasSwiftField:(id)a4 withSwiftType:(const char *)a5;
- (BOOL)validateClass:(id)a3 hasSwiftFieldOfAnyClass:(id)a4;
- (BOOL)validateClass:(id)a3 isKindOfClass:(id)a4;
- (BOOL)validateProtocol:(id)a3 conformsToProtocol:(id)a4;
- (BOOL)validateProtocol:(id)a3 hasMethod:(id)a4 isInstanceMethod:(BOOL)a5 isRequired:(BOOL)a6;
- (BOOL)validateProtocol:(id)a3 hasOptionalClassMethod:(id)a4;
- (BOOL)validateProtocol:(id)a3 hasOptionalInstanceMethod:(id)a4;
- (BOOL)validateProtocol:(id)a3 hasRequiredClassMethod:(id)a4;
- (BOOL)validateProtocol:(id)a3 hasRequiredInstanceMethod:(id)a4;
- (BOOL)validateSwiftEnum:(id)a3;
- (BOOL)validateSwiftEnum:(id)a3 hasCase:(id)a4;
- (BOOL)validateSwiftEnum:(id)a3 hasCase:(id)a4 withSwiftType:(const char *)a5;
- (BOOL)validateSwiftEnum:(id)a3 hasCaseOfAnyClass:(id)a4;
- (BOOL)validateSwiftStruct:(id)a3;
- (BOOL)validateSwiftStruct:(id)a3 hasSize:(int64_t)a4;
- (BOOL)validateSwiftStruct:(id)a3 hasSwiftField:(id)a4 withSwiftType:(const char *)a5;
- (BOOL)validateSwiftStruct:(id)a3 hasSwiftFieldOfAnyClass:(id)a4;
- (NSMutableArray)consoleErrorMessages;
- (NSMutableArray)consoleWarningMessages;
- (NSString)overrideProcessName;
- (NSString)validationTargetName;
- (id)_nameForMethod:(objc_method *)a3;
- (unint64_t)numberOfCategories;
- (unint64_t)numberOfValidationErrors;
- (unint64_t)numberOfValidationWarnings;
- (unint64_t)numberOfValidations;
- (void)_clearState;
- (void)_generateWarningsForMethodType:(int)a3 onClass:(Class)a4 superclassMethods:(objc_method *)a5 numberOfSuperclassMethods:(unsigned int)a6;
- (void)_generateWarningsForPrefixedMethodNames:(id)a3 client:(id)a4 methodType:(int)a5 methodName:(id)a6 className:(id)a7;
- (void)_generateWarningsOnSafeCategoryClass:(Class)a3;
- (void)_iterateMethodsOfType:(int)a3 onClass:(Class)Class block:(id)a5;
- (void)_printConsoleReport:(BOOL)a3 isDelayed:(BOOL)a4;
- (void)_printEncodedConsoleReportForValidationRunner:(BOOL)a3 isDelayed:(BOOL)a4;
- (void)_resetState;
- (void)installSafeCategories:(id)a3 afterDelay:(double)a4 validationTargetName:(id)a5 overrideProcessName:(id)a6;
- (void)performValidations:(id)a3 withPreValidationHandler:(id)a4 postValidationHandler:(id)a5;
- (void)performValidations:(id)a3 withPreValidationHandler:(id)a4 postValidationHandler:(id)a5 safeCategoryInstallationHandler:(id)a6;
- (void)sendExceptionForInstallingSafeCategory:(id)a3 onTarget:(id)a4 overrideProcessName:(id)a5;
- (void)sendExceptionForSafeBlock:(id)a3 overrideProcessName:(id)a4;
- (void)sendExceptionForSafeCategoryOnWrongTarget:(id)a3 targetBundle:(id)a4 expectedBundle:(id)a5 overrideProcessName:(id)a6;
- (void)sendExceptionForSafeIVarKey:(id)a3 onTarget:(id)a4 overrideProcessName:(id)a5;
- (void)sendExceptionForSafeValueKey:(id)a3 onTarget:(id)a4 overrideProcessName:(id)a5;
- (void)sendFailedAssertionWithErrorMessage:(id)a3 overrideProcessName:(id)a4;
- (void)sendFailedTestCase:(id)a3 withTag:(id)a4 overrideProcessName:(id)a5;
- (void)sendGenericReport:(id)a3 withTag:(id)a4 overrideProcessName:(id)a5;
- (void)sendValidateExceptionForClass:(id)a3 conformsToProtocol:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6;
- (void)sendValidateExceptionForClass:(id)a3 errorMessage:(id)a4 overrideProcessName:(id)a5;
- (void)sendValidateExceptionForClass:(id)a3 hasClassMethod:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6;
- (void)sendValidateExceptionForClass:(id)a3 hasInstanceMethod:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6;
- (void)sendValidateExceptionForClass:(id)a3 hasInstanceVariable:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6;
- (void)sendValidateExceptionForClass:(id)a3 hasProperty:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6;
- (void)sendValidateExceptionForClass:(id)a3 isKindOfClass:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6;
- (void)sendValidateExceptionForProtocol:(id)a3 conformsToProtocol:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6;
- (void)sendValidateExceptionForProtocol:(id)a3 hasMethod:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6;
- (void)sendValidateExceptionForProtocol:(id)a3 hasProperty:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6;
- (void)sendValidationSuccessForProcessName:(id)a3;
- (void)setConsoleErrorMessages:(id)a3;
- (void)setConsoleWarningMessages:(id)a3;
- (void)setDebugBuild:(BOOL)a3;
- (void)setForceDoNotReport:(BOOL)a3;
- (void)setInstallSafeCategoriesOffMainThread:(BOOL)a3;
- (void)setNumberOfCategories:(unint64_t)a3;
- (void)setNumberOfValidationErrors:(unint64_t)a3;
- (void)setNumberOfValidationWarnings:(unint64_t)a3;
- (void)setNumberOfValidations:(unint64_t)a3;
- (void)setOverrideProcessName:(id)a3;
- (void)setShouldCrashOnError:(BOOL)a3;
- (void)setShouldLogToConsole:(BOOL)a3;
- (void)setShouldPerformValidationChecks:(BOOL)a3;
- (void)setShouldReportToServer:(BOOL)a3;
- (void)setValidationReportingServices:(id)a3;
- (void)setValidationTargetName:(id)a3;
@end

@implementation AXValidationManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_20);
  }
  v2 = (void *)sharedInstance__shared_0;
  return v2;
}

uint64_t __37__AXValidationManager_sharedInstance__block_invoke()
{
  sharedInstance__shared_0 = objc_alloc_init(AXValidationManager);
  return MEMORY[0x1F41817F8]();
}

- (AXValidationManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXValidationManager;
  v2 = [(AXValidationManager *)&v5 init];
  if (v2)
  {
    AXSetValidationErrorLoggingFunction();
    AXSetUIAXReportSenderErrorLoggerFunction();
    if (_AXSReportValidationErrors())
    {
      AXLoadAccessibilityDebuggerIfNeeded();
      v3 = [NSClassFromString(&cfstr_Adtarget.isa) safeValueForKey:@"target"];
      [(AXValidationManager *)v2 setValidationReportingServices:v3];
    }
  }
  return v2;
}

- (void)performValidations:(id)a3 withPreValidationHandler:(id)a4 postValidationHandler:(id)a5
{
}

- (void)performValidations:(id)a3 withPreValidationHandler:(id)a4 postValidationHandler:(id)a5 safeCategoryInstallationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(AXValidationManager *)self installSafeCategoriesOffMainThread])
  {
    v14 = +[AXAccessQueue backgroundAccessQueue];
    v15 = AXLogValidations();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC6C000, v15, OS_LOG_TYPE_INFO, "Processing safe categories off main thread", buf, 2u);
    }
  }
  else
  {
    v14 = +[AXAccessQueue mainAccessQueue];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __121__AXValidationManager_performValidations_withPreValidationHandler_postValidationHandler_safeCategoryInstallationHandler___block_invoke;
  v20[3] = &unk_1E5673610;
  v20[4] = self;
  id v21 = v11;
  id v22 = v10;
  id v23 = v12;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v10;
  id v19 = v11;
  [v14 performSynchronousWritingBlock:v20];
}

uint64_t __121__AXValidationManager_performValidations_withPreValidationHandler_postValidationHandler_safeCategoryInstallationHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _resetState];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 && !(*(unsigned int (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 32))) {
    int v3 = 0;
  }
  else {
    int v3 = [*(id *)(a1 + 32) shouldPerformValidationChecks];
  }
  v4 = [*(id *)(a1 + 32) validationTargetName];

  if (v4)
  {
    if (!v3) {
      goto LABEL_17;
    }
  }
  else
  {
    objc_super v5 = NSString;
    v6 = AXProcessGetName();
    v7 = [v5 stringWithFormat:@"%@ (generic symbols)", v6];
    [*(id *)(a1 + 32) setValidationTargetName:v7];

    if (!v3) {
      goto LABEL_17;
    }
  }
  v8 = AXLogLoading();
  if (os_signpost_enabled(v8))
  {
    v9 = [*(id *)(a1 + 32) validationTargetName];
    *(_DWORD *)buf = 138412290;
    id v21 = v9;
    _os_signpost_emit_with_name_impl(&dword_18FC6C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Validations", "Target=%@", buf, 0xCu);
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, void))(v10 + 16))(v10, *(void *)(a1 + 32));
  }
  id v11 = AXLogLoading();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18FC6C000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Validations", "", buf, 2u);
  }

  uint64_t v12 = *(void *)(a1 + 56);
  if (v12) {
    (*(void (**)(uint64_t, void, uint64_t))(v12 + 16))(v12, *(void *)(a1 + 32), [*(id *)(a1 + 32) numberOfValidationErrors]);
  }
LABEL_17:
  if (*(void *)(a1 + 64))
  {
    id v13 = AXLogLoading();
    if (os_signpost_enabled(v13))
    {
      v14 = [*(id *)(a1 + 32) validationTargetName];
      *(_DWORD *)buf = 138412290;
      id v21 = v14;
      _os_signpost_emit_with_name_impl(&dword_18FC6C000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "InstallSafeCategories", "Target=%@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    v15 = AXLogLoading();
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18FC6C000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "InstallSafeCategories", "", buf, 2u);
    }
  }
  id v16 = *(unsigned char **)(a1 + 32);
  if (v3)
  {
    uint64_t v17 = [*(id *)(a1 + 32) numberOfValidationErrors];
    id v16 = *(unsigned char **)(a1 + 32);
    if (!v17 && v16[10] && !v16[11] && *(void *)(a1 + 64))
    {
      id v19 = [*(id *)(a1 + 32) overrideProcessName];
      [v16 sendValidationSuccessForProcessName:v19];

      id v16 = *(unsigned char **)(a1 + 32);
    }
    if (v16[8])
    {
      [v16 _printConsoleReport:*(void *)(a1 + 64) != 0 isDelayed:0];
      id v16 = *(unsigned char **)(a1 + 32);
    }
  }
  return [v16 _clearState];
}

- (void)installSafeCategories:(id)a3 afterDelay:(double)a4 validationTargetName:(id)a5 overrideProcessName:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v10)
  {
    id v13 = +[AXAccessQueue mainAccessQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __97__AXValidationManager_installSafeCategories_afterDelay_validationTargetName_overrideProcessName___block_invoke;
    v14[3] = &unk_1E5673638;
    v14[4] = self;
    id v15 = v12;
    id v16 = v11;
    id v17 = v10;
    [v13 afterDelay:v14 processWritingBlock:a4];
  }
}

uint64_t __97__AXValidationManager_installSafeCategories_afterDelay_validationTargetName_overrideProcessName___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _resetState];
  [*(id *)(a1 + 32) setOverrideProcessName:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "setValidationTargetName:");
  }
  else
  {
    uint64_t v2 = NSString;
    int v3 = AXProcessGetName();
    v4 = [v2 stringWithFormat:@"%@ (generic symbols)", v3];
    [*(id *)(a1 + 32) setValidationTargetName:v4];
  }
  objc_super v5 = AXLogLoading();
  if (os_signpost_enabled(v5))
  {
    v6 = [*(id *)(a1 + 32) validationTargetName];
    *(_DWORD *)buf = 138412290;
    id v11 = v6;
    _os_signpost_emit_with_name_impl(&dword_18FC6C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "InstallSafeCategories", "Target=%@", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  v7 = AXLogLoading();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18FC6C000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "InstallSafeCategories", "", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setNumberOfCategories:", objc_msgSend(*(id *)(a1 + 32), "numberOfCategories") + 1);
  v8 = *(unsigned char **)(a1 + 32);
  if (v8[8])
  {
    [v8 _printConsoleReport:1 isDelayed:1];
    v8 = *(unsigned char **)(a1 + 32);
  }
  return [v8 _clearState];
}

- (void)_resetState
{
  [(AXValidationManager *)self setShouldPerformValidationChecks:AXPerformValidationChecks()];
  [(AXValidationManager *)self setNumberOfValidationErrors:0];
  [(AXValidationManager *)self setNumberOfValidationWarnings:0];
  [(AXValidationManager *)self setValidationTargetName:0];
  [(AXValidationManager *)self setForceDoNotReport:0];
  [(AXValidationManager *)self setDebugBuild:0];
  [(AXValidationManager *)self setNumberOfValidations:0];
  [(AXValidationManager *)self setShouldLogToConsole:AXShouldLogValidationErrors()];
  [(AXValidationManager *)self setShouldCrashOnError:AXShouldCrashOnValidationErrors()];
  [(AXValidationManager *)self setShouldReportToServer:AXShouldReportValidationErrors()];
  int v3 = [MEMORY[0x1E4F1CA48] array];
  [(AXValidationManager *)self setConsoleErrorMessages:v3];

  id v4 = [MEMORY[0x1E4F1CA48] array];
  [(AXValidationManager *)self setConsoleWarningMessages:v4];
}

- (void)_clearState
{
  [(AXValidationManager *)self setConsoleErrorMessages:0];
  [(AXValidationManager *)self setConsoleWarningMessages:0];
}

- (void)_printEncodedConsoleReportForValidationRunner:(BOOL)a3 isDelayed:(BOOL)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  objc_super v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, a4);
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXValidationManager numberOfValidations](self, "numberOfValidations"));
  [v5 setObject:v6 forKeyedSubscript:@"validationCount"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXValidationManager numberOfCategories](self, "numberOfCategories"));
  [v5 setObject:v7 forKeyedSubscript:@"safeCategoryCount"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors"));
  [v5 setObject:v8 forKeyedSubscript:@"validationErrorCount"];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors"));
  [v5 setObject:v9 forKeyedSubscript:@"validationWarningCount"];

  id v10 = [(AXValidationManager *)self validationTargetName];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    uint64_t v12 = [(AXValidationManager *)self validationTargetName];
    [v5 setObject:v12 forKeyedSubscript:@"validationTarget"];
  }
  id v13 = AXProcessGetName();
  if ([v13 length]) {
    [v5 setObject:v13 forKeyedSubscript:@"validationProcess"];
  }
  v14 = [(AXValidationManager *)self overrideProcessName];
  if ([v14 length]) {
    [v5 setObject:v14 forKeyedSubscript:@"validationOverrideProcess"];
  }
  if ([(AXValidationManager *)self numberOfValidationErrors]
    || [(AXValidationManager *)self numberOfValidationWarnings])
  {
    int v15 = 0;
    id v16 = @"failed";
  }
  else
  {
    int v15 = 1;
    id v16 = @"success";
  }
  [v5 setObject:v16 forKeyedSubscript:@"validationResult"];
  id v17 = [(AXValidationManager *)self consoleErrorMessages];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    id v19 = [(AXValidationManager *)self consoleErrorMessages];
    [v5 setObject:v19 forKeyedSubscript:@"validationErrors"];
  }
  v20 = [(AXValidationManager *)self consoleWarningMessages];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    uint64_t v22 = [(AXValidationManager *)self consoleWarningMessages];
    [v5 setObject:v22 forKeyedSubscript:@"validationWarnings"];
  }
  id v23 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:8 error:0];
  id v24 = v23;
  if (v23)
  {
    v25 = [v23 base64EncodedStringWithOptions:0];
    v26 = AXLogValidationRunner();
    v27 = v26;
    if (v15)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 138412290;
        v29 = v25;
        _os_log_impl(&dword_18FC6C000, v27, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v28, 0xCu);
      }
    }
    else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      -[AXValidationManager _printEncodedConsoleReportForValidationRunner:isDelayed:]();
    }
  }
}

- (void)_printConsoleReport:(BOOL)a3 isDelayed:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2050000000;
  v7 = (void *)getAXSettingsClass_softClass_3;
  uint64_t v45 = getAXSettingsClass_softClass_3;
  if (!getAXSettingsClass_softClass_3)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v49 = __getAXSettingsClass_block_invoke_3;
    v50 = &unk_1E56725B8;
    v51 = &v42;
    __getAXSettingsClass_block_invoke_3((uint64_t)&buf);
    v7 = (void *)v43[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v42, 8);
  v9 = [v8 sharedInstance];
  int v10 = [v9 isAXValidationRunnerCollectingValidations];

  if (v10)
  {
    [(AXValidationManager *)self _printEncodedConsoleReportForValidationRunner:v5 isDelayed:v4];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28E78] string];
    uint64_t v12 = v11;
    if (v4) {
      [v11 appendString:@"(DELAYED) "];
    }
    if ([(AXValidationManager *)self isDebugBuild]) {
      [v12 appendString:@"(Build as DEBUG) "];
    }
    if (v5)
    {
      id v13 = NSString;
      unint64_t v14 = [(AXValidationManager *)self numberOfValidations];
      int v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXValidationManager numberOfCategories](self, "numberOfCategories"));
      id v16 = [v13 stringWithFormat:@"validating (%d) items and installing (%@) AX Safe Categories on ", v14, v15];
      [v12 appendString:v16];
    }
    else
    {
      [v12 appendString:@"validating "];
    }
    id v17 = [(AXValidationManager *)self validationTargetName];
    [v12 appendString:v17];

    uint64_t v18 = AXProcessGetName();
    [v12 appendFormat:@", In process: %@", v18];

    if ([(AXValidationManager *)self numberOfValidationErrors])
    {
      id v19 = [MEMORY[0x1E4F28E78] stringWithString:@"\n********************************************************************\n"];
      [v19 appendFormat:@"* AX: Failed %@. %lu errors:\n", v12, -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors")];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v20 = [(AXValidationManager *)self consoleErrorMessages];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v39;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v39 != v22) {
              objc_enumerationMutation(v20);
            }
            [v19 appendFormat:@"*\t%@\n", *(void *)(*((void *)&v38 + 1) + 8 * v23++)];
          }
          while (v21 != v23);
          uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v47 count:16];
        }
        while (v21);
      }

      [v19 appendString:@"********************************************************************\n"];
      id v24 = AXLogValidations();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[AXValidationManager _printConsoleReport:isDelayed:]();
      }
    }
    else
    {
      id v19 = [NSString stringWithFormat:@"****************** Finished %@. Success! *****************", v12];
      id v24 = AXLogValidations();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v19;
        _os_log_impl(&dword_18FC6C000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&buf, 0xCu);
      }
    }

    if ([(AXValidationManager *)self numberOfValidationWarnings])
    {
      v25 = [MEMORY[0x1E4F28E78] stringWithString:@"\n********************************************************************\n"];
      unint64_t v26 = [(AXValidationManager *)self numberOfValidationWarnings];
      unint64_t v27 = [(AXValidationManager *)self numberOfValidationWarnings];
      int v28 = "s";
      if (v27 == 1) {
        int v28 = "";
      }
      [v25 appendFormat:@"* AX: %lu warning%s generated while %@:\n", v26, v28, v12];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v29 = [(AXValidationManager *)self consoleWarningMessages];
      uint64_t v30 = [v29 countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v35;
        do
        {
          uint64_t v32 = 0;
          do
          {
            if (*(void *)v35 != v31) {
              objc_enumerationMutation(v29);
            }
            [v25 appendFormat:@"* %@\n", *(void *)(*((void *)&v34 + 1) + 8 * v32++)];
          }
          while (v30 != v32);
          uint64_t v30 = [v29 countByEnumeratingWithState:&v34 objects:v46 count:16];
        }
        while (v30);
      }

      [v25 appendString:@"********************************************************************\n"];
      v33 = AXLogValidations();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v25;
        _os_log_impl(&dword_18FC6C000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
}

- (BOOL)validateClass:(id)a3
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateClass:a3];
}

- (BOOL)client:(id)a3 validateClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  id v8 = _AXClassFromStringWithFallback(v7);
  Name = class_getName(v8);
  int v10 = strcmp(Name, "nil");
  if (!v10)
  {
    [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
    uint64_t v11 = [NSString stringWithFormat:@"Class Not Present: %@", v7];
    if (self->_shouldLogToConsole)
    {
      uint64_t v12 = [(AXValidationManager *)self consoleErrorMessages];
      [v12 addObject:v11];
    }
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      id v13 = [(AXValidationManager *)self overrideProcessName];
      [(AXValidationManager *)self sendValidateExceptionForClass:v7 errorMessage:v11 overrideProcessName:v13];
    }
    if (self->_shouldCrashOnError) {
      abort();
    }
  }
  return v10 != 0;
}

- (BOOL)validateClass:(id)a3 isKindOfClass:(id)a4
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateClass:a3 isKindOfClass:a4];
}

- (BOOL)client:(id)a3 validateClass:(id)a4 isKindOfClass:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  Superclass = _AXClassFromStringWithFallback(v9);
  uint64_t v12 = _AXClassFromStringWithFallback(v10);
  while (1)
  {
    id v13 = Superclass;
    if (!Superclass) {
      break;
    }
    Superclass = class_getSuperclass(Superclass);
    if (Superclass == v12)
    {
      [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
      goto LABEL_12;
    }
  }
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
  unint64_t v14 = [NSString stringWithFormat:@"%@: %@ is not a kind of %@", v8, v9, v10];
  if (self->_shouldLogToConsole)
  {
    int v15 = [(AXValidationManager *)self consoleErrorMessages];
    [v15 addObject:v14];
  }
  if (self->_shouldReportToServer && !self->_forceDoNotReport)
  {
    id v16 = [(AXValidationManager *)self overrideProcessName];
    [(AXValidationManager *)self sendValidateExceptionForClass:v9 isKindOfClass:v10 errorMessage:v14 overrideProcessName:v16];
  }
  if (self->_shouldCrashOnError) {
    abort();
  }

LABEL_12:
  return v13 != 0;
}

- (BOOL)validateClass:(id)a3 hasSwiftField:(id)a4 withSwiftType:(const char *)a5
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateClass:a3 hasSwiftField:a4 withSwiftType:a5];
}

- (BOOL)validateClass:(id)a3 hasSwiftFieldOfAnyClass:(id)a4
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateClass:a3 hasSwiftFieldOfAnyClass:a4];
}

- (BOOL)validateSwiftStruct:(id)a3
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateSwiftStruct:a3];
}

- (BOOL)validateSwiftStruct:(id)a3 hasSize:(int64_t)a4
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateSwiftStruct:a3 hasSize:a4];
}

- (BOOL)validateSwiftStruct:(id)a3 hasSwiftField:(id)a4 withSwiftType:(const char *)a5
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateSwiftStruct:a3 hasSwiftField:a4 withSwiftType:a5];
}

- (BOOL)validateSwiftStruct:(id)a3 hasSwiftFieldOfAnyClass:(id)a4
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateSwiftStruct:a3 hasSwiftFieldOfAnyClass:a4];
}

- (BOOL)validateSwiftEnum:(id)a3
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateSwiftEnum:a3];
}

- (BOOL)validateSwiftEnum:(id)a3 hasCase:(id)a4
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateSwiftEnum:a3 hasCase:a4];
}

- (BOOL)validateSwiftEnum:(id)a3 hasCase:(id)a4 withSwiftType:(const char *)a5
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateSwiftEnum:a3 hasCase:a4 withSwiftType:a5];
}

- (BOOL)validateSwiftEnum:(id)a3 hasCaseOfAnyClass:(id)a4
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateSwiftEnum:a3 hasCaseOfAnyClass:a4];
}

- (BOOL)client:(id)a3 validateClass:(id)a4 hasSwiftField:(id)a5 withSwiftType:(const char *)a6
{
  return [(AXValidationManager *)self _client:a3 validateClass:a4 hasSwiftField:a5 withTypeString:a6 isAnyClass:0];
}

- (BOOL)client:(id)a3 validateClass:(id)a4 hasSwiftFieldOfAnyClass:(id)a5
{
  return [(AXValidationManager *)self _client:a3 validateClass:a4 hasSwiftField:a5 withTypeString:0 isAnyClass:1];
}

- (BOOL)client:(id)a3 validateSwiftStruct:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  char v8 = _AXSwiftValidateStruct((uint64_t)v7);
  if ((v8 & 1) == 0)
  {
    [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
    id v9 = [NSString stringWithFormat:@"Struct Not Present: %@", v7];
    if (self->_shouldLogToConsole)
    {
      id v10 = [(AXValidationManager *)self consoleErrorMessages];
      [v10 addObject:v9];
    }
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      uint64_t v11 = [(AXValidationManager *)self overrideProcessName];
      [(AXValidationManager *)self sendValidateExceptionForClass:v7 errorMessage:v9 overrideProcessName:v11];
    }
    if (self->_shouldCrashOnError) {
      abort();
    }
  }
  return v8;
}

- (BOOL)client:(id)a3 validateSwiftStruct:(id)a4 hasSize:(int64_t)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  id v10 = [MEMORY[0x1E4F1CA48] array];
  if ((_AXSwiftValidateStruct((uint64_t)v9) & 1) == 0)
  {
    [v10 addObject:@"Swift field doesn't exist"];
    if (!_AXSwiftValidateStructHasSize((uint64_t)v9, a5)) {
      [v10 addObject:@"Swift field isn't class type"];
    }
  }
  uint64_t v11 = [v10 count];
  if (v11)
  {
    [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
    uint64_t v12 = (void *)MEMORY[0x1E4F28E78];
    id v13 = [NSNumber numberWithInteger:a5];
    id v23 = v8;
    unint64_t v14 = [v12 stringWithFormat:@"%@: Swift enum %@ doesn't match size: %@", v8, v9, v13];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          [v14 appendFormat:@" %@", *(void *)(*((void *)&v24 + 1) + 8 * i)];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v17);
    }

    if (self->_shouldLogToConsole)
    {
      v20 = [(AXValidationManager *)self consoleErrorMessages];
      [v20 addObject:v14];
    }
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      uint64_t v21 = [(AXValidationManager *)self overrideProcessName];
      [(AXValidationManager *)self sendValidateExceptionForClass:v9 errorMessage:v14 overrideProcessName:v21];
    }
    id v8 = v23;
    if (self->_shouldCrashOnError) {
      abort();
    }
  }
  return v11 == 0;
}

- (BOOL)client:(id)a3 validateSwiftStruct:(id)a4 hasSwiftField:(id)a5 withSwiftType:(const char *)a6
{
  return [(AXValidationManager *)self _client:a3 validateStruct:a4 hasSwiftField:a5 withTypeString:a6 isAnyClass:0];
}

- (BOOL)client:(id)a3 validateSwiftStruct:(id)a4 hasSwiftFieldOfAnyClass:(id)a5
{
  return [(AXValidationManager *)self _client:a3 validateStruct:a4 hasSwiftField:a5 withTypeString:0 isAnyClass:1];
}

- (BOOL)_client:(id)a3 validateStruct:(id)a4 hasSwiftField:(id)a5 withTypeString:(const char *)a6 isAnyClass:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a4;
  id v13 = a5;
  unint64_t v14 = (void *)MEMORY[0x1E4F1CA48];
  id v15 = a3;
  uint64_t v16 = [v14 array];
  if ((_AXSwiftValidateStructHasField((uint64_t)v12, (uint64_t)v13) & 1) == 0)
  {
    uint64_t v17 = @"Swift field doesn't exist";
    goto LABEL_6;
  }
  if (v7)
  {
    if ((_AXSwiftValidateStructHasFieldOfAnyClass((uint64_t)v12, (uint64_t)v13) & 1) == 0)
    {
      uint64_t v17 = @"Swift field isn't class type";
LABEL_6:
      [v16 addObject:v17];
    }
  }
  else
  {
    uint64_t v18 = [NSString stringWithUTF8String:a6];
    if ((_AXSwiftValidateStructHasFieldWithTypeString((uint64_t)v12, (uint64_t)v13, (uint64_t)v18) & 1) == 0)
    {
      id v19 = NSString;
      v20 = _AXSwiftValidateStructGetFieldTypeString((uint64_t)v12, (uint64_t)v13);
      uint64_t v21 = [v19 stringWithFormat:@"Swift field doesn't match: (%@) expected: (%@)", v18, v20];
      [v16 addObject:v21];
    }
  }
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  BOOL v22 = [(AXValidationManager *)self _client:v15 validateType:v12 hasSwiftField:v13 handleSwiftValidationProblems:v16];

  return v22;
}

- (BOOL)client:(id)a3 validateSwiftEnum:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  char v8 = _AXSwiftValidateEnum((uint64_t)v7);
  if ((v8 & 1) == 0)
  {
    id v9 = [NSString stringWithFormat:@"Enum Not Present: %@", v7];
    if (self->_shouldLogToConsole)
    {
      id v10 = [(AXValidationManager *)self consoleErrorMessages];
      [v10 addObject:v9];
    }
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      uint64_t v11 = [(AXValidationManager *)self overrideProcessName];
      [(AXValidationManager *)self sendValidateExceptionForClass:v7 errorMessage:v9 overrideProcessName:v11];
    }
    if (self->_shouldCrashOnError) {
      abort();
    }
  }
  return v8;
}

- (BOOL)client:(id)a3 validateSwiftEnum:(id)a4 hasCase:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1E4F1CA48];
  id v11 = a3;
  id v12 = [v10 array];
  if ((_AXSwiftValidateEnumHasCase((uint64_t)v8, (uint64_t)v9) & 1) == 0) {
    [v12 addObject:@"Swift case doesn't exist"];
  }
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  BOOL v13 = [(AXValidationManager *)self _client:v11 validateType:v8 hasSwiftField:v9 handleSwiftValidationProblems:v12];

  return v13;
}

- (BOOL)client:(id)a3 validateSwiftEnum:(id)a4 hasCase:(id)a5 withSwiftType:(const char *)a6
{
  return [(AXValidationManager *)self _client:a3 validateSwiftEnum:a4 hasCase:a5 withTypeString:a6 isAnyClass:0];
}

- (BOOL)client:(id)a3 validateSwiftEnum:(id)a4 hasCaseOfAnyClass:(id)a5
{
  return [(AXValidationManager *)self _client:a3 validateSwiftEnum:a4 hasCase:a5 withTypeString:0 isAnyClass:1];
}

- (BOOL)_client:(id)a3 validateSwiftEnum:(id)a4 hasCase:(id)a5 withTypeString:(const char *)a6 isAnyClass:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a4;
  id v13 = a5;
  unint64_t v14 = (void *)MEMORY[0x1E4F1CA48];
  id v15 = a3;
  uint64_t v16 = [v14 array];
  if ((_AXSwiftValidateEnumHasCase((uint64_t)v12, (uint64_t)v13) & 1) == 0)
  {
    uint64_t v17 = @"Swift case doesn't exist";
    goto LABEL_6;
  }
  if (v7)
  {
    if ((_AXSwiftValidateEnumHasCaseOfAnyClass((uint64_t)v12, (uint64_t)v13) & 1) == 0)
    {
      uint64_t v17 = @"Swift case isn't class type";
LABEL_6:
      [v16 addObject:v17];
    }
  }
  else
  {
    uint64_t v18 = [NSString stringWithUTF8String:a6];
    if ((_AXSwiftValidateEnumHasCaseWithTypeString((uint64_t)v12, (uint64_t)v13, (uint64_t)v18) & 1) == 0)
    {
      id v19 = NSString;
      v20 = _AXSwiftValidateEnumGetCaseTypeString((uint64_t)v12, (uint64_t)v13);
      uint64_t v21 = [v19 stringWithFormat:@"Swift case doesn't match: (%@) expected: (%@)", v18, v20];
      [v16 addObject:v21];
    }
  }
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  BOOL v22 = [(AXValidationManager *)self _client:v15 validateType:v12 hasSwiftField:v13 handleSwiftValidationProblems:v16];

  return v22;
}

- (BOOL)_client:(id)a3 validateClass:(id)a4 hasSwiftField:(id)a5 withTypeString:(const char *)a6 isAnyClass:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a4;
  id v13 = a5;
  unint64_t v14 = (void *)MEMORY[0x1E4F1CA48];
  id v15 = a3;
  uint64_t v16 = [v14 array];
  uint64_t v17 = _AXClassFromStringWithFallback(v12);
  if (!v17)
  {
    id v19 = @"Class doesn't exist";
    goto LABEL_8;
  }
  uint64_t v18 = (uint64_t)v17;
  if ((_AXSwiftValidateClassHasField((uint64_t)v17, (uint64_t)v13) & 1) == 0)
  {
    id v19 = @"Swift field doesn't exist";
    goto LABEL_8;
  }
  if (v7)
  {
    if ((_AXSwiftValidateClassHasFieldOfAnyClass(v18, (uint64_t)v13) & 1) == 0)
    {
      id v19 = @"Swift field isn't class type";
LABEL_8:
      [v16 addObject:v19];
    }
  }
  else
  {
    BOOL v22 = [NSString stringWithUTF8String:a6];
    if ((_AXSwiftValidateClassHasFieldWithTypeString() & 1) == 0)
    {
      id v23 = NSString;
      long long v24 = _AXSwiftValidateClassGetFieldTypeString();
      long long v25 = [v23 stringWithFormat:@"Swift field doesn't match: (%@) expected: (%@)", v22, v24];
      [v16 addObject:v25];
    }
  }
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  BOOL v20 = [(AXValidationManager *)self _client:v15 validateType:v12 hasSwiftField:v13 handleSwiftValidationProblems:v16];

  return v20;
}

- (BOOL)_client:(id)a3 validateType:(id)a4 hasSwiftField:(id)a5 handleSwiftValidationProblems:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  uint64_t v14 = [v13 count];
  if (v14)
  {
    [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
    id v24 = v10;
    id v25 = v11;
    id v15 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@: Swift field: (%@) on type: %@.", v10, v12, v11];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = v13;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          [v15 appendFormat:@" %@", *(void *)(*((void *)&v26 + 1) + 8 * i)];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v18);
    }

    if (self->_shouldLogToConsole)
    {
      uint64_t v21 = [(AXValidationManager *)self consoleErrorMessages];
      [v21 addObject:v15];
    }
    id v11 = v25;
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      BOOL v22 = [(AXValidationManager *)self overrideProcessName];
      [(AXValidationManager *)self sendValidateExceptionForClass:v25 hasInstanceVariable:v12 errorMessage:v15 overrideProcessName:v22];
    }
    if (self->_shouldCrashOnError) {
      abort();
    }

    id v10 = v24;
  }

  return v14 == 0;
}

- (BOOL)validateClass:(id)a3 hasInstanceVariable:(id)a4 withType:(const char *)a5
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateClass:a3 hasInstanceVariable:a4 withType:a5];
}

- (BOOL)client:(id)a3 validateClass:(id)a4 hasInstanceVariable:(id)a5 withType:(const char *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = _AXClassFromStringWithFallback(v11);
  id v14 = v12;
  InstanceVariable = class_getInstanceVariable(v13, (const char *)[v14 UTF8String]);
  TypeEncoding = ivar_getTypeEncoding(InstanceVariable);
  if (!a6)
  {
    id v19 = 0;
    goto LABEL_23;
  }
  uint64_t v17 = TypeEncoding;
  if (strlen(a6) >= 2)
  {
    uint64_t v18 = [NSString stringWithUTF8String:a6];
    if ([v18 isEqualToString:@"NSInteger"])
    {
      a6 = "q";
    }
    else if ([v18 isEqualToString:@"NSUInteger"])
    {
      a6 = "Q";
    }
    else if ([v18 isEqualToString:@"int"])
    {
      a6 = "i";
    }
    else if ([v18 isEqualToString:@"BOOL"])
    {
      a6 = "B";
    }
    else if ([v18 isEqualToString:@"CGFloat"])
    {
      a6 = "d";
    }
  }
  BOOL v20 = [NSString stringWithUTF8String:a6];
  uint64_t v21 = [NSString stringWithFormat:@"@\"%@\"", v20];

  a6 = [NSString stringWithUTF8String:a6];
  if (v17 && !strcmp(v17, "B") && [(id)a6 isEqualToString:@"c"])
  {

    a6 = (const char *)@"B";
  }
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  if (v17)
  {
    id v19 = v21;
    if (strcmp(v17, (const char *)[v19 UTF8String]))
    {
      BOOL v22 = (id) a6;
      if (!strcmp(v17, (const char *)[v22 UTF8String]))
      {
        BOOL v23 = 1;
        a6 = v22;
        goto LABEL_32;
      }
      [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
      [NSString stringWithFormat:@"%@: %@ : Ivar is not the right type: %@ [AX: %@ MAINLINE: %s]", v10, v11, v14, v19, v17];
      goto LABEL_25;
    }
LABEL_23:
    BOOL v23 = 1;
    goto LABEL_32;
  }
  [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
  [NSString stringWithFormat:@"%@: %@ : Ivar does not exist: %@", v10, v11, v14, v28, v29];
  id v24 = LABEL_25:;
  if (self->_shouldLogToConsole)
  {
    id v25 = [(AXValidationManager *)self consoleErrorMessages];
    [v25 addObject:v24];
  }
  if (self->_shouldReportToServer && !self->_forceDoNotReport)
  {
    long long v26 = [(AXValidationManager *)self overrideProcessName];
    [(AXValidationManager *)self sendValidateExceptionForClass:v11 hasInstanceVariable:v14 errorMessage:v24 overrideProcessName:v26];
  }
  if (self->_shouldCrashOnError) {
    abort();
  }

  BOOL v23 = 0;
  id v19 = v21;
LABEL_32:

  return v23;
}

- (BOOL)_client:(id)a3 validateClass:(id)a4 hasMethod:(id)a5 methodType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = _AXClassFromStringWithFallback(v11);
  id v14 = [v12 stringByReplacingOccurrencesOfString:@" " withString:&stru_1EDF601D0];

  id v15 = NSSelectorFromString(v14);
  if (v6) {
    Method InstanceMethod = class_getInstanceMethod(v13, v15);
  }
  else {
    Method InstanceMethod = class_getClassMethod(v13, v15);
  }
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66__AXValidationManager__client_validateClass_hasMethod_methodType___block_invoke;
  v23[3] = &unk_1E5673660;
  v23[4] = &v24;
  v23[5] = InstanceMethod;
  [(AXValidationManager *)self _iterateMethodsOfType:v6 onClass:v13 block:v23];
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  int v17 = *((unsigned __int8 *)v25 + 24);
  if (!*((unsigned char *)v25 + 24))
  {
    [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
    uint64_t v18 = @"Instance";
    if (!v6) {
      uint64_t v18 = @"Class";
    }
    id v19 = [NSString stringWithFormat:@"%@: %@ %@ method not present: %@", v10, v11, v18, v14];
    if (self->_shouldLogToConsole)
    {
      BOOL v20 = [(AXValidationManager *)self consoleErrorMessages];
      [v20 addObject:v19];
    }
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      uint64_t v21 = [(AXValidationManager *)self overrideProcessName];
      [(AXValidationManager *)self sendValidateExceptionForClass:v11 hasInstanceMethod:v14 errorMessage:v19 overrideProcessName:v21];
    }
    if (self->_shouldCrashOnError) {
      abort();
    }
  }
  _Block_object_dispose(&v24, 8);

  return v17 != 0;
}

uint64_t __66__AXValidationManager__client_validateClass_hasMethod_methodType___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 40) == a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)_client:(id)a3 validateClass:(id)a4 hasMethod:(id)a5 methodType:(int)a6 returnType:(id)a7 arguments:(id)a8
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v42 = a4;
  id v39 = a7;
  id v40 = a8;
  id v14 = (void *)MEMORY[0x1E4F1CA48];
  id v15 = a5;
  id v16 = [v14 array];
  int v17 = _AXClassFromStringWithFallback(v42);
  aSelectorName = [v15 stringByReplacingOccurrencesOfString:@" " withString:&stru_1EDF601D0];

  uint64_t v18 = NSSelectorFromString(aSelectorName);
  if (a6) {
    Method InstanceMethod = class_getInstanceMethod(v17, v18);
  }
  else {
    Method InstanceMethod = class_getClassMethod(v17, v18);
  }
  BOOL v20 = InstanceMethod;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __87__AXValidationManager__client_validateClass_hasMethod_methodType_returnType_arguments___block_invoke;
  v51[3] = &unk_1E5673660;
  v51[4] = &v52;
  v51[5] = InstanceMethod;
  [(AXValidationManager *)self _iterateMethodsOfType:a6 onClass:v17 block:v51];
  if (*((unsigned char *)v53 + 24))
  {
    uint64_t v21 = method_copyReturnType(v20);
    if (v21)
    {
      BOOL v22 = [NSString stringWithUTF8String:v21];
      if (([v22 isEqualToString:v39] & 1) == 0)
      {
        BOOL v23 = [NSString stringWithFormat:@"Incorrect return type: expected:%@ actual:%@", v39, v22];
        [v16 addObject:v23];
      }
      free(v21);
    }
    else
    {
      [v16 addObject:@"Unable to determine return type."];
    }
    uint64_t v24 = method_getNumberOfArguments(v20) - 2;
    if (v24 != [v40 count])
    {
      id v25 = NSString;
      uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v40, "count"));
      char v27 = [NSNumber numberWithUnsignedInteger:v24];
      uint64_t v28 = [v25 stringWithFormat:@"Incorrect argument count: expected:%@ actual:%@", v26, v27];
      [v16 addObject:v28];
    }
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __87__AXValidationManager__client_validateClass_hasMethod_methodType_returnType_arguments___block_invoke_2;
    v48[3] = &unk_1E5673688;
    v50 = v20;
    id v49 = v16;
    [v40 enumerateObjectsUsingBlock:v48];
  }
  else
  {
    [v16 addObject:@"Method does not exist"];
  }
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  uint64_t v29 = [v16 count];
  if (v29)
  {
    [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
    uint64_t v30 = @"Instance";
    if (!a6) {
      uint64_t v30 = @"Class";
    }
    uint64_t v31 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@: %@ method: (%@) on class: %@.", v13, v30, aSelectorName, v42];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v32 = v16;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v45 != v34) {
            objc_enumerationMutation(v32);
          }
          [v31 appendFormat:@" %@", *(void *)(*((void *)&v44 + 1) + 8 * i)];
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v44 objects:v56 count:16];
      }
      while (v33);
    }

    if (self->_shouldLogToConsole)
    {
      long long v36 = [(AXValidationManager *)self consoleErrorMessages];
      [v36 addObject:v31];
    }
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      long long v37 = [(AXValidationManager *)self overrideProcessName];
      if (a6) {
        [(AXValidationManager *)self sendValidateExceptionForClass:v42 hasInstanceMethod:aSelectorName errorMessage:v31 overrideProcessName:v37];
      }
      else {
        [(AXValidationManager *)self sendValidateExceptionForClass:v42 hasClassMethod:aSelectorName errorMessage:v31 overrideProcessName:v37];
      }
    }
    if (self->_shouldCrashOnError) {
      abort();
    }
  }
  _Block_object_dispose(&v52, 8);

  return v29 == 0;
}

uint64_t __87__AXValidationManager__client_validateClass_hasMethod_methodType_returnType_arguments___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(result + 40) == a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __87__AXValidationManager__client_validateClass_hasMethod_methodType_returnType_arguments___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  BOOL v5 = method_copyArgumentType(*(Method *)(a1 + 40), (int)a3 + 2);
  if (v5)
  {
    uint64_t v6 = v5;
    BOOL v7 = [NSString stringWithUTF8String:v5];
    if (([v7 isEqualToString:v15] & 1) == 0)
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = NSString;
      id v10 = [NSNumber numberWithUnsignedInteger:a3];
      id v11 = [v9 stringWithFormat:@"Incorrect argument at position:%@\n expected:%@\n actual:%@", v10, v15, v7];
      [v8 addObject:v11];
    }
    free(v6);
  }
  else
  {
    id v12 = *(void **)(a1 + 32);
    id v13 = NSString;
    BOOL v7 = [NSNumber numberWithUnsignedInteger:a3];
    id v14 = [v13 stringWithFormat:@"Actual arg not found at position:%@ expected:%@", v7, v15];
    [v12 addObject:v14];
  }
}

- (BOOL)validateClass:(id)a3 hasClassMethod:(id)a4 withFullSignature:(const char *)a5
{
  return [(AXValidationManager *)self _client:AXValidationClientAccessibility validateClass:a3 hasClassMethod:a4 withFullSignature:a5 argList:&v6];
}

- (BOOL)client:(id)a3 validateClass:(id)a4 hasClassMethod:(id)a5 withFullSignature:(const char *)a6
{
  return [(AXValidationManager *)self _client:a3 validateClass:a4 hasClassMethod:a5 withFullSignature:a6 argList:&v7];
}

- (BOOL)_client:(id)a3 validateClass:(id)a4 hasClassMethod:(id)a5 withFullSignature:(const char *)a6 argList:(char *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v21 = a7;
  id v15 = [NSString stringWithUTF8String:a6];
  id v16 = [MEMORY[0x1E4F1CA48] array];
  while (1)
  {
    int v17 = v21;
    v21 += 8;
    if (!*(void *)v17) {
      break;
    }
    uint64_t v18 = objc_msgSend(NSString, "stringWithUTF8String:");
    [v16 addObject:v18];
  }
  BOOL v19 = [(AXValidationManager *)self _client:v12 validateClass:v13 hasMethod:v14 methodType:0 returnType:v15 arguments:v16];

  return v19;
}

- (BOOL)client:(id)a3 validateClass:(id)a4 hasInstanceMethod:(id)a5 withFullSignature:(const char *)a6 argList:(char *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v21 = a7;
  id v15 = [NSString stringWithUTF8String:a6];
  id v16 = [MEMORY[0x1E4F1CA48] array];
  while (1)
  {
    int v17 = v21;
    v21 += 8;
    if (!*(void *)v17) {
      break;
    }
    uint64_t v18 = objc_msgSend(NSString, "stringWithUTF8String:");
    [v16 addObject:v18];
  }
  BOOL v19 = [(AXValidationManager *)self _client:v12 validateClass:v13 hasMethod:v14 methodType:1 returnType:v15 arguments:v16];

  return v19;
}

- (BOOL)client:(id)a3 validateClass:(id)a4 hasInstanceMethod:(id)a5 withFullSignature:(const char *)a6
{
  return [(AXValidationManager *)self client:a3 validateClass:a4 hasInstanceMethod:a5 withFullSignature:a6 argList:&v7];
}

- (BOOL)validateClass:(id)a3 hasInstanceMethod:(id)a4 withFullSignature:(const char *)a5
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateClass:a3 hasInstanceMethod:a4 withFullSignature:a5 argList:&v6];
}

- (BOOL)validateClass:(id)a3 hasProperty:(id)a4 withType:(const char *)a5
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateClass:a3 hasProperty:a4 customGetter:0 customSetter:0 withType:a5];
}

- (BOOL)validateClass:(id)a3 hasProperty:(id)a4 customGetter:(id)a5 customSetter:(id)a6 withType:(const char *)a7
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateClass:a3 hasProperty:a4 customGetter:a5 customSetter:a6 withType:a7];
}

- (BOOL)client:(id)a3 validateClass:(id)a4 hasProperty:(id)a5 withType:(const char *)a6
{
  return [(AXValidationManager *)self client:a3 validateClass:a4 hasProperty:a5 customGetter:0 customSetter:0 withType:a6];
}

- (BOOL)client:(id)a3 validateClass:(id)a4 hasProperty:(id)a5 customGetter:(id)a6 customSetter:(id)a7 withType:(const char *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v44 = 0;
  long long v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__AXValidationManager_client_validateClass_hasProperty_customGetter_customSetter_withType___block_invoke;
  aBlock[3] = &unk_1E56736B0;
  aBlock[4] = self;
  id v19 = v15;
  id v41 = v19;
  id v20 = v16;
  id v42 = v20;
  v43 = &v44;
  uint64_t v21 = (void (**)(void *, void *))_Block_copy(aBlock);
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  BOOL v22 = _AXClassFromStringWithFallback(v19);
  id v23 = v20;
  Property = class_getProperty(v22, (const char *)[v23 UTF8String]);
  id v25 = Property;
  if (Property)
  {
    if (a8)
    {
      uint64_t v26 = property_copyAttributeValue(Property, "T");
      char v27 = v26;
      if (v26)
      {
        if (strcmp(v26, a8) && (*v27 != 64 || *a8 != 64))
        {
          long long v35 = [NSString stringWithFormat:@"%@: %@ Property: (%@) had wrong type:(%s) expected: (%s)", v14, v19, v23, v27, a8];
          v21[2](v21, v35);

LABEL_33:
          free(v27);
          goto LABEL_34;
        }
        uint64_t v28 = property_copyAttributeValue(v25, "G");
        uint64_t v29 = property_copyAttributeValue(v25, "S");
        if (!v17 && v28)
        {
          uint64_t v30 = [NSString stringWithFormat:@"%@: %@ Property: (%@) has unexpected custom getter: (%s)", v14, v19, v23, v28];
          v21[2](v21, v30);
        }
        if (!v18 && v29)
        {
          uint64_t v31 = [NSString stringWithFormat:@"%@: %@ Property: (%@) has unexpected custom setter: (%s)", v14, v19, v23, v29];
          v21[2](v21, v31);
        }
        if (v17)
        {
          if (v28)
          {
            id v32 = v17;
            if (!strcmp(v28, (const char *)[v32 UTF8String])) {
              goto LABEL_23;
            }
            uint64_t v33 = [NSString stringWithFormat:@"%@: %@ Property: (%@) has unexpected custom getter: (%s) expected:(%@)", v14, v19, v23, v28, v32];
            v21[2](v21, v33);
          }
          else
          {
            uint64_t v33 = [NSString stringWithFormat:@"%@: %@ Property: (%@) does not have custom getter: (%@)", v14, v19, v23, v17];
            v21[2](v21, v33);
          }
        }
LABEL_23:
        if (v18)
        {
          if (!v29)
          {
            long long v37 = [NSString stringWithFormat:@"%@: %@ Property: (%@) does not have custom setter: (%@)", v14, v19, v23, v18];
            v21[2](v21, v37);
            goto LABEL_28;
          }
          id v36 = v18;
          if (strcmp(v29, (const char *)[v36 UTF8String]))
          {
            long long v37 = [NSString stringWithFormat:@"%@: %@ Property: (%@) has unexpected custom setter: (%s) expected:(%@)", v14, v19, v23, v29, v36];
            v21[2](v21, v37);
LABEL_28:
          }
        }
        if (v28) {
          free(v28);
        }
        if (v29) {
          free(v29);
        }
        goto LABEL_33;
      }
    }
    uint64_t v34 = [NSString stringWithFormat:@"%@: %@ Property missing type information: %@", v14, v19, v23];
    v21[2](v21, v34);
  }
  else
  {
    [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
    uint64_t v34 = [NSString stringWithFormat:@"%@: %@ Property not present: %@", v14, v19, v23];
    v21[2](v21, v34);
  }

LABEL_34:
  BOOL v38 = *((unsigned char *)v45 + 24) == 0;

  _Block_object_dispose(&v44, 8);
  return v38;
}

void __91__AXValidationManager_client_validateClass_hasProperty_customGetter_customSetter_withType___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfValidationErrors:", objc_msgSend(*(id *)(a1 + 32), "numberOfValidationErrors") + 1);
  int v3 = *(unsigned char **)(a1 + 32);
  if (v3[8])
  {
    BOOL v4 = [*(id *)(a1 + 32) consoleErrorMessages];
    [v4 addObject:v8];

    int v3 = *(unsigned char **)(a1 + 32);
  }
  if (v3[10] && !v3[11])
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = [v3 overrideProcessName];
    [v3 sendValidateExceptionForClass:v5 hasProperty:v6 errorMessage:v8 overrideProcessName:v7];

    int v3 = *(unsigned char **)(a1 + 32);
  }
  if (v3[9]) {
    abort();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

- (BOOL)validateClass:(id)a3 conformsToProtocol:(id)a4
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateClass:a3 conformsToProtocol:a4];
}

- (BOOL)client:(id)a3 validateClass:(id)a4 conformsToProtocol:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (NSString *)a5;
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  id v11 = _AXClassFromStringWithFallback(v9);
  NSProtocolFromString(v10);
  id v12 = (Protocol *)objc_claimAutoreleasedReturnValue();
  BOOL v13 = class_conformsToProtocol(v11, v12);

  if (!v13)
  {
    [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
    id v14 = [NSString stringWithFormat:@"%@: Class:%@ Does not conform to Protocol:%@", v8, v9, v10];
    if (self->_shouldLogToConsole)
    {
      id v15 = [(AXValidationManager *)self consoleErrorMessages];
      [v15 addObject:v14];
    }
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      id v16 = [(AXValidationManager *)self overrideProcessName];
      [(AXValidationManager *)self sendValidateExceptionForClass:v9 conformsToProtocol:v10 errorMessage:v14 overrideProcessName:v16];
    }
    if (self->_shouldCrashOnError) {
      abort();
    }
  }
  return v13;
}

- (BOOL)validateProtocol:(id)a3 conformsToProtocol:(id)a4
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateProtocol:a3 conformsToProtocol:a4];
}

- (BOOL)client:(id)a3 validateProtocol:(id)a4 conformsToProtocol:(id)a5
{
  id v8 = a3;
  id v9 = (NSString *)a4;
  id v10 = (NSString *)a5;
  NSProtocolFromString(v9);
  id v11 = (Protocol *)objc_claimAutoreleasedReturnValue();
  NSProtocolFromString(v10);
  id v12 = (Protocol *)objc_claimAutoreleasedReturnValue();
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  BOOL v13 = protocol_conformsToProtocol(v11, v12);
  if (!v13)
  {
    [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
    id v14 = [NSString stringWithFormat:@"%@: %@ Protocol does not conform to protocol: %@", v8, v9, v10];
    if (self->_shouldLogToConsole)
    {
      id v15 = [(AXValidationManager *)self consoleErrorMessages];
      [v15 addObject:v14];
    }
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      id v16 = [(AXValidationManager *)self overrideProcessName];
      [(AXValidationManager *)self sendValidateExceptionForProtocol:v9 conformsToProtocol:v10 errorMessage:v14 overrideProcessName:v16];
    }
    if (self->_shouldCrashOnError) {
      abort();
    }
  }
  return v13;
}

- (BOOL)validateProtocol:(id)a3 hasMethod:(id)a4 isInstanceMethod:(BOOL)a5 isRequired:(BOOL)a6
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateProtocol:a3 hasMethod:a4 isInstanceMethod:a5 isRequired:a6];
}

- (BOOL)client:(id)a3 validateProtocol:(id)a4 hasMethod:(id)a5 isInstanceMethod:(BOOL)a6 isRequired:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  BOOL v13 = (NSString *)a4;
  id v14 = a5;
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  NSProtocolFromString(v13);
  id v15 = (Protocol *)objc_claimAutoreleasedReturnValue();
  id v16 = [v14 stringByReplacingOccurrencesOfString:@" " withString:&stru_1EDF601D0];

  id v17 = NSSelectorFromString(v16);
  SEL name = protocol_getMethodDescription(v15, v17, v7, v8).name;
  if (!name)
  {
    [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
    id v19 = @"optional";
    if (v7) {
      id v19 = @"required";
    }
    id v20 = @"class";
    if (v8) {
      id v20 = @"instance";
    }
    uint64_t v21 = [NSString stringWithFormat:@"%@: %@ Protocol %@ %@ method not present: %@", v12, v13, v19, v20, v16];
    if (self->_shouldLogToConsole)
    {
      BOOL v22 = [(AXValidationManager *)self consoleErrorMessages];
      [v22 addObject:v21];
    }
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      id v23 = [(AXValidationManager *)self overrideProcessName];
      [(AXValidationManager *)self sendValidateExceptionForProtocol:v13 hasMethod:v16 errorMessage:v21 overrideProcessName:v23];
    }
    if (self->_shouldCrashOnError) {
      abort();
    }
  }
  return name != 0;
}

- (BOOL)validateProtocol:(id)a3 hasOptionalInstanceMethod:(id)a4
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateProtocol:a3 hasOptionalInstanceMethod:a4];
}

- (BOOL)client:(id)a3 validateProtocol:(id)a4 hasOptionalInstanceMethod:(id)a5
{
  return [(AXValidationManager *)self client:a3 validateProtocol:a4 hasMethod:a5 isInstanceMethod:1 isRequired:0];
}

- (BOOL)validateProtocol:(id)a3 hasRequiredInstanceMethod:(id)a4
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateProtocol:a3 hasRequiredInstanceMethod:a4];
}

- (BOOL)client:(id)a3 validateProtocol:(id)a4 hasRequiredInstanceMethod:(id)a5
{
  return [(AXValidationManager *)self client:a3 validateProtocol:a4 hasMethod:a5 isInstanceMethod:1 isRequired:1];
}

- (BOOL)validateProtocol:(id)a3 hasOptionalClassMethod:(id)a4
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateProtocol:a3 hasMethod:a4 isInstanceMethod:0 isRequired:0];
}

- (BOOL)client:(id)a3 validateProtocol:(id)a4 hasOptionalClassMethod:(id)a5
{
  return [(AXValidationManager *)self client:a3 validateProtocol:a4 hasMethod:a5 isInstanceMethod:0 isRequired:0];
}

- (BOOL)validateProtocol:(id)a3 hasRequiredClassMethod:(id)a4
{
  return [(AXValidationManager *)self client:AXValidationClientAccessibility validateProtocol:a3 hasMethod:a4 isInstanceMethod:0 isRequired:1];
}

- (BOOL)client:(id)a3 validateProtocol:(id)a4 hasRequiredClassMethod:(id)a5
{
  return [(AXValidationManager *)self client:a3 validateProtocol:a4 hasMethod:a5 isInstanceMethod:0 isRequired:1];
}

- (void)_iterateMethodsOfType:(int)a3 onClass:(Class)Class block:(id)a5
{
  BOOL v7 = (void (**)(id, Method, unsigned char *))a5;
  if (!a3) {
    Class = object_getClass(Class);
  }
  unsigned int outCount = 0;
  BOOL v8 = class_copyMethodList(Class, &outCount);
  if (v8 && outCount)
  {
    id v9 = v8;
    unint64_t v10 = 0;
    char v11 = 0;
    do
    {
      v7[2](v7, v9[v10], &v11);
      if (v11) {
        break;
      }
      ++v10;
    }
    while (v10 < outCount);
    free(v9);
  }
}

- (id)_nameForMethod:(objc_method *)a3
{
  if (a3)
  {
    Name = method_getName(a3);
    if (Name && (uint64_t v5 = sel_getName(Name)) != 0)
    {
      uint64_t v6 = [NSString stringWithUTF8String:v5];
    }
    else
    {
      uint64_t v6 = @"(null)";
    }
  }
  else
  {
    uint64_t v6 = @"(null)";
  }
  return v6;
}

- (void)_generateWarningsForPrefixedMethodNames:(id)a3 client:(id)a4 methodType:(int)a5 methodName:(id)a6 className:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if ([v12 count])
  {
    [(AXValidationManager *)self setNumberOfValidationWarnings:[(AXValidationManager *)self numberOfValidationWarnings] + 1];
    id v16 = [MEMORY[0x1E4F1CA48] array];
    id v17 = @"Instance";
    if (!a5) {
      id v17 = @"Class";
    }
    id v26 = v15;
    id v27 = v14;
    id v28 = v13;
    id v25 = [NSString stringWithFormat:@"%@: %@ method: (%@) on class: %@ has the following more specific variants:", v13, v17, v14, v15];
    objc_msgSend(v16, "addObject:");
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = v12;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = [NSString stringWithFormat:@"\t%@", *(void *)(*((void *)&v29 + 1) + 8 * i)];
          [v16 addObject:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v20);
    }

    if (self->_shouldLogToConsole)
    {
      uint64_t v24 = [(AXValidationManager *)self consoleWarningMessages];
      [v24 addObjectsFromArray:v16];
    }
    id v14 = v27;
    id v13 = v28;
    id v15 = v26;
  }
}

- (void)_generateWarningsOnSafeCategoryClass:(Class)a3
{
  Class Superclass = class_getSuperclass(a3);
  Class = object_getClass(Superclass);
  unsigned int outCount = 0;
  BOOL v7 = class_copyMethodList(Class, &outCount);
  [(AXValidationManager *)self _generateWarningsForMethodType:0 onClass:a3 superclassMethods:v7 numberOfSuperclassMethods:outCount];
  if (v7 && outCount) {
    free(v7);
  }
  unsigned int v9 = 0;
  BOOL v8 = class_copyMethodList(Superclass, &v9);
  [(AXValidationManager *)self _generateWarningsForMethodType:1 onClass:a3 superclassMethods:v8 numberOfSuperclassMethods:v9];
  if (v8)
  {
    if (v9) {
      free(v8);
    }
  }
}

- (void)_generateWarningsForMethodType:(int)a3 onClass:(Class)a4 superclassMethods:(objc_method *)a5 numberOfSuperclassMethods:(unsigned int)a6
{
  if (a5)
  {
    if (a6)
    {
      char v11 = [NSString stringWithUTF8String:class_getName(a4)];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __106__AXValidationManager__generateWarningsForMethodType_onClass_superclassMethods_numberOfSuperclassMethods___block_invoke_2;
      v13[3] = &unk_1E56736F8;
      id v15 = &__block_literal_global_274_0;
      id v16 = a5;
      unsigned int v17 = a6;
      int v18 = a3;
      v13[4] = self;
      id v14 = v11;
      id v12 = v11;
      [(AXValidationManager *)self _iterateMethodsOfType:0 onClass:a4 block:v13];
    }
  }
}

uint64_t __106__AXValidationManager__generateWarningsForMethodType_onClass_superclassMethods_numberOfSuperclassMethods___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v5 length];
  unint64_t v7 = [v4 length];
  int v8 = [v5 hasPrefix:v4];
  uint64_t v9 = 0;
  if (v6 > v7 && v8)
  {
    unint64_t v10 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v4, "length"));
    if ([v4 hasSuffix:@":"]) {
      uint64_t v9 = [v10 containsString:@":"];
    }
    else {
      uint64_t v9 = 0;
    }
  }
  return v9;
}

void __106__AXValidationManager__generateWarningsForMethodType_onClass_superclassMethods_numberOfSuperclassMethods___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) _nameForMethod:a2];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  if (*(_DWORD *)(a1 + 64))
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [*(id *)(a1 + 32) _nameForMethod:*(void *)(*(void *)(a1 + 56) + 8 * v4)];
      if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))()) {
        [v3 addObject:v5];
      }

      ++v4;
    }
    while (v4 < *(unsigned int *)(a1 + 64));
  }
  [*(id *)(a1 + 32) _generateWarningsForPrefixedMethodNames:v3 client:AXValidationClientAccessibility methodType:*(unsigned int *)(a1 + 68) methodName:v6 className:*(void *)(a1 + 40)];
}

- (BOOL)installSafeCategory:(id)a3
{
  return [(AXValidationManager *)self installSafeCategory:a3 canInteractWithTargetClass:1];
}

- (BOOL)installSafeCategory:(id)a3 canInteractWithTargetClass:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = (NSString *)a3;
  unint64_t v7 = (void *)MEMORY[0x192FC2C90]();
  Class v8 = NSClassFromString(v6);
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  if (v8)
  {
    uint64_t v46 = v7;
    if (!v4 || (objc_opt_respondsToSelector() & 1) == 0)
    {
      unsigned int v17 = 0;
      unint64_t v10 = 0;
      int v18 = 0;
      int v19 = 0;
      uint64_t v9 = 0;
      goto LABEL_27;
    }
    uint64_t v9 = [(objc_class *)v8 performSelector:sel_safeCategoryTargetClassName];
    unint64_t v10 = NSClassFromString(v9);
    if (v10)
    {
      if ([(AXValidationManager *)self shouldPerformValidationChecks])
      {
        char v11 = AXLogLoading();
        if (os_signpost_enabled(v11))
        {
          id v12 = NSString;
          id v13 = NSStringFromClass(v10);
          [v12 stringWithFormat:@"Class=%@", v13];
          id v14 = (NSString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)long long buf = 138412290;
          v48 = v14;
          _os_signpost_emit_with_name_impl(&dword_18FC6C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Validations", "Target=%@", buf, 0xCu);
        }
        id v15 = [(objc_class *)v8 performSelector:sel__installSafeCategoryValidationMethod];
        if (!v15)
        {
          if (objc_opt_respondsToSelector())
          {
            id v16 = [(objc_class *)v10 axTrampolineForClass:v10];
            [v16 _accessibilityPerformValidations:self];
          }
          else
          {
            [(objc_class *)v10 _accessibilityPerformValidations:self];
          }
        }
        id v23 = AXLogLoading();
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl(&dword_18FC6C000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Validations", "", buf, 2u);
        }

        uint64_t v24 = [MEMORY[0x1E4F28B50] bundleForClass:v8];
        id v25 = [v24 bundlePath];
        char v26 = [v25 hasSuffix:@"axbundle"];

        if (v26)
        {
          uint64_t v27 = [MEMORY[0x1E4F28B50] bundleForClass:v10];
          id v28 = +[AXCodeLoader defaultLoader];
          uint64_t v44 = (void *)v27;
          long long v29 = [v28 codeItemForBundle:v27];

          int v18 = [v29 associatedAccessibilityCodeItem];
          long long v45 = v24;
          id v42 = v18;
          v43 = v29;
          if (v18)
          {
            long long v30 = [v24 bundlePath];
            long long v31 = [v18 path];
            long long v32 = [v31 stringByDeletingLastPathComponent];
            char v33 = [v30 isEqualToString:v32];

            if ((v33 & 1) == 0)
            {
              uint64_t v34 = [v29 name];
              BOOL v35 = [(NSString *)v6 hasSuffix:v34];

              if (!v35)
              {
                id v36 = v15;
                unint64_t v10 = [v45 bundlePath];
                int v18 = [v44 bundlePath];
                id v41 = AXLogValidations();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 138412802;
                  v48 = v6;
                  __int16 v49 = 2112;
                  v50 = v45;
                  __int16 v51 = 2112;
                  uint64_t v52 = v44;
                  _os_log_error_impl(&dword_18FC6C000, v41, OS_LOG_TYPE_ERROR, "AX Safe category class:%@ in wrong AX bundle '%@' should be with '%@'!", buf, 0x20u);
                }

                [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
                uint64_t v21 = [NSString stringWithFormat:@"AX Safe category class:%@ in wrong AX bundle '%@' should be with '%@'", v6, v45, v44, v42, v29];
                int v40 = 0;
                int v19 = 1;
                goto LABEL_49;
              }
            }
            id v36 = v15;
            int v19 = 0;
            int v18 = 0;
          }
          else
          {
            id v36 = v15;
            int v19 = 0;
          }
          unint64_t v10 = 0;
          uint64_t v21 = 0;
          int v40 = 1;
LABEL_49:

          if (!v40) {
            goto LABEL_32;
          }
          unsigned int v17 = v21;
LABEL_27:
          if (objc_opt_respondsToSelector()) {
            [(objc_class *)v8 performSelector:sel__initializeSafeCategoryFromValidationManager];
          }
          else {
          uint64_t v21 = [NSString stringWithFormat:@"%@ is not an accessibility class!", v8];
          }

          if (!v21)
          {
            BOOL v22 = 1;
            goto LABEL_34;
          }
          [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
LABEL_32:
          BOOL v22 = 0;
LABEL_34:
          unint64_t v7 = v46;
          goto LABEL_35;
        }
      }
      unsigned int v17 = 0;
      unint64_t v10 = 0;
    }
    else
    {
      unsigned int v17 = 0;
    }
    int v18 = 0;
    int v19 = 0;
    goto LABEL_27;
  }
  uint64_t v20 = AXLogValidations();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]();
  }

  [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
  uint64_t v21 = [NSString stringWithFormat:@"AX Safe Category class not found: %@", v6];
  int v19 = 0;
  int v18 = 0;
  unint64_t v10 = 0;
  uint64_t v9 = 0;
  BOOL v22 = 0;
LABEL_35:
  if ([(AXValidationManager *)self shouldPerformValidationChecks]) {
    [(AXValidationManager *)self _generateWarningsOnSafeCategoryClass:v8];
  }
  if (!v22)
  {
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      long long v37 = [(AXValidationManager *)self overrideProcessName];
      if (v19) {
        [(AXValidationManager *)self sendExceptionForSafeCategoryOnWrongTarget:v6 targetBundle:v10 expectedBundle:v18 overrideProcessName:v37];
      }
      else {
        [(AXValidationManager *)self sendExceptionForInstallingSafeCategory:v6 onTarget:v9 overrideProcessName:v37];
      }
    }
    if (self->_shouldLogToConsole)
    {
      BOOL v38 = [(AXValidationManager *)self consoleErrorMessages];
      [v38 addObject:v21];
    }
  }

  return v22;
}

- (BOOL)installSwiftDynamicReplacementUnit:(id)a3 inBundle:(id)a4 withPrecondition:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = (uint64_t (**)(void))a5;
  char v11 = (void *)MEMORY[0x192FC2C90]();
  [(AXValidationManager *)self setNumberOfValidations:[(AXValidationManager *)self numberOfValidations] + 1];
  if (!v9)
  {
    uint64_t v20 = AXLogValidations();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[AXValidationManager installSwiftDynamicReplacementUnit:inBundle:withPrecondition:]();
    }

    [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
    [NSString stringWithFormat:@"AX Container bundle was not found when installing Swift dynamic replacement unit %@", v8];
    goto LABEL_17;
  }
  if (![v8 length])
  {
    uint64_t v21 = AXLogValidations();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[AXValidationManager installSwiftDynamicReplacementUnit:inBundle:withPrecondition:](v21);
    }

    [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
    BOOL v22 = NSString;
    id v23 = @"AX Swift dynamic replacement name empty";
    goto LABEL_16;
  }
  if ((v10[2](v10) & 1) == 0)
  {
    uint64_t v24 = AXLogValidations();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[AXValidationManager installSwiftDynamicReplacementUnit:inBundle:withPrecondition:].cold.4();
    }

    [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
    BOOL v22 = NSString;
    id v32 = v8;
    id v23 = @"AX Swift dynamic replacement %@ installation's condition not met";
LABEL_16:
    objc_msgSend(v22, "stringWithFormat:", v23, v32);
    int v18 = LABEL_17:;
    goto LABEL_18;
  }
  id v12 = [v9 builtInPlugInsPath];
  id v13 = [v8 stringByAppendingPathExtension:@"axbundlefile"];
  id v14 = [v12 stringByAppendingPathComponent:v13];

  id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v16 = [v15 fileExistsAtPath:v14 isDirectory:0];

  if (v16)
  {
    id v17 = v14;
    if (dlopen((const char *)[v17 UTF8String], 1))
    {

      int v18 = 0;
      BOOL v19 = 1;
      goto LABEL_24;
    }
    long long v30 = dlerror();
    long long v31 = AXLogValidations();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412802;
      id v36 = v8;
      __int16 v37 = 2112;
      id v38 = v9;
      __int16 v39 = 2080;
      int v40 = v30;
      _os_log_error_impl(&dword_18FC6C000, v31, OS_LOG_TYPE_ERROR, "AX Swift dynamic replacement %@ from bundle %@ not successfully installed: %s", buf, 0x20u);
    }

    [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
    [NSString stringWithFormat:@"AX Swift dynamic replacement %@ from bundle %@ not successfully installed: %s", v8, v9, v30];
  }
  else
  {
    long long v29 = AXLogValidations();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[AXValidationManager installSwiftDynamicReplacementUnit:inBundle:withPrecondition:]();
    }

    [(AXValidationManager *)self setNumberOfValidationErrors:[(AXValidationManager *)self numberOfValidationErrors] + 1];
    [NSString stringWithFormat:@"AX Swift dynamic replacement file not found at path %@", v14, v33, v34];
  int v18 = };

LABEL_18:
  if (self->_shouldReportToServer && !self->_forceDoNotReport)
  {
    id v25 = [NSString stringWithFormat:@"Swift Dynamic Replacement: %@", v8];
    char v26 = [(AXValidationManager *)self overrideProcessName];
    [(AXValidationManager *)self sendExceptionForInstallingSafeCategory:v25 onTarget:&stru_1EDF601D0 overrideProcessName:v26];
  }
  if (self->_shouldLogToConsole)
  {
    uint64_t v27 = [(AXValidationManager *)self consoleErrorMessages];
    [v27 addObject:v18];
  }
  BOOL v19 = 0;
LABEL_24:

  return v19;
}

- (void)sendExceptionForInstallingSafeCategory:(id)a3 onTarget:(id)a4 overrideProcessName:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = [(AXValidationManager *)self validationReportingServices];
  char v11 = v10;
  if (v9)
  {
    [v10 sendExceptionForInstallingSafeCategory:v13 onTarget:v8 overrideProcessName:v9];
  }
  else
  {
    id v12 = AXProcessGetName();
    [v11 sendExceptionForInstallingSafeCategory:v13 onTarget:v8 overrideProcessName:v12];
  }
}

- (void)sendExceptionForSafeCategoryOnWrongTarget:(id)a3 targetBundle:(id)a4 expectedBundle:(id)a5 overrideProcessName:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(AXValidationManager *)self validationReportingServices];
  id v14 = v13;
  if (v12)
  {
    [v13 sendExceptionForSafeCategoryOnWrongTarget:v16 targetBundle:v10 expectedBundle:v11 overrideProcessName:v12];
  }
  else
  {
    id v15 = AXProcessGetName();
    [v14 sendExceptionForSafeCategoryOnWrongTarget:v16 targetBundle:v10 expectedBundle:v11 overrideProcessName:v15];
  }
}

- (void)sendExceptionForSafeValueKey:(id)a3 onTarget:(id)a4 overrideProcessName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = [(AXValidationManager *)self validationReportingServices];
  id v11 = v8;
  if (!v8)
  {
    id v11 = AXProcessGetName();
  }
  id v12 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v13 = [v12 componentsJoinedByString:@"\n"];
  [v14 sendExceptionForSafeValueKey:v10 onTarget:v9 overrideProcessName:v11 backtrace:v13];

  if (!v8) {
}
  }

- (void)sendExceptionForSafeIVarKey:(id)a3 onTarget:(id)a4 overrideProcessName:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(AXValidationManager *)self validationReportingServices];
  id v11 = v10;
  if (v9)
  {
    [v10 sendExceptionForSafeIVarKey:v13 onTarget:v8 overrideProcessName:v9];
  }
  else
  {
    id v12 = AXProcessGetName();
    [v11 sendExceptionForSafeIVarKey:v13 onTarget:v8 overrideProcessName:v12];
  }
}

- (void)sendExceptionForSafeBlock:(id)a3 overrideProcessName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  unint64_t v7 = [(AXValidationManager *)self validationReportingServices];
  id v8 = v7;
  if (v6)
  {
    [v7 sendExceptionForSafeBlock:v10 overrideProcessName:v6];
  }
  else
  {
    id v9 = AXProcessGetName();
    [v8 sendExceptionForSafeBlock:v10 overrideProcessName:v9];
  }
}

- (void)sendGenericReport:(id)a3 withTag:(id)a4 overrideProcessName:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(AXValidationManager *)self validationReportingServices];
  id v11 = v10;
  if (v9)
  {
    [v10 sendGenericReport:v13 withTag:v8 overrideProcessName:v9];
  }
  else
  {
    id v12 = AXProcessGetName();
    [v11 sendGenericReport:v13 withTag:v8 overrideProcessName:v12];
  }
}

- (void)sendValidateExceptionForClass:(id)a3 errorMessage:(id)a4 overrideProcessName:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(AXValidationManager *)self validationReportingServices];
  id v11 = v10;
  if (v9)
  {
    [v10 sendValidateExceptionForClass:v13 errorMessage:v8 overrideProcessName:v9];
  }
  else
  {
    id v12 = AXProcessGetName();
    [v11 sendValidateExceptionForClass:v13 errorMessage:v8 overrideProcessName:v12];
  }
}

- (void)sendValidateExceptionForClass:(id)a3 isKindOfClass:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(AXValidationManager *)self validationReportingServices];
  id v14 = v13;
  if (v12)
  {
    [v13 sendValidateExceptionForClass:v16 isKindOfClass:v10 errorMessage:v11 overrideProcessName:v12];
  }
  else
  {
    id v15 = AXProcessGetName();
    [v14 sendValidateExceptionForClass:v16 isKindOfClass:v10 errorMessage:v11 overrideProcessName:v15];
  }
}

- (void)sendValidateExceptionForClass:(id)a3 conformsToProtocol:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(AXValidationManager *)self validationReportingServices];
  id v14 = v13;
  if (v12)
  {
    [v13 sendValidateExceptionForClass:v16 conformsToProtocol:v10 errorMessage:v11 overrideProcessName:v12];
  }
  else
  {
    id v15 = AXProcessGetName();
    [v14 sendValidateExceptionForClass:v16 conformsToProtocol:v10 errorMessage:v11 overrideProcessName:v15];
  }
}

- (void)sendValidateExceptionForClass:(id)a3 hasInstanceVariable:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(AXValidationManager *)self validationReportingServices];
  id v14 = v13;
  if (v12)
  {
    [v13 sendValidateExceptionForClass:v16 hasInstanceVariable:v10 errorMessage:v11 overrideProcessName:v12];
  }
  else
  {
    id v15 = AXProcessGetName();
    [v14 sendValidateExceptionForClass:v16 hasInstanceVariable:v10 errorMessage:v11 overrideProcessName:v15];
  }
}

- (void)sendValidateExceptionForClass:(id)a3 hasInstanceMethod:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(AXValidationManager *)self validationReportingServices];
  id v14 = v13;
  if (v12)
  {
    [v13 sendValidateExceptionForClass:v16 hasInstanceMethod:v10 errorMessage:v11 overrideProcessName:v12];
  }
  else
  {
    id v15 = AXProcessGetName();
    [v14 sendValidateExceptionForClass:v16 hasInstanceMethod:v10 errorMessage:v11 overrideProcessName:v15];
  }
}

- (void)sendValidateExceptionForClass:(id)a3 hasClassMethod:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(AXValidationManager *)self validationReportingServices];
  id v14 = v13;
  if (v12)
  {
    [v13 sendValidateExceptionForClass:v16 hasClassMethod:v10 errorMessage:v11 overrideProcessName:v12];
  }
  else
  {
    id v15 = AXProcessGetName();
    [v14 sendValidateExceptionForClass:v16 hasClassMethod:v10 errorMessage:v11 overrideProcessName:v15];
  }
}

- (void)sendValidateExceptionForClass:(id)a3 hasProperty:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(AXValidationManager *)self validationReportingServices];
  id v14 = v13;
  if (v12)
  {
    [v13 sendValidateExceptionForClass:v16 hasProperty:v10 errorMessage:v11 overrideProcessName:v12];
  }
  else
  {
    id v15 = AXProcessGetName();
    [v14 sendValidateExceptionForClass:v16 hasProperty:v10 errorMessage:v11 overrideProcessName:v15];
  }
}

- (void)sendValidateExceptionForProtocol:(id)a3 conformsToProtocol:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(AXValidationManager *)self validationReportingServices];
  id v14 = v13;
  if (v12)
  {
    [v13 sendValidateExceptionForProtocol:v16 conformsToProtocol:v10 errorMessage:v11 overrideProcessName:v12];
  }
  else
  {
    id v15 = AXProcessGetName();
    [v14 sendValidateExceptionForProtocol:v16 conformsToProtocol:v10 errorMessage:v11 overrideProcessName:v15];
  }
}

- (void)sendValidateExceptionForProtocol:(id)a3 hasMethod:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(AXValidationManager *)self validationReportingServices];
  id v14 = v13;
  if (v12)
  {
    [v13 sendValidateExceptionForProtocol:v16 hasMethod:v10 errorMessage:v11 overrideProcessName:v12];
  }
  else
  {
    id v15 = AXProcessGetName();
    [v14 sendValidateExceptionForProtocol:v16 hasMethod:v10 errorMessage:v11 overrideProcessName:v15];
  }
}

- (void)sendValidateExceptionForProtocol:(id)a3 hasProperty:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(AXValidationManager *)self validationReportingServices];
  id v14 = v13;
  if (v12)
  {
    [v13 sendValidateExceptionForProtocol:v16 hasProperty:v10 errorMessage:v11 overrideProcessName:v12];
  }
  else
  {
    id v15 = AXProcessGetName();
    [v14 sendValidateExceptionForProtocol:v16 hasProperty:v10 errorMessage:v11 overrideProcessName:v15];
  }
}

- (void)sendFailedAssertionWithErrorMessage:(id)a3 overrideProcessName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  unint64_t v7 = [(AXValidationManager *)self validationReportingServices];
  id v8 = v7;
  if (v6)
  {
    [v7 sendFailedAssertionWithErrorMessage:v10 overrideProcessName:v6];
  }
  else
  {
    id v9 = AXProcessGetName();
    [v8 sendFailedAssertionWithErrorMessage:v10 overrideProcessName:v9];
  }
}

- (void)sendFailedTestCase:(id)a3 withTag:(id)a4 overrideProcessName:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(AXValidationManager *)self validationReportingServices];
  id v11 = v10;
  if (v9)
  {
    [v10 sendFailedTestCase:v13 withTag:v8 overrideProcessName:v9];
  }
  else
  {
    id v12 = AXProcessGetName();
    [v11 sendFailedTestCase:v13 withTag:v8 overrideProcessName:v12];
  }
}

- (void)sendValidationSuccessForProcessName:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(AXValidationManager *)self validationReportingServices];
  id v5 = v4;
  if (v7)
  {
    [v4 sendValidationSuccessForProcessName:v7];
  }
  else
  {
    id v6 = AXProcessGetName();
    [v5 sendValidationSuccessForProcessName:v6];
  }
}

- (BOOL)shouldLogToConsole
{
  return self->_shouldLogToConsole;
}

- (void)setShouldLogToConsole:(BOOL)a3
{
  self->_shouldLogToConsole = a3;
}

- (BOOL)shouldCrashOnError
{
  return self->_shouldCrashOnError;
}

- (void)setShouldCrashOnError:(BOOL)a3
{
  self->_shouldCrashOnError = a3;
}

- (BOOL)shouldReportToServer
{
  return self->_shouldReportToServer;
}

- (void)setShouldReportToServer:(BOOL)a3
{
  self->_shouldReportToServer = a3;
}

- (unint64_t)numberOfValidationErrors
{
  return self->_numberOfValidationErrors;
}

- (void)setNumberOfValidationErrors:(unint64_t)a3
{
  self->_numberOfValidationErrors = a3;
}

- (BOOL)forceDoNotReport
{
  return self->_forceDoNotReport;
}

- (void)setForceDoNotReport:(BOOL)a3
{
  self->_forceDoNotReport = a3;
}

- (NSString)validationTargetName
{
  return self->_validationTargetName;
}

- (void)setValidationTargetName:(id)a3
{
}

- (NSString)overrideProcessName
{
  return self->_overrideProcessName;
}

- (void)setOverrideProcessName:(id)a3
{
}

- (NSMutableArray)consoleErrorMessages
{
  return self->_consoleErrorMessages;
}

- (void)setConsoleErrorMessages:(id)a3
{
}

- (BOOL)isDebugBuild
{
  return self->_debugBuild;
}

- (void)setDebugBuild:(BOOL)a3
{
  self->_debugBuild = a3;
}

- (AXValidationReportingServices)validationReportingServices
{
  return self->_validationReportingServices;
}

- (void)setValidationReportingServices:(id)a3
{
}

- (BOOL)installSafeCategoriesOffMainThread
{
  return self->_installSafeCategoriesOffMainThread;
}

- (void)setInstallSafeCategoriesOffMainThread:(BOOL)a3
{
  self->_installSafeCategoriesOffMainThread = a3;
}

- (BOOL)shouldPerformValidationChecks
{
  return self->_shouldPerformValidationChecks;
}

- (void)setShouldPerformValidationChecks:(BOOL)a3
{
  self->_shouldPerformValidationChecks = a3;
}

- (unint64_t)numberOfValidations
{
  return self->_numberOfValidations;
}

- (void)setNumberOfValidations:(unint64_t)a3
{
  self->_numberOfValidations = a3;
}

- (unint64_t)numberOfCategories
{
  return self->_numberOfCategories;
}

- (void)setNumberOfCategories:(unint64_t)a3
{
  self->_numberOfCategories = a3;
}

- (unint64_t)numberOfValidationWarnings
{
  return self->_numberOfValidationWarnings;
}

- (void)setNumberOfValidationWarnings:(unint64_t)a3
{
  self->_numberOfValidationWarnings = a3;
}

- (NSMutableArray)consoleWarningMessages
{
  return self->_consoleWarningMessages;
}

- (void)setConsoleWarningMessages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consoleWarningMessages, 0);
  objc_storeStrong((id *)&self->_validationReportingServices, 0);
  objc_storeStrong((id *)&self->_consoleErrorMessages, 0);
  objc_storeStrong((id *)&self->_overrideProcessName, 0);
  objc_storeStrong((id *)&self->_validationTargetName, 0);
}

- (void)_printEncodedConsoleReportForValidationRunner:isDelayed:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_18FC6C000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

- (void)_printConsoleReport:isDelayed:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_18FC6C000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

- (void)installSafeCategory:canInteractWithTargetClass:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_18FC6C000, v0, v1, "AX Safe category class '%@' was not found!", v2, v3, v4, v5, v6);
}

- (void)installSwiftDynamicReplacementUnit:inBundle:withPrecondition:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_18FC6C000, v0, v1, "AX Container bundle was not found when installing Swift dynamic replacement unit %@!", v2, v3, v4, v5, v6);
}

- (void)installSwiftDynamicReplacementUnit:(os_log_t)log inBundle:withPrecondition:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18FC6C000, log, OS_LOG_TYPE_ERROR, "AX Swift dynamic replacement name empty", v1, 2u);
}

- (void)installSwiftDynamicReplacementUnit:inBundle:withPrecondition:.cold.3()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_18FC6C000, v1, OS_LOG_TYPE_ERROR, "AX Swift dynamic replacement %@ not found in bundle %@", v2, 0x16u);
}

- (void)installSwiftDynamicReplacementUnit:inBundle:withPrecondition:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_18FC6C000, v0, v1, "AX Swift dynamic replacement %@ installation's precondition not met", v2, v3, v4, v5, v6);
}

@end