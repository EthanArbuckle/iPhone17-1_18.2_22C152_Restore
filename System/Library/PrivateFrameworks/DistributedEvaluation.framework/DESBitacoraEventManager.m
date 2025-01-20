@interface DESBitacoraEventManager
+ (BOOL)allowEventForBundleID:(id)a3;
+ (void)_sendBitacoraEventForBundleID:(id)a3 event:(id)a4 identifiers:(id)a5;
+ (void)_sendBitacoraEventForEvent:(id)a3 identifiers:(id)a4;
+ (void)initialize;
+ (void)sendEventActivityScheduled;
+ (void)sendEventTaskCompletedForBundleID:(id)a3 identifiers:(id)a4 error:(id)a5;
+ (void)sendEventTaskFetchedForBundleID:(id)a3 identifiers:(id)a4;
+ (void)sendEventTaskSchedulingFailedForBundleID:(id)a3 identifiers:(id)a4 error:(id)a5;
+ (void)sendEventTaskSchedulingSucceededForBundleID:(id)a3 identifiers:(id)a4;
@end

@implementation DESBitacoraEventManager

+ (void)initialize
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BECCB000, log, OS_LOG_TYPE_ERROR, "LighthouseBitacoraFramework.framework is not loaded.", v1, 2u);
}

+ (BOOL)allowEventForBundleID:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (allowEventForBundleID__onceToken_0 != -1)
  {
    dispatch_once(&allowEventForBundleID__onceToken_0, &__block_literal_global_7);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    LOBYTE(v5) = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  int v5 = [(id)allowEventForBundleID__disalllowedBundles_0 containsObject:v4] ^ 1;
LABEL_6:

  return v5;
}

void __49__DESBitacoraEventManager_allowEventForBundleID___block_invoke()
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.dodml.TestPlugin";
  v4[1] = @"com.apple.MLRuntime.ExtensionXCTestHigh";
  v4[2] = @"com.apple.MLRuntime.ExtensionXCTestOnDemand";
  v4[3] = @"com.apple.MLRuntime.ExtensionXCTestRestricted";
  v4[4] = @"com.apple.MLRuntime.XCTest";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)allowEventForBundleID__disalllowedBundles_0;
  allowEventForBundleID__disalllowedBundles_0 = v2;
}

+ (void)_sendBitacoraEventForEvent:(id)a3 identifiers:(id)a4
{
  id v7 = 0;
  char v4 = [(id)bitacoraManager addMLRuntimedEvent:a3 identifiers:a4 error:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    v6 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[DESBitacoraEventManager _sendBitacoraEventForEvent:identifiers:]((uint64_t)v5, v6);
    }
  }
}

+ (void)_sendBitacoraEventForBundleID:(id)a3 event:(id)a4 identifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([a1 allowEventForBundleID:v8])
  {
    [a1 _sendBitacoraEventForEvent:v9 identifiers:v10];
  }
  else
  {
    v11 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[DESBitacoraEventManager _sendBitacoraEventForBundleID:event:identifiers:]((uint64_t)v8, v11);
    }
  }
}

+ (void)sendEventActivityScheduled
{
  if (objc_opt_class())
  {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F72498]) initWithScheduleStatus:1];
    [a1 _sendBitacoraEventForEvent:v3 identifiers:0];
  }
}

+ (void)sendEventTaskFetchedForBundleID:(id)a3 identifiers:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (objc_opt_class())
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F72498]) initWithTaskFetched:1 error:0];
    [a1 _sendBitacoraEventForBundleID:v8 event:v7 identifiers:v6];
  }
}

+ (void)sendEventTaskSchedulingSucceededForBundleID:(id)a3 identifiers:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (objc_opt_class())
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F72498]) initWithTaskScheduled:1 error:0];
    [a1 _sendBitacoraEventForBundleID:v8 event:v7 identifiers:v6];
  }
}

+ (void)sendEventTaskSchedulingFailedForBundleID:(id)a3 identifiers:(id)a4 error:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (objc_opt_class())
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F72498]) initWithTaskScheduled:0 error:v9];
    [a1 _sendBitacoraEventForBundleID:v11 event:v10 identifiers:v8];
  }
}

+ (void)sendEventTaskCompletedForBundleID:(id)a3 identifiers:(id)a4 error:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (objc_opt_class())
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F72498]) initWithTaskCompleted:v9 == 0 error:v9];
    [a1 _sendBitacoraEventForBundleID:v11 event:v10 identifiers:v8];
  }
}

+ (void)_sendBitacoraEventForEvent:(uint64_t)a1 identifiers:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "Failed to send Bitacora event: addMLRuntimedEvent with error=%@", (uint8_t *)&v2, 0xCu);
}

+ (void)_sendBitacoraEventForBundleID:(uint64_t)a1 event:(NSObject *)a2 identifiers:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_DEBUG, "Telemetry is prohibited for plugin: %@", (uint8_t *)&v2, 0xCu);
}

@end