@interface AXElement
+ (AXElement)elementWithData:(id)a3;
+ (AXElement)elementWithUIElement:(id)a3;
+ (AXElement)systemEventDispatchElement;
+ (id)applicationAtCoordinate:(CGPoint)a3;
+ (id)elementAtCoordinate:(CGPoint)a3 withVisualPadding:(BOOL)a4;
+ (id)elementAtCoordinate:(CGPoint)a3 withVisualPadding:(BOOL)a4 displayID:(unsigned int)a5;
+ (id)elementWithAXUIElement:(__AXUIElement *)a3;
+ (id)elementsWithUIElements:(id)a3;
+ (id)primaryApp;
+ (id)systemApplication;
+ (id)systemWideElement;
+ (int)systemAppPid;
+ (void)registerNotifications:(id)a3 withIdentifier:(id)a4 withHandler:(id)a5;
+ (void)unregisterNotifications:(id)a3;
- (AXElement)accessibilityUIServerApplication;
- (AXElement)accessibleAncestor;
- (AXElement)application;
- (AXElement)autoscrollTarget;
- (AXElement)cachedRemoteParent;
- (AXElement)cachedRemoteParentForContextID;
- (AXElement)currentApplication;
- (AXElement)currentFocusContainer;
- (AXElement)elementForTextInsertionAndDeletion;
- (AXElement)elementParent;
- (AXElement)firstElementInApplication;
- (AXElement)firstElementInApplicationForFocus;
- (AXElement)firstResponder;
- (AXElement)initWithAXUIElement:(__AXUIElement *)a3;
- (AXElement)initWithUIElement:(id)a3;
- (AXElement)nativeFocusElement;
- (AXElement)nativeFocusPreferredElement;
- (AXElement)remoteParent;
- (AXElement)springBoardApplication;
- (AXElement)systemApplication;
- (AXElement)touchContainer;
- (AXElementGroup)parentGroup;
- (AXUIElement)uiElement;
- (BOOL)_performActivate;
- (BOOL)_showContextMenuWithTargetPointValue:(id)a3;
- (BOOL)_zoomInOrOut:(BOOL)a3;
- (BOOL)applicationIsModal;
- (BOOL)assistiveTechFocused;
- (BOOL)autoscrollInDirection:(unint64_t)a3;
- (BOOL)canPerformActivate;
- (BOOL)canPerformEscape;
- (BOOL)canPerformSecondaryActivate;
- (BOOL)canPerformTrackingDetail;
- (BOOL)canPerformZoom;
- (BOOL)canScrollInAtLeastOneDirection;
- (BOOL)eligibleForIconVision;
- (BOOL)hasAllTraits:(unint64_t)a3;
- (BOOL)hasAnyTraits:(unint64_t)a3;
- (BOOL)hasOnlyTraits:(unint64_t)a3;
- (BOOL)hasTextEntry;
- (BOOL)hasVariantKeys;
- (BOOL)hasWebContent;
- (BOOL)hoverTypingShouldAdjustDockedMode;
- (BOOL)isAXUIServer;
- (BOOL)isAccessibilityOpaqueElementProvider;
- (BOOL)isAccessibleElement;
- (BOOL)isAutoscrolling;
- (BOOL)isComboBox;
- (BOOL)isControlCenterVisible;
- (BOOL)isDictationListening;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroup;
- (BOOL)isKeyboardKey;
- (BOOL)isMap;
- (BOOL)isMathEquation;
- (BOOL)isNativeFocused;
- (BOOL)isPassivelyListeningForEvents;
- (BOOL)isScreenLocked;
- (BOOL)isSpringBoard;
- (BOOL)isSystemApplication;
- (BOOL)isSystemWideElement;
- (BOOL)isTouchContainer;
- (BOOL)isValid;
- (BOOL)isVisible;
- (BOOL)longPress;
- (BOOL)performAction:(int)a3;
- (BOOL)performAction:(int)a3 withValue:(id)a4;
- (BOOL)press;
- (BOOL)pressTVBackButton;
- (BOOL)pressTVDataOnScreenButton;
- (BOOL)pressTVDownButton;
- (BOOL)pressTVFastForwardButton;
- (BOOL)pressTVLeftButton;
- (BOOL)pressTVMenuButton;
- (BOOL)pressTVMicButton;
- (BOOL)pressTVNextTrackButton;
- (BOOL)pressTVPauseButton;
- (BOOL)pressTVPlayButton;
- (BOOL)pressTVPlayPauseButton;
- (BOOL)pressTVPreviousTrackButton;
- (BOOL)pressTVRewindButton;
- (BOOL)pressTVRightButton;
- (BOOL)pressTVSelectButton;
- (BOOL)pressTVSkipBackwardsButton;
- (BOOL)pressTVSkipForwardsButton;
- (BOOL)pressTVStopButton;
- (BOOL)pressTVUpButton;
- (BOOL)representsScannerGroup;
- (BOOL)required;
- (BOOL)respondsToUserInteraction;
- (BOOL)scrollToVisible;
- (BOOL)setNativeFocus;
- (BOOL)showContextMenu;
- (BOOL)supportsAction:(int)a3;
- (BOOL)systemLongPressTVHomeButton;
- (BOOL)systemLongPressTVMenuButton;
- (BOOL)systemPressTVDownButton;
- (BOOL)systemPressTVHomeButton;
- (BOOL)systemPressTVLeftButton;
- (BOOL)systemPressTVMenuButton;
- (BOOL)systemPressTVPlayPauseButton;
- (BOOL)systemPressTVRightButton;
- (BOOL)systemPressTVSelectButton;
- (BOOL)systemPressTVSiriButton;
- (BOOL)systemPressTVUpButton;
- (BOOL)viewHierarchyHasNativeFocus;
- (BOOL)zoomIn;
- (BOOL)zoomOut;
- (CGPath)cachedPath;
- (CGPath)convertPath:(CGPath *)a3 fromContextId:(unsigned int)a4;
- (CGPath)convertPath:(CGPath *)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (CGPath)path;
- (CGPoint)centerPoint;
- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4;
- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (CGPoint)visiblePoint;
- (CGRect)boundsForTextRange:(_NSRange)a3;
- (CGRect)cachedFrame;
- (CGRect)cachedVisibleFrame;
- (CGRect)convertRect:(CGRect)a3 fromContextId:(unsigned int)a4;
- (CGRect)convertRect:(CGRect)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (CGRect)convertRect:(CGRect)a3 toContextId:(unsigned int)a4;
- (CGRect)convertRect:(CGRect)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (CGRect)focusableFrameForZoom;
- (CGRect)frame;
- (CGRect)textCursorFrame;
- (CGRect)visibleFrame;
- (NSArray)accessibleDescendants;
- (NSArray)children;
- (NSArray)currentApplications;
- (NSArray)currentApplicationsIgnoringSiri;
- (NSArray)customActions;
- (NSArray)customContent;
- (NSArray)drags;
- (NSArray)drops;
- (NSArray)elementsWithSemanticContext;
- (NSArray)explorerElements;
- (NSArray)nativeFocusableElements;
- (NSArray)parent;
- (NSArray)siriContentElementsWithSemanticContext;
- (NSArray)siriContentNativeFocusableElements;
- (NSArray)supportedGestures;
- (NSArray)textOperations;
- (NSArray)typingCandidates;
- (NSArray)userInputLabels;
- (NSArray)variantKeys;
- (NSArray)visibleElements;
- (NSDictionary)semanticContext;
- (NSString)bundleId;
- (NSString)description;
- (NSString)elementTransactionSummary;
- (NSString)fbSceneIdentifier;
- (NSString)focusedSceneIdentifier;
- (NSString)hint;
- (NSString)identifier;
- (NSString)label;
- (NSString)language;
- (NSString)localizationBundleID;
- (NSString)localizationBundlePath;
- (NSString)localizedStringKey;
- (NSString)localizedStringTableName;
- (NSString)processName;
- (NSString)roleDescription;
- (NSString)speakThisString;
- (NSString)speechInputLabel;
- (NSString)textualContext;
- (NSString)value;
- (NSString)windowSceneIdentifier;
- (NSURL)url;
- (_NSRange)rowRange;
- (_NSRange)selectedTextRange;
- (__AXUIElement)elementRef;
- (__AXUIElement)scrollAncestorForScrollAction:(int)a3;
- (double)distanceToElement:(id)a3;
- (double)distanceToPoint:(CGPoint)a3;
- (id)_axElementsForAXUIElements:(id)a3;
- (id)_elementForAttribute:(int64_t)a3 shouldUpdateCache:(BOOL)a4 shouldFetchAttributes:(BOOL)a5;
- (id)_makeTinkerKitRequest:(id)a3;
- (id)_objectForRange:(_NSRange)a3 withParameterizedAttribute:(int64_t)a4;
- (id)_remoteParentForContextID;
- (id)_textOperationsOperator;
- (id)_uiElementForTextInsertionAndDeletion;
- (id)accessibilityLocalizationBundleID;
- (id)accessibilityLocalizationBundlePath;
- (id)accessibilityLocalizedStringKey;
- (id)accessibilityLocalizedStringTableName;
- (id)alternativesForTextAtPosition:(unint64_t)a3;
- (id)auditIssuesForOptions:(id)a3;
- (id)carPlaySystemApplication;
- (id)containerTypes;
- (id)elementForAttribute:(int64_t)a3;
- (id)elementForAttribute:(int64_t)a3 parameter:(id)a4;
- (id)elementForAttribute:(int64_t)a3 shouldFetchAttributes:(BOOL)a4;
- (id)elementsForAttribute:(int64_t)a3;
- (id)elementsForAttribute:(int64_t)a3 parameter:(id)a4;
- (id)elementsMatchingText:(id)a3;
- (id)firstResponderForFocus;
- (id)focusContainersForCurrentSceneIdentifier:(id)a3;
- (id)highestAncestorGroup;
- (id)keyboardContainer;
- (id)makeLookingGlassRequest:(id)a3;
- (id)nextElementsWithCount:(unint64_t)a3;
- (id)previousElementsWithCount:(unint64_t)a3;
- (id)remoteApplication;
- (id)scrollViewsForAutoScroll;
- (id)serializeToData;
- (int)pid;
- (int64_t)applicationOrientation;
- (int64_t)scannerActivateBehavior;
- (unint64_t)containerType;
- (unint64_t)scanningBehaviorTraits;
- (unint64_t)traits;
- (unsigned)contextIdForPoint:(CGPoint)a3;
- (unsigned)displayIdForContextId:(unsigned int)a3;
- (unsigned)windowContextId;
- (unsigned)windowDisplayId;
- (void)_updateLabel;
- (void)clearCachedFrame:(BOOL)a3 cachedVisibleFrame:(BOOL)a4;
- (void)dealloc;
- (void)decreaseAutoscrollSpeed;
- (void)deleteText;
- (void)increaseAutoscrollSpeed;
- (void)insertText:(id)a3;
- (void)insertText:(id)a3 asUndoableAction:(BOOL)a4;
- (void)insertTextWithAlternatives:(id)a3;
- (void)pauseAutoscrolling;
- (void)scrollToBottom;
- (void)scrollToTop;
- (void)sendUserEventOccurred;
- (void)setAssistiveTechFocused:(BOOL)a3;
- (void)setAutoscrollSpeed:(double)a3;
- (void)setAutoscrollTarget:(id)a3;
- (void)setCachedFrame:(CGRect)a3;
- (void)setCachedPath:(CGPath *)a3;
- (void)setCachedRemoteParent:(id)a3;
- (void)setCachedRemoteParentForContextID:(id)a3;
- (void)setCachedVisibleFrame:(CGRect)a3;
- (void)setParentGroup:(id)a3;
- (void)setPassivelyListeningForEvents:(BOOL)a3;
- (void)setSelectedTextRange:(_NSRange)a3;
- (void)setUiElement:(id)a3;
- (void)setValue:(id)a3;
- (void)updateCache:(int64_t)a3;
@end

