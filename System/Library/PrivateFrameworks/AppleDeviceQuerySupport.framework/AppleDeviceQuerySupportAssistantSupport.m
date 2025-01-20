@interface AppleDeviceQuerySupportAssistantSupport
+ (BOOL)isInternalAssistant;
+ (id)armoryClassName;
+ (id)classList;
+ (id)getSharedInstanceByName:(id)a3 withError:(id *)a4;
+ (id)getXpcProxyWithError:(id *)a3;
+ (id)isKey:(id)a3 withError:(id *)a4;
+ (id)serviceXpcName;
+ (void)getDylibHandlerWithError:(id *)a3;
@end

@implementation AppleDeviceQuerySupportAssistantSupport

+ (BOOL)isInternalAssistant
{
  return 0;
}

+ (id)classList
{
  return &unk_26FC2CE78;
}

+ (id)armoryClassName
{
  return @"OBJC_CLASS_$_AppleDeviceQueryArmory";
}

+ (id)serviceXpcName
{
  return @"com.apple.AppleDeviceQueryService";
}

+ (void)getDylibHandlerWithError:(id *)a3
{
  if (a3)
  {
    *a3 = 0;
    if (getDylibHandlerWithError__aToken != -1) {
      dispatch_once(&getDylibHandlerWithError__aToken, &__block_literal_global_0);
    }
    *a3 = (id) getDylibHandlerWithError__anError;
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getDylibHandlerWithError:]", 60, @"error p-pointer is nil!", v3, v4, v5, v8);
  }
  return (void *)getDylibHandlerWithError__ZhuGeArmoryHandler;
}

void *__68__AppleDeviceQuerySupportAssistantSupport_getDylibHandlerWithError___block_invoke()
{
  result = dlopen((const char *)[@"/System/Library/PrivateFrameworks/AppleDeviceQuerySupport.framework/libAppleDeviceQueryArmory.dylib" UTF8String], 1);
  getDylibHandlerWithError__ZhuGeArmoryHandler = (uint64_t)result;
  if (!result)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getDylibHandlerWithError:]_block_invoke", 69, @"Failed to dlopen ZhuGe armory dylib!", v1, v2, v3, vars0);
    getDylibHandlerWithError__anError = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:13 underlyingError:0];
    return (void *)MEMORY[0x270F9A758]();
  }
  return result;
}

+ (id)getSharedInstanceByName:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if [a1 isInternalAssistant] && (isZhuGeInRestoreOS()) {
    goto LABEL_10;
  }
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getSharedInstanceByName:withError:]", 95, @"error p-pointer is nil!", v7, v8, v9, v31);
LABEL_10:
    id v19 = 0;
    v15 = 0;
    goto LABEL_15;
  }
  *a4 = 0;
  v10 = [a1 classList];
  char v11 = [v10 containsObject:v6];

  if ((v11 & 1) == 0)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getSharedInstanceByName:withError:]", 101, @"Unknown class name!", v12, v13, v14, v31);
    id v29 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:38 underlyingError:0];
    id v19 = 0;
LABEL_12:
    v15 = 0;
LABEL_14:
    *a4 = v29;
    goto LABEL_15;
  }
  id v32 = 0;
  v15 = (void *)[a1 getDylibHandlerWithError:&v32];
  id v19 = v32;
  if (!v15)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getSharedInstanceByName:withError:]", 109, @"Failed to get ZhuGe armory handler!", v16, v17, v18, v31);
    id v29 = v19;
    id v19 = v29;
    goto LABEL_14;
  }
  id v20 = v6;
  v21 = dlsym(v15, (const char *)[v20 UTF8String]);
  if (!v21)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getSharedInstanceByName:withError:]", 116, @"Failed to find class symbol for \"%@\"!", v22, v23, v24, (uint64_t)v20);
    id v29 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:13 underlyingError:0];
    goto LABEL_12;
  }
  v15 = [v21 sharedInstance];
  if (!v15)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getSharedInstanceByName:withError:]", 123, @"Failed to have shared instance for \"%@\"!", v25, v26, v27, (uint64_t)v20);
    uint64_t v28 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:38 underlyingError:0];

    id v19 = (id)v28;
  }
