@interface AXUIElement
+ (__AXUIElement)systemWideAXUIElement;
+ (id)proxiedMLElementsForApp:(id)a3;
+ (id)scrollAncestorAtCoordinate:(CGPoint)a3;
+ (id)uiApplicationAtCoordinate:(CGPoint)a3;
+ (id)uiApplicationForContext:(unsigned int)a3;
+ (id)uiApplicationWithPid:(int)a3;
+ (id)uiElementAtCoordinate:(CGPoint)a3;
+ (id)uiElementAtCoordinate:(CGPoint)a3 displayId:(unsigned int)a4;
+ (id)uiElementAtCoordinate:(CGPoint)a3 forApplication:(__AXUIElement *)a4 contextId:(unsigned int)a5;
+ (id)uiElementAtCoordinate:(CGPoint)a3 forApplication:(__AXUIElement *)a4 contextId:(unsigned int)a5 displayId:(unsigned int)a6;
+ (id)uiElementAtCoordinate:(CGPoint)a3 startWithElement:(id)a4;
+ (id)uiElementWithAXElement:(__AXUIElement *)a3;
+ (id)uiElementWithAXElement:(__AXUIElement *)a3 cache:(id)a4;
+ (id)uiSystemWideApplication;
+ (void)applyElementAttributeCacheScheme:(unint64_t)a3;
+ (void)applyElementCustomAttributeCacheScheme:(id)a3;
+ (void)initialize;
- (AXUIElement)initWithAXElement:(__AXUIElement *)a3;
- (AXUIElement)initWithAXElement:(__AXUIElement *)a3 cache:(id)a4;
- (BOOL)BOOLWithAXAttribute:(int64_t)a3;
- (BOOL)canPerformAXAction:(int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMLElement;
- (BOOL)isMockElement;
- (BOOL)isValid;
- (BOOL)isValidForApplication:(id)a3;
- (BOOL)performAXAction:(int)a3;
- (BOOL)performAXAction:(int)a3 withValue:(id)a4;
- (BOOL)performAXAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5;
- (CGColor)colorWithAXAttribute:(int64_t)a3;
- (CGPath)pathWithAXAttribute:(int64_t)a3;
- (CGPoint)pointWithAXAttribute:(int64_t)a3;
- (CGRect)rectWithAXAttribute:(int64_t)a3;
- (NSDictionary)cachedAttributes;
- (NSMutableDictionary)copyCachedAttributes;
- (_NSRange)_lineRangeForPosition:(unint64_t)a3;
- (_NSRange)_lineRangeWithFaultTolerance:(int64_t)a3 forward:(BOOL)a4;
- (_NSRange)_selectedTextRange;
- (_NSRange)nextCursorRangeInDirection:(unint64_t)a3 unit:(unint64_t)a4 outputRange:(_NSRange *)a5;
- (_NSRange)nextCursorRangeInDirection:(unint64_t)a3 unit:(unint64_t)a4 outputRange:(_NSRange *)a5 currentCursorRange:(_NSRange)a6;
- (_NSRange)rangeWithAXAttribute:(int64_t)a3;
- (__AXUIElement)axElement;
- (id)_attributedValueForRange:(_NSRange)a3;
- (id)_elementsWithParameter:(int64_t)a3 parameters:(id)a4 prefetchAttributes:(BOOL)a5;
- (id)_objectForRange:(_NSRange)a3 withParameterizedAttribute:(int64_t)a4;
- (id)_outputCache;
- (id)_valueForRange:(_NSRange)a3;
- (id)arrayWithAXAttribute:(int64_t)a3;
- (id)childrenIncludingPrefetchedAttributesWithCount:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)nextElementsIncludingPrefetchedAttributesWithCount:(unint64_t)a3;
- (id)nextElementsWithCount:(unint64_t)a3;
- (id)nextElementsWithParameters:(id)a3;
- (id)numberWithAXAttribute:(int64_t)a3;
- (id)objectWithAXAttribute:(int64_t)a3;
- (id)objectWithAXAttribute:(int64_t)a3 parameter:(void *)a4;
- (id)previousElementsWithCount:(unint64_t)a3;
- (id)previousElementsWithParameters:(id)a3;
- (id)stringWithAXAttribute:(int64_t)a3;
- (id)uiElementsWithAttribute:(int64_t)a3;
- (id)uiElementsWithAttribute:(int64_t)a3 parameter:(void *)a4;
- (id)uiElementsWithAttribute:(int64_t)a3 parameter:(void *)a4 fetchAttributes:(BOOL)a5;
- (id)valueArrayWithAXAttributes:(__CFArray *)a3;
- (int)pid;
- (int64_t)_lineEndPosition;
- (int64_t)_lineStartPosition;
- (unint64_t)hash;
- (unsigned)_activeKeyboardContextId;
- (void)_cachedValueForAttribute:(int64_t)a3;
- (void)_createCache:(BOOL)a3;
- (void)_invalidate;
- (void)_setCachedValue:(void *)a3 forAttribute:(int64_t)a4;
- (void)dealloc;
- (void)disableCache;
- (void)enableCache:(BOOL)a3;
- (void)modifyStaticCacheValue:(void *)a3;
- (void)setAXAttribute:(int64_t)a3 withArray:(id)a4;
- (void)setAXAttribute:(int64_t)a3 withBOOL:(BOOL)a4;
- (void)setAXAttribute:(int64_t)a3 withFloat:(float)a4;
- (void)setAXAttribute:(int64_t)a3 withLong:(int64_t)a4;
- (void)setAXAttribute:(int64_t)a3 withNumber:(id)a4;
- (void)setAXAttribute:(int64_t)a3 withObject:(id)a4;
- (void)setAXAttribute:(int64_t)a3 withObject:(id)a4 synchronous:(BOOL)a5;
- (void)setAXAttribute:(int64_t)a3 withPoint:(CGPoint)a4;
- (void)setAXAttribute:(int64_t)a3 withRange:(_NSRange)a4;
- (void)setAXAttribute:(int64_t)a3 withSize:(CGSize)a4;
- (void)setAXAttribute:(int64_t)a3 withString:(id)a4;
- (void)setAXAttribute:(int64_t)a3 withUIElement:(id)a4;
- (void)setAXAttribute:(int64_t)a3 withUIElementArray:(id)a4;
- (void)setAXElement:(__AXUIElement *)a3;
- (void)setCachedAttributes:(id)a3;
- (void)updateCache:(int64_t)a3;
- (void)updateCacheWithAttributes:(id)a3;
@end

@implementation AXUIElement

- (id)copyWithZone:(_NSZone *)a3
{
  Data = _AXUIElementCreateData((const UInt8 *)self->_axElement);
  CFDataRef v5 = _AXUIElementCreateWithData(Data);
  v6 = [(AXUIElement *)self copyCachedAttributes];
  v7 = +[AXUIElement uiElementWithAXElement:v5 cache:v6];

  if (Data) {
    CFRelease(Data);
  }
  if (v5) {
    CFRelease(v5);
  }
  return v7;
}

+ (__AXUIElement)systemWideAXUIElement
{
  return (__AXUIElement *)_SCRSystemWideAXUIElementRef;
}

+ (id)uiSystemWideApplication
{
  return (id)_SCRSystemWideUIElement;
}

+ (void)applyElementAttributeCacheScheme:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C978]), "initWithObjects:", &unk_1F1423428, &unk_1F1423440, &unk_1F1423458, &unk_1F1423470, &unk_1F1423488, &unk_1F14234A0, &unk_1F14234B8, &unk_1F14234D0, &unk_1F14234E8, &unk_1F1423500, &unk_1F1423518, &unk_1F1423530, &unk_1F1423548, &unk_1F1423560, &unk_1F1423578, &unk_1F1423590, &unk_1F14235A8,
                     &unk_1F14235C0,
                     &unk_1F14235D8,
                     &unk_1F14235F0,
                     &unk_1F1423608,
                     &unk_1F1423620,
                     &unk_1F1423638,
                     &unk_1F1423650,
                     &unk_1F1423668,
                     &unk_1F1423680,
                     &unk_1F1423698,
                     &unk_1F14236B0,
                     &unk_1F14236C8,
                     &unk_1F14236E0,
                     &unk_1F14236F8,
                     &unk_1F1423710,
                     &unk_1F1423728,
                     &unk_1F1423740,
                     &unk_1F1423758,
                     &unk_1F1423770,
                     &unk_1F1423788,
                     &unk_1F14237A0,
                     &unk_1F14237B8,
                     &unk_1F14237D0,
                     &unk_1F14237E8,
                     &unk_1F1423800,
                     &unk_1F1423818,
                     &unk_1F1423830,
                     &unk_1F1423848,
                     &unk_1F1423860,
                     &unk_1F14237D0,
                     &unk_1F14237B8,
                     &unk_1F1423878,
                     &unk_1F1423890,
                     &unk_1F14238A8,
                     &unk_1F14238C0,
                     &unk_1F14238D8,
                     0);
      goto LABEL_13;
    case 2uLL:
      id v4 = objc_allocWithZone(MEMORY[0x1E4F1C978]);
      v21 = &unk_1F1423950;
      v23 = 0;
      goto LABEL_7;
    case 3uLL:
      id v4 = objc_allocWithZone(MEMORY[0x1E4F1C978]);
      v25 = &unk_1F14239B0;
      v26 = 0;
      v23 = &unk_1F1423980;
      v24 = &unk_1F1423998;
      v21 = &unk_1F1423968;
