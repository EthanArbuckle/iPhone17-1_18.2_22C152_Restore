@interface ITKAssert
+ (void)handleFailedAssertWithCondition:(const char *)a3 functionName:(const char *)a4 simulateCrash:(BOOL)a5 showAlert:(BOOL)a6 alertMessage:(id)a7 format:(id)a8;
+ (void)handleFailedAssertWithCondition:(const char *)a3 functionName:(const char *)a4 simulateCrash:(BOOL)a5 showAlert:(BOOL)a6 format:(id)a7;
@end

@implementation ITKAssert

+ (void)handleFailedAssertWithCondition:(const char *)a3 functionName:(const char *)a4 simulateCrash:(BOOL)a5 showAlert:(BOOL)a6 alertMessage:(id)a7 format:(id)a8
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v29 = *MEMORY[0x263EF8340];
  v12 = (objc_class *)NSString;
  id v13 = a8;
  v14 = (void *)[[v12 alloc] initWithFormat:v13 arguments:&v30];

  v15 = os_log_create("com.apple.VisionKit", "Assert");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v24 = a3;
    __int16 v25 = 2080;
    v26 = a4;
    __int16 v27 = 2112;
    v28 = v14;
    _os_log_error_impl(&dword_252A65000, v15, OS_LOG_TYPE_ERROR, "Failed assertion (%s) in %s: %@", buf, 0x20u);
  }

  if (v9)
  {
    v16 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      +[ITKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:]((uint64_t)v14, v16);
    }
  }
  if (v8)
  {
    BOOL isInternalBuild = itk_isInternalBuild();
    v18 = [MEMORY[0x263F08AB0] processInfo];
    v19 = [v18 environment];
    v20 = [v19 objectForKeyedSubscript:@"SuppressAssertionAlerts"];
    char v21 = [v20 BOOLValue];

    if (isInternalBuild && (v21 & 1) == 0 && !v9)
    {
      v22 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        +[ITKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:]((uint64_t)v14, v22);
      }
    }
  }
}

+ (void)handleFailedAssertWithCondition:(const char *)a3 functionName:(const char *)a4 simulateCrash:(BOOL)a5 showAlert:(BOOL)a6 format:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  v12 = (objc_class *)NSString;
  id v13 = a7;
  v14 = (void *)[[v12 alloc] initWithFormat:v13 arguments:&v15];

  [a1 handleFailedAssertWithCondition:a3, a4, v8, v7, @"You encountered a serious bug in Notes. Will you please file a Radar?", @"%@", v14 functionName simulateCrash showAlert alertMessage format];
}

+ (void)handleFailedAssertWithCondition:(uint64_t)a1 functionName:(NSObject *)a2 simulateCrash:showAlert:alertMessage:format:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_252A65000, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

@end