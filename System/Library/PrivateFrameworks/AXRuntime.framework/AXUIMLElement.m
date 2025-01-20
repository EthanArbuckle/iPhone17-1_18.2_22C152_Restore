@interface AXUIMLElement
+ ($70A309F2B59E63663966B62550FEA657)_windowContextInformation:(SEL)a3;
+ (BOOL)performFuzzyHitTestNextTime;
+ (CGRect)_appRelativeRectForRect:(CGRect)a3 contextId:(unsigned int)a4;
+ (CGRect)_convertFrameToPortraitUp:(CGRect)a3 fromOrientation:(int64_t)a4 appFrame:(CGRect)a5;
+ (CGRect)_screenRelativeRectForRect:(CGRect)a3 contextId:(unsigned int)a4;
+ (id)_cachedMLElementsForID:(id)a3;
+ (id)_textDetectionOptions:(id)a3 options:(id)a4;
+ (id)cachedElementForParent:(__AXUIElement *)a3;
+ (id)elementsInDirection:(int64_t)a3 withElement:(id)a4 nextElements:(id)a5;
+ (id)sharedFingerController;
+ (int64_t)_interfaceOrientationForElement:(id)a3;
+ (void)_applyAXTraitsForElement:(id)a3 uiClass:(int64_t)a4;
+ (void)_fireRefreshTimer;
+ (void)_queue_createMLElements:(id)a3 postDelegateCallback:(BOOL)a4;
+ (void)_setCachedMLElements:(id)a3 forID:(id)a4;
+ (void)clearCaches;
+ (void)clearCachesForAppsExcluding:(id)a3;
+ (void)initialize;
+ (void)setAutoRefresh:(BOOL)a3 forApp:(id)a4;
+ (void)setFrameDelegate:(id)a3;
+ (void)setPerformFuzzyHitTestNextTime:(BOOL)a3;
- (AXUIMLElement)initWithParentElement:(__AXUIElement *)a3;
- (BOOL)BOOLWithAXAttribute:(int64_t)a3;
- (BOOL)_handleScroll:(int)a3;
- (BOOL)_handleScrollToVisible:(id)a3;
- (BOOL)_isTopLevelMLElement;
- (BOOL)_shouldDemoteElement:(id)a3 withMLElements:(id)a4;
- (BOOL)_shouldPromoteElement:(id)a3;
- (BOOL)_simulateScrollAction:(int)a3 withScreenDistanceFactor:(double)a4 forVisibleAction:(BOOL)a5;
- (BOOL)canPerformAXAction:(int)a3;
- (BOOL)isMLElement;
- (BOOL)isProbablyEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)isValidForApplication:(id)a3;
- (BOOL)performAXAction:(int)a3;
- (BOOL)performAXAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5;
- (CGColor)colorWithAXAttribute:(int64_t)a3;
- (CGPath)pathWithAXAttribute:(int64_t)a3;
- (CGPoint)pointWithAXAttribute:(int64_t)a3;
- (CGPoint)rotatedCenterPoint;
- (CGRect)portraitUpFrame;
- (CGRect)rectWithAXAttribute:(int64_t)a3;
- (CGRect)rotatedFrame;
- (CGRect)screenFrame;
- (NSString)label;
- (_NSRange)rangeWithAXAttribute:(int64_t)a3;
- (__AXUIElement)copyElementAtPosition:(CGPoint)a3;
- (id)_appElement;
- (id)_currentMLElements;
- (id)_findMatchingElementForMLElement:(id)a3 flattenedAppElements:(id)a4;
- (id)_flattenedAppElements;
- (id)_reconcileAppElementsWithMLElements:(id)a3 flattenedElements:(id)a4;
- (id)_reconcileElements:(id)a3;
- (id)_reconciledElements;
- (id)_topLevelAppElement;
- (id)_topLevelMLElement;
- (id)arrayWithAXAttribute:(int64_t)a3;
- (id)nextElementsWithCount:(unint64_t)a3;
- (id)nextElementsWithCount:(unint64_t)a3 baseElement:(id)a4;
- (id)nextElementsWithParameters:(id)a3;
- (id)numberWithAXAttribute:(int64_t)a3;
- (id)objectWithAXAttribute:(int64_t)a3;
- (id)objectWithAXAttribute:(int64_t)a3 parameter:(void *)a4;
- (id)previousElementsWithCount:(unint64_t)a3;
- (id)previousElementsWithCount:(unint64_t)a3 baseElement:(id)a4;
- (id)previousElementsWithParameters:(id)a3;
- (id)stringWithAXAttribute:(int64_t)a3;
- (id)uiElementsWithAttribute:(int64_t)a3;
- (id)uiElementsWithAttribute:(int64_t)a3 parameter:(void *)a4;
- (id)uiElementsWithAttribute:(int64_t)a3 parameter:(void *)a4 fetchAttributes:(BOOL)a5;
- (id)valueArrayWithAXAttributes:(__CFArray *)a3;
- (unint64_t)mlGeneration;
- (void)_applyCustomActionsForFeature:(id)a3 screenScale:(double)a4 screenRect:(CGRect)a5 elements:(id)a6;
- (void)_forceMLElementRefresh:(id)a3 postDelegateCallback:(BOOL)a4 completionBlock:(id)a5;
- (void)copyAttributeValue:(int64_t)a3;
- (void)copyAttributeValue:(int64_t)a3 parameter:(void *)a4;
- (void)copyAttributeValue:(int64_t)a3 parameter:(void *)a4 baseElement:(id)a5;
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
- (void)setLabel:(id)a3;
- (void)setMlGeneration:(unint64_t)a3;
- (void)setPortraitUpFrame:(CGRect)a3;
- (void)setRotatedCenterPoint:(CGPoint)a3;
- (void)setRotatedFrame:(CGRect)a3;
- (void)setScreenFrame:(CGRect)a3;
- (void)updateCacheWithAttributes:(id)a3;
@end

@implementation AXUIMLElement

+ (void)setPerformFuzzyHitTestNextTime:(BOOL)a3
{
  AXPerformFuzzyHitTestNextTime = a3;
}

+ (BOOL)performFuzzyHitTestNextTime
{
  return AXPerformFuzzyHitTestNextTime;
}

+ (void)setFrameDelegate:(id)a3
{
}

+ (id)cachedElementForParent:(__AXUIElement *)a3
{
  v3 = (void *)MLElementCache;
  v4 = [NSNumber numberWithUnsignedLongLong:_AXUIElementIDForElement((uint64_t)a3)];
  v5 = [v3 objectForKeyedSubscript:v4];

  return v5;
}

+ (id)sharedFingerController
{
  if (sharedFingerController_onceToken != -1) {
    dispatch_once(&sharedFingerController_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)sharedFingerController___fingerController;
  return v2;
}

void __39__AXUIMLElement_sharedFingerController__block_invoke()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)getAXPIFingerControllerClass_softClass;
  uint64_t v8 = getAXPIFingerControllerClass_softClass;
  if (!getAXPIFingerControllerClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getAXPIFingerControllerClass_block_invoke;
    v4[3] = &unk_1E6220520;
    v4[4] = &v5;
    __getAXPIFingerControllerClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = v0;
  _Block_object_dispose(&v5, 8);
  id v2 = objc_alloc_init(v1);
  v3 = (void *)sharedFingerController___fingerController;
  sharedFingerController___fingerController = (uint64_t)v2;
}

- (AXUIMLElement)initWithParentElement:(__AXUIElement *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (initWithParentElement__onceToken == -1)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_17:
    -[AXUIMLElement initWithParentElement:]();
  }
  dispatch_once(&initWithParentElement__onceToken, &__block_literal_global_282);
  if (!a3) {
    goto LABEL_17;
  }
LABEL_3:
  pid_t pid = 0;
  AXUIElementGetPid(a3, &pid);
  uint64_t v5 = pid;
  if (pid < 0)
  {
    if (_mlCacheIdx == 9998) {
      uint64_t v6 = 10000;
    }
    else {
      uint64_t v6 = _mlCacheIdx + 1;
    }
    _mlCacheIdx = v6;
    uint64_t v8 = v6;
  }
  else
  {
    uint64_t v6 = _AXUIElementIDForElement((uint64_t)a3);
    uint64_t v8 = v7;
    uint64_t v5 = pid;
    if (pid >= 1)
    {
      uint64_t v5 = -pid;
      pid_t pid = -pid;
    }
  }
  v9 = (const void *)_AXUIElementCreateWithPIDAndID(v5, v6, v8);
  v18.receiver = self;
  v18.super_class = (Class)AXUIMLElement;
  v10 = [(AXUIElement *)&v18 initWithAXElement:v9];
  CFRelease(v9);
  v11 = (void *)MLElementCache;
  v12 = [NSNumber numberWithUnsignedLongLong:v6];
  [v11 setObject:v10 forKey:v12];

  if (v9 && !CFEqual(a3, v9))
  {
    uint64_t v13 = +[AXUIElement uiElementWithAXElement:a3];
    parent = v10->_parent;
    v10->_parent = (AXUIElement *)v13;
  }
  v15 = AXMediaLogMLElement();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = v10->_parent;
    *(_DWORD *)buf = 138412290;
    v21 = v16;
    _os_log_impl(&dword_1BA657000, v15, OS_LOG_TYPE_INFO, "Initializing MLElement with parent: %@", buf, 0xCu);
  }

  return v10;
}

uint64_t __39__AXUIMLElement_initWithParentElement___block_invoke()
{
  MLElementCache = [MEMORY[0x1E4F1CA60] dictionary];
  return MEMORY[0x1F41817F8]();
}

- (BOOL)_isTopLevelMLElement
{
  return [(AXUIElement *)self->_parent pid] > 0;
}

- (id)_topLevelMLElement
{
  v3 = self->_parent;
  if (v3)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      if ([(AXUIElement *)self->_parent _isTopLevelMLElement]) {
        break;
      }
      v4 = v3[1].super.isa;

      v3 = (AXUIElement *)v4;
    }
    while (v4);
  }
  return v3;
}

- (id)_appElement
{
  id v2 = [(AXUIMLElement *)self _topLevelAppElement];
  v3 = [v2 uiElementsWithAttribute:2017];
  v4 = [v3 firstObject];

  return v4;
}

- (id)_topLevelAppElement
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  hostingParent = self->_hostingParent;
  if (!hostingParent)
  {
    v4 = self->_parent;
    if (v4)
    {
      do
      {
        if (([(AXUIElement *)v4 pid] & 0x80000000) == 0) {
          break;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        uint64_t v5 = v4[1].super.isa;

        v4 = (AXUIElement *)v5;
      }
      while (v5);
    }
    uint64_t v6 = [(AXUIElement *)v4 objectWithAXAttribute:5002];

    if (!v6)
    {
      [(AXUIElement *)self->_parent updateCache:5002];
      uint64_t v6 = [(AXUIElement *)self->_parent objectWithAXAttribute:5002];
    }
    uint64_t v7 = +[AXUIElement uiElementWithAXElement:v6];
    uint64_t v8 = self->_hostingParent;
    self->_hostingParent = v7;

    hostingParent = self->_hostingParent;
    if (!hostingParent) {
      hostingParent = self->_parent;
    }
  }
  v9 = hostingParent;
  v10 = AXMediaLogMLElement();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    parent = self->_parent;
    v12 = self->_hostingParent;
    int v14 = 138412546;
    v15 = parent;
    __int16 v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_1BA657000, v10, OS_LOG_TYPE_INFO, "Top level app MLElement %@/%@", (uint8_t *)&v14, 0x16u);
  }

  return v9;
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)isValidForApplication:(id)a3
{
  return 1;
}