LABEL_7:
      v17 = &unk_1F1423938;
      v19 = &unk_1F1423860;
      v14 = &unk_1F1423920;
      v15 = &unk_1F1423590;
      v12 = &unk_1F1423530;
      v13 = &unk_1F1423908;
      v10 = &unk_1F14234E8;
      v11 = &unk_1F14235D8;
      v7 = &unk_1F14234D0;
      goto LABEL_12;
    case 4uLL:
      v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C978]), "initWithObjects:", &unk_1F14234D0, &unk_1F14239C8, &unk_1F14239E0, &unk_1F14239F8, &unk_1F1423A10, &unk_1F1423458, &unk_1F1423440, &unk_1F1423A28, &unk_1F1423A40, &unk_1F1423A58, &unk_1F1423A70, &unk_1F1423A88, 0, v16, v18, v20, v22,
                     v24,
                     v25,
                     v26,
                     v27,
                     v28,
                     v29,
                     v30,
                     v31,
                     v32,
                     v33,
                     v34,
                     v35,
                     v36,
                     v37,
                     v38,
                     v39,
                     v40,
                     v41,
                     v42,
                     v43,
                     v44,
                     v45,
                     v46,
                     v47,
                     v48,
                     v49,
                     v50,
                     v51,
                     v52,
                     v53,
                     v54,
                     v55,
                     v56,
                     v57,
                     v58,
                     v59,
                     v60);
      goto LABEL_13;
    case 5uLL:
      v3 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1F14234D0, &unk_1F1423428, &unk_1F1423470, &unk_1F1423AA0, &unk_1F1423AB8, &unk_1F1423AD0, &unk_1F1423458, &unk_1F1423AE8, 0);
      goto LABEL_13;
    case 6uLL:
      id v4 = objc_allocWithZone(MEMORY[0x1E4F1C978]);
      v31 = &unk_1F1423BC0;
      uint64_t v32 = 0;
      v29 = &unk_1F1423B90;
      v30 = &unk_1F1423BA8;
      v27 = &unk_1F1423B78;
      v28 = &unk_1F1423500;
      v25 = &unk_1F1423B48;
      v26 = &unk_1F1423B60;
      v23 = &unk_1F1423B18;
      v24 = &unk_1F1423B30;
      v19 = &unk_1F1423860;
      v21 = &unk_1F1423770;
      v15 = &unk_1F1423578;
      v17 = &unk_1F1423590;
      v13 = &unk_1F14235D8;
      v14 = &unk_1F1423530;
      v12 = &unk_1F14234E8;
      CFDataRef v5 = &unk_1F1423B00;
      v6 = &unk_1F14234D0;
      goto LABEL_11;
    case 7uLL:
    case 8uLL:
      v3 = objc_opt_new();
      goto LABEL_13;
    default:
      id v4 = objc_allocWithZone(MEMORY[0x1E4F1C978]);
      v28 = &unk_1F1423818;
      v29 = 0;
      v26 = &unk_1F1423590;
      v27 = &unk_1F1423860;
      v24 = &unk_1F1423530;
      v25 = &unk_1F1423578;
      v21 = &unk_1F14235D8;
      v23 = &unk_1F1423758;
      v17 = &unk_1F1423788;
      v19 = &unk_1F14237A0;
      v14 = &unk_1F1423518;
      v15 = &unk_1F14237D0;
      v12 = &unk_1F14234E8;
      v13 = &unk_1F1423500;
      CFDataRef v5 = &unk_1F14234D0;
      v6 = &unk_1F14234B8;
LABEL_11:
      v10 = v6;
      v11 = v5;
      v7 = &unk_1F14234A0;
LABEL_12:
      v3 = objc_msgSend(v4, "initWithObjects:", &unk_1F1423428, &unk_1F14238F0, &unk_1F1423440, &unk_1F1423458, &unk_1F1423470, &unk_1F1423488, v7, v10, v11, v12, v13, v14, v15, v17, v19, v21, v23,
                     v24,
                     v25,
                     v26,
                     v27,
                     v28,
                     v29,
                     v30,
                     v31,
                     v32,
                     v33,
                     v34,
                     v35,
                     v36,
                     v37,
                     v38,
                     v39,
                     v40,
                     v41,
                     v42,
                     v43,
                     v44,
                     v45,
                     v46,
                     v47,
                     v48,
                     v49,
                     v50,
                     v51,
                     v52,
                     v53,
                     v54,
                     v55,
                     v56,
                     v57,
                     v58,
                     v59,
                     v60);
LABEL_13:
      v8 = _CacheAttributeNamesAccessQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__AXUIElement_applyElementAttributeCacheScheme___block_invoke;
      block[3] = &unk_1E6220A08;
      id v62 = v3;
      id v9 = v3;
      dispatch_sync(v8, block);

      return;
  }
}

void __48__AXUIElement_applyElementAttributeCacheScheme___block_invoke(uint64_t a1)
{
}

+ (void)applyElementCustomAttributeCacheScheme:(id)a3
{
  id v3 = a3;
  id v4 = _CacheAttributeNamesAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AXUIElement_applyElementCustomAttributeCacheScheme___block_invoke;
  block[3] = &unk_1E6220A08;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

void __54__AXUIElement_applyElementCustomAttributeCacheScheme___block_invoke(uint64_t a1)
{
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && _SCRSystemWideAXUIElementRef == 0)
  {
    _SCRSystemWideAXUIElementRef = (uint64_t)AXUIElementCreateSystemWide();
    uint64_t v4 = +[AXUIElement uiElementWithAXElement:_SCRSystemWideAXUIElementRef cache:0];
    id v5 = (void *)_SCRSystemWideUIElement;
    _SCRSystemWideUIElement = v4;

    dispatch_queue_t v6 = dispatch_queue_create("VOElementSyncNotification", 0);
    id v7 = (void *)_ElementChangedQueue;
    _ElementChangedQueue = (uint64_t)v6;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__AXUIElement_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (initialize_onceToken_0 != -1) {
    dispatch_once(&initialize_onceToken_0, block);
  }
}

uint64_t __25__AXUIElement_initialize__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = dispatch_queue_create("AXUIElementCacheNameAccessQueue", 0);
  id v3 = (void *)_CacheAttributeNamesAccessQueue;
  _CacheAttributeNamesAccessQueue = (uint64_t)v2;

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 applyElementAttributeCacheScheme:0];
}

+ (id)uiElementWithAXElement:(__AXUIElement *)a3
{
  pid_t pid = -1;
  AXUIElementGetPid(a3, &pid);
  pid_t v5 = pid;
  if (pid <= -2 && v5 + getpid() && pid != kAXUIServerFakePid)
  {
    _AXUIElementIDForElement((uint64_t)a3);
    if (v8 == 9999) {
      uint64_t v9 = -pid;
    }
    else {
      uint64_t v9 = pid;
    }
    uint64_t v10 = _AXUIElementIDForElement((uint64_t)a3);
    v12 = (const void *)_AXUIElementCreateWithPIDAndID(v9, v10, v11);
    v13 = +[AXUIMLElement cachedElementForParent:v12];
    if (v13)
    {
      if (v12) {
        CFRelease(v12);
      }
      id v6 = v13;
    }
    else
    {
      id v6 = (id)[objc_allocWithZone((Class)AXUIMLElement) initWithParentElement:v12];
      if (v12) {
        CFRelease(v12);
      }
    }
  }
  else
  {
    id v6 = (id)[objc_allocWithZone((Class)a1) initWithAXElement:a3];
  }
  return v6;
}

+ (id)uiElementWithAXElement:(__AXUIElement *)a3 cache:(id)a4
{
  id v6 = a4;
  pid_t pid = 0;
  AXUIElementGetPid(a3, &pid);
  pid_t v7 = pid;
  if (pid <= -2 && v7 + getpid() && pid != kAXUIServerFakePid)
  {
    _AXUIElementIDForElement((uint64_t)a3);
    if (v10 == 9999) {
      uint64_t v11 = -pid;
    }
    else {
      uint64_t v11 = pid;
    }
    uint64_t v12 = _AXUIElementIDForElement((uint64_t)a3);
    v14 = (const void *)_AXUIElementCreateWithPIDAndID(v11, v12, v13);
    v15 = +[AXUIMLElement cachedElementForParent:v14];
    if (v15)
    {
      if (v14) {
        CFRelease(v14);
      }
      id v8 = v15;
    }
    else
    {
      id v8 = (id)[objc_allocWithZone((Class)AXUIMLElement) initWithParentElement:v14];
      if (v14) {
        CFRelease(v14);
      }
    }
  }
  else
  {
    id v8 = (id)[objc_allocWithZone((Class)a1) initWithAXElement:a3 cache:v6];
  }

  return v8;
}

