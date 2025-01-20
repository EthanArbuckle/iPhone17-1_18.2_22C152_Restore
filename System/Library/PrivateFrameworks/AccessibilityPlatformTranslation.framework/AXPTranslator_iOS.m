@interface AXPTranslator_iOS
+ (id)sharedInstance;
+ (id)translationObjectFromUIKitObject:(id)a3;
- (AXPTranslator_iOS)init;
- (AXUIElement)frontmostAppOnContinuityDisplay;
- (AXUIElement)systemAppElement;
- (AXUIElement)systemWideElement;
- (BOOL)_processPerformAction:(int)a3 value:(id)a4;
- (BOOL)accessibilityEnabled;
- (BOOL)shouldHonorGroupsForElementTraversal;
- (BOOL)shouldStopGeneratingAXTree;
- (NSLock)axTreeDumpLock;
- (NSMutableArray)axTreeDumpCurrentOutput;
- (NSMutableArray)axTreeDumpCurrentlyProcessingChildren;
- (NSString)axTreeDumpCurrentType;
- (__AXObserver)axEventObserver;
- (__AXUIElement)createPlatformElementFromTranslationObject:(id)a3;
- (id)_allAXTreeActions;
- (id)_allAXTreeAttrValues;
- (id)_allAXTreeCanSetAttrValues;
- (id)_frontmostAppChildrenForXCTest;
- (id)_nilOutEmptyValue:(id)a3;
- (id)_postProcessAttributeRequest:(id)a3 iosAttribute:(int64_t)a4 axpAttribute:(unint64_t)a5 result:(id)a6 error:(unint64_t *)a7;
- (id)_postProcessResultDataForSecureCoding:(id)a3;
- (id)_preprocessRequest:(int64_t)a3 parameter:(id)a4;
- (id)_processAccessibilityAttributeValue:(int64_t)a3;
- (id)_processAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4;
- (id)_processAttributeSpecialCases:(unint64_t)a3 uiElement:(id)a4 error:(unint64_t *)a5 client:(unint64_t)a6;
- (id)_processAttributeSpecialCases:(unint64_t)a3 uiElement:(id)a4 parameter:(id)a5 error:(unint64_t *)a6 client:(unint64_t)a7;
- (id)_processAttributedStringForRangeAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5;
- (id)_processAuditIssuesAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5;
- (id)_processAuditIssuesResult:(id)a3;
- (id)_processBoundsForRangeAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5;
- (id)_processBrailleOverrideForAttributeRequest:(id)a3 error:(unint64_t *)a4 attribute:(unint64_t)a5;
- (id)_processCellWithIndexPathAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5;
- (id)_processChildrenAttributeRequest:(id)a3 error:(unint64_t *)a4;
- (id)_processClassNameAttributeRequest:(id)a3 error:(unint64_t *)a4;
- (id)_processCustomActionsAttributeRequest:(id)a3 error:(unint64_t *)a4;
- (id)_processCustomRotorData:(id)a3;
- (id)_processDirectAttributeRequest:(id)a3 iosAttribute:(int64_t)a4 axpAttribute:(unint64_t)a5 parameter:(id)a6 error:(unint64_t *)a7;
- (id)_processElementHelpAttributeResquest:(id)a3 error:(unint64_t *)a4;
- (id)_processFirstContainedElement:(id)a3 parameter:(id)a4 error:(unint64_t *)a5;
- (id)_processFirstElementForFocus:(id)a3 parameter:(id)a4 error:(unint64_t *)a5;
- (id)_processFocusedElementAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5;
- (id)_processFrontMostAppForContinuity:(id)a3;
- (id)_processIndexForTextMarkerAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5;
- (id)_processIsEnabledAttributeRequest:(id)a3 error:(unint64_t *)a4;
- (id)_processIsFocusedAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5;
- (id)_processIsRemoteElementAttributeRequest:(id)a3 error:(unint64_t *)a4;
- (id)_processIsSelectedAttributeRequest:(id)a3 error:(unint64_t *)a4;
- (id)_processLabelAttributeRequest:(id)a3 error:(unint64_t *)a4 axpAttribute:(unint64_t)a5;
- (id)_processLastContainedElement:(id)a3 parameter:(id)a4 error:(unint64_t *)a5;
- (id)_processLineRangeAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5;
- (id)_processLinkedUIElementsAttributeRequest:(id)a3 error:(unint64_t *)a4;
- (id)_processMoveFocusToOpaqueElementAttributeRequest:(id)a3 parameter:(id)a4 direction:(int64_t)a5 error:(unint64_t *)a6;
- (id)_processNextLineRangeAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5;
- (id)_processNumberOfCharactersAttributeRequest:(id)a3 error:(unint64_t *)a4;
- (id)_processOutgoingCustomRotorSearchResult:(id)a3;
- (id)_processParameterizedAttributeRequest:(id)a3 attribute:(int64_t)a4 parameter:(id)a5 error:(unint64_t *)a6;
- (id)_processPreviousLineRangeAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5;
- (id)_processRawElementDataRequest:(id)a3 error:(unint64_t *)a4;
- (id)_processRoleAttributeRequest:(id)a3 error:(unint64_t *)a4;
- (id)_processRoleDescriptionAttributeRequest:(id)a3 error:(unint64_t *)a4;
- (id)_processSelectedTextRequest:(id)a3 error:(unint64_t *)a4;
- (id)_processStartsMediaSessionAttributeRequest:(id)a3 error:(unint64_t *)a4;
- (id)_processStringForRangeAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5;
- (id)_processSubroleAttributeRequest:(id)a3 error:(unint64_t *)a4;
- (id)_processSyntheticStringValueAttributeRequest:(id)a3 error:(unint64_t *)a4;
- (id)_processTextInputMarkedRangeAttributeRequest:(id)a3 error:(unint64_t *)a4;
- (id)_processUserInputLabelsAttributeRequest:(id)a3 error:(unint64_t *)a4 axpAttribute:(unint64_t)a5;
- (id)_processValueAttributeRequest:(id)a3 error:(unint64_t *)a4 axpAttribute:(unint64_t)a5 useAttributes:(BOOL)a6;
- (id)_processViewControllerDescriptionAttributeRequest:(id)a3 error:(unint64_t *)a4;
- (id)_processVisibleOpaqueElements:(id)a3 error:(unint64_t *)a4;
- (id)_processVisibleTextRangeAttributeRequest:(id)a3 error:(unint64_t *)a4;
- (id)_processZoomAttributeRequest:(BOOL)a3 axElement:(id)a4 parameter:(id)a5 error:(unint64_t *)a6;
- (id)_processingSmuggledMarzipanRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5;
- (id)_topPriorityAXTreeAttrValues;
- (id)attributedStringConversionBlock;
- (id)axElementFromTranslatorRequest:(id)a3;
- (id)axTreeDumpCompletionHandler;
- (id)axTreeDumpSharedBackgroundQueue;
- (id)backTranslationCache;
- (id)platformElementFromTranslation:(id)a3;
- (id)processActionRequest:(id)a3;
- (id)processApplicationObject:(id)a3;
- (id)processAttributeRequest:(id)a3;
- (id)processCanSetAttribute:(id)a3;
- (id)processFrontMostApp:(id)a3;
- (id)processFrontMostApp:(id)a3 withiOSAttribute:(int64_t)a4;
- (id)processHitTest:(id)a3;
- (id)processMultipleAttributeRequest:(id)a3;
- (id)processMultipleAttributeRequest:(id)a3 removeEmptyValue:(BOOL)a4;
- (id)processSetAttribute:(id)a3;
- (id)processSupportedActions:(id)a3;
- (id)processSupportsAttributes:(id)a3;
- (id)remoteTranslationDataWithTranslation:(id)a3 pid:(int)a4;
- (id)translationCache;
- (id)translationObjectFromData:(id)a3;
- (id)translationObjectFromPlatformElement:(__AXUIElement *)a3;
- (int64_t)attributeFromRequest:(unint64_t)a3;
- (int64_t)axTreeDumpCurrentChildIndex;
- (unint64_t)_processRoleAttributeRequest:(id)a3 traits:(unint64_t)a4 error:(unint64_t *)a5;
- (void)_addCacheElement:(id)a3 translationObject:(id)a4;
- (void)_axTreeDumpCleanUpState;
- (void)_enableAccessibilityBridgeRuntime;
- (void)_registerAccessibilityNotifications;
- (void)_removeCacheEntriesForElement:(id)a3;
- (void)_safelyAddAXTreeDumpResponseToCurrentOutput:(id)a3;
- (void)_signalAppAXReady;
- (void)axTreeDumpGenerateNextSetOfElementAttrsOnMainThread;
- (void)fetchNextSetOfElementAttrsOnBackgroundThreadWithEarlyTermination:(BOOL)a3;
- (void)generateAXTreeDumpTypeOnBackgroundThread:(id)a3 completionHandler:(id)a4;
- (void)initializeAXRuntimeForSystemAppServer;
- (void)setAccessibilityEnabled:(BOOL)a3;
- (void)setAxEventObserver:(__AXObserver *)a3;
- (void)setAxTreeDumpCompletionHandler:(id)a3;
- (void)setAxTreeDumpCurrentChildIndex:(int64_t)a3;
- (void)setAxTreeDumpCurrentOutput:(id)a3;
- (void)setAxTreeDumpCurrentType:(id)a3;
- (void)setAxTreeDumpCurrentlyProcessingChildren:(id)a3;
- (void)setAxTreeDumpLock:(id)a3;
- (void)setAxTreeDumpSharedBackgroundQueue:(id)a3;
- (void)setFrontmostAppOnContinuityDisplay:(id)a3;
- (void)setRequestResolvingBehavior:(unint64_t)a3;
- (void)setShouldHonorGroupsForElementTraversal:(BOOL)a3;
- (void)setShouldStopGeneratingAXTree:(BOOL)a3;
- (void)setSystemAppElement:(id)a3;
- (void)setSystemWideElement:(id)a3;
- (void)stopGeneratingAXTreeDump;
@end

@implementation AXPTranslator_iOS

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__AXPTranslator_iOS_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_Translator;

  return v2;
}

- (AXPTranslator_iOS)init
{
  v14.receiver = self;
  v14.super_class = (Class)AXPTranslator_iOS;
  v2 = [(AXPTranslator *)&v14 init];
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.axptranslator.cache.queue", 0);
  cacheQueue = v2->_cacheQueue;
  v2->_cacheQueue = (OS_dispatch_queue *)v3;

  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  translationCache = v2->_translationCache;
  v2->_translationCache = (NSMutableDictionary *)v5;

  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  backTranslationCache = v2->_backTranslationCache;
  v2->_backTranslationCache = (NSMutableDictionary *)v7;

  uint64_t v9 = [MEMORY[0x263EFF980] array];
  cachedElements = v2->_cachedElements;
  v2->_cachedElements = (NSMutableArray *)v9;

  v2->_shouldHonorGroupsForElementTraversal = 1;
  uint64_t v11 = objc_opt_new();
  axTreeDumpLock = v2->_axTreeDumpLock;
  v2->_axTreeDumpLock = (NSLock *)v11;

  if (AXPIsCatalyst()) {
    [MEMORY[0x263F21690] applyElementAttributeCacheScheme:7];
  }
  return v2;
}

- (void)_addCacheElement:(id)a3 translationObject:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_cacheQueue);
  if ((unint64_t)[(NSMutableArray *)self->_cachedElements count] > 0x1000)
  {
    v8 = -[NSMutableArray subarrayWithRange:](self->_cachedElements, "subarrayWithRange:", 0, 1024);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (([v13 isEqual:v6] & 1) == 0) {
            [(AXPTranslator_iOS *)self _removeCacheEntriesForElement:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  [(NSMutableArray *)self->_cachedElements addObject:v6];
  objc_super v14 = [(AXPTranslator_iOS *)self translationCache];
  [v14 setObject:v7 forKey:v6];

  v15 = [(AXPTranslator_iOS *)self backTranslationCache];
  [v15 setObject:v6 forKey:v7];
}

- (void)_removeCacheEntriesForElement:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_cacheQueue);
  [(NSMutableArray *)self->_cachedElements removeObject:v4];
  uint64_t v5 = [(AXPTranslator_iOS *)self translationCache];
  [v5 removeObjectForKey:v4];

  id v6 = [(AXPTranslator_iOS *)self backTranslationCache];
  id v7 = [v6 allKeys];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
        objc_super v14 = [(AXPTranslator_iOS *)self backTranslationCache];
        v15 = [v14 objectForKey:v13];
        int v16 = [v15 isEqual:v4];

        if (v16)
        {
          long long v17 = [(AXPTranslator_iOS *)self backTranslationCache];
          [v17 removeObjectForKey:v13];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (id)translationCache
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_cacheQueue);
  translationCache = self->_translationCache;

  return translationCache;
}

- (id)backTranslationCache
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_cacheQueue);
  backTranslationCache = self->_backTranslationCache;

  return backTranslationCache;
}

- (id)attributedStringConversionBlock
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__AXPTranslator_iOS_attributedStringConversionBlock__block_invoke;
  v4[3] = &unk_2649DEE00;
  v4[4] = self;
  v2 = (void *)MEMORY[0x230FA6D40](v4, a2);

  return v2;
}

- (void)_registerAccessibilityNotifications
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22E850000, a2, OS_LOG_TYPE_ERROR, "Failed to create an accessibility event observer: %ld", (uint8_t *)&v2, 0xCu);
}

- (id)_processAccessibilityAttributeValue:(int64_t)a3
{
  if (a3 == 1001)
  {
    id v7 = [NSNumber numberWithInt:getpid()];
  }
  else if (a3 == 1102 {
         && ([(AXPTranslator *)self systemAppDelegate],
  }
             uint64_t v4 = objc_claimAutoreleasedReturnValue(),
             char v5 = objc_opt_respondsToSelector(),
             v4,
             (v5 & 1) != 0))
  {
    id v6 = [(AXPTranslator *)self systemAppDelegate];
    id v7 = [v6 frontmostProcessPids];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)_processPerformAction:(int)a3 value:(id)a4
{
  return 0;
}

- (id)_processAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4
{
  return 0;
}

- (void)initializeAXRuntimeForSystemAppServer
{
  uint64_t v3 = [MEMORY[0x263F21688] sharedManager];
  uint64_t v4 = [(AXPTranslator *)self systemAppDelegate];
  uint64_t v5 = [v4 isSystemWideElement];

  [v3 setSystemWideServer:v5];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__AXPTranslator_iOS_initializeAXRuntimeForSystemAppServer__block_invoke;
  v12[3] = &unk_2649DEE28;
  v12[4] = self;
  [v3 setAttributeCallback:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__AXPTranslator_iOS_initializeAXRuntimeForSystemAppServer__block_invoke_2;
  v11[3] = &unk_2649DEE50;
  v11[4] = self;
  [v3 setParameterizedAttributeCallback:v11];
  [v3 setSetAttributeCallback:&__block_literal_global];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__AXPTranslator_iOS_initializeAXRuntimeForSystemAppServer__block_invoke_4;
  v10[3] = &unk_2649DEE98;
  v10[4] = self;
  [v3 setPerformActionCallback:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__AXPTranslator_iOS_initializeAXRuntimeForSystemAppServer__block_invoke_5;
  v9[3] = &unk_2649DEEC0;
  v9[4] = self;
  [v3 setApplicationElementCallback:v9];
  [v3 setOutgoingValuePreprocessor:&__block_literal_global_328];
  [v3 setClientObserverCallback:&__block_literal_global_331];
  if (_AXUIElementServerRegistered())
  {
    _AXUIElementUnregisterServer();
    id v6 = AXPlatformTranslationLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_22E850000, v6, OS_LOG_TYPE_INFO, "Someone beat us here to registered, undo yourself!", v8, 2u);
    }
  }
  if (v5)
  {
    id v7 = AXPlatformTranslationLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_22E850000, v7, OS_LOG_TYPE_INFO, "Registering as system wide server!", v8, 2u);
    }

    _AXUIElementRegisterSystemWideServerBroadcastRelayerCallback();
  }
  [v3 start];
}