@implementation AXElement

+ (id)elementWithAXUIElement:(__AXUIElement *)a3
{
  v3 = [[AXElement alloc] initWithAXUIElement:a3];
  return v3;
}

+ (AXElement)elementWithUIElement:(id)a3
{
  id v3 = a3;
  v4 = [[AXElement alloc] initWithUIElement:v3];

  return v4;
}

+ (id)elementsWithUIElements:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
          v10 = +[AXElement elementWithUIElement:](AXElement, "elementWithUIElement:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)primaryApp
{
  v2 = +[AXElement systemWideElement];
  id v3 = [v2 systemApplication];
  v4 = [v3 currentApplications];
  id v5 = [v4 firstObject];

  return v5;
}

+ (void)unregisterNotifications:(id)a3
{
}

+ (void)registerNotifications:(id)a3 withIdentifier:(id)a4 withHandler:(id)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v10 = AXRuntimeLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      +[AXElement registerNotifications:withIdentifier:withHandler:].cold.4(v10);
    }
  }
  v11 = +[AXElement systemWideElement];
  long long v12 = [v11 uiElement];
  long long v13 = (const __AXUIElement *)[v12 axElement];

  long long v14 = &OBJC_IVAR___AXElementFetcher__delegate;
  if (!Observer)
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v30 = (void *)Handlers;
    Handlers = (uint64_t)v29;

    pid_t pid = 0;
    AXUIElementGetPid(v13, &pid);
    AXError v31 = AXObserverCreate(pid, (AXObserverCallback)_accessibilityEventsHandler, (AXObserverRef *)&Observer);
    if (v31)
    {
      int v32 = v31;
      v33 = AXRuntimeLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        +[AXElement registerNotifications:withIdentifier:withHandler:](v32, v33);
      }
    }
    else
    {
      CFRunLoopSourceRef RunLoopSource = AXObserverGetRunLoopSource((AXObserverRef)Observer);
      if (RunLoopSource)
      {
        v35 = RunLoopSource;
        Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, v35, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
        goto LABEL_6;
      }
      v33 = AXRuntimeLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        +[AXElement registerNotifications:withIdentifier:withHandler:](v33);
      }
    }

    goto LABEL_32;
  }
LABEL_6:
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v15 = v7;
  obuint64_t j = v15;
  uint64_t v45 = [v15 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v45)
  {
    id v39 = v7;
    element = v13;
    id v37 = v9;
    id v38 = v8;
    AXError v41 = kAXErrorSuccess;
    uint64_t v44 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v51 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        v18 = v14;
        v19 = [*((id *)v14 + 364) allValues];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v57 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v47;
          while (2)
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v47 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = [*(id *)(*((void *)&v46 + 1) + 8 * j) objectForKey:@"notifications"];
              char v25 = [v24 containsObject:v17];

              if (v25)
              {

                goto LABEL_21;
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v46 objects:v57 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }

        AXError v41 = AXObserverAddNotification((AXObserverRef)Observer, element, (CFStringRef)[v17 intValue], a1);
LABEL_21:
        long long v14 = v18;
      }
      uint64_t v45 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v45);

    id v8 = v38;
    id v7 = v39;
    id v9 = v37;
    if (v41 == kAXErrorSuccess) {
      goto LABEL_27;
    }
    long long v15 = AXRuntimeLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[AXElement registerNotifications:withIdentifier:withHandler:](v41, v15);
    }
  }

LABEL_27:
  v26 = (void *)*((void *)v14 + 364);
  v55[0] = @"notifications";
  v55[1] = @"handler";
  v56[0] = obj;
  v27 = (void *)[v9 copy];
  v56[1] = v27;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
  [v26 setObject:v28 forKey:v8];

LABEL_32:
}

- (unsigned)displayIdForContextId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int valuePtr = 0;
  CFTypeRef cf = 0;
  v4 = [(AXElement *)self elementRef];
  AXUIElementCopyParameterizedAttributeValue(v4, (CFStringRef)0x16575, (CFTypeRef)[NSNumber numberWithUnsignedInt:v3], &cf);
  if (cf)
  {
    CFTypeID v5 = CFGetTypeID(cf);
    if (v5 == CFNumberGetTypeID()) {
      CFNumberGetValue((CFNumberRef)cf, kCFNumberIntType, &valuePtr);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  return valuePtr;
}

- (unsigned)contextIdForPoint:(CGPoint)a3
{
  CGPoint valuePtr = a3;
  unsigned int v8 = 0;
  CFTypeRef cf = 0;
  AXValueRef v4 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
  AXUIElementCopyParameterizedAttributeValue([(AXElement *)self elementRef], (CFStringRef)0x16572, v4, &cf);
  if (cf)
  {
    CFTypeID v5 = CFGetTypeID(cf);
    if (v5 == CFNumberGetTypeID()) {
      CFNumberGetValue((CFNumberRef)cf, kCFNumberIntType, &v8);
    }
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
  }
  if (v4) {
    CFRelease(v4);
  }
  return v8;
}

+ (id)elementAtCoordinate:(CGPoint)a3 withVisualPadding:(BOOL)a4 displayID:(unsigned int)a5
{
  BOOL v5 = a4;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  unsigned int v8 = +[AXUIElement uiElementAtCoordinate:displayId:](AXUIElement, "uiElementAtCoordinate:displayId:", *(void *)&a5);
  id v9 = +[AXElement elementWithUIElement:v8];
  v10 = v9;
  if (!v8) {
    goto LABEL_6;
  }
  [v9 frame];
  if (v5) {
    *(CGRect *)&uint64_t v11 = CGRectInset(*(CGRect *)&v11, -5.0, -5.0);
  }
  v18.CGFloat x = x;
  v18.CGFloat y = y;
  if (CGRectContainsPoint(*(CGRect *)&v11, v18)) {
    id v15 = v10;
  }
  else {
LABEL_6:
  }
    id v15 = 0;

  return v15;
}

+ (id)elementAtCoordinate:(CGPoint)a3 withVisualPadding:(BOOL)a4
{
  return +[AXElement elementAtCoordinate:withVisualPadding:displayID:](AXElement, "elementAtCoordinate:withVisualPadding:displayID:", a4, 0, a3.x, a3.y);
}

+ (id)systemWideElement
{
  if (systemWideElement_onceToken != -1) {
    dispatch_once(&systemWideElement_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)systemWideElement_System;
  return v2;
}

void __30__AXElement_systemWideElement__block_invoke()
{
  AXUIElementRef SystemWide = AXUIElementCreateSystemWide();
  v1 = [[AXElement alloc] initWithAXUIElement:SystemWide];
  v2 = (void *)systemWideElement_System;
  systemWideElement_System = (uint64_t)v1;

  if (SystemWide)
  {
    CFRelease(SystemWide);
  }
}

+ (id)applicationAtCoordinate:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v5 = +[AXElement systemWideElement];
  CFTypeRef cf = 0;
  uint64_t v6 = (const __AXUIElement *)[v5 elementRef];
  float v7 = x;
  float v8 = y;
  id v9 = 0;
  if (!AXUIElementCopyApplicationAtPosition(v6, (uint64_t *)&cf, v7, v8))
  {
    id v9 = +[AXElement elementWithAXUIElement:cf];
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }

  return v9;
}

+ (AXElement)systemEventDispatchElement
{
  v2 = +[AXElement systemWideElement];
  if (_AXSMossdeepEnabled())
  {
    id v3 = [v2 systemApplication];
  }
  else
  {
    id v3 = v2;
  }
  AXValueRef v4 = v3;

  return (AXElement *)v4;
}

- (AXElement)initWithAXUIElement:(__AXUIElement *)a3
{
  AXValueRef v4 = +[AXUIElement uiElementWithAXElement:a3];
  BOOL v5 = [(AXElement *)self initWithUIElement:v4];

  return v5;
}

- (AXElement)initWithUIElement:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXElement;
  uint64_t v6 = [(AXElement *)&v14 init];
  float v7 = v6;
  float v8 = 0;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_uiElement, a3);
    double v9 = *MEMORY[0x1E4F1DB20];
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    -[AXElement setCachedVisibleFrame:](v7, "setCachedVisibleFrame:", *MEMORY[0x1E4F1DB20], v10, v11, v12);
    -[AXElement setCachedFrame:](v7, "setCachedFrame:", v9, v10, v11, v12);
    float v8 = v7;
  }

  return v8;
}

+ (AXElement)elementWithData:(id)a3
{
  CFDataRef v3 = (const __CFData *)a3;
  CFDataRef v4 = v3;
  if (v3 && (CFDataRef v5 = _AXUIElementCreateWithData(v3)) != 0)
  {
    CFDataRef v6 = v5;
    float v7 = +[AXElement elementWithAXUIElement:v5];
    CFRelease(v6);
  }
  else
  {
    float v7 = 0;
  }

  return (AXElement *)v7;
}

- (id)serializeToData
{
  Data = [(AXElement *)self elementRef];
  if (Data) {
    Data = _AXUIElementCreateData((const UInt8 *)Data);
  }
  return Data;
}

