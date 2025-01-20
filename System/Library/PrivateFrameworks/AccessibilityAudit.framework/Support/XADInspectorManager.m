@interface XADInspectorManager
+ (id)sharedManager;
- (AXAuditElement)_mostRecentElementFetchedVisionOS;
- (AXElement)_currentElement;
- (AXElement)appMatchingTargetPid;
- (AXUpdateElementVisualsCoalescer)_elementVisualsCoalescer;
- (BOOL)_elementTokenIsSumulatorToken:(id)a3;
- (BOOL)_initializeAXObserverIfNeeded;
- (BOOL)_registeredForNotifications;
- (BOOL)allowDeveloperActionsOnElement:(id)a3;
- (BOOL)showVisuals;
- (CGPoint)_lastPoint;
- (NSDate)lastFetchDateForDeviceCoodinate;
- (NSMutableArray)_focusedElementHistory;
- (OS_dispatch_queue)dispatchQueue;
- (XADInspectorManager)init;
- (XADInspectorManagerDelegate)delegate;
- (__AXObserver)_axEventObserver;
- (id)_AXAuditElementFromAXElement:(id)a3;
- (id)_accessibilityNotificationsToObserve;
- (id)_actionSection;
- (id)_auditInspectorFocuseObject;
- (id)_basicSection;
- (id)_developerOnlyAttributes;
- (id)_elementDataFromSimulatorToken:(id)a3;
- (id)_elementSection;
- (id)_generateSpokenDescriptionForElement:(id)a3;
- (id)_hierarchySection;
- (id)_humanReadableStringForAction:(int)a3;
- (id)_inspectorSections;
- (id)_internalAttributes;
- (id)_nextElementNavigationInDirection:(int64_t)a3 forElement:(id)a4;
- (id)addAttribute:(id)a3 toSection:(id)a4 withPrefix:(id)a5 performsAction:(BOOL)a6 settable:(BOOL)a7 humanReadable:(id)a8 valueType:(int64_t)a9 overrideIsInternalWithValue:(id)a10;
- (id)fetchElementAtNormalizedDeviceCoordinate:(CGPoint)a3;
- (id)fetchSpecialElement:(int64_t)a3;
- (id)firstElementInHierarchy:(id)a3;
- (id)frontmostAppForTargetPid;
- (id)lastElementInHierarchy:(id)a3;
- (int)targetPid;
- (unint64_t)monitoredEventType;
- (void)_addElementToHistory:(id)a3;
- (void)_informDelegateOfInspectorFocus;
- (void)_initializeElementVisualsCoalescer;
- (void)_registerForAXNotifications:(BOOL)a3;
- (void)_registerForNotificationsIfNecessary:(BOOL)a3;
- (void)_setCurrentElement:(id)a3;
- (void)_updateElementHighlight;
- (void)connectionInterrupted;
- (void)deviceDidGetTargeted;
- (void)element:(id)a3 performAction:(id)a4 withValue:(id)a5 completion:(id)a6;
- (void)element:(id)a3 valueForAttribute:(id)a4 completion:(id)a5;
- (void)element:(id)a3 valueForParameterizedAttribute:(id)a4 withObject:(id)a5 completion:(id)a6;
- (void)focusOnAXElement:(id)a3;
- (void)focusOnAXElement:(id)a3 scrollToVisible:(BOOL)a4;
- (void)focusOnElement:(id)a3;
- (void)focusOnElementAtPoint:(CGPoint)a3;
- (void)hideVisualsSynchronously;
- (void)lockOnCurrentElement;
- (void)moveInDirection:(unint64_t)a3 allowMovingToContainers:(BOOL)a4 allowMoveToNonAXElements:(BOOL)a5;
- (void)previewOnElement:(id)a3;
- (void)setAppMatchingTargetPid:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setLastFetchDateForDeviceCoodinate:(id)a3;
- (void)setMonitoredEventType:(unint64_t)a3;
- (void)setShowVisuals:(BOOL)a3;
- (void)setTargetPid:(int)a3;
- (void)set_axEventObserver:(__AXObserver *)a3;
- (void)set_elementVisualsCoalescer:(id)a3;
- (void)set_focusedElementHistory:(id)a3;
- (void)set_lastPoint:(CGPoint)a3;
- (void)set_mostRecentElementFetchedVisionOS:(id)a3;
- (void)set_registeredForNotifications:(BOOL)a3;
- (void)updateAttributesIfElementIsValid;
@end

@implementation XADInspectorManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000057C4;
  block[3] = &unk_100018870;
  block[4] = a1;
  if (qword_10001E2C0 != -1) {
    dispatch_once(&qword_10001E2C0, block);
  }
  v2 = (void *)qword_10001E2B8;

  return v2;
}

