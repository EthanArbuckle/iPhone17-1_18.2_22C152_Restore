@interface AXPTranslator
+ (id)sharedInstance;
+ (id)sharediOSInstance;
- (AXPTranslationDelegateHelper)bridgeDelegate;
- (AXPTranslationRuntimeHelper)runtimeDelegate;
- (AXPTranslationSystemAppDelegate)systemAppDelegate;
- (AXPTranslationTokenDelegateHelper)bridgeTokenDelegate;
- (AXPTranslator)init;
- (BOOL)accessibilityEnabled;
- (BOOL)shouldCheckTreeDumpCacheForRequestType:(unint64_t)a3;
- (BOOL)supportsDelegateTokens;
- (NSMutableDictionary)bridgeDelegateTokenToTreeDumpLookup;
- (NSMutableDictionary)fakeElementCache;
- (OS_dispatch_queue)axTreeDumpSharedBackgroundQueue;
- (id)_checkCacheForFrontmostAppResponseWithBridgeDelegateToken:(id)a3;
- (id)_translationApplicationObjectForPidNumber:(id)a3;
- (id)attributedStringConversionBlock;
- (id)checkTreeDumpCacheForRequest:(id)a3;
- (id)checkTreeDumpCacheResponses:(id)a3 forMatchingResponse:(id)a4 withBridgeTokenDelegate:(id)a5;
- (id)frontmostApplicationWithDisplayId:(unsigned int)a3 bridgeDelegateToken:(id)a4;
- (id)iosPlatformElementFromTranslation:(id)a3;
- (id)objectAtPoint:(CGPoint)a3 displayId:(unsigned int)a4 bridgeDelegateToken:(id)a5;
- (id)platformElementFromTranslation:(id)a3;
- (id)platformTranslator;
- (id)processAXTreeElements:(id)a3;
- (id)processActionRequest:(id)a3;
- (id)processAttributeRequest:(id)a3;
- (id)processCanSetAttribute:(id)a3;
- (id)processFrontMostApp:(id)a3;
- (id)processHitTest:(id)a3;
- (id)processMultipleAttributeRequest:(id)a3;
- (id)processSetAttribute:(id)a3;
- (id)processSupportedActions:(id)a3;
- (id)processSupportsAttributes:(id)a3;
- (id)processTranslatorRequest:(id)a3;
- (id)remoteTranslationDataWithTranslation:(id)a3 pid:(int)a4;
- (id)sendTranslatorRequest:(id)a3;
- (id)translationApplicationObject;
- (id)translationApplicationObjectForPid:(int)a3;
- (id)translationObjectFromData:(id)a3;
- (id)treeDumpCacheResultDataForAttributeTypeRequest:(id)a3;
- (id)treeDumpCacheResultDataForCanSetAttributeTypeRequest:(id)a3;
- (id)treeDumpCacheResultDataForSupportedActionsTypeRequest:(id)a3;
- (id)treeDumpCacheResultDataForSupportsAttributesTypeRequest:(id)a3;
- (id)treeDumpResponseCacheForBridgeDelegateToken:(id)a3;
- (unint64_t)requestResolvingBehavior;
- (void)_handleFocusedUIElementChangedForInitialDump:(id)a3;
- (void)_resetBridgeTokensForResponse:(id)a3 bridgeDelegateToken:(id)a4;
- (void)enableAccessibility;
- (void)generateAXTreeDumpTypeOnBackgroundThread:(id)a3 completionHandler:(id)a4;
- (void)handleNotification:(unint64_t)a3 data:(id)a4 associatedObject:(id)a5;
- (void)handleUpdatedAXTree:(id)a3;
- (void)initializeAXRuntimeForSystemAppServer;
- (void)processPlatformAXTreeDump:(id)a3;
- (void)processPlatformNotification:(unint64_t)a3 data:(id)a4;
- (void)setAccessibilityEnabled:(BOOL)a3;
- (void)setAxTreeDumpSharedBackgroundQueue:(id)a3;
- (void)setBridgeDelegate:(id)a3;
- (void)setBridgeDelegateTokenToTreeDumpLookup:(id)a3;
- (void)setBridgeTokenDelegate:(id)a3;
- (void)setFakeElementCache:(id)a3;
- (void)setRequestResolvingBehavior:(unint64_t)a3;
- (void)setRuntimeDelegate:(id)a3;
- (void)setSupportsDelegateTokens:(BOOL)a3;
- (void)setSystemAppDelegate:(id)a3;
- (void)updateTreeDumpCacheResponse:(id)a3 withAdditionalResponse:(id)a4;
@end

@implementation AXPTranslator

uint64_t __35__AXPTranslator_iOS_sharedInstance__block_invoke()
{
  sharedInstance_Translator = [objc_alloc((Class)objc_opt_class()) init];

  return MEMORY[0x270F9A758]();
}