- (void)dealloc
{
  CGPathRelease(self->_cachedPath);
  v3.receiver = self;
  v3.super_class = (Class)AXElement;
  [(AXElement *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(AXElement *)self uiElement];
    uint64_t v6 = [v4 uiElement];
    float v7 = (void *)v6;
    if (v5 && v6) {
      BOOL v8 = CFEqual((CFTypeRef)v5, (CFTypeRef)v6) != 0;
    }
    else {
      BOOL v8 = (v5 | v6) == 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  objc_super v3 = NSString;
  id v4 = [(AXElement *)self uiElement];
  uint64_t v5 = [v3 stringWithFormat:@"AXElement<%p>. uiElement:%@", self, v4];

  return (NSString *)v5;
}

- (id)elementForAttribute:(int64_t)a3
{
  return [(AXElement *)self elementForAttribute:a3 shouldFetchAttributes:1];
}

- (id)elementForAttribute:(int64_t)a3 shouldFetchAttributes:(BOOL)a4
{
  return [(AXElement *)self _elementForAttribute:a3 shouldUpdateCache:1 shouldFetchAttributes:a4];
}

- (id)_elementForAttribute:(int64_t)a3 shouldUpdateCache:(BOOL)a4 shouldFetchAttributes:(BOOL)a5
{
  BOOL v5 = a5;
  if (a4) {
    [(AXUIElement *)self->_uiElement updateCache:a3];
  }
  id v8 = [(AXUIElement *)self->_uiElement objectWithAXAttribute:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = (id)[v8 axElement];
  }
  if (v8)
  {
    if (v5)
    {
      double v9 = +[AXElement elementWithAXUIElement:v8];
    }
    else
    {
      double v10 = +[AXUIElement uiElementWithAXElement:v8 cache:0];
      double v9 = +[AXElement elementWithUIElement:v10];
    }
  }
  else
  {
    double v9 = 0;
  }
  return v9;
}

- (id)elementForAttribute:(int64_t)a3 parameter:(id)a4
{
  id v4 = [(AXUIElement *)self->_uiElement objectWithAXAttribute:a3 parameter:a4];
  if (v4)
  {
    id v4 = +[AXElement elementWithAXUIElement:v4];
  }
  return v4;
}

- (id)elementsForAttribute:(int64_t)a3 parameter:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [(AXUIElement *)self->_uiElement uiElementsWithAttribute:a3 parameter:a4];
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = +[AXElement elementWithUIElement:](AXElement, "elementWithUIElement:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)elementsForAttribute:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(AXUIElement *)self->_uiElement uiElementsWithAttribute:a3];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        double v10 = +[AXElement elementWithUIElement:](AXElement, "elementWithUIElement:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (__AXUIElement)elementRef
{
  return [(AXUIElement *)self->_uiElement axElement];
}

- (BOOL)isSystemWideElement
{
  objc_super v3 = +[AXElement systemWideElement];
  LOBYTE(self) = v3 == self;

  return (char)self;
}

- (BOOL)isPassivelyListeningForEvents
{
  BOOL v3 = [(AXElement *)self isSystemWideElement];
  if (v3)
  {
    id v4 = [(AXElement *)self uiElement];
    char v5 = [v4 BOOLWithAXAttribute:1002];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setPassivelyListeningForEvents:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AXElement *)self isSystemWideElement])
  {
    id v5 = [(AXElement *)self uiElement];
    [v5 setAXAttribute:1002 withBOOL:v3];
  }
}

- (AXElement)currentApplication
{
  v2 = [(AXElement *)self currentApplications];
  BOOL v3 = [v2 firstObject];

  return (AXElement *)v3;
}

- (NSArray)currentApplications
{
  BOOL v3 = [(AXElement *)self uiElement];
  [v3 updateCache:1102];

  id v4 = [(AXElement *)self uiElement];
  id v5 = [v4 uiElementsWithAttribute:1102];
  uint64_t v6 = [(AXElement *)self _axElementsForAXUIElements:v5];

  return (NSArray *)v6;
}

- (NSArray)currentApplicationsIgnoringSiri
{
  BOOL v3 = [(AXElement *)self uiElement];
  [v3 updateCache:1105];

  id v4 = [(AXElement *)self uiElement];
  id v5 = [v4 uiElementsWithAttribute:1105];
  uint64_t v6 = [(AXElement *)self _axElementsForAXUIElements:v5];

  return (NSArray *)v6;
}

- (AXElement)springBoardApplication
{
  return (AXElement *)[(AXElement *)self elementForAttribute:1000];
}

- (BOOL)applicationIsModal
{
  v2 = [(AXElement *)self uiElement];
  char v3 = [v2 BOOLWithAXAttribute:1514];

  return v3;
}

+ (id)systemApplication
{
  uint64_t v2 = AXUIElementSharedSystemApp();
  return +[AXElement elementWithAXUIElement:v2];
}

- (AXElement)systemApplication
{
  return (AXElement *)+[AXElement systemApplication];
}

+ (int)systemAppPid
{
  pid_t pid = 0;
  uint64_t v2 = (const __AXUIElement *)AXUIElementSharedSystemApp();
  AXUIElementGetPid(v2, &pid);
  return pid;
}

- (id)carPlaySystemApplication
{
  return [(AXElement *)self elementForAttribute:1009];
}

- (AXElement)accessibilityUIServerApplication
{
  return (AXElement *)[(AXElement *)self elementForAttribute:1005];
}

- (void)sendUserEventOccurred
{
}

- (BOOL)systemPressTVSelectButton
{
  return [(AXElement *)self performAction:5100];
}

- (BOOL)systemPressTVPlayPauseButton
{
  return [(AXElement *)self performAction:5101];
}

- (BOOL)systemPressTVUpButton
{
  return [(AXElement *)self performAction:5102];
}

- (BOOL)systemPressTVDownButton
{
  return [(AXElement *)self performAction:5103];
}

- (BOOL)systemPressTVLeftButton
{
  return [(AXElement *)self performAction:5104];
}

- (BOOL)systemPressTVRightButton
{
  return [(AXElement *)self performAction:5105];
}

- (BOOL)systemPressTVMenuButton
{
  return [(AXElement *)self performAction:5106];
}

- (BOOL)systemLongPressTVMenuButton
{
  return [(AXElement *)self performAction:5109];
}

- (BOOL)systemPressTVHomeButton
{
  return [(AXElement *)self performAction:5107];
}

- (BOOL)systemLongPressTVHomeButton
{
  return [(AXElement *)self performAction:5110];
}

- (BOOL)systemPressTVSiriButton
{
  return [(AXElement *)self performAction:5108];
}

- (NSString)elementTransactionSummary
{
  return (NSString *)[(AXUIElement *)self->_uiElement stringWithAXAttribute:3067];
}

- (CGRect)convertRect:(CGRect)a3 toContextId:(unsigned int)a4
{
  -[AXElement convertRect:toContextId:displayId:](self, "convertRect:toContextId:displayId:", *(void *)&a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  v18[3] = *MEMORY[0x1E4F143B8];
  CGRect v17 = a3;
  AXValueRef v8 = AXValueCreate(kAXValueTypeCGRect, &v17);
  uiElement = self->_uiElement;
  v18[0] = v8;
  double v10 = [NSNumber numberWithUnsignedInt:v6];
  v18[1] = v10;
  double v11 = [NSNumber numberWithUnsignedInt:v5];
  v18[2] = v11;
  long long v12 = -[AXUIElement objectWithAXAttribute:parameter:](uiElement, "objectWithAXAttribute:parameter:", 91511, [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3]);

  if (v8) {
    CFRelease(v8);
  }
  if (v12) {
    AXValueGetValue(v12, kAXValueTypeCGRect, &v17);
  }
  double width = v17.size.width;
  double height = v17.size.height;
  double x = v17.origin.x;
  double y = v17.origin.y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromContextId:(unsigned int)a4
{
  -[AXElement convertRect:fromContextId:displayId:](self, "convertRect:fromContextId:displayId:", *(void *)&a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  v18[3] = *MEMORY[0x1E4F143B8];
  CGRect v17 = a3;
  AXValueRef v8 = AXValueCreate(kAXValueTypeCGRect, &v17);
  uiElement = self->_uiElement;
  v18[0] = v8;
  double v10 = [NSNumber numberWithUnsignedInt:v6];
  v18[1] = v10;
  double v11 = [NSNumber numberWithUnsignedInt:v5];
  v18[2] = v11;
  long long v12 = -[AXUIElement objectWithAXAttribute:parameter:](uiElement, "objectWithAXAttribute:parameter:", 91505, [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3]);

  if (v8) {
    CFRelease(v8);
  }
  if (v12) {
    AXValueGetValue(v12, kAXValueTypeCGRect, &v17);
  }
  double width = v17.size.width;
  double height = v17.size.height;
  double x = v17.origin.x;
  double y = v17.origin.y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4
{
  -[AXElement convertPoint:fromContextId:displayId:](self, "convertPoint:fromContextId:displayId:", *(void *)&a4, 0, a3.x, a3.y);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  double v5 = AXConvertPointFromHostedCoordinates(*(uint64_t *)&a4, *(uint64_t *)&a5, a3.x, a3.y);
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4
{
  -[AXElement convertPoint:toContextId:displayId:](self, "convertPoint:toContextId:displayId:", *(void *)&a4, 0, a3.x, a3.y);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  double v5 = AXConvertPointToHostedCoordinates(*(uint64_t *)&a4, *(uint64_t *)&a5, a3.x, a3.y);
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGPath)convertPath:(CGPath *)a3 fromContextId:(unsigned int)a4
{
  return [(AXElement *)self convertPath:a3 fromContextId:*(void *)&a4 displayId:0];
}

- (CGPath)convertPath:(CGPath *)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  if (!a3) {
    return 0;
  }
  CGMutablePathRef Mutable = CGPathCreateMutable();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__AXElement_convertPath_fromContextId_displayId___block_invoke;
  v11[3] = &unk_1E6220C38;
  unsigned int v12 = a4;
  unsigned int v13 = a5;
  v11[4] = self;
  v11[5] = Mutable;
  AX_CGPathEnumerateElementsUsingBlock(a3, v11);
  return (CGPath *)CFAutorelease(Mutable);
}

void __49__AXElement_convertPath_fromContextId_displayId___block_invoke(uint64_t a1, int a2, double *a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v7 = a4;
    AXValueRef v8 = a3 + 1;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "convertPoint:fromContextId:displayId:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(v8 - 1), *v8);
      *((void *)v8 - 1) = v9;
      *(void *)AXValueRef v8 = v10;
      v8 += 2;
      --v7;
    }
    while (v7);
  }
  switch(a2)
  {
    case 0:
      double v11 = *(CGPath **)(a1 + 40);
      CGFloat v12 = *a3;
      CGFloat v13 = a3[1];
      CGPathMoveToPoint(v11, 0, v12, v13);
      break;
    case 1:
      long long v14 = *(CGPath **)(a1 + 40);
      CGFloat v15 = *a3;
      CGFloat v16 = a3[1];
      CGPathAddLineToPoint(v14, 0, v15, v16);
      break;
    case 2:
      CGRect v17 = *(CGPath **)(a1 + 40);
      CGFloat v18 = *a3;
      CGFloat v19 = a3[1];
      CGFloat v20 = a3[2];
      CGFloat v21 = a3[3];
      CGPathAddQuadCurveToPoint(v17, 0, v18, v19, v20, v21);
      break;
    case 3:
      uint64_t v22 = *(CGPath **)(a1 + 40);
      CGFloat v23 = *a3;
      CGFloat v24 = a3[1];
      CGFloat v25 = a3[2];
      CGFloat v26 = a3[3];
      CGFloat v27 = a3[4];
      CGFloat v28 = a3[5];
      CGPathAddCurveToPoint(v22, 0, v23, v24, v25, v26, v27, v28);
      break;
    case 4:
      id v29 = *(CGPath **)(a1 + 40);
      CGPathCloseSubpath(v29);
      break;
    default:
      return;
  }
}

- (void)updateCache:(int64_t)a3
{
}

- (void)clearCachedFrame:(BOOL)a3 cachedVisibleFrame:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (double *)MEMORY[0x1E4F1DB20];
  if (a3) {
    -[AXElement setCachedFrame:](self, "setCachedFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  }
  if (v4)
  {
    double v7 = *v6;
    double v8 = v6[1];
    double v9 = v6[2];
    double v10 = v6[3];
    -[AXElement setCachedVisibleFrame:](self, "setCachedVisibleFrame:", v7, v8, v9, v10);
  }
}

- (int64_t)applicationOrientation
{
  uint64_t v2 = [(AXElement *)self uiElement];
  char v3 = [v2 numberWithAXAttribute:1503];
  int64_t v4 = (int)[v3 intValue];

  return v4;
}

- (BOOL)isScreenLocked
{
  uint64_t v2 = [(AXElement *)self uiElement];
  char v3 = [v2 BOOLWithAXAttribute:1500];

  return v3;
}

- (NSArray)visibleElements
{
  [(AXUIElement *)self->_uiElement updateCache:3015];
  char v3 = [(AXUIElement *)self->_uiElement uiElementsWithAttribute:3015];
  int64_t v4 = [(AXElement *)self _axElementsForAXUIElements:v3];

  return (NSArray *)v4;
}

- (AXElement)firstResponder
{
  return (AXElement *)[(AXElement *)self elementForAttribute:3002];
}

- (id)firstResponderForFocus
{
  return [(AXElement *)self elementForAttribute:3023];
}

- (AXElement)nativeFocusElement
{
  return (AXElement *)[(AXElement *)self elementForAttribute:3024];
}

- (AXElement)nativeFocusPreferredElement
{
  return (AXElement *)[(AXElement *)self elementForAttribute:3027];
}

- (AXElement)firstElementInApplication
{
  return (AXElement *)[(AXElement *)self elementForAttribute:3000];
}

- (AXElement)firstElementInApplicationForFocus
{
  return (AXElement *)[(AXElement *)self elementForAttribute:3009];
}

- (NSString)bundleId
{
  return (NSString *)[(AXUIElement *)self->_uiElement stringWithAXAttribute:3003];
}

- (NSString)processName
{
  return (NSString *)[(AXUIElement *)self->_uiElement stringWithAXAttribute:3041];
}

- (BOOL)isSpringBoard
{
  uint64_t v2 = [(AXElement *)self bundleId];
  char v3 = [v2 isEqualToString:@"com.apple.springboard"];

  return v3;
}

- (BOOL)isSystemApplication
{
  uint64_t v2 = [(AXElement *)self bundleId];
  if (([v2 isEqualToString:@"com.apple.springboard"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.PineBoard"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.Carousel"] & 1) != 0)
  {
    char v3 = 1;
  }
  else
  {
    char v3 = [v2 isEqualToString:@"com.apple.ClarityBoard"];
  }

  return v3;
}

- (BOOL)isControlCenterVisible
{
  return [(AXUIElement *)self->_uiElement BOOLWithAXAttribute:1516];
}

- (BOOL)isDictationListening
{
  [(AXUIElement *)self->_uiElement updateCache:3010];
  uiElement = self->_uiElement;
  return [(AXUIElement *)uiElement BOOLWithAXAttribute:3010];
}

- (BOOL)isAXUIServer
{
  uint64_t v2 = [(AXElement *)self bundleId];
  char v3 = [v2 isEqualToString:@"com.apple.accessibility.AccessibilityUIServer"];

  return v3;
}

- (NSArray)explorerElements
{
  char v3 = [(AXUIElement *)self->_uiElement uiElementsWithAttribute:3022];
  int64_t v4 = [(AXElement *)self _axElementsForAXUIElements:v3];

  return (NSArray *)v4;
}

- (NSArray)nativeFocusableElements
{
  char v3 = [(AXUIElement *)self->_uiElement uiElementsWithAttribute:3029];
  int64_t v4 = [(AXElement *)self _axElementsForAXUIElements:v3];

  return (NSArray *)v4;
}

- (NSArray)elementsWithSemanticContext
{
  char v3 = [(AXUIElement *)self->_uiElement uiElementsWithAttribute:3025];
  int64_t v4 = [(AXElement *)self _axElementsForAXUIElements:v3];

  return (NSArray *)v4;
}

- (NSArray)siriContentNativeFocusableElements
{
  char v3 = [(AXUIElement *)self->_uiElement uiElementsWithAttribute:3031];
  int64_t v4 = [(AXElement *)self _axElementsForAXUIElements:v3];

  return (NSArray *)v4;
}

- (NSArray)siriContentElementsWithSemanticContext
{
  char v3 = [(AXUIElement *)self->_uiElement uiElementsWithAttribute:3032];
  int64_t v4 = [(AXElement *)self _axElementsForAXUIElements:v3];

  return (NSArray *)v4;
}

- (id)focusContainersForCurrentSceneIdentifier:(id)a3
{
  int64_t v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  double v7 = [(AXUIElement *)self->_uiElement objectWithAXAttribute:95257 parameter:v5];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__AXElement_focusContainersForCurrentSceneIdentifier___block_invoke;
  v10[3] = &unk_1E6220CA8;
  id v8 = v6;
  id v11 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];

  return v8;
}

void __54__AXElement_focusContainersForCurrentSceneIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_msgSend(a3, "ax_mappedArrayUsingBlock:", &__block_literal_global_46);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

AXElement *__54__AXElement_focusContainersForCurrentSceneIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[AXElement elementWithAXUIElement:a2];
}

- (NSString)focusedSceneIdentifier
{
  return (NSString *)[(AXUIElement *)self->_uiElement stringWithAXAttribute:3069];
}

- (AXElement)currentFocusContainer
{
  return (AXElement *)[(AXElement *)self elementForAttribute:3062];
}

- (id)elementsMatchingText:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int64_t v4 = (void *)MEMORY[0x1E4F28B88];
  id v5 = a3;
  id v6 = [v4 whitespaceAndNewlineCharacterSet];
  double v7 = [v5 stringByTrimmingCharactersInSet:v6];

  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  [v8 setObject:v7 forKey:@"searchText"];
  double v9 = [NSNumber numberWithInt:0];
  [v8 setObject:v9 forKey:@"resultLimit"];

  double v10 = [(AXUIElement *)self->_uiElement uiElementsWithAttribute:92516 parameter:v8];
  id v11 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        CGRect v17 = +[AXElement elementWithAXUIElement:](AXElement, "elementWithAXUIElement:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        if (v17) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v11;
}

- (AXElement)application
{
  return (AXElement *)[(AXElement *)self elementForAttribute:2017];
}

- (id)remoteApplication
{
  uint64_t v2 = [(AXElement *)self elementForAttribute:2142];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = +[AXElement elementWithUIElement:v2];

    uint64_t v2 = (void *)v3;
  }
  return v2;
}

- (BOOL)isAccessibleElement
{
  return [(AXUIElement *)self->_uiElement BOOLWithAXAttribute:2016];
}

- (BOOL)isVisible
{
  return [(AXUIElement *)self->_uiElement BOOLWithAXAttribute:2025];
}

- (NSString)label
{
  return (NSString *)[(AXUIElement *)self->_uiElement stringWithAXAttribute:2001];
}

- (NSString)speakThisString
{
  return (NSString *)[(AXUIElement *)self->_uiElement stringWithAXAttribute:2085];
}

- (id)accessibilityLocalizedStringKey
{
  return [(AXUIElement *)self->_uiElement stringWithAXAttribute:5047];
}

- (id)accessibilityLocalizationBundleID
{
  return [(AXUIElement *)self->_uiElement stringWithAXAttribute:5048];
}

- (id)accessibilityLocalizationBundlePath
{
  return [(AXUIElement *)self->_uiElement stringWithAXAttribute:5049];
}

- (id)accessibilityLocalizedStringTableName
{
  return [(AXUIElement *)self->_uiElement stringWithAXAttribute:5050];
}

- (NSString)hint
{
  return (NSString *)[(AXUIElement *)self->_uiElement stringWithAXAttribute:2002];
}

- (NSString)speechInputLabel
{
  uint64_t v2 = [(AXElement *)self userInputLabels];
  uint64_t v3 = [v2 firstObject];

  return (NSString *)v3;
}

- (NSArray)userInputLabels
{
  return (NSArray *)[(AXUIElement *)self->_uiElement arrayWithAXAttribute:2186];
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return (NSString *)[(AXUIElement *)self->_uiElement stringWithAXAttribute:2006];
}

- (NSURL)url
{
  uint64_t v2 = [(AXUIElement *)self->_uiElement objectWithAXAttribute:2020];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSURL *)v3;
}