- (XADInspectorManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)XADInspectorManager;
  v2 = [(XADInspectorManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create(off_10001E0B8, 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    [(XADInspectorManager *)v2 _initializeElementVisualsCoalescer];
  }
  return v2;
}

- (void)lockOnCurrentElement
{
}

- (void)setMonitoredEventType:(unint64_t)a3
{
  id v12 = +[XADDisplayManager sharedManager];
  self->_monitoredEventType = a3;
  if (a3 == 2)
  {
    v10 = +[XADEventManager sharedManager];
    uint64_t v6 = 1;
    [v10 setSnarfingEvents:1];

    v7 = +[XADEventManager sharedManager];
    v8 = v7;
    uint64_t v9 = 1;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v5 = +[XADEventManager sharedManager];
    uint64_t v6 = 1;
    [v5 setSnarfingEvents:1];

    v7 = +[XADEventManager sharedManager];
    v8 = v7;
    uint64_t v9 = 0;
LABEL_5:
    [v7 setStopSnarfingOnTouchUp:v9];
    goto LABEL_7;
  }
  v8 = +[XADEventManager sharedManager];
  [v8 setSnarfingEvents:0];
  uint64_t v6 = 3;
LABEL_7:

  [v12 setCursorStyle:v6];
  v11 = [(XADInspectorManager *)self delegate];
  [v11 inspectorManager:self inspectorMonitoredEventTypeChanged:a3];
}

- (void)hideVisualsSynchronously
{
  id v2 = +[XADDisplayManager sharedManager];
  [v2 hideVisualsSynchronously];
}

- (void)connectionInterrupted
{
  [(XADInspectorManager *)self _registerForNotificationsIfNecessary:0];

  [(XADInspectorManager *)self hideVisualsSynchronously];
}

- (void)setShowVisuals:(BOOL)a3
{
  self->_showVisuals = a3;
  v5 = [(XADInspectorManager *)self dispatchQueue];
  uint64_t v6 = v5;
  if (a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005B50;
    block[3] = &unk_100018898;
    block[4] = self;
    dispatch_async(v5, block);
  }
  else
  {
    dispatch_async(v5, &stru_100018950);
  }
}

- (id)_developerOnlyAttributes
{
  return &off_100019A90;
}

- (id)addAttribute:(id)a3 toSection:(id)a4 withPrefix:(id)a5 performsAction:(BOOL)a6 settable:(BOOL)a7 humanReadable:(id)a8 valueType:(int64_t)a9 overrideIsInternalWithValue:(id)a10
{
  BOOL v11 = a7;
  BOOL v12 = a6;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  if (a10)
  {
    uint64_t v20 = (uint64_t)[a10 BOOLValue];
    goto LABEL_8;
  }
  v21 = [(XADInspectorManager *)self _internalAttributes];
  if ([v21 containsObject:v16])
  {
  }
  else
  {
    char v22 = AXAuditAttributeWithPrefixLocStringExists();

    if (v22)
    {
      uint64_t v20 = 0;
      goto LABEL_8;
    }
  }
  id v23 = v16;

  uint64_t v20 = 1;
  id v19 = v23;
LABEL_8:
  v24 = [v17 addAttribute:v16 performsAction:v12 humanReadable:v19 settable:v11 valueType:a9 isInternal:v20];

  return v24;
}

- (id)_internalAttributes
{
  if (qword_10001E2C8 != -1) {
    dispatch_once(&qword_10001E2C8, &stru_100018970);
  }
  id v2 = (void *)qword_10001E2D0;

  return v2;
}

- (id)_elementSection
{
  dispatch_queue_t v3 = objc_opt_new();
  v4 = AXAuditLocString();
  [v3 setTitle:v4];

  [v3 setIdentifier:@"iOS_Element_v1"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [&off_100019AA8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(&off_100019AA8);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = +[NSString stringWithFormat:@"%@-%@", @"Attribute", v9];
        BOOL v11 = AXAuditLocString();
        id v12 = [(XADInspectorManager *)self addAttribute:v9 toSection:v3 withPrefix:@"Attribute" performsAction:0 settable:0 humanReadable:v11 valueType:256 overrideIsInternalWithValue:0];
      }
      id v6 = [&off_100019AA8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_basicSection
{
  dispatch_queue_t v3 = objc_opt_new();
  v4 = AXAuditLocString();
  [v3 setTitle:v4];

  [v3 setIdentifier:@"iOS_Basic_v1"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [&off_100019AC0 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(&off_100019AC0);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = +[NSString stringWithFormat:@"%@-%@", @"Attribute", v9];
        BOOL v11 = AXAuditLocString();
        id v12 = [(XADInspectorManager *)self addAttribute:v9 toSection:v3 withPrefix:@"Attribute" performsAction:0 settable:0 humanReadable:v11 valueType:2 overrideIsInternalWithValue:0];
        if ([v9 isEqual:@"TraitsHumanReadable"]) {
          [v12 setDisplayInline:1];
        }
      }
      id v6 = [&off_100019AC0 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_hierarchySection
{
  dispatch_queue_t v3 = objc_opt_new();
  v4 = AXAuditLocString();
  [v3 setTitle:v4];

  [v3 setIdentifier:@"iOS_Hierarchy_v1"];
  uint64_t v5 = _AXHierarchyElementsAttribute;
  id v6 = [v3 title];
  uint64_t v7 = [(XADInspectorManager *)self addAttribute:v5 toSection:v3 withPrefix:@"Attribute" performsAction:0 settable:0 humanReadable:v6 valueType:2 overrideIsInternalWithValue:0];

  [v7 setDisplayAsTree:1];

  return v3;
}

- (id)_humanReadableStringForAction:(int)a3
{
  if ((a3 - 2004) > 0x10) {
    dispatch_queue_t v3 = 0;
  }
  else {
    dispatch_queue_t v3 = off_1000189E0[a3 - 2004];
  }
  return (id)_AXAuditAttributeWithPrefixLocString(v3, @"Action");
}

- (id)_actionSection
{
  dispatch_queue_t v3 = objc_opt_new();
  v4 = AXAuditLocString();
  [v3 setTitle:v4];

  [v3 setIdentifier:@"iOS_Actions_v1"];
  uint64_t v5 = [(XADInspectorManager *)self _currentElement];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100006640;
  v29[3] = &unk_100018998;
  id v23 = self;
  v29[4] = self;
  id v24 = v3;
  id v30 = v24;
  id v6 = objc_retainBlock(v29);
  uint64_t v7 = (void (**)(void, uint64_t))v6;
  if (v5) {
    ((void (*)(void *, uint64_t))v6[2])(v6, 2010);
  }
  if (([v5 supportsAction:2004] & 1) != 0
    || ([v5 supportsAction:2005] & 1) != 0
    || (unint64_t v8 = (unint64_t)[v5 traits], (kAXAdjustableTrait & ~v8) == 0))
  {
    v7[2](v7, 2004);
    v7[2](v7, 2005);
  }
  if (([v5 supportsAction:2007] & 1) != 0
    || [v5 supportsAction:2006])
  {
    v7[2](v7, 2007);
    v7[2](v7, 2006);
  }
  if (([v5 supportsAction:2009] & 1) != 0
    || [v5 supportsAction:2008])
  {
    v7[2](v7, 2009);
    v7[2](v7, 2008);
  }
  if (([v5 supportsAction:2019] & 1) != 0
    || [v5 supportsAction:2020])
  {
    v7[2](v7, 2019);
    v7[2](v7, 2020);
  }
  v21 = v7;
  char v22 = v5;
  uint64_t v9 = [v5 customActions];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v15 = [v14 objectForKeyedSubscript:@"CustomActionShortName"];
        if (!v15)
        {
          long long v15 = [v14 objectForKeyedSubscript:@"CustomActionName"];
        }
        long long v16 = [v14 objectForKeyedSubscript:@"CustomActionIdentifier"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v17 = +[NSString stringWithFormat:@"%@%@", @"AXCustomAction-", v16];
          id v18 = [(XADInspectorManager *)v23 addAttribute:v17 toSection:v24 withPrefix:@"Action" performsAction:1 settable:0 humanReadable:v15 valueType:1 overrideIsInternalWithValue:&__kCFBooleanFalse];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v11);
  }
  id v19 = v24;

  return v19;
}

- (id)_inspectorSections
{
  dispatch_queue_t v3 = [(XADInspectorManager *)self _basicSection];
  v4 = [(XADInspectorManager *)self _actionSection];
  uint64_t v5 = [(XADInspectorManager *)self _elementSection];
  id v6 = [(XADInspectorManager *)self _hierarchySection];
  v9[0] = v3;
  v9[1] = v4;
  v9[2] = v5;
  v9[3] = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:v9 count:4];

  return v7;
}

- (id)_AXAuditElementFromAXElement:(id)a3
{
  id v3 = a3;
  v4 = [v3 uiElement];
  uint64_t v5 = [v4 objectWithAXAttribute:5019];

  id v6 = +[AXAuditElement auditElementWithElement:v3 identifier:v5];

  return v6;
}

- (id)_auditInspectorFocuseObject
{
  id v3 = [(XADInspectorManager *)self _currentElement];
  v4 = objc_opt_new();
  uint64_t v5 = [(XADInspectorManager *)self _AXAuditElementFromAXElement:v3];
  [v4 setElement:v5];
  id v6 = [(XADInspectorManager *)self _generateSpokenDescriptionForElement:v3];
  [v4 setCaptionText:v6];
  [v4 setSpokenDescription:v6];
  uint64_t v7 = [(XADInspectorManager *)self _inspectorSections];
  [v4 setInspectorSections:v7];

  return v4;
}

- (id)_generateSpokenDescriptionForElement:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  uint64_t v5 = [v3 label];
  id v6 = [v5 length];

  if (v6)
  {
    uint64_t v7 = [v3 label];
    [v4 addObject:v7];
  }
  unint64_t v8 = [v3 value];
  id v9 = [v8 length];

  if (v9)
  {
    id v10 = [v3 value];
    [v4 addObject:v10];
  }
  id v11 = sub_100009560((const __AXUIElement *)[v3 elementRef], (const __CFString *)0x836);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([v16 isEqualToString:@"Static Text"] & 1) == 0)
        {
          [v4 addObject:v16];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }
  long long v17 = [v3 hint];
  id v18 = [v17 length];

  if (v18)
  {
    id v19 = [v3 hint];
    [v4 addObject:v19];
  }
  uint64_t v20 = [v4 componentsJoinedByString:@", "];

  return v20;
}

- (void)_informDelegateOfInspectorFocus
{
  id v4 = [(XADInspectorManager *)self delegate];
  id v3 = [(XADInspectorManager *)self _auditInspectorFocuseObject];
  [v4 inspectorManager:self inspectorFocusDidChange:v3];
}

- (void)_initializeElementVisualsCoalescer
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init((Class)AXUpdateElementVisualsCoalescer);
  [(XADInspectorManager *)self set_elementVisualsCoalescer:v3];
  [v3 setThreshold:0.2];
  [v3 setProgressInterval:0.01];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006E3C;
  v9[3] = &unk_1000189C0;
  objc_copyWeak(&v10, &location);
  [v3 setUpdateVisualsSequenceDidBeginHandler:v9];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006E7C;
  v7[3] = &unk_1000189C0;
  objc_copyWeak(&v8, &location);
  [v3 setUpdateVisualsSequenceInProgressHandler:v7];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006EBC;
  v5[3] = &unk_1000189C0;
  objc_copyWeak(&v6, &location);
  [v3 setUpdateVisualsSequenceDidFinishHandler:v5];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006EFC;
  block[3] = &unk_100018898;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

- (void)_updateElementHighlight
{
  id v4 = +[XADDisplayManager sharedManager];
  [v4 setCursorStyle:1];
  id v3 = [(XADInspectorManager *)self _currentElement];
  [v4 setCursorFrameForElement:v3];
}

- (void)_addElementToHistory:(id)a3
{
  id v6 = a3;
  id v4 = [(XADInspectorManager *)self _focusedElementHistory];
  if (!v4)
  {
    uint64_t v5 = objc_opt_new();
    [(XADInspectorManager *)self set_focusedElementHistory:v5];

    id v4 = [(XADInspectorManager *)self _focusedElementHistory];
  }
  if ([v4 containsObject:v6]) {
    [v4 removeObject:v6];
  }
  if (v6) {
    [v4 addObject:v6];
  }
  if ((unint64_t)[v4 count] >= 0x15)
  {
    do
      [v4 removeObjectAtIndex:0];
    while ((unint64_t)[v4 count] > 0x14);
  }
}

- (void)_setCurrentElement:(id)a3
{
  id v4 = (AXElement *)a3;
  sub_1000070EC(self->__currentElement, 0);
  [(XADInspectorManager *)self _addElementToHistory:v4];
  currentElement = self->__currentElement;
  self->__currentElement = v4;
  id v6 = v4;

  sub_1000070EC(self->__currentElement, 1);
}

- (BOOL)_elementTokenIsSumulatorToken:(id)a3
{
  id v3 = [a3 objectForKey:@"TokenType"];
  unsigned __int8 v4 = [v3 isEqualToString:@"AXElementTokenSimulator"];

  return v4;
}

- (id)_elementDataFromSimulatorToken:(id)a3
{
  id v3 = [a3 objectForKey:@"ElementData"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)focusOnAXElement:(id)a3 scrollToVisible:(BOOL)a4
{
  BOOL v4 = a4;
  [(XADInspectorManager *)self _setCurrentElement:a3];
  if (v4)
  {
    id v6 = [(XADInspectorManager *)self _currentElement];
    [v6 scrollToVisible];
  }
  [(XADInspectorManager *)self _updateElementHighlight];

  [(XADInspectorManager *)self _informDelegateOfInspectorFocus];
}

- (void)focusOnAXElement:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(XADInspectorManager *)self _currentElement];
  unsigned __int8 v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0) {
    [(XADInspectorManager *)self focusOnAXElement:v6 scrollToVisible:1];
  }
}

- (void)focusOnElementAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(XADInspectorManager *)self _lastPoint];
  if (x != v7 || y != v6)
  {
    +[AXUIElement uiElementAtCoordinate:](AXUIElement, "uiElementAtCoordinate:", x, y);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (![(XADInspectorManager *)self targetPid]) {
      goto LABEL_14;
    }
    id v9 = +[AXUIElement uiApplicationAtCoordinate:](AXUIElement, "uiApplicationAtCoordinate:", x, y);
    id v10 = [(XADInspectorManager *)self frontmostAppForTargetPid];
    id v11 = [v10 uiElement];

    LODWORD(v10) = [v9 isEqual:v11];
    if (v10)
    {
LABEL_14:
      id v12 = [(XADInspectorManager *)self _currentElement];
      id v13 = [v12 uiElement];
      unsigned __int8 v14 = [v16 isEqual:v13];

      if ((v14 & 1) == 0)
      {
        long long v15 = +[AXElement elementWithUIElement:v16];
        [(XADInspectorManager *)self focusOnAXElement:v15 scrollToVisible:0];
      }
    }
  }
}