void __52__AXPTranslator_iOS_attributedStringConversionBlock__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v10 = a2;
  id v11 = a3;
  id v81 = a4;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  v78 = v11;
  id obj = [v11 allKeys];
  uint64_t v82 = [obj countByEnumeratingWithState:&v88 objects:v93 count:16];
  if (v82)
  {
    uint64_t v80 = *(void *)v89;
    uint64_t v68 = *MEMORY[0x263F216A8];
    uint64_t v67 = *MEMORY[0x263F21628];
    uint64_t v74 = *MEMORY[0x263F21648];
    uint64_t v73 = *MEMORY[0x263F21638];
    uint64_t v66 = *MEMORY[0x263F21630];
    v12 = (void *)MEMORY[0x263F21880];
    uint64_t v65 = *MEMORY[0x263F21640];
    uint64_t v72 = *MEMORY[0x263F217B0];
LABEL_3:
    uint64_t v13 = 0;
    while (2)
    {
      if (*(void *)v89 != v80) {
        objc_enumerationMutation(obj);
      }
      uint64_t v83 = v13;
      v14 = *(void **)(*((void *)&v88 + 1) + 8 * v13);
      switch(objc_msgSend(v14, "unsignedIntegerValue", v65))
      {
        case 0:
          v15 = [v81 objectForKeyedSubscript:v72];
          int v16 = [v15 BOOLValue];

          if (v16)
          {
            v17 = v10;
            uint64_t v18 = v72;
            goto LABEL_31;
          }
          goto LABEL_55;
        case 1:
          v29 = [v81 objectForKeyedSubscript:*MEMORY[0x263F217E0]];
          int v30 = [v29 BOOLValue];

          if (v30)
          {
            v21 = (uint64_t *)MEMORY[0x263F217E0];
            goto LABEL_22;
          }
          goto LABEL_55;
        case 2:
          v19 = [v81 objectForKeyedSubscript:*MEMORY[0x263F218A8]];
          int v20 = [v19 BOOLValue];

          if (v20)
          {
            v21 = (uint64_t *)MEMORY[0x263F218A8];
            goto LABEL_22;
          }
          goto LABEL_55;
        case 3:
          uint64_t v28 = [v81 objectForKeyedSubscript:*MEMORY[0x263F217A8]];
          uint64_t v31 = [v81 objectForKeyedSubscript:*MEMORY[0x263F217F0]];
          if (v28 | v31)
          {
            objc_msgSend(v10, "removeAttribute:range:", *MEMORY[0x263F217A8], a5, a6);
            objc_msgSend(v10, "removeAttribute:range:", *MEMORY[0x263F217F0], a5, a6);
            if (v31) {
              v32 = (void *)v31;
            }
            else {
              v32 = (void *)v28;
            }
            id v33 = v32;
            v34 = [v78 objectForKeyedSubscript:v14];
            objc_msgSend(v10, "addAttribute:value:range:", v34, v33, a5, a6);
          }
          goto LABEL_50;
        case 4:
          v35 = v81;
          uint64_t v27 = v66;
          goto LABEL_47;
        case 5:
          v22 = [v81 objectForKeyedSubscript:v73];
          int v23 = [v22 BOOLValue];

          if (!v23) {
            goto LABEL_55;
          }
          v17 = v10;
          uint64_t v18 = v73;
          goto LABEL_31;
        case 6:
          v36 = [v81 objectForKeyedSubscript:v74];
          int v37 = [v36 BOOLValue];

          if (!v37) {
            goto LABEL_55;
          }
          v17 = v10;
          uint64_t v18 = v74;
          goto LABEL_31;
        case 7:
          v24 = (uint64_t *)MEMORY[0x263F216E0];
          v38 = [v81 objectForKeyedSubscript:*MEMORY[0x263F216E0]];

          uint64_t v39 = [*(id *)(a1 + 32) translationObjectFromPlatformElement:v38];
          goto LABEL_44;
        case 8:
          uint64_t v28 = objc_opt_new();
          v40 = (void *)MEMORY[0x263F21750];
          uint64_t v41 = [v81 objectForKeyedSubscript:*MEMORY[0x263F21750]];
          v77 = (void *)v41;
          if (v41)
          {
            v42 = (void *)v41;
            objc_msgSend(v10, "removeAttribute:range:", *v40, a5, a6);
            [(id)v28 setObject:v42 forKeyedSubscript:&unk_26E241AC0];
            v75 = [MEMORY[0x263F08708] punctuationCharacterSet];
            v71 = [v42 componentsSeparatedByCharactersInSet:v75];
            v70 = [v71 componentsJoinedByString:@" "];
            v43 = [MEMORY[0x263F08708] whitespaceCharacterSet];
            v44 = [v70 stringByTrimmingCharactersInSet:v43];
            [(id)v28 setObject:v44 forKeyedSubscript:&unk_26E241AD8];
          }
          v45 = (void *)MEMORY[0x263F21748];
          uint64_t v46 = [v81 objectForKeyedSubscript:*MEMORY[0x263F21748]];
          if (v46)
          {
            objc_msgSend(v10, "removeAttribute:range:", *v45, a5, a6);
            [(id)v28 setObject:v46 forKeyedSubscript:&unk_26E241AF0];
          }
          v76 = (void *)v46;
          v47 = (void *)MEMORY[0x263F21758];
          v48 = [v81 objectForKeyedSubscript:*MEMORY[0x263F21758]];
          if (v48)
          {
            objc_msgSend(v10, "removeAttribute:range:", *v47, a5, a6);
            [(id)v28 setObject:v48 forKeyedSubscript:&unk_26E241B08];
          }
          if ([(id)v28 count])
          {
            v49 = [v78 objectForKeyedSubscript:v14];
            objc_msgSend(v10, "addAttribute:value:range:", v49, v28, a5, a6);
          }
          goto LABEL_53;
        case 13:
          v24 = (uint64_t *)MEMORY[0x263F21760];
          goto LABEL_43;
        case 14:
          v24 = (uint64_t *)MEMORY[0x263F217F8];
LABEL_43:
          uint64_t v39 = [v81 objectForKeyedSubscript:*v24];
LABEL_44:
          uint64_t v28 = v39;
          if (v39) {
            goto LABEL_45;
          }
          goto LABEL_54;
        case 15:
          v25 = [v81 objectForKeyedSubscript:*MEMORY[0x263F218F0]];
          int v26 = [v25 BOOLValue];

          if (!v26) {
            goto LABEL_55;
          }
          v21 = (uint64_t *)MEMORY[0x263F218F0];
LABEL_22:
          uint64_t v18 = *v21;
          v17 = v10;
LABEL_31:
          objc_msgSend(v17, "removeAttribute:range:", v18, a5, a6);
          uint64_t v28 = [v78 objectForKeyedSubscript:v14];
          objc_msgSend(v10, "addAttribute:value:range:", v28, MEMORY[0x263EFFA88], a5, a6);
          goto LABEL_54;
        case 16:
          uint64_t v27 = v65;
          uint64_t v28 = [v81 objectForKeyedSubscript:v65];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_54;
          }
          goto LABEL_48;
        case 17:
          v24 = (uint64_t *)MEMORY[0x263F216D8];
          uint64_t v28 = [v81 objectForKeyedSubscript:*MEMORY[0x263F216D8]];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_54;
          }
LABEL_45:
          uint64_t v50 = *v24;
          v51 = v10;
          goto LABEL_49;
        case 18:
          v35 = v81;
          uint64_t v27 = v67;
LABEL_47:
          uint64_t v28 = [v35 objectForKeyedSubscript:v27];
          if (!v28) {
            goto LABEL_54;
          }
LABEL_48:
          v51 = v10;
          uint64_t v50 = v27;
LABEL_49:
          objc_msgSend(v51, "removeAttribute:range:", v50, a5, a6);
          uint64_t v31 = [v78 objectForKeyedSubscript:v14];
          objc_msgSend(v10, "addAttribute:value:range:", v31, v28, a5, a6);
LABEL_50:

LABEL_54:
LABEL_55:
          long long v86 = 0u;
          long long v87 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          v58 = [v81 keyEnumerator];
          v59 = [v58 allObjects];

          uint64_t v60 = [v59 countByEnumeratingWithState:&v84 objects:v92 count:16];
          if (v60)
          {
            uint64_t v61 = v60;
            uint64_t v62 = *(void *)v85;
            do
            {
              for (uint64_t i = 0; i != v61; ++i)
              {
                if (*(void *)v85 != v62) {
                  objc_enumerationMutation(v59);
                }
                v64 = *(void **)(*((void *)&v84 + 1) + 8 * i);
                if ([v64 hasPrefix:@"UIAccessibilityToken"]
                  && ([v64 isEqualToString:*v12] & 1) == 0)
                {
                  objc_msgSend(v10, "removeAttribute:range:", v64, a5, a6);
                }
              }
              uint64_t v61 = [v59 countByEnumeratingWithState:&v84 objects:v92 count:16];
            }
            while (v61);
          }

          uint64_t v13 = v83 + 1;
          if (v83 + 1 != v82) {
            continue;
          }
          uint64_t v82 = [obj countByEnumeratingWithState:&v88 objects:v93 count:16];
          if (!v82) {
            goto LABEL_67;
          }
          goto LABEL_3;
        case 19:
          uint64_t v28 = [v81 objectForKeyedSubscript:v68];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend(v10, "removeAttribute:range:", v68, a5, a6);
            v52 = [v10 string];
            v77 = objc_msgSend(v52, "substringWithRange:", a5, a6);

            uint64_t v53 = [v77 rangeOfString:v28];
            uint64_t v55 = v54;
            uint64_t v56 = v53 + a5;
            v57 = [v78 objectForKeyedSubscript:v14];
            objc_msgSend(v10, "addAttribute:value:range:", v57, MEMORY[0x263EFFA88], v56, v55);

LABEL_53:
          }
          goto LABEL_54;
        default:
          goto LABEL_55;
      }
    }
  }
LABEL_67:
}

uint64_t __58__AXPTranslator_iOS_initializeAXRuntimeForSystemAppServer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _processAccessibilityAttributeValue:a4];
}

uint64_t __58__AXPTranslator_iOS_initializeAXRuntimeForSystemAppServer__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _processAccessibilityAttributeValue:a4 forParameter:a5];
}

uint64_t __58__AXPTranslator_iOS_initializeAXRuntimeForSystemAppServer__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _processPerformAction:a4 value:a5];
}

id __58__AXPTranslator_iOS_initializeAXRuntimeForSystemAppServer__block_invoke_5(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __58__AXPTranslator_iOS_initializeAXRuntimeForSystemAppServer__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;

  return v3;
}

uint64_t __54__AXPTranslator_iOS__enableAccessibilityBridgeRuntime__block_invoke(uint64_t a1)
{
  if (!_AXSApplicationAccessibilityEnabled())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_appLoadedAccessibilityCallback, (CFStringRef)*MEMORY[0x263F21900], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    id v3 = MEMORY[0x263EF83A0];
    dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
    dispatch_async(v3, &__block_literal_global_333);

    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 128);
    *(void *)(v5 + 128) = v4;

    v7 = *(NSObject **)(*(void *)(a1 + 32) + 128);
    dispatch_time_t v8 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v7, v8);
    int v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 120);
    id v10 = AXPlatformTranslationLogCommon();
    id v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_22E850000, v11, OS_LOG_TYPE_INFO, "App accessibility enabled successfully", v13, 2u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __54__AXPTranslator_iOS__enableAccessibilityBridgeRuntime__block_invoke_cold_1(v11);
    }
  }
  return [*(id *)(a1 + 32) _registerAccessibilityNotifications];
}