LABEL_15:

  return v15;
}

+ (id)isKey:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if [a1 isInternalAssistant] && (isZhuGeInRestoreOS()) {
    goto LABEL_9;
  }
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport isKey:withError:]", 146, @"error p-pointer is nil!", v7, v8, v9, v24);
LABEL_9:
    id v17 = 0;
    id v15 = 0;
    char v11 = 0;
    uint64_t v14 = 0;
    goto LABEL_11;
  }
  *a4 = 0;
  v10 = [a1 armoryClassName];
  id v26 = 0;
  char v11 = [a1 getSharedInstanceByName:v10 withError:&v26];
  id v12 = v26;

  if (v11)
  {
    uint64_t v13 = [v11 helper];
    id v25 = v12;
    uint64_t v14 = [v13 getConfigOfKey:v6 withError:&v25];
    id v15 = v25;

    uint64_t v16 = (void *)MEMORY[0x263EFFA88];
    if (!v14) {
      uint64_t v16 = (void *)MEMORY[0x263EFFA80];
    }
    id v17 = v16;
  }
  else
  {
    uint64_t v18 = [a1 armoryClassName];
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport isKey:withError:]", 154, @"Failed to get a shared instance for \"%@\"!", v19, v20, v21, (uint64_t)v18);

    id v15 = v12;
    id v17 = 0;
    char v11 = 0;
    uint64_t v14 = 0;
    *a4 = v15;
  }
LABEL_11:
  id v22 = v17;

  return v22;
}

+ (id)getXpcProxyWithError:(id *)a3
{
  if [a1 isInternalAssistant] && (isZhuGeInRestoreOS()) {
    goto LABEL_10;
  }
  if (!a3)
  {
    uint64_t v8 = @"error p-pointer is nil!";
    int v9 = 1040;
    uint64_t v10 = 181;
    goto LABEL_9;
  }
  *a3 = 0;
  if (getXpcProxyWithError__aToken != -1) {
    dispatch_once(&getXpcProxyWithError__aToken, &__block_literal_global_34);
  }
  pthread_mutex_lock(&getXpcProxyWithError__aRecursiveMutex);
  if (getXpcProxyWithError__aProxy)
  {
    uint64_t v8 = @"XPC proxy is already available";
    int v9 = 524544;
    uint64_t v10 = 193;
LABEL_9:
    ZhuGeLog(v9, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getXpcProxyWithError:]", v10, v8, v5, v6, v7, v41);
LABEL_10:
    char v11 = 0;
    id v12 = 0;
    goto LABEL_11;
  }
  id v15 = objc_alloc(MEMORY[0x263F08D68]);
  uint64_t v16 = [a1 serviceXpcName];
  char v11 = (void *)[v15 initWithServiceName:v16];

  if (!v11)
  {
    v37 = [a1 serviceXpcName];
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getXpcProxyWithError:]", 200, @"Failed to connect \"%@\"!", v38, v39, v40, (uint64_t)v37);

    id v36 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:67 underlyingError:0];
    char v11 = 0;
    id v12 = 0;
    goto LABEL_18;
  }
  if (isZhuGeInRestoreOS())
  {
    id v17 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FC2DA30];
    [v11 setExportedInterface:v17];

    uint64_t v18 = objc_opt_new();
    [v11 setExportedObject:v18];
  }
  uint64_t v19 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FC2F8C0];
  [v11 setRemoteObjectInterface:v19];

  v45 = (void *)MEMORY[0x263EFFA08];
  uint64_t v44 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  id v12 = objc_msgSend(v45, "setWithObjects:", v44, v43, v42, v20, v21, v22, v23, v24, v25, objc_opt_class(), 0);
  id v26 = [v11 remoteObjectInterface];
  [v26 setClasses:v12 forSelector:sel_setBulkKeys_getValuesAndError_ argumentIndex:0 ofReply:1];

  uint64_t v27 = [v11 remoteObjectInterface];
  [v27 setClasses:v12 forSelector:sel_setBulkInternalKeys_getValuesAndError_ argumentIndex:0 ofReply:1];

  uint64_t v28 = [v11 remoteObjectInterface];
  [v28 setClasses:v12 forSelector:sel_setBulkMGKeys_getValuesAndError_ argumentIndex:0 ofReply:1];

  id v29 = [v11 remoteObjectInterface];
  [v29 setClasses:v12 forSelector:sel_setBulkInternalMGKeys_getValuesAndError_ argumentIndex:0 ofReply:1];

  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __64__AppleDeviceQuerySupportAssistantSupport_getXpcProxyWithError___block_invoke_2;
  v47[3] = &__block_descriptor_40_e5_v8__0l;
  v47[4] = a1;
  [v11 setInvalidationHandler:v47];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __64__AppleDeviceQuerySupportAssistantSupport_getXpcProxyWithError___block_invoke_3;
  v46[3] = &__block_descriptor_40_e5_v8__0l;
  v46[4] = a1;
  [v11 setInterruptionHandler:v46];
  [v11 activate];
  uint64_t v30 = [v11 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_81];
  uint64_t v31 = (void *)getXpcProxyWithError__aProxy;
  getXpcProxyWithError__aProxy = v30;

  if (!getXpcProxyWithError__aProxy)
  {
    id v32 = [a1 serviceXpcName];
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getXpcProxyWithError:]", 257, @"Failed to get proxy for \"%@\"!", v33, v34, v35, (uint64_t)v32);

    id v36 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:66 underlyingError:0];