- (void)focusOnElement:(id)a3
{
  unsigned __int8 v5 = [a3 axElement];
  [(XADInspectorManager *)self focusOnAXElement:v5];

  if (a3)
  {
    [(XADInspectorManager *)self _updateElementHighlight];
  }
}

- (void)previewOnElement:(id)a3
{
  id v6 = a3;
  BOOL v4 = +[XADDisplayManager sharedManager];
  if (v6)
  {
    [v4 setCursorStyle:4];
    unsigned __int8 v5 = [v6 axElement];
    [v4 setCursorFrameForElement:v5];
  }
  else
  {
    [(XADInspectorManager *)self _updateElementHighlight];
  }
}

- (BOOL)allowDeveloperActionsOnElement:(id)a3
{
  pid_t pid = 0;
  AXError v3 = AXUIElementGetPid((AXUIElementRef)[a3 elementRef], &pid);
  BOOL result = 0;
  if (v3 == kAXErrorSuccess) {
    return AuditDoesAllowDeveloperAttributes();
  }
  return result;
}

- (void)element:(id)a3 performAction:(id)a4 withValue:(id)a5 completion:(id)a6
{
  long long v15 = (void (**)(void))a6;
  id v9 = a4;
  id v10 = [a3 axElement];
  id v11 = [v9 attributeName];

  if (v10 && [(XADInspectorManager *)self allowDeveloperActionsOnElement:v10])
  {
    if (![v11 rangeOfString:@"AXAction-"])
    {
      id v12 = (char *)[v11 length];
      if (v12 == (char *)[@"AXAction-" length] + 4)
      {
        id v13 = [v11 substringFromIndex:objc_msgSend(@"AXAction-", "length")];
        if ([v13 integerValue] - 2000 <= 0x1F40) {
          objc_msgSend(v10, "performAction:");
        }
        goto LABEL_10;
      }
    }
    if (![v11 rangeOfString:@"AXCustomAction-"])
    {
      id v14 = [v11 length];
      if (v14 > [@"AXCustomAction-" length])
      {
        id v13 = [v11 substringFromIndex:objc_msgSend(@"AXCustomAction-", "length")];
        [v10 performAction:2021 withValue:v13];
LABEL_10:
      }
    }
  }
  v15[2]();
}