uint64_t __54__AXPTranslator_iOS__enableAccessibilityBridgeRuntime__block_invoke_2()
{
  uint64_t v0 = _AXSApplicationAccessibilitySetEnabled();

  return MEMORY[0x270F09800](v0);
}

id __47__AXPTranslator_iOS__processAuditIssuesResult___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x263F215A0];
  dispatch_semaphore_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F215A0]];
  if (v4)
  {
    uint64_t v5 = *MEMORY[0x263F215B8];
    v6 = [v2 objectForKeyedSubscript:*MEMORY[0x263F215B8]];
    uint64_t v7 = [v6 longLongValue];

    if (v7 > 1999)
    {
      uint64_t v12 = 200;
      uint64_t v13 = 300;
      if (v7 != 4001) {
        uint64_t v13 = 0;
      }
      if (v7 != 2000) {
        uint64_t v12 = v13;
      }
      if ((unint64_t)(v7 - 2001) >= 2) {
        uint64_t v10 = v12;
      }
      else {
        uint64_t v10 = 201;
      }
    }
    else if ((unint64_t)(v7 - 1000) > 7)
    {
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v8 = 1 << (v7 + 24);
      uint64_t v9 = 102;
      if (v7 != 1001) {
        uint64_t v9 = 0;
      }
      if ((v8 & 0xC8) != 0) {
        uint64_t v9 = 202;
      }
      if ((v8 & 0x15) != 0) {
        uint64_t v10 = 100;
      }
      else {
        uint64_t v10 = v9;
      }
    }
    id v11 = objc_opt_new();
    v14 = [NSNumber numberWithUnsignedInteger:v10];
    [v11 setObject:v14 forKeyedSubscript:v5];

    [v11 setObject:v4 forKeyedSubscript:v3];
    uint64_t v15 = *MEMORY[0x263F215B0];
    int v16 = [v2 objectForKeyedSubscript:*MEMORY[0x263F215B0]];

    if (v16)
    {
      v17 = [v2 objectForKeyedSubscript:v15];
      [v11 setObject:v17 forKeyedSubscript:v15];
    }
    uint64_t v18 = *MEMORY[0x263F21598];
    v19 = [v2 objectForKeyedSubscript:*MEMORY[0x263F21598]];

    if (v19)
    {
      int v20 = [v2 objectForKeyedSubscript:v18];
      [v11 setObject:v20 forKeyedSubscript:v18];
    }
    uint64_t v21 = *MEMORY[0x263F215A8];
    v22 = [v2 objectForKeyedSubscript:*MEMORY[0x263F215A8]];

    if (v22)
    {
      int v23 = [v2 objectForKeyedSubscript:v21];
      [v11 setObject:v23 forKeyedSubscript:v21];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

id __79__AXPTranslator_iOS__processCellWithIndexPathAttributeRequest_parameter_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = +[AXPTranslator_iOS sharedInstance];
    id v4 = (id)[v3 createPlatformElementFromTranslationObject:v2];
  }
  else
  {
    id v4 = v2;
  }

  return v4;
}

void __72__AXPTranslator_iOS__processTextInputMarkedRangeAttributeRequest_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v9 = [a2 objectForKeyedSubscript:*MEMORY[0x263F216A8]];

  if (v9)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", a3, a4);
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a5 = 1;
  }
}

uint64_t __58__AXPTranslator_iOS_processFrontMostApp_withiOSAttribute___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateCache:*(void *)(a1 + 64)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 40) _processDirectAttributeRequest:*(void *)(a1 + 32) iosAttribute:*(void *)(a1 + 64) axpAttribute:0 parameter:0 error:*(void *)(*(void *)(a1 + 56) + 8) + 24];

  return MEMORY[0x270F9A758]();
}

void __52__AXPTranslator_iOS_axTreeDumpSharedBackgroundQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -1);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.accessibility.AXPRemoteCacheManager.axHierarchyGeneration", v2);
  v1 = (void *)axTreeDumpSharedBackgroundQueue_axTreeDumpBackgroundQueue;
  axTreeDumpSharedBackgroundQueue_axTreeDumpBackgroundQueue = (uint64_t)v0;
}

uint64_t __86__AXPTranslator_iOS_fetchNextSetOfElementAttrsOnBackgroundThreadWithEarlyTermination___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) axTreeDumpGenerateNextSetOfElementAttrsOnMainThread];
}

uint64_t __72__AXPTranslator_iOS_axTreeDumpGenerateNextSetOfElementAttrsOnMainThread__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchNextSetOfElementAttrsOnBackgroundThreadWithEarlyTermination:1];
}

uint64_t __72__AXPTranslator_iOS_axTreeDumpGenerateNextSetOfElementAttrsOnMainThread__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchNextSetOfElementAttrsOnBackgroundThreadWithEarlyTermination:0];
}

void __59__AXPTranslator_iOS__postProcessResultDataForSecureCoding___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) _postProcessResultDataForSecureCoding:a3];
  if (!v5) {
    [*(id *)(a1 + 40) removeObjectForKey:v6];
  }
}

void __59__AXPTranslator_iOS__postProcessResultDataForSecureCoding___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_postProcessResultDataForSecureCoding:");
  if (!v3) {
    [*(id *)(a1 + 40) removeObject:v4];
  }
}

void __59__AXPTranslator_iOS__postProcessResultDataForSecureCoding___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = objc_msgSend(a2, "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(a1 + 32) _postProcessResultDataForSecureCoding:*(void *)(*((void *)&v9 + 1) + 8 * i)];
        if (!v8)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __59__AXPTranslator_iOS__postProcessResultDataForSecureCoding___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = objc_msgSend(a2, "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(a1 + 32) _postProcessResultDataForSecureCoding:*(void *)(*((void *)&v9 + 1) + 8 * i)];
        if (!v8)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __38__AXPTranslator_iOS__allAXTreeActions__block_invoke()
{
  dispatch_queue_t v0 = (void *)_allAXTreeActions_actionValues;
  _allAXTreeActions_actionValues = (uint64_t)&unk_26E2426A8;
}

void __49__AXPTranslator_iOS__topPriorityAXTreeAttrValues__block_invoke()
{
  dispatch_queue_t v0 = (void *)_topPriorityAXTreeAttrValues_attributeValues;
  _topPriorityAXTreeAttrValues_attributeValues = (uint64_t)&unk_26E2426C0;
}

void __47__AXPTranslator_iOS__allAXTreeCanSetAttrValues__block_invoke()
{
  dispatch_queue_t v0 = (void *)_allAXTreeCanSetAttrValues_attributeValues;
  _allAXTreeCanSetAttrValues_attributeValues = (uint64_t)&unk_26E2426D8;
}

void __41__AXPTranslator_iOS__allAXTreeAttrValues__block_invoke()
{
  dispatch_queue_t v0 = (void *)_allAXTreeAttrValues_attributeValues;
  _allAXTreeAttrValues_attributeValues = (uint64_t)&unk_26E2426F0;
}

void __64__AXPTranslator_iOS_createPlatformElementFromTranslationObject___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v2 = [*(id *)(a1 + 32) backTranslationCache];
    uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

    if (!v3)
    {
      uint64_t v4 = AXPlatformTranslationLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __64__AXPTranslator_iOS_createPlatformElementFromTranslationObject___block_invoke_cold_1((uint64_t *)(a1 + 40), v4);
      }
    }
    uint64_t v5 = [v3 pid];
    uint64_t v6 = [v3 uid];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = MEMORY[0x230FA6910](v5, v6, v7);
  }
}

void __58__AXPTranslator_iOS_translationObjectFromPlatformElement___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) translationCache];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setPid:", objc_msgSend(*(id *)(a1 + 48), "pid"));
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIsApplicationElement:AXUIElementIsApplication()];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDidPopuldateAppInfo:1];
    CFTypeRef cf = 0;
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = getpid();
    int v11 = _AXPAXUIElementReplaceWithRemotePid(v9, &cf, v10);
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    if (!v11 || !AXPIsCatalyst()) {
      [*(id *)(a1 + 32) _addCacheElement:*(void *)(a1 + 40) translationObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    }
  }
}