- (CGPath)path
{
  if (![(AXElement *)self cachedPath])
  {
    id v3 = [(AXUIElement *)self->_uiElement pathWithAXAttribute:2042];
    int64_t v4 = +[AXElement systemWideElement];
    -[AXElement setCachedPath:](self, "setCachedPath:", objc_msgSend(v4, "convertPath:fromContextId:displayId:", v3, -[AXElement windowContextId](self, "windowContextId"), -[AXElement windowDisplayId](self, "windowDisplayId")));
  }
  return [(AXElement *)self cachedPath];
}

- (NSString)language
{
  return (NSString *)[(AXUIElement *)self->_uiElement stringWithAXAttribute:2008];
}

- (NSString)identifier
{
  return (NSString *)[(AXUIElement *)self->_uiElement stringWithAXAttribute:2031];
}

- (unint64_t)traits
{
  uint64_t v2 = [(AXUIElement *)self->_uiElement numberWithAXAttribute:2004];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (id)auditIssuesForOptions:(id)a3
{
  unint64_t v3 = [(AXUIElement *)self->_uiElement objectWithAXAttribute:95005 parameter:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (CGPoint)centerPoint
{
  [(AXUIElement *)self->_uiElement pointWithAXAttribute:2007];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)visiblePoint
{
  [(AXUIElement *)self->_uiElement pointWithAXAttribute:2070];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGRect)frame
{
  [(AXElement *)self cachedFrame];
  if (CGRectIsNull(v17))
  {
    [(AXUIElement *)self->_uiElement rectWithAXAttribute:2003];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    id v11 = +[AXElement systemWideElement];
    objc_msgSend(v11, "convertRect:fromContextId:displayId:", -[AXElement windowContextId](self, "windowContextId"), -[AXElement windowDisplayId](self, "windowDisplayId"), v4, v6, v8, v10);
    -[AXElement setCachedFrame:](self, "setCachedFrame:");
  }
  [(AXElement *)self cachedFrame];
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)textCursorFrame
{
  [(AXUIElement *)self->_uiElement updateCache:2050];
  [(AXUIElement *)self->_uiElement rectWithAXAttribute:2050];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = +[AXElement systemWideElement];
  objc_msgSend(v11, "convertRect:fromContextId:displayId:", -[AXElement windowContextId](self, "windowContextId"), -[AXElement windowDisplayId](self, "windowDisplayId"), v4, v6, v8, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGRect)visibleFrame
{
  [(AXElement *)self cachedVisibleFrame];
  if (CGRectIsNull(v17))
  {
    [(AXUIElement *)self->_uiElement rectWithAXAttribute:2057];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    id v11 = +[AXElement systemWideElement];
    objc_msgSend(v11, "convertRect:fromContextId:displayId:", -[AXElement windowContextId](self, "windowContextId"), -[AXElement windowDisplayId](self, "windowDisplayId"), v4, v6, v8, v10);
    -[AXElement setCachedVisibleFrame:](self, "setCachedVisibleFrame:");
  }
  [(AXElement *)self cachedVisibleFrame];
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)focusableFrameForZoom
{
  [(AXUIElement *)self->_uiElement updateCache:2149];
  [(AXUIElement *)self->_uiElement rectWithAXAttribute:2149];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = +[AXElement systemWideElement];
  objc_msgSend(v11, "convertRect:fromContextId:displayId:", -[AXElement windowContextId](self, "windowContextId"), -[AXElement windowDisplayId](self, "windowDisplayId"), v4, v6, v8, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (BOOL)isValid
{
  return [(AXUIElement *)self->_uiElement BOOLWithAXAttribute:2056];
}

- (unint64_t)containerType
{
  double v2 = [(AXUIElement *)self->_uiElement numberWithAXAttribute:2187];
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)isTouchContainer
{
  return (~[(AXElement *)self traits] & 0x200000000000) == 0
      || [(AXElement *)self containerType] == 256
      || [(AXElement *)self containerType] == 0x2000;
}

- (id)containerTypes
{
  return [(AXUIElement *)self->_uiElement arrayWithAXAttribute:2145];
}

- (AXElement)touchContainer
{
  unint64_t v3 = [(AXElement *)self containerTypes];
  double v4 = &unk_1F1423C20;
  if (([v3 containsObject:&unk_1F1423C20] & 1) != 0
    || (double v4 = &unk_1F1423C38, ([v3 containsObject:&unk_1F1423C38] & 1) != 0)
    || (double v4 = &unk_1F1423C50, ([v3 containsObject:&unk_1F1423C50] & 1) != 0)
    || (double v4 = &unk_1F1423C68, ([v3 containsObject:&unk_1F1423C68] & 1) != 0)
    || (double v4 = &unk_1F1423C80, ([v3 containsObject:&unk_1F1423C80] & 1) != 0)
    || (double v4 = &unk_1F1423C98, ([v3 containsObject:&unk_1F1423C98] & 1) != 0)
    || (double v4 = &unk_1F1423CB0, ([v3 containsObject:&unk_1F1423CB0] & 1) != 0)
    || (double v4 = &unk_1F1423CC8, [v3 containsObject:&unk_1F1423CC8]))
  {
    id v5 = [(AXUIElement *)self->_uiElement objectWithAXAttribute:92515 parameter:v4];
    if (v5)
    {
      id v6 = v5;
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 == AXUIElementGetTypeID()) {
        goto LABEL_13;
      }
    }
  }
  [(AXUIElement *)self->_uiElement updateCache:2012];
  id v8 = [(AXUIElement *)self->_uiElement objectWithAXAttribute:2012];
  if (v8 && (id v6 = v8, v9 = CFGetTypeID(v8), v9 == AXUIElementGetTypeID()))
  {
LABEL_13:
    double v10 = +[AXElement elementWithAXUIElement:v6];
  }
  else
  {
    double v10 = 0;
  }

  return (AXElement *)v10;
}

- (AXElement)accessibleAncestor
{
  id v2 = [(AXUIElement *)self->_uiElement objectWithAXAttribute:2096];
  if (v2)
  {
    id v3 = v2;
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == AXUIElementGetTypeID())
    {
      id v2 = +[AXElement elementWithAXUIElement:v3];
    }
    else
    {
      id v2 = 0;
    }
  }
  return (AXElement *)v2;
}

- (NSArray)accessibleDescendants
{
  id v3 = [(AXElement *)self uiElement];
  [v3 updateCache:2095];

  CFTypeID v4 = [(AXElement *)self uiElement];
  id v5 = [v4 uiElementsWithAttribute:2095];
  id v6 = [(AXElement *)self _axElementsForAXUIElements:v5];

  return (NSArray *)v6;
}

- (BOOL)isKeyboardKey
{
  return [(AXElement *)self hasAllTraits:32];
}

- (id)keyboardContainer
{
  id v2 = [(AXElement *)self parentGroup];
  if (v2)
  {
    while (![v2 isKeyboardContainer])
    {
      uint64_t v3 = [v2 parentGroup];

      id v2 = (id)v3;
      if (!v3) {
        goto LABEL_6;
      }
    }
    id v2 = v2;
  }
LABEL_6:

  return v2;
}

- (BOOL)isMathEquation
{
  return [(AXElement *)self hasAllTraits:0x40000000000];
}

- (BOOL)hasWebContent
{
  return [(AXElement *)self hasAllTraits:0x20000];
}

- (BOOL)hasTextEntry
{
  return [(AXElement *)self hasAllTraits:0x200000];
}

- (BOOL)isMap
{
  if ([(AXElement *)self hasAnyTraits:0x1000000000]) {
    return 1;
  }
  CFTypeID v4 = [(AXElement *)self touchContainer];
  char v5 = [v4 hasAnyTraits:0x1000000000];

  return v5;
}

- (NSArray)variantKeys
{
  uint64_t v3 = [(AXElement *)self uiElement];
  [v3 updateCache:12002];

  CFTypeID v4 = [(AXElement *)self uiElement];
  char v5 = [v4 uiElementsWithAttribute:12002];
  id v6 = [(AXElement *)self _axElementsForAXUIElements:v5];

  return (NSArray *)v6;
}

- (BOOL)hasVariantKeys
{
  uint64_t v3 = [(AXElement *)self uiElement];
  [v3 updateCache:12003];

  CFTypeID v4 = [(AXElement *)self uiElement];
  LOBYTE(v3) = [v4 BOOLWithAXAttribute:12003];

  return (char)v3;
}

- (id)_textOperationsOperator
{
  id v2 = self;
  if ([(AXElement *)v2 hasWebContent])
  {
    uint64_t v3 = [(AXElement *)v2 elementForAttribute:2011];

    id v2 = (AXElement *)v3;
  }
  return v2;
}

- (NSArray)textOperations
{
  id v2 = [(AXElement *)self _textOperationsOperator];
  uint64_t v3 = [v2 uiElement];
  [v3 updateCache:2010];

  CFTypeID v4 = [v2 uiElement];
  char v5 = [v4 objectWithAXAttribute:2010];

  return (NSArray *)v5;
}

- (NSArray)typingCandidates
{
  uint64_t v3 = [(AXElement *)self uiElement];
  CFTypeID v4 = [v3 uiElementsWithAttribute:3004];
  char v5 = [(AXElement *)self _axElementsForAXUIElements:v4];

  return (NSArray *)v5;
}

- (void)setAssistiveTechFocused:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = [NSNumber numberWithBool:v3];
  [v8 setObject:v5 forKey:@"focused"];

  if (setAssistiveTechFocused__onceToken != -1) {
    dispatch_once(&setAssistiveTechFocused__onceToken, &__block_literal_global_75);
  }
  id v6 = v8;
  if (setAssistiveTechFocused__isSwitchControl)
  {
    CFTypeID v7 = @"UIAccessibilityNotificationSwitchControlIdentifier";
  }
  else
  {
    if (!setAssistiveTechFocused__isVoiceOver) {
      goto LABEL_8;
    }
    CFTypeID v7 = @"UIAccessibilityNotificationVoiceOverIdentifier";
    id v6 = v8;
  }
  [v6 setObject:v7 forKey:@"assistiveTech"];
LABEL_8:
  [(AXUIElement *)self->_uiElement setAXAttribute:2018 withObject:v8 synchronous:0];
}

void __37__AXElement_setAssistiveTechFocused___block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v2 = [v0 bundleIdentifier];

  if ([v2 isEqualToString:@"com.apple.assistivetouchd"]) {
    char v1 = 1;
  }
  else {
    char v1 = [v2 isEqualToString:@"com.apple.accessibility.ASTTestApp"];
  }
  setAssistiveTechFocused__isSwitchControl = v1;
  setAssistiveTechFocused__isVoiceOver = [v2 isEqualToString:@"com.apple.VoiceOverTouch"];
}

- (BOOL)assistiveTechFocused
{
  return [(AXUIElement *)self->_uiElement BOOLWithAXAttribute:2018];
}

- (NSArray)customActions
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  CFTypeID v4 = [(AXElement *)self remoteParent];
  char v5 = v4;
  if (v4)
  {
    id v6 = [v4 customActions];
    if ([v6 count]) {
      [v3 addObjectsFromArray:v6];
    }
  }
  CFTypeID v7 = [(AXElement *)self uiElement];
  id v8 = [v7 arrayWithAXAttribute:2036];

  if ([v8 count]) {
    [v3 addObjectsFromArray:v8];
  }

  return (NSArray *)v3;
}

- (NSArray)drags
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  CFTypeID v4 = [(AXElement *)self uiElement];
  char v5 = [v4 arrayWithAXAttribute:2175];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (AXValidateDictionaryAsDragWireFormat(v10)) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (NSArray)drops
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  CFTypeID v4 = [(AXElement *)self uiElement];
  char v5 = [v4 arrayWithAXAttribute:2176];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (AXValidateDictionaryAsDropWireFormat(v10)) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (NSString)roleDescription
{
  id v2 = [(AXElement *)self uiElement];
  BOOL v3 = [v2 stringWithAXAttribute:2077];

  return (NSString *)v3;
}

- (_NSRange)rowRange
{
  id v2 = [(AXElement *)self uiElement];
  uint64_t v3 = [v2 rangeWithAXAttribute:2027];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (NSString)textualContext
{
  id v2 = [(AXElement *)self uiElement];
  uint64_t v3 = [v2 stringWithAXAttribute:2193];

  return (NSString *)v3;
}

- (BOOL)isComboBox
{
  id v2 = [(AXElement *)self uiElement];
  char v3 = [v2 BOOLWithAXAttribute:2030];

  return v3;
}

- (BOOL)required
{
  id v2 = [(AXElement *)self uiElement];
  char v3 = [v2 BOOLWithAXAttribute:2029];

  return v3;
}

- (_NSRange)selectedTextRange
{
  char v3 = [(AXElement *)self uiElement];
  [v3 updateCache:2005];

  NSUInteger v4 = [(AXElement *)self uiElement];
  uint64_t v5 = [v4 rangeWithAXAttribute:2005];
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (void)setSelectedTextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(AXElement *)self uiElement];
  objc_msgSend(v5, "setAXAttribute:withRange:", 2005, location, length);
}

- (id)_objectForRange:(_NSRange)a3 withParameterizedAttribute:(int64_t)a4
{
  _NSRange v10 = a3;
  AXValueRef v6 = AXValueCreate(kAXValueTypeCFRange, &v10);
  if (v6)
  {
    AXValueRef v7 = v6;
    NSUInteger v8 = [(AXUIElement *)self->_uiElement objectWithAXAttribute:a4 parameter:v6];
    CFRelease(v7);
  }
  else
  {
    NSUInteger v8 = 0;
  }
  return v8;
}

- (CGRect)boundsForTextRange:(_NSRange)a3
{
  NSUInteger v4 = (CGRect *)MEMORY[0x1E4F1DB28];
  CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v20.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v20.size = v5;
  AXValueRef v6 = -[AXElement _objectForRange:withParameterizedAttribute:](self, "_objectForRange:withParameterizedAttribute:", a3.location, a3.length, 92506);
  if (v6)
  {
    AXValueRef v7 = v6;
    CFTypeID v8 = CFGetTypeID(v6);
    if (v8 == AXValueGetTypeID() && AXValueGetType(v7) == kAXValueTypeCGRect) {
      AXValueGetValue(v7, kAXValueTypeCGRect, &v20);
    }
  }
  if (!CGRectEqualToRect(v20, *v4) && !CGRectEqualToRect(v20, *MEMORY[0x1E4F1DB20]))
  {
    NSUInteger v9 = +[AXElement systemWideElement];
    uint64_t v10 = [(AXElement *)self windowContextId];
    uint64_t v11 = [(AXElement *)self windowDisplayId];
    objc_msgSend(v9, "convertRect:fromContextId:displayId:", v10, v11, *(_OWORD *)&v20.origin, *(_OWORD *)&v20.size);
    v20.origin.double x = v12;
    v20.origin.double y = v13;
    v20.size.double width = v14;
    v20.size.double height = v15;
  }
  double y = v20.origin.y;
  double x = v20.origin.x;
  double height = v20.size.height;
  double width = v20.size.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)nextElementsWithCount:(unint64_t)a3
{
  unsigned int v3 = a3;
  CGSize v5 = [(AXElement *)self uiElement];
  AXValueRef v6 = [v5 nextElementsWithCount:v3];
  AXValueRef v7 = [(AXElement *)self _axElementsForAXUIElements:v6];

  return v7;
}

- (id)previousElementsWithCount:(unint64_t)a3
{
  unsigned int v3 = a3;
  CGSize v5 = [(AXElement *)self uiElement];
  AXValueRef v6 = [v5 previousElementsWithCount:v3];
  AXValueRef v7 = [(AXElement *)self _axElementsForAXUIElements:v6];

  return v7;
}

- (BOOL)hasAllTraits:(unint64_t)a3
{
  return (a3 & ~[(AXElement *)self traits]) == 0;
}

- (BOOL)hasAnyTraits:(unint64_t)a3
{
  return ([(AXElement *)self traits] & a3) != 0;
}

- (BOOL)hasOnlyTraits:(unint64_t)a3
{
  return [(AXElement *)self traits] == a3;
}

- (double)distanceToElement:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = 0.0;
    if (![(AXElement *)self isEqual:v4])
    {
      [v4 visibleFrame];
      CGFloat x = v13.origin.x;
      CGFloat y = v13.origin.y;
      CGFloat width = v13.size.width;
      CGFloat height = v13.size.height;
      double MidX = CGRectGetMidX(v13);
      v14.origin.CGFloat x = x;
      v14.origin.CGFloat y = y;
      v14.size.CGFloat width = width;
      v14.size.CGFloat height = height;
      -[AXElement distanceToPoint:](self, "distanceToPoint:", MidX, CGRectGetMidY(v14));
      double v5 = v11;
    }
  }
  else
  {
    double v5 = 1.79769313e308;
  }

  return v5;
}