- (void)element:(id)a3 valueForAttribute:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  id v10 = [a3 axElement];
  id v11 = [(XADInspectorManager *)self _currentElement];
  unsigned __int8 v12 = [v10 isEqual:v11];

  if ((v12 & 1) != 0
    || ([(XADInspectorManager *)self _focusedElementHistory],
        id v13 = objc_claimAutoreleasedReturnValue(),
        unsigned int v14 = [v13 containsObject:v10],
        v13,
        !v14))
  {
    long long v15 = (const __AXUIElement *)[v10 elementRef];
    id v16 = [v8 attributeName];
    long long v17 = v16;
    if (!a3 || ![v16 length]) {
      goto LABEL_24;
    }
    pid_t pid = 0;
    BOOL v18 = 0;
    if (AXUIElementGetPid(v15, &pid) == kAXErrorSuccess && pid >= 1)
    {
      mach_port_name_t v34 = 0;
      BOOL v18 = task_for_pid(mach_task_self_, pid, &v34) == 0;
    }
    id v19 = [(XADInspectorManager *)self _developerOnlyAttributes];
    unsigned int v20 = [v19 containsObject:v17];

    if (v20 && !v18) {
      goto LABEL_11;
    }
    if ([v17 isEqualToString:@"Label"])
    {
      uint64_t v22 = [v10 label];
LABEL_14:
      v21 = (void *)v22;
      goto LABEL_15;
    }
    if ([v17 isEqualToString:@"Header"])
    {
      long long v25 = [v10 uiElement];
      v21 = [v25 objectWithAXAttribute:2026];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v21 count] == (id)1) {
        goto LABEL_29;
      }