- (id)arrayWithAXAttribute:(int64_t)a3
{
  if (a3 == 2036)
  {
    v4 = self->_customActions;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)stringWithAXAttribute:(int64_t)a3
{
  id v4 = 0;
  if (a3 > 2070)
  {
    if (a3 == 2071)
    {
      uint64_t v8 = NSString;
      NSUInteger v9 = [(NSString *)self->_label hash];
      NSUInteger v10 = [(NSString *)self->_value hash];
      int64_t uiClass = self->_uiClass;
      uint64_t v6 = NSStringFromSize(self->_rotatedFrame.size);
      uint64_t v7 = [v8 stringWithFormat:@"%lu-%lu-%ld-%@", v9, v10, uiClass, v6];
    }
    else
    {
      if (a3 != 3003) {
        goto LABEL_12;
      }
      uint64_t v6 = [(AXUIMLElement *)self _topLevelAppElement];
      uint64_t v7 = [v6 stringWithAXAttribute:3003];
    }
    id v4 = (id)v7;
  }
  else
  {
    if (a3 == 2001)
    {
      uint64_t v5 = 128;
    }
    else
    {
      if (a3 != 2006) {
        goto LABEL_12;
      }
      uint64_t v5 = 96;
    }
    id v4 = *(id *)((char *)&self->super.super.isa + v5);
  }
LABEL_12:
  return v4;
}

- (BOOL)BOOLWithAXAttribute:(int64_t)a3
{
  LOBYTE(v4) = 0;
  if (a3 <= 2064)
  {
    if (a3 == 2016)
    {
      return ![(AXUIMLElement *)self _isTopLevelMLElement];
    }
    else if (a3 == 2046)
    {
      goto LABEL_8;
    }
    return v4;
  }
  if (a3 != 2065)
  {
    if (a3 == 3026 || a3 == 3066)
    {
      uint64_t v5 = [(AXUIMLElement *)self _topLevelAppElement];
      char v6 = [v5 BOOLWithAXAttribute:a3];

      return v6;
    }
    return v4;
  }
LABEL_8:
  return [(AXUIMLElement *)self _isTopLevelMLElement];
}

- (id)numberWithAXAttribute:(int64_t)a3
{
  if (a3 <= 2051)
  {
    if (a3 == 2004)
    {
      uint64_t v5 = NSNumber;
      unint64_t traits = self->_traits;
      uint64_t v3 = [(AXUIMLElement *)self _topLevelAppElement];
      uint64_t v7 = [v3 numberWithAXAttribute:2004];
      BOOL v4 = objc_msgSend(v5, "numberWithUnsignedLongLong:", objc_msgSend(v7, "unsignedIntegerValue") | traits);

      goto LABEL_10;
    }
    if (a3 == 2021)
    {
      uint64_t v3 = [(AXUIMLElement *)self _topLevelAppElement];
      BOOL v4 = [v3 numberWithAXAttribute:2021];
LABEL_10:

      goto LABEL_12;
    }
LABEL_8:
    BOOL v4 = &unk_1F1423C08;
    goto LABEL_12;
  }
  if (a3 != 2052)
  {
    if (a3 == 2701)
    {
      BOOL v4 = &unk_1F1423BF0;
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  BOOL v4 = &unk_1F1423FF8;
LABEL_12:
  return v4;
}

+ (CGRect)_appRelativeRectForRect:(CGRect)a3 contextId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGRect valuePtr = a3;
  if (_appRelativeRectForRect_contextId__onceToken != -1) {
    dispatch_once(&_appRelativeRectForRect_contextId__onceToken, &__block_literal_global_298);
  }
  NSUInteger v9 = NSString;
  NSUInteger v10 = [NSNumber numberWithUnsignedInt:v4];
  v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", x, y, width, height);
  v12 = [v9 stringWithFormat:@"%@_%@", v10, v11];

  uint64_t v13 = [(id)AppFrameCache objectForKeyedSubscript:v12];

  if (v13)
  {
    int v14 = [(id)AppFrameCache objectForKeyedSubscript:v12];
    [v14 rectValue];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
  }
  else
  {
    AXValueRef v23 = AXValueCreate(kAXValueTypeCGRect, &valuePtr);
    v24 = +[AXUIElement uiSystemWideApplication];
    v25 = (void *)MEMORY[0x1E4F1C978];
    v26 = [NSNumber numberWithUnsignedInt:v4];
    v27 = (const __AXValue *)objc_msgSend(v24, "objectWithAXAttribute:parameter:", 91505, objc_msgSend(v25, "arrayWithObjects:", v23, v26, 0));

    if (v23) {
      CFRelease(v23);
    }
    if (v27)
    {
      AXValueGetValue(v27, kAXValueTypeCGRect, &valuePtr);
      v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", valuePtr.origin.x, valuePtr.origin.y, valuePtr.size.width, valuePtr.size.height);
      [(id)AppFrameCache setObject:v28 forKeyedSubscript:v12];
    }
    CGFloat v20 = valuePtr.size.width;
    CGFloat v22 = valuePtr.size.height;
    CGFloat v16 = valuePtr.origin.x;
    CGFloat v18 = valuePtr.origin.y;
  }

  double v29 = v16;
  double v30 = v18;
  double v31 = v20;
  double v32 = v22;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

uint64_t __51__AXUIMLElement__appRelativeRectForRect_contextId___block_invoke()
{
  AppFrameCache = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (CGRect)_screenRelativeRectForRect:(CGRect)a3 contextId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = AXConvertPointToHostedCoordinates(*(uint64_t *)&a4, 0, a3.origin.x, a3.origin.y);
  double v11 = v10;
  double v12 = AXConvertPointToHostedCoordinates(v4, 0, x + width, y + height) - v9;
  double v14 = v13 - v11;
  double v15 = v9;
  double v16 = v11;
  return CGRectStandardize(*(CGRect *)&v15);
}

- (CGRect)rectWithAXAttribute:(int64_t)a3
{
  if ((a3 == 2003 || a3 == 2709 || a3 == 2057) && ![(AXUIMLElement *)self _isTopLevelMLElement])
  {
    [(AXUIMLElement *)self rotatedFrame];
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
    double v13 = v17;
  }
  else
  {
    uint64_t v5 = [(AXUIMLElement *)self _topLevelAppElement];
    [v5 rectWithAXAttribute:a3];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  double v21 = v13;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGPath)pathWithAXAttribute:(int64_t)a3
{
  if (a3 == 2042) {
    return 0;
  }
  uint64_t v5 = [(AXUIMLElement *)self _topLevelAppElement];
  double v6 = (CGPath *)[v5 pathWithAXAttribute:a3];

  return v6;
}

- (CGPoint)pointWithAXAttribute:(int64_t)a3
{
  if ((a3 == 2062 || a3 == 2007) && ![(AXUIMLElement *)self _isTopLevelMLElement])
  {
    [(AXUIMLElement *)self rotatedCenterPoint];
    if (*MEMORY[0x1E4F1DAD8] == v7 && *(double *)(MEMORY[0x1E4F1DAD8] + 8) == v6)
    {
      [(AXUIMLElement *)self rotatedFrame];
      CGFloat x = v16.origin.x;
      CGFloat y = v16.origin.y;
      CGFloat width = v16.size.width;
      CGFloat height = v16.size.height;
      CGFloat MidX = CGRectGetMidX(v16);
      v17.origin.CGFloat x = x;
      v17.origin.CGFloat y = y;
      v17.size.CGFloat width = width;
      v17.size.CGFloat height = height;
      double MidY = CGRectGetMidY(v17);
    }
    else
    {
      [(AXUIMLElement *)self rotatedCenterPoint];
      CGFloat MidX = v9;
    }
  }
  else
  {
    CGFloat MidX = *MEMORY[0x1E4F1DAD8];
    double MidY = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v14 = MidX;
  result.CGFloat y = MidY;
  result.CGFloat x = v14;
  return result;
}

- (_NSRange)rangeWithAXAttribute:(int64_t)a3
{
  NSUInteger v3 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v4 = 0;
  result.length = v4;
  result.location = v3;
  return result;
}

- (CGColor)colorWithAXAttribute:(int64_t)a3
{
  return 0;
}

- (id)objectWithAXAttribute:(int64_t)a3
{
  NSUInteger v4 = 0;
  if (a3 > 2999)
  {
    if (a3 == 3000 || a3 == 3009)
    {
      double v6 = [(AXUIMLElement *)self _topLevelAppElement];
      NSUInteger v4 = [v6 objectWithAXAttribute:a3];

      goto LABEL_15;
    }
    if (a3 != 5002) {
      goto LABEL_15;
    }
    v9.receiver = self;
    v9.super_class = (Class)AXUIMLElement;
    uint64_t v5 = [(AXUIElement *)&v9 objectWithAXAttribute:5002];
    goto LABEL_14;
  }
  if (a3 == 2017) {
    goto LABEL_12;
  }
  if (a3 == 2092)
  {
    uint64_t v5 = [(AXUIMLElement *)self _topLevelAppElement];
    goto LABEL_14;
  }
  if (a3 != 2142) {
    goto LABEL_15;
  }
  if (!self->_parent)
  {
LABEL_12:
    double v7 = [(AXUIMLElement *)self _topLevelAppElement];
    NSUInteger v4 = [v7 objectWithAXAttribute:2017];

    goto LABEL_15;
  }
  uint64_t v5 = [(AXUIElement *)self->_parent objectWithAXAttribute:2142];
LABEL_14:
  NSUInteger v4 = (void *)v5;
LABEL_15:
  return v4;
}

- (id)valueArrayWithAXAttributes:(__CFArray *)a3
{
  return 0;
}

- (id)uiElementsWithAttribute:(int64_t)a3
{
  if (a3 == 2017)
  {
    NSUInteger v3 = [(AXUIMLElement *)self _topLevelAppElement];
    NSUInteger v4 = [v3 uiElementsWithAttribute:2017];
  }
  else
  {
    NSUInteger v4 = 0;
  }
  return v4;
}

- (id)uiElementsWithAttribute:(int64_t)a3 parameter:(void *)a4
{
  return 0;
}

- (id)uiElementsWithAttribute:(int64_t)a3 parameter:(void *)a4 fetchAttributes:(BOOL)a5
{
  return 0;
}

- (id)objectWithAXAttribute:(int64_t)a3 parameter:(void *)a4
{
  return 0;
}

- (BOOL)canPerformAXAction:(int)a3
{
  if ((a3 - 2003) > 6) {
    return 0;
  }
  BOOL v3 = 1;
  if (((1 << (a3 + 45)) & 0x79) == 0) {
    return self->_uiClass == 6;
  }
  return v3;
}

- (BOOL)performAXAction:(int)a3
{
  return [(AXUIMLElement *)self performAXAction:*(void *)&a3 withValue:0 fencePort:0];
}

- (BOOL)performAXAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  switch((int)v6)
  {
    case 2003:
      BOOL v9 = [(AXUIMLElement *)self _handleScrollToVisible:v8];
      goto LABEL_10;
    case 2004:
      if (self->_uiClass != 6) {
        goto LABEL_11;
      }
      double v12 = self;
      uint64_t v13 = 2009;
      goto LABEL_9;
    case 2005:
      if (self->_uiClass == 6)
      {
        double v12 = self;
        uint64_t v13 = 2008;
LABEL_9:
        BOOL v9 = [(AXUIMLElement *)v12 performAXAction:v13];
LABEL_10:
        BOOL v14 = v9;
      }
      else
      {
LABEL_11:
        double v10 = [(AXUIMLElement *)self _topLevelAppElement];
        char v11 = [v10 performAXAction:v6 withValue:v8 fencePort:v5];
LABEL_12:
        BOOL v14 = v11;
      }
      return v14;
    case 2006:
    case 2007:
    case 2008:
    case 2009:
      BOOL v9 = [(AXUIMLElement *)self _handleScroll:v6];
      goto LABEL_10;
    default:
      double v10 = [(AXUIMLElement *)self _topLevelAppElement];
      char v11 = [v10 performAXAction:v6];
      goto LABEL_12;
  }
}

- (BOOL)_handleScrollToVisible:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = [a3 objectForKeyedSubscript:@"direction"];
  int v5 = [v4 intValue];

  [(AXUIMLElement *)self rotatedFrame];
  CGFloat v10 = v6;
  CGFloat v11 = v7;
  double v12 = v8;
  double v13 = v9;
  if (v5 == 2)
  {
    if (CGRectGetMinX(*(CGRect *)&v6) <= 60.0
      || (v40.origin.CGFloat x = v10,
          v40.origin.CGFloat y = v11,
          v40.size.CGFloat width = v12,
          v40.size.CGFloat height = v13,
          CGRectGetMinY(v40) <= 120.0))
    {
      uint64_t v22 = MEMORY[0x1E4F1DAD8];
      double v17 = *MEMORY[0x1E4F1DAD8];
      v41.origin.CGFloat x = v10;
      v41.origin.CGFloat y = v11;
      v41.size.CGFloat width = v12;
      v41.size.CGFloat height = v13;
      if (CGRectGetMinX(v41) < 60.0)
      {
        double v23 = *(double *)&ScaledScreenSize_0 * 0.3;
        if (*(double *)&ScaledScreenSize_0 * 0.3 <= v12) {
          double v23 = v12;
        }
        double v17 = v17 - v23;
      }
      double v19 = *(double *)(v22 + 8);
      v42.origin.CGFloat x = v10;
      v42.origin.CGFloat y = v11;
      v42.size.CGFloat width = v12;
      v42.size.CGFloat height = v13;
      if (CGRectGetMinY(v42) < 120.0)
      {
        double v24 = *(double *)&ScaledScreenSize_1 * 0.3;
        if (*(double *)&ScaledScreenSize_1 * 0.3 <= v13) {
          double v24 = v13;
        }
        double v19 = v19 - v24;
      }
      goto LABEL_25;
    }
    goto LABEL_15;
  }
  if (v5 == 1)
  {
    double v14 = *(double *)&ScaledScreenSize_1;
    double v15 = *(double *)&ScaledScreenSize_0 + -60.0;
    if (CGRectGetMaxX(*(CGRect *)&v6) >= v15
      || (v37.origin.CGFloat x = v10,
          v37.origin.CGFloat y = v11,
          v37.size.CGFloat width = v12,
          v37.size.CGFloat height = v13,
          CGRectGetMaxY(v37) >= v14 + -120.0))
    {
      uint64_t v16 = MEMORY[0x1E4F1DAD8];
      double v17 = *MEMORY[0x1E4F1DAD8];
      v38.origin.CGFloat x = v10;
      v38.origin.CGFloat y = v11;
      v38.size.CGFloat width = v12;
      v38.size.CGFloat height = v13;
      if (CGRectGetMaxX(v38) > v15)
      {
        double v18 = *(double *)&ScaledScreenSize_0 * 0.3;
        if (*(double *)&ScaledScreenSize_0 * 0.3 <= v12) {
          double v18 = v12;
        }
        double v17 = v17 + v18;
      }
      double v19 = *(double *)(v16 + 8);
      v39.origin.CGFloat x = v10;
      v39.origin.CGFloat y = v11;
      v39.size.CGFloat width = v12;
      v39.size.CGFloat height = v13;
      if (CGRectGetMaxY(v39) > v14 + -120.0)
      {
        double v20 = *(double *)&ScaledScreenSize_1 * 0.3;
        if (*(double *)&ScaledScreenSize_1 * 0.3 <= v13) {
          double v20 = v13;
        }
        double v19 = v19 + v20;
      }
      goto LABEL_25;
    }
LABEL_15:
    LOBYTE(v21) = 0;
    return v21;
  }
  double v17 = *MEMORY[0x1E4F1DAD8];
  double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
LABEL_25:
  v43.origin.CGFloat x = v10;
  v43.origin.CGFloat y = v11;
  v43.size.CGFloat width = v12;
  v43.size.CGFloat height = v13;
  double MidX = CGRectGetMidX(v43);
  v44.origin.CGFloat x = v10;
  v44.origin.CGFloat y = v11;
  v44.size.CGFloat width = v12;
  v44.size.CGFloat height = v13;
  v26 = +[AXUIElement scrollAncestorAtCoordinate:](AXUIElement, "scrollAncestorAtCoordinate:", MidX, CGRectGetMidY(v44));
  v27 = v26;
  if (v26)
  {
    [v26 updateCache:5064];
    [v27 pointWithAXAttribute:5064];
    v28 = AXMediaLogMLElement();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v27;
      _os_log_impl(&dword_1BA657000, v28, OS_LOG_TYPE_INFO, "Retrieving scroller to perform scrolling: %@", buf, 0xCu);
    }

    double v29 = [(AXUIMLElement *)self _appElement];
    double v30 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v17, v19);
    int v21 = [v27 performAXAction:2064 withValue:v30];

    if (v21)
    {
      [(id)MLElementTimer cancel];
      id v32 = v27;
      id v33 = v29;
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

uint64_t __40__AXUIMLElement__handleScrollToVisible___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateCache:5064];
  [*(id *)(a1 + 32) pointWithAXAttribute:5064];
  double v3 = v2 - *(double *)(a1 + 56);
  double v5 = v4 - *(double *)(a1 + 64);
  CGFloat v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__AXUIMLElement__handleScrollToVisible___block_invoke_2;
  v9[3] = &__block_descriptor_48_e5_v8__0l;
  *(double *)&v9[4] = v3;
  *(double *)&v9[5] = v5;
  return [v6 _forceMLElementRefresh:v7 postDelegateCallback:0 completionBlock:v9];
}

void __40__AXUIMLElement__handleScrollToVisible___block_invoke_2(NSPoint *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v2 = AXMediaLogMLElement();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    double v3 = NSStringFromPoint(a1[2]);
    int v5 = 138412290;
    CGFloat v6 = v3;
    _os_log_impl(&dword_1BA657000, v2, OS_LOG_TYPE_INFO, "Handling scroll to visible with actualized offset: %@", (uint8_t *)&v5, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained(&__frameDelegate);
  objc_msgSend(WeakRetained, "mlElementDetectorScrollToVisibleOccurred:", a1[2].x, a1[2].y);
}

- (BOOL)_handleScroll:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [(AXUIMLElement *)self _appElement];
  [(AXUIMLElement *)self rotatedFrame];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  double MidX = CGRectGetMidX(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGFloat v11 = +[AXUIElement scrollAncestorAtCoordinate:](AXUIElement, "scrollAncestorAtCoordinate:", MidX, CGRectGetMidY(v17));
  int v12 = [v11 performAXAction:v3 withValue:MEMORY[0x1E4F1CC28]];
  if (v11) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    BOOL v14 = [(AXUIMLElement *)self _simulateScrollAction:v3 withScreenDistanceFactor:0 forVisibleAction:0.75];
  }
  else
  {
    BOOL v14 = 1;
    [(AXUIMLElement *)self _forceMLElementRefresh:v5 postDelegateCallback:1 completionBlock:0];
  }

  return v14;
}

- (void)updateCacheWithAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(AXUIMLElement *)self _topLevelAppElement];
  [v5 updateCacheWithAttributes:v4];
}