- (double)distanceToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(AXElement *)self visibleFrame];
  CGFloat v5 = v12.origin.x;
  CGFloat v6 = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  double MidX = CGRectGetMidX(v12);
  v13.origin.double x = v5;
  v13.origin.double y = v6;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v13);
  return sqrt((x - MidX) * (x - MidX) + (y - MidY) * (y - MidY));
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  return [(AXUIElement *)self->_uiElement BOOLWithAXAttribute:2065];
}

- (BOOL)isNativeFocused
{
  return [(AXUIElement *)self->_uiElement BOOLWithAXAttribute:2094];
}

- (BOOL)viewHierarchyHasNativeFocus
{
  return [(AXUIElement *)self->_uiElement BOOLWithAXAttribute:2127];
}

- (BOOL)setNativeFocus
{
  return [(AXUIElement *)self->_uiElement performAXAction:2044];
}

- (BOOL)eligibleForIconVision
{
  if (([(AXElement *)self traits] & 0x8000020) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    id v4 = [(AXUIElement *)self->_uiElement numberWithAXAttribute:2701];
    unint64_t v5 = [v4 unsignedIntegerValue];

    return (v5 >> 15) & 1;
  }
  return v3;
}

- (NSDictionary)semanticContext
{
  id v2 = [(AXUIElement *)self->_uiElement objectWithAXAttribute:13001];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (int)pid
{
  id v2 = [(AXElement *)self uiElement];
  int v3 = [v2 pid];

  return v3;
}

- (AXElement)elementParent
{
  return (AXElement *)[(AXElement *)self _elementForAttribute:5002 shouldUpdateCache:0 shouldFetchAttributes:0];
}

- (AXElement)remoteParent
{
  int v3 = [(AXElement *)self cachedRemoteParent];

  if (!v3)
  {
    id v4 = [(AXElement *)self _elementForAttribute:2092 shouldUpdateCache:0 shouldFetchAttributes:0];
    [(AXElement *)self setCachedRemoteParent:v4];
  }
  return [(AXElement *)self cachedRemoteParent];
}

- (unint64_t)scanningBehaviorTraits
{
  id v2 = [(AXElement *)self uiElement];
  int v3 = [v2 numberWithAXAttribute:2147];
  unint64_t v4 = (int)[v3 intValue];

  return v4;
}

- (id)_remoteParentForContextID
{
  int v3 = [(AXElement *)self cachedRemoteParentForContextID];

  if (!v3)
  {
    unint64_t v4 = [(AXElement *)self _elementForAttribute:2310 shouldUpdateCache:0 shouldFetchAttributes:0];
    [(AXElement *)self setCachedRemoteParentForContextID:v4];
  }
  return [(AXElement *)self cachedRemoteParentForContextID];
}

- (BOOL)canPerformZoom
{
  if ([(AXElement *)self hasAnyTraits:0x400000000000] || [(AXElement *)self isMap])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(AXElement *)self hasWebContent];
    if (v3)
    {
      if ([(AXElement *)self hasTextEntry] || [(AXElement *)self isKeyboardKey]) {
        LOBYTE(v3) = 0;
      }
      else {
        LOBYTE(v3) = ![(AXElement *)self isMathEquation];
      }
    }
  }
  return v3;
}