+ (id)proxiedMLElementsForApp:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (AXProcessEverWantsMLElements())
  {
    uint64_t v4 = [v3 stringWithAXAttribute:3003];
    if (AXProcessWantsMLElementsForBundle((uint64_t)v4))
    {
      pid_t v5 = AXMediaLogElementVision();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        uint64_t v9 = v4;
        _os_log_impl(&dword_1BA657000, v5, OS_LOG_TYPE_INFO, "App wants ML Elements: %@", (uint8_t *)&v8, 0xCu);
      }

      id v6 = [v3 uiElementsWithAttribute:3051];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)scrollAncestorAtCoordinate:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v10[3] = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  v9[0] = @"application";
  v10[0] = AXUIElementSharedSystemWide();
  v9[1] = @"point";
  pid_t v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", x, y);
  v9[2] = @"hitTestType";
  v10[1] = v5;
  v10[2] = &unk_1F1423BD8;
  AXUIElementCopyElementWithParameters((uint64_t *)&cf, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3]);

  if (cf)
  {
    id v6 = +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:");
    CFRelease(cf);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (unsigned)_activeKeyboardContextId
{
  dispatch_queue_t v2 = [(AXUIElement *)self uiElementsWithAttribute:2076];
  id v3 = [v2 firstObject];

  if (v3)
  {
    uint64_t v4 = [v3 numberWithAXAttribute:2021];
    unsigned int v5 = [v4 unsignedIntValue];
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

+ (id)uiElementAtCoordinate:(CGPoint)a3 forApplication:(__AXUIElement *)a4 contextId:(unsigned int)a5 displayId:(unsigned int)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  if (a4)
  {
    uint64_t v6 = *(void *)&a6;
    double y = a3.y;
    double x = a3.x;
    uint64_t v12 = +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:");
    uint64_t v13 = [a1 proxiedMLElementsForApp:v12];
    if (![v13 count]
      || (int v14 = [v12 _activeKeyboardContextId]) != 0
      && (int v15 = v14,
          +[AXElement systemWideElement],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = objc_msgSend(v16, "contextIdForPoint:", x, y),
          v16,
          v17 == v15))
    {
      float v18 = x;
      float v19 = y;
      int v20 = _AXUIElementCopyElementAtPositionWithParams(a4, (uint64_t *)&cf, 0, 0, a5, v6, 0, v18, v19);
      v21 = 0;
      if (!v20 && cf)
      {
        v21 = +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:");
        CFRelease(cf);
      }
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v22 = v13;
      v21 = (void *)[v22 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v21)
      {
        uint64_t v23 = *(void *)v31;
        while (2)
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v31 != v23) {
              objc_enumerationMutation(v22);
            }
            v25 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if (objc_msgSend(v25, "isMLElement", (void)v30))
            {
              id v26 = v25;
              uint64_t v27 = objc_msgSend(v26, "copyElementAtPosition:", x, y);
              if (v27)
              {
                v28 = (const void *)v27;
                v21 = +[AXUIElement uiElementWithAXElement:v27];
                CFRelease(v28);

                goto LABEL_21;
              }
            }
          }
          v21 = (void *)[v22 countByEnumeratingWithState:&v30 objects:v35 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }
LABEL_21:
    }
  }
  else
  {
    v21 = 0;
  }
  return v21;
}

+ (id)uiElementAtCoordinate:(CGPoint)a3 forApplication:(__AXUIElement *)a4 contextId:(unsigned int)a5
{
  return (id)objc_msgSend(a1, "uiElementAtCoordinate:forApplication:contextId:displayId:", a4, *(void *)&a5, 0, a3.x, a3.y);
}

+ (id)uiElementAtCoordinate:(CGPoint)a3 displayId:(unsigned int)a4
{
  double y = a3.y;
  double x = a3.x;
  CFTypeRef cf = 0;
  int v12 = 0;
  float v7 = a3.x;
  float v8 = a3.y;
  if (AXUIElementCopyApplicationAndContextAtPositionWithDisplayID((const __AXUIElement *)_SCRSystemWideAXUIElementRef, (uint64_t *)&cf, &v12, *(uint64_t *)&a4, v7, v8))CFTypeRef cf = (CFTypeRef)_SCRSystemWideAXUIElementRef; {
  uint64_t v9 = objc_msgSend(a1, "uiElementAtCoordinate:forApplication:contextId:displayId:", x, y);
  }
  if (cf) {
    BOOL v10 = cf == (CFTypeRef)_SCRSystemWideAXUIElementRef;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10) {
    CFRelease(cf);
  }
  return v9;
}

+ (id)uiElementAtCoordinate:(CGPoint)a3
{
  return (id)objc_msgSend(a1, "uiElementAtCoordinate:displayId:", 0, a3.x, a3.y);
}

+ (id)uiElementAtCoordinate:(CGPoint)a3 startWithElement:(id)a4
{
  CGPoint valuePtr = a3;
  CFTypeRef result = 0;
  id v4 = a4;
  AXValueRef v5 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
  uint64_t v6 = (const __AXUIElement *)[v4 axElement];

  float v7 = 0;
  if (AXUIElementCopyParameterizedAttributeValue(v6, (CFStringRef)0x16960, v5, &result) || !result)
  {
LABEL_5:
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  CFTypeID v8 = CFGetTypeID(result);
  if (v8 == AXUIElementGetTypeID())
  {
    float v7 = +[AXUIElement uiElementWithAXElement:result];
    CFRelease(result);
    goto LABEL_5;
  }
  float v7 = 0;
  if (v5) {
LABEL_6:
  }
    CFRelease(v5);
LABEL_7:
  return v7;
}

+ (id)uiApplicationWithPid:(int)a3
{
  AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid(a3);
  id v4 = +[AXUIElement uiElementWithAXElement:AppElementWithPid];
  if (AppElementWithPid) {
    CFRelease(AppElementWithPid);
  }
  return v4;
}

+ (id)uiApplicationAtCoordinate:(CGPoint)a3
{
  CFTypeRef cf = 0;
  if (_SCRSystemWideAXUIElementRef)
  {
    float x = a3.x;
    float y = a3.y;
    if (AXUIElementCopyApplicationAtPosition((const __AXUIElement *)_SCRSystemWideAXUIElementRef, (uint64_t *)&cf, x, y))
    {
      AXValueRef v5 = 0;
    }
    else
    {
      AXValueRef v5 = +[AXUIElement uiElementWithAXElement:cf];
    }
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
  }
  else
  {
    AXValueRef v5 = 0;
  }
  return v5;
}

+ (id)uiApplicationForContext:(unsigned int)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_13;
  }
  CFTypeRef result = 0;
  uint64_t v13 = @"contextId";
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  v14[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  AXError v5 = AXUIElementCopyParameterizedAttributeValue((AXUIElementRef)_SCRSystemWideAXUIElementRef, (CFStringRef)0x16574, v4, &result);
  if (!result
    || ((CFAutorelease(result), v5 == kAXErrorSuccess) ? (BOOL v6 = result == 0) : (BOOL v6 = 1),
        v6
     || (CFTypeID v7 = CFGetTypeID(result), v7 != CFNumberGetTypeID())
     || (int valuePtr = 0, CFNumberGetValue((CFNumberRef)result, kCFNumberIntType, &valuePtr), !valuePtr)))
  {

LABEL_13:
    uint64_t v9 = 0;
    goto LABEL_14;
  }
  AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid(valuePtr);
  uint64_t v9 = +[AXUIElement uiElementWithAXElement:AppElementWithPid];
  if (AppElementWithPid) {
    CFRelease(AppElementWithPid);
  }

LABEL_14:
  return v9;
}

- (AXUIElement)initWithAXElement:(__AXUIElement *)a3 cache:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXUIElement;
  CFTypeID v7 = [(AXUIElement *)&v12 init];
  CFTypeID v8 = v7;
  if (a3)
  {
    if (!v7)
    {
LABEL_8:
      a3 = v8;
      goto LABEL_9;
    }
    uint64_t v9 = (__AXUIElement *)CFRetain(a3);
    v8->_axElement = v9;
    if (v9)
    {
      v8->_isValid = 1;
      if (v6)
      {
        BOOL v10 = (void *)[v6 mutableCopy];
        [(AXUIElement *)v8 setCachedAttributes:v10];
      }
      else
      {
        [(AXUIElement *)v8 enableCache:0];
      }
      goto LABEL_8;
    }
    a3 = 0;
  }
LABEL_9:

  return (AXUIElement *)a3;
}

- (AXUIElement)initWithAXElement:(__AXUIElement *)a3
{
  id v3 = [(AXUIElement *)self initWithAXElement:a3 cache:0];
  id v4 = v3;
  if (v3) {
    [(AXUIElement *)v3 enableCache:1];
  }
  return v4;
}

- (void)dealloc
{
  axElement = self->_axElement;
  if (axElement)
  {
    CFRelease(axElement);
    self->_axElement = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AXUIElement;
  [(AXUIElement *)&v4 dealloc];
}

- (NSDictionary)cachedAttributes
{
  dispatch_queue_t v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(NSMutableDictionary *)v2->_cachedAttributes copy];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (NSMutableDictionary)copyCachedAttributes
{
  dispatch_queue_t v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableDictionary *)v2->_cachedAttributes ax_deepMutableCopy];
  objc_sync_exit(v2);

  return v3;
}

- (void)_cachedValueForAttribute:(int64_t)a3
{
  objc_super v4 = self;
  objc_sync_enter(v4);
  cachedAttributes = v4->_cachedAttributes;
  id v6 = [NSNumber numberWithLong:a3];
  CFTypeID v7 = [(NSMutableDictionary *)cachedAttributes objectForKeyedSubscript:v6];

  if (v7)
  {
    CFTypeRef v8 = CFRetain(v7);
    CFTypeRef v9 = CFAutorelease(v8);
  }
  else
  {
    CFTypeRef v9 = 0;
  }
  objc_sync_exit(v4);

  return (void *)v9;
}

- (void)_setCachedValue:(void *)a3 forAttribute:(int64_t)a4
{
  obj = self;
  objc_sync_enter(obj);
  cachedAttributes = obj->_cachedAttributes;
  CFTypeID v7 = [NSNumber numberWithLong:a4];
  if (a3) {
    [(NSMutableDictionary *)cachedAttributes setObject:a3 forKeyedSubscript:v7];
  }
  else {
    [(NSMutableDictionary *)cachedAttributes removeObjectForKey:v7];
  }

  objc_sync_exit(obj);
}

- (int)pid
{
  axElement = self->_axElement;
  if (axElement)
  {
    pid_t pid = 0;
    AXUIElementGetPid(axElement, &pid);
    LODWORD(axElement) = pid;
  }
  return (int)axElement;
}

- (unint64_t)hash
{
  axElement = self->_axElement;
  if (axElement)
  {
    return CFHash(axElement);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AXUIElement;
    return [(AXUIElement *)&v5 hash];
  }
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (AXUIElement *)a3;
  objc_super v5 = v4;
  if (self == v4) {
    goto LABEL_8;
  }
  if (!v4)
  {
    BOOL v8 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((axElement = v5->_axElement, CFTypeID v7 = self->_axElement, v7 == axElement) || axElement
                                                                             && v7
                                                                             && CFEqual(v7, axElement)))
  {
LABEL_8:
    BOOL v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)AXUIElement;
    BOOL v8 = [(AXUIElement *)&v10 isEqual:v5];
  }
LABEL_11:

  return v8;
}

- (__AXUIElement)axElement
{
  if (self->_isValid) {
    return self->_axElement;
  }
  else {
    return 0;
  }
}

- (void)setAXElement:(__AXUIElement *)a3
{
  axElement = self->_axElement;
  if (axElement != a3)
  {
    if (axElement) {
      CFRelease(axElement);
    }
    if (a3) {
      CFRetain(a3);
    }
    self->_axElement = a3;
  }
}

- (void)_invalidate
{
  self->_isValid = 0;
}

- (void)modifyStaticCacheValue:(void *)a3
{
  if (!a3) {
    return (void *)*MEMORY[0x1E4F1D260];
  }
  id v3 = a3;
  if (AXValueGetType((AXValueRef)a3) == kAXValueTypeAXError) {
    return (void *)*MEMORY[0x1E4F1D260];
  }
  CFTypeID v5 = CFGetTypeID(v3);
  if (v5 != AXUIElementGetTypeID()) {
    return v3;
  }
  return +[AXUIElement uiElementWithAXElement:v3];
}