- (id)nextElementsWithParameters:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"elementCount"];
  id v5 = -[AXUIMLElement nextElementsWithCount:baseElement:](self, "nextElementsWithCount:baseElement:", [v4 integerValue], 0);

  return v5;
}

- (id)previousElementsWithParameters:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"elementCount"];
  id v5 = -[AXUIMLElement previousElementsWithCount:baseElement:](self, "previousElementsWithCount:baseElement:", [v4 integerValue], 0);

  return v5;
}

- (id)nextElementsWithCount:(unint64_t)a3
{
  return [(AXUIMLElement *)self nextElementsWithCount:a3 baseElement:0];
}

- (id)nextElementsWithCount:(unint64_t)a3 baseElement:(id)a4
{
  return +[AXUIMLElement elementsInDirection:92501 withElement:self nextElements:0];
}

- (id)previousElementsWithCount:(unint64_t)a3
{
  return [(AXUIMLElement *)self previousElementsWithCount:a3 baseElement:0];
}

- (id)previousElementsWithCount:(unint64_t)a3 baseElement:(id)a4
{
  return +[AXUIMLElement elementsInDirection:92502 withElement:self nextElements:0];
}

- (void)setAXAttribute:(int64_t)a3 withBOOL:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AXUIMLElement *)self _topLevelAppElement];
  [v6 setAXAttribute:a3 withBOOL:v4];
}

- (void)setAXAttribute:(int64_t)a3 withString:(id)a4
{
  id v6 = a4;
  id v7 = [(AXUIMLElement *)self _topLevelAppElement];
  [v7 setAXAttribute:a3 withString:v6];
}

- (void)setAXAttribute:(int64_t)a3 withLong:(int64_t)a4
{
  id v6 = [(AXUIMLElement *)self _topLevelAppElement];
  [v6 setAXAttribute:a3 withLong:a4];
}

- (void)setAXAttribute:(int64_t)a3 withFloat:(float)a4
{
  id v7 = [(AXUIMLElement *)self _topLevelAppElement];
  *(float *)&double v6 = a4;
  [v7 setAXAttribute:a3 withFloat:v6];
}

- (void)setAXAttribute:(int64_t)a3 withNumber:(id)a4
{
  id v6 = a4;
  id v7 = [(AXUIMLElement *)self _topLevelAppElement];
  [v7 setAXAttribute:a3 withNumber:v6];
}

- (void)setAXAttribute:(int64_t)a3 withPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(AXUIMLElement *)self _topLevelAppElement];
  objc_msgSend(v7, "setAXAttribute:withPoint:", a3, x, y);
}

- (void)setAXAttribute:(int64_t)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = [(AXUIMLElement *)self _topLevelAppElement];
  objc_msgSend(v7, "setAXAttribute:withSize:", a3, width, height);
}

- (void)setAXAttribute:(int64_t)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = [(AXUIMLElement *)self _topLevelAppElement];
  objc_msgSend(v7, "setAXAttribute:withRange:", a3, location, length);
}

- (void)setAXAttribute:(int64_t)a3 withUIElement:(id)a4
{
  id v6 = a4;
  id v7 = [(AXUIMLElement *)self _topLevelAppElement];
  [v7 setAXAttribute:a3 withUIElement:v6];
}

- (void)setAXAttribute:(int64_t)a3 withUIElementArray:(id)a4
{
  id v6 = a4;
  id v7 = [(AXUIMLElement *)self _topLevelAppElement];
  [v7 setAXAttribute:a3 withUIElementArray:v6];
}

- (void)setAXAttribute:(int64_t)a3 withArray:(id)a4
{
  id v6 = a4;
  id v7 = [(AXUIMLElement *)self _topLevelAppElement];
  [v7 setAXAttribute:a3 withArray:v6];
}

- (void)setAXAttribute:(int64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  id v7 = [(AXUIMLElement *)self _topLevelAppElement];
  [v7 setAXAttribute:a3 withObject:v6];
}

- (void)setAXAttribute:(int64_t)a3 withObject:(id)a4 synchronous:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [(AXUIMLElement *)self _topLevelAppElement];
  [v9 setAXAttribute:a3 withObject:v8 synchronous:v5];
}

+ (int64_t)_interfaceOrientationForElement:(id)a3
{
  uint64_t v3 = [a3 uiElementsWithAttribute:2017];
  BOOL v4 = [v3 lastObject];

  BOOL v5 = [v4 numberWithAXAttribute:3035];
  int v6 = [v5 unsignedIntegerValue];

  if ((v6 - 1) >= 4)
  {
    id v7 = +[AXUIElement uiSystemWideApplication];
    id v8 = [v7 uiElementsWithAttribute:1001];
    id v9 = [v8 lastObject];

    CGFloat v10 = [v9 numberWithAXAttribute:1503];
    unsigned int v11 = [v10 intValue];

    if (v11 <= 6) {
      int v6 = dword_1BA6A63D8[v11];
    }
  }
  uint64_t v12 = (v6 - 1);
  if (v12 < 4) {
    int64_t v13 = v12 + 1;
  }
  else {
    int64_t v13 = 0;
  }

  return v13;
}