- (BOOL)canPerformTrackingDetail
{
  return [(AXElement *)self isMap] && [(AXElement *)self hasAnyTraits:0x80000000000000];
}

- (BOOL)_showContextMenuWithTargetPointValue:(id)a3
{
  id v4 = a3;
  if ([(AXUIElement *)self->_uiElement performAXAction:2051 withValue:v4])
  {
    char v5 = 1;
  }
  else
  {
    CGFloat v6 = [(AXElement *)self remoteParent];
    AXValueRef v7 = v6;
    if (v6) {
      char v5 = [v6 _showContextMenuWithTargetPointValue:v4];
    }
    else {
      char v5 = 0;
    }
  }
  return v5;
}

- (BOOL)showContextMenu
{
  if ([(AXElement *)self hasAllTraits:0x20000])
  {
    BOOL v3 = (void *)MEMORY[0x1E4F29238];
    [(AXElement *)self centerPoint];
    id v4 = objc_msgSend(v3, "valueWithPoint:");
  }
  else
  {
    id v4 = 0;
  }
  BOOL v5 = [(AXElement *)self _showContextMenuWithTargetPointValue:v4];

  return v5;
}

- (BOOL)scrollToVisible
{
  BOOL v3 = [(AXElement *)self uiElement];
  char v4 = [v3 performAXAction:2003];

  BOOL v5 = [(AXElement *)self uiElement];
  int v6 = [v5 BOOLWithAXAttribute:2093];

  if (v6)
  {
    AXValueRef v7 = [(AXElement *)self remoteParent];
    if (v7)
    {
      CFTypeID v8 = [(AXElement *)self uiElement];
      [v8 updateCache:2003];

      [(AXElement *)self frame];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      uint64_t v17 = [v7 uiElement];
      double v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v10, v12, v14, v16);
      char v4 = [v17 performAXAction:2039 withValue:v18];
    }
  }
  double v19 = [(AXElement *)self uiElement];
  [v19 updateCache:2057];

  return v4;
}

- (BOOL)canScrollInAtLeastOneDirection
{
  BOOL v3 = [(AXElement *)self uiElement];
  char v4 = [v3 BOOLWithAXAttribute:2064];

  if (v4) {
    return 1;
  }
  int v6 = [(AXElement *)self uiElement];
  int v7 = [v6 BOOLWithAXAttribute:2093];

  if (!v7) {
    return 0;
  }
  CFTypeID v8 = [(AXElement *)self remoteParent];
  double v9 = [v8 uiElement];
  char v10 = [v9 BOOLWithAXAttribute:2064];

  return v10;
}

- (BOOL)supportsAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL result = 0;
  if (a3 > 2029)
  {
    if ((a3 - 2037) < 2)
    {
      return [(AXElement *)self canPerformTrackingDetail];
    }
    else if (a3 == 2030)
    {
      char v10 = [(AXElement *)self uiElement];
      char v13 = [v10 canPerformAXAction:2030];
LABEL_28:
      char v12 = v13;
LABEL_29:

      return v12;
    }
    else if (a3 == 2036)
    {
      return [(AXElement *)self canPerformSecondaryActivate];
    }
  }
  else
  {
    switch(a3)
    {
      case 2001:
      case 2002:
        return [(AXElement *)self canPerformZoom];
      case 2006:
      case 2007:
      case 2008:
      case 2009:
        int v6 = [(AXElement *)self uiElement];
        char v7 = [v6 canPerformAXAction:v3];

        if (v7) {
          return 1;
        }
        CFTypeID v8 = [(AXElement *)self uiElement];
        int v9 = [v8 BOOLWithAXAttribute:2093];

        if (v9)
        {
          char v10 = [(AXElement *)self remoteParent];
          double v11 = [v10 uiElement];
          char v12 = [v11 canPerformAXAction:v3];

          goto LABEL_29;
        }
        BOOL result = 0;
        break;
      case 2010:
        return [(AXElement *)self canPerformActivate];
      case 2012:
        char v10 = [(AXElement *)self _textOperationsOperator];
        char v13 = [v10 hasAnyTraits:0x2000000000];
        goto LABEL_28;
      case 2013:
        return [(AXElement *)self canPerformEscape];
      default:
        return result;
    }
  }
  return result;
}

- (BOOL)performAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((a3 - 2006) > 0xE) {
    goto LABEL_20;
  }
  if (((1 << (a3 + 42)) & 0x600F) != 0)
  {
    BOOL v5 = [(AXElement *)self uiElement];
    char v6 = [v5 performAXAction:v3];

    if (v6) {
      return 1;
    }
    CFTypeID v8 = [(AXElement *)self uiElement];
    int v9 = [v8 BOOLWithAXAttribute:2093];

    if (v9)
    {
      char v10 = [(AXElement *)self remoteParent];
      double v11 = [v10 uiElement];
      char v12 = [v11 performAXAction:v3];

LABEL_21:
      return v12;
    }
    return 0;
  }
  if (a3 != 2010)
  {
    if (a3 == 2013)
    {
      char v13 = [(AXElement *)self uiElement];
      char v14 = [v13 performAXAction:2013];

      if (v14) {
        return 1;
      }
      double v15 = [(AXElement *)self remoteParent];
      if (v15)
      {
        double v16 = v15;
        uint64_t v17 = [v15 uiElement];
        char v18 = [v17 performAXAction:2013];

        if (v18) {
          return 1;
        }
      }
      if (_AXSClarityBoardEnabled())
      {
        double v19 = +[AXElement systemApplication];
        CGRect v20 = [(AXElement *)self application];
        char v21 = [v20 isEqual:v19];

        if (v21)
        {
          char v7 = 0;
        }
        else
        {
          double v23 = [v19 firstElementInApplication];
          char v7 = [v23 performAction:2013];
        }
        return v7;
      }
      return 0;
    }
LABEL_20:
    char v10 = [(AXElement *)self uiElement];
    char v12 = [v10 performAXAction:v3];
    goto LABEL_21;
  }
  return [(AXElement *)self press];
}