id __58__AXPTranslator_iOS_translationObjectFromPlatformElement___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[AXPTranslator_iOS sharedInstance];
  uint64_t v4 = (const void *)[v3 createPlatformElementFromTranslationObject:v2];

  uint64_t v5 = (void *)MEMORY[0x263F21690];
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = [v5 uiElementWithAXElement:v4 cache:v6];

  uint64_t v8 = [v7 description];
  uint64_t v9 = [v7 stringWithAXAttribute:2185];
  uint64_t v10 = [v8 stringByAppendingFormat:@" -- ORIGINAL DESCRIPTION: %@", v9];

  if (v4) {
    CFRelease(v4);
  }
  int v11 = [NSString stringWithFormat:@"[%d] %@", objc_msgSend(v7, "pid"), v10];

  return v11;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__AXPTranslator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  id v2 = (void *)sharedInstance_Translator_0;

  return v2;
}

uint64_t __31__AXPTranslator_sharedInstance__block_invoke()
{
  sharedInstance_Translator_0 = [objc_alloc((Class)objc_opt_class()) init];

  return MEMORY[0x270F9A758]();
}

+ (id)sharediOSInstance
{
  return +[AXPTranslator_iOS sharedInstance];
}

- (AXPTranslator)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXPTranslator;
  id v2 = [(AXPTranslator *)&v5 init];
  uint64_t v3 = objc_opt_new();
  [(AXPTranslator *)v2 setFakeElementCache:v3];

  [(AXPTranslator *)v2 setRequestResolvingBehavior:0];
  return v2;
}

- (id)translationApplicationObject
{
  return [(AXPTranslator *)self _translationApplicationObjectForPidNumber:0];
}

- (id)translationApplicationObjectForPid:(int)a3
{
  uint64_t v4 = [NSNumber numberWithInt:*(void *)&a3];
  objc_super v5 = [(AXPTranslator *)self _translationApplicationObjectForPidNumber:v4];

  return v5;
}

- (id)_translationApplicationObjectForPidNumber:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = +[AXPTranslatorRequest requestWithTranslation:0];
  [v5 setRequestType:1];
  if (v4)
  {
    uint64_t v10 = @"pid";
    v11[0] = v4;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v5 setParameters:v6];
  }
  uint64_t v7 = [(AXPTranslator *)self sendTranslatorRequest:v5];
  uint64_t v8 = [v7 translationResponse];

  return v8;
}

- (id)frontmostApplicationWithDisplayId:(unsigned int)a3 bridgeDelegateToken:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (([(AXPTranslator *)self requestResolvingBehavior] == 2
     || [(AXPTranslator *)self requestResolvingBehavior] == 1)
    && ([(AXPTranslator *)self _checkCacheForFrontmostAppResponseWithBridgeDelegateToken:v6], (uint64_t v7 = (AXPTranslationObject *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v8 = v7;
    uint64_t v9 = [(AXPTranslationObject *)v7 translationResponse];
  }
  else
  {
    uint64_t v8 = [[AXPTranslationObject alloc] init];
    [(AXPTranslationObject *)v8 setBridgeDelegateToken:v6];
    uint64_t v10 = +[AXPTranslatorRequest requestWithTranslation:v8];
    [v10 setRequestType:4];
    uint64_t v15 = @"displayId";
    int v11 = [NSNumber numberWithUnsignedInt:v4];
    v16[0] = v11;
    long long v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    [v10 setParameters:v12];

    uint64_t v13 = [(AXPTranslator *)self sendTranslatorRequest:v10];
    uint64_t v9 = [v13 translationResponse];
  }

  return v9;
}

- (id)_checkCacheForFrontmostAppResponseWithBridgeDelegateToken:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [(AXPTranslator *)self treeDumpResponseCacheForBridgeDelegateToken:v4];
  id v6 = [v5 treeDumpResponse];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 associatedRequestType] == 4)
        {
          id v13 = v12;

          uint64_t v9 = v13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v14 = v9;

  return v14;
}

- (void)handleNotification:(unint64_t)a3 data:(id)a4 associatedObject:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = AXPlatformTranslationLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AXPTranslator handleNotification:data:associatedObject:](a3, (uint64_t)v8, v10);
  }

  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  long long v19 = __58__AXPTranslator_handleNotification_data_associatedObject___block_invoke;
  int v20 = &unk_2649DF218;
  uint64_t v21 = self;
  unint64_t v24 = a3;
  id v11 = v8;
  id v22 = v11;
  id v12 = v9;
  id v23 = v12;
  dispatch_async(MEMORY[0x263EF83A0], &v17);
  if ([(AXPTranslator *)self requestResolvingBehavior] != 1)
  {
    unint64_t v13 = [(AXPTranslator *)self requestResolvingBehavior];
    if (a3 == 2 && v13 != 2)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = AXPlatformTranslationLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[AXPTranslator handleNotification:data:associatedObject:](v12, self, v14);
        }

        uint64_t v15 = [(AXPTranslator *)self fakeElementCache];
        long long v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "objectID"));
        [v15 setObject:0 forKeyedSubscript:v16];
      }
    }
  }
}

void __58__AXPTranslator_handleNotification_data_associatedObject___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformTranslator];
  [v2 processPlatformNotification:*(void *)(a1 + 56) data:*(void *)(a1 + 40) associatedObject:*(void *)(a1 + 48)];
}

- (void)handleUpdatedAXTree:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = AXPlatformTranslationLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXPTranslator handleUpdatedAXTree:](v5);
  }

  id v6 = [v4 associatedTranslationObject];
  uint64_t v7 = [v6 bridgeDelegateToken];

  if (v7)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v8 = [v4 treeDumpResponse];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(v8);
          }
          unint64_t v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          id v14 = [v13 resultData];
          [(AXPTranslator *)self _resetBridgeTokensForResponse:v14 bridgeDelegateToken:v7];

          uint64_t v15 = [v13 associatedNotificationObject];
          [v15 setBridgeDelegateToken:v7];

          long long v16 = [v13 associatedTranslationObject];
          [v16 setBridgeDelegateToken:v7];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v10);
    }

    uint64_t v17 = [v4 treeDumpType];
    int v18 = [v17 isEqualToString:@"AXPTreeDumpTypeInitialDump"];

    if (v18)
    {
      long long v19 = [(AXPTranslator *)self bridgeDelegateTokenToTreeDumpLookup];
      [v19 setObject:v4 forKeyedSubscript:v7];

      [(AXPTranslator *)self _handleFocusedUIElementChangedForInitialDump:v4];
    }
    else
    {
      uint64_t v21 = [v4 treeDumpType];
      int v22 = [v21 isEqualToString:@"AXPTreeDumpTypeAdditionalData"];

      if (v22)
      {
        id v23 = [(AXPTranslator *)self treeDumpResponseCacheForBridgeDelegateToken:v7];
        unint64_t v24 = (void *)MEMORY[0x263EFF980];
        v36 = v23;
        v25 = [v23 treeDumpResponse];
        int v26 = [v24 arrayWithArray:v25];

        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        uint64_t v27 = [v4 treeDumpResponse];
        uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v38;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v38 != v30) {
                objc_enumerationMutation(v27);
              }
              uint64_t v32 = *(void *)(*((void *)&v37 + 1) + 8 * j);
              id v33 = [(AXPTranslator *)self checkTreeDumpCacheResponses:v26 forMatchingResponse:v32 withBridgeTokenDelegate:v7];
              if (v33) {
                [(AXPTranslator *)self updateTreeDumpCacheResponse:v33 withAdditionalResponse:v32];
              }
              else {
                [v26 addObject:v32];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v29);
        }

        id v34 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        [v34 setObject:v26 forKeyedSubscript:@"treeDump"];
        v35 = [v36 treeDumpType];
        [v34 setObject:v35 forKeyedSubscript:@"treeDumpType"];

        [v36 setResultData:v34];
      }
    }
  }
  else
  {
    int v20 = AXPlatformTranslationLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[AXPTranslator handleUpdatedAXTree:](v20);
    }
  }
}