- (void)setAccessibilityEnabled:(BOOL)a3
{
  if (!self->_accessibilityEnabled && a3) {
    [(AXPTranslator_iOS *)self enableAccessibility];
  }
}

- (void)_signalAppAXReady
{
  self->_axAppReadyFlag = 1;
  threadSemaphore = self->_threadSemaphore;
  if (threadSemaphore) {
    dispatch_semaphore_signal(threadSemaphore);
  }
}

- (void)_enableAccessibilityBridgeRuntime
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__AXPTranslator_iOS__enableAccessibilityBridgeRuntime__block_invoke;
  block[3] = &unk_2649DEF48;
  block[4] = self;
  if (_enableAccessibilityBridgeRuntime_onceToken != -1) {
    dispatch_once(&_enableAccessibilityBridgeRuntime_onceToken, block);
  }
}

- (int64_t)attributeFromRequest:(unint64_t)a3
{
  if (a3 > 0x7C) {
    return 0;
  }
  else {
    return qword_22E867278[a3];
  }
}

- (id)processMultipleAttributeRequest:(id)a3
{
  return [(AXPTranslator_iOS *)self processMultipleAttributeRequest:a3 removeEmptyValue:0];
}

- (id)processMultipleAttributeRequest:(id)a3 removeEmptyValue:(BOOL)a4
{
  BOOL v46 = a4;
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v44 = a3;
  [v44 clientType];
  AXOverrideRequestingClientType();
  uint64_t v5 = [v44 translation];
  id v6 = +[AXPTranslator_iOS sharedInstance];
  v40 = (void *)v5;
  uint64_t v7 = [v6 createPlatformElementFromTranslationObject:v5];

  id v8 = (void *)MEMORY[0x263F21690];
  uint64_t v9 = objc_opt_new();
  element = (const __AXUIElement *)v7;
  v47 = [v8 uiElementWithAXElement:v7 cache:v9];

  uint64_t v58 = 0;
  v48 = objc_opt_new();
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v12 = [v44 parameters];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"attributes"];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v54 objects:v60 count:16];
  v45 = v10;
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v55 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        uint64_t v19 = [v18 integerValue];
        int64_t v20 = [(AXPTranslator_iOS *)self attributeFromRequest:v19];
        if (v20)
        {
          long long v21 = [NSNumber numberWithLong:v20];
          [v10 addObject:v21];

          [v11 addObject:v18];
        }
        else
        {
          v22 = -[AXPTranslator_iOS _processAttributeSpecialCases:uiElement:error:client:](self, "_processAttributeSpecialCases:uiElement:error:client:", v19, v47, &v58, [v44 clientType]);
          if (v46)
          {
            uint64_t v23 = [(AXPTranslator_iOS *)self _nilOutEmptyValue:v22];

            v22 = (void *)v23;
            uint64_t v10 = v45;
          }
          [v48 setObject:v22 forKeyedSubscript:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v15);
  }

  v24 = objc_opt_new();
  [v24 setError:v58];
  v25 = element;
  if ([v10 count])
  {
    CFArrayRef values = 0;
    AXError v26 = AXUIElementCopyMultipleAttributeValues(element, (CFArrayRef)v10, 0, &values);
    if (v26)
    {
      [v24 setError:_convertAXError(v26)];
    }
    else
    {
      v39 = v24;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      obuint64_t j = values;
      uint64_t v27 = [(__CFArray *)obj countByEnumeratingWithState:&v49 objects:v59 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = 0;
        uint64_t v43 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v50 != v43) {
              objc_enumerationMutation(obj);
            }
            v31 = _AXPConvertOutgoingValueWithDesiredType(*(void **)(*((void *)&v49 + 1) + 8 * j), 0);
            v32 = [v10 objectAtIndexedSubscript:v29 + j];
            uint64_t v33 = (int)[v32 intValue];
            v34 = [v11 objectAtIndexedSubscript:v29 + j];
            v35 = -[AXPTranslator_iOS _postProcessAttributeRequest:iosAttribute:axpAttribute:result:error:](self, "_postProcessAttributeRequest:iosAttribute:axpAttribute:result:error:", v47, v33, (int)[v34 intValue], v31, &v58);

            if (v46)
            {
              uint64_t v36 = [(AXPTranslator_iOS *)self _nilOutEmptyValue:v35];

              v35 = (void *)v36;
            }
            v37 = objc_msgSend(v11, "objectAtIndexedSubscript:", v29 + j, v39);
            [v48 setObject:v35 forKeyedSubscript:v37];

            uint64_t v10 = v45;
          }
          v29 += j;
          uint64_t v28 = [(__CFArray *)obj countByEnumeratingWithState:&v49 objects:v59 count:16];
        }
        while (v28);
      }

      v24 = v39;
      v25 = element;
    }
    if (values) {
      CFRelease(values);
    }
  }
  objc_msgSend(v24, "setResultData:", v48, v39);
  if (v25) {
    CFRelease(v25);
  }
  AXOverrideRequestingClientType();

  return v24;
}

- (id)_nilOutEmptyValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v4 = [v3 count];
LABEL_4:
    char v5 = v4 != 0;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = [v3 isEqualToNumber:&unk_26E241B20];
LABEL_11:
    char v5 = isKindOfClass ^ 1;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 length];
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    goto LABEL_11;
  }
  id v10 = v3;
  if ([v10 length])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v11 = [v10 string];
    char v5 = [v11 length] != 0;
  }
LABEL_5:
  if (v5) {
    id v6 = v3;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)axElementFromTranslatorRequest:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[AXPTranslator_iOS sharedInstance];
  char v5 = [v3 translation];

  id v6 = (const void *)[v4 createPlatformElementFromTranslationObject:v5];
  id v7 = [MEMORY[0x263F21668] elementWithAXUIElement:v6];
  if (v6) {
    CFRelease(v6);
  }

  return v7;
}

- (id)processActionRequest:(id)a3
{
  id v4 = a3;
  [v4 clientType];
  if ([(AXPTranslator *)self requestResolvingBehavior] != 1) {
    [(AXPTranslator *)self requestResolvingBehavior];
  }
  AXOverrideRequestingClientType();
  uint64_t v5 = _convertAXPActionToiOS([v4 actionType]);
  id v6 = [(AXPTranslator_iOS *)self axElementFromTranslatorRequest:v4];
  id v7 = v6;
  switch(v5)
  {
    case 0x7D3:
      uint64_t v8 = [v6 scrollToVisible];
      goto LABEL_8;
    case 0x7E5:
      id v10 = [v4 parameters];
      uint64_t v11 = [v10 objectForKeyedSubscript:@"AXPCustomActionIdentifier"];
      uint64_t v9 = [v7 performAction:2021 withValue:v11];

      break;
    case 0x7DA:
      uint64_t v8 = [v6 press];
LABEL_8:
      uint64_t v9 = v8;
      goto LABEL_12;
    default:
      id v10 = [v4 parameters];
      uint64_t v9 = [v7 performAction:v5 withValue:v10];
      break;
  }

LABEL_12:
  uint64_t v12 = objc_opt_new();
  uint64_t v13 = [NSNumber numberWithBool:v9];
  [v12 setResultData:v13];

  AXOverrideRequestingClientType();

  return v12;
}

- (id)_processParameterizedAttributeRequest:(id)a3 attribute:(int64_t)a4 parameter:(id)a5 error:(unint64_t *)a6
{
  id v6 = [a3 objectWithAXAttribute:a4 parameter:a5];
  id v7 = _AXPConvertOutgoingValueWithDesiredType(v6, 0);

  return v7;
}

- (id)_postProcessAttributeRequest:(id)a3 iosAttribute:(int64_t)a4 axpAttribute:(unint64_t)a5 result:(id)a6 error:(unint64_t *)a7
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v14 = v13;
  if (a4 == 2003 || a5 == 106 || a5 == 5)
  {
    uint64_t v15 = (void *)MEMORY[0x263F08D40];
    id v14 = v13;
    long long v16 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
    long long v49 = *MEMORY[0x263F001A0];
    long long v50 = v16;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v14;
      if (!strcmp((const char *)[v17 objCType], "{CGRect={CGPoint=dd}{CGSize=dd}}")) {
        [v17 getValue:&v49];
      }
    }

    uint64_t v18 = objc_msgSend(v15, "valueWithRect:", v49, v50);
    goto LABEL_8;
  }
  if (a4 <= 95226)
  {
    if (a4 == 2180)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ![v14 integerValue])
      {
        uint64_t v23 = [v12 objectWithAXAttribute:2001];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v24 = [v23 attributeValueForKey:*MEMORY[0x263F21658]];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v25 = v24;

            id v14 = v25;
          }
        }
      }
      goto LABEL_59;
    }
    if (a4 == 5057)
    {
      int v22 = [v13 intValue];
      switch(v22)
      {
        case 2:

          uint64_t v19 = &unk_26E241B50;
          goto LABEL_9;
        case 1:

          uint64_t v19 = &unk_26E241B68;
          goto LABEL_9;
        case 0:

          uint64_t v19 = &unk_26E241B38;
          goto LABEL_9;
      }
LABEL_59:
      uint64_t v19 = v14;
      goto LABEL_9;
    }
LABEL_41:
    if (a5 == 83)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v41 = [(AXPTranslator_iOS *)self _processAuditIssuesResult:v14];

        id v14 = (id)v41;
      }
      goto LABEL_19;
    }
    if (a5 == 13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_19;
      }
      v42 = a7;
      id v43 = v12;
      id v44 = objc_opt_new();
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v26 = v14;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v46;
        v30 = @"CustomActionIdentifier";
        v31 = @"CustomActionName";
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v46 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v33 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v34 = [v33 objectForKeyedSubscript:v30];
              uint64_t v35 = [v33 objectForKeyedSubscript:v31];
              uint64_t v36 = (void *)v35;
              if (v34) {
                BOOL v37 = v35 == 0;
              }
              else {
                BOOL v37 = 1;
              }
              if (!v37)
              {
                v51[0] = @"AXPCustomActionIdentifier";
                v51[1] = @"AXPCustomActionName";
                v52[0] = v34;
                v52[1] = v35;
                [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
                v38 = v31;
                v40 = v39 = v30;
                [v44 addObject:v40];

                v30 = v39;
                v31 = v38;
              }
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v45 objects:v53 count:16];
        }
        while (v28);
      }

      a7 = v42;
      id v12 = v43;
      a5 = 13;
      uint64_t v19 = v44;
      goto LABEL_9;
    }
    goto LABEL_59;
  }
  if (a4 == 95227)
  {
    uint64_t v18 = [(AXPTranslator_iOS *)self _processOutgoingCustomRotorSearchResult:v13];
  }
  else
  {
    if (a4 != 95228) {
      goto LABEL_41;
    }
    uint64_t v18 = [(AXPTranslator_iOS *)self _processCustomRotorData:v13];
  }
LABEL_8:
  uint64_t v19 = (void *)v18;

LABEL_9:
  if (a5 == 47)
  {
LABEL_12:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v19 rangeValue] != 0x7FFFFFFF) {
      goto LABEL_14;
    }
    goto LABEL_18;
  }
  if (a5 != 119)
  {
    if (a5 != 92)
    {
LABEL_14:
      id v14 = v19;
      goto LABEL_19;
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_18:

    id v14 = 0;
    goto LABEL_19;
  }
  int v20 = [v19 intValue];
  if (v20)
  {
    [NSNumber numberWithInt:v20 == 1];
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    id v14 = 0;
    *a7 = 3;
  }
LABEL_19:

  return v14;
}

- (id)_processOutgoingCustomRotorSearchResult:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  uint64_t v5 = [v3 dictionary];
  id v6 = [v4 objectForKeyedSubscript:@"targetElement"];
  [v5 setObject:v6 forKeyedSubscript:@"AXPCustomRotorTargetElement"];

  id v7 = [v4 objectForKeyedSubscript:@"targetRange"];

  [v5 setObject:v7 forKeyedSubscript:@"AXPCustomRotorTargetRange"];

  return v5;
}

- (id)_processAuditIssuesResult:(id)a3
{
  return (id)objc_msgSend(a3, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_366);
}