LABEL_15:
      if (!v18)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v21 length] >= 0x41)
        {
          uint64_t v23 = [v21 substringToIndex:64];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (unint64_t)[v21 length] < 0x41) {
            goto LABEL_23;
          }
          uint64_t v23 = objc_msgSend(v21, "attributedSubstringFromRange:", 0, 64);
        }
        long long v24 = (void *)v23;

        v21 = v24;
      }
LABEL_23:
      v9[2](v9, v21);

LABEL_24:
      goto LABEL_25;
    }
    if ([v17 isEqualToString:@"Hint"])
    {
      uint64_t v22 = [v10 hint];
      goto LABEL_14;
    }
    if ([v17 isEqualToString:@"UserInputLabels"])
    {
      uint64_t v22 = [v10 userInputLabels];
      goto LABEL_14;
    }
    if ([v17 isEqualToString:@"Traits"])
    {
      uint64_t v22 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 traits]);
      goto LABEL_14;
    }
    if ([v17 isEqualToString:@"ElementClassName"])
    {
      long long v27 = v15;
      uint64_t v28 = 5045;
    }
    else if ([v17 isEqualToString:@"ElementMemoryAddress"])
    {
      long long v27 = v15;
      uint64_t v28 = 5046;
    }
    else
    {
      if (![v17 isEqualToString:@"ElementViewControllerClassName"])
      {
        if ([v17 isEqualToString:@"Identifier"])
        {
          v29 = [v10 uiElement];
          id v30 = [v29 objectWithAXAttribute:5019];
          goto LABEL_45;
        }
        if (![v17 isEqualToString:@"TraitsHumanReadable"])
        {
          if ([v17 isEqualToString:@"Value"])
          {
            uint64_t v22 = [v10 value];
            goto LABEL_14;
          }
          if ([v17 isEqualToString:_AXHumanReadableClassNameAttribute])
          {
            pid_t v32 = 0;
            AXError v31 = AXUIElementGetPid((AXUIElementRef)[v10 elementRef], &v32);
            uint64_t v22 = 0;
            if (v31 == kAXErrorSuccess && v32 >= 1)
            {
              mach_port_name_t v34 = 0;
              if (task_for_pid(mach_task_self_, v32, &v34))
              {
                uint64_t v22 = 0;
              }
              else
              {
                uint64_t v22 = sub_100009560(v15, (const __CFString *)0x13B5);
              }
            }
            goto LABEL_14;
          }
          if ([v17 isEqualToString:_AXHumanReadableDescriptionAttribute])
          {
            uint64_t v22 = sub_100007914(v10);
            goto LABEL_14;
          }
          if (![v17 isEqualToString:_AXHumanReadableRoleDescriptionAttribute])
          {
            if (![v17 isEqualToString:_AXHierarchyElementsAttribute])
            {
LABEL_11:
              v21 = 0;
              goto LABEL_15;
            }
            uint64_t v22 = sub_100007D28(v10, 1, 1);
            goto LABEL_14;
          }
          v21 = sub_100009560(v15, (const __CFString *)0x836);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v26 = 0;
            goto LABEL_30;
          }
LABEL_29:
          uint64_t v26 = [v21 firstObject];
LABEL_30:

          v21 = (void *)v26;
          goto LABEL_15;
        }
        v29 = sub_100009560(v15, (const __CFString *)0x836);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || ![v29 count])
        {
          id v30 = +[NSNull null];
          goto LABEL_45;
        }
