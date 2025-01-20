@interface ERLogging
+ (void)log:(id)a3 withType:(unint64_t)a4;
@end

@implementation ERLogging

+ (void)log:(id)a3 withType:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (log_withType__onceToken != -1) {
    dispatch_once(&log_withType__onceToken, &__block_literal_global_0);
  }
  switch(a4)
  {
    case 1uLL:
      v6 = osLogHandle;
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_ERROR)) {
        +[ERLogging log:withType:]((uint64_t)v5, v6);
      }
      break;
    case 2uLL:
      uint64_t v10 = osLogHandle;
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_INFO))
      {
        int v13 = 138543362;
        id v14 = v5;
        v8 = v10;
        os_log_type_t v9 = OS_LOG_TYPE_INFO;
        goto LABEL_10;
      }
      break;
    case 3uLL:
      v11 = osLogHandle;
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_DEBUG)) {
        +[ERLogging log:withType:]((uint64_t)v5, v11);
      }
      break;
    case 4uLL:
      v12 = osLogHandle;
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_FAULT)) {
        +[ERLogging log:withType:]((uint64_t)v5, v12);
      }
      break;
    default:
      uint64_t v7 = osLogHandle;
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = v5;
        v8 = v7;
        os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
        _os_log_impl(&dword_24D2AA000, v8, v9, "%{public}@", (uint8_t *)&v13, 0xCu);
      }
      break;
  }
}

uint64_t __26__ERLogging_log_withType___block_invoke()
{
  osLogHandle = (uint64_t)os_log_create("com.apple.eyerelief", "EyeRelief");

  return MEMORY[0x270F9A758]();
}

+ (void)log:(uint64_t)a1 withType:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24D2AA000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)log:(uint64_t)a1 withType:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_24D2AA000, a2, OS_LOG_TYPE_DEBUG, "%{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)log:(uint64_t)a1 withType:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_24D2AA000, a2, OS_LOG_TYPE_FAULT, "%{public}@", (uint8_t *)&v2, 0xCu);
}

@end