+ (void)_applyAXTraitsForElement:(id)a3 uiClass:(int64_t)a4
{
  int v6 = a3;
  v6[13] = a4;
  double v19 = v6;
  if ((a4 | 8) == 0xF)
  {
    BOOL v4 = [v6 label];
    BOOL v7 = [v4 length] == 0;
    int v6 = v19;
    int v8 = v7;
  }
  else
  {
    int v8 = 0;
  }
  if ((a4 | 8) == 0xF)
  {

    int v6 = v19;
  }
  if (v8)
  {
    uint64_t v9 = 4;
    v6[11] = 4;
    switch(a4)
    {
      case 18:
LABEL_29:
        double v18 = &kAXTabButtonTrait;
        break;
      case 17:
LABEL_27:
        double v18 = &kAXButtonTrait;
        break;
      case 15:
        uint64_t v10 = 5;
        goto LABEL_31;
      default:
        goto LABEL_32;
    }
    uint64_t v10 = v9 | *v18;
LABEL_31:
    v6[11] = v10;
    goto LABEL_32;
  }
  switch(a4)
  {
    case 1:
    case 13:
      v6[11] = 0x20000000000001;
      unsigned int v11 = (void *)v6[12];
      uint64_t v12 = @"0";
      goto LABEL_16;
    case 2:
    case 14:
      v6[11] = 0x20000000000001;
      unsigned int v11 = (void *)v6[12];
      uint64_t v12 = @"1";
LABEL_16:
      v6[12] = v12;

      int v6 = v19;
      break;
    case 3:
      int64_t v13 = [v6 label];
      uint64_t v14 = [v13 length];

      if (v14)
      {
        uint64_t v15 = 64;
        int v6 = v19;
LABEL_24:
        v6[11] = v15;
      }
      else
      {
        int v6 = v19;
        v19[11] = 0;
      }
      break;
    case 6:
      CGRect v16 = (void *)v6[16];
      v6[16] = @"Page Picker";

      int v6 = v19;
      goto LABEL_20;
    case 9:
LABEL_20:
      CGRect v17 = &kAXAdjustableTrait;
      goto LABEL_23;
    case 10:
      CGRect v17 = &kAXTabBarTrait;
      goto LABEL_23;
    case 12:
      CGRect v17 = &kAXTextEntryTrait;
LABEL_23:
      uint64_t v15 = *v17;
      goto LABEL_24;
    case 16:
      uint64_t v15 = v6[11] | 1;
      goto LABEL_24;
    case 17:
      uint64_t v9 = v6[11];
      goto LABEL_27;
    case 18:
      uint64_t v9 = v6[11];
      goto LABEL_29;
    default:
      break;
  }
LABEL_32:
  v6[11] |= 0x200000000uLL;
}

+ (CGRect)_convertFrameToPortraitUp:(CGRect)a3 fromOrientation:(int64_t)a4 appFrame:(CGRect)a5
{
  double height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat v7 = a3.size.height;
  CGFloat v8 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  switch(a4)
  {
    case 2:
      CGFloat v14 = a5.origin.y;
      CGFloat v15 = a5.origin.x;
      double MaxX = CGRectGetMaxX(a5);
      v29.origin.double x = x;
      v29.origin.double y = y;
      v29.size.CGFloat width = v8;
      v29.size.double height = v7;
      double v25 = MaxX - CGRectGetMaxX(v29);
      v30.origin.double x = v15;
      v30.origin.double y = v14;
      v30.size.CGFloat width = width;
      v30.size.double height = height;
      double MaxY = CGRectGetMaxY(v30);
      v31.origin.double x = x;
      v31.origin.double y = y;
      v31.size.CGFloat width = v8;
      v31.size.double height = v7;
      double y = MaxY - CGRectGetMaxY(v31);
      double x = v25;
      break;
    case 3:
      CGFloat v17 = a5.size.width - CGRectGetMaxY(a3);
      v32.origin.double x = x;
      v32.origin.double y = y;
      v32.size.CGFloat width = v8;
      v32.size.double height = v7;
      CGFloat MinX = CGRectGetMinX(v32);
      v33.origin.double x = x;
      v33.origin.double y = y;
      v33.size.CGFloat width = v8;
      v33.size.double height = v7;
      CGFloat v19 = CGRectGetHeight(v33);
      v34.origin.double x = x;
      v34.origin.double y = y;
      v34.size.CGFloat width = v8;
      v34.size.double height = v7;
      CGFloat v7 = CGRectGetWidth(v34);
      CGFloat v8 = v19;
      double y = MinX;
      double x = v17;
      break;
    case 4:
      CGFloat MinY = CGRectGetMinY(a3);
      v26.origin.double x = x;
      v26.origin.double y = y;
      v26.size.CGFloat width = v8;
      v26.size.double height = v7;
      double v12 = height - CGRectGetMaxX(v26);
      v27.origin.double x = x;
      v27.origin.double y = y;
      v27.size.CGFloat width = v8;
      v27.size.double height = v7;
      CGFloat v13 = CGRectGetHeight(v27);
      v28.origin.double x = x;
      v28.origin.double y = y;
      v28.size.CGFloat width = v8;
      v28.size.double height = v7;
      CGFloat v7 = CGRectGetWidth(v28);
      CGFloat v8 = v13;
      double y = v12;
      double x = MinY;
      break;
  }
  double v20 = x;
  double v21 = y;
  double v22 = v8;
  double v23 = v7;
  result.size.double height = v23;
  result.size.CGFloat width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

+ (void)initialize
{
  if (initialize_onceToken_1 != -1) {
    dispatch_once(&initialize_onceToken_1, &__block_literal_global_319);
  }
}

uint64_t __27__AXUIMLElement_initialize__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.Accessibility.AXUIMLElement", v1);
  uint64_t v3 = (void *)__globalMediaQueue;
  __globalMediaQueue = (uint64_t)v2;

  uint64_t v4 = objc_opt_new();
  BOOL v5 = (void *)AppLevelTopElements;
  AppLevelTopElements = v4;

  uint64_t v6 = objc_opt_new();
  CGFloat v7 = (void *)DetectedMLElements;
  DetectedMLElements = v6;

  return MEMORY[0x1F41787B8](@"AXMVisionFeature_AXRuntime");
}

+ (void)clearCaches
{
  AX_PERFORM_WITH_LOCK();
  dispatch_queue_t v2 = AXMediaLogElementVision();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1BA657000, v2, OS_LOG_TYPE_INFO, "Cleared all cached", v3, 2u);
  }
}

void __28__AXUIMLElement_clearCaches__block_invoke()
{
  [(id)DetectedMLElements removeAllObjects];
  [(id)AppFrameCache removeAllObjects];
  v0 = (void *)EquivalenceToken;
  EquivalenceToken = 0;
}

+ (void)clearCachesForAppsExcluding:(id)a3
{
  id v3 = a3;
  uint64_t v4 = AXMediaLogElementVision();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA657000, v4, OS_LOG_TYPE_INFO, "Clearing ML element cache", buf, 2u);
  }

  BOOL v5 = objc_msgSend(v3, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_328);

  id v6 = v5;
  AX_PERFORM_WITH_LOCK();
}

uint64_t __45__AXUIMLElement_clearCachesForAppsExcluding___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringWithAXAttribute:3003];
}

void __45__AXUIMLElement_clearCachesForAppsExcluding___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  dispatch_queue_t v2 = [(id)DetectedMLElements allKeys];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v12;
    *(void *)&long long v4 = 138412290;
    long long v10 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8, v10) & 1) == 0)
        {
          [(id)DetectedMLElements setObject:0 forKeyedSubscript:v8];
          [(id)AppFrameCache removeAllObjects];
          uint64_t v9 = AXMediaLogElementVision();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v10;
            uint64_t v16 = v8;
            _os_log_impl(&dword_1BA657000, v9, OS_LOG_TYPE_INFO, "Clear cached for: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }
}

+ (void)setAutoRefresh:(BOOL)a3 forApp:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (setAutoRefresh_forApp__onceToken != -1) {
    dispatch_once(&setAutoRefresh_forApp__onceToken, &__block_literal_global_330);
  }
  CGFloat v7 = [v6 stringWithAXAttribute:3003];
  if (v7)
  {
    if (v4)
    {
      [(id)AppLevelTopElements setObject:v6 forKeyedSubscript:v7];
      [a1 _fireRefreshTimer];
    }
    else
    {
      [(id)AppLevelTopElements setObject:0 forKeyedSubscript:v7];
      [(id)RefreshTimer cancel];
    }
  }
  else
  {
    uint64_t v8 = AXMediaLogMLElement();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[AXUIMLElement setAutoRefresh:forApp:]();
    }
  }
}

uint64_t __39__AXUIMLElement_setAutoRefresh_forApp___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F48318]);
  RefreshTimer = [v0 initWithTargetSerialQueue:__globalMediaQueue];
  return MEMORY[0x1F41817F8]();
}

+ (void)_fireRefreshTimer
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __34__AXUIMLElement__fireRefreshTimer__block_invoke;
  v2[3] = &__block_descriptor_40_e5_v8__0l;
  v2[4] = a1;
  [(id)RefreshTimer afterDelay:v2 processBlock:0.5];
}

uint64_t __34__AXUIMLElement__fireRefreshTimer__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [(id)AppLevelTopElements allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = AXMediaLogMLElement();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          CFAbsoluteTime v10 = CFAbsoluteTimeGetCurrent();
          *(_DWORD *)buf = 134218242;
          double v17 = v10 - Current;
          __int16 v18 = 2112;
          uint64_t v19 = v8;
          _os_log_impl(&dword_1BA657000, v9, OS_LOG_TYPE_INFO, "Time to refresh elements: %f %@", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 32), "_queue_createMLElements:postDelegateCallback:", v8, 1);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v5);
  }

  return [*(id *)(a1 + 32) _fireRefreshTimer];
}

+ (void)_setCachedMLElements:(id)a3 forID:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  CGFloat v7 = AXMediaLogElementVision();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v13 = [v5 count];
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1BA657000, v7, OS_LOG_TYPE_INFO, "Setting cached elements: %d for %@", buf, 0x12u);
  }

  CFAbsoluteTime v10 = v6;
  long long v11 = v5;
  id v8 = v5;
  id v9 = v6;
  AX_PERFORM_WITH_LOCK();
}

void __44__AXUIMLElement__setCachedMLElements_forID___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 40) copy];
  [(id)DetectedMLElements setObject:v2 forKeyedSubscript:*(void *)(a1 + 32)];
}

+ (id)_cachedMLElementsForID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  __int16 v14 = __Block_byref_object_copy__1;
  id v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  id v4 = v3;
  CFAbsoluteTime v10 = v4;
  AX_PERFORM_WITH_LOCK();
  id v5 = AXMediaLogElementVision();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = objc_msgSend((id)v12[5], "count", v9, 3221225472, __40__AXUIMLElement__cachedMLElementsForID___block_invoke, &unk_1E6220AC0, v4, &v11);
    *(_DWORD *)buf = 67109378;
    int v18 = v6;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_1BA657000, v5, OS_LOG_TYPE_INFO, "Retrieved ML element cache %d -> %@", buf, 0x12u);
  }

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __40__AXUIMLElement__cachedMLElementsForID___block_invoke(uint64_t a1)
{
  id v5 = [(id)DetectedMLElements objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_reconciledElements
{
  uint64_t v3 = [(AXUIMLElement *)self _currentMLElements];
  id v4 = [(AXUIMLElement *)self _reconcileElements:v3];

  return v4;
}

- (id)_reconcileElements:(id)a3
{
  return a3;
}

- (void)_forceMLElementRefresh:(id)a3 postDelegateCallback:(BOOL)a4 completionBlock:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  CFAbsoluteTime v10 = AXMediaLogMLElement();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v8;
    _os_log_impl(&dword_1BA657000, v10, OS_LOG_TYPE_INFO, "Force ML Refresh: %@", buf, 0xCu);
  }

  if (v8)
  {
    uint64_t v11 = (void *)EquivalenceToken;
    EquivalenceToken = 0;

    long long v12 = [v8 stringWithAXAttribute:3003];
    +[AXUIMLElement _setCachedMLElements:0 forID:v12];

    uint64_t v13 = (void *)MLElementTimer;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__AXUIMLElement__forceMLElementRefresh_postDelegateCallback_completionBlock___block_invoke;
    v14[3] = &unk_1E6220AE8;
    v14[4] = self;
    id v15 = v8;
    BOOL v17 = a4;
    id v16 = v9;
    [v13 afterDelay:v14 processBlock:0.0];
  }
}