LABEL_18:
    *a3 = v36;
  }
LABEL_11:
  pthread_mutex_unlock(&getXpcProxyWithError__aRecursiveMutex);
  id v13 = (id)getXpcProxyWithError__aProxy;

  return v13;
}

uint64_t __64__AppleDeviceQuerySupportAssistantSupport_getXpcProxyWithError___block_invoke()
{
  return initPthreadRecursiveMutex(&getXpcProxyWithError__aRecursiveMutex);
}

uint64_t __64__AppleDeviceQuerySupportAssistantSupport_getXpcProxyWithError___block_invoke_2(uint64_t a1)
{
  pthread_mutex_lock(&getXpcProxyWithError__aRecursiveMutex);
  uint64_t v2 = [*(id *)(a1 + 32) serviceXpcName];
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getXpcProxyWithError:]_block_invoke_2", 235, @"Connection to \"%@\" invalidated!", v3, v4, v5, (uint64_t)v2);

  uint64_t v6 = (void *)getXpcProxyWithError__aProxy;
  getXpcProxyWithError__aProxy = 0;

  return pthread_mutex_unlock(&getXpcProxyWithError__aRecursiveMutex);
}

uint64_t __64__AppleDeviceQuerySupportAssistantSupport_getXpcProxyWithError___block_invoke_3(uint64_t a1)
{
  pthread_mutex_lock(&getXpcProxyWithError__aRecursiveMutex);
  uint64_t v2 = [*(id *)(a1 + 32) serviceXpcName];
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getXpcProxyWithError:]_block_invoke_3", 241, @"Connection to \"%@\" interrupted!", v3, v4, v5, (uint64_t)v2);

  uint64_t v6 = (void *)getXpcProxyWithError__aProxy;
  getXpcProxyWithError__aProxy = 0;

  return pthread_mutex_unlock(&getXpcProxyWithError__aRecursiveMutex);
}

uint64_t __64__AppleDeviceQuerySupportAssistantSupport_getXpcProxyWithError___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  pthread_mutex_lock(&getXpcProxyWithError__aRecursiveMutex);
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getXpcProxyWithError:]_block_invoke_4", 251, @"Connection failed to provide a synchronized proxy, error : %@!", v3, v4, v5, (uint64_t)v2);

  uint64_t v6 = (void *)getXpcProxyWithError__aProxy;
  getXpcProxyWithError__aProxy = 0;

  return pthread_mutex_unlock(&getXpcProxyWithError__aRecursiveMutex);
}

@end