- (id)_processCustomRotorData:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[v3 mutableCopy];
  uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F21608]];
  int v6 = [v5 BOOLValue];

  if (!v6)
  {
    id v10 = 0;
    goto LABEL_43;
  }
  id v7 = [v3 objectForKeyedSubscript:@"name"];
  if ([v7 isEqualToString:@"AXCustomSystemRotorTypeLink"])
  {
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241B80;
  }
  else if ([v7 isEqualToString:@"AXCustomSystemRotorTypeArticle"])
  {
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241B50;
  }
  else if ([v7 isEqualToString:@"AXCustomSystemRotorTypeVisitedLink"])
  {
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241B98;
  }
  else if ([v7 isEqualToString:@"AXCustomSystemRotorTypeHeading"])
  {
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241BB0;
  }
  else if ([v7 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel1"])
  {
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241BC8;
  }
  else if ([v7 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel2"])
  {
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241BE0;
  }
  else if ([v7 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel3"])
  {
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241BF8;
  }
  else if ([v7 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel4"])
  {
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241C10;
  }
  else if ([v7 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel5"])
  {
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241AF0;
  }
  else if ([v7 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel6"])
  {
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241AC0;
  }
  else if ([v7 isEqualToString:@"AXCustomSystemRotorTypeBoldText"])
  {
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241C28;
  }
  else if ([v7 isEqualToString:@"AXCustomSystemRotorTypeItalicText"])
  {
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241B08;
  }
  else if ([v7 isEqualToString:@"AXCustomSystemRotorTypeUnderlineText"])
  {
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241C40;
  }
  else if ([v7 isEqualToString:@"AXCustomSystemRotorTypeMisspelledWord"])
  {
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241C58;
  }
  else if ([v7 isEqualToString:@"AXCustomSystemRotorTypeImage"])
  {
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241AD8;
  }
  else if ([v7 isEqualToString:@"AXCustomSystemRotorTypeTextField"])
  {
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241C70;
  }
  else if ([v7 isEqualToString:@"AXCustomSystemRotorTypeTable"])
  {
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241C88;
  }
  else if ([v7 isEqualToString:@"AXCustomSystemRotorTypeList"])
  {
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241CA0;
  }
  else
  {
    if (![v7 isEqualToString:@"AXCustomSystemRotorTypeLandmark"])
    {
      uint64_t v8 = @"AXPCustomRotorName";
      uint64_t v11 = v4;
      uint64_t v9 = v7;
      goto LABEL_42;
    }
    uint64_t v8 = @"AXPCustomRotorSystemType";
    uint64_t v9 = &unk_26E241CB8;
  }
  uint64_t v11 = v4;
LABEL_42:
  [v11 setObject:v9 forKeyedSubscript:v8];
  id v10 = v4;

LABEL_43:

  return v10;
}

- (id)_processDirectAttributeRequest:(id)a3 iosAttribute:(int64_t)a4 axpAttribute:(unint64_t)a5 parameter:(id)a6 error:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = v12;
  if (a6) {
    [v12 objectWithAXAttribute:a4 parameter:a6];
  }
  else {
  id v14 = [v12 objectWithAXAttribute:a4];
  }
  uint64_t v15 = _AXPConvertOutgoingValueWithDesiredType(v14, 0);

  long long v16 = [(AXPTranslator_iOS *)self _postProcessAttributeRequest:v13 iosAttribute:a4 axpAttribute:a5 result:v15 error:a7];

  return v16;
}

- (id)_processStartsMediaSessionAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v4 = objc_msgSend(a3, "numberWithAXAttribute:", 2004, a4);
  uint64_t v5 = [v4 unsignedLongLongValue];

  int v6 = NSNumber;
  BOOL v7 = (*MEMORY[0x263F21B28] & ~v5) == 0;

  return (id)[v6 numberWithInt:v7];
}

- (id)_processViewControllerDescriptionAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v4 = a3;
  uint64_t v5 = [v4 stringWithAXAttribute:5041];
  int v6 = [v4 stringWithAXAttribute:5042];

  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    [NSString stringWithFormat:@"%@ [%@]", v5, v6];
    BOOL v7 = LABEL_6:;
    goto LABEL_8;
  }
  if ([v6 length])
  {
    [NSString stringWithFormat:@"[%@]", v6, v9];
    goto LABEL_6;
  }
  BOOL v7 = 0;
LABEL_8:

  return v7;
}

- (id)_processIsSelectedAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v4 = objc_msgSend(a3, "numberWithAXAttribute:", 2004, a4);
  uint64_t v5 = [v4 unsignedLongLongValue];

  int v6 = NSNumber;
  BOOL v7 = (*MEMORY[0x263F21AE8] & ~v5) == 0;

  return (id)[v6 numberWithInt:v7];
}

- (id)_processIsRemoteElementAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v4 = NSNumber;
  [a3 axElement];
  _AXUIElementIDForElement();

  return (id)[v4 numberWithInt:v5 == 9999];
}

- (id)_processIsEnabledAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v4 = objc_msgSend(a3, "numberWithAXAttribute:", 2004, a4);
  uint64_t v5 = [v4 unsignedLongLongValue];

  int v6 = NSNumber;
  BOOL v7 = (*MEMORY[0x263F21A68] & ~v5) != 0;

  return (id)[v6 numberWithInt:v7];
}

- (id)_processUserInputLabelsAttributeRequest:(id)a3 error:(unint64_t *)a4 axpAttribute:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = [v8 objectWithAXAttribute:2186];
  if (a5 == 87)
  {
    uint64_t v10 = 0;
  }
  else
  {
    if (a5 != 88) {
      goto LABEL_6;
    }
    uint64_t v10 = objc_opt_class();
  }
  uint64_t v11 = _AXPConvertOutgoingValueWithDesiredType(v9, v10);

  uint64_t v9 = (void *)v11;
LABEL_6:
  id v12 = [(AXPTranslator_iOS *)self _postProcessAttributeRequest:v8 iosAttribute:2186 axpAttribute:a5 result:v9 error:a4];

  return v12;
}

- (id)_processBrailleOverrideForAttributeRequest:(id)a3 error:(unint64_t *)a4 attribute:(unint64_t)a5
{
  id v6 = a3;
  BOOL v7 = v6;
  if (a5 == 33)
  {
    uint64_t v8 = 2001;
  }
  else
  {
    if (a5 != 46)
    {
      uint64_t v9 = 0;
      goto LABEL_7;
    }
    uint64_t v8 = 2077;
  }
  uint64_t v9 = [v6 objectWithAXAttribute:v8];
LABEL_7:
  if (AXPNilOrEmptyString(v9) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [v9 attributeValueForKey:*MEMORY[0x263F21700]];
  }

  return v10;
}

- (id)_processChildrenAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(AXPTranslator *)self requestResolvingBehavior] == 1
    || [(AXPTranslator *)self requestResolvingBehavior] == 2)
  {
    BOOL v7 = [v6 objectWithAXAttribute:3073];
    uint64_t v8 = _AXPConvertOutgoingValueWithDesiredType(v7, 0);
  }
  else
  {
    uint64_t v12 = *MEMORY[0x263F21610];
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[AXPTranslator_iOS shouldHonorGroupsForElementTraversal](self, "shouldHonorGroupsForElementTraversal"));
    v13[0] = v9;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];

    uint64_t v8 = [(AXPTranslator_iOS *)self _processParameterizedAttributeRequest:v6 attribute:95236 parameter:v10 error:a4];
  }

  return v8;
}

- (id)_processClassNameAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v6 = a3;
  if (AXPIsCatalyst())
  {
    BOOL v7 = [(AXPTranslator_iOS *)self _processDirectAttributeRequest:v6 iosAttribute:5045 axpAttribute:7 parameter:0 error:a4];
  }
  else
  {
    BOOL v7 = 0;
    *a4 = 3;
  }

  return v7;
}

- (id)_processCellWithIndexPathAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v8 = a3;
  uint64_t v9 = _AXPiOSParameterFromPlatformParameter(a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = objc_msgSend(v9, "ax_mappedArrayUsingBlock:", &__block_literal_global_462);

    uint64_t v9 = (void *)v10;
  }
  uint64_t v11 = [(AXPTranslator_iOS *)self _processParameterizedAttributeRequest:v8 attribute:92600 parameter:v9 error:a5];

  return v11;
}

- (id)_processElementHelpAttributeResquest:(id)a3 error:(unint64_t *)a4
{
  id v6 = a3;
  BOOL v7 = [(AXPTranslator_iOS *)self _processDirectAttributeRequest:v6 iosAttribute:2188 axpAttribute:23 parameter:0 error:a4];
  if (AXPNilOrEmptyString(v7)
    && (!AXPIsCatalyst()
     || AXPLinkedOnOrAfterGozul() && !AXPIsGoodOldAppleCatalystApp()))
  {
    uint64_t v8 = [(AXPTranslator_iOS *)self _processDirectAttributeRequest:v6 iosAttribute:2002 axpAttribute:23 parameter:0 error:a4];

    BOOL v7 = (void *)v8;
  }

  return v7;
}

- (id)_processLinkedUIElementsAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [(AXPTranslator_iOS *)self _processDirectAttributeRequest:v6 iosAttribute:2167 axpAttribute:76 parameter:0 error:a4];
  uint64_t v8 = [(AXPTranslator_iOS *)self _processDirectAttributeRequest:v6 iosAttribute:2033 axpAttribute:76 parameter:0 error:a4];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v7 count])
  {
    id v17 = v8;
LABEL_21:
    uint64_t v10 = v17;
    goto LABEL_22;
  }
  if (!v8)
  {
    id v17 = v7;
    goto LABEL_21;
  }
  id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 addObjectsFromArray:v7];
    [v10 addObjectsFromArray:v7];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          if ((objc_msgSend(v9, "containsObject:", v16, (void)v19) & 1) == 0) {
            [v10 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }
LABEL_22:

  return v10;
}

- (id)_processIndexForTextMarkerAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v6 = a3;
  BOOL v7 = _AXPiOSParameterFromPlatformParameter(a4);
  uint64_t v8 = [v6 objectWithAXAttribute:94012 parameter:v7];

  if (!v8
    || (_AXPConvertAXValueRefToNSValue(v8), (id v9 = objc_claimAutoreleasedReturnValue()) == 0)
    || (uint64_t v10 = v9,
        uint64_t v11 = [v9 rangeValue],
        [NSNumber numberWithUnsignedInteger:v11],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v12))
  {
    uint64_t v12 = [NSNumber numberWithInteger:0x7FFFFFFFFFFFFFFFLL];
  }
  uint64_t v13 = _AXPConvertOutgoingValueWithDesiredType(v12, 0);

  return v13;
}

- (id)_processTextInputMarkedRangeAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  uint64_t v5 = [v4 stringWithAXAttribute:2006];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __72__AXPTranslator_iOS__processTextInputMarkedRangeAttributeRequest_error___block_invoke;
    v8[3] = &unk_2649DEF90;
    v8[4] = &v9;
    [v5 enumerateAttributesUsingBlock:v8];
  }
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)_processZoomAttributeRequest:(BOOL)a3 axElement:(id)a4 parameter:(id)a5 error:(unint64_t *)a6
{
  BOOL v7 = a3;
  id v8 = a4;
  uint64_t v9 = _AXPiOSParameterFromPlatformParameter(a5);
  uint64_t v10 = NSNumber;
  if (v7) {
    uint64_t v11 = 2001;
  }
  else {
    uint64_t v11 = 2002;
  }
  uint64_t v12 = [v8 performAXAction:v11 withValue:v9];

  uint64_t v13 = [v10 numberWithBool:v12];
  id v14 = _AXPConvertOutgoingValueWithDesiredType(v13, 0);

  return v14;
}

- (id)_processLineRangeAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v6 = a3;
  BOOL v7 = _AXPiOSParameterFromPlatformParameter(a4);
  id v8 = [v6 objectWithAXAttribute:94009 parameter:v7];

  uint64_t v9 = _AXPConvertOutgoingValueWithDesiredType(v8, 0);

  return v9;
}

- (id)_processNextLineRangeAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  v19[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = [(AXPTranslator_iOS *)self _processLineRangeAttributeRequest:v8 parameter:a4 error:a5];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 rangeValue];
    uint64_t v18 = @"parameter";
    uint64_t v13 = [NSNumber numberWithUnsignedInteger:v12 + v11 + 1];
    v19[0] = v13;
    id v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v15 = [(AXPTranslator_iOS *)self _processLineRangeAttributeRequest:v8 parameter:v14 error:a5];

    if (v15 && [v15 rangeValue] == 0x7FFFFFFF)
    {
      id v16 = v10;

      uint64_t v15 = v16;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)_processPreviousLineRangeAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = [(AXPTranslator_iOS *)self _processLineRangeAttributeRequest:v8 parameter:a4 error:a5];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 rangeValue];
    id v17 = @"parameter";
    if (v11)
    {
      uint64_t v12 = [NSNumber numberWithUnsignedInteger:v11 - 1];
    }
    else
    {
      uint64_t v12 = &unk_26E241B20;
    }
    v18[0] = v12;
    id v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v13 = [(AXPTranslator_iOS *)self _processLineRangeAttributeRequest:v8 parameter:v14 error:a5];

    if (v11) {
    if (v13 && [v13 rangeValue] == 0x7FFFFFFF)
    }
    {
      id v15 = v10;

      uint64_t v13 = v15;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)_processMoveFocusToOpaqueElementAttributeRequest:(id)a3 parameter:(id)a4 direction:(int64_t)a5 error:(unint64_t *)a6
{
  v19[6] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v11 objectForKeyedSubscript:@"parameter"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F21600]];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = [NSNumber numberWithLong:a5];
        v19[0] = v14;
        v19[1] = &unk_26E241CD0;
        id v15 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", 0x7FFFFFFFLL, 0);
        void v19[2] = v15;
        v19[3] = v13;
        v19[4] = MEMORY[0x263EFFA88];
        v19[5] = MEMORY[0x263EFFA88];
        id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:6];

        id v17 = [(AXPTranslator_iOS *)self _processParameterizedAttributeRequest:v10 attribute:95225 parameter:v16 error:a6];
      }
      else
      {
        id v17 = 0;
        *a6 = 7;
      }
    }
    else
    {
      id v17 = 0;
      *a6 = 7;
    }
  }
  else
  {
    id v17 = 0;
    *a6 = 7;
  }

  return v17;
}

- (id)_processRawElementDataRequest:(id)a3 error:(unint64_t *)a4
{
  v9[2] = *MEMORY[0x263EF8340];
  if ([a3 axElement] && (uint64_t Data = _AXUIElementCreateData()) != 0)
  {
    uint64_t v5 = (const void *)Data;
    v8[0] = @"TokenType";
    v8[1] = @"ElementData";
    v9[0] = @"AXElementTokenSimulator";
    v9[1] = Data;
    id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
    CFRelease(v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_processSelectedTextRequest:(id)a3 error:(unint64_t *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 rangeWithAXAttribute:2005];
  if (v7 != 0x7FFFFFFF && v7 | v8)
  {
    uint64_t v13 = @"parameter";
    id v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v7, v8);
    v14[0] = v10;
    id v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

    uint64_t v9 = [(AXPTranslator_iOS *)self _processStringForRangeAttributeRequest:v6 parameter:v11 error:a4];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      uint64_t v9 = &stru_26E23E2B0;
    }
  }
  else
  {
    uint64_t v9 = &stru_26E23E2B0;
  }

  return v9;
}

- (id)_processingSmuggledMarzipanRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v9 objectForKeyedSubscript:@"parameter"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = [v10 objectForKeyedSubscript:@"attribute"];
      uint64_t v12 = (int)[v11 intValue];

      uint64_t v13 = [v10 objectForKeyedSubscript:@"parameter"];
      id v14 = [(AXPTranslator_iOS *)self _processDirectAttributeRequest:v8 iosAttribute:v12 axpAttribute:0 parameter:v13 error:a5];
    }
    else
    {
      id v14 = 0;
      *a5 = 7;
    }
  }
  else
  {
    id v14 = 0;
    *a5 = 7;
  }

  return v14;
}

- (id)_processValueAttributeRequest:(id)a3 error:(unint64_t *)a4 axpAttribute:(unint64_t)a5 useAttributes:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = [v10 objectWithAXAttribute:2006];
  if (v6) {
    uint64_t v12 = objc_opt_class();
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = _AXPConvertOutgoingValueWithDesiredType(v11, v12);

  if (a5 == 118 || a5 == 53)
  {
    id v14 = [v10 numberWithAXAttribute:2004];
    uint64_t v15 = [v14 unsignedLongLongValue];

    unint64_t v16 = [(AXPTranslator_iOS *)self _processRoleAttributeRequest:v10 traits:v15 error:a4];
    if (v16 == 9)
    {
      [(AXPTranslator_iOS *)self _processIsSelectedAttributeRequest:v10 error:a4];
      v13 = id v17 = v13;
LABEL_12:

      goto LABEL_13;
    }
    if (v16 == 18 || v16 == 13)
    {
      id v17 = [(AXPTranslator_iOS *)self _processDirectAttributeRequest:v10 iosAttribute:5059 axpAttribute:54 parameter:0 error:a4];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v17;

        uint64_t v13 = v17;
      }
      goto LABEL_12;
    }
  }