- (BOOL)performAction:(int)a3 withValue:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (v4 == 2012)
  {
    char v7 = [(AXElement *)self _textOperationsOperator];
    CFTypeID v8 = [v7 uiElement];
    int v9 = v8;
    uint64_t v10 = 2012;
    goto LABEL_7;
  }
  double v11 = [(AXElement *)self uiElement];
  char v12 = [v11 performAXAction:v4 withValue:v6];

  if (v4 == 2021 && (v12 & 1) == 0)
  {
    char v13 = [(AXElement *)self remoteParent];
    char v7 = v13;
    if (!v13)
    {
      char v12 = 0;
      goto LABEL_8;
    }
    CFTypeID v8 = [v13 uiElement];
    int v9 = v8;
    uint64_t v10 = 2021;
LABEL_7:
    char v12 = [v8 performAXAction:v10 withValue:v6];

LABEL_8:
  }

  return v12;
}

- (__AXUIElement)scrollAncestorForScrollAction:(int)a3
{
  if ((a3 - 2006) > 2) {
    uint64_t v4 = 2107;
  }
  else {
    uint64_t v4 = qword_1BA6A6418[a3 - 2006];
  }
  BOOL v5 = [(AXElement *)self uiElement];
  id v6 = (void *)[v5 objectWithAXAttribute:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = (void *)[v6 axElement];
  }
  if (v6) {
    return (__AXUIElement *)v6;
  }
  char v7 = [(AXElement *)self uiElement];
  int v8 = [v7 BOOLWithAXAttribute:2093];

  if (!v8) {
    return 0;
  }
  int v9 = [(AXElement *)self remoteParent];
  uint64_t v10 = [v9 uiElement];
  id v6 = (void *)[v10 objectWithAXAttribute:v4];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return (__AXUIElement *)v6;
  }
  return (__AXUIElement *)[v6 axElement];
}

- (unsigned)windowDisplayId
{
  uint64_t v3 = [(AXUIElement *)self->_uiElement numberWithAXAttribute:2123];
  unsigned int v4 = [v3 unsignedIntValue];

  if (!v4)
  {
    BOOL v5 = [(AXElement *)self _remoteParentForContextID];
    id v6 = v5;
    if (v5)
    {
      char v7 = [v5 uiElement];
      int v8 = [v7 numberWithAXAttribute:2123];
      unsigned int v4 = [v8 unsignedIntValue];
    }
    else
    {
      unsigned int v4 = 0;
    }
  }
  return v4;
}

- (unsigned)windowContextId
{
  uint64_t v3 = [(AXUIElement *)self->_uiElement numberWithAXAttribute:2021];
  unsigned int v4 = [v3 unsignedIntValue];

  if (!v4)
  {
    BOOL v5 = [(AXElement *)self _remoteParentForContextID];
    id v6 = v5;
    if (v5)
    {
      char v7 = [v5 uiElement];
      int v8 = [v7 numberWithAXAttribute:2021];
      unsigned int v4 = [v8 unsignedIntValue];
    }
    else
    {
      unsigned int v4 = 0;
    }
  }
  return v4;
}

- (NSString)fbSceneIdentifier
{
  uint64_t v3 = [(AXUIElement *)self->_uiElement stringWithAXAttribute:2721];
  if (!v3)
  {
    unsigned int v4 = [(AXElement *)self _remoteParentForContextID];
    BOOL v5 = v4;
    if (v4)
    {
      id v6 = [v4 uiElement];
      uint64_t v3 = [v6 stringWithAXAttribute:2721];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return (NSString *)v3;
}

- (NSString)windowSceneIdentifier
{
  uint64_t v3 = [(AXUIElement *)self->_uiElement stringWithAXAttribute:3056];
  if (!v3)
  {
    unsigned int v4 = [(AXElement *)self _remoteParentForContextID];
    uint64_t v3 = [v4 windowSceneIdentifier];
  }
  return (NSString *)v3;
}

- (NSArray)supportedGestures
{
  return (NSArray *)[(AXUIElement *)self->_uiElement arrayWithAXAttribute:2063];
}

- (BOOL)canPerformActivate
{
  uint64_t v3 = [(AXElement *)self uiElement];
  [v3 updateCache:2019];

  unsigned int v4 = [(AXElement *)self uiElement];
  char v5 = [v4 BOOLWithAXAttribute:2019];

  if (v5) {
    return 1;
  }
  char v7 = [(AXElement *)self uiElement];
  int v8 = [v7 BOOLWithAXAttribute:2101];

  if (!v8) {
    return 0;
  }
  int v9 = [(AXElement *)self remoteParent];
  uint64_t v10 = v9;
  if (v9)
  {
    double v11 = [v9 uiElement];
    [v11 updateCache:2019];

    char v12 = [v10 uiElement];
    char v6 = [v12 BOOLWithAXAttribute:2019];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_performActivate
{
  uint64_t v3 = [(AXElement *)self uiElement];
  char v4 = [v3 performAXAction:2010];

  if (v4) {
    return 1;
  }
  char v6 = [(AXElement *)self uiElement];
  int v7 = [v6 BOOLWithAXAttribute:2101];

  if (!v7) {
    return 0;
  }
  int v8 = [(AXElement *)self remoteParent];
  int v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 uiElement];
    char v5 = [v10 performAXAction:2010];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)canPerformSecondaryActivate
{
  [(AXUIElement *)self->_uiElement updateCache:2079];
  uiElement = self->_uiElement;
  return [(AXUIElement *)uiElement BOOLWithAXAttribute:2079];
}

- (BOOL)press
{
  v27[3] = *MEMORY[0x1E4F143B8];
  if ([(AXElement *)self canPerformActivate]
    && [(AXElement *)self _performActivate])
  {
    goto LABEL_9;
  }
  [(AXElement *)self visiblePoint];
  double valuePtr = v4;
  double v23 = v3;
  if (v4 != -1.0 || v3 != -1.0) {
    goto LABEL_11;
  }
  if ([(AXUIElement *)self->_uiElement performAXAction:2010])
  {
LABEL_9:
    char v6 = 1;
    goto LABEL_18;
  }
  [(AXElement *)self centerPoint];
  double valuePtr = v7;
  double v23 = v8;
LABEL_11:
  if (_AXSMossdeepEnabled())
  {
    int v9 = [(AXUIElement *)self->_uiElement objectWithAXAttribute:5063];
    if (v9)
    {
      v24[0] = @"additionalInfo";
      uint64_t v10 = [(AXUIElement *)self->_uiElement objectWithAXAttribute:5063];
      v24[1] = @"delay";
      v25[0] = v10;
      v25[1] = &unk_1F1424008;
      double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    }
    else
    {
      double v11 = 0;
    }
  }
  else
  {
    int v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[AXElement windowContextId](self, "windowContextId"));
    AXValueRef v12 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
    v26[0] = @"point";
    v26[1] = @"windowContextID";
    v27[0] = v12;
    v27[1] = v9;
    v26[2] = @"delay";
    v27[2] = &unk_1F1424008;
    double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
    if (v12) {
      CFRelease(v12);
    }
  }

  char v13 = +[AXElement systemEventDispatchElement];
  char v6 = [v13 performAction:5008 withValue:v11];

LABEL_18:
  char v14 = [(AXElement *)self elementForAttribute:2017];
  double v15 = [v14 bundleId];

  if (([v15 hasPrefix:@"com.apple."] & 1) == 0)
  {
    dispatch_time_t v16 = dispatch_time(0, 500000000);
    dispatch_after(v16, MEMORY[0x1E4F14428], &__block_literal_global_97_0);
  }
  uint64_t v17 = [(AXElement *)self uiElement];
  char v18 = [v17 numberWithAXAttribute:2068];
  [v18 doubleValue];
  double v20 = v19;

  if (v20 <= 0.0) {
    [(AXElement *)self _updateLabel];
  }
  else {
    [(AXElement *)self performSelector:sel__updateLabel withObject:0 afterDelay:v20];
  }

  return v6;
}

uint64_t __18__AXElement_press__block_invoke()
{
  return AXPushNotificationToSystemForBroadcast();
}

- (BOOL)longPress
{
  v13[3] = *MEMORY[0x1E4F143B8];
  [(AXElement *)self visiblePoint];
  char v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[AXElement windowContextId](self, "windowContextId", v3, v4));
  AXValueRef v6 = AXValueCreate(kAXValueTypeCGPoint, &v12);
  v13[0] = v6;
  double v7 = [NSNumber numberWithFloat:0.0];
  v13[1] = v7;
  v13[2] = v5;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];

  if (v6) {
    CFRelease(v6);
  }
  int v9 = +[AXElement systemWideElement];
  char v10 = [v9 performAction:5004 withValue:v8];

  return v10;
}

- (BOOL)_zoomInOrOut:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 2001;
  }
  else {
    uint64_t v4 = 2002;
  }
  [(AXElement *)self centerPoint];
  char v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:");
  [(AXElement *)self performAction:v4 withValue:v5];
  AXValueRef v6 = [(AXElement *)self remoteParent];
  double v7 = v6;
  if (v6) {
    [v6 performAction:v4 withValue:v5];
  }

  return 1;
}

- (BOOL)zoomIn
{
  return [(AXElement *)self _zoomInOrOut:1];
}

- (BOOL)zoomOut
{
  return [(AXElement *)self _zoomInOrOut:0];
}

- (id)_uiElementForTextInsertionAndDeletion
{
  [(AXUIElement *)self->_uiElement updateCache:2183];
  uint64_t v3 = [(AXUIElement *)self->_uiElement objectWithAXAttribute:2183];
  uint64_t v4 = +[AXUIElement uiElementWithAXElement:v3 cache:0];

  return v4;
}

- (void)insertText:(id)a3
{
}

- (void)insertText:(id)a3 asUndoableAction:(BOOL)a4
{
  BOOL v4 = a4;
  v14[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    if (v4)
    {
      double v7 = [(AXElement *)self _textOperationsOperator];
      double v8 = v7;
      if (v7 == self)
      {
        char v10 = [(AXElement *)self _uiElementForTextInsertionAndDeletion];
        v13[0] = @"text";
        v13[1] = @"createsUndoableAction";
        v14[0] = v6;
        double v11 = [NSNumber numberWithBool:1];
        v14[1] = v11;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
        [v10 performAXAction:2056 withValue:v12];
      }
      else
      {
        [(AXElement *)v7 performAction:2060];
        int v9 = [(AXElement *)self _uiElementForTextInsertionAndDeletion];
        [v9 performAXAction:2056 withValue:v6];

        [v8 performAction:2061];
      }
    }
    else
    {
      double v8 = [(AXElement *)self _uiElementForTextInsertionAndDeletion];
      [v8 performAXAction:2056 withValue:v6];
    }
  }
}

- (void)insertTextWithAlternatives:(id)a3
{
  id v4 = a3;
  id v5 = [(AXElement *)self _uiElementForTextInsertionAndDeletion];
  [v5 performAXAction:2055 withValue:v4];
}

- (void)deleteText
{
  id v2 = [(AXElement *)self _uiElementForTextInsertionAndDeletion];
  [v2 performAXAction:2052];
}

- (id)alternativesForTextAtPosition:(unint64_t)a3
{
  id v4 = [(AXElement *)self _uiElementForTextInsertionAndDeletion];
  id v5 = objc_msgSend(v4, "objectWithAXAttribute:parameter:", 95237, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3));

  return v5;
}

- (AXElement)elementForTextInsertionAndDeletion
{
  id v2 = [(AXElement *)self _uiElementForTextInsertionAndDeletion];
  uint64_t v3 = +[AXElement elementWithUIElement:v2];

  return (AXElement *)v3;
}