- (void)_handleFocusedUIElementChangedForInitialDump:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v24 = 0;
  v25 = (id *)&v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__0;
  uint64_t v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__0;
  int v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v12 = a3;
  uint64_t v3 = [v12 treeDumpResponse];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v7 associatedRequestType] == 2)
        {
          id v8 = [v7 resultData];
          BOOL v9 = v8 == 0;

          if (!v9) {
            continue;
          }
        }
        if ([v7 associatedRequestType] == 5)
        {
          uint64_t v10 = [v7 resultData];
          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 3221225472;
          v13[2] = __62__AXPTranslator__handleFocusedUIElementChangedForInitialDump___block_invoke;
          v13[3] = &unk_2649DF240;
          v13[4] = v7;
          v13[5] = &v18;
          v13[6] = &v24;
          [v10 enumerateKeysAndObjectsUsingBlock:v13];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v30 count:16];
    }
    while (v4);
  }

  id v11 = v25[5];
  if (!v11) {
    id v11 = (id)v19[5];
  }
  objc_storeStrong(v25 + 5, v11);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
}

void __62__AXPTranslator__handleFocusedUIElementChangedForInitialDump___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) associatedTranslationObject];
  int v7 = [v6 isApplicationElement];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) associatedTranslationObject];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if ([v11 isEqualToNumber:&unk_26E242690]) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    }
  }
}

- (void)_resetBridgeTokensForResponse:(id)a3 bridgeDelegateToken:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(v8);
            }
            [(AXPTranslator *)self _resetBridgeTokensForResponse:*(void *)(*((void *)&v22 + 1) + 8 * i) bridgeDelegateToken:v7];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v10);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_21;
      }
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = v6;
      uint64_t v13 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v19;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v19 != v15) {
              objc_enumerationMutation(v8);
            }
            long long v17 = objc_msgSend(v8, "objectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
            [(AXPTranslator *)self _resetBridgeTokensForResponse:v17 bridgeDelegateToken:v7];
          }
          uint64_t v14 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }
        while (v14);
      }
    }

    goto LABEL_21;
  }
  [v6 setBridgeDelegateToken:v7];
LABEL_21:
}

- (id)sendTranslatorRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(AXPTranslator *)self bridgeDelegate];
  if (v5)
  {
  }
  else
  {
    id v6 = [(AXPTranslator *)self bridgeTokenDelegate];

    if (!v6)
    {
      long long v38 = AXPlatformTranslationLogCommon();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[AXPTranslator sendTranslatorRequest:](v38);
      }

      goto LABEL_21;
    }
  }
  unint64_t v7 = [(AXPTranslator *)self requestResolvingBehavior];
  unint64_t v8 = [(AXPTranslator *)self requestResolvingBehavior];
  [(AXPTranslator *)self requestResolvingBehavior];
  if (!AXPClientIsEntitledForRemoteDeviceContent())
  {
LABEL_21:
    uint64_t v9 = +[AXPTranslatorResponse emptyResponse];
    goto LABEL_22;
  }
  if (v7 != 1 && v8 != 2
    || !-[AXPTranslator shouldCheckTreeDumpCacheForRequestType:](self, "shouldCheckTreeDumpCacheForRequestType:", [v4 requestType]))
  {
    uint64_t v9 = 0;
    goto LABEL_14;
  }
  uint64_t v9 = [(AXPTranslator *)self checkTreeDumpCacheForRequest:v4];
  if (v7 != 1) {
    goto LABEL_11;
  }
  if ([v4 requestType] != 5) {
    goto LABEL_11;
  }
  uint64_t v10 = [v9 resultData];
  uint64_t v11 = [v10 allKeys];
  id v12 = [v4 parameters];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"attributes"];
  int v14 = [v11 isEqualToArray:v13];

  if (v14)
  {
LABEL_11:
    if (v9)
    {
      uint64_t v15 = [v9 resultData];
      long long v16 = [v4 translation];
      long long v17 = [v16 bridgeDelegateToken];
      [(AXPTranslator *)self _resetBridgeTokensForResponse:v15 bridgeDelegateToken:v17];

      long long v18 = [v4 translation];
      long long v19 = [v18 bridgeDelegateToken];
      long long v20 = [v9 associatedNotificationObject];
      [v20 setBridgeDelegateToken:v19];

      long long v21 = [v4 translation];
      long long v22 = [v21 bridgeDelegateToken];
      long long v23 = [v9 associatedTranslationObject];
      [v23 setBridgeDelegateToken:v22];

      goto LABEL_22;
    }
  }
  if ([(AXPTranslator *)self requestResolvingBehavior] != 2)
  {
LABEL_14:
    if ([(AXPTranslator *)self supportsDelegateTokens])
    {
      long long v24 = [(AXPTranslator *)self bridgeTokenDelegate];
      long long v25 = [v4 translation];
      uint64_t v26 = [v25 bridgeDelegateToken];
      uint64_t v27 = [v24 accessibilityTranslationDelegateBridgeCallbackWithToken:v26];
      uint64_t v28 = ((void (**)(void, id))v27)[2](v27, v4);

      uint64_t v9 = (void *)v26;
    }
    else
    {
      long long v24 = [(AXPTranslator *)self bridgeDelegate];
      long long v25 = [v24 accessibilityTranslationDelegateBridgeCallback];
      uint64_t v28 = ((void (**)(void, id))v25)[2](v25, v4);
    }

    id v29 = [v28 resultData];
    uint64_t v30 = [v4 translation];
    uint64_t v31 = [v30 bridgeDelegateToken];
    [(AXPTranslator *)self _resetBridgeTokensForResponse:v29 bridgeDelegateToken:v31];

    uint64_t v32 = [v4 translation];
    id v33 = [v32 bridgeDelegateToken];
    id v34 = [v28 associatedNotificationObject];
    [v34 setBridgeDelegateToken:v33];

    v35 = [v4 translation];
    v36 = [v35 bridgeDelegateToken];
    long long v37 = [v28 associatedTranslationObject];
    [v37 setBridgeDelegateToken:v36];

    uint64_t v9 = v28;
    goto LABEL_22;
  }
  uint64_t v40 = +[AXPTranslatorResponse emptyResponse];

  uint64_t v9 = (void *)v40;
LABEL_22:

  return v9;
}

- (id)treeDumpResponseCacheForBridgeDelegateToken:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(AXPTranslator *)self bridgeDelegateTokenToTreeDumpLookup];
    id v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)shouldCheckTreeDumpCacheForRequestType:(unint64_t)a3
{
  return (a3 < 0xB) & (0x63Cu >> a3);
}

- (void)updateTreeDumpCacheResponse:(id)a3 withAdditionalResponse:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 associatedRequestType];
  uint64_t v8 = [v5 associatedRequestType];
  uint64_t v9 = [v5 associatedRequestType];
  uint64_t v10 = [v5 associatedRequestType];
  uint64_t v11 = [v5 associatedRequestType];
  if (v7 != 2)
  {
    if (v8 == 5)
    {
      id v12 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v13 = [v5 resultData];
      id v14 = [v12 dictionaryWithDictionary:v13];

      if ([v6 associatedRequestType] == 2
        && ([v6 resultData], uint64_t v15 = objc_claimAutoreleasedReturnValue(), v15, v15))
      {
        long long v16 = [v6 resultData];
        long long v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "attribute"));
        [v14 setObject:v16 forKey:v17];
      }
      else if ([v6 associatedRequestType] == 5)
      {
        long long v23 = [v6 resultData];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __68__AXPTranslator_updateTreeDumpCacheResponse_withAdditionalResponse___block_invoke;
        v30[3] = &unk_2649DF268;
        id v31 = v14;
        [v23 enumerateKeysAndObjectsUsingBlock:v30];
      }
      long long v24 = (void *)[v14 copy];
      [v5 setResultData:v24];

      goto LABEL_16;
    }
    if (v9 != 3)
    {
      if (v10 == 10)
      {
        long long v18 = (void *)MEMORY[0x263EFF9A0];
        long long v19 = [v5 resultData];
        long long v20 = [v18 dictionaryWithDictionary:v19];

        long long v21 = [v6 resultData];
        uint64_t v25 = MEMORY[0x263EF8330];
        uint64_t v26 = 3221225472;
        uint64_t v27 = __68__AXPTranslator_updateTreeDumpCacheResponse_withAdditionalResponse___block_invoke_2;
        uint64_t v28 = &unk_2649DF268;
        id v29 = v20;
        id v14 = v20;
        [v21 enumerateKeysAndObjectsUsingBlock:&v25];

        long long v22 = objc_msgSend(v14, "copy", v25, v26, v27, v28);
        [v5 setResultData:v22];

LABEL_16:
        goto LABEL_17;
      }
      if (v11 != 9) {
        goto LABEL_17;
      }
    }