- (void)setCachedAttributes:(id)a3
{
  objc_super v4 = (NSMutableDictionary *)a3;
  obj = self;
  objc_sync_enter(obj);
  cachedAttributes = obj->_cachedAttributes;
  obj->_cachedRefCount = 0;
  obj->_cachedAttributes = v4;

  obj->_cachedRefCount = obj->_cachedAttributes != 0;
  objc_sync_exit(obj);
}

- (void)enableCache:(BOOL)a3
{
}

- (void)disableCache
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BA657000, log, OS_LOG_TYPE_DEBUG, "DISABLING AN AXUIELEMENT'S CACHING MECHANISM SHOULD NEVER BE DONE UNLESS ITS ALREADY CACHING", v1, 2u);
}

- (void)_createCache:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  if (!v4->_cachedAttributes)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    cachedAttributes = v4->_cachedAttributes;
    v4->_cachedAttributes = (NSMutableDictionary *)v5;
  }
  objc_sync_exit(v4);

  if (v3)
  {
    if (_CacheAttributeNamesAccessQueue)
    {
      uint64_t v8 = 0;
      CFTypeRef v9 = &v8;
      uint64_t v10 = 0x3032000000;
      uint64_t v11 = __Block_byref_object_copy__0;
      objc_super v12 = __Block_byref_object_dispose__0;
      id v13 = 0;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __28__AXUIElement__createCache___block_invoke;
      block[3] = &unk_1E6220520;
      void block[4] = &v8;
      dispatch_sync((dispatch_queue_t)_CacheAttributeNamesAccessQueue, block);
      [(AXUIElement *)v4 updateCacheWithAttributes:v9[5]];
      _Block_object_dispose(&v8, 8);
    }
  }
}

void __28__AXUIElement__createCache___block_invoke(uint64_t a1)
{
}

- (void)updateCacheWithAttributes:(id)a3
{
  id v14 = a3;
  objc_super v4 = -[AXUIElement valueArrayWithAXAttributes:](self, "valueArrayWithAXAttributes:");
  uint64_t v5 = [v4 count];
  if (v4)
  {
    if (v5)
    {
      uint64_t v6 = [v14 count];
      if (v6)
      {
        uint64_t v7 = v6;
        for (uint64_t i = 0; i != v7; ++i)
        {
          CFTypeRef v9 = [v4 objectAtIndexedSubscript:i];

          if (v9)
          {
            uint64_t v10 = [v14 objectAtIndex:i];
            uint64_t v11 = [v10 unsignedIntValue];

            if (AXValueGetType((AXValueRef)v9) == kAXValueTypeAXError)
            {
              uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
              id v13 = self;
            }
            else
            {
              id v13 = self;
              uint64_t v12 = (uint64_t)v9;
            }
            [(AXUIElement *)v13 _setCachedValue:v12 forAttribute:v11];
          }
        }
      }
    }
  }
}

- (BOOL)isValidForApplication:(id)a3
{
  objc_super v4 = a3;
  if (!v4) {
    goto LABEL_9;
  }
  pid_t pid = 0;
  axElement = self->_axElement;
  if (!axElement) {
    goto LABEL_9;
  }
  pid_t v21 = 0;
  if (AXUIElementGetPid(axElement, &pid) == kAXErrorInvalidUIElement) {
    goto LABEL_9;
  }
  uint64_t v6 = (const __AXUIElement *)v4[1];
  if (!v6) {
    goto LABEL_9;
  }
  if (AXUIElementGetPid(v6, &v21) == kAXErrorInvalidUIElement) {
    goto LABEL_9;
  }
  if (pid != v21) {
    goto LABEL_9;
  }
  int64_t cachedRefCount = self->_cachedRefCount;
  self->_int64_t cachedRefCount = 0;
  [(AXUIElement *)self pointWithAXAttribute:2062];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(AXUIElement *)self numberWithAXAttribute:2021];
  uint64_t v13 = [v12 unsignedIntValue];

  id v14 = [(AXUIElement *)self numberWithAXAttribute:2123];
  uint64_t v15 = [v14 unsignedIntValue];

  double v16 = AXConvertPointFromHostedCoordinates(v13, v15, v9, v11);
  self->_int64_t cachedRefCount = cachedRefCount;
  int v17 = +[AXUIElement uiElementAtCoordinate:self->_axElement forApplication:v13 contextId:v15 displayId:v16];
  char v18 = [v17 isEqual:self];

  if (v18) {
    BOOL v19 = 1;
  }
  else {
LABEL_9:
  }
    BOOL v19 = 0;

  return v19;
}

- (BOOL)isValid
{
  if (!self->_isValid) {
    return 0;
  }
  axElement = self->_axElement;
  pid_t pid = 0;
  AXError v4 = AXUIElementGetPid(axElement, &pid);
  if (axElement) {
    BOOL v5 = v4 == kAXErrorInvalidUIElement;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = v5 || pid <= 0;
  BOOL v7 = !v6;
  if (v6) {
    [(AXUIElement *)self _invalidate];
  }
  return v7;
}

- (id)_outputCache
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28E78] string];
  AXError v4 = self;
  objc_sync_enter(v4);
  cachedAttributes = v4->_cachedAttributes;
  if (cachedAttributes)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    BOOL v6 = [(NSMutableDictionary *)cachedAttributes allKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          double v11 = [(NSMutableDictionary *)v4->_cachedAttributes objectForKeyedSubscript:v10];
          [v3 appendFormat:@"Cache: key: %@ - value: %@", v10, v11];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    objc_sync_exit(v4);
    uint64_t v12 = v3;
  }
  else
  {
    objc_sync_exit(v4);

    uint64_t v12 = @"No Cache";
  }

  return v12;
}

- (void)updateCache:(int64_t)a3
{
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      CFTypeRef value = 0;
      AXError v6 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
      if (v6) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = value == 0;
      }
      if (v7)
      {
        if (v6 == kAXErrorNoValue) {
          -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", [MEMORY[0x1E4F1CA98] null], a3);
        }
      }
      else
      {
        -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:");
        CFRelease(value);
      }
    }
  }
}

- (id)arrayWithAXAttribute:(int64_t)a3
{
  CFTypeRef v5 = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  CFTypeRef value = v5;
  if (v5 == (CFTypeRef)*MEMORY[0x1E4F1D260])
  {
    id v9 = 0;
    goto LABEL_17;
  }
  if (v5) {
    goto LABEL_14;
  }
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      AXError v7 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
      switch(v7)
      {
        case kAXErrorNoValue:
          -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", [MEMORY[0x1E4F1CA98] null], a3);
          break;
        case kAXErrorInvalidUIElement:
          [(AXUIElement *)self _invalidate];
          break;
        case kAXErrorSuccess:
          CFTypeID v8 = CFGetTypeID(value);
          if (v8 != CFArrayGetTypeID())
          {
            CFRelease(value);
            uint64_t v12 = 0;
            CFTypeRef value = 0;
            goto LABEL_16;
          }
          [(AXUIElement *)self _setCachedValue:value forAttribute:a3];
          CFAutorelease(value);
          break;
      }
    }
  }
  CFTypeRef v5 = value;
  if (value)
  {
LABEL_14:
    CFTypeID v10 = CFGetTypeID(v5);
    CFTypeID TypeID = CFNullGetTypeID();
    uint64_t v12 = (void *)value;
    if (v10 == TypeID) {
      uint64_t v12 = 0;
    }
    goto LABEL_16;
  }
  uint64_t v12 = 0;
LABEL_16:
  id v9 = v12;
LABEL_17:
  return v9;
}

- (id)stringWithAXAttribute:(int64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  CFTypeRef v5 = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  CFTypeRef value = v5;
  if (v5 == (void *)*MEMORY[0x1E4F1D260]) {
    goto LABEL_5;
  }
  CFTypeRef v6 = v5;
  if (v5)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 != CFStringGetTypeID() && !AXIsAXAttributedString())
    {
LABEL_5:
      id v8 = 0;
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      AXError v10 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
      if (v10 == kAXErrorNoValue)
      {
        -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", [MEMORY[0x1E4F1CA98] null], a3);
      }
      else
      {
        AXError v11 = v10;
        if (v10)
        {
          uint64_t v13 = AXRuntimeLogCommon();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            char v18 = self->_axElement;
            *(_DWORD *)buf = 134218752;
            pid_t v21 = self;
            __int16 v22 = 2048;
            uint64_t v23 = v18;
            __int16 v24 = 2048;
            int64_t v25 = a3;
            __int16 v26 = 2048;
            uint64_t v27 = v11;
            _os_log_error_impl(&dword_1BA657000, v13, OS_LOG_TYPE_ERROR, "error in stringWithAXAttribute. AXUIElement:%p ref:%p attr:%ld error:%ld", buf, 0x2Au);
          }

          if (v11 == kAXErrorInvalidUIElement) {
            [(AXUIElement *)self _invalidate];
          }
        }
        else
        {
          CFTypeID v12 = CFGetTypeID(value);
          if (v12 != CFStringGetTypeID() && !AXIsAXAttributedString())
          {
            CFRelease(value);
            long long v16 = 0;
            CFTypeRef value = 0;
            goto LABEL_21;
          }
          [(AXUIElement *)self _setCachedValue:value forAttribute:a3];
          CFAutorelease(value);
        }
      }
    }
  }
  CFTypeRef v6 = value;
  if (value)
  {
LABEL_19:
    CFTypeID v14 = CFGetTypeID(v6);
    CFTypeID TypeID = CFNullGetTypeID();
    long long v16 = (void *)value;
    if (v14 == TypeID) {
      long long v16 = 0;
    }
    goto LABEL_21;
  }
  long long v16 = 0;
LABEL_21:
  id v8 = v16;
LABEL_22:
  return v8;
}