- (BOOL)respondsToUserInteraction
{
  id v2 = [(AXElement *)self uiElement];
  char v3 = [v2 BOOLWithAXAttribute:12000];

  return v3;
}

- (int64_t)scannerActivateBehavior
{
  id v2 = [(AXElement *)self uiElement];
  char v3 = [v2 numberWithAXAttribute:12004];
  int64_t v4 = (int)[v3 intValue];

  return v4;
}

- (BOOL)canPerformEscape
{
  char v3 = [(AXElement *)self uiElement];
  char v4 = [v3 BOOLWithAXAttribute:2061];

  if (v4) {
    return 1;
  }
  id v6 = [(AXElement *)self remoteParent];
  double v7 = v6;
  if (v6)
  {
    double v8 = [v6 uiElement];
    char v5 = [v8 BOOLWithAXAttribute:2061];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (AXElement)autoscrollTarget
{
  id v2 = [(AXElement *)self uiElement];
  char v3 = [v2 objectWithAXAttribute:2054];

  return (AXElement *)v3;
}

- (void)setAutoscrollTarget:(id)a3
{
  char v4 = a3;
  id v6 = [(AXElement *)self uiElement];
  uint64_t v5 = v4[2];

  [v6 setAXAttribute:2054 withUIElement:v5];
}

- (BOOL)autoscrollInDirection:(unint64_t)a3
{
  char v4 = [(AXElement *)self uiElement];
  uint64_t v5 = [NSNumber numberWithUnsignedLong:a3];
  char v6 = [v4 performAXAction:2026 withValue:v5];

  return v6;
}

- (void)pauseAutoscrolling
{
  id v2 = [(AXElement *)self uiElement];
  [v2 performAXAction:2027];
}

- (BOOL)isAutoscrolling
{
  char v3 = [(AXElement *)self uiElement];
  [v3 updateCache:2055];

  char v4 = [(AXElement *)self uiElement];
  LOBYTE(v3) = [v4 BOOLWithAXAttribute:2055];

  return (char)v3;
}

- (void)increaseAutoscrollSpeed
{
  id v2 = [(AXElement *)self uiElement];
  [v2 performAXAction:2028];
}

- (void)decreaseAutoscrollSpeed
{
  id v2 = [(AXElement *)self uiElement];
  [v2 performAXAction:2029];
}

- (void)setAutoscrollSpeed:(double)a3
{
  id v5 = [(AXElement *)self uiElement];
  char v4 = [NSNumber numberWithDouble:a3];
  [v5 performAXAction:2032 withValue:v4];
}

- (id)scrollViewsForAutoScroll
{
  char v3 = [(AXElement *)self uiElement];
  [v3 updateCache:3070];

  char v4 = [(AXElement *)self uiElement];
  id v5 = [v4 uiElementsWithAttribute:3070];

  char v6 = [(AXElement *)self _axElementsForAXUIElements:v5];

  return v6;
}

- (void)scrollToTop
{
  id v2 = [(AXElement *)self uiElement];
  [v2 performAXAction:2030];
}

- (void)scrollToBottom
{
  id v2 = [(AXElement *)self uiElement];
  [v2 performAXAction:2031];
}

- (BOOL)pressTVSelectButton
{
  return [(AXElement *)self performAction:4000];
}

- (BOOL)pressTVBackButton
{
  return [(AXElement *)self performAction:4001];
}

- (BOOL)pressTVMenuButton
{
  return [(AXElement *)self performAction:4002];
}

- (BOOL)pressTVPlayPauseButton
{
  return [(AXElement *)self performAction:4003];
}

- (BOOL)pressTVUpButton
{
  return [(AXElement *)self performAction:4004];
}

- (BOOL)pressTVDownButton
{
  return [(AXElement *)self performAction:4005];
}

- (BOOL)pressTVLeftButton
{
  return [(AXElement *)self performAction:4007];
}

- (BOOL)pressTVRightButton
{
  return [(AXElement *)self performAction:4006];
}

- (BOOL)pressTVPlayButton
{
  return [(AXElement *)self performAction:4008];
}

- (BOOL)pressTVPauseButton
{
  return [(AXElement *)self performAction:4009];
}

- (BOOL)pressTVStopButton
{
  return [(AXElement *)self performAction:4010];
}

- (BOOL)pressTVRewindButton
{
  return [(AXElement *)self performAction:4011];
}

- (BOOL)pressTVFastForwardButton
{
  return [(AXElement *)self performAction:4012];
}

- (BOOL)pressTVNextTrackButton
{
  return [(AXElement *)self performAction:4013];
}

- (BOOL)pressTVPreviousTrackButton
{
  return [(AXElement *)self performAction:4014];
}

- (BOOL)pressTVSkipForwardsButton
{
  return [(AXElement *)self performAction:4015];
}

- (BOOL)pressTVSkipBackwardsButton
{
  return [(AXElement *)self performAction:4016];
}

- (BOOL)pressTVDataOnScreenButton
{
  return [(AXElement *)self performAction:4017];
}

- (BOOL)pressTVMicButton
{
  return [(AXElement *)self performAction:4018];
}

- (NSArray)customContent
{
  id v2 = [(AXUIElement *)self->_uiElement objectWithAXAttribute:2210];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = 0;
    char v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v2 error:&v12];
    id v4 = v12;
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v14 = 0;
    double v15 = &v14;
    uint64_t v16 = 0x2050000000;
    double v7 = (void *)getAXCustomContentClass_softClass;
    uint64_t v17 = getAXCustomContentClass_softClass;
    if (!getAXCustomContentClass_softClass)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __getAXCustomContentClass_block_invoke;
      v13[3] = &unk_1E6220520;
      void v13[4] = &v14;
      __getAXCustomContentClass_block_invoke((uint64_t)v13);
      double v7 = (void *)v15[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v14, 8);
    int v9 = objc_msgSend(v5, "setWithObjects:", v6, v8, 0);
    char v10 = [v3 decodeObjectOfClasses:v9 forKey:*MEMORY[0x1E4F284E8]];
  }
  else
  {
    char v10 = 0;
  }

  return (NSArray *)v10;
}

- (id)highestAncestorGroup
{
  id v2 = [(AXElement *)self parentGroup];
  if (v2)
  {
    char v3 = v2;
    id v4 = v2;
    do
    {
      id v5 = v3;

      char v3 = [v5 parentGroup];

      id v4 = v5;
    }
    while (v3);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (BOOL)isGroup
{
  return 0;
}

- (NSArray)children
{
  char v3 = [(AXUIElement *)self->_uiElement uiElementsWithAttribute:5001];
  id v4 = [(AXElement *)self _axElementsForAXUIElements:v3];

  return (NSArray *)v4;
}

- (NSArray)parent
{
  return (NSArray *)[(AXElement *)self elementForAttribute:5002];
}

- (id)_axElementsForAXUIElements:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() elementsWithUIElements:v3];

  return v4;
}

- (void)_updateLabel
{
  id v2 = [(AXElement *)self uiElement];
  [v2 updateCache:2001];
}

- (AXUIElement)uiElement
{
  return self->_uiElement;
}

- (void)setUiElement:(id)a3
{
}

- (AXElementGroup)parentGroup
{
  return self->_parentGroup;
}

- (void)setParentGroup:(id)a3
{
  self->_parentGroup = (AXElementGroup *)a3;
}

- (NSString)localizedStringKey
{
  return self->_localizedStringKey;
}

- (NSString)localizationBundleID
{
  return self->_localizationBundleID;
}

- (NSString)localizationBundlePath
{
  return self->_localizationBundlePath;
}

- (NSString)localizedStringTableName
{
  return self->_localizedStringTableName;
}

- (BOOL)hoverTypingShouldAdjustDockedMode
{
  return self->_hoverTypingShouldAdjustDockedMode;
}

- (BOOL)representsScannerGroup
{
  return self->_representsScannerGroup;
}

- (AXElement)cachedRemoteParent
{
  return self->_cachedRemoteParent;
}

- (void)setCachedRemoteParent:(id)a3
{
}

- (AXElement)cachedRemoteParentForContextID
{
  return self->_cachedRemoteParentForContextID;
}

- (void)setCachedRemoteParentForContextID:(id)a3
{
}

- (CGPath)cachedPath
{
  return self->_cachedPath;
}

- (void)setCachedPath:(CGPath *)a3
{
}

- (CGRect)cachedFrame
{
  double x = self->_cachedFrame.origin.x;
  double y = self->_cachedFrame.origin.y;
  double width = self->_cachedFrame.size.width;
  double height = self->_cachedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedFrame:(CGRect)a3
{
  self->_cachedFrame = a3;
}

- (CGRect)cachedVisibleFrame
{
  double x = self->_cachedVisibleFrame.origin.x;
  double y = self->_cachedVisibleFrame.origin.y;
  double width = self->_cachedVisibleFrame.size.width;
  double height = self->_cachedVisibleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedVisibleFrame:(CGRect)a3
{
  self->_cachedVisibleFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRemoteParentForContextID, 0);
  objc_storeStrong((id *)&self->_cachedRemoteParent, 0);
  objc_storeStrong((id *)&self->_localizedStringTableName, 0);
  objc_storeStrong((id *)&self->_localizationBundlePath, 0);
  objc_storeStrong((id *)&self->_localizationBundleID, 0);
  objc_storeStrong((id *)&self->_localizedStringKey, 0);
  objc_storeStrong((id *)&self->_uiElement, 0);
}

- (id)makeLookingGlassRequest:(id)a3
{
  id v4 = a3;
  AXUIElementSetMessagingTimeout([(AXElement *)self elementRef], 20.0);
  id v5 = [(AXElement *)self uiElement];
  uint64_t v6 = [v5 objectWithAXAttribute:96001 parameter:v4];

  AXUIElementSetMessagingTimeout([(AXElement *)self elementRef], 0.0);
  return v6;
}

- (id)_makeTinkerKitRequest:(id)a3
{
  id v4 = a3;
  AXUIElementSetMessagingTimeout([(AXElement *)self elementRef], 20.0);
  id v5 = [(AXElement *)self uiElement];
  uint64_t v6 = [v5 objectWithAXAttribute:96002 parameter:v4];

  AXUIElementSetMessagingTimeout([(AXElement *)self elementRef], 0.0);
  return v6;
}

+ (void)registerNotifications:(os_log_t)log withIdentifier:withHandler:.cold.1(os_log_t log)
{
  *(_WORD *)char v1 = 0;
  _os_log_error_impl(&dword_1BA657000, log, OS_LOG_TYPE_ERROR, "Failed to get the observer run loop source", v1, 2u);
}

+ (void)registerNotifications:(int)a1 withIdentifier:(NSObject *)a2 withHandler:.cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1BA657000, a2, OS_LOG_TYPE_ERROR, "Error adding notification: %d", (uint8_t *)v2, 8u);
}

+ (void)registerNotifications:(int)a1 withIdentifier:(NSObject *)a2 withHandler:.cold.3(int a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BA657000, a2, OS_LOG_TYPE_ERROR, "Failed to create an accessibility event observer: %ld", (uint8_t *)&v2, 0xCu);
}

+ (void)registerNotifications:(os_log_t)log withIdentifier:withHandler:.cold.4(os_log_t log)
{
  *(_WORD *)char v1 = 0;
  _os_log_fault_impl(&dword_1BA657000, log, OS_LOG_TYPE_FAULT, "Must register for accessibility notifications on the main thread.", v1, 2u);
}

@end