LABEL_15:
    id v14 = [v6 resultData];
    [v5 setResultData:v14];
    goto LABEL_16;
  }
  if ([v6 associatedRequestType] == 2) {
    goto LABEL_15;
  }
  [v6 associatedRequestType];
LABEL_17:
}

uint64_t __68__AXPTranslator_updateTreeDumpCacheResponse_withAdditionalResponse___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

uint64_t __68__AXPTranslator_updateTreeDumpCacheResponse_withAdditionalResponse___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

- (id)checkTreeDumpCacheResponses:(id)a3 forMatchingResponse:(id)a4 withBridgeTokenDelegate:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 associatedRequestType] == 4)
  {
    id v11 = [(AXPTranslator *)self _checkCacheForFrontmostAppResponseWithBridgeDelegateToken:v10];
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v8;
    id v11 = (id)[v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      id v22 = v8;
      uint64_t v13 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v12);
          }
          uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v16 = [v15 associatedRequestType];
          if (v16 == [v9 associatedRequestType])
          {
            long long v17 = [v15 associatedTranslationObject];
            long long v18 = [v9 associatedTranslationObject];
            int v19 = [v17 isEqual:v18];

            if (v19)
            {
              if ([v15 associatedRequestType] != 3
                || (uint64_t v20 = [v15 attribute], v20 == objc_msgSend(v9, "attribute")))
              {
                id v11 = v15;
                goto LABEL_16;
              }
            }
          }
        }
        id v11 = (id)[v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v11) {
          continue;
        }
        break;
      }
LABEL_16:
      id v8 = v22;
    }
  }

  return v11;
}

- (id)treeDumpCacheResultDataForAttributeTypeRequest:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 requestType];
  uint64_t v6 = [v4 requestType];
  uint64_t v7 = [v4 translation];
  id v8 = [v7 bridgeDelegateToken];
  id v9 = [(AXPTranslator *)self treeDumpResponseCacheForBridgeDelegateToken:v8];

  uint64_t v39 = v5;
  if (v5 == 2)
  {
    id v10 = (void *)MEMORY[0x263EFF8C0];
    id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "attributeType"));
    id v12 = [v10 arrayWithObject:v11];

    if (!v9) {
      goto LABEL_48;
    }
    goto LABEL_6;
  }
  if (v6 != 5)
  {
    id v12 = 0;
    goto LABEL_48;
  }
  uint64_t v13 = [v4 parameters];
  id v12 = [v13 objectForKeyedSubscript:@"attributes"];

  if (!v9)
  {
LABEL_48:
    id v36 = 0;
    goto LABEL_51;
  }
LABEL_6:
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v12;
  uint64_t v44 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (!v44)
  {
    long long v42 = 0;
    goto LABEL_50;
  }
  uint64_t v38 = v6;
  long long v42 = 0;
  uint64_t v43 = *(void *)v52;
  long long v41 = v9;
  do
  {
    for (uint64_t i = 0; i != v44; ++i)
    {
      if (*(void *)v52 != v43) {
        objc_enumerationMutation(obj);
      }
      uint64_t v46 = *(void *)(*((void *)&v51 + 1) + 8 * i);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      uint64_t v15 = [v9 treeDumpResponse];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v55 count:16];
      if (!v16) {
        goto LABEL_44;
      }
      uint64_t v17 = v16;
      uint64_t v45 = i;
      char v18 = 0;
      uint64_t v19 = *(void *)v48;
      while (2)
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v48 != v19) {
            objc_enumerationMutation(v15);
          }
          long long v21 = *(void **)(*((void *)&v47 + 1) + 8 * j);
          uint64_t v22 = [v21 associatedRequestType];
          uint64_t v23 = [v21 associatedRequestType];
          if (v22 == 2 || v23 == 5)
          {
            long long v25 = [v21 associatedTranslationObject];
            long long v26 = [v4 translation];
            int v27 = [v25 isEqual:v26];

            if (v27)
            {
              if ([v4 attributeType]
                && [v21 attribute]
                && (uint64_t v28 = [v21 attribute], v28 == objc_msgSend(v4, "attributeType")))
              {
                id v29 = [v21 resultData];
                char v18 = 1;
LABEL_30:
                if (v29)
                {
                  if (v39 == 2)
                  {
                    id v34 = v29;

                    long long v42 = v34;
                    id v9 = v41;
                    uint64_t i = v45;
                  }
                  else
                  {
                    id v9 = v41;
                    uint64_t i = v45;
                    if (v38 == 5)
                    {
                      v35 = v42;
                      if (!v42) {
                        v35 = objc_opt_new();
                      }
                      long long v42 = v35;
                      [v35 setObject:v29 forKey:v46];
                    }
                  }

                  goto LABEL_44;
                }
              }
              else
              {
                uint64_t v30 = [v21 resultData];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass)
                {
                  uint64_t v32 = [v21 resultData];
                  id v29 = [v32 objectForKey:v46];

                  if (v29)
                  {
                    id v33 = v29;
                    char v18 = 1;
                  }

                  if (v18) {
                    goto LABEL_30;
                  }
                }
                else
                {
                  id v29 = 0;
                }
              }

              continue;
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v17) {
          continue;
        }
        break;
      }
      id v9 = v41;
      uint64_t i = v45;
LABEL_44:
    }
    uint64_t v44 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  }
  while (v44);
LABEL_50:
  id v12 = obj;

  id v36 = v42;
LABEL_51:

  return v36;
}

- (id)treeDumpCacheResultDataForCanSetAttributeTypeRequest:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 requestType];
  uint64_t v6 = [v4 translation];
  uint64_t v7 = [v6 bridgeDelegateToken];
  id v8 = [(AXPTranslator *)self treeDumpResponseCacheForBridgeDelegateToken:v7];

  id v9 = 0;
  if (v5 == 3 && v8)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = objc_msgSend(v8, "treeDumpResponse", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v15 associatedRequestType] == 3)
          {
            uint64_t v16 = [v15 associatedTranslationObject];
            uint64_t v17 = [v4 translation];
            int v18 = [v16 isEqual:v17];

            if (v18)
            {
              if ([v4 attributeType])
              {
                if ([v15 attribute])
                {
                  uint64_t v19 = [v15 attribute];
                  if (v19 == [v4 attributeType])
                  {
                    uint64_t v20 = [v15 resultData];
                    if (v20)
                    {
                      id v9 = (void *)v20;
                      goto LABEL_18;
                    }
                  }
                }
              }
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    id v9 = 0;
LABEL_18:
  }

  return v9;
}

- (id)treeDumpCacheResultDataForSupportedActionsTypeRequest:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 requestType];
  uint64_t v6 = [v4 translation];
  uint64_t v7 = [v6 bridgeDelegateToken];
  id v8 = [(AXPTranslator *)self treeDumpResponseCacheForBridgeDelegateToken:v7];

  id v9 = 0;
  if (v5 == 9 && v8)
  {
    id v10 = [v4 parameters];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"actions"];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v11;
    uint64_t v35 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v35)
    {
      id v33 = 0;
      uint64_t v34 = *(void *)v42;
      uint64_t v32 = v8;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v42 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v14 = [v8 treeDumpResponse];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v36 = i;
            uint64_t v17 = *(void *)v38;
            while (2)
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v38 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * j);
                if ([v19 associatedRequestType] == 9)
                {
                  uint64_t v20 = [v19 associatedTranslationObject];
                  long long v21 = [v4 translation];
                  int v22 = [v20 isEqual:v21];

                  if (v22)
                  {
                    long long v23 = [v19 resultData];
                    objc_opt_class();
                    char isKindOfClass = objc_opt_isKindOfClass();

                    if (isKindOfClass)
                    {
                      long long v25 = [v19 resultData];
                      int v26 = [v25 containsObject:v13];

                      if (v26)
                      {
                        id v27 = v13;
                        if (v13)
                        {
                          uint64_t v28 = v27;
                          id v29 = v33;
                          if (!v33)
                          {
                            id v29 = [MEMORY[0x263EFF980] array];
                          }
                          id v33 = v29;
                          [v29 addObject:v28];

                          goto LABEL_24;
                        }
                      }
                    }
                  }
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
              if (v16) {
                continue;
              }
              break;
            }