- (BOOL)BOOLWithAXAttribute:(int64_t)a3
{
  CFTypeRef v5 = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  CFTypeRef value = v5;
  if (v5 == (void *)*MEMORY[0x1E4F1D260]) {
    return 0;
  }
  CFBooleanRef v6 = (const __CFBoolean *)v5;
  if (v5)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 != CFNullGetTypeID()) {
      return CFBooleanGetValue(v6) != 0;
    }
    return 0;
  }
  if (!self->_isValid) {
    return 0;
  }
  axElement = self->_axElement;
  if (!axElement) {
    return 0;
  }
  AXError v10 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
  if (v10 == kAXErrorNoValue)
  {
    -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", [MEMORY[0x1E4F1CA98] null], a3);
    return 0;
  }
  if (v10 == kAXErrorInvalidUIElement)
  {
    [(AXUIElement *)self _invalidate];
    return 0;
  }
  if (v10) {
    return 0;
  }
  CFTypeID v11 = CFGetTypeID(value);
  if (v11 == CFBooleanGetTypeID())
  {
    [(AXUIElement *)self _setCachedValue:value forAttribute:a3];
    char v8 = CFBooleanGetValue((CFBooleanRef)value) != 0;
  }
  else
  {
    CFTypeID v13 = CFGetTypeID(value);
    if (v13 == CFNumberGetTypeID())
    {
      [(AXUIElement *)self _setCachedValue:value forAttribute:a3];
      char v8 = [(id)value BOOLValue];
    }
    else
    {
      char v8 = 0;
    }
  }
  CFRelease(value);
  return v8;
}

- (id)numberWithAXAttribute:(int64_t)a3
{
  CFTypeRef v5 = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  CFTypeRef value = v5;
  if (v5 == (CFTypeRef)*MEMORY[0x1E4F1D260])
  {
    id v9 = 0;
    goto LABEL_17;
  }
  if (v5) {
    goto LABEL_14;
  }
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      AXError v7 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
      switch(v7)
      {
        case kAXErrorNoValue:
          -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", [MEMORY[0x1E4F1CA98] null], a3);
          break;
        case kAXErrorInvalidUIElement:
          [(AXUIElement *)self _invalidate];
          break;
        case kAXErrorSuccess:
          CFTypeID v8 = CFGetTypeID(value);
          if (v8 != CFNumberGetTypeID())
          {
            CFRelease(value);
            CFTypeID v12 = 0;
            CFTypeRef value = 0;
            goto LABEL_16;
          }
          [(AXUIElement *)self _setCachedValue:value forAttribute:a3];
          CFAutorelease(value);
          break;
      }
    }
  }
  CFTypeRef v5 = value;
  if (value)
  {
LABEL_14:
    CFTypeID v10 = CFGetTypeID(v5);
    CFTypeID TypeID = CFNullGetTypeID();
    CFTypeID v12 = (void *)value;
    if (v10 == TypeID) {
      CFTypeID v12 = 0;
    }
    goto LABEL_16;
  }
  CFTypeID v12 = 0;
LABEL_16:
  id v9 = v12;
LABEL_17:
  return v9;
}

- (CGPoint)pointWithAXAttribute:(int64_t)a3
{
  CFTypeRef v5 = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  CFTypeRef value = v5;
  CFBooleanRef v6 = (void *)*MEMORY[0x1E4F1D260];
  long long valuePtr = *MEMORY[0x1E4F1DAD8];
  if (v5 != v6)
  {
    AXError v7 = (const __AXValue *)v5;
    if (v5)
    {
      CFTypeID v8 = CFGetTypeID(v5);
      if (v8 != CFNullGetTypeID()) {
        AXValueGetValue(v7, kAXValueTypeCGPoint, &valuePtr);
      }
    }
    else if (self->_isValid)
    {
      axElement = self->_axElement;
      if (axElement)
      {
        AXError v10 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
        switch(v10)
        {
          case kAXErrorNoValue:
            -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", [MEMORY[0x1E4F1CA98] null], a3);
            break;
          case kAXErrorInvalidUIElement:
            [(AXUIElement *)self _invalidate];
            break;
          case kAXErrorSuccess:
            if (AXValueGetType((AXValueRef)value) == kAXValueTypeCGPoint)
            {
              [(AXUIElement *)self _setCachedValue:value forAttribute:a3];
              AXValueGetValue((AXValueRef)value, kAXValueTypeCGPoint, &valuePtr);
            }
            CFRelease(value);
            break;
        }
      }
    }
  }
  double v12 = *((double *)&valuePtr + 1);
  double v11 = *(double *)&valuePtr;
  result.float y = v12;
  result.float x = v11;
  return result;
}

- (CGPath)pathWithAXAttribute:(int64_t)a3
{
  CGPoint result = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  CFTypeRef value = result;
  if (result == (CGPath *)*MEMORY[0x1E4F1D260]) {
    return 0;
  }
  if (!result)
  {
    if (self->_isValid)
    {
      axElement = self->_axElement;
      if (axElement)
      {
        AXError v7 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
        if (v7 == kAXErrorNoValue)
        {
          -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", [MEMORY[0x1E4F1CA98] null], a3);
        }
        else
        {
          if (v7 != kAXErrorInvalidUIElement)
          {
            if (v7) {
              goto LABEL_12;
            }
            CFTypeID v8 = CFGetTypeID(value);
            if (v8 == CGPathGetTypeID())
            {
              [(AXUIElement *)self _setCachedValue:value forAttribute:a3];
              CFAutorelease(value);
              goto LABEL_12;
            }
            CFRelease(value);
            return 0;
          }
          [(AXUIElement *)self _invalidate];
        }
      }
    }
LABEL_12:
    CGPoint result = (CGPath *)value;
    if (!value) {
      return result;
    }
  }
  CFTypeID v9 = CFGetTypeID(result);
  if (v9 == CFNullGetTypeID()) {
    return 0;
  }
  else {
    return (CGPath *)value;
  }
}

- (CGRect)rectWithAXAttribute:(int64_t)a3
{
  CFTypeRef v5 = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  CFTypeRef value = v5;
  CFBooleanRef v6 = (void *)*MEMORY[0x1E4F1D260];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long valuePtr = *MEMORY[0x1E4F1DB28];
  long long v18 = v7;
  if (v5 != v6)
  {
    CFTypeID v8 = (const __AXValue *)v5;
    if (v5)
    {
      CFTypeID v9 = CFGetTypeID(v5);
      if (v9 != CFNullGetTypeID()) {
        AXValueGetValue(v8, kAXValueTypeCGRect, &valuePtr);
      }
    }
    else if (self->_isValid)
    {
      axElement = self->_axElement;
      if (axElement)
      {
        AXError v11 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
        switch(v11)
        {
          case kAXErrorNoValue:
            -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", [MEMORY[0x1E4F1CA98] null], a3);
            break;
          case kAXErrorInvalidUIElement:
            [(AXUIElement *)self _invalidate];
            break;
          case kAXErrorSuccess:
            if (AXValueGetType((AXValueRef)value) == kAXValueTypeCGRect)
            {
              [(AXUIElement *)self _setCachedValue:value forAttribute:a3];
              AXValueGetValue((AXValueRef)value, kAXValueTypeCGRect, &valuePtr);
            }
            CFRelease(value);
            break;
        }
      }
    }
  }
  double v13 = *((double *)&valuePtr + 1);
  double v12 = *(double *)&valuePtr;
  double v15 = *((double *)&v18 + 1);
  double v14 = *(double *)&v18;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.float y = v13;
  result.origin.float x = v12;
  return result;
}

- (_NSRange)rangeWithAXAttribute:(int64_t)a3
{
  CFTypeRef v5 = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  CFTypeRef value = v5;
  if (v5 == (void *)*MEMORY[0x1E4F1D260])
  {
    long long valuePtr = xmmword_1BA6A62B0;
  }
  else
  {
    CFBooleanRef v6 = (const __AXValue *)v5;
    long long valuePtr = 0uLL;
    if (v5)
    {
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 != CFNullGetTypeID()) {
        AXValueGetValue(v6, kAXValueTypeCFRange, &valuePtr);
      }
    }
    else if (self->_isValid)
    {
      axElement = self->_axElement;
      if (axElement)
      {
        AXError v11 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
        switch(v11)
        {
          case kAXErrorNoValue:
            -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", [MEMORY[0x1E4F1CA98] null], a3);
            break;
          case kAXErrorInvalidUIElement:
            [(AXUIElement *)self _invalidate];
            break;
          case kAXErrorSuccess:
            if (AXValueGetType((AXValueRef)value) == kAXValueTypeCFRange)
            {
              [(AXUIElement *)self _setCachedValue:value forAttribute:a3];
              AXValueGetValue((AXValueRef)value, kAXValueTypeCFRange, &valuePtr);
            }
            CFRelease(value);
            break;
        }
      }
    }
  }
  NSUInteger v9 = *((void *)&valuePtr + 1);
  NSUInteger v8 = valuePtr;
  result.length = v9;
  result.location = v8;
  return result;
}

- (CGColor)colorWithAXAttribute:(int64_t)a3
{
  _NSRange result = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  CFTypeRef value = result;
  if (!result)
  {
    if (self->_isValid)
    {
      axElement = self->_axElement;
      if (axElement)
      {
        AXError v7 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
        if (v7 == kAXErrorNoValue)
        {
          CFTypeRef v8 = (CFTypeRef)[MEMORY[0x1E4F1CA98] null];
        }
        else
        {
          if (v7 == kAXErrorInvalidUIElement)
          {
            [(AXUIElement *)self _invalidate];
            goto LABEL_13;
          }
          if (v7) {
            goto LABEL_13;
          }
          if (value)
          {
            CFAutorelease(value);
            CFTypeRef v8 = value;
          }
          else
          {
            CFTypeRef v8 = 0;
          }
        }
        [(AXUIElement *)self _setCachedValue:v8 forAttribute:a3];
      }
    }
LABEL_13:
    _NSRange result = (CGColor *)value;
    if (!value) {
      return result;
    }
  }
  CFTypeID v9 = CFGetTypeID(result);
  if (v9 == CGColorGetTypeID()) {
    return (CGColor *)value;
  }
  else {
    return 0;
  }
}

- (id)objectWithAXAttribute:(int64_t)a3
{
  CFTypeRef cf = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  if (!cf && self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      AXError v13 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &cf);
      switch(v13)
      {
        case kAXErrorNoValue:
          CFTypeRef v14 = (CFTypeRef)[MEMORY[0x1E4F1CA98] null];
LABEL_25:
          [(AXUIElement *)self _setCachedValue:v14 forAttribute:a3];
          break;
        case kAXErrorInvalidUIElement:
          [(AXUIElement *)self _invalidate];
          break;
        case kAXErrorSuccess:
          if (cf)
          {
            CFAutorelease(cf);
            CFTypeRef v14 = cf;
          }
          else
          {
            CFTypeRef v14 = 0;
          }
          goto LABEL_25;
      }
    }
  }
  if ((unint64_t)(a3 - 3000) <= 9 && ((1 << (a3 + 72)) & 0x205) != 0)
  {
    CFTypeRef v5 = +[AXUIElement proxiedMLElementsForApp:self];
    if ([v5 count])
    {
      CFBooleanRef v6 = [v5 firstObject];
      AXError v7 = [v6 nextElementsWithCount:1];
      CFTypeRef v8 = [v7 firstObject];
      CFTypeRef cf = (CFTypeRef)[v8 axElement];
    }
  }
  if (cf)
  {
    CFTypeID v9 = CFGetTypeID(cf);
    CFTypeID TypeID = CFNullGetTypeID();
    AXError v11 = (void *)cf;
    if (v9 == TypeID) {
      AXError v11 = 0;
    }
  }
  else
  {
    AXError v11 = 0;
  }
  id v15 = v11;
  return v15;
}

- (id)objectWithAXAttribute:(int64_t)a3 parameter:(void *)a4
{
  if (self->_isValid && (axElement = self->_axElement, CFTypeRef result = 0, axElement))
  {
    id v7 = AXUIElementConvertOutgoingType(a4);
    if (AXUIElementCopyParameterizedAttributeValue(axElement, (CFStringRef)a3, v7, &result) == kAXErrorInvalidUIElement) {
      [(AXUIElement *)self _invalidate];
    }
    CFTypeRef v8 = (void *)result;
    if (result)
    {
      CFTypeRef v8 = CFAutorelease(result);
    }
  }
  else
  {
    CFTypeRef v8 = 0;
  }
  return v8;
}

- (id)valueArrayWithAXAttributes:(__CFArray *)a3
{
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  if (!self->_isValid) {
    goto LABEL_22;
  }
  axElement = self->_axElement;
  if (!axElement) {
    goto LABEL_22;
  }
  CFArrayRef values = 0;
  AXError v7 = AXUIElementCopyMultipleAttributeValues(axElement, a3, 0, &values);
  CFArrayRef v8 = values;
  if (v7) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = values == 0;
  }
  if (v9)
  {
    if (v7 != kAXErrorInvalidUIElement) {
      goto LABEL_20;
    }
    [(AXUIElement *)self _invalidate];
  }
  else
  {
    CFIndex Count = CFArrayGetCount(values);
    if (Count)
    {
      CFIndex v11 = Count;
      for (CFIndex i = 0; i != v11; ++i)
      {
        ValueAtIndefloat x = CFArrayGetValueAtIndex(values, i);
        if (ValueAtIndex)
        {
          CFTypeRef v14 = ValueAtIndex;
          CFTypeID v15 = CFGetTypeID(ValueAtIndex);
          if (v15 == AXUIElementGetTypeID())
          {
            long long v16 = +[AXUIElement uiElementWithAXElement:v14 cache:0];
            if (v16) {
              CFArrayAppendValue(Mutable, v16);
            }
          }
          else
          {
            CFArrayAppendValue(Mutable, v14);
          }
        }
      }
    }
  }
  CFArrayRef v8 = values;
LABEL_20:
  if (v8) {
    CFRelease(v8);
  }
LABEL_22:
  long long v17 = CFAutorelease(Mutable);
  return v17;
}

- (BOOL)performAXAction:(int)a3 withValue:(id)a4
{
  return [(AXUIElement *)self performAXAction:*(void *)&a3 withValue:a4 fencePort:0];
}

- (BOOL)performAXAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  id v6 = a4;
  AXError v7 = v6;
  if (self->_isValid && self->_axElement)
  {
    uint64_t v8 = AXUIElementConvertOutgoingType(v6);

    int v9 = AXUIElementPerformFencedActionWithValue();
    BOOL v10 = v9 == 0;
    if (v9 == -25202)
    {
      [(AXUIElement *)self _invalidate];
      BOOL v10 = 0;
    }
    AXError v7 = (void *)v8;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)canPerformAXAction:(int)a3
{
  AXError v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  CFTypeRef v5 = [(AXUIElement *)self objectWithAXAttribute:95221 parameter:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = [v5 BOOLValue];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)performAXAction:(int)a3
{
  if (!self->_isValid) {
    goto LABEL_5;
  }
  axElement = self->_axElement;
  if (axElement)
  {
    AXError v5 = AXUIElementPerformAction(axElement, *(CFStringRef *)&a3);
    LOBYTE(axElement) = v5 == kAXErrorSuccess;
    if (v5 == kAXErrorInvalidUIElement)
    {
      [(AXUIElement *)self _invalidate];
LABEL_5:
      LOBYTE(axElement) = 0;
    }
  }
  return (char)axElement;
}

- (id)uiElementsWithAttribute:(int64_t)a3 parameter:(void *)a4
{
  return [(AXUIElement *)self uiElementsWithAttribute:a3 parameter:a4 fetchAttributes:1];
}

- (id)uiElementsWithAttribute:(int64_t)a3 parameter:(void *)a4 fetchAttributes:(BOOL)a5
{
  BOOL v5 = a5;
  v28[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
LABEL_2:
    CFTypeRef result = 0;
    goto LABEL_3;
  }
  CFIndex v11 = [(AXUIElement *)self _cachedValueForAttribute:a3];
  CFTypeRef result = v11;
  if (v11)
  {
    CFTypeRef v12 = v11;
    CFTypeID v13 = CFGetTypeID(v11);
    if (v13 == CFArrayGetTypeID()) {
      goto LABEL_16;
    }
    goto LABEL_2;
  }
LABEL_3:
  if (!self->_isValid) {
    goto LABEL_26;
  }
  axElement = self->_axElement;
  if (!axElement) {
    goto LABEL_26;
  }
  if (a4) {
    AXError v10 = AXUIElementCopyParameterizedAttributeValue(axElement, (CFStringRef)a3, a4, &result);
  }
  else {
    AXError v10 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &result);
  }
  AXError v14 = v10;
  if (!result) {
    goto LABEL_24;
  }
  CFAutorelease(result);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  CFTypeRef v12 = result;
  if ((isKindOfClass & 1) == 0)
  {
    v28[0] = result;
    long long v16 = (void *)MEMORY[0x1E4F1C978];
    long long v17 = (id)result;
    CFTypeRef v12 = (CFTypeRef)[v16 arrayWithObjects:v28 count:1];

    CFTypeRef result = v12;
  }
  if (v14 || !v12)
  {
LABEL_24:
    if (v14 == kAXErrorInvalidUIElement) {
      [(AXUIElement *)self _invalidate];
    }
    goto LABEL_26;
  }
LABEL_16:
  CFTypeID v18 = CFGetTypeID(v12);
  if (v18 != CFArrayGetTypeID())
  {
LABEL_26:
    uint64_t v19 = 0;
    goto LABEL_27;
  }
  uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
  CFIndex Count = CFArrayGetCount((CFArrayRef)result);
  if (Count >= 1)
  {
    CFIndex v21 = Count;
    for (CFIndex i = 0; i != v21; ++i)
    {
      ValueAtIndefloat x = CFArrayGetValueAtIndex((CFArrayRef)result, i);
      if (v5)
      {
        __int16 v24 = +[AXUIElement uiElementWithAXElement:ValueAtIndex];
      }
      else
      {
        int64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
        __int16 v24 = +[AXUIElement uiElementWithAXElement:ValueAtIndex cache:v25];
      }
      [v19 addObject:v24];
    }
  }
LABEL_27:
  return v19;
}

- (id)uiElementsWithAttribute:(int64_t)a3
{
  return [(AXUIElement *)self uiElementsWithAttribute:a3 parameter:0];
}

- (id)nextElementsWithParameters:(id)a3
{
  return [(AXUIElement *)self _elementsWithParameter:92501 parameters:a3 prefetchAttributes:0];
}

- (id)previousElementsWithParameters:(id)a3
{
  return [(AXUIElement *)self _elementsWithParameter:92502 parameters:a3 prefetchAttributes:0];
}

- (id)nextElementsWithCount:(unint64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = @"elementCount";
  AXError v4 = [NSNumber numberWithUnsignedInteger:a3];
  v9[0] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  char v6 = [(AXUIElement *)self _elementsWithParameter:92501 parameters:v5 prefetchAttributes:0];

  return v6;
}

- (id)nextElementsIncludingPrefetchedAttributesWithCount:(unint64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = @"elementCount";
  AXError v4 = [NSNumber numberWithUnsignedInteger:a3];
  v9[0] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  char v6 = [(AXUIElement *)self _elementsWithParameter:92501 parameters:v5 prefetchAttributes:1];

  return v6;
}

- (id)previousElementsWithCount:(unint64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = @"elementCount";
  AXError v4 = [NSNumber numberWithUnsignedInteger:a3];
  v9[0] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  char v6 = [(AXUIElement *)self _elementsWithParameter:92502 parameters:v5 prefetchAttributes:0];

  return v6;
}

- (id)childrenIncludingPrefetchedAttributesWithCount:(unint64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = @"elementCount";
  AXError v4 = [NSNumber numberWithUnsignedInteger:a3];
  v9[0] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  char v6 = [(AXUIElement *)self _elementsWithParameter:95252 parameters:v5 prefetchAttributes:1];

  return v6;
}

- (id)_elementsWithParameter:(int64_t)a3 parameters:(id)a4 prefetchAttributes:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  if (!self->_isValid)
  {
    CFTypeRef result = 0;
    goto LABEL_16;
  }
  axElement = self->_axElement;
  CFTypeRef result = 0;
  if (!axElement
    || ((AXError v11 = AXUIElementCopyParameterizedAttributeValue(axElement, (CFStringRef)a3, v9, &result),
         CFTypeRef v12 = result,
         v11 == kAXErrorSuccess)
      ? (BOOL v13 = result == 0)
      : (BOOL v13 = 1),
        v13 ? (BOOL v14 = v11 == kAXErrorNoValue) : (BOOL v14 = 1),
        v14))
  {
LABEL_16:
    long long v16 = [v9 objectForKey:@"elementCount"];
    uint64_t v17 = [v16 unsignedIntegerValue];

    if (!v17)
    {
      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2 object:self file:@"AXUIElement.m" lineNumber:2138 description:@"A count parameter must be passed to this method"];
    }
    CFTypeID v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v17];
    if (result)
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)result);
      if (Count >= 1)
      {
        CFIndex v20 = Count;
        for (CFIndex i = 0; i != v20; ++i)
        {
          ValueAtIndefloat x = CFArrayGetValueAtIndex((CFArrayRef)result, i);
          if (v5) {
            +[AXUIElement uiElementWithAXElement:ValueAtIndex];
          }
          else {
          uint64_t v23 = +[AXUIElement uiElementWithAXElement:ValueAtIndex cache:0];
          }
          [v18 addObject:v23];
        }
      }
      CFRelease(result);
    }
    __int16 v24 = [(AXUIElement *)self stringWithAXAttribute:3003];
    if (AXProcessWantsMLElementsForBundle((uint64_t)v24))
    {
      int64_t v25 = [(AXUIElement *)self numberWithAXAttribute:2004];
      if (([v25 unsignedLongValue] & 0x400000) == 0)
      {
        BOOL v28 = [(AXUIElement *)self BOOLWithAXAttribute:2044];

        if (!v28)
        {
          id v26 = +[AXUIMLElement elementsInDirection:a3 withElement:self nextElements:v18];
          goto LABEL_31;
        }
LABEL_30:
        id v26 = v18;
LABEL_31:
        CFTypeID v15 = v26;

        goto LABEL_32;
      }
    }
    goto LABEL_30;
  }
  if (v11 == kAXErrorInvalidUIElement)
  {
    [(AXUIElement *)self _invalidate];
    CFTypeRef v12 = result;
  }
  if (v12) {
    CFRelease(v12);
  }
  CFTypeID v15 = 0;
LABEL_32:

  return v15;
}

- (void)setAXAttribute:(int64_t)a3 withBOOL:(BOOL)a4
{
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      char v6 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
      if (!a4) {
        char v6 = (CFTypeRef *)MEMORY[0x1E4F1CFC8];
      }
      if (AXUIElementSetAttributeValue(axElement, (CFStringRef)a3, *v6) == kAXErrorInvalidUIElement)
      {
        [(AXUIElement *)self _invalidate];
      }
    }
  }
}

- (void)setAXAttribute:(int64_t)a3 withString:(id)a4
{
  id v6 = a4;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      id v8 = v6;
      if (AXUIElementSetAttributeValue(axElement, (CFStringRef)a3, v6) == kAXErrorInvalidUIElement) {
        [(AXUIElement *)self _invalidate];
      }
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)setAXAttribute:(int64_t)a3 withLong:(int64_t)a4
{
  id v6 = (id)[objc_allocWithZone(NSNumber) initWithLong:a4];
  [(AXUIElement *)self setAXAttribute:a3 withNumber:v6];
}

- (void)setAXAttribute:(int64_t)a3 withFloat:(float)a4
{
  id v7 = objc_allocWithZone(NSNumber);
  *(float *)&double v8 = a4;
  id v9 = (id)[v7 initWithFloat:v8];
  [(AXUIElement *)self setAXAttribute:a3 withNumber:v9];
}

- (void)setAXAttribute:(int64_t)a3 withNumber:(id)a4
{
  id v6 = a4;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement) {
      AXUIElementSetAttributeValue(axElement, (CFStringRef)a3, v6);
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)setAXAttribute:(int64_t)a3 withPoint:(CGPoint)a4
{
  CGPoint v8 = a4;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      AXValueRef v7 = AXValueCreate(kAXValueTypeCGPoint, &v8);
      if (AXUIElementSetAttributeValue(axElement, (CFStringRef)a3, v7) == kAXErrorInvalidUIElement) {
        [(AXUIElement *)self _invalidate];
      }
      CFRelease(v7);
    }
  }
}

- (void)setAXAttribute:(int64_t)a3 withSize:(CGSize)a4
{
  CGSize v8 = a4;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      AXValueRef v7 = AXValueCreate(kAXValueTypeCGSize, &v8);
      if (AXUIElementSetAttributeValue(axElement, (CFStringRef)a3, v7) == kAXErrorInvalidUIElement) {
        [(AXUIElement *)self _invalidate];
      }
      CFRelease(v7);
    }
  }
}

- (void)setAXAttribute:(int64_t)a3 withRange:(_NSRange)a4
{
  _NSRange v8 = a4;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      AXValueRef v7 = AXValueCreate(kAXValueTypeCFRange, &v8);
      if (AXUIElementSetAttributeValue(axElement, (CFStringRef)a3, v7) == kAXErrorInvalidUIElement) {
        [(AXUIElement *)self _invalidate];
      }
      CFRelease(v7);
    }
  }
}

- (void)setAXAttribute:(int64_t)a3 withUIElement:(id)a4
{
  id v6 = a4;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      id v10 = v6;
      _NSRange v8 = objc_opt_class();
      if ([v8 isSubclassOfClass:objc_opt_class()])
      {
        BOOL v9 = AXUIElementSetAttributeValue(axElement, (CFStringRef)a3, (CFTypeRef)[v10 axElement]) == kAXErrorInvalidUIElement;
        id v6 = v10;
        if (!v9) {
          goto LABEL_9;
        }
        [(AXUIElement *)self _invalidate];
      }
      else
      {
        [MEMORY[0x1E4F1CA00] raise:@"SCRCUIElementException" format:@"Passed in SCRCUIElement must be a (subclass of) SCRCUIElement."];
      }
      id v6 = v10;
    }
  }
LABEL_9:
}

- (void)setAXAttribute:(int64_t)a3 withUIElementArray:(id)a4
{
  id v6 = a4;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      id v16 = v6;
      if ([v6 count]
        && ([v16 objectAtIndex:0],
            _NSRange v8 = objc_claimAutoreleasedReturnValue(),
            BOOL v9 = objc_opt_class(),
            LODWORD(v9) = [v9 isSubclassOfClass:objc_opt_class()],
            v8,
            !v9))
      {
        [MEMORY[0x1E4F1CA00] raise:@"SCRCUIElementException" format:@"Passed in SCRCUIElement must be a (subclass of) SCRCUIElement."];
      }
      else
      {
        id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
        AXError v11 = [v16 objectEnumerator];
        uint64_t v12 = [v11 nextObject];
        if (v12)
        {
          BOOL v13 = (void *)v12;
          do
          {
            uint64_t v14 = [v13 axElement];
            if (v14) {
              [v10 addObject:v14];
            }
            uint64_t v15 = [v11 nextObject];

            BOOL v13 = (void *)v15;
          }
          while (v15);
        }
        if (AXUIElementSetAttributeValue(axElement, (CFStringRef)a3, v10) == kAXErrorInvalidUIElement) {
          [(AXUIElement *)self _invalidate];
        }
      }
      id v6 = v16;
    }
  }
}

- (void)setAXAttribute:(int64_t)a3 withArray:(id)a4
{
  id v6 = a4;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      id v8 = v6;
      if (AXUIElementSetAttributeValue(axElement, (CFStringRef)a3, v6) == kAXErrorInvalidUIElement) {
        [(AXUIElement *)self _invalidate];
      }
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)setAXAttribute:(int64_t)a3 withObject:(id)a4 synchronous:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      CFRetain(self->_axElement);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __53__AXUIElement_setAXAttribute_withObject_synchronous___block_invoke;
      v12[3] = &unk_1E6220A30;
      uint64_t v15 = axElement;
      int64_t v16 = a3;
      id v13 = v8;
      uint64_t v14 = self;
      id v10 = (void (**)(void))_Block_copy(v12);
      AXError v11 = v10;
      if (v5) {
        v10[2](v10);
      }
      else {
        dispatch_async((dispatch_queue_t)_ElementChangedQueue, v10);
      }
    }
  }
}

void __53__AXUIElement_setAXAttribute_withObject_synchronous___block_invoke(uint64_t a1)
{
  if (AXUIElementSetAttributeValue(*(AXUIElementRef *)(a1 + 48), *(CFStringRef *)(a1 + 56), *(CFTypeRef *)(a1 + 32)) == kAXErrorInvalidUIElement) {
    [*(id *)(a1 + 40) _invalidate];
  }
  dispatch_queue_t v2 = *(const void **)(a1 + 48);
  CFRelease(v2);
}

- (BOOL)isMockElement
{
  return 0;
}

- (BOOL)isMLElement
{
  return 0;
}

- (void)setAXAttribute:(int64_t)a3 withObject:(id)a4
{
}

- (_NSRange)_selectedTextRange
{
  [(AXUIElement *)self updateCache:2005];
  NSUInteger v3 = [(AXUIElement *)self rangeWithAXAttribute:2005];
  result.length = v4;
  result.location = v3;
  return result;
}

- (id)_objectForRange:(_NSRange)a3 withParameterizedAttribute:(int64_t)a4
{
  _NSRange v10 = a3;
  AXValueRef v6 = AXValueCreate(kAXValueTypeCFRange, &v10);
  if (v6)
  {
    AXValueRef v7 = v6;
    id v8 = [(AXUIElement *)self objectWithAXAttribute:a4 parameter:v6];
    CFRelease(v7);
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)_attributedValueForRange:(_NSRange)a3
{
  NSUInteger v3 = -[AXUIElement _objectForRange:withParameterizedAttribute:](self, "_objectForRange:withParameterizedAttribute:", a3.location, a3.length, 92508);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_valueForRange:(_NSRange)a3
{
  NSUInteger v3 = -[AXUIElement _objectForRange:withParameterizedAttribute:](self, "_objectForRange:withParameterizedAttribute:", a3.location, a3.length, 92505);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (int64_t)_lineStartPosition
{
  [(AXUIElement *)self updateCache:4001];
  NSUInteger v3 = [(AXUIElement *)self numberWithAXAttribute:4001];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (int64_t)_lineEndPosition
{
  [(AXUIElement *)self updateCache:4002];
  NSUInteger v3 = [(AXUIElement *)self numberWithAXAttribute:4002];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (_NSRange)_lineRangeForPosition:(unint64_t)a3
{
  long long v8 = xmmword_1BA6A62B0;
  NSUInteger v3 = -[AXUIElement objectWithAXAttribute:parameter:](self, "objectWithAXAttribute:parameter:", 94009, [NSNumber numberWithUnsignedInteger:a3]);
  if (v3 && (v4 = v3, CFTypeID v5 = CFGetTypeID(v3), v5 == AXValueGetTypeID()) && AXValueGetType(v4) == kAXValueTypeCFRange)
  {
    AXValueGetValue(v4, kAXValueTypeCFRange, &v8);
    NSUInteger v7 = *((void *)&v8 + 1);
    NSUInteger v6 = v8;
  }
  else
  {
    NSUInteger v7 = 0;
    NSUInteger v6 = 0x7FFFFFFFLL;
  }
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)nextCursorRangeInDirection:(unint64_t)a3 unit:(unint64_t)a4 outputRange:(_NSRange *)a5
{
  uint64_t v10 = [(AXUIElement *)self _selectedTextRange];
  NSUInteger v11 = -[AXUIElement nextCursorRangeInDirection:unit:outputRange:currentCursorRange:](self, "nextCursorRangeInDirection:unit:outputRange:currentCursorRange:", a3, a4, a5, v10, v9);
  result.length = v12;
  result.location = v11;
  return result;
}

- (_NSRange)_lineRangeWithFaultTolerance:(int64_t)a3 forward:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  do
  {
    if (v4) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = v7;
    }
    NSUInteger v10 = [(AXUIElement *)self _lineRangeForPosition:v9 + a3];
    BOOL v12 = v10 != 0x7FFFFFFF || v8++ >= 2;
    --v7;
  }
  while (!v12);
  result.length = v11;
  result.location = v10;
  return result;
}

- (_NSRange)nextCursorRangeInDirection:(unint64_t)a3 unit:(unint64_t)a4 outputRange:(_NSRange *)a5 currentCursorRange:(_NSRange)a6
{
  NSUInteger v7 = 0x7FFFFFFFLL;
  if (a6.location == 0x7FFFFFFF) {
    NSUInteger v8 = 0x7FFFFFFFLL;
  }
  else {
    NSUInteger v8 = a6.location + a6.length;
  }
  if (a6.location == 0x7FFFFFFF) {
    NSUInteger length = a6.length;
  }
  else {
    NSUInteger length = 0;
  }
  switch(a4)
  {
    case 0uLL:
      id v13 = [(AXUIElement *)self stringWithAXAttribute:2006];
      uint64_t v14 = -[AXUIElement _attributedValueForRange:](self, "_attributedValueForRange:", 0, [v13 length]);
      uint64_t v15 = v14;
      if (a3)
      {
        if (!v8 || ![v14 length] || v8 - 1 >= objc_msgSend(v15, "length"))
        {
          uint64_t v23 = v8 - 1;
          uint64_t v30 = 1;
LABEL_42:

          goto LABEL_43;
        }
        int64_t v16 = v15;
        NSUInteger v17 = v8 - 1;
LABEL_41:
        uint64_t v23 = [v16 rangeOfComposedCharacterSequenceAtIndex:v17];
        uint64_t v30 = v31;
        goto LABEL_42;
      }
      if (v8 < [v14 length])
      {
        int64_t v16 = v15;
        NSUInteger v17 = v8;
        goto LABEL_41;
      }

      uint64_t v33 = 0x7FFFFFFFLL;
      goto LABEL_65;
    case 1uLL:
      if (v8 >= 0x64) {
        uint64_t v18 = 100;
      }
      else {
        uint64_t v18 = v8;
      }
      NSUInteger v19 = v8 - v18;
      id v13 = -[AXUIElement _valueForRange:](self, "_valueForRange:", v19, 200);
      uint64_t v20 = objc_msgSend(v13, "ax_wordFromPosition:inDirection:", v18, a3);
      goto LABEL_32;
    case 2uLL:
      if (v8 == 0x7FFFFFFF) {
        NSUInteger v8 = 0;
      }
      if (!a3)
      {
        uint64_t v42 = [(AXUIElement *)self _lineRangeWithFaultTolerance:v8 forward:1];
        uint64_t v44 = v42 + v43;
        NSUInteger v7 = 0x7FFFFFFFLL;
        if (v42 + v43 != 0x7FFFFFFF)
        {
          if (length + v8 != v44)
          {
            uint64_t v47 = [(AXUIElement *)self _lineRangeWithFaultTolerance:v8 forward:1];
            BOOL v51 = v47 == 0x7FFFFFFF;
            if (v47 == 0x7FFFFFFF) {
              uint64_t v30 = 0;
            }
            else {
              uint64_t v30 = v44 - v47;
            }
            goto LABEL_82;
          }
          NSUInteger v24 = v8 + 1;
          int64_t v25 = self;
          uint64_t v26 = 1;
          goto LABEL_69;
        }
LABEL_61:
        NSUInteger v32 = 0;
        goto LABEL_62;
      }
      uint64_t v22 = [(AXUIElement *)self _lineRangeWithFaultTolerance:v8 forward:0];
      NSUInteger v7 = 0x7FFFFFFFLL;
      if (v22 == 0x7FFFFFFF) {
        goto LABEL_61;
      }
      uint64_t v23 = v22;
      if (v22 == v8)
      {
        if (!v8)
        {
          uint64_t v48 = 0;
          uint64_t v47 = 0x7FFFFFFFLL;
LABEL_79:
          BOOL v51 = v47 == 0x7FFFFFFF;
          if (v47 == 0x7FFFFFFF) {
            uint64_t v30 = 0;
          }
          else {
            uint64_t v30 = v48;
          }
LABEL_82:
          if (v51) {
            uint64_t v23 = -1;
          }
          else {
            uint64_t v23 = v47;
          }
          goto LABEL_44;
        }
        NSUInteger v24 = v8 - 1;
        int64_t v25 = self;
        uint64_t v26 = 0;
LABEL_69:
        uint64_t v47 = [(AXUIElement *)v25 _lineRangeWithFaultTolerance:v24 forward:v26];
        goto LABEL_79;
      }
      uint64_t v49 = [(AXUIElement *)self _lineRangeWithFaultTolerance:v8 forward:0];
      if (v49 + v50 == 0x7FFFFFFF) {
        uint64_t v30 = 0;
      }
      else {
        uint64_t v30 = v49 + v50 - v23;
      }
      if (v49 + v50 == 0x7FFFFFFF) {
        uint64_t v23 = -1;
      }
LABEL_44:
      NSUInteger v32 = 0;
      NSUInteger v7 = 0x7FFFFFFFLL;
      if (v23 < 0)
      {
LABEL_62:
        uint64_t v33 = 0x7FFFFFFFLL;
LABEL_63:
        if (!a5) {
          goto LABEL_65;
        }
        goto LABEL_64;
      }
      uint64_t v33 = 0x7FFFFFFFLL;
      if (v23 == 0x7FFFFFFF) {
        goto LABEL_63;
      }
      uint64_t v34 = -[AXUIElement _valueForRange:](self, "_valueForRange:", v23, v30);
      uint64_t v35 = [v34 length];
      if (a4 == 2 || v35)
      {
        if (a3 || a4 != 2)
        {
          if (a3) {
            uint64_t v41 = 0;
          }
          else {
            uint64_t v41 = v30;
          }
          uint64_t v33 = v23 + v41;
        }
        else
        {
          BOOL v36 = [v34 rangeOfString:@"\n"] == 0;
          uint64_t v37 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
          uint64_t v38 = [v34 stringByTrimmingCharactersInSet:v37];

          uint64_t v39 = [v34 length];
          uint64_t v40 = v39 - [v38 length] - v36;
          if (v40 == v30) {
            uint64_t v40 = 0;
          }
          uint64_t v33 = v23 + v30 - v40;
        }
      }
      else
      {
        uint64_t v33 = 0x7FFFFFFFLL;
      }

      NSUInteger v7 = v23;
      NSUInteger v32 = v30;
      if (a5)
      {
LABEL_64:
        a5->location = v7;
        a5->NSUInteger length = v32;
      }
LABEL_65:
      NSUInteger v45 = v33;
      NSUInteger v46 = 0;
      result.NSUInteger length = v46;
      result.location = v45;
      return result;
    case 3uLL:
      if (v8 >= 0x12C) {
        uint64_t v27 = 300;
      }
      else {
        uint64_t v27 = v8;
      }
      NSUInteger v19 = v8 - v27;
      id v13 = -[AXUIElement _valueForRange:](self, "_valueForRange:", v19, 300);
      uint64_t v20 = objc_msgSend(v13, "ax_sentenceFromPosition:inDirection:", v27, a3);
      goto LABEL_32;
    case 4uLL:
      if (v8 >= 0x7D0) {
        uint64_t v28 = 2000;
      }
      else {
        uint64_t v28 = v8;
      }
      NSUInteger v19 = v8 - v28;
      id v13 = -[AXUIElement _valueForRange:](self, "_valueForRange:", v19, 2000);
      uint64_t v20 = objc_msgSend(v13, "ax_paragraphFromPosition:inDirection:", v28, a3);
LABEL_32:
      uint64_t v29 = v20 + v19;
      if (v20 == 0x7FFFFFFF) {
        uint64_t v30 = 0;
      }
      else {
        uint64_t v30 = v21;
      }
      if (v20 == 0x7FFFFFFF) {
        uint64_t v23 = -1;
      }
      else {
        uint64_t v23 = v29;
      }
LABEL_43:

      goto LABEL_44;
    default:
      goto LABEL_61;
  }
}

- (void).cxx_destruct
{
}

@end