uint64_t __77__AXUIMLElement__forceMLElementRefresh_postDelegateCallback_completionBlock___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_opt_class(), "_queue_createMLElements:postDelegateCallback:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (id)_currentMLElements
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (_currentMLElements_onceToken != -1) {
    dispatch_once(&_currentMLElements_onceToken, &__block_literal_global_334);
  }
  uint64_t v3 = [(AXUIMLElement *)self _appElement];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 stringWithAXAttribute:3003];
    int v6 = +[AXUIMLElement _cachedMLElementsForID:v5];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      CFAbsoluteTime v10 = AXMediaLogMLElement();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BA657000, v10, OS_LOG_TYPE_INFO, "Requesting current ML elements", buf, 2u);
      }

      if (([(id)MLElementTimer isPending] & 1) == 0
        && ([(id)MLElementTimer isActive] & 1) == 0)
      {
        dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
        long long v12 = (void *)MLElementTimer;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __35__AXUIMLElement__currentMLElements__block_invoke_335;
        v16[3] = &unk_1E6220B10;
        v16[4] = self;
        id v17 = v4;
        dispatch_semaphore_t v18 = v11;
        uint64_t v13 = v11;
        [v12 afterDelay:v16 processBlock:0.0];
        dispatch_time_t v14 = dispatch_time(0, 1000000000);
        dispatch_semaphore_wait(v13, v14);
      }
      id v8 = +[AXUIMLElement _cachedMLElementsForID:v5];
    }
    id v9 = v8;
  }
  else
  {
    id v5 = AXMediaLogMLElement();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = 0;
      _os_log_impl(&dword_1BA657000, v5, OS_LOG_TYPE_INFO, "No app element available: %@", buf, 0xCu);
    }
    id v9 = 0;
  }

  return v9;
}

uint64_t __35__AXUIMLElement__currentMLElements__block_invoke()
{
  DetectedElementsLock = 0;
  id v0 = objc_alloc(MEMORY[0x1E4F48318]);
  MLElementTimer = [v0 initWithTargetSerialQueue:__globalMediaQueue];
  return MEMORY[0x1F41817F8]();
}

intptr_t __35__AXUIMLElement__currentMLElements__block_invoke_335(uint64_t a1)
{
  objc_msgSend((id)objc_opt_class(), "_queue_createMLElements:postDelegateCallback:", *(void *)(a1 + 40), 1);
  uint64_t v2 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v2);
}

- (BOOL)isProbablyEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXUIMLElement *)self label];
  if (!v5) {
    goto LABEL_15;
  }
  int v6 = (void *)v5;
  id v7 = [v4 label];

  if (!v7) {
    goto LABEL_15;
  }
  id v8 = [v4 label];
  id v9 = [(AXUIMLElement *)self label];
  if ([v8 isEqualToString:v9]) {
    goto LABEL_6;
  }
  CFAbsoluteTime v10 = [v4 label];
  dispatch_semaphore_t v11 = [(AXUIMLElement *)self label];
  if ([v10 containsString:v11])
  {

LABEL_6:
    goto LABEL_7;
  }
  double v25 = [(AXUIMLElement *)self label];
  CGRect v26 = [v4 label];
  char v27 = [v25 containsString:v26];

  if ((v27 & 1) == 0)
  {
LABEL_15:
    BOOL v24 = 0;
    goto LABEL_16;
  }
LABEL_7:
  if (v4[11] != self->_traits) {
    goto LABEL_15;
  }
  if (v4[13] != self->_uiClass) {
    goto LABEL_15;
  }
  [v4 rotatedFrame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(AXUIMLElement *)self rotatedFrame];
  if (vabdd_f64(v13, v23) > 40.0
    || vabdd_f64(v15, v20) > 40.0
    || vabdd_f64(v17, v21) > 5.0
    || vabdd_f64(v19, v22) > 5.0)
  {
    goto LABEL_15;
  }
  BOOL v24 = 1;
LABEL_16:

  return v24;
}

+ (id)_textDetectionOptions:(id)a3 options:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x2050000000;
  id v7 = (void *)getAXMTextDetectionOptionsClass_softClass;
  uint64_t v20 = getAXMTextDetectionOptionsClass_softClass;
  if (!getAXMTextDetectionOptionsClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    double v22 = __getAXMTextDetectionOptionsClass_block_invoke;
    double v23 = &unk_1E6220520;
    BOOL v24 = &v17;
    __getAXMTextDetectionOptionsClass_block_invoke((uint64_t)&buf);
    id v7 = (void *)v18[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v17, 8);
  id v9 = objc_msgSend(v8, "defaultOptions", v17);
  if ([v5 length])
  {
    CFAbsoluteTime v10 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v5];
    if (v10)
    {
      dispatch_semaphore_t v11 = [v6 textDetectionOptions];
      double v12 = [v11 textDetectionLocales];
      double v13 = (void *)[v12 mutableCopy];

      if (!v13)
      {
        double v14 = AXMediaLogMLElement();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          +[AXUIMLElement _textDetectionOptions:options:](v6, v14);
        }

        double v13 = [MEMORY[0x1E4F1CA48] array];
      }
      [v13 insertObject:v10 atIndex:0];
      double v15 = AXMediaLogElementVision();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_1BA657000, v15, OS_LOG_TYPE_INFO, "Using app locale for text detection options: %@", (uint8_t *)&buf, 0xCu);
      }

      [v9 setTextDetectionLocales:v13];
    }
  }
  [v9 setRecognitionLevel:1];
  [v9 setUsesLanguageCorrection:1];

  return v9;
}

+ ($70A309F2B59E63663966B62550FEA657)_windowContextInformation:(SEL)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = [a4 arrayWithAXAttribute:3052];
  CGRect v43 = [MEMORY[0x1E4F1CA48] array];
  CGFloat x = *MEMORY[0x1E4F1DB28];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    dispatch_semaphore_t v11 = @"contextId";
    double v12 = @"isKeyboardWindow";
    uint64_t v13 = *(void *)v48;
    unint64_t v14 = 0x1E4F28000uLL;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(obj);
        }
        double v16 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v17 = [v16 objectForKeyedSubscript:v11];
        double v18 = [v16 objectForKeyedSubscript:v12];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v16 objectForKeyedSubscript:v12];
          CGRect v44 = v16;
          uint64_t v19 = v17;
          uint64_t v20 = v10;
          uint64_t v21 = v13;
          double v22 = v12;
          unint64_t v23 = v14;
          v25 = BOOL v24 = v11;
          char v26 = [v25 BOOLValue];

          dispatch_semaphore_t v11 = v24;
          unint64_t v14 = v23;
          double v12 = v22;
          uint64_t v13 = v21;
          uint64_t v10 = v20;
          uint64_t v17 = v19;
          double v16 = v44;

          if (v26) {
            goto LABEL_15;
          }
        }
        else
        {
        }
        char v27 = [v16 objectForKeyedSubscript:@"frame"];

        long long valuePtr = 0u;
        long long v46 = 0u;
        AXValueGetValue((AXValueRef)v27, kAXValueTypeCGRect, &valuePtr);
        [v43 axSafelyAddObject:v17];
        uint64_t v28 = [v17 unsignedIntValue];
        objc_msgSend(a2, "_appRelativeRectForRect:contextId:", v28, valuePtr, v46);
        CGFloat v30 = v29;
        CGFloat v32 = v31;
        CGFloat v34 = v33;
        CGFloat v36 = v35;
        v53.origin.CGFloat x = x;
        v53.origin.CGFloat y = y;
        v53.size.CGFloat width = width;
        v53.size.CGFloat height = height;
        if (CGRectIsEmpty(v53))
        {
          CGFloat height = v36;
          CGFloat width = v34;
          CGFloat y = v32;
          CGFloat x = v30;
        }
        else
        {
          v54.origin.CGFloat x = x;
          v54.origin.CGFloat y = y;
          v54.size.CGFloat width = width;
          v54.size.CGFloat height = height;
          v56.origin.CGFloat x = v30;
          v56.origin.CGFloat y = v32;
          v56.size.CGFloat width = v34;
          v56.size.CGFloat height = v36;
          CGRect v55 = CGRectUnion(v54, v56);
          CGFloat x = v55.origin.x;
          CGFloat y = v55.origin.y;
          CGFloat width = v55.size.width;
          CGFloat height = v55.size.height;
        }
        CGRect v37 = [v16 objectForKeyedSubscript:@"isMainWindow"];
        int v38 = [v37 BOOLValue];

        if (v38) {
          [v17 unsignedIntValue];
        }
LABEL_15:
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v10);
  }

  retstr->var0 = v43;
  retstr->var1.origin.CGFloat x = x;
  retstr->var1.origin.CGFloat y = y;
  retstr->var1.size.CGFloat width = width;
  retstr->var1.size.CGFloat height = height;

  return result;
}