LABEL_24:
            id v8 = v32;
            uint64_t i = v36;
          }
        }
        uint64_t v35 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v35);
    }
    else
    {
      id v33 = 0;
    }

    id v9 = v33;
  }

  return v9;
}

- (id)treeDumpCacheResultDataForSupportsAttributesTypeRequest:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 requestType];
  uint64_t v6 = [v4 translation];
  uint64_t v7 = [v6 bridgeDelegateToken];
  id v8 = [(AXPTranslator *)self treeDumpResponseCacheForBridgeDelegateToken:v7];

  id v9 = 0;
  if (v5 == 10 && v8)
  {
    id v10 = [v4 parameters];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"attributes"];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v11;
    uint64_t v33 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v33)
    {
      uint64_t v31 = *(void *)v40;
      uint64_t v32 = 0;
      uint64_t v30 = v8;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v40 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v14 = [v8 treeDumpResponse];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v34 = i;
            uint64_t v17 = *(void *)v36;
            while (2)
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v36 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                if ([v19 associatedRequestType] == 10)
                {
                  uint64_t v20 = [v19 associatedTranslationObject];
                  long long v21 = [v4 translation];
                  int v22 = [v20 isEqual:v21];

                  if (v22)
                  {
                    long long v23 = [v19 resultData];
                    objc_opt_class();
                    char isKindOfClass = objc_opt_isKindOfClass();

                    if (isKindOfClass)
                    {
                      long long v25 = [v19 resultData];
                      int v26 = [v25 objectForKey:v13];

                      if (v26)
                      {
                        id v27 = v32;
                        if (!v32) {
                          id v27 = objc_opt_new();
                        }
                        uint64_t v32 = v27;
                        [v27 setObject:v26 forKey:v13];

                        goto LABEL_23;
                      }
                    }
                  }
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v43 count:16];
              if (v16) {
                continue;
              }
              break;
            }
LABEL_23:
            id v8 = v30;
            uint64_t i = v34;
          }
        }
        uint64_t v33 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v33);
    }
    else
    {
      uint64_t v32 = 0;
    }

    id v9 = v32;
  }

  return v9;
}

- (id)checkTreeDumpCacheForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = 0;
  switch([v4 requestType])
  {
    case 2:
      objc_msgSend(v5, "setAttribute:", objc_msgSend(v4, "attributeType"));
      goto LABEL_3;
    case 3:
      objc_msgSend(v5, "setAttribute:", objc_msgSend(v4, "attributeType"));
      uint64_t v7 = [(AXPTranslator *)self treeDumpCacheResultDataForCanSetAttributeTypeRequest:v4];
      goto LABEL_8;
    case 4:
      id v8 = [v4 translation];
      id v9 = [v8 bridgeDelegateToken];
      id v6 = [(AXPTranslator *)self _checkCacheForFrontmostAppResponseWithBridgeDelegateToken:v9];

      break;
    case 5:
LABEL_3:
      uint64_t v7 = [(AXPTranslator *)self treeDumpCacheResultDataForAttributeTypeRequest:v4];
      goto LABEL_8;
    case 9:
      uint64_t v7 = [(AXPTranslator *)self treeDumpCacheResultDataForSupportedActionsTypeRequest:v4];
      goto LABEL_8;
    case 10:
      uint64_t v7 = [(AXPTranslator *)self treeDumpCacheResultDataForSupportsAttributesTypeRequest:v4];
LABEL_8:
      id v10 = (void *)v7;
      [v5 setResultData:v7];

      uint64_t v11 = [v5 resultData];

      if (v11) {
        uint64_t v12 = v5;
      }
      else {
        uint64_t v12 = 0;
      }
      id v6 = v12;
      break;
    default:
      break;
  }

  return v6;
}

- (id)platformTranslator
{
  return +[AXPTranslator_iOS sharedInstance];
}

- (id)processTranslatorRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXPTranslator *)self platformTranslator];
  [v5 enableAccessibility];
  switch([v4 requestType])
  {
    case 1:
      uint64_t v6 = [v5 processApplicationObject:v4];
      goto LABEL_13;
    case 2:
      uint64_t v6 = [v5 processAttributeRequest:v4];
      goto LABEL_13;
    case 3:
      uint64_t v6 = [v5 processCanSetAttribute:v4];
      goto LABEL_13;
    case 4:
      uint64_t v6 = [v5 processFrontMostApp:v4];
      goto LABEL_13;
    case 5:
      uint64_t v6 = [v5 processMultipleAttributeRequest:v4];
      goto LABEL_13;
    case 6:
      uint64_t v6 = [v5 processHitTest:v4];
      goto LABEL_13;
    case 7:
      uint64_t v6 = [v5 processActionRequest:v4];
      goto LABEL_13;
    case 8:
      uint64_t v6 = [v5 processSetAttribute:v4];
      goto LABEL_13;
    case 9:
      uint64_t v6 = [v5 processSupportedActions:v4];
      goto LABEL_13;
    case 10:
      uint64_t v6 = [v5 processSupportsAttributes:v4];
      goto LABEL_13;
    case 11:
      uint64_t v6 = [v5 processAXTreeElements:v4];
LABEL_13:
      uint64_t v7 = (void *)v6;
      if (!v6) {
        goto LABEL_14;
      }
      goto LABEL_15;
    default:
LABEL_14:
      uint64_t v7 = +[AXPTranslatorResponse emptyResponse];
LABEL_15:
      objc_msgSend(v7, "setAssociatedRequestType:", objc_msgSend(v4, "requestType"));

      return v7;
  }
}

- (id)objectAtPoint:(CGPoint)a3 displayId:(unsigned int)a4 bridgeDelegateToken:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  double y = a3.y;
  double x = a3.x;
  v19[2] = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = [[AXPTranslationObject alloc] init];
  [(AXPTranslationObject *)v10 setBridgeDelegateToken:v9];

  uint64_t v11 = +[AXPTranslatorRequest requestWithTranslation:v10];
  [v11 setRequestType:6];
  v18[0] = @"point";
  uint64_t v12 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x, y);
  v18[1] = @"displayId";
  v19[0] = v12;
  uint64_t v13 = [NSNumber numberWithUnsignedInt:v5];
  v19[1] = v13;
  id v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  [v11 setParameters:v14];

  uint64_t v15 = [(AXPTranslator *)self sendTranslatorRequest:v11];
  uint64_t v16 = [v15 translationResponse];

  return v16;
}

- (id)iosPlatformElementFromTranslation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXPTranslator *)self platformTranslator];
  uint64_t v6 = [v5 platformElementFromTranslation:v4];

  return v6;
}

- (void)setSystemAppDelegate:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_systemAppDelegate, v4);
  uint64_t v5 = [(AXPTranslator *)self platformTranslator];
  uint64_t v6 = v5;
  if (v5 != self)
  {
    [(AXPTranslator *)v5 setSystemAppDelegate:v4];
    if ([v4 requiresAXRuntimeInitialization])
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __38__AXPTranslator_setSystemAppDelegate___block_invoke;
      block[3] = &unk_2649DEF48;
      id v8 = v6;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __38__AXPTranslator_setSystemAppDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) initializeAXRuntimeForSystemAppServer];
}

- (void)setBridgeDelegate:(id)a3
{
  id v6 = a3;
  objc_storeWeak((id *)&self->_bridgeDelegate, v6);
  id v4 = [(AXPTranslator *)self platformTranslator];
  uint64_t v5 = v4;
  if (v4 != self) {
    [(AXPTranslator *)v4 setBridgeDelegate:v6];
  }
}