LABEL_13:
  if (a5 == 118)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v13 = 0;
    }
  }

  return v13;
}

- (id)_processSyntheticStringValueAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v6 = a3;
  uint64_t v7 = [(AXPTranslator_iOS *)self _processValueAttributeRequest:v6 error:a4 axpAttribute:53 useAttributes:0];
  if (AXPNilOrEmptyString(v7))
  {
    id v8 = [(AXPTranslator_iOS *)self _processRoleAttributeRequest:v6 error:a4];
    uint64_t v9 = [v8 unsignedIntegerValue];

    if ((v9 & 0xFFFFFFFFFFFFFFF7) == 6)
    {
      uint64_t v10 = [(AXPTranslator_iOS *)self _processLabelAttributeRequest:v6 error:a4 axpAttribute:33];

      uint64_t v7 = (void *)v10;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v7;
LABEL_8:
    uint64_t v12 = v11;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v7 string];
    goto LABEL_8;
  }
  uint64_t v12 = 0;
LABEL_10:

  return v12;
}

- (id)_processLabelAttributeRequest:(id)a3 error:(unint64_t *)a4 axpAttribute:(unint64_t)a5
{
  id v6 = objc_msgSend(a3, "objectWithAXAttribute:", 2001, a4);
  if (a5 == 3) {
    uint64_t v7 = objc_opt_class();
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = _AXPConvertOutgoingValueWithDesiredType(v6, v7);

  return v8;
}

- (id)_processNumberOfCharactersAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v4 = [(AXPTranslator_iOS *)self _processSyntheticStringValueAttributeRequest:a3 error:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_processRoleAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v6 = a3;
  [v6 axElement];
  if (AXUIElementIsApplication())
  {
    uint64_t v7 = &unk_26E241B50;
  }
  else
  {
    id v8 = [v6 numberWithAXAttribute:2004];
    uint64_t v9 = [v8 unsignedLongLongValue];

    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXPTranslator_iOS _processRoleAttributeRequest:traits:error:](self, "_processRoleAttributeRequest:traits:error:", v6, v9, a4));
  }

  return v7;
}

- (unint64_t)_processRoleAttributeRequest:(id)a3 traits:(unint64_t)a4 error:(unint64_t *)a5
{
  id v8 = a3;
  if ([v8 BOOLWithAXAttribute:5020]
    && ![v8 BOOLWithAXAttribute:2016])
  {
    unint64_t v9 = 5;
    goto LABEL_18;
  }
  if ((*MEMORY[0x263F21A98] & ~a4) == 0 || (*MEMORY[0x263F21B50] & ~a4) == 0)
  {
    unint64_t v9 = 9;
    goto LABEL_18;
  }
  if ((*MEMORY[0x263F21C30] & ~a4) == 0)
  {
    unint64_t v9 = 3;
    goto LABEL_18;
  }
  if ((*MEMORY[0x263F21A88] & ~a4) == 0)
  {
    unint64_t v9 = 19;
    goto LABEL_18;
  }
  if ((*MEMORY[0x263F219B8] & ~a4) == 0 || (*MEMORY[0x263F21A38] & ~a4) == 0 || (*MEMORY[0x263F21A40] & ~a4) == 0)
  {
    BOOL v10 = _AXPElementIsTabButton(v8, a4) == 0;
    uint64_t v11 = 9;
    uint64_t v12 = 2;
    goto LABEL_15;
  }
  if ((*MEMORY[0x263F21A18] & ~a4) == 0)
  {
    unint64_t v9 = 6;
    goto LABEL_18;
  }
  if (!AXPIsSwiftPlaygrounds() && (*MEMORY[0x263F21B60] & ~a4) == 0 && (*MEMORY[0x263F21C28] & ~a4) == 0) {
    goto LABEL_24;
  }
  if ((*MEMORY[0x263F21A48] & ~a4) == 0)
  {
    unint64_t v9 = 8;
    goto LABEL_18;
  }
  if ((*MEMORY[0x263F21A28] & ~a4) == 0 || (*MEMORY[0x263F21A90] & ~a4) == 0 || (*MEMORY[0x263F21A50] & ~a4) == 0)
  {
    unint64_t v9 = 7;
    goto LABEL_18;
  }
  if ((*MEMORY[0x263F21B30] & ~a4) == 0)
  {
    unint64_t v9 = 14;
    goto LABEL_18;
  }
  if (!AXPIsSwiftPlaygrounds() && (*MEMORY[0x263F21B60] & ~a4) == 0) {
    goto LABEL_24;
  }
  if ((*MEMORY[0x263F21B68] & ~a4) == 0)
  {
    unint64_t v9 = 15;
    goto LABEL_18;
  }
  if ((*MEMORY[0x263F21910] & ~a4) != 0)
  {
    if ([v8 BOOLWithAXAttribute:5056])
    {
      unint64_t v9 = 11;
      goto LABEL_18;
    }
    if (!AXPIsSwiftPlaygrounds())
    {
      uint64_t v14 = *MEMORY[0x263F21C28];
      goto LABEL_46;
    }
    uint64_t v14 = *MEMORY[0x263F21C28];
    if ((*MEMORY[0x263F21B60] & ~a4) != 0 || (v14 & a4) != v14)
    {
LABEL_46:
      uint64_t v15 = [MEMORY[0x263F21668] elementWithUIElement:v8];
      uint64_t v16 = [v15 containerType];
      if ((v14 & ~a4) == 0 && !v16)
      {
        id v17 = [(AXPTranslator_iOS *)self _processChildrenAttributeRequest:v8 error:a5];
        if (v17)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || [v17 count])
          {

            goto LABEL_57;
          }
        }

        unint64_t v9 = 14;
LABEL_69:

        goto LABEL_18;
      }
      if (v16 > 1023)
      {
        switch(v16)
        {
          case 0x400:
            unint64_t v9 = 20;
            goto LABEL_69;
          case 0x800:
            unint64_t v9 = 12;
            goto LABEL_69;
          case 0x4000:
            unint64_t v9 = 16;
            goto LABEL_69;
        }
      }
      else
      {
        switch(v16)
        {
          case 0:
LABEL_57:
            if ([v8 BOOLWithAXAttribute:2016]) {
              unint64_t v9 = 4;
            }
            else {
              unint64_t v9 = 5;
            }
            goto LABEL_69;
          case 2:
            unint64_t v9 = 21;
            goto LABEL_69;
          case 512:
            unint64_t v9 = 10;
            goto LABEL_69;
        }
      }
      unint64_t v9 = 5;
      goto LABEL_69;
    }
LABEL_24:
    unint64_t v9 = 17;
    goto LABEL_18;
  }
  BOOL v10 = (*MEMORY[0x263F21B20] & ~a4) == 0;
  uint64_t v11 = 13;
  uint64_t v12 = 18;
LABEL_15:
  if (v10) {
    unint64_t v9 = v12;
  }
  else {
    unint64_t v9 = v11;
  }
LABEL_18:

  return v9;
}

- (id)_processRoleDescriptionAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v6 = a3;
  uint64_t v7 = [(AXPTranslator_iOS *)self _processDirectAttributeRequest:v6 iosAttribute:2077 axpAttribute:46 parameter:0 error:a4];
  if (AXPNilOrEmptyString(v7))
  {
    id v8 = [v6 numberWithAXAttribute:2004];
    uint64_t v9 = [v8 unsignedLongLongValue];

    if ((*MEMORY[0x263F219B0] & ~v9) == 0)
    {
      BOOL v10 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AccessibilityPlatformTranslation"];
      uint64_t v11 = [v10 localizedStringForKey:@"back.button.role.description" value:&stru_26E23E2B0 table:@"Localizable"];
      goto LABEL_4;
    }
    if (([(AXPTranslator_iOS *)self _processRoleAttributeRequest:v6 traits:v9 error:a4] & 0xFFFFFFFFFFFFFFEFLL) == 5)
    {
      BOOL v10 = [MEMORY[0x263F21668] elementWithUIElement:v6];
      __int16 v12 = [v10 containerType];
      __int16 v13 = v12;
      if ((v12 & 2) != 0)
      {
        uint64_t v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AccessibilityPlatformTranslation"];
        uint64_t v15 = v14;
        uint64_t v16 = @"container.role.description.table";
      }
      else if ((v12 & 4) != 0)
      {
        uint64_t v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AccessibilityPlatformTranslation"];
        uint64_t v15 = v14;
        uint64_t v16 = @"container.role.description.list";
      }
      else if (v12)
      {
        uint64_t v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AccessibilityPlatformTranslation"];
        uint64_t v15 = v14;
        uint64_t v16 = @"container.role.description.landmark";
      }
      else if ((v12 & 8) != 0)
      {
        uint64_t v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AccessibilityPlatformTranslation"];
        uint64_t v15 = v14;
        uint64_t v16 = @"container.role.description.fieldset";
      }
      else if ((v12 & 0x10) != 0)
      {
        uint64_t v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AccessibilityPlatformTranslation"];
        uint64_t v15 = v14;
        uint64_t v16 = @"container.role.description.dialog";
      }
      else if ((v12 & 0x20) != 0)
      {
        uint64_t v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AccessibilityPlatformTranslation"];
        uint64_t v15 = v14;
        uint64_t v16 = @"container.role.description.tree";
      }
      else if ((v12 & 0x40) != 0)
      {
        uint64_t v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AccessibilityPlatformTranslation"];
        uint64_t v15 = v14;
        uint64_t v16 = @"container.role.description.frame";
      }
      else if ((v12 & 0x80) != 0)
      {
        uint64_t v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AccessibilityPlatformTranslation"];
        uint64_t v15 = v14;
        uint64_t v16 = @"container.role.description.article";
      }
      else if ((v12 & 0x1000) != 0)
      {
        uint64_t v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AccessibilityPlatformTranslation"];
        uint64_t v15 = v14;
        uint64_t v16 = @"container.role.description.dataseries";
      }
      else
      {
        if ((v12 & 0x2000) == 0) {
          goto LABEL_31;
        }
        uint64_t v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AccessibilityPlatformTranslation"];
        uint64_t v15 = v14;
        uint64_t v16 = @"container.role.description.tableofcontents";
      }
      uint64_t v18 = [v14 localizedStringForKey:v16 value:&stru_26E23E2B0 table:@"Localizable"];

      uint64_t v7 = (void *)v18;
LABEL_31:
      BOOL v19 = AXPNilOrEmptyString(v7);
      if ((v13 & 0x100) == 0 || !v19) {
        goto LABEL_5;
      }
      long long v20 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AccessibilityPlatformTranslation"];
      uint64_t v11 = [v20 localizedStringForKey:@"container.role.description.semanticgroup" value:&stru_26E23E2B0 table:@"Localizable"];

      uint64_t v7 = v20;
LABEL_4:

      uint64_t v7 = (void *)v11;
LABEL_5:
    }
  }

  return v7;
}

- (id)_processBoundsForRangeAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 objectForKeyedSubscript:@"parameter"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v7 BOOLWithAXAttribute:2301]) {
        uint64_t v10 = 92703;
      }
      else {
        uint64_t v10 = 92506;
      }
      uint64_t v11 = [v7 objectWithAXAttribute:v10 parameter:v9];
      __int16 v12 = _AXPConvertOutgoingValueWithDesiredType(v11, 0);
    }
    else
    {
      __int16 v12 = 0;
      *a5 = 7;
    }
  }
  else
  {
    __int16 v12 = 0;
    *a5 = 7;
  }

  return v12;
}

- (id)_processVisibleTextRangeAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v6 = a3;
  if ([v6 rangeWithAXAttribute:2216] == 0x7FFFFFFF
    && [v6 BOOLWithAXAttribute:2025])
  {
    id v7 = [(AXPTranslator_iOS *)self _processSyntheticStringValueAttributeRequest:v6 error:a4];
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", 0, objc_msgSend(v7, "length"));
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_processAuditIssuesAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  uint64_t v23 = self;
  uint64_t v24 = a5;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v25 = v6;
  id v8 = _AXPiOSParameterFromPlatformParameter(v6);
  uint64_t v9 = [v8 allKeys];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    uint64_t v13 = *MEMORY[0x263F215D0];
    uint64_t v14 = MEMORY[0x263EFFA88];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v31 = v13;
        uint64_t v32 = v14;
        id v17 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1, v23, v24, v25);
        [v7 setObject:v17 forKeyedSubscript:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v11);
  }

  uint64_t v18 = [NSNumber numberWithUnsignedChar:AXPIsCatalyst()];
  [v7 setObject:v18 forKeyedSubscript:*MEMORY[0x263F215C8]];

  BOOL v19 = [v26 objectWithAXAttribute:95005 parameter:v7];
  long long v20 = _AXPConvertOutgoingValueWithDesiredType(v19, 0);
  long long v21 = [(AXPTranslator_iOS *)v23 _postProcessAttributeRequest:v26 iosAttribute:95005 axpAttribute:83 result:v20 error:v24];

  return v21;
}

- (id)_processAttributedStringForRangeAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v8 = a3;
  uint64_t v9 = _AXPiOSParameterFromPlatformParameter(a4);
  uint64_t v10 = [v8 objectWithAXAttribute:92508 parameter:v9];
  if (!v10
    || ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && ![v10 length])
  {
    uint64_t v11 = [(AXPTranslator_iOS *)self _processRoleAttributeRequest:v8 error:a5];
    uint64_t v12 = [v11 unsignedIntegerValue];

    if ((v12 & 0xFFFFFFFFFFFFFFF7) == 6)
    {
      uint64_t v13 = [v8 objectWithAXAttribute:2001];
      uint64_t v14 = [v9 rangeValue];
      uint64_t v16 = v15;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v14 + v16 > (unint64_t)[v13 length]) {
          goto LABEL_14;
        }
        uint64_t v17 = objc_msgSend(v13, "substringWithRange:", v14, v16);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || v14 + v16 > (unint64_t)[v13 length]) {
          goto LABEL_14;
        }
        uint64_t v17 = objc_msgSend(v13, "attributedSubstringFromRange:", v14, v16);
      }

      uint64_t v10 = (void *)v17;
LABEL_14:
    }
  }
  uint64_t v18 = objc_opt_class();
  BOOL v19 = _AXPConvertOutgoingValueWithDesiredType(v10, v18);
  long long v20 = [(AXPTranslator_iOS *)self _postProcessAttributeRequest:v8 iosAttribute:92508 axpAttribute:4 result:v19 error:a5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = [objc_alloc(MEMORY[0x263F086A0]) initWithString:v20];

    long long v20 = (void *)v21;
  }

  return v20;
}

- (id)_processStringForRangeAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v8 = a3;
  uint64_t v9 = _AXPiOSParameterFromPlatformParameter(a4);
  uint64_t v10 = [v8 objectWithAXAttribute:92505 parameter:v9];
  if (!v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [(AXPTranslator_iOS *)self _processSyntheticStringValueAttributeRequest:v8 error:a5];
      uint64_t v12 = [v9 rangeValue];
      uint64_t v14 = v13;
      if (v12 + v13 <= (unint64_t)[v11 length])
      {
        uint64_t v10 = objc_msgSend(v11, "substringWithRange:", v12, v14);
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  uint64_t v15 = _AXPConvertOutgoingValueWithDesiredType(v10, 0);
  uint64_t v16 = [(AXPTranslator_iOS *)self _postProcessAttributeRequest:v8 iosAttribute:92505 axpAttribute:50 result:v15 error:a5];

  return v16;
}

- (id)_processSubroleAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v4 = a3;
  uint64_t v5 = [v4 numberWithAXAttribute:2004];
  uint64_t v6 = [v5 unsignedLongLongValue];

  id v7 = &unk_26E241B38;
  if ((*MEMORY[0x263F21A98] & ~v6) != 0)
  {
    id v7 = &unk_26E241B68;
    if ((*MEMORY[0x263F21B50] & ~v6) != 0)
    {
      if ((*MEMORY[0x263F21C30] & ~v6) != 0 || [v4 BOOLWithAXAttribute:2232])
      {
        if ((*MEMORY[0x263F21A50] & ~v6) != 0)
        {
          if ((*MEMORY[0x263F21AE0] & ~v6) != 0)
          {
            if ((*MEMORY[0x263F21AD8] & ~v6) != 0)
            {
              if (!_AXPElementIsTabButton(v4, v6)) {
                id v7 = &unk_26E241B38;
              }
            }
            else
            {
              id v7 = &unk_26E241B50;
            }
          }
          else
          {
            id v7 = &unk_26E241BC8;
          }
        }
        else
        {
          id v7 = &unk_26E241BB0;
        }
      }
      else
      {
        id v7 = &unk_26E241C28;
      }
    }
  }

  return v7;
}

- (id)_processAttributeSpecialCases:(unint64_t)a3 uiElement:(id)a4 error:(unint64_t *)a5 client:(unint64_t)a6
{
  return [(AXPTranslator_iOS *)self _processAttributeSpecialCases:a3 uiElement:a4 parameter:0 error:a5 client:a6];
}

- (id)_processCustomActionsAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v6 = a3;
  id v7 = [v6 arrayWithAXAttribute:2036];
  id v8 = [(AXPTranslator_iOS *)self _postProcessAttributeRequest:v6 iosAttribute:0 axpAttribute:13 result:v7 error:a4];

  return v8;
}

- (id)_processFirstContainedElement:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  void v19[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x263EFF9A0];
  v18[0] = *MEMORY[0x263F21610];
  uint64_t v10 = NSNumber;
  id v11 = a4;
  uint64_t v12 = objc_msgSend(v10, "numberWithBool:", -[AXPTranslator_iOS shouldHonorGroupsForElementTraversal](self, "shouldHonorGroupsForElementTraversal"));
  v18[1] = *MEMORY[0x263F21618];
  v19[0] = v12;
  v19[1] = MEMORY[0x263EFFA88];
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  uint64_t v14 = [v9 dictionaryWithDictionary:v13];

  uint64_t v15 = _AXPiOSParameterFromPlatformParameter(v11);

  if (v15) {
    [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x263F21600]];
  }
  uint64_t v16 = [(AXPTranslator_iOS *)self _processParameterizedAttributeRequest:v8 attribute:95230 parameter:v14 error:a5];

  return v16;
}

- (id)_processFocusedElementAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(AXPTranslator_iOS *)self _processDirectAttributeRequest:v8 iosAttribute:3002 axpAttribute:19 parameter:v9 error:a5];
  if (!v10)
  {
    uint64_t v10 = [(AXPTranslator_iOS *)self _processDirectAttributeRequest:v8 iosAttribute:3027 axpAttribute:19 parameter:v9 error:a5];
  }

  return v10;
}

- (id)_processIsFocusedAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(AXPTranslator_iOS *)self _processDirectAttributeRequest:v8 iosAttribute:2198 axpAttribute:28 parameter:v9 error:a5];
  if (([v10 BOOLValue] & 1) == 0)
  {
    uint64_t v11 = [(AXPTranslator_iOS *)self _processDirectAttributeRequest:v8 iosAttribute:2094 axpAttribute:28 parameter:v9 error:a5];

    uint64_t v10 = (void *)v11;
  }

  return v10;
}

- (id)_processLastContainedElement:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  void v19[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void *)MEMORY[0x263EFF9A0];
  v18[0] = *MEMORY[0x263F21610];
  uint64_t v10 = NSNumber;
  id v11 = a4;
  uint64_t v12 = objc_msgSend(v10, "numberWithBool:", -[AXPTranslator_iOS shouldHonorGroupsForElementTraversal](self, "shouldHonorGroupsForElementTraversal"));
  v18[1] = *MEMORY[0x263F21618];
  v19[0] = v12;
  v19[1] = MEMORY[0x263EFFA88];
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  uint64_t v14 = [v9 dictionaryWithDictionary:v13];

  uint64_t v15 = _AXPiOSParameterFromPlatformParameter(v11);

  if (v15) {
    [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x263F21600]];
  }
  uint64_t v16 = [(AXPTranslator_iOS *)self _processParameterizedAttributeRequest:v8 attribute:95231 parameter:v14 error:a5];

  return v16;
}

- (id)_processFirstElementForFocus:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v13 = *MEMORY[0x263F21610];
  id v7 = NSNumber;
  id v8 = a3;
  id v9 = objc_msgSend(v7, "numberWithBool:", -[AXPTranslator_iOS shouldHonorGroupsForElementTraversal](self, "shouldHonorGroupsForElementTraversal"));
  v14[0] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

  id v11 = [(AXPTranslator_iOS *)self _processParameterizedAttributeRequest:v8 attribute:95250 parameter:v10 error:a5];

  return v11;
}

- (id)_processVisibleOpaqueElements:(id)a3 error:(unint64_t *)a4
{
  void v13[2] = *MEMORY[0x263EF8340];
  v12[0] = *MEMORY[0x263F21610];
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = objc_msgSend(v6, "numberWithBool:", -[AXPTranslator_iOS shouldHonorGroupsForElementTraversal](self, "shouldHonorGroupsForElementTraversal"));
  v12[1] = *MEMORY[0x263F21620];
  v13[0] = v8;
  v13[1] = MEMORY[0x263EFFA88];
  id v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  uint64_t v10 = [(AXPTranslator_iOS *)self _processParameterizedAttributeRequest:v7 attribute:95249 parameter:v9 error:a4];

  return v10;
}

- (id)_processAttributeSpecialCases:(unint64_t)a3 uiElement:(id)a4 parameter:(id)a5 error:(unint64_t *)a6 client:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = 0;
  switch(a3)
  {
    case 3uLL:
      long long v20 = self;
      id v21 = v12;
      long long v22 = a6;
      uint64_t v23 = 3;
      goto LABEL_17;
    case 4uLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processAttributedStringForRangeAttributeRequest:v12 parameter:v13 error:a6];
      goto LABEL_57;
    case 5uLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processBoundsForRangeAttributeRequest:v12 parameter:v13 error:a6];
      goto LABEL_57;
    case 6uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1DuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x25uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x34uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3DuLL:
    case 0x3EuLL:
    case 0x3FuLL:
    case 0x41uLL:
    case 0x43uLL:
    case 0x44uLL:
    case 0x45uLL:
    case 0x46uLL:
    case 0x47uLL:
    case 0x49uLL:
    case 0x4DuLL:
    case 0x4EuLL:
    case 0x4FuLL:
    case 0x50uLL:
    case 0x51uLL:
    case 0x54uLL:
    case 0x59uLL:
    case 0x5AuLL:
    case 0x5BuLL:
      break;
    case 7uLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processClassNameAttributeRequest:v12 error:a6];
      goto LABEL_57;
    case 8uLL:
    case 9uLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processChildrenAttributeRequest:v12 error:a6];
      goto LABEL_57;
    case 0xDuLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processCustomActionsAttributeRequest:v12 error:a6];
      goto LABEL_57;
    case 0x12uLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processFirstContainedElement:v12 parameter:v13 error:a6];
      goto LABEL_57;
    case 0x13uLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processFocusedElementAttributeRequest:v12 parameter:v13 error:a6];
      goto LABEL_57;
    case 0x17uLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processElementHelpAttributeResquest:v12 error:a6];
      goto LABEL_57;
    case 0x1BuLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processIsEnabledAttributeRequest:v12 error:a6];
      goto LABEL_57;
    case 0x1CuLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processIsFocusedAttributeRequest:v12 parameter:v13 error:a6];
      goto LABEL_57;
    case 0x1EuLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processIsSelectedAttributeRequest:v12 error:a6];
      goto LABEL_57;
    case 0x21uLL:
      long long v20 = self;
      id v21 = v12;
      long long v22 = a6;
      uint64_t v23 = 33;
LABEL_17:
      uint64_t v15 = [(AXPTranslator_iOS *)v20 _processLabelAttributeRequest:v21 error:v22 axpAttribute:v23];
      goto LABEL_57;
    case 0x22uLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processLastContainedElement:v12 parameter:v13 error:a6];
      goto LABEL_57;
    case 0x23uLL:
      uint64_t v24 = self;
      id v25 = v12;
      id v26 = v13;
      uint64_t v27 = 1;
      goto LABEL_21;
    case 0x24uLL:
      uint64_t v24 = self;
      id v25 = v12;
      id v26 = v13;
      uint64_t v27 = 2;
LABEL_21:
      uint64_t v15 = [(AXPTranslator_iOS *)v24 _processMoveFocusToOpaqueElementAttributeRequest:v25 parameter:v26 direction:v27 error:a6];
      goto LABEL_57;
    case 0x26uLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processNumberOfCharactersAttributeRequest:v12 error:a6];
      goto LABEL_57;
    case 0x2DuLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processRoleAttributeRequest:v12 error:a6];
      goto LABEL_57;
    case 0x2EuLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processRoleDescriptionAttributeRequest:v12 error:a6];
      goto LABEL_57;
    case 0x31uLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processStartsMediaSessionAttributeRequest:v12 error:a6];
      goto LABEL_57;
    case 0x32uLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processStringForRangeAttributeRequest:v12 parameter:v13 error:a6];
      goto LABEL_57;
    case 0x33uLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processSubroleAttributeRequest:v12 error:a6];
      goto LABEL_57;
    case 0x35uLL:
      long long v28 = self;
      id v29 = v12;
      long long v30 = a6;
      uint64_t v31 = 53;
      goto LABEL_33;
    case 0x3AuLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processVisibleOpaqueElements:v12 error:a6];
      goto LABEL_57;
    case 0x3BuLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processingSmuggledMarzipanRequest:v12 parameter:v13 error:a6];
      goto LABEL_57;
    case 0x3CuLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processRawElementDataRequest:v12 error:a6];
      goto LABEL_57;
    case 0x40uLL:
      long long v28 = self;
      id v29 = v12;
      long long v30 = a6;
      uint64_t v31 = 64;
LABEL_33:
      uint64_t v32 = 0;
LABEL_50:
      uint64_t v15 = [(AXPTranslator_iOS *)v28 _processValueAttributeRequest:v29 error:v30 axpAttribute:v31 useAttributes:v32];
      goto LABEL_57;
    case 0x42uLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processIsRemoteElementAttributeRequest:v12 error:a6];
      goto LABEL_57;
    case 0x48uLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processLineRangeAttributeRequest:v12 parameter:v13 error:a6];
      goto LABEL_57;
    case 0x4AuLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processNextLineRangeAttributeRequest:v12 parameter:v13 error:a6];
      goto LABEL_57;
    case 0x4BuLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processPreviousLineRangeAttributeRequest:v12 parameter:v13 error:a6];
      goto LABEL_57;
    case 0x4CuLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processLinkedUIElementsAttributeRequest:v12 error:a6];
      goto LABEL_57;
    case 0x52uLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processViewControllerDescriptionAttributeRequest:v12 error:a6];
      goto LABEL_57;
    case 0x53uLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processAuditIssuesAttributeRequest:v12 parameter:v13 error:a6];
      goto LABEL_57;
    case 0x55uLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processFirstElementForFocus:v12 parameter:v13 error:a6];
      goto LABEL_57;
    case 0x56uLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processSelectedTextRequest:v12 error:a6];
      goto LABEL_57;
    case 0x57uLL:
      uint64_t v33 = self;
      id v34 = v12;
      uint64_t v35 = a6;
      uint64_t v36 = 87;
      goto LABEL_45;
    case 0x58uLL:
      uint64_t v33 = self;
      id v34 = v12;
      uint64_t v35 = a6;
      uint64_t v36 = 88;
LABEL_45:
      uint64_t v15 = [(AXPTranslator_iOS *)v33 _processUserInputLabelsAttributeRequest:v34 error:v35 axpAttribute:v36];
      goto LABEL_57;
    case 0x5CuLL:
      uint64_t v15 = [(AXPTranslator_iOS *)self _processVisibleTextRangeAttributeRequest:v12 error:a6];
LABEL_57:
      uint64_t v14 = (void *)v15;
      break;
    default:
      switch(a3)
      {
        case 'l':
          uint64_t v16 = self;
          id v17 = v12;
          uint64_t v18 = a6;
          uint64_t v19 = 33;
          goto LABEL_55;
        case 'm':
          uint64_t v16 = self;
          id v17 = v12;
          uint64_t v18 = a6;
          uint64_t v19 = 46;
LABEL_55:
          uint64_t v15 = [(AXPTranslator_iOS *)v16 _processBrailleOverrideForAttributeRequest:v17 error:v18 attribute:v19];
          goto LABEL_57;
        case 'o':
          uint64_t v15 = [(AXPTranslator_iOS *)self _processIndexForTextMarkerAttributeRequest:v12 parameter:v13 error:a6];
          goto LABEL_57;
        case 'v':
          if (a7 == 7)
          {
            long long v28 = self;
            id v29 = v12;
            long long v30 = a6;
            uint64_t v31 = 118;
            uint64_t v32 = 1;
            goto LABEL_50;
          }
          uint64_t v14 = 0;
          break;
        case 'y':
          BOOL v37 = self;
          uint64_t v38 = 1;
          goto LABEL_53;
        case 'z':
          BOOL v37 = self;
          uint64_t v38 = 0;
LABEL_53:
          uint64_t v15 = [(AXPTranslator_iOS *)v37 _processZoomAttributeRequest:v38 axElement:v12 parameter:v13 error:a6];
          goto LABEL_57;
        case '{':
          uint64_t v15 = [(AXPTranslator_iOS *)self _processTextInputMarkedRangeAttributeRequest:v12 error:a6];
          goto LABEL_57;
        default:
          goto LABEL_58;
      }
      break;
  }
LABEL_58:

  return v14;
}

- (id)processCanSetAttribute:(id)a3
{
  id v4 = a3;
  [v4 clientType];
  AXOverrideRequestingClientType();
  uint64_t v5 = objc_opt_new();
  id v6 = [(AXPTranslator_iOS *)self axElementFromTranslatorRequest:v4];
  uint64_t v7 = [v4 attributeType];

  if (v7 > 46)
  {
    if (v7 == 53)
    {
      uint64_t v14 = [v6 traits];
      uint64_t v15 = *MEMORY[0x263F21910];
      uint64_t v16 = *MEMORY[0x263F21910] & v14;
      BOOL v17 = (*MEMORY[0x263F21B68] & ~v14) == 0 || v16 == v15;
      BOOL v20 = v17 && (*MEMORY[0x263F21A68] & ~v14) != 0;
      BOOL v17 = (*MEMORY[0x263F21A30] & v14) == *MEMORY[0x263F21A30];
      id v13 = NSNumber;
      uint64_t v12 = v17 || v16 == v15 || v20;
    }
    else
    {
      if (v7 != 47) {
        goto LABEL_26;
      }
      uint64_t v10 = *MEMORY[0x263F21C28];
      id v11 = NSNumber;
      uint64_t v12 = (v10 & ~[v6 traits]) == 0;
      id v13 = v11;
    }
    uint64_t v19 = [v13 numberWithInt:v12];
  }
  else
  {
    if (v7 == 2)
    {
      [v5 setResultData:MEMORY[0x263EFFA88]];
      goto LABEL_26;
    }
    if (v7 != 28) {
      goto LABEL_26;
    }
    id v8 = [v6 uiElement];
    if ([v8 BOOLWithAXAttribute:2204])
    {
      uint64_t v9 = 1;
    }
    else
    {
      uint64_t v18 = [v6 uiElement];
      uint64_t v9 = [v18 BOOLWithAXAttribute:3002];
    }
    uint64_t v19 = [NSNumber numberWithBool:v9];
  }
  long long v22 = (void *)v19;
  [v5 setResultData:v19];

LABEL_26:
  AXOverrideRequestingClientType();

  return v5;
}

- (id)processSetAttribute:(id)a3
{
  id v4 = a3;
  [v4 clientType];
  AXOverrideRequestingClientType();
  uint64_t v5 = [(AXPTranslator_iOS *)self axElementFromTranslatorRequest:v4];
  uint64_t v6 = [v4 attributeType];
  if (v6 > 52)
  {
    switch(v6)
    {
      case '5':
        id v8 = [v5 uiElement];
        id v13 = [v4 parameters];
        uint64_t v15 = [v13 objectForKeyedSubscript:@"value"];
        [v8 setAXAttribute:2006 withString:v15];
LABEL_21:

        goto LABEL_22;
      case 'b':
        BOOL v17 = [v4 parameters];
        id v8 = [v17 objectForKeyedSubscript:@"value"];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_23;
        }
        uint64_t v12 = [v5 uiElement];
        id v13 = v12;
        uint64_t v14 = 2708;
        break;
      case 'a':
        id v11 = [v4 parameters];
        id v8 = [v11 objectForKeyedSubscript:@"value"];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_23;
        }
        uint64_t v12 = [v5 uiElement];
        id v13 = v12;
        uint64_t v14 = 2716;
        break;
      default:
        goto LABEL_24;
    }
    [v12 setAXAttribute:v14 withNumber:v8];
LABEL_22:

    goto LABEL_23;
  }
  switch(v6)
  {
    case 2:
      id v8 = [v5 uiElement];
      id v13 = [v4 parameters];
      [v8 setAXAttribute:2018 withObject:v13];
      goto LABEL_22;
    case 28:
      uint64_t v16 = [v4 parameters];
      id v8 = [v16 objectForKeyedSubscript:@"focused"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v8 BOOLValue])
        {
          [v5 setNativeFocus];
          goto LABEL_23;
        }
        id v13 = [v5 uiElement];
        uint64_t v15 = [v5 uiElement];
        [v13 setAXAttribute:3002 withUIElement:v15];
        goto LABEL_21;
      }
LABEL_23:

      break;
    case 47:
      uint64_t v7 = [v4 parameters];
      id v8 = [v7 objectForKeyedSubscript:@"range"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [v8 rangeValue];
        objc_msgSend(v5, "setSelectedTextRange:", v9, v10);
      }
      goto LABEL_23;
  }
LABEL_24:
  AXOverrideRequestingClientType();

  return 0;
}

- (id)processSupportedActions:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 clientType];
  AXOverrideRequestingClientType();
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [(AXPTranslator_iOS *)self axElementFromTranslatorRequest:v4];
  uint64_t v7 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = objc_msgSend(v4, "parameters", 0);
  uint64_t v9 = [v8 objectForKeyedSubscript:@"actions"];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v6, "supportsAction:", _convertAXPActionToiOS((int)objc_msgSend(v14, "intValue"))))objc_msgSend(v7, "addObject:", v14); {
      }
        }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [v5 setResultData:v7];
  AXOverrideRequestingClientType();

  return v5;
}

- (id)processSupportsAttributes:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 clientType];
  AXOverrideRequestingClientType();
  uint64_t v21 = objc_opt_new();
  uint64_t v5 = [(AXPTranslator_iOS *)self axElementFromTranslatorRequest:v4];
  uint64_t v6 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [v4 parameters];
  id v8 = [v7 objectForKeyedSubscript:@"attributes"];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
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
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = [v13 integerValue];
        if (v14 == 96)
        {
          uint64_t v15 = NSNumber;
          long long v16 = [v5 uiElement];
          long long v17 = v16;
          uint64_t v18 = 2713;
          goto LABEL_10;
        }
        if (v14 == 81)
        {
          uint64_t v15 = NSNumber;
          long long v16 = [v5 uiElement];
          long long v17 = v16;
          uint64_t v18 = 2317;
LABEL_10:
          long long v19 = objc_msgSend(v15, "numberWithBool:", objc_msgSend(v16, "BOOLWithAXAttribute:", v18));
          [v6 setObject:v19 forKeyedSubscript:v13];

          continue;
        }
        [v6 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  [v21 setResultData:v6];
  AXOverrideRequestingClientType();

  return v21;
}

- (id)_preprocessRequest:(int64_t)a3 parameter:(id)a4
{
  id v5 = a4;
  if (a3 == 92516)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [v5 objectForKey:@"AXStartElement"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v19 = (void *)[v5 mutableCopy];
        BOOL v20 = +[AXPTranslator_iOS sharedInstance];
        uint64_t v21 = (void *)[v20 createPlatformElementFromTranslationObject:v18];

        [v19 setObject:v21 forKeyedSubscript:@"AXStartElement"];
        id v5 = v19;
      }
    }
    goto LABEL_15;
  }
  if (a3 != 95227 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_15:
    uint64_t v11 = v5;
    goto LABEL_16;
  }
  uint64_t v6 = [v5 objectForKey:@"AXPCustomRotorTargetElement"];
  uint64_t v7 = [v5 objectForKey:@"AXPCustomRotorTargetRange"];
  id v8 = [v5 objectForKey:@"AXPCustomRotorDirection"];
  int v9 = [v8 intValue];

  uint64_t v10 = [v5 objectForKey:@"AXPCustomRotorUUID"];
  uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
  [v11 setObject:v10 forKeyedSubscript:@"uuid"];
  uint64_t v12 = [NSNumber numberWithInteger:v9 != 1];
  [v11 setObject:v12 forKeyedSubscript:@"direction"];

  id v13 = +[AXPTranslator_iOS sharedInstance];
  uint64_t v14 = (const void *)[v13 createPlatformElementFromTranslationObject:v6];

  uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
  [v15 setObject:v14 forKeyedSubscript:@"targetElement"];
  if (v14) {
    CFRelease(v14);
  }
  if (v7)
  {
    uint64_t v23 = [v7 rangeValue];
    uint64_t v24 = v16;
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      AXValueRef v17 = AXValueCreate(kAXValueTypeCFRange, &v23);
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, @"targetRange", v23, v24);
      if (v17) {
        CFRelease(v17);
      }
    }
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, @"currentItem", v23, v24);

LABEL_16:

  return v11;
}

- (id)processAttributeRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 translation];
  [v4 clientType];
  AXOverrideRequestingClientType();
  uint64_t v6 = [(AXPTranslator_iOS *)self createPlatformElementFromTranslationObject:v5];
  uint64_t v7 = (void *)MEMORY[0x263F21690];
  id v8 = objc_opt_new();
  int v9 = [v7 uiElementWithAXElement:v6 cache:v8];

  uint64_t v10 = objc_opt_new();
  uint64_t v11 = [v4 attributeType];
  [v10 setAttribute:v11];
  uint64_t v25 = 0;
  uint64_t v12 = [v4 parameters];
  id v13 = -[AXPTranslator_iOS _processAttributeSpecialCases:uiElement:parameter:error:client:](self, "_processAttributeSpecialCases:uiElement:parameter:error:client:", v11, v9, v12, &v25, [v4 clientType]);
  [v10 setResultData:v13];

  uint64_t v14 = [v10 resultData];

  if (!v14)
  {
    uint64_t v15 = [v4 parameters];
    uint64_t v16 = [v15 objectForKeyedSubscript:@"parameter"];

    if (!v16)
    {
      uint64_t v16 = [v4 parameters];
    }
    if ([v4 attributeType] == 63)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v17 = [v16 longValue];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v20 = v16;
          uint64_t v17 = _AXPConvertAXAttribute(v20);
          if (!v17)
          {
            uint64_t v23 = [NSString stringWithFormat:@"k%@Attribute", v20];
            uint64_t v17 = _AXPConvertAXAttribute(v23);

            if (!v17)
            {
              uint64_t v24 = [NSString stringWithFormat:@"kAX%@Attribute", v20];
              uint64_t v17 = _AXPConvertAXAttribute(v24);
            }
          }
        }
        else
        {
          uint64_t v17 = 0;
        }
      }

      uint64_t v16 = 0;
      if (!v17) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v17 = [(AXPTranslator_iOS *)self attributeFromRequest:v11];
      if (!v17)
      {
LABEL_16:
        uint64_t v25 = -25205;
        goto LABEL_17;
      }
    }
    uint64_t v18 = [(AXPTranslator_iOS *)self _preprocessRequest:v17 parameter:v16];

    long long v19 = [(AXPTranslator_iOS *)self _processDirectAttributeRequest:v9 iosAttribute:v17 axpAttribute:v11 parameter:v18 error:&v25];
    [v10 setResultData:v19];

    uint64_t v16 = (void *)v18;
LABEL_17:
  }
  [v10 setError:v25];
  uint64_t v21 = [v4 translation];
  [v10 setAssociatedTranslationObject:v21];

  if (v6) {
    CFRelease(v6);
  }
  AXOverrideRequestingClientType();

  return v10;
}

- (AXUIElement)systemAppElement
{
  systemAppElement = self->_systemAppElement;
  if (!systemAppElement)
  {
    id v4 = [(AXPTranslator_iOS *)self systemWideElement];
    uint64_t v12 = 0;
    id v5 = [(AXPTranslator_iOS *)self _processDirectAttributeRequest:v4 iosAttribute:1001 axpAttribute:0 parameter:0 error:&v12];
    if (v5)
    {
      uint64_t v6 = [(AXPTranslator_iOS *)self createPlatformElementFromTranslationObject:v5];
      uint64_t v7 = (void *)MEMORY[0x263F21690];
      id v8 = objc_opt_new();
      int v9 = [v7 uiElementWithAXElement:v6 cache:v8];
      uint64_t v10 = self->_systemAppElement;
      self->_systemAppElement = v9;

      if (v6) {
        CFRelease(v6);
      }
    }

    systemAppElement = self->_systemAppElement;
  }

  return systemAppElement;
}

- (id)processApplicationObject:(id)a3
{
  id v4 = a3;
  [v4 clientType];
  AXOverrideRequestingClientType();
  id v5 = [v4 parameters];

  uint64_t v6 = [v5 objectForKeyedSubscript:@"pid"];

  if (v6) {
    [v6 intValue];
  }
  else {
    getpid();
  }
  AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid();
  id v8 = objc_opt_new();
  int v9 = [(AXPTranslator_iOS *)self translationObjectFromPlatformElement:AppElementWithPid];
  [v8 setResultData:v9];
  if (AppElementWithPid) {
    CFRelease(AppElementWithPid);
  }
  AXOverrideRequestingClientType();

  return v8;
}

- (id)processFrontMostApp:(id)a3
{
  return [(AXPTranslator_iOS *)self processFrontMostApp:a3 withiOSAttribute:1102];
}

- (id)_processFrontMostAppForContinuity:(id)a3
{
  return [(AXPTranslator_iOS *)self processFrontMostApp:a3 withiOSAttribute:1111];
}

- (id)processFrontMostApp:(id)a3 withiOSAttribute:(int64_t)a4
{
  id v6 = a3;
  [v6 clientType];
  AXOverrideRequestingClientType();
  uint64_t v7 = [(AXPTranslator_iOS *)self systemAppElement];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy_;
  long long v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__AXPTranslator_iOS_processFrontMostApp_withiOSAttribute___block_invoke;
  v16[3] = &unk_2649DEFB8;
  id v8 = v7;
  id v20 = &v22;
  int64_t v21 = a4;
  id v17 = v8;
  uint64_t v18 = self;
  long long v19 = &v26;
  int v9 = (void (**)(void))MEMORY[0x230FA6D40](v16);
  int v10 = [v8 pid];
  if (v10 == getpid()) {
    dispatch_sync(MEMORY[0x263EF83A0], v9);
  }
  else {
    v9[2](v9);
  }
  uint64_t v11 = objc_opt_new();
  [v11 setError:v23[3]];
  uint64_t v12 = [(id)v27[5] firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v12 intValue];
    AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid();
    uint64_t v14 = [(AXPTranslator_iOS *)self translationObjectFromPlatformElement:AppElementWithPid];
    [v11 setResultData:v14];
    if (AppElementWithPid) {
      CFRelease(AppElementWithPid);
    }
  }
  else
  {
    uint64_t v14 = [(id)v27[5] firstObject];
    [v11 setResultData:v14];
  }

  AXOverrideRequestingClientType();
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v11;
}

- (void)setRequestResolvingBehavior:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXPTranslator_iOS;
  -[AXPTranslator setRequestResolvingBehavior:](&v5, sel_setRequestResolvingBehavior_);
  [(AXPTranslator_iOS *)self setShouldHonorGroupsForElementTraversal:a3 - 3 < 0xFFFFFFFFFFFFFFFELL];
}

- (id)axTreeDumpSharedBackgroundQueue
{
  if (axTreeDumpSharedBackgroundQueue_onceAttrToken != -1) {
    dispatch_once(&axTreeDumpSharedBackgroundQueue_onceAttrToken, &__block_literal_global_556);
  }
  int v2 = (void *)axTreeDumpSharedBackgroundQueue_axTreeDumpBackgroundQueue;

  return v2;
}

- (void)stopGeneratingAXTreeDump
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = AXPlatformTranslationLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[AXPTranslator_iOS stopGeneratingAXTreeDump]";
    _os_log_impl(&dword_22E850000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [(AXPTranslator_iOS *)self axTreeDumpLock];
  [v4 lock];

  [(AXPTranslator_iOS *)self setShouldStopGeneratingAXTree:1];
  objc_super v5 = [(AXPTranslator_iOS *)self axTreeDumpLock];
  [v5 unlock];
}

- (void)fetchNextSetOfElementAttrsOnBackgroundThreadWithEarlyTermination:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(AXPTranslator_iOS *)self axTreeDumpSharedBackgroundQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = [(AXPTranslator_iOS *)self axTreeDumpLock];
  [v6 lock];

  unint64_t v7 = [(AXPTranslator_iOS *)self axTreeDumpCurrentChildIndex];
  uint64_t v8 = [(AXPTranslator_iOS *)self axTreeDumpCurrentlyProcessingChildren];
  unint64_t v9 = [v8 count];

  int v10 = [(AXPTranslator_iOS *)self axTreeDumpLock];
  [v10 unlock];

  if (v3 || v7 >= v9)
  {
    id v19 = (id)objc_opt_new();
    [v19 setAssociatedRequestType:11];
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v12 = [(AXPTranslator_iOS *)self axTreeDumpLock];
    [v12 lock];

    id v13 = [(AXPTranslator_iOS *)self axTreeDumpCurrentOutput];
    uint64_t v14 = (void *)[v13 copy];
    [v11 setObject:v14 forKeyedSubscript:@"treeDump"];

    uint64_t v15 = [(AXPTranslator_iOS *)self axTreeDumpCurrentType];
    uint64_t v16 = (void *)[v15 copy];
    [v11 setObject:v16 forKeyedSubscript:@"treeDumpType"];

    id v17 = [(AXPTranslator_iOS *)self axTreeDumpLock];
    [v17 unlock];

    [v19 setResultData:v11];
    [(AXPTranslator_iOS *)self _axTreeDumpCleanUpState];
    AXOverrideRequestingClientType();
    uint64_t v18 = [(AXPTranslator_iOS *)self axTreeDumpCompletionHandler];
    ((void (**)(void, BOOL, id))v18)[2](v18, !v3, v19);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__AXPTranslator_iOS_fetchNextSetOfElementAttrsOnBackgroundThreadWithEarlyTermination___block_invoke;
    block[3] = &unk_2649DEF48;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (void)_axTreeDumpCleanUpState
{
  BOOL v3 = [(AXPTranslator_iOS *)self axTreeDumpLock];
  [v3 lock];

  [(AXPTranslator_iOS *)self setAxTreeDumpCurrentChildIndex:0];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(AXPTranslator_iOS *)self setAxTreeDumpCurrentlyProcessingChildren:v4];

  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(AXPTranslator_iOS *)self setAxTreeDumpCurrentOutput:v5];

  [(AXPTranslator_iOS *)self setAxTreeDumpCurrentType:0];
  [(AXPTranslator_iOS *)self setShouldStopGeneratingAXTree:0];
  id v6 = [(AXPTranslator_iOS *)self axTreeDumpLock];
  [v6 unlock];
}

- (void)axTreeDumpGenerateNextSetOfElementAttrsOnMainThread
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v3 = [(AXPTranslator_iOS *)self axTreeDumpLock];
  [v3 lock];

  LODWORD(v3) = [(AXPTranslator_iOS *)self shouldStopGeneratingAXTree];
  id v4 = [(AXPTranslator_iOS *)self axTreeDumpLock];
  [v4 unlock];

  if (!v3)
  {
    AXOverrideRequestingClientType();
    unint64_t v9 = [MEMORY[0x263EFF8C0] array];
    int v10 = [(AXPTranslator_iOS *)self axTreeDumpLock];
    [v10 lock];

    unint64_t v11 = [(AXPTranslator_iOS *)self axTreeDumpCurrentChildIndex];
    uint64_t v12 = [(AXPTranslator_iOS *)self axTreeDumpCurrentlyProcessingChildren];
    unint64_t v13 = [v12 count];

    uint64_t v14 = [(AXPTranslator_iOS *)self axTreeDumpCurrentType];
    uint64_t v15 = [(AXPTranslator_iOS *)self axTreeDumpLock];
    [v15 unlock];

    int v16 = objc_msgSend(v14, "isEqualToString:");
    uint64_t v17 = 10;
    if (v16) {
      uint64_t v17 = v13;
    }
    unint64_t v65 = v17;
    if (!v17 || v11 >= v13)
    {
LABEL_40:
      v59 = [(AXPTranslator_iOS *)self axTreeDumpLock];
      [v59 lock];

      [(AXPTranslator_iOS *)self setAxTreeDumpCurrentChildIndex:v11];
      v60 = [(AXPTranslator_iOS *)self axTreeDumpLock];
      [v60 unlock];

      dispatch_time_t v61 = dispatch_time(0, 0);
      v62 = [(AXPTranslator_iOS *)self axTreeDumpSharedBackgroundQueue];
      v71[0] = MEMORY[0x263EF8330];
      v71[1] = 3221225472;
      v71[2] = __72__AXPTranslator_iOS_axTreeDumpGenerateNextSetOfElementAttrsOnMainThread__block_invoke_2;
      v71[3] = &unk_2649DEF48;
      v71[4] = self;
      dispatch_after(v61, v62, v71);

      return;
    }
    uint64_t v68 = 0;
    v63 = @"actions";
    v64 = v14;
    unint64_t v18 = 0x263EFF000uLL;
    while (1)
    {
      id v19 = [(AXPTranslator_iOS *)self axTreeDumpLock];
      [v19 lock];

      id v20 = [(AXPTranslator_iOS *)self axTreeDumpCurrentlyProcessingChildren];
      int64_t v21 = [v20 axSafeObjectAtIndex:v11];

      uint64_t v22 = [(AXPTranslator_iOS *)self axTreeDumpLock];
      [v22 unlock];

      if (!v21) {
        goto LABEL_40;
      }
      unint64_t v69 = v11;
      if ([v14 isEqualToString:@"AXPTreeDumpTypeInitialDump"])
      {
        uint64_t v23 = [(AXPTranslator_iOS *)self _topPriorityAXTreeAttrValues];
      }
      else
      {
        if (![v14 isEqualToString:@"AXPTreeDumpTypeAdditionalData"]) {
          goto LABEL_16;
        }
        uint64_t v23 = [(AXPTranslator_iOS *)self _allAXTreeAttrValues];
      }
      uint64_t v24 = (void *)v23;

      unint64_t v9 = v24;
LABEL_16:
      uint64_t v25 = objc_alloc_init(AXPTranslatorRequest);
      [(AXPTranslatorRequest *)v25 setTranslation:v21];
      v82 = @"attributes";
      v83 = v9;
      v67 = v9;
      uint64_t v26 = [*(id *)(v18 + 2352) dictionaryWithObjects:&v83 forKeys:&v82 count:1];
      [(AXPTranslatorRequest *)v25 setParameters:v26];

      v66 = v25;
      uint64_t v27 = [(AXPTranslator_iOS *)self processMultipleAttributeRequest:v25 removeEmptyValue:0];
      [v27 setAssociatedTranslationObject:v21];
      [v27 setAssociatedRequestType:5];
      v70 = v27;
      [(AXPTranslator_iOS *)self _safelyAddAXTreeDumpResponseToCurrentOutput:v27];
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      uint64_t v28 = [(AXPTranslator_iOS *)self _allAXTreeCanSetAttrValues];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v72 objects:v81 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v73 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = [*(id *)(*((void *)&v72 + 1) + 8 * i) unsignedIntegerValue];
            id v34 = objc_alloc_init(AXPTranslatorRequest);
            [(AXPTranslatorRequest *)v34 setAttributeType:v33];
            [(AXPTranslatorRequest *)v34 setTranslation:v21];
            uint64_t v35 = [(AXPTranslator_iOS *)self processCanSetAttribute:v34];
            [v35 setAssociatedTranslationObject:v21];
            [v35 setAttribute:v33];
            [v35 setAssociatedRequestType:3];
            uint64_t v36 = [v35 resultData];

            if (v36) {
              [(AXPTranslator_iOS *)self _safelyAddAXTreeDumpResponseToCurrentOutput:v35];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v72 objects:v81 count:16];
        }
        while (v30);
      }

      BOOL v37 = [v70 resultData];
      unint64_t v18 = 0x263EFF000uLL;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v39 = [v70 resultData];
        v40 = [v39 objectForKeyedSubscript:&unk_26E241AF0];
      }
      else
      {
        v40 = 0;
      }
      uint64_t v14 = v64;
      unint64_t v41 = v69;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v42 = [(AXPTranslator_iOS *)self axTreeDumpLock];
        [v42 lock];

        id v43 = [(AXPTranslator_iOS *)self axTreeDumpCurrentlyProcessingChildren];
        [v43 addObjectsFromArray:v40];

        id v44 = [(AXPTranslator_iOS *)self axTreeDumpLock];
        [v44 unlock];
      }
      if ([v64 isEqualToString:@"AXPTreeDumpTypeAdditionalData"])
      {
        long long v45 = objc_alloc_init(AXPTranslatorRequest);
        v79 = v63;
        long long v46 = [(AXPTranslator_iOS *)self _allAXTreeActions];
        v80 = v46;
        long long v47 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
        [(AXPTranslatorRequest *)v45 setParameters:v47];

        [(AXPTranslatorRequest *)v45 setTranslation:v21];
        long long v48 = [(AXPTranslator_iOS *)self processSupportedActions:v45];
        [v48 setAssociatedTranslationObject:v21];
        [v48 setAssociatedRequestType:9];
        long long v49 = [v48 resultData];

        if (v49) {
          [(AXPTranslator_iOS *)self _safelyAddAXTreeDumpResponseToCurrentOutput:v48];
        }
        long long v50 = objc_alloc_init(AXPTranslatorRequest);
        v77 = @"attributes";
        long long v51 = [(AXPTranslator_iOS *)self _allAXTreeAttrValues];
        v78 = v51;
        long long v52 = [NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
        [(AXPTranslatorRequest *)v50 setParameters:v52];

        [(AXPTranslatorRequest *)v50 setTranslation:v21];
        v53 = [(AXPTranslator_iOS *)self processSupportsAttributes:v50];
        [v53 setAssociatedTranslationObject:v21];
        [v53 setAssociatedRequestType:10];
        uint64_t v54 = [v53 resultData];

        if (v54) {
          [(AXPTranslator_iOS *)self _safelyAddAXTreeDumpResponseToCurrentOutput:v53];
        }

        unint64_t v41 = v69;
        unint64_t v18 = 0x263EFF000;
      }
      unint64_t v11 = v41 + 1;
      long long v55 = [(AXPTranslator_iOS *)self axTreeDumpLock];
      [v55 lock];

      long long v56 = [(AXPTranslator_iOS *)self axTreeDumpCurrentlyProcessingChildren];
      unint64_t v57 = [v56 count];

      uint64_t v58 = [(AXPTranslator_iOS *)self axTreeDumpLock];
      [v58 unlock];

      if (++v68 >= v65)
      {
        unint64_t v9 = v67;
        goto LABEL_40;
      }
      unint64_t v9 = v67;
      if (v11 >= v57) {
        goto LABEL_40;
      }
    }
  }
  id v5 = AXPlatformTranslationLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v85 = "-[AXPTranslator_iOS axTreeDumpGenerateNextSetOfElementAttrsOnMainThread]";
    _os_log_impl(&dword_22E850000, v5, OS_LOG_TYPE_INFO, "%s: shouldStopGeneratingAXTree", buf, 0xCu);
  }

  id v6 = [(AXPTranslator_iOS *)self axTreeDumpLock];
  [v6 lock];

  [(AXPTranslator_iOS *)self setShouldStopGeneratingAXTree:0];
  unint64_t v7 = [(AXPTranslator_iOS *)self axTreeDumpLock];
  [v7 unlock];

  uint64_t v8 = [(AXPTranslator_iOS *)self axTreeDumpSharedBackgroundQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__AXPTranslator_iOS_axTreeDumpGenerateNextSetOfElementAttrsOnMainThread__block_invoke;
  block[3] = &unk_2649DEF48;
  block[4] = self;
  dispatch_async(v8, block);
}

- (void)generateAXTreeDumpTypeOnBackgroundThread:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(AXPTranslator_iOS *)self axTreeDumpSharedBackgroundQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = AXRequestingClient();
  id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(AXPTranslator_iOS *)self _axTreeDumpCleanUpState];
  [(AXPTranslator_iOS *)self setAxTreeDumpCompletionHandler:v6];

  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  unint64_t v11 = objc_alloc_init(AXPTranslatorRequest);
  uint64_t v12 = [(AXPTranslator_iOS *)self _processFrontMostAppForContinuity:v11];
  [v12 setAssociatedRequestType:4];
  [v34 addObject:v12];
  unint64_t v13 = [v12 translationResponse];

  if (v13)
  {
    uint64_t v33 = v9;
    uint64_t v14 = [v12 translationResponse];
    [v10 addObject:v14];

    AXOverrideRequestingClientType();
    uint64_t v15 = +[AXPTranslator_iOS sharedInstance];
    int v16 = [v12 translationResponse];
    uint64_t v17 = (const void *)[v15 createPlatformElementFromTranslationObject:v16];

    unint64_t v18 = (void *)MEMORY[0x263F21690];
    id v19 = objc_opt_new();
    id v20 = [v18 uiElementWithAXElement:v17 cache:v19];

    [v20 setAXAttribute:3071 withNumber:MEMORY[0x263EFFA88]];
    uint64_t v21 = [(AXPTranslator_iOS *)self frontmostAppOnContinuityDisplay];
    if (v21)
    {
      uint64_t v22 = (void *)v21;
      uint64_t v23 = [(AXPTranslator_iOS *)self frontmostAppOnContinuityDisplay];
      char v24 = [v20 isEqual:v23];

      if ((v24 & 1) == 0)
      {
        uint64_t v25 = [(AXPTranslator_iOS *)self frontmostAppOnContinuityDisplay];
        [v25 setAXAttribute:3071 withNumber:MEMORY[0x263EFFA80]];

        [(AXPTranslator_iOS *)self setFrontmostAppOnContinuityDisplay:v20];
      }
    }
    if (v17) {
      CFRelease(v17);
    }

    uint64_t v9 = v33;
  }
  if (v9 == 2)
  {
    uint64_t v26 = (void *)MEMORY[0x263EFF980];
    uint64_t v27 = [(AXPTranslator_iOS *)self _frontmostAppChildrenForXCTest];
    uint64_t v28 = [v26 arrayWithArray:v27];

    id v10 = (id)v28;
  }
  uint64_t v29 = [(AXPTranslator_iOS *)self axTreeDumpLock];
  [v29 lock];

  uint64_t v30 = (void *)[v10 mutableCopy];
  [(AXPTranslator_iOS *)self setAxTreeDumpCurrentlyProcessingChildren:v30];

  [(AXPTranslator_iOS *)self setAxTreeDumpCurrentType:v7];
  uint64_t v31 = (void *)[v34 mutableCopy];
  [(AXPTranslator_iOS *)self setAxTreeDumpCurrentOutput:v31];

  uint64_t v32 = [(AXPTranslator_iOS *)self axTreeDumpLock];
  [v32 unlock];

  [(AXPTranslator_iOS *)self fetchNextSetOfElementAttrsOnBackgroundThreadWithEarlyTermination:0];
}

- (void)_safelyAddAXTreeDumpResponseToCurrentOutput:(id)a3
{
  id v4 = a3;
  id v5 = [v4 resultData];
  id v6 = [(AXPTranslator_iOS *)self _postProcessResultDataForSecureCoding:v5];

  if (v6)
  {
    [v4 setResultData:v6];
    id v7 = [(AXPTranslator_iOS *)self axTreeDumpLock];
    [v7 lock];

    uint64_t v8 = [(AXPTranslator_iOS *)self axTreeDumpCurrentOutput];
    [v8 addObject:v4];

    uint64_t v9 = [(AXPTranslator_iOS *)self axTreeDumpLock];
    [v9 unlock];
  }
  else
  {
    uint64_t v9 = AXPlatformTranslationLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AXPTranslator_iOS _safelyAddAXTreeDumpResponseToCurrentOutput:](v4, v9);
    }
  }
}

- (id)_postProcessResultDataForSecureCoding:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v4];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __59__AXPTranslator_iOS__postProcessResultDataForSecureCoding___block_invoke;
    v20[3] = &unk_2649DEFE0;
    v20[4] = self;
    id v6 = v5;
    id v21 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v20];
    if ([v6 count] || !objc_msgSend(v4, "count")) {
      id v7 = (id)[v6 copy];
    }
    else {
      id v7 = 0;
    }
    uint64_t v9 = v21;
LABEL_19:

    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v4];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    void v18[2] = __59__AXPTranslator_iOS__postProcessResultDataForSecureCoding___block_invoke_2;
    v18[3] = &unk_2649DF008;
    v18[4] = self;
    id v6 = v8;
    id v19 = v6;
    [v4 enumerateObjectsUsingBlock:v18];
    if ([v6 count] || !objc_msgSend(v4, "count")) {
      id v7 = (id)[v6 copy];
    }
    else {
      id v7 = 0;
    }
    uint64_t v9 = v19;
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 1;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __59__AXPTranslator_iOS__postProcessResultDataForSecureCoding___block_invoke_3;
    void v13[3] = &unk_2649DF030;
    v13[4] = self;
    v13[5] = &v14;
    [v4 enumerateAttributesUsingBlock:v13];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [(id)objc_opt_class() supportsSecureCoding])
      {
        id v7 = v4;
      }
      else
      {
        id v7 = 0;
      }
      goto LABEL_20;
    }
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 1;
    uint64_t v10 = [v4 length];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __59__AXPTranslator_iOS__postProcessResultDataForSecureCoding___block_invoke_4;
    v12[3] = &unk_2649DF030;
    v12[4] = self;
    void v12[5] = &v14;
    objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v12);
  }
  if (*((unsigned char *)v15 + 24)) {
    id v7 = v4;
  }
  else {
    id v7 = 0;
  }
  _Block_object_dispose(&v14, 8);
LABEL_20:

  return v7;
}

- (id)_frontmostAppChildrenForXCTest
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v3 = [(AXPTranslator_iOS *)self processFrontMostApp:0];
  id v4 = [v3 translationResponse];
  id v5 = [(AXPTranslator_iOS *)self createPlatformElementFromTranslationObject:v4];

  id v6 = [MEMORY[0x263F21690] uiElementWithAXElement:v5];
  id v7 = [v6 arrayWithAXAttribute:5001];
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = -[AXPTranslator_iOS translationObjectFromPlatformElement:](self, "translationObjectFromPlatformElement:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  if (v5) {
    CFRelease(v5);
  }

  return v8;
}

- (id)_allAXTreeActions
{
  if (_allAXTreeActions_onceAttrToken != -1) {
    dispatch_once(&_allAXTreeActions_onceAttrToken, &__block_literal_global_570);
  }
  int v2 = (void *)_allAXTreeActions_actionValues;

  return v2;
}

- (id)_topPriorityAXTreeAttrValues
{
  if (_topPriorityAXTreeAttrValues_onceAttrToken != -1) {
    dispatch_once(&_topPriorityAXTreeAttrValues_onceAttrToken, &__block_literal_global_572);
  }
  int v2 = (void *)_topPriorityAXTreeAttrValues_attributeValues;

  return v2;
}

- (id)_allAXTreeCanSetAttrValues
{
  if (_allAXTreeCanSetAttrValues_onceAttrToken != -1) {
    dispatch_once(&_allAXTreeCanSetAttrValues_onceAttrToken, &__block_literal_global_623);
  }
  int v2 = (void *)_allAXTreeCanSetAttrValues_attributeValues;

  return v2;
}

- (id)_allAXTreeAttrValues
{
  if (_allAXTreeAttrValues_onceAttrToken != -1) {
    dispatch_once(&_allAXTreeAttrValues_onceAttrToken, &__block_literal_global_632);
  }
  int v2 = (void *)_allAXTreeAttrValues_attributeValues;

  return v2;
}

- (id)processHitTest:(id)a3
{
  id v4 = a3;
  [v4 clientType];
  AXOverrideRequestingClientType();
  id v5 = [v4 parameters];
  id v6 = [v5 objectForKeyedSubscript:@"point"];
  *(_OWORD *)cf = *MEMORY[0x263F00148];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if (!strcmp((const char *)[v7 objCType], "{CGPoint=dd}")) {
      [v7 getValue:cf];
    }
  }

  CFTypeRef v9 = cf[0];
  CFTypeRef v8 = cf[1];

  uint64_t v10 = [v4 parameters];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"displayId"];
  int v12 = [v11 unsignedIntValue];

  unint64_t v13 = [v4 parameters];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"contextId"];
  uint64_t v15 = [v14 unsignedIntValue];

  long long v16 = [v4 translation];
  long long v17 = [v16 rawElementData];
  long long v18 = (const __AXUIElement *)_AXUIElementCreateWithData();

  pid_t pid = [v16 pid];
  if (!pid)
  {
    if (([v16 didPopuldateAppInfo] & 1) != 0
      || (AXUIElementGetPid(v18, &pid),
          [v16 setPid:pid],
          [v16 setIsApplicationElement:AXUIElementIsApplication()],
          [v16 setDidPopuldateAppInfo:1],
          !pid))
    {
      char v24 = [(AXPTranslator *)self systemAppDelegate];
      char v25 = objc_opt_respondsToSelector();

      if (v25)
      {
        uint64_t v26 = [(AXPTranslator *)self systemAppDelegate];
        uint64_t v27 = [v26 frontmostProcessPids];
        uint64_t v28 = [v27 firstObject];
        pid_t pid = [v28 intValue];
      }
    }
  }
  cf[0] = 0;
  long long v19 = objc_opt_new();
  if (!pid)
  {
    uint64_t v22 = [(AXPTranslator_iOS *)self systemWideElement];
    [v22 axElement];
    if (v12) {
      int v29 = AXUIElementCopyElementUsingDisplayIdAtPosition();
    }
    else {
      int v29 = _AXUIElementCopyElementAtPositionWithParams();
    }
    int v23 = v29;
    goto LABEL_21;
  }
  AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid();
  uint64_t v21 = [MEMORY[0x263F21668] elementWithAXUIElement:AppElementWithPid];
  uint64_t v22 = v21;
  if (v15)
  {
    if (v12) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v15 = objc_msgSend(v21, "contextIdForPoint:", *(double *)&v9, *(double *)&v8);
  if (!v12) {
LABEL_8:
  }
    [v22 displayIdForContextId:v15];
LABEL_9:
  AXConvertPointFromHostedCoordinates();
  int v23 = _AXUIElementCopyElementAtPositionWithParams();
  if (AppElementWithPid) {
    CFRelease(AppElementWithPid);
  }
LABEL_21:

  [v19 setError:_convertAXError(v23)];
  if (v18) {
    CFRelease(v18);
  }
  uint64_t v30 = [(AXPTranslator_iOS *)self translationObjectFromPlatformElement:cf[0]];
  [v19 setResultData:v30];
  if (cf[0])
  {
    CFRelease(cf[0]);
    cf[0] = 0;
  }
  AXOverrideRequestingClientType();

  return v19;
}

- (__AXUIElement)createPlatformElementFromTranslationObject:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  cacheQueue = self->_cacheQueue;
  uint64_t v15 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__AXPTranslator_iOS_createPlatformElementFromTranslationObject___block_invoke;
  block[3] = &unk_2649DF058;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(cacheQueue, block);
  id v7 = (__AXUIElement *)v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)translationObjectFromPlatformElement:(__AXUIElement *)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    id v5 = (void *)MEMORY[0x263F21690];
    id v6 = objc_opt_new();
    id v7 = [v5 uiElementWithAXElement:v3 cache:v6];

    CFTypeRef v8 = objc_opt_new();
    uint64_t v9 = _AXUIElementIDForElement();
    objc_msgSend(v8, "setUid:", v9, v10);
    objc_msgSend(v8, "setPid:", objc_msgSend(v7, "pid"));
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    char v24 = __Block_byref_object_copy_;
    char v25 = __Block_byref_object_dispose_;
    id v26 = 0;
    cacheQueue = self->_cacheQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__AXPTranslator_iOS_translationObjectFromPlatformElement___block_invoke;
    block[3] = &unk_2649DF080;
    long long v19 = &v21;
    block[4] = self;
    id v12 = v8;
    id v17 = v12;
    id v13 = v7;
    id v18 = v13;
    id v20 = v3;
    dispatch_sync(cacheQueue, block);
    uint64_t v14 = [(id)v22[5] remoteDescriptionBlock];

    if (!v14) {
      [(id)v22[5] setRemoteDescriptionBlock:&__block_literal_global_797];
    }
    BOOL v3 = (__AXUIElement *)(id)v22[5];

    _Block_object_dispose(&v21, 8);
  }

  return v3;
}

+ (id)translationObjectFromUIKitObject:(id)a3
{
  uint64_t v4 = _AXCreateAXUIElementWithElement();
  if (v4)
  {
    id v5 = (const void *)v4;
    id v6 = [a1 sharedInstance];
    id v7 = [v6 translationObjectFromPlatformElement:v5];

    CFRelease(v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)platformElementFromTranslation:(id)a3
{
  id v4 = a3;
  id v5 = [(AXPTranslator *)self fakeElementCache];
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "objectID"));
  id v7 = [v5 objectForKey:v6];

  if (!v7)
  {
    id v7 = +[AXPIOSPlatformElement platformElementWithTranslationObject:v4];
    CFTypeRef v8 = [(AXPTranslator *)self fakeElementCache];
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "objectID"));
    [v8 setObject:v7 forKey:v9];
  }

  return v7;
}

- (id)translationObjectFromData:(id)a3
{
  id v4 = (const void *)_AXUIElementCreateWithData();
  id v5 = [(AXPTranslator_iOS *)self translationObjectFromPlatformElement:v4];
  if (v4) {
    CFRelease(v4);
  }

  return v5;
}

- (id)remoteTranslationDataWithTranslation:(id)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = [v5 rawElementData];

  if (!v6) {
    goto LABEL_7;
  }
  id v7 = [v5 rawElementData];
  CFTypeRef v8 = (const void *)_AXUIElementCreateWithData();

  CFTypeRef cf = 0;
  int v9 = _AXPAXUIElementReplaceWithRemotePid((uint64_t)v8, &cf, v4);
  if (v8) {
    CFRelease(v8);
  }
  if (v9)
  {
    uint64_t Data = (void *)_AXUIElementCreateData();
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
  }
  else
  {
LABEL_7:
    uint64_t Data = 0;
  }

  return Data;
}

- (BOOL)accessibilityEnabled
{
  return self->_accessibilityEnabled;
}

- (__AXObserver)axEventObserver
{
  return self->_axEventObserver;
}

- (void)setAxEventObserver:(__AXObserver *)a3
{
}

- (void)setAxTreeDumpSharedBackgroundQueue:(id)a3
{
}

- (void)setSystemAppElement:(id)a3
{
}

- (AXUIElement)systemWideElement
{
  return self->_systemWideElement;
}

- (void)setSystemWideElement:(id)a3
{
}

- (AXUIElement)frontmostAppOnContinuityDisplay
{
  return self->_frontmostAppOnContinuityDisplay;
}

- (void)setFrontmostAppOnContinuityDisplay:(id)a3
{
}

- (BOOL)shouldHonorGroupsForElementTraversal
{
  return self->_shouldHonorGroupsForElementTraversal;
}

- (void)setShouldHonorGroupsForElementTraversal:(BOOL)a3
{
  self->_shouldHonorGroupsForElementTraversal = a3;
}

- (id)axTreeDumpCompletionHandler
{
  return self->_axTreeDumpCompletionHandler;
}

- (void)setAxTreeDumpCompletionHandler:(id)a3
{
}

- (NSLock)axTreeDumpLock
{
  return self->_axTreeDumpLock;
}

- (void)setAxTreeDumpLock:(id)a3
{
}

- (BOOL)shouldStopGeneratingAXTree
{
  return self->_shouldStopGeneratingAXTree;
}

- (void)setShouldStopGeneratingAXTree:(BOOL)a3
{
  self->_shouldStopGeneratingAXTree = a3;
}

- (int64_t)axTreeDumpCurrentChildIndex
{
  return self->_axTreeDumpCurrentChildIndex;
}

- (void)setAxTreeDumpCurrentChildIndex:(int64_t)a3
{
  self->_axTreeDumpCurrentChildIndex = a3;
}

- (NSString)axTreeDumpCurrentType
{
  return self->_axTreeDumpCurrentType;
}

- (void)setAxTreeDumpCurrentType:(id)a3
{
}

- (NSMutableArray)axTreeDumpCurrentlyProcessingChildren
{
  return self->_axTreeDumpCurrentlyProcessingChildren;
}

- (void)setAxTreeDumpCurrentlyProcessingChildren:(id)a3
{
}

- (NSMutableArray)axTreeDumpCurrentOutput
{
  return self->_axTreeDumpCurrentOutput;
}

- (void)setAxTreeDumpCurrentOutput:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axTreeDumpCurrentOutput, 0);
  objc_storeStrong((id *)&self->_axTreeDumpCurrentlyProcessingChildren, 0);
  objc_storeStrong((id *)&self->_axTreeDumpCurrentType, 0);
  objc_storeStrong((id *)&self->_axTreeDumpLock, 0);
  objc_storeStrong(&self->_axTreeDumpCompletionHandler, 0);
  objc_storeStrong((id *)&self->_frontmostAppOnContinuityDisplay, 0);
  objc_storeStrong((id *)&self->_systemWideElement, 0);
  objc_storeStrong((id *)&self->_systemAppElement, 0);
  objc_storeStrong((id *)&self->_axTreeDumpSharedBackgroundQueue, 0);
  objc_storeStrong((id *)&self->_threadSemaphore, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_cachedElements, 0);
  objc_storeStrong((id *)&self->_backTranslationCache, 0);

  objc_storeStrong((id *)&self->_translationCache, 0);
}

- (void)_safelyAddAXTreeDumpResponseToCurrentOutput:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 resultData];
  int v4 = 136315394;
  id v5 = "-[AXPTranslator_iOS _safelyAddAXTreeDumpResponseToCurrentOutput:]";
  __int16 v6 = 2112;
  id v7 = v3;
  _os_log_error_impl(&dword_22E850000, a2, OS_LOG_TYPE_ERROR, "%s: resultData does not conform to NSSecureCoding: %@", (uint8_t *)&v4, 0x16u);
}

@end