+ (void)_queue_createMLElements:(id)a3 postDelegateCallback:(BOOL)a4
{
  BOOL v122 = a4;
  uint64_t v165 = *MEMORY[0x1E4F143B8];
  id v132 = a3;
  id v4 = AXLogAppAccessibility();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, a1);

  id v6 = AXLogAppAccessibility();
  id v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA657000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "AXUIMLElementDetection", (const char *)&unk_1BA6AD00B, buf, 2u);
  }

  if (_queue_createMLElements_postDelegateCallback__onceToken != -1) {
    dispatch_once(&_queue_createMLElements_postDelegateCallback__onceToken, &__block_literal_global_351);
  }
  id v8 = [a1 proxiedMLElementsForApp:v132];
  v131 = [v8 firstObject];

  if (v131)
  {
    uint64_t v9 = [(id)__displayManager coreAnimationMainDisplay];
    [v9 scale];
    uint64_t v11 = v10;

    uint64_t v129 = [v132 stringWithAXAttribute:2008];
    *(void *)&v155[0] = 0;
    *((void *)&v155[0] + 1) = v155;
    *(void *)&v155[1] = 0x2050000000;
    double v12 = (void *)getAXMVisionScreenRecognitionOptionsClass_softClass;
    *((void *)&v155[1] + 1) = getAXMVisionScreenRecognitionOptionsClass_softClass;
    if (!getAXMVisionScreenRecognitionOptionsClass_softClass)
    {
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      uint64_t v157 = 3221225472;
      v158 = __getAXMVisionScreenRecognitionOptionsClass_block_invoke;
      v159 = &unk_1E6220520;
      v160 = v155;
      __getAXMVisionScreenRecognitionOptionsClass_block_invoke((uint64_t)buf);
      double v12 = *(void **)(*((void *)&v155[0] + 1) + 24);
    }
    id v13 = v12;
    _Block_object_dispose(v155, 8);
    v133 = [v13 defaultOptions];
    [v133 setDetectAXElements:1];
    unint64_t v14 = [a1 _textDetectionOptions:v129 options:v133];
    [v133 setTextDetectionOptions:v14];

    [v133 setDetectText:0];
    v130 = [v132 stringWithAXAttribute:3003];
    double v15 = [a1 _cachedMLElementsForID:v130];
    BOOL v16 = [v15 count] == 0;

    if (v16)
    {
      uint64_t v17 = (void *)EquivalenceToken;
      EquivalenceTokeuint64_t n = 0;
    }
    [v133 setEquivalenceToken:EquivalenceToken];
    objc_msgSend(v133, "setIsRTL:", objc_msgSend(v132, "BOOLWithAXAttribute:", 3066));
    objc_msgSend(v133, "setOrientation:", objc_msgSend(a1, "_interfaceOrientationForElement:", v132));
    memset(v155, 0, 40);
    [a1 _windowContextInformation:v132];
    objc_msgSend(v133, "setFullRect:", *((double *)v155 + 1), v155[1], *(double *)&v155[2]);
    [v133 setIncludedLayerContextIDs:*(void *)&v155[0]];
    [v133 setPreserveInputImageSize:1];
    [v133 setEquivalenceToken:EquivalenceToken];
    double v18 = AXMediaLogMLElement();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      +[AXUIMLElement _queue_createMLElements:postDelegateCallback:].cold.4();
    }

    v128 = [MEMORY[0x1E4F1CA48] array];
    v126 = [MEMORY[0x1E4F1CA48] array];
    v125 = [MEMORY[0x1E4F1CA48] array];
    v127 = [MEMORY[0x1E4F1CA48] array];
    *(void *)v163 = 0;
    *(void *)&v163[8] = v163;
    *(void *)&v163[16] = 0x2050000000;
    uint64_t v19 = (void *)getAXMScreenRecognitionCenterClass_softClass;
    uint64_t v164 = getAXMScreenRecognitionCenterClass_softClass;
    if (!getAXMScreenRecognitionCenterClass_softClass)
    {
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      uint64_t v157 = 3221225472;
      v158 = __getAXMScreenRecognitionCenterClass_block_invoke;
      v159 = &unk_1E6220520;
      v160 = v163;
      __getAXMScreenRecognitionCenterClass_block_invoke((uint64_t)buf);
      uint64_t v19 = *(void **)(*(void *)&v163[8] + 24);
    }
    id v20 = v19;
    _Block_object_dispose(v163, 8);
    id v21 = [v20 sharedInstance];
    *(void *)long long buf = 0;
    uint64_t v157 = 0;
    v158 = 0;
    v124 = v21;
    if (v21)
    {
      [v21 processFeatures:v133];
      id v21 = *(id *)buf;
    }
    if ([v21 isEqual:EquivalenceToken])
    {
      double v22 = AXMediaLogMLElement();
      v123 = v22;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        +[AXUIMLElement _queue_createMLElements:postDelegateCallback:](v22);
      }
    }
    else
    {
      objc_storeStrong((id *)&EquivalenceToken, *(id *)buf);
      uint64_t v25 = (void *)[(id)v157 mutableCopy];
      if (!v25)
      {

LABEL_74:
        BOOL v24 = (void *)v129;
        goto LABEL_75;
      }
      v139[0] = MEMORY[0x1E4F143A8];
      v139[1] = 3254779904;
      v139[2] = __62__AXUIMLElement__queue_createMLElements_postDelegateCallback___block_invoke_352;
      v139[3] = &unk_1F14193C0;
      uint64_t v147 = v11;
      id v26 = *(id *)&v155[0];
      long long v149 = *(_OWORD *)((char *)v155 + 8);
      long long v150 = *(_OWORD *)((char *)&v155[1] + 8);
      id v148 = v26;
      id v151 = a1;
      id v140 = v133;
      id v27 = v128;
      id v141 = v27;
      id v28 = v126;
      id v142 = v28;
      id v29 = v125;
      id v143 = v29;
      id v144 = v131;
      id v152 = *(id *)buf;
      id v153 = (id)v157;
      v154 = v158;
      id v30 = v127;
      id v145 = v30;
      v146 = v25;
      v123 = v146;
      [v146 enumerateObjectsUsingBlock:v139];
      id WeakRetained = objc_loadWeakRetained(&__frameDelegate);
      [WeakRetained mlElementDetectorReceivedFrames:v27 labels:v28 uiClasses:v29];

      CGFloat v32 = AXMediaLogMLElement();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v163 = 67109120;
        *(_DWORD *)&v163[4] = v158;
        _os_log_impl(&dword_1BA657000, v32, OS_LOG_TYPE_INFO, "Handling results for ML detection for gen: %d", v163, 8u);
      }

      double v33 = AXLogAppAccessibility();
      CGFloat v34 = v33;
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        *(_WORD *)v163 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BA657000, v34, OS_SIGNPOST_INTERVAL_END, v5, "AXUIMLElementDetection", (const char *)&unk_1BA6AD00B, v163, 2u);
      }

      double v35 = +[AXUIMLElement _cachedMLElementsForID:v130];
      CGFloat v36 = (void *)[v35 mutableCopy];

      if (!v36)
      {
        CGFloat v36 = [MEMORY[0x1E4F1CA48] array];
      }
      if (!_queue_createMLElements_postDelegateCallback___backupMLElements)
      {
        uint64_t v37 = [MEMORY[0x1E4F1CA48] array];
        int v38 = (void *)_queue_createMLElements_postDelegateCallback___backupMLElements;
        _queue_createMLElements_postDelegateCallback___backupMLElements = v37;
      }
      v121 = (void *)[v36 copy];
      unint64_t v39 = 0;
      int v40 = 1;
      *(void *)&long long v41 = 138412546;
      long long v120 = v41;
      while (v39 < objc_msgSend(v30, "count", v120))
      {
        for (unint64_t i = 0; i < [v36 count]; ++i)
        {
          CGRect v43 = [v30 objectAtIndexedSubscript:v39];
          CGRect v44 = [v36 objectAtIndexedSubscript:i];
          int v45 = [v44 isProbablyEqual:v43];

          if (v45)
          {
            long long v46 = AXMediaLogMLElement();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              v106 = [v36 objectAtIndexedSubscript:i];
              v107 = [v30 objectAtIndexedSubscript:v39];
              *(_DWORD *)v163 = v120;
              *(void *)&v163[4] = v106;
              *(_WORD *)&v163[12] = 2112;
              *(void *)&v163[14] = v107;
              _os_log_debug_impl(&dword_1BA657000, v46, OS_LOG_TYPE_DEBUG, "Keeping this element because we matched \nExisting: %@ New: %@", v163, 0x16u);
            }
            long long v47 = [v36 objectAtIndexedSubscript:i];
            [v30 setObject:v47 atIndexedSubscript:v39];

            long long v48 = [v30 objectAtIndexedSubscript:v39];
            [v48 rotatedFrame];
            CGFloat v50 = v49;
            CGFloat v52 = v51;
            CGFloat v54 = v53;
            CGFloat v56 = v55;
            [v43 rotatedFrame];
            v168.origin.CGFloat x = v57;
            v168.origin.CGFloat y = v58;
            v168.size.CGFloat width = v59;
            v168.size.CGFloat height = v60;
            v166.origin.CGFloat x = v50;
            v166.origin.CGFloat y = v52;
            v166.size.CGFloat width = v54;
            v166.size.CGFloat height = v56;
            BOOL v61 = CGRectEqualToRect(v166, v168);

            [v43 rotatedFrame];
            double v63 = v62;
            double v65 = v64;
            double v67 = v66;
            double v69 = v68;
            v70 = [v30 objectAtIndexedSubscript:v39];
            objc_msgSend(v70, "setRotatedFrame:", v63, v65, v67, v69);

            v71 = v158;
            v72 = [v30 objectAtIndexedSubscript:v39];
            [v72 setMlGeneration:v71];

            [v36 removeObjectAtIndex:i];
            v40 &= v61;
            break;
          }
        }
        for (unint64_t j = 0; j < [(id)_queue_createMLElements_postDelegateCallback___backupMLElements count]; ++j)
        {
          v74 = [v30 objectAtIndexedSubscript:v39];
          v75 = [(id)_queue_createMLElements_postDelegateCallback___backupMLElements objectAtIndexedSubscript:j];
          int v76 = [v75 isProbablyEqual:v74];

          if (v76)
          {
            v77 = [(id)_queue_createMLElements_postDelegateCallback___backupMLElements objectAtIndexedSubscript:j];
            [v30 setObject:v77 atIndexedSubscript:v39];

            [v74 rotatedFrame];
            double v79 = v78;
            double v81 = v80;
            double v83 = v82;
            double v85 = v84;
            v86 = [v30 objectAtIndexedSubscript:v39];
            objc_msgSend(v86, "setRotatedFrame:", v79, v81, v83, v85);

            v87 = [v30 objectAtIndexedSubscript:v39];
            [v87 rotatedFrame];
            CGFloat v89 = v88;
            CGFloat v91 = v90;
            CGFloat v93 = v92;
            CGFloat v95 = v94;
            [v74 rotatedFrame];
            v169.origin.CGFloat x = v96;
            v169.origin.CGFloat y = v97;
            v169.size.CGFloat width = v98;
            v169.size.CGFloat height = v99;
            v167.origin.CGFloat x = v89;
            v167.origin.CGFloat y = v91;
            v167.size.CGFloat width = v93;
            v167.size.CGFloat height = v95;
            BOOL v100 = CGRectEqualToRect(v167, v169);

            v101 = v158;
            v102 = [v30 objectAtIndexedSubscript:v39];
            [v102 setMlGeneration:v101];

            [(id)_queue_createMLElements_postDelegateCallback___backupMLElements removeObjectAtIndex:j];
            v40 &= v100;
          }
          else
          {
            v103 = [(id)_queue_createMLElements_postDelegateCallback___backupMLElements objectAtIndexedSubscript:j];
            uint64_t v104 = [v103 mlGeneration];
            BOOL v105 = v104 + 10 > (unint64_t)v158;

            if (v105) {
              [(id)_queue_createMLElements_postDelegateCallback___backupMLElements removeObjectAtIndex:j];
            }
          }
        }
        ++v39;
      }
      for (unint64_t k = 0; k < [v36 count]; ++k)
      {
        for (unint64_t m = 0; m < [v30 count]; ++m)
        {
          v110 = (void *)_queue_createMLElements_postDelegateCallback___backupMLElements;
          v111 = [v36 objectAtIndexedSubscript:k];
          [v110 addObject:v111];
        }
      }
      if (((v40 & 1) == 0 || ([v121 isEqualToArray:v30] & 1) == 0) && v122)
      {
        [a1 _setCachedMLElements:v30 forID:v130];
        id v112 = objc_loadWeakRetained(&__frameDelegate);
        [v112 mlElementDetectorUpdatedElements];
      }
      v113 = AXMediaLogMLElement();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG)) {
        +[AXUIMLElement _queue_createMLElements:postDelegateCallback:]([v30 count], v162, v113);
      }

      long long v137 = 0u;
      long long v138 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      id v114 = v30;
      uint64_t v115 = [v114 countByEnumeratingWithState:&v135 objects:v161 count:16];
      if (v115)
      {
        uint64_t v116 = *(void *)v136;
        do
        {
          for (uint64_t n = 0; n != v115; ++n)
          {
            if (*(void *)v136 != v116) {
              objc_enumerationMutation(v114);
            }
            uint64_t v118 = *(void *)(*((void *)&v135 + 1) + 8 * n);
            v119 = AXMediaLogMLElement();
            if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v163 = 138412290;
              *(void *)&v163[4] = v118;
              _os_log_debug_impl(&dword_1BA657000, v119, OS_LOG_TYPE_DEBUG, "\tAdded element: %@", v163, 0xCu);
            }
          }
          uint64_t v115 = [v114 countByEnumeratingWithState:&v135 objects:v161 count:16];
        }
        while (v115);
      }
    }
    goto LABEL_74;
  }
  unint64_t v23 = AXMediaLogMLElement();
  BOOL v24 = v23;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    +[AXUIMLElement _queue_createMLElements:postDelegateCallback:]();
    BOOL v24 = v23;
  }
LABEL_75:
}

void __62__AXUIMLElement__queue_createMLElements_postDelegateCallback___block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(0);
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v1 = (void *)getAXMDisplayManagerClass_softClass;
  uint64_t v24 = getAXMDisplayManagerClass_softClass;
  if (!getAXMDisplayManagerClass_softClass)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __getAXMDisplayManagerClass_block_invoke;
    v20[3] = &unk_1E6220520;
    v20[4] = &v21;
    __getAXMDisplayManagerClass_block_invoke((uint64_t)v20);
    v1 = (void *)v22[3];
  }
  uint64_t v2 = v1;
  _Block_object_dispose(&v21, 8);
  id v3 = [v2 alloc];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __62__AXUIMLElement__queue_createMLElements_postDelegateCallback___block_invoke_2;
  double v18 = &unk_1E6220A08;
  dispatch_semaphore_t v19 = v0;
  id v4 = v0;
  uint64_t v5 = [v3 initWithCompletion:&v15];
  id v6 = (void *)__displayManager;
  __displayManager = v5;

  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v4, v7);
  id v8 = objc_msgSend((id)__displayManager, "coreAnimationMainDisplay", v15, v16, v17, v18);
  [v8 size];
  ScaledScreenSize_0 = v9;
  ScaledScreenSize_1 = v10;

  uint64_t v11 = [(id)__displayManager coreAnimationMainDisplay];
  [v11 scale];
  *(double *)&ScaledScreenSize_0 = *(double *)&ScaledScreenSize_0 / v12;

  id v13 = [(id)__displayManager coreAnimationMainDisplay];
  [v13 scale];
  *(double *)&ScaledScreenSize_1 = *(double *)&ScaledScreenSize_1 / v14;
}