- (void)setBridgeTokenDelegate:(id)a3
{
  id v6 = a3;
  objc_storeWeak((id *)&self->_bridgeTokenDelegate, v6);
  [(AXPTranslator *)self setSupportsDelegateTokens:v6 != 0];
  id v4 = [(AXPTranslator *)self platformTranslator];
  uint64_t v5 = v4;
  if (v4 != self)
  {
    [(AXPTranslator *)v4 setBridgeTokenDelegate:v6];
    [(AXPTranslator *)v5 setSupportsDelegateTokens:[(AXPTranslator *)self supportsDelegateTokens]];
  }
}

- (void)setRuntimeDelegate:(id)a3
{
  id v6 = a3;
  objc_storeWeak((id *)&self->_runtimeDelegate, v6);
  id v4 = [(AXPTranslator *)self platformTranslator];

  if (v4 != self)
  {
    uint64_t v5 = [(AXPTranslator *)self platformTranslator];
    [v5 setRuntimeDelegate:v6];
  }
}

- (void)setRequestResolvingBehavior:(unint64_t)a3
{
  if (self->_requestResolvingBehavior != a3)
  {
    if (a3)
    {
      if (a3 <= 2)
      {
        uint64_t v5 = objc_opt_new();
        [(AXPTranslator *)self setBridgeDelegateTokenToTreeDumpLookup:v5];
      }
    }
    else
    {
      [(AXPTranslator *)self setBridgeDelegateTokenToTreeDumpLookup:0];
    }
    self->_requestResolvingBehavior = a3;
    id v6 = [(AXPTranslator *)self platformTranslator];

    if (v6 != self)
    {
      id v7 = [(AXPTranslator *)self platformTranslator];
      [v7 setRequestResolvingBehavior:a3];
    }
  }
}

- (void)setAccessibilityEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_accessibilityEnabled = a3;
  uint64_t v5 = [(AXPTranslator *)self platformTranslator];

  if (v5 != self)
  {
    id v6 = [(AXPTranslator *)self platformTranslator];
    [v6 setAccessibilityEnabled:v3];
  }
}

- (BOOL)accessibilityEnabled
{
  return self->_accessibilityEnabled;
}

- (AXPTranslationDelegateHelper)bridgeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bridgeDelegate);

  return (AXPTranslationDelegateHelper *)WeakRetained;
}

- (AXPTranslationTokenDelegateHelper)bridgeTokenDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bridgeTokenDelegate);

  return (AXPTranslationTokenDelegateHelper *)WeakRetained;
}

- (unint64_t)requestResolvingBehavior
{
  return self->_requestResolvingBehavior;
}

- (AXPTranslationRuntimeHelper)runtimeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_runtimeDelegate);

  return (AXPTranslationRuntimeHelper *)WeakRetained;
}

- (AXPTranslationSystemAppDelegate)systemAppDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemAppDelegate);

  return (AXPTranslationSystemAppDelegate *)WeakRetained;
}

- (NSMutableDictionary)fakeElementCache
{
  return self->_fakeElementCache;
}

- (void)setFakeElementCache:(id)a3
{
}

- (BOOL)supportsDelegateTokens
{
  return self->_supportsDelegateTokens;
}

- (void)setSupportsDelegateTokens:(BOOL)a3
{
  self->_supportsDelegateTokens = a3;
}

- (NSMutableDictionary)bridgeDelegateTokenToTreeDumpLookup
{
  return self->_bridgeDelegateTokenToTreeDumpLookup;
}

- (void)setBridgeDelegateTokenToTreeDumpLookup:(id)a3
{
}

- (OS_dispatch_queue)axTreeDumpSharedBackgroundQueue
{
  return self->_axTreeDumpSharedBackgroundQueue;
}

- (void)setAxTreeDumpSharedBackgroundQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axTreeDumpSharedBackgroundQueue, 0);
  objc_storeStrong((id *)&self->_bridgeDelegateTokenToTreeDumpLookup, 0);
  objc_storeStrong((id *)&self->_fakeElementCache, 0);
  objc_destroyWeak((id *)&self->_systemAppDelegate);
  objc_destroyWeak((id *)&self->_runtimeDelegate);
  objc_destroyWeak((id *)&self->_bridgeTokenDelegate);
  objc_destroyWeak((id *)&self->_bridgeDelegate);

  objc_storeStrong((id *)&self->_textEditingTranslationObj, 0);
}

void __54__AXPTranslator_iOS__enableAccessibilityBridgeRuntime__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22E850000, log, OS_LOG_TYPE_ERROR, "App accessibility not enabled", v1, 2u);
}

void __64__AXPTranslator_iOS_createPlatformElementFromTranslationObject___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 136315394;
  id v4 = "-[AXPTranslator_iOS createPlatformElementFromTranslationObject:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_22E850000, a2, OS_LOG_TYPE_ERROR, "%s: failed to look up translation in backTranslationCache: %@", (uint8_t *)&v3, 0x16u);
}

- (id)processMultipleAttributeRequest:(id)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v3);
  return 0;
}

- (id)processActionRequest:(id)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v3);
  return 0;
}

- (id)processSetAttribute:(id)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v3);
  return 0;
}

- (id)processCanSetAttribute:(id)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v3);
  return 0;
}

- (id)processAttributeRequest:(id)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v3);
  return 0;
}

- (id)processHitTest:(id)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v3);
  return 0;
}

- (id)processFrontMostApp:(id)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v3);
  return 0;
}

- (id)processSupportedActions:(id)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v3);
  return 0;
}

- (id)processSupportsAttributes:(id)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v3);
  return 0;
}

- (id)processAXTreeElements:(id)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v3);
  return 0;
}

- (id)attributedStringConversionBlock
{
  uint64_t v2 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v2);
  return 0;
}

- (void)processPlatformNotification:(unint64_t)a3 data:(id)a4
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = OUTLINED_FUNCTION_2();

  MEMORY[0x270EF2BB8](v4, v5, v6);
}

- (void)processPlatformAXTreeDump:(id)a3
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = OUTLINED_FUNCTION_2();

  MEMORY[0x270EF2BB8](v3, v4, v5);
}

- (void)enableAccessibility
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = OUTLINED_FUNCTION_2();

  MEMORY[0x270EF2BB8](v2, v3, v4);
}

- (void)initializeAXRuntimeForSystemAppServer
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = OUTLINED_FUNCTION_2();

  MEMORY[0x270EF2BB8](v2, v3, v4);
}

- (id)platformElementFromTranslation:(id)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v3);
  return 0;
}

- (id)translationObjectFromData:(id)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v3);
  return 0;
}

- (id)remoteTranslationDataWithTranslation:(id)a3 pid:(int)a4
{
  uint64_t v4 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v4);
  return 0;
}

- (void)generateAXTreeDumpTypeOnBackgroundThread:(id)a3 completionHandler:(id)a4
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = OUTLINED_FUNCTION_2();

  MEMORY[0x270EF2BB8](v4, v5, v6);
}

- (void)handleNotification:(void *)a1 data:(void *)a2 associatedObject:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 fakeElementCache];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a1, "objectID"));
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  int v8 = 138412546;
  id v9 = a1;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_debug_impl(&dword_22E850000, a3, OS_LOG_TYPE_DEBUG, "Removing element: %@ -> %@", (uint8_t *)&v8, 0x16u);
}

- (void)handleNotification:(unint64_t)a1 data:(uint64_t)a2 associatedObject:(NSObject *)a3 .cold.2(unint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = _AXPNotificationToString(a1);
  int v6 = 138412547;
  uint64_t v7 = v5;
  __int16 v8 = 2117;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_22E850000, a3, OS_LOG_TYPE_DEBUG, "Handle notification: %@: %{sensitive}@", (uint8_t *)&v6, 0x16u);
}

- (void)handleUpdatedAXTree:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[AXPTranslator handleUpdatedAXTree:]";
  _os_log_error_impl(&dword_22E850000, log, OS_LOG_TYPE_ERROR, "%s: bridgeTokenDelegate is nil!", (uint8_t *)&v1, 0xCu);
}

- (void)handleUpdatedAXTree:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_22E850000, log, OS_LOG_TYPE_DEBUG, "Handling updated AX Tree", v1, 2u);
}

- (void)sendTranslatorRequest:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_22E850000, log, OS_LOG_TYPE_ERROR, "No bridge delegate set!", v1, 2u);
}

@end