LABEL_44:
        id v30 = v29;
LABEL_45:
        v21 = v30;
LABEL_47:

        goto LABEL_15;
      }
      long long v27 = v15;
      uint64_t v28 = 5042;
    }
    v29 = sub_100009560(v27, (const __CFString *)v28);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = 0;
      goto LABEL_47;
    }
    goto LABEL_44;
  }
  v9[2](v9, 0);
LABEL_25:
}

- (void)element:(id)a3 valueForParameterizedAttribute:(id)a4 withObject:(id)a5 completion:(id)a6
{
}

- (void)setTargetPid:(int)a3
{
  self->_targetPid = a3;
  [(XADInspectorManager *)self setAppMatchingTargetPid:0];
  if ([(XADInspectorManager *)self targetPid])
  {
    AXAuditCurrentApplications();
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          int v10 = AXAuditPidForElement();
          if ([(XADInspectorManager *)self targetPid] == v10)
          {
            [(XADInspectorManager *)self setAppMatchingTargetPid:v9];
            goto LABEL_12;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (id)frontmostAppForTargetPid
{
  AXError v3 = [(XADInspectorManager *)self appMatchingTargetPid];

  if (v3) {
    [(XADInspectorManager *)self appMatchingTargetPid];
  }
  else {
  id v4 = iOSFrontmostApp();
  }

  return v4;
}

- (id)fetchSpecialElement:(int64_t)a3
{
  if (a3 == 1)
  {
    id v4 = [(XADInspectorManager *)self frontmostAppForTargetPid];
    uint64_t v5 = [(XADInspectorManager *)self lastElementInHierarchy:v4];
    goto LABEL_5;
  }
  if (!a3)
  {
    id v4 = [(XADInspectorManager *)self frontmostAppForTargetPid];
    uint64_t v5 = [(XADInspectorManager *)self firstElementInHierarchy:v4];
LABEL_5:
    id v6 = (void *)v5;

    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:
  uint64_t v7 = [(XADInspectorManager *)self _AXAuditElementFromAXElement:v6];

  return v7;
}

- (id)fetchElementAtNormalizedDeviceCoordinate:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v6 = +[NSDate date];
  uint64_t v7 = [(XADInspectorManager *)self lastFetchDateForDeviceCoodinate];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  int v10 = [(XADInspectorManager *)self lastFetchDateForDeviceCoodinate];

  if (v10 && v9 < 0.1)
  {
    long long v11 = [(XADInspectorManager *)self _mostRecentElementFetchedVisionOS];
  }
  else
  {
    [(XADInspectorManager *)self setLastFetchDateForDeviceCoodinate:v6];
    long long v12 = +[AXElement systemWideElement];
    *(CGFloat *)long long v17 = x;
    *(CGFloat *)&v17[1] = y;
    long long v13 = +[NSValue valueWithBytes:v17 objCType:"{CGPoint=dd}"];
    long long v14 = [v12 elementForAttribute:91701 parameter:v13];

    long long v15 = [(XADInspectorManager *)self _AXAuditElementFromAXElement:v14];
    [(XADInspectorManager *)self set_mostRecentElementFetchedVisionOS:v15];

    long long v11 = [(XADInspectorManager *)self _mostRecentElementFetchedVisionOS];
  }

  return v11;
}

- (id)firstElementInHierarchy:(id)a3
{
  AXError v3 = [a3 elementForAttribute:3000];
  id v4 = [v3 uiElement];
  unsigned int v5 = [v4 BOOLWithAXAttribute:2046];

  if (v5)
  {
    uint64_t v6 = [v3 elementForAttribute:3000];

    AXError v3 = (void *)v6;
  }

  return v3;
}

- (id)lastElementInHierarchy:(id)a3
{
  AXError v3 = [a3 elementForAttribute:3016];
  id v4 = [v3 uiElement];
  unsigned int v5 = [v4 BOOLWithAXAttribute:2046];

  if (v5)
  {
    uint64_t v6 = [v3 elementForAttribute:3016];

    AXError v3 = (void *)v6;
  }

  return v3;
}

- (id)_nextElementNavigationInDirection:(int64_t)a3 forElement:(id)a4
{
  id v6 = a4;
  if (([v6 isAccessibilityOpaqueElementProvider] & 1) != 0
    || (sub_100008A38(v6, a3), (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (a3 == 1) {
      [v6 nextElementsWithCount:1];
    }
    else {
    double v8 = [v6 previousElementsWithCount:1];
    }
    if ([v8 count])
    {
      uint64_t v7 = [v8 firstObject];
      if ([v7 isAccessibilityOpaqueElementProvider])
      {
        double v9 = [v7 elementForAttribute:95226 parameter:@"AXAudit"];
        sub_1000070EC(v9, 0);

        sub_1000070EC(v7, 0);
        uint64_t v10 = sub_100008A38(v7, a3);

        uint64_t v7 = (void *)v10;
      }
      if (v7 && ![v7 isAccessibilityOpaqueElementProvider])
      {
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    long long v11 = v7;
    uint64_t v7 = sub_100008A38(v6, a3);

    if (!v7)
    {
      if (([v6 isAccessibilityOpaqueElementProvider] & 1) != 0
        || (sub_100008BC4(v6), (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0))
      {
      }
      else
      {
        long long v13 = (void *)v12;
        uint64_t v7 = [(XADInspectorManager *)self _nextElementNavigationInDirection:a3 forElement:v12];

        if (v7) {
          goto LABEL_24;
        }
      }
      double v8 = [(XADInspectorManager *)self frontmostAppForTargetPid];
      if (a3 == 1) {
        [(XADInspectorManager *)self firstElementInHierarchy:v8];
      }
      else {
      uint64_t v7 = [(XADInspectorManager *)self lastElementInHierarchy:v8];
      }
    }
    goto LABEL_23;
  }
LABEL_24:

  return v7;
}

- (void)moveInDirection:(unint64_t)a3 allowMovingToContainers:(BOOL)a4 allowMoveToNonAXElements:(BOOL)a5
{
  id v12 = [(XADInspectorManager *)self _currentElement];
  switch(a3)
  {
    case 3uLL:
      uint64_t v7 = self;
      uint64_t v8 = 2;
      goto LABEL_4;
    case 4uLL:
      uint64_t v7 = self;
      uint64_t v8 = 1;
LABEL_4:
      double v9 = [(XADInspectorManager *)v7 _nextElementNavigationInDirection:v8 forElement:v12];
      if (!v9) {
        break;
      }
      goto LABEL_9;
    case 5uLL:
      uint64_t v10 = [(XADInspectorManager *)self frontmostAppForTargetPid];
      uint64_t v11 = [(XADInspectorManager *)self firstElementInHierarchy:v10];
      goto LABEL_8;
    case 6uLL:
      uint64_t v10 = [(XADInspectorManager *)self frontmostAppForTargetPid];
      uint64_t v11 = [(XADInspectorManager *)self lastElementInHierarchy:v10];
LABEL_8:
      double v9 = (void *)v11;

      if (v9)
      {
LABEL_9:
        [(XADInspectorManager *)self focusOnAXElement:v9];
      }
      break;
    default:
      break;
  }
}

- (void)deviceDidGetTargeted
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000FC00();
  }
  [(XADInspectorManager *)self _registerForNotificationsIfNecessary:1];
  AXError v3 = +[AXAuditAssetManager shared];
  [v3 downloadAssetsIfNecessary];
}

- (id)_accessibilityNotificationsToObserve
{
  return &off_100019AD8;
}

- (void)_registerForNotificationsIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(XADInspectorManager *)self _registeredForNotifications] != a3)
  {
    [(XADInspectorManager *)self set_registeredForNotifications:v3];
    [(XADInspectorManager *)self _registerForAXNotifications:v3];
  }
}

- (void)_registerForAXNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    [(XADInspectorManager *)self _initializeAXObserverIfNeeded];
  }
  if ([(XADInspectorManager *)self _axEventObserver])
  {
    unsigned int v5 = (const __AXUIElement *)+[AXUIElement systemWideAXUIElement];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [(XADInspectorManager *)self _accessibilityNotificationsToObserve];
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          CFStringRef v11 = (const __CFString *)[*(id *)(*((void *)&v13 + 1) + 8 * i) intValue];
          id v12 = [(XADInspectorManager *)self _axEventObserver];
          if (v3) {
            AXObserverAddNotification(v12, v5, v11, self);
          }
          else {
            AXObserverRemoveNotification(v12, v5, v11);
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)_initializeAXObserverIfNeeded
{
  if ([(XADInspectorManager *)self _axEventObserver]) {
    goto LABEL_5;
  }
  pid_t pid = 0;
  AXUIElementGetPid((AXUIElementRef)+[AXUIElement systemWideAXUIElement], &pid);
  if (![(XADInspectorManager *)self _axEventObserver])
  {
    AXObserverRef v7 = 0;
    if (AXObserverCreate(pid, (AXObserverCallback)sub_100009224, &v7))
    {
      LOBYTE(RunLoopSource) = 0;
      return (char)RunLoopSource;
    }
    [(XADInspectorManager *)self set_axEventObserver:v7];
  }
  CFRunLoopSourceRef RunLoopSource = AXObserverGetRunLoopSource([(XADInspectorManager *)self _axEventObserver]);
  if (RunLoopSource)
  {
    id v4 = RunLoopSource;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v4, kCFRunLoopDefaultMode);
LABEL_5:
    LOBYTE(RunLoopSource) = 1;
  }
  return (char)RunLoopSource;
}

- (void)updateAttributesIfElementIsValid
{
  BOOL v3 = [(XADInspectorManager *)self _currentElement];
  unsigned int v4 = [v3 isValid];

  if (v4)
  {
    id v6 = [(XADInspectorManager *)self delegate];
    unsigned int v5 = [(XADInspectorManager *)self _auditInspectorFocuseObject];
    [v6 inspectorManager:self inspectorElementPropertiesChanged:v5];
  }
}

- (XADInspectorManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (XADInspectorManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unint64_t)monitoredEventType
{
  return self->_monitoredEventType;
}

- (BOOL)showVisuals
{
  return self->_showVisuals;
}

- (int)targetPid
{
  return self->_targetPid;
}

- (AXElement)appMatchingTargetPid
{
  return self->_appMatchingTargetPid;
}

- (void)setAppMatchingTargetPid:(id)a3
{
}

- (__AXObserver)_axEventObserver
{
  return self->__axEventObserver;
}

- (void)set_axEventObserver:(__AXObserver *)a3
{
  self->__axEventObserver = a3;
}

- (NSMutableArray)_focusedElementHistory
{
  return self->__focusedElementHistory;
}

- (void)set_focusedElementHistory:(id)a3
{
}

- (AXElement)_currentElement
{
  return self->__currentElement;
}

- (CGPoint)_lastPoint
{
  double x = self->__lastPoint.x;
  double y = self->__lastPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)set_lastPoint:(CGPoint)a3
{
  self->__lastPoint = a3;
}

- (AXUpdateElementVisualsCoalescer)_elementVisualsCoalescer
{
  return self->__elementVisualsCoalescer;
}

- (void)set_elementVisualsCoalescer:(id)a3
{
}

- (AXAuditElement)_mostRecentElementFetchedVisionOS
{
  return self->__mostRecentElementFetchedVisionOS;
}

- (void)set_mostRecentElementFetchedVisionOS:(id)a3
{
}

- (NSDate)lastFetchDateForDeviceCoodinate
{
  return self->_lastFetchDateForDeviceCoodinate;
}

- (void)setLastFetchDateForDeviceCoodinate:(id)a3
{
}

- (BOOL)_registeredForNotifications
{
  return self->__registeredForNotifications;
}

- (void)set_registeredForNotifications:(BOOL)a3
{
  self->__registeredForNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFetchDateForDeviceCoodinate, 0);
  objc_storeStrong((id *)&self->__mostRecentElementFetchedVisionOS, 0);
  objc_storeStrong((id *)&self->__elementVisualsCoalescer, 0);
  objc_storeStrong((id *)&self->__currentElement, 0);
  objc_storeStrong((id *)&self->__focusedElementHistory, 0);
  objc_storeStrong((id *)&self->_appMatchingTargetPid, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end