intptr_t __62__AXUIMLElement__queue_createMLElements_postDelegateCallback___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __62__AXUIMLElement__queue_createMLElements_postDelegateCallback___block_invoke_352(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 activationPoint];
  double v43 = v13;
  double v44 = v12;
  BOOL v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8) == v13 && *MEMORY[0x1E4F1DAD8] == v12;
  double v15 = 1.0 / *(double *)(a1 + 88);
  double v16 = v5 * v15;
  double v17 = v9 * v15;
  double v18 = v11 * v15;
  double v39 = *(double *)(a1 + 112);
  double v41 = *(double *)(a1 + 104);
  double v19 = v41 + v16;
  double v20 = v7 * v15 + v39;
  double v45 = v17;
  objc_msgSend(*(id *)(a1 + 136), "_convertFrameToPortraitUp:fromOrientation:appFrame:", objc_msgSend(*(id *)(a1 + 32), "orientation", *(void *)&v39, *(void *)&v41), v41 + v16, v20, v17, v18, v41, v39, *(double *)(a1 + 120), *(double *)(a1 + 128));
  double x = v51.origin.x;
  double y = v51.origin.y;
  double width = v51.size.width;
  double height = v51.size.height;
  uint64_t v25 = *(void **)(a1 + 40);
  id v26 = NSStringFromRect(v51);
  [v25 addObject:v26];

  id v27 = [v3 overrideLabel];
  id v28 = v27;
  if (v27)
  {
    id v29 = v27;
  }
  else
  {
    id v29 = [v3 value];
  }
  id v30 = v29;

  if (v30) {
    double v31 = v30;
  }
  else {
    double v31 = &stru_1F141B5A8;
  }
  [*(id *)(a1 + 48) addObject:v31];
  CGFloat v32 = *(void **)(a1 + 56);
  uint64_t v47 = 0;
  long long v48 = &v47;
  uint64_t v49 = 0x2050000000;
  double v33 = (void *)getAXMVisionFeatureClass_softClass;
  uint64_t v50 = getAXMVisionFeatureClass_softClass;
  if (!getAXMVisionFeatureClass_softClass)
  {
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __getAXMVisionFeatureClass_block_invoke;
    v46[3] = &unk_1E6220520;
    v46[4] = &v47;
    __getAXMVisionFeatureClass_block_invoke((uint64_t)v46);
    double v33 = (void *)v48[3];
  }
  id v34 = v33;
  _Block_object_dispose(&v47, 8);
  double v35 = objc_msgSend(v34, "nameForUIClass:", objc_msgSend(v3, "uiClass"));
  [v32 addObject:v35];

  CGFloat v36 = -[AXUIMLElement initWithParentElement:]([AXUIMLElement alloc], "initWithParentElement:", [*(id *)(a1 + 64) axElement]);
  uint64_t v37 = [v3 overrideLabel];
  if (v37)
  {
    [(AXUIMLElement *)v36 setLabel:v37];
  }
  else
  {
    int v38 = [v3 value];
    [(AXUIMLElement *)v36 setLabel:v38];
  }
  -[AXUIMLElement setPortraitUpFrame:](v36, "setPortraitUpFrame:", x, y, width, height);
  -[AXUIMLElement setRotatedFrame:](v36, "setRotatedFrame:", v19, v20, v45, v18);
  if (!v14) {
    -[AXUIMLElement setRotatedCenterPoint:](v36, "setRotatedCenterPoint:", v42 + v44 * v15, v43 * v15 + v40);
  }
  [(AXUIMLElement *)v36 setMlGeneration:*(void *)(a1 + 160)];
  objc_msgSend(*(id *)(a1 + 136), "_applyAXTraitsForElement:uiClass:", v36, objc_msgSend(v3, "uiClass"));
  if (v36) {
    [*(id *)(a1 + 72) addObject:v36];
  }
  -[AXUIMLElement _applyCustomActionsForFeature:screenScale:screenRect:elements:](v36, "_applyCustomActionsForFeature:screenScale:screenRect:elements:", v3, *(void *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
}

- (void)_applyCustomActionsForFeature:(id)a3 screenScale:(double)a4 screenRect:(CGRect)a5 elements:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a6;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v9 = objc_msgSend(v7, "subfeatures", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v15 = [v7 uiClass];
        if ((unint64_t)([v14 uiClass] - 15) <= 2)
        {
          if ((unint64_t)(v15 - 15) > 2)
          {
            if ([v7 uiClass] == 18) {
              continue;
            }
LABEL_12:
            [v8 addObject:v14];
            continue;
          }
          double v16 = [v7 subfeatures];
          if ((unint64_t)[v16 count] <= 1)
          {
          }
          else
          {
            uint64_t v17 = [v7 uiClass];

            if (v17 != 18) {
              goto LABEL_12;
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)copyAttributeValue:(int64_t)a3
{
  return 0;
}

- (void)copyAttributeValue:(int64_t)a3 parameter:(void *)a4
{
  return [(AXUIMLElement *)self copyAttributeValue:a3 parameter:a4 baseElement:self];
}

- (void)copyAttributeValue:(int64_t)a3 parameter:(void *)a4 baseElement:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = (AXUIMLElement *)a5;
  if (a3 == 94500)
  {
    double v9 = [(AXUIMLElement *)self _currentMLElements];
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v15++), "axElement", (void)v20));
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }
  }
  else if ((unint64_t)(a3 - 92501) > 1 || [(AXUIMLElement *)self _isTopLevelMLElement])
  {
    uint64_t v10 = 0;
  }
  else
  {
    double v16 = [(AXUIMLElement *)self _topLevelMLElement];
    uint64_t v17 = v16;
    if (v8) {
      long long v18 = v8;
    }
    else {
      long long v18 = self;
    }
    uint64_t v10 = (void *)[v16 copyAttributeValue:a3 parameter:a4 baseElement:v18];
  }
  return v10;
}

- (id)_reconcileAppElementsWithMLElements:(id)a3 flattenedElements:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v28 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v14 = [(AXUIMLElement *)self _findMatchingElementForMLElement:v13 flattenedAppElements:v7];
        if (v14)
        {
          uint64_t v15 = [v8 objectForKey:v14];
          double v16 = v15;
          if (v15)
          {
            id v17 = v15;
          }
          else
          {
            id v17 = [MEMORY[0x1E4F1CA48] array];
          }
          long long v18 = v17;

          [v18 addObject:v13];
          [v8 setObject:v18 forKey:v14];
        }
        else if ([(AXUIMLElement *)self _shouldPromoteElement:v13])
        {
          [v28 addObject:v13];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v10);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v19 = [v8 allKeys];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * j);
        uint64_t v25 = [v8 objectForKey:v24];
        if ([(AXUIMLElement *)self _shouldDemoteElement:v24 withMLElements:v25])
        {
          [v28 addObjectsFromArray:v25];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v21);
  }

  return v28;
}

- (BOOL)_shouldPromoteElement:(id)a3
{
  return 1;
}

- (BOOL)_shouldDemoteElement:(id)a3 withMLElements:(id)a4
{
  id v6 = a3;
  if ([a4 count])
  {
    id v7 = [(AXUIMLElement *)self _topLevelAppElement];
    [v7 rectWithAXAttribute:2003];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = objc_opt_class();
    id v17 = [v7 numberWithAXAttribute:2021];
    objc_msgSend(v16, "_appRelativeRectForRect:contextId:", objc_msgSend(v17, "unsignedIntValue"), v9, v11, v13, v15);
    double v19 = v18;
    double v21 = v20;

    [v6 rectWithAXAttribute:2003];
    BOOL v24 = v19 < 10.0 || v21 < 10.0;
    BOOL v27 = !v24
       && (double v25 = v22, v26 = v23, ([v6 BOOLWithAXAttribute:2065] & 1) == 0)
       && v25 * v26 / v19 / v21 > 0.9;
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (id)_flattenedAppElements
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  double v19 = &v18;
  uint64_t v20 = 0x2050000000;
  id v3 = (void *)getAXSettingsClass_softClass;
  uint64_t v21 = getAXSettingsClass_softClass;
  if (!getAXSettingsClass_softClass)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __getAXSettingsClass_block_invoke;
    v17[3] = &unk_1E6220520;
    v17[4] = &v18;
    __getAXSettingsClass_block_invoke((uint64_t)v17);
    id v3 = (void *)v19[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v18, 8);
  double v5 = [v4 sharedInstance];
  char v6 = [v5 automaticAccessibilityIgnoreAppAccessibilityPreferred];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    double v8 = [(AXUIMLElement *)self uiElementsWithAttribute:2017];
    double v9 = [v8 lastObject];

    double v10 = [v9 uiElementsWithAttribute:3000];
    double v11 = [v10 lastObject];

    if (v11)
    {
      p_isReconciling = &self->_isReconciling;
      self->_isReconciling = 1;
      v22[0] = v11;
      double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      double v14 = [v11 nextElementsWithCount:9999];
      double v15 = [v13 arrayByAddingObjectsFromArray:v14];

      id v7 = objc_msgSend(v15, "ax_filteredArrayUsingBlock:", &__block_literal_global_360);

      BOOL *p_isReconciling = 0;
    }
    else
    {
      id v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v7;
}

BOOL __38__AXUIMLElement__flattenedAppElements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (id)_findMatchingElementForMLElement:(id)a3 flattenedAppElements:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  memset(&rect[1], 0, 32);
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&rect[1] objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)rect[3];
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)rect[3] != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = *(void **)(rect[2] + 8 * i);
        [v5 rotatedFrame];
        CGFloat v12 = v11;
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        [v10 rectWithAXAttribute:2003];
        rect[0] = v19;
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        v35.origin.double x = v12;
        v35.origin.double y = v14;
        v35.size.double width = v16;
        v35.size.double height = v18;
        CGFloat MidX = CGRectGetMidX(v35);
        v36.origin.double x = v12;
        v36.origin.double y = v14;
        v36.size.double width = v16;
        v36.size.double height = v18;
        v34.double y = CGRectGetMidY(v36);
        *(void *)&v37.origin.double x = rect[0];
        v37.origin.double y = v21;
        v37.size.double width = v23;
        v37.size.double height = v25;
        v34.double x = MidX;
        if (CGRectContainsPoint(v37, v34))
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&rect[1] objects:v31 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (__AXUIElement)copyElementAtPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = [(AXUIMLElement *)self _currentMLElements];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    double v10 = 0;
    uint64_t v11 = *(void *)v26;
    double v12 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v7);
        }
        CGFloat v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_msgSend(v14, "portraitUpFrame", (void)v25);
        v35.double x = x;
        v35.double y = y;
        if (CGRectContainsPoint(v36, v35))
        {
          [v6 addObject:v14];
        }
        else
        {
          [v14 portraitUpFrame];
          double MidX = CGRectGetMidX(v37);
          [v14 portraitUpFrame];
          CGFloat MidY = CGRectGetMidY(v38);
          double v17 = sqrt((MidX - x) * (MidX - x) + (MidY - y) * (MidY - y));
          if (v17 < v12)
          {
            id v18 = v14;

            double v10 = v18;
            double v12 = v17;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v9);
  }
  else
  {
    double v10 = 0;
    double v12 = 1.79769313e308;
  }

  if ([(id)objc_opt_class() performFuzzyHitTestNextTime]
    && ![v6 count]
    && v10)
  {
    uint64_t v19 = AXMediaLogElementVision();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218242;
      double v30 = v12;
      __int16 v31 = 2112;
      uint64_t v32 = v10;
      _os_log_impl(&dword_1BA657000, v19, OS_LOG_TYPE_DEFAULT, "Logging fuzzy match: %f, %@", buf, 0x16u);
    }

    [(id)objc_opt_class() setPerformFuzzyHitTestNextTime:0];
    double v20 = (__AXUIElement *)CFRetain((CFTypeRef)[v10 axElement]);
  }
  else
  {
    CGFloat v21 = objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_363, (void)v25);
    double v22 = [v21 firstObject];
    CGFloat v23 = v22;
    if (v22) {
      double v20 = (__AXUIElement *)CFRetain((CFTypeRef)[v22 axElement]);
    }
    else {
      double v20 = 0;
    }
  }
  return v20;
}

uint64_t __39__AXUIMLElement_copyElementAtPosition___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 frame];
  double v49 = v6;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v5 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  uint64_t v51 = 0;
  CGFloat v52 = &v51;
  uint64_t v53 = 0x2020000000;
  CGFloat v21 = (double (*)(double, double, double, double, double, double, double, double))getAXMIntersectionOverUnionSymbolLoc_ptr;
  CGFloat v54 = getAXMIntersectionOverUnionSymbolLoc_ptr;
  if (!getAXMIntersectionOverUnionSymbolLoc_ptr)
  {
    double v22 = (void *)AXMediaUtilitiesLibrary();
    v52[3] = (uint64_t)dlsym(v22, "AXMIntersectionOverUnion");
    getAXMIntersectionOverUnionSymbolLoc_ptr = (_UNKNOWN *)v52[3];
    CGFloat v21 = (double (*)(double, double, double, double, double, double, double, double))v52[3];
  }
  _Block_object_dispose(&v51, 8);
  if (!v21) {
    __39__AXUIMLElement_copyElementAtPosition___block_invoke_cold_1();
  }
  if (v21(v49, v8, v10, v12, v14, v16, v18, v20) <= 0.5)
  {
    [v4 frame];
    double v50 = v23;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    [v5 frame];
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    uint64_t v51 = 0;
    CGFloat v52 = &v51;
    uint64_t v53 = 0x2020000000;
    CGRect v38 = (double (*)(double, double, double, double, double, double, double, double))getAXMRatioOfIntersectedAreaToSmallerRectAreaSymbolLoc_ptr;
    CGFloat v54 = getAXMRatioOfIntersectedAreaToSmallerRectAreaSymbolLoc_ptr;
    if (!getAXMRatioOfIntersectedAreaToSmallerRectAreaSymbolLoc_ptr)
    {
      uint64_t v39 = (void *)AXMediaUtilitiesLibrary();
      v52[3] = (uint64_t)dlsym(v39, "AXMRatioOfIntersectedAreaToSmallerRectArea");
      getAXMRatioOfIntersectedAreaToSmallerRectAreaSymbolLoc_ptr = (_UNKNOWN *)v52[3];
      CGRect v38 = (double (*)(double, double, double, double, double, double, double, double))v52[3];
    }
    _Block_object_dispose(&v51, 8);
    if (!v38) {
      __39__AXUIMLElement_copyElementAtPosition___block_invoke_cold_2();
    }
    if (v38(v50, v25, v27, v29, v31, v33, v35, v37) <= 0.5) {
      goto LABEL_14;
    }
  }
  [v4 frame];
  double v41 = v40;
  [v4 frame];
  double v43 = v41 * v42;
  [v5 frame];
  double v45 = v44;
  [v5 frame];
  uint64_t v47 = v43 >= v45 * v46 ? 1 : -1;
  if (v43 >= v45 * v46 && v43 <= v45 * v46) {
LABEL_14:
  }
    uint64_t v47 = 0;

  return v47;
}

+ (id)elementsInDirection:(int64_t)a3 withElement:(id)a4 nextElements:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F1C978] array];
  }
  if (![v7 isMLElement])
  {
    double v10 = [v7 uiElementsWithAttribute:2017];
    double v11 = [v10 lastObject];

    double v12 = [v11 uiElementsWithAttribute:3051];
    double v13 = [v12 firstObject];

    if (v13) {
      goto LABEL_10;
    }
LABEL_7:
    id v14 = v8;
    goto LABEL_22;
  }
  if ([v7 _isTopLevelMLElement])
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v7 topLevelMLElement];
  }
  double v13 = v9;
  if (!v9) {
    goto LABEL_7;
  }
LABEL_10:
  double v15 = [v13 _reconciledElements];
  uint64_t v16 = [v15 indexOfObject:v7];
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v18 = v16;
    if (a3 == 92501)
    {
      if (v16 + 1 < (unint64_t)[v15 count])
      {
        uint64_t v17 = objc_msgSend(v15, "subarrayWithRange:", v18 + 1, objc_msgSend(v15, "count") + ~v18);
        goto LABEL_16;
      }
    }
    else if (v16)
    {
      double v19 = objc_msgSend(v15, "subarrayWithRange:", 0, v16);
      double v20 = [v19 reverseObjectEnumerator];
      id v14 = [v20 allObjects];

      goto LABEL_19;
    }
LABEL_20:
    id v14 = v8;
    goto LABEL_21;
  }
  if (a3 != 92501) {
    goto LABEL_20;
  }
  uint64_t v17 = [v13 _currentMLElements];
LABEL_16:
  double v19 = (void *)v17;
  id v14 = [v8 arrayByAddingObjectsFromArray:v17];
LABEL_19:

LABEL_21:
LABEL_22:

  return v14;
}

- (BOOL)isMLElement
{
  return 1;
}

- (BOOL)_simulateScrollAction:(int)a3 withScreenDistanceFactor:(double)a4 forVisibleAction:(BOOL)a5
{
  unsigned int v8 = a3 & 0xFFFFFFFE;
  BOOL v10 = a3 == 2006 || a3 == 2009;
  [(AXUIMLElement *)self rotatedFrame];
  CGFloat x = v43.origin.x;
  CGFloat y = v43.origin.y;
  CGFloat width = v43.size.width;
  CGFloat height = v43.size.height;
  double MidX = CGRectGetMidX(v43);
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v44);
  uint64_t v17 = ScaledScreenSize_1;
  if (v8 != 2006) {
    uint64_t v17 = ScaledScreenSize_0;
  }
  double v18 = *(double *)&v17 * a4;
  double v19 = -(*(double *)&v17 * a4);
  if (v10)
  {
    double v20 = *(double *)&ScaledScreenSize_0;
  }
  else
  {
    double v19 = v18;
    double v20 = 0.0;
  }
  if (v8 == 2006) {
    double v21 = 0.0;
  }
  else {
    double v21 = v19;
  }
  if (v8 == 2006) {
    double v22 = v19;
  }
  else {
    double v22 = 0.0;
  }
  double v23 = objc_opt_class();
  double v24 = [(AXUIMLElement *)self _topLevelAppElement];
  uint64_t v25 = [v23 _interfaceOrientationForElement:v24];

  BOOL v26 = (unint64_t)(v25 - 1) >= 2 || v8 == 2006;
  double v27 = MidX + v21;
  double v28 = MidY + v22;
  if (v26) {
    double v29 = v27;
  }
  else {
    double v29 = v20;
  }
  id v30 = (id)EquivalenceToken;
  double v31 = fabs(sqrt((v28 - MidY) * (v28 - MidY) + (v29 - MidX) * (v29 - MidX)));
  if (v31 >= 40.0)
  {
    double v32 = [(AXUIMLElement *)self _appElement];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __81__AXUIMLElement__simulateScrollAction_withScreenDistanceFactor_forVisibleAction___block_invoke;
    v35[3] = &unk_1E6220BC8;
    double v38 = MidX;
    double v39 = MidY;
    double v40 = v29;
    double v41 = v28;
    v35[4] = self;
    id v36 = v32;
    BOOL v42 = a5;
    id v37 = v30;
    id v33 = v32;
    dispatch_async(MEMORY[0x1E4F14428], v35);
  }
  return v31 >= 40.0;
}

void __81__AXUIMLElement__simulateScrollAction_withScreenDistanceFactor_forVisibleAction___block_invoke(uint64_t a1)
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v2 = (void *)getAXNamedReplayableGestureClass_softClass;
  uint64_t v16 = getAXNamedReplayableGestureClass_softClass;
  if (!getAXNamedReplayableGestureClass_softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __getAXNamedReplayableGestureClass_block_invoke;
    v12[3] = &unk_1E6220520;
    v12[4] = &v13;
    __getAXNamedReplayableGestureClass_block_invoke((uint64_t)v12);
    id v2 = (void *)v14[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v13, 8);
  id v4 = objc_msgSend(v3, "scrollGestureFromPoint:toPoint:duration:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), 0.2);
  id v5 = +[AXUIMLElement sharedFingerController];
  [v5 setSenderID:0x8000000817319375];

  double v6 = +[AXUIMLElement sharedFingerController];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__AXUIMLElement__simulateScrollAction_withScreenDistanceFactor_forVisibleAction___block_invoke_2;
  v8[3] = &unk_1E6220BA0;
  id v7 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  char v11 = *(unsigned char *)(a1 + 88);
  id v10 = *(id *)(a1 + 48);
  [v6 performGesture:v4 completion:v8];
}

void __81__AXUIMLElement__simulateScrollAction_withScreenDistanceFactor_forVisibleAction___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__AXUIMLElement__simulateScrollAction_withScreenDistanceFactor_forVisibleAction___block_invoke_3;
  v3[3] = &unk_1E6220B78;
  char v5 = *(unsigned char *)(a1 + 56);
  id v4 = *(id *)(a1 + 48);
  [v1 _forceMLElementRefresh:v2 postDelegateCallback:1 completionBlock:v3];
}

void __81__AXUIMLElement__simulateScrollAction_withScreenDistanceFactor_forVisibleAction___block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    if ([(id)EquivalenceToken isEqualToData:*(void *)(a1 + 32)])
    {
      AXPushNotificationToSystemForBroadcast();
    }
    else
    {
      id v1 = +[AXAttributedString axAttributedStringWithString:@" "];
      [v1 setAttribute:*MEMORY[0x1E4F1CFD0] forKey:kAXPageScrollShouldSpeakElement[0]];
      AXPushNotificationToSystemForBroadcast();
    }
  }
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (CGRect)portraitUpFrame
{
  double x = self->_portraitUpFrame.origin.x;
  double y = self->_portraitUpFrame.origin.y;
  double width = self->_portraitUpFrame.size.width;
  double height = self->_portraitUpFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPortraitUpFrame:(CGRect)a3
{
  self->_portraitUpFrame = a3;
}

- (CGRect)rotatedFrame
{
  double x = self->_rotatedFrame.origin.x;
  double y = self->_rotatedFrame.origin.y;
  double width = self->_rotatedFrame.size.width;
  double height = self->_rotatedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRotatedFrame:(CGRect)a3
{
  self->_rotatedFrame = a3;
}

- (CGPoint)rotatedCenterPoint
{
  double x = self->_rotatedCenterPoint.x;
  double y = self->_rotatedCenterPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setRotatedCenterPoint:(CGPoint)a3
{
  self->_rotatedCenterPoint = a3;
}

- (CGRect)screenFrame
{
  double x = self->_screenFrame.origin.x;
  double y = self->_screenFrame.origin.y;
  double width = self->_screenFrame.size.width;
  double height = self->_screenFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setScreenFrame:(CGRect)a3
{
  self->_screenFrame = a3;
}

- (unint64_t)mlGeneration
{
  return self->_mlGeneration;
}

- (void)setMlGeneration:(unint64_t)a3
{
  self->_mlGeneratiouint64_t n = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_customActions, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_hostingParent, 0);
  objc_storeStrong((id *)&self->_parent, 0);
}

- (void)initWithParentElement:.cold.1()
{
  __assert_rtn("-[AXUIMLElement initWithParentElement:]", "AXUIMLElement.m", 147, "axElement != nil");
}

+ (void)setAutoRefresh:forApp:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1BA657000, v0, OS_LOG_TYPE_ERROR, "No bundle id for %@", v1, 0xCu);
}

+ (void)_textDetectionOptions:(void *)a1 options:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 textDetectionOptions];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1BA657000, a2, OS_LOG_TYPE_ERROR, "would expect textDetectionOptions to return locale list: %@", v4, 0xCu);
}

+ (void)_queue_createMLElements:postDelegateCallback:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1BA657000, v0, OS_LOG_TYPE_ERROR, "Couldn't find toplevel ml element for %@", v1, 0xCu);
}

+ (void)_queue_createMLElements:(os_log_t)log postDelegateCallback:.cold.2(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_1BA657000, log, OS_LOG_TYPE_DEBUG, "Equivalence token is the same", v1, 2u);
}

+ (void)_queue_createMLElements:(os_log_t)log postDelegateCallback:.cold.3(int a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 67109120;
  *((_DWORD *)buf + 1) = a1;
  _os_log_debug_impl(&dword_1BA657000, log, OS_LOG_TYPE_DEBUG, "Finished ML elements creation: %d", buf, 8u);
}

+ (void)_queue_createMLElements:postDelegateCallback:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_2();
  _os_log_debug_impl(&dword_1BA657000, v0, OS_LOG_TYPE_DEBUG, "CurrentMLElements for element: %@", v1, 0xCu);
}

void __39__AXUIMLElement_copyElementAtPosition___block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat soft_AXMIntersectionOverUnion(CGRect, CGRect)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXUIMLElement.m", 31, @"%s", dlerror());

  __break(1u);
}

void __39__AXUIMLElement_copyElementAtPosition___block_invoke_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat soft_AXMRatioOfIntersectedAreaToSmallerRectArea(CGRect, CGRect)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXUIMLElement.m", 32, @"%s", dlerror());

  __break(1u);
}

@end