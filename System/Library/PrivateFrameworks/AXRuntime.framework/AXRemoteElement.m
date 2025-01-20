@interface AXRemoteElement
+ (BOOL)_isSerializableAccessibilityElement;
+ (BOOL)registerRemoteElement:(id)a3 remotePort:(unsigned int)a4;
+ (id)registeredRemoteElements;
+ (id)remoteElementForBlock:(id)a3;
+ (id)remoteElementsForBlock:(id)a3;
+ (id)remoteElementsForContextId:(unsigned int)a3;
+ (void)initialize;
- (AXRemoteElement)initWithUUID:(id)a3 andRemotePid:(int)a4 andContextId:(unsigned int)a5;
- (AXRemoteElementChildrenDelegate)remoteChildrenDelegate;
- (BOOL)_accessibilityHasVisibleFrame;
- (BOOL)_accessibilityIsGroupedParent;
- (BOOL)_accessibilitySetNativeFocus;
- (BOOL)deniesDirectAppConnection;
- (BOOL)onClientSide;
- (CGRect)accessibilityFrame;
- (NSString)uuid;
- (id)_accessibilityActiveKeyboard;
- (id)_accessibilityFirstElement;
- (id)_accessibilityHandwritingElement;
- (id)_accessibilityLastElement;
- (id)_accessibilityResponderElement;
- (id)_accessibilitySortedElementsWithin;
- (id)_accessibilityTextOperations;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)_remoteElementWithAttribute:(int64_t)a3 limitToRemoteSubviews:(BOOL)a4;
- (id)accessibilityContainer;
- (id)accessibilityElements;
- (id)contextRetrieval;
- (id)description;
- (id)pidRetrieval;
- (int)remotePid;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)uuidHash;
- (unsigned)_accessibilityContextId;
- (unsigned)contextId;
- (unsigned)machPort;
- (void)_accessibilityIncreaseSelection:(id)a3;
- (void)_accessibilitySetFocusOnElement:(BOOL)a3;
- (void)_getRemoteValuesOffMainThread:(id)a3;
- (void)dealloc;
- (void)getLeafElementsFromRemoteSide:(id)a3;
- (void)setAccessibilityContainer:(id)a3;
- (void)setContextId:(unsigned int)a3;
- (void)setContextRetrieval:(id)a3;
- (void)setDeniesDirectAppConnection:(BOOL)a3;
- (void)setMachPort:(unsigned int)a3;
- (void)setOnClientSide:(BOOL)a3;
- (void)setPidRetrieval:(id)a3;
- (void)setRemoteChildrenDelegate:(id)a3;
- (void)setRemotePid:(int)a3;
- (void)setUuid:(id)a3;
- (void)unregister;
@end

@implementation AXRemoteElement

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_9);
  }
}

uint64_t __29__AXRemoteElement_initialize__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v1 = (void *)Cache;
  Cache = (uint64_t)v0;

  CacheLock = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28E08]);
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (AXRemoteElement)initWithUUID:(id)a3 andRemotePid:(int)a4 andContextId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AXRemoteElement;
  v9 = [(AXRemoteElement *)&v15 init];
  v10 = v9;
  if (v9)
  {
    [(AXRemoteElement *)v9 setUuid:v8];
    [(AXRemoteElement *)v10 setRemotePid:v6];
    [(AXRemoteElement *)v10 setContextId:v5];
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    allChildren = v10->_allChildren;
    v10->_allChildren = v11;

    [(id)CacheLock lock];
    [(id)Cache addObject:v10];
    [(id)CacheLock unlock];
    v13 = v10;
  }

  return v10;
}

- (unsigned)contextId
{
  v3 = [(AXRemoteElement *)self contextRetrieval];

  if (!v3) {
    return self->_contextId;
  }
  v4 = [(AXRemoteElement *)self contextRetrieval];
  unsigned int v5 = v4[2]();

  return v5;
}

- (int)remotePid
{
  v3 = [(AXRemoteElement *)self pidRetrieval];

  if (!v3) {
    return self->_remotePid;
  }
  v4 = [(AXRemoteElement *)self pidRetrieval];
  int v5 = v4[2]();

  return v5;
}

- (unsigned)_accessibilityContextId
{
  v4.receiver = self;
  v4.super_class = (Class)AXRemoteElement;
  unsigned int result = [(AXRemoteElement *)&v4 _accessibilityContextId];
  if (!result)
  {
    if ([(AXRemoteElement *)self onClientSide]) {
      return 0;
    }
    else {
      return [(AXRemoteElement *)self contextId];
    }
  }
  return result;
}

- (id)_accessibilityTextOperations
{
  v2 = [(AXRemoteElement *)self accessibilityContainer];
  v3 = [v2 _accessibilityTextOperations];

  return v3;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  if ([(AXRemoteElement *)self onClientSide])
  {
    v3 = [(AXRemoteElement *)self accessibilityContainer];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AXRemoteElement;
    v3 = [(AXRemoteElement *)&v5 _accessibilityTextViewTextOperationResponder];
  }
  return v3;
}

- (id)_accessibilityHandwritingElement
{
  v2 = self;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(AXRemoteElement *)self accessibilityElements];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(AXRemoteElement *)v2 accessibilityElements];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v2 = (AXRemoteElement *)(id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [(AXRemoteElement *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v2);
          }
          v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "_accessibilityResponderElement", (void)v13);
          if ([v9 _accessibilitySupportsHandwriting])
          {

            goto LABEL_15;
          }
        }
        uint64_t v6 = [(AXRemoteElement *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    v10 = [(AXRemoteElement *)v2 accessibilityContainer];
    if (v10 != v2)
    {
      v11 = v10;
      v9 = [(AXRemoteElement *)v10 _accessibilityHandwritingElement];

      goto LABEL_15;
    }
  }

  v9 = 0;
LABEL_15:
  return v9;
}

- (void)setAccessibilityContainer:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (AXRemoteElement *)a3;
  if (v4 == self)
  {
    uint64_t v5 = AXLogRemoteElement();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v7 = 138412546;
      id v8 = v4;
      __int16 v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1BA657000, v5, OS_LOG_TYPE_DEFAULT, "Attempt made to set accessibilityContainer to self (%@), stack = %@", (uint8_t *)&v7, 0x16u);
    }
  }
  objc_storeWeak(&self->_accessibilityContainer, v4);
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_allChildren;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) setAccessibilityContainer:0];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(AXRemoteElement *)self platformCleanup];
  [(AXRemoteElement *)self setMachPort:0];
  v8.receiver = self;
  v8.super_class = (Class)AXRemoteElement;
  [(AXRemoteElement *)&v8 dealloc];
}

- (unint64_t)uuidHash
{
  v2 = [(AXRemoteElement *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)_getRemoteValuesOffMainThread:(id)a3
{
  id v3 = a3;
  if (_getRemoteValuesOffMainThread__onceToken != -1) {
    dispatch_once(&_getRemoteValuesOffMainThread__onceToken, &__block_literal_global_11);
  }
  memset(&context, 0, sizeof(context));
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  Current = CFRunLoopGetCurrent();
  uint64_t v5 = CFRunLoopSourceCreate(0, 0, &context);
  if (v5) {
    CFRunLoopAddSource(Current, v5, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  }
  uint64_t v6 = _getRemoteValuesOffMainThread__Queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__AXRemoteElement__getRemoteValuesOffMainThread___block_invoke_2;
  v10[3] = &unk_1E6220860;
  id v7 = v3;
  id v11 = v7;
  long long v12 = &v15;
  long long v13 = v5;
  uint64_t v14 = Current;
  dispatch_async(v6, v10);
  if (!*((unsigned char *)v16 + 24))
  {
    CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D418];
    double v9 = 0.0;
    do
    {
      if (v9 >= AXUIElementMessagingTimeout() / 1000.0) {
        break;
      }
      CFRunLoopRunInMode(v8, 0.001, 1u);
      double v9 = v9 + 0.001;
    }
    while (!*((unsigned char *)v16 + 24));
  }

  _Block_object_dispose(&v15, 8);
}

void __49__AXRemoteElement__getRemoteValuesOffMainThread___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("AXRemoteElement-BackgroundFetch", v2);
  v1 = (void *)_getRemoteValuesOffMainThread__Queue;
  _getRemoteValuesOffMainThread__Queue = (uint64_t)v0;
}

void __49__AXRemoteElement__getRemoteValuesOffMainThread___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(__CFRunLoopSource **)(a1 + 48);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  CFRunLoopSourceSignal(v2);
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 56));
  id v3 = *(__CFRunLoopSource **)(a1 + 48);
  if (v3)
  {
    CFRunLoopRemoveSource(*(CFRunLoopRef *)(a1 + 56), v3, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
    uint64_t v4 = *(const void **)(a1 + 48);
    CFRelease(v4);
  }
}

- (void)getLeafElementsFromRemoteSide:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__AXRemoteElement_getLeafElementsFromRemoteSide___block_invoke;
  v6[3] = &unk_1E6220888;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AXRemoteElement *)self _getRemoteValuesOffMainThread:v6];
}

void __49__AXRemoteElement_getLeafElementsFromRemoteSide___block_invoke(uint64_t a1)
{
  v2 = (const void *)_AXUIElementCreateWithPIDAndID([*(id *)(a1 + 32) remotePid], objc_msgSend(*(id *)(a1 + 32), "uuidHash"), 9999);
  id v4 = +[AXUIElement uiElementWithAXElement:v2];
  id v3 = [v4 childrenIncludingPrefetchedAttributesWithCount:1000];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2) {
    CFRelease(v2);
  }
}

- (id)_remoteElementWithAttribute:(int64_t)a3 limitToRemoteSubviews:(BOOL)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid([(AXRemoteElement *)self remotePid]);
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  if ([(AXRemoteElement *)self machPort])
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __69__AXRemoteElement__remoteElementWithAttribute_limitToRemoteSubviews___block_invoke;
    v37[3] = &unk_1E62208B0;
    v37[6] = AppElementWithPid;
    v37[7] = a3;
    v37[4] = self;
    v37[5] = &v38;
    [(AXRemoteElement *)self _getRemoteValuesOffMainThread:v37];
    if (AppElementWithPid) {
      CFRelease(AppElementWithPid);
    }
    if (!v39[3] || (CFTypeID TypeID = AXUIElementGetTypeID(), TypeID != CFGetTypeID((CFTypeRef)v39[3])))
    {
      v20 = 0;
LABEL_20:
      v21 = (AXRemoteElement *)v39[3];
      if (v20 != v21 && v21)
      {
        CFRelease(v21);
        v39[3] = 0;
      }
      goto LABEL_29;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v43 = 0;
    if (!a4)
    {
      v20 = (AXRemoteElement *)v39[3];
      _Block_object_dispose(buf, 8);
      goto LABEL_29;
    }
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    int v36 = 0;
    double v9 = (AXRemoteElement *)v39[3];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __69__AXRemoteElement__remoteElementWithAttribute_limitToRemoteSubviews___block_invoke_2;
    v32[3] = &unk_1E62208D8;
    v32[4] = self;
    v32[5] = &v33;
    v32[6] = &v38;
    v32[7] = buf;
    [(AXRemoteElement *)self _getRemoteValuesOffMainThread:v32];
    if (*((_DWORD *)v34 + 6))
    {
      pid_t pid = 0;
      AXUIElementGetPid((AXUIElementRef)v39[3], &pid);
      pid_t v10 = pid;
      if (v10 == [(AXRemoteElement *)self remotePid])
      {
LABEL_15:
        uint64_t v17 = *(void *)&buf[8];
        char v18 = *(const void **)(*(void *)&buf[8] + 24);
        if (v18)
        {
          CFRelease(v18);
          uint64_t v17 = *(void *)&buf[8];
          *(void *)(*(void *)&buf[8] + 24) = 0;
        }
        AXError v19 = AXUIElementCopyAttributeValue((AXUIElementRef)v39[3], (CFStringRef)0x7E5, (CFTypeRef *)(v17 + 24));
        *((_DWORD *)v34 + 6) = v19;
        if (v19) {
          goto LABEL_39;
        }
      }
      else
      {
        uint64_t v11 = MEMORY[0x1E4F143A8];
        while (1)
        {
          uint64_t v27 = 0;
          v28 = &v27;
          uint64_t v29 = 0x2020000000;
          uint64_t v30 = 0;
          v26[0] = v11;
          v26[1] = 3221225472;
          v26[2] = __69__AXRemoteElement__remoteElementWithAttribute_limitToRemoteSubviews___block_invoke_3;
          v26[3] = &unk_1E6220900;
          v26[4] = &v33;
          v26[5] = &v38;
          v26[6] = &v27;
          [(AXRemoteElement *)self _getRemoteValuesOffMainThread:v26];
          long long v12 = (const __AXUIElement *)v28[3];
          if (*((_DWORD *)v34 + 6)) {
            break;
          }
          if (!v12) {
            goto LABEL_34;
          }
          v39[3] = (uint64_t)v12;
          AXUIElementGetPid(v12, &pid);
          long long v13 = v39;
          uint64_t v14 = (const void *)v39[3];
          if (v14)
          {
            CFRelease(v14);
            long long v13 = v39;
            v39[3] = 0;
          }
          v13[3] = 0;
          pid_t v15 = pid;
          int v16 = [(AXRemoteElement *)self remotePid];
          _Block_object_dispose(&v27, 8);
          if (v15 == v16) {
            goto LABEL_15;
          }
        }
        if (v12)
        {
          CFRelease(v12);
          v28[3] = 0;
        }
LABEL_34:
        _Block_object_dispose(&v27, 8);
        if (*((_DWORD *)v34 + 6)) {
          goto LABEL_39;
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v24 = [*(id *)(*(void *)&buf[8] + 24) unsignedIntValue];
      if (v24 == [(AXRemoteElement *)self contextId]) {
        v20 = v9;
      }
      else {
        v20 = 0;
      }
      goto LABEL_40;
    }
LABEL_39:
    v20 = 0;
LABEL_40:
    _Block_object_dispose(&v33, 8);
    v25 = *(const void **)(*(void *)&buf[8] + 24);
    if (v25)
    {
      CFRelease(v25);
      *(void *)(*(void *)&buf[8] + 24) = 0;
    }
    _Block_object_dispose(buf, 8);
    goto LABEL_20;
  }
  v22 = AXLogRemoteElement();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    _os_log_impl(&dword_1BA657000, v22, OS_LOG_TYPE_INFO, "%@: attempted to get remote element for attribute %ld but there was no mach port", buf, 0x16u);
  }

  if (AppElementWithPid) {
    CFRelease(AppElementWithPid);
  }
  v20 = self;
LABEL_29:
  _Block_object_dispose(&v38, 8);
  return v20;
}

uint64_t __69__AXRemoteElement__remoteElementWithAttribute_limitToRemoteSubviews___block_invoke(uint64_t a1)
{
  _AXUIElementSetMachPortForNextMessage([*(id *)(a1 + 32) machPort]);
  v2 = *(const __AXUIElement **)(a1 + 48);
  CFStringRef v3 = *(const __CFString **)(a1 + 56);
  id v4 = (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return AXUIElementCopyAttributeValue(v2, v3, v4);
}

uint64_t __69__AXRemoteElement__remoteElementWithAttribute_limitToRemoteSubviews___block_invoke_2(uint64_t a1)
{
  _AXUIElementSetMachPortForNextMessage([*(id *)(a1 + 32) machPort]);
  uint64_t result = AXUIElementCopyAttributeValue(*(AXUIElementRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), (CFStringRef)0x7E5, (CFTypeRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __69__AXRemoteElement__remoteElementWithAttribute_limitToRemoteSubviews___block_invoke_3(void *a1)
{
  uint64_t result = AXUIElementCopyAttributeValue(*(AXUIElementRef *)(*(void *)(a1[5] + 8) + 24), (CFStringRef)0x906, (CFTypeRef *)(*(void *)(a1[6] + 8) + 24));
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

- (id)_accessibilityActiveKeyboard
{
  if ([(AXRemoteElement *)self onClientSide])
  {
    CFStringRef v3 = [(AXRemoteElement *)self _remoteElementWithAttribute:2076 limitToRemoteSubviews:0];
  }
  else
  {
    id v4 = [(AXRemoteElement *)self remoteChildrenDelegate];
    CFStringRef v3 = [v4 _accessibilityActiveKeyboard];
  }
  return v3;
}

- (id)_accessibilityResponderElement
{
  return [(AXRemoteElement *)self _remoteElementWithAttribute:3002 limitToRemoteSubviews:1];
}

- (id)_accessibilityFirstElement
{
  return [(AXRemoteElement *)self _remoteElementWithAttribute:3000 limitToRemoteSubviews:1];
}

- (id)_accessibilityLastElement
{
  return [(AXRemoteElement *)self _remoteElementWithAttribute:3016 limitToRemoteSubviews:1];
}

- (BOOL)_accessibilityIsGroupedParent
{
  return 0;
}

- (id)_accessibilitySortedElementsWithin
{
  CFStringRef v3 = [(AXRemoteElement *)self remoteChildrenDelegate];
  id v4 = [v3 accessibilityRemoteSubstituteChildren:self];

  return v4;
}

- (unint64_t)_accessibilityAutomationType
{
  return 83;
}

- (id)accessibilityElements
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFStringRef v3 = [(AXRemoteElement *)self remoteChildrenDelegate];
  id v4 = [v3 accessibilityRemoteSubstituteChildren:self];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_allChildren;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) setAccessibilityContainer:0];
      }
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(NSMutableSet *)self->_allChildren removeAllObjects];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__AXRemoteElement_accessibilityElements__block_invoke;
  v11[3] = &unk_1E6220928;
  v11[4] = self;
  [v4 enumerateObjectsUsingBlock:v11];
  return v4;
}

void __40__AXRemoteElement_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAccessibilityContainer:v3];
  [*(id *)(*(void *)(a1 + 32) + 32) addObject:v4];
}

+ (id)remoteElementForBlock:(id)a3
{
  uint64_t v3 = [a1 remoteElementsForBlock:a3];
  id v4 = [v3 firstObject];

  return v4;
}

+ (id)registeredRemoteElements
{
  return (id)[a1 remoteElementsForBlock:&__block_literal_global_18];
}

uint64_t __43__AXRemoteElement_registeredRemoteElements__block_invoke()
{
  return 1;
}

+ (id)remoteElementsForBlock:(id)a3
{
  id v3 = a3;
  [(id)CacheLock lock];
  id v4 = (void *)Cache;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__AXRemoteElement_remoteElementsForBlock___block_invoke;
  v9[3] = &unk_1E6220970;
  id v5 = v3;
  id v10 = v5;
  uint64_t v6 = [v4 indexesOfObjectsPassingTest:v9];
  if ([v6 count])
  {
    uint64_t v7 = [(id)Cache objectsAtIndexes:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }
  [(id)CacheLock unlock];

  return v7;
}

uint64_t __42__AXRemoteElement_remoteElementsForBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)remoteElementsForContextId:(unsigned int)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__AXRemoteElement_remoteElementsForContextId___block_invoke;
  v5[3] = &__block_descriptor_36_e25_B16__0__AXRemoteElement_8l;
  unsigned int v6 = a3;
  id v3 = [a1 remoteElementsForBlock:v5];
  return v3;
}

BOOL __46__AXRemoteElement_remoteElementsForContextId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contextId] == *(_DWORD *)(a1 + 32);
}

+ (BOOL)registerRemoteElement:(id)a3 remotePort:(unsigned int)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unsigned int v6 = AXLogRemoteElement();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v5;
    _os_log_impl(&dword_1BA657000, v6, OS_LOG_TYPE_INFO, "+[AXRemoteElement registerRemoteElement]: %@", buf, 0xCu);
  }

  uint64_t v7 = [v5 objectForKey:@"ax-pid"];
  uint64_t v8 = [v7 intValue];

  double v9 = [v5 objectForKey:@"ax-context"];
  uint64_t v10 = [v9 unsignedIntValue];

  uint64_t v11 = [v5 objectForKey:@"ax-contextretrieval"];
  long long v12 = [v5 objectForKey:@"ax-pidretrieval"];
  long long v13 = [v5 objectForKey:@"ax-uuid"];
  long long v14 = [v5 objectForKey:@"ax-register"];
  int v15 = [v14 BOOLValue];

  if (v15)
  {
    [(id)CacheLock lock];
    int v16 = (void *)Cache;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __52__AXRemoteElement_registerRemoteElement_remotePort___block_invoke;
    v31[3] = &unk_1E62209B8;
    uint64_t v17 = &v32;
    id v18 = v13;
    id v32 = v18;
    AXError v19 = [v16 indexesOfObjectsPassingTest:v31];
    [(id)CacheLock unlock];
    if ([v19 count])
    {
      v20 = AXLogRemoteElement();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v19;
        _os_log_impl(&dword_1BA657000, v20, OS_LOG_TYPE_INFO, "We don't need to re-register, we already have a remote element that works with this UUID: %@", buf, 0xCu);
      }

      BOOL v21 = 0;
    }
    else
    {
      v25 = [[AXRemoteElement alloc] initWithUUID:v18 andRemotePid:v8 andContextId:v10];
      [(AXRemoteElement *)v25 setContextRetrieval:v11];
      [(AXRemoteElement *)v25 setPidRetrieval:v12];
      [(AXRemoteElement *)v25 setMachPort:a4];
      uint64_t v33 = @"element";
      v34 = v25;
      BOOL v21 = 1;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      uint64_t v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v27 postNotificationName:@"ax_remote_element_registered" object:0 userInfo:v26];
    }
  }
  else
  {
    v22 = AXLogRemoteElement();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v13;
      _os_log_impl(&dword_1BA657000, v22, OS_LOG_TYPE_INFO, "Unregistering remote element: %@", buf, 0xCu);
    }

    [(id)CacheLock lock];
    v23 = (void *)Cache;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __52__AXRemoteElement_registerRemoteElement_remotePort___block_invoke_46;
    v29[3] = &unk_1E62209B8;
    uint64_t v17 = &v30;
    id v30 = v13;
    int v24 = [v23 indexesOfObjectsPassingTest:v29];
    [v23 removeObjectsAtIndexes:v24];

    [(id)CacheLock unlock];
    BOOL v21 = 1;
  }

  return v21;
}

uint64_t __52__AXRemoteElement_registerRemoteElement_remotePort___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __52__AXRemoteElement_registerRemoteElement_remotePort___block_invoke_46(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)setMachPort:(unsigned int)a3
{
  id v5 = (ipc_space_t *)MEMORY[0x1E4F14960];
  if (a3) {
    BOOL v6 = mach_port_mod_refs(*MEMORY[0x1E4F14960], a3, 0, 1) == 0;
  }
  else {
    BOOL v6 = 0;
  }
  mach_port_name_t machPort = self->_machPort;
  if (machPort)
  {
    mach_port_deallocate(*v5, machPort);
    self->_mach_port_name_t machPort = 0;
  }
  if (v6) {
    self->_mach_port_name_t machPort = a3;
  }
}

- (void)unregister
{
  [(id)CacheLock lock];
  [(id)Cache removeObjectIdenticalTo:self];
  id v3 = (void *)CacheLock;
  [v3 unlock];
}

- (CGRect)accessibilityFrame
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [(AXRemoteElement *)self accessibilityElements];
  if ([v3 count])
  {
    CGFloat v4 = *MEMORY[0x1E4F1DB28];
    CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
      CGFloat v12 = v7;
      CGFloat v13 = v6;
      CGFloat v14 = v5;
      CGFloat v15 = v4;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v37.origin.x = v15;
          v37.origin.y = v14;
          v37.size.width = v13;
          v37.size.height = v12;
          v39.origin.x = v4;
          v39.origin.y = v5;
          v39.size.width = v6;
          v39.size.height = v7;
          BOOL v18 = CGRectEqualToRect(v37, v39);
          objc_msgSend(v17, "accessibilityFrame", (void)v31);
          if (!v18)
          {
            v40.origin.x = v15;
            v40.origin.y = v14;
            v40.size.width = v13;
            v40.size.height = v12;
            *(CGRect *)&CGFloat v19 = CGRectUnion(*(CGRect *)&v19, v40);
          }
          CGFloat v15 = v19;
          CGFloat v14 = v20;
          CGFloat v13 = v21;
          CGFloat v12 = v22;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v10);
    }
    else
    {
      CGFloat v12 = v7;
      CGFloat v13 = v6;
      CGFloat v14 = v5;
      CGFloat v15 = v4;
    }
  }
  else
  {
    id v8 = [(AXRemoteElement *)self accessibilityContainer];
    [v8 accessibilityFrame];
    CGFloat v15 = v23;
    CGFloat v14 = v24;
    CGFloat v13 = v25;
    CGFloat v12 = v26;
  }

  double v27 = v15;
  double v28 = v14;
  double v29 = v13;
  double v30 = v12;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (BOOL)_accessibilityHasVisibleFrame
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(AXRemoteElement *)self accessibilityElements];
  if ([v3 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "_accessibilityHasVisibleFrame", (void)v11))
          {
            char v9 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  id v4 = [(AXRemoteElement *)self accessibilityContainer];
  char v9 = [v4 _accessibilityHasVisibleFrame];
LABEL_13:

  return v9;
}

- (void)_accessibilityIncreaseSelection:(id)a3
{
  id v4 = a3;
  id v5 = [(AXRemoteElement *)self accessibilityContainer];
  [v5 _accessibilityIncreaseSelection:v4];
}

- (id)description
{
  long long v14 = NSString;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(AXRemoteElement *)self remotePid];
  uint64_t v5 = [(AXRemoteElement *)self machPort];
  uint64_t v6 = [(AXRemoteElement *)self contextId];
  unint64_t v7 = [(AXRemoteElement *)self uuidHash];
  id v8 = [(AXRemoteElement *)self uuid];
  char v9 = [(AXRemoteElement *)self accessibilityContainer];
  uint64_t v10 = [(AXRemoteElement *)self accessibilityContainer];
  long long v11 = [v10 valueForKey:@"_accessibilityWindow"];
  long long v12 = [v14 stringWithFormat:@"%@:%p - pid: %d, mach port: %d context: %u, uuid hash: %lld uuid: %@\n\tParent: %@[%@]", v3, self, v4, v5, v6, v7, v8, v9, v11];

  return v12;
}

- (void)_accessibilitySetFocusOnElement:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AXRemoteElement *)self accessibilityContainer];
  [v4 _accessibilitySetFocusOnElement:v3];
}

- (BOOL)_accessibilitySetNativeFocus
{
  v2 = [(AXRemoteElement *)self accessibilityContainer];
  char v3 = [v2 _accessibilitySetNativeFocus];

  return v3;
}

- (void)setRemotePid:(int)a3
{
  self->_remotePid = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void)setContextId:(unsigned int)a3
{
  self->_contextId = a3;
}

- (BOOL)onClientSide
{
  return self->_onClientSide;
}

- (void)setOnClientSide:(BOOL)a3
{
  self->_onClientSide = a3;
}

- (AXRemoteElementChildrenDelegate)remoteChildrenDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteChildrenDelegate);
  return (AXRemoteElementChildrenDelegate *)WeakRetained;
}

- (void)setRemoteChildrenDelegate:(id)a3
{
}

- (unsigned)machPort
{
  return self->_machPort;
}

- (id)accessibilityContainer
{
  id WeakRetained = objc_loadWeakRetained(&self->_accessibilityContainer);
  return WeakRetained;
}

- (BOOL)deniesDirectAppConnection
{
  return self->_deniesDirectAppConnection;
}

- (void)setDeniesDirectAppConnection:(BOOL)a3
{
  self->_deniesDirectAppConnection = a3;
}

- (id)contextRetrieval
{
  return self->_contextRetrieval;
}

- (void)setContextRetrieval:(id)a3
{
}

- (id)pidRetrieval
{
  return self->_pidRetrieval;
}

- (void)setPidRetrieval:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pidRetrieval, 0);
  objc_storeStrong(&self->_contextRetrieval, 0);
  objc_destroyWeak(&self->_accessibilityContainer);
  objc_destroyWeak((id *)&self->_remoteChildrenDelegate);
  objc_storeStrong((id *)&self->_allChildren, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end