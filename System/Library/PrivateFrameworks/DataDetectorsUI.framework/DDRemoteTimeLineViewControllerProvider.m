@interface DDRemoteTimeLineViewControllerProvider
- (BOOL)dayViewControllerShouldAllowLongPress:(id)a3;
- (BOOL)dayViewControllerShouldRespondToApplicationDidBecomeActiveStateChange:(id)a3;
- (BOOL)dayViewControllerShouldShowDetachDialogOnGestureDraggingEnd:(id)a3;
- (BOOL)dayviewControllerShouldAllowSwipeToChangeDays:(id)a3;
- (BOOL)delegateWantsToHandleDayViewController:(id)a3 gestureCommittingOccurrence:(id)a4;
- (EKEvent)event;
- (EKEventStore)store;
- (NSArray)events;
- (id)dayViewController:(id)a3 createEventAtDate:(id)a4 allDay:(BOOL)a5;
- (id)dayViewController:(id)a3 eventsForStartDate:(id)a4 endDate:(id)a5;
- (id)selectedEventsForEditMenu;
- (void)createViewControllerWithCompletionHandler:(id)a3;
- (void)dayViewControllerDidReloadData:(id)a3;
- (void)setEvent:(id)a3;
- (void)setEvents:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation DDRemoteTimeLineViewControllerProvider

- (void)createViewControllerWithCompletionHandler:(id)a3
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  v86 = (void (**)(id, DDEKDayViewController *))a3;
  double Helper_x8__OBJC_CLASS___APApplication = gotLoadHelper_x8__OBJC_CLASS___APApplication(v5);
  v87 = objc_msgSend(*(id *)(v7 + 2016), "applicationWithBundleIdentifier:", @"com.apple.mobilecal", Helper_x8__OBJC_CLASS___APApplication);
  if ([v87 isEffectivelyLocked])
  {
    id v93 = 0;
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.mobilecal" allowPlaceholder:1 error:&v93];
    id v9 = v93;
    if (v9)
    {
      v84 = [MEMORY[0x1E4F28B00] currentHandler];
      [v84 handleFailureInMethod:a2, self, @"DDRemoteTimeLineViewControllerProvider.m", 112, @"couldn't get calendar app properties LS db %@", v9 object file lineNumber description];
    }
    v10 = [v8 localizedName];
    gotLoadHelper_x8__OBJC_CLASS___ISIcon(v11);
    v13 = (void *)[objc_alloc(*(Class *)(v12 + 584)) initWithBundleIdentifier:@"com.apple.mobilecal"];
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    v14 = [MEMORY[0x1E4F42D90] screens];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v89 objects:v99 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v90;
      double v18 = 1.0;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v90 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v89 + 1) + 8 * i) scale];
          if (v18 < v20) {
            double v18 = v20;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v89 objects:v99 count:16];
      }
      while (v16);
    }
    else
    {
      double v18 = 1.0;
    }

    gotLoadHelper_x8__OBJC_CLASS___ISImageDescriptor(v21);
    v23 = objc_msgSend(objc_alloc(*(Class *)(v22 + 600)), "initWithSize:scale:", 64.0, 64.0, v18);
    [v23 setDrawBorder:1];
    v24 = [v13 prepareImageForDescriptor:v23];
    v25 = (void *)MEMORY[0x1E4F42A80];
    uint64_t v26 = [v24 CGImage];
    [v24 scale];
    v27 = objc_msgSend(v25, "imageWithCGImage:scale:orientation:", v26, 0);
    gotLoadHelper_x8__OBJC_CLASS___APBaseExtensionShieldView(v28);
    v30 = (void *)[objc_alloc(*(Class *)(v29 + 2064)) initWithLocalizedApplicationName:v10 iconImage:v27 unlockButtonHidden:1];
    [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
    v31 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [v30 setBackgroundColor:v31];

    shieldView = self->_shieldView;
    self->_shieldView = (APBaseExtensionShieldView *)v30;
  }
  v33 = [[DDEKDayViewController alloc] initWithTargetSizeClass:0];
  [(EKDayViewController *)v33 setDelegate:self];
  [(EKDayViewController *)v33 setDataSource:self];
  [(EKDayViewController *)v33 setShowsBanner:0];
  [(EKDayViewController *)v33 setAllowsSelection:0];
  [(EKDayViewController *)v33 setAllowsDaySwitching:0];
  id v34 = objc_alloc_init(MEMORY[0x1E4F25550]);
  [(DDRemoteTimeLineViewControllerProvider *)self setStore:v34];

  v35 = [(DDRemoteActionViewControllerProvider *)self actionContext];
  v36 = [v35 context];

  if (v36)
  {
    v37 = [(DDRemoteActionViewControllerProvider *)self actionContext];
    v38 = [v37 context];
    v39 = [v38 objectForKeyedSubscript:@"AllResults"];

    if (v39)
    {
      v40 = 0;
      goto LABEL_22;
    }
    v43 = [(DDRemoteActionViewControllerProvider *)self actionContext];
    v44 = [v43 context];
    v40 = (void *)[v44 mutableCopy];

    v41 = [(DDRemoteActionViewControllerProvider *)self actionContext];
    uint64_t v95 = [v41 result];
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
    [v40 setObject:v42 forKeyedSubscript:@"AllResults"];
  }
  else
  {
    v97 = @"AllResults";
    v41 = [(DDRemoteActionViewControllerProvider *)self actionContext];
    uint64_t v96 = [v41 result];
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v96 count:1];
    v98 = v42;
    v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
  }

LABEL_22:
  v45 = [(DDRemoteTimeLineViewControllerProvider *)self store];
  v46 = [(DDRemoteActionViewControllerProvider *)self actionContext];
  v47 = [v46 associatedResults];
  v48 = DDUIEventForResults(v45, v47, v40);

  v49 = [(DDRemoteTimeLineViewControllerProvider *)self store];
  v50 = [(DDRemoteActionViewControllerProvider *)self actionContext];
  v51 = [v50 associatedResults];
  v52 = [(DDRemoteActionViewControllerProvider *)self actionContext];
  v53 = [v52 hostApplicationIdentifier];
  uint64_t v54 = DDUISuggestedEventForResults(v49, v51, v40, v53, 0, 0);

  v55 = (void *)v54;
  v56 = v87;
  if (!v55) {
    goto LABEL_32;
  }
  v57 = [v55 title];
  uint64_t v58 = [v57 length];

  if (v58)
  {
    v59 = [v55 title];
    [v48 setTitle:v59];
  }
  v60 = [v55 startDate];

  if (v60)
  {
    [v48 setAllDay:0];
    v61 = [v55 startDate];
    [v48 setStartDate:v61];

    v62 = [v55 endDate];
    [v48 setEndDate:v62];
  }
  v63 = [v55 startDate];
  if (!v63)
  {
    [v55 duration];
    if (v64 > 0.0)
    {
      if ([v48 isAllDay]) {
        goto LABEL_32;
      }
      v63 = [v48 startDate];
      [v55 duration];
      v65 = objc_msgSend(v63, "dateByAddingTimeInterval:");
      [v48 setEndDate:v65];
    }
  }

LABEL_32:
  v85 = v55;
  v66 = [(DDRemoteTimeLineViewControllerProvider *)self store];
  v67 = [v66 defaultCalendarForNewEvents];
  [v48 setCalendar:v67];

  id v68 = objc_alloc_init(MEMORY[0x1E4F254A0]);
  [v68 setParticipantStatus:4];
  id v94 = v68;
  v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
  [v48 setAttendees:v69];

  [v48 setStatus:2];
  [(DDRemoteTimeLineViewControllerProvider *)self setEvent:v48];
  [(DDEKDayViewController *)v33 setDd_event:v48];
  v70 = [v48 startDate];

  if (v70) {
    [v48 startDate];
  }
  else {
  v71 = [MEMORY[0x1E4F1C9C8] date];
  }
  v72 = [(EKDayViewController *)v33 calendar];
  v73 = [v72 components:62 fromDate:v71];

  [(EKDayViewController *)v33 setDisplayDate:v73];
  if (self->_shieldView)
  {
    v74 = [(DDEKDayViewController *)v33 view];
    [v74 addSubview:self->_shieldView];
    v75 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_shieldView attribute:9 relatedBy:0 toItem:v74 attribute:9 multiplier:1.0 constant:0.0];
    [v74 addConstraint:v75];

    v76 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_shieldView attribute:10 relatedBy:0 toItem:v74 attribute:10 multiplier:1.0 constant:0.0];
    [v74 addConstraint:v76];

    v77 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_shieldView attribute:7 relatedBy:0 toItem:v74 attribute:7 multiplier:1.0 constant:0.0];
    [v74 addConstraint:v77];

    v56 = v87;
    v78 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_shieldView attribute:8 relatedBy:0 toItem:v74 attribute:8 multiplier:1.0 constant:0.0];
    [v74 addConstraint:v78];

    gotLoadHelper_x8__OBJC_CLASS___APGuard(v79);
    v81 = *(void **)(v80 + 2024);
    v82 = self;
    v83 = [v81 sharedGuard];
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __84__DDRemoteTimeLineViewControllerProvider_createViewControllerWithCompletionHandler___block_invoke;
    v88[3] = &unk_1E5A85558;
    v88[4] = v82;
    [v83 authenticateForSubject:v87 completion:v88];
  }
  v86[2](v86, v33);
}

void __84__DDRemoteTimeLineViewControllerProvider_createViewControllerWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    BOOL v3 = a2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__DDRemoteTimeLineViewControllerProvider_createViewControllerWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5A853B0;
    block[4] = v2;
    id v4 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __84__DDRemoteTimeLineViewControllerProvider_createViewControllerWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

- (id)dayViewController:(id)a3 eventsForStartDate:(id)a4 endDate:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  [(DDRemoteTimeLineViewControllerProvider *)self setEvents:0];
  id v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v10 = [(DDRemoteTimeLineViewControllerProvider *)self store];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __87__DDRemoteTimeLineViewControllerProvider_dayViewController_eventsForStartDate_endDate___block_invoke;
  v38[3] = &unk_1E5A855C8;
  v38[4] = self;
  id v33 = v7;
  id v39 = v33;
  id v11 = v8;
  id v40 = v11;
  uint64_t v12 = v9;
  v41 = v12;
  [v10 requestFullAccessToEventsWithCompletion:v38];

  dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  v13 = [MEMORY[0x1E4F1CA48] array];
  v14 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v15 = [(DDRemoteTimeLineViewControllerProvider *)self events];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        double v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([v20 isAllDay]) {
          double v21 = v13;
        }
        else {
          double v21 = v14;
        }
        [v21 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v17);
  }

  uint64_t v22 = [(DDRemoteTimeLineViewControllerProvider *)self event];
  v24 = v22;
  if (v22)
  {
    if ([v22 isAllDay]) {
      v25 = v13;
    }
    else {
      v25 = v14;
    }
    [v25 addObject:v24];
    uint64_t v26 = [(DDRemoteTimeLineViewControllerProvider *)self events];
    v27 = [v26 arrayByAddingObject:v24];
    [(DDRemoteTimeLineViewControllerProvider *)self setEvents:v27];
  }
  gotLoadHelper_x8__OBJC_CLASS___CUIKOccurrencesCollection(v23);
  id v29 = objc_alloc(*(Class *)(v28 + 3040));
  v30 = [(DDRemoteTimeLineViewControllerProvider *)self events];
  v31 = (void *)[v29 initWithOccurrences:v30 timedOccurrences:v14 allDayOccurrences:v13];

  return v31;
}

void __87__DDRemoteTimeLineViewControllerProvider_dayViewController_eventsForStartDate_endDate___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    BOOL v3 = dispatch_get_global_queue(21, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __87__DDRemoteTimeLineViewControllerProvider_dayViewController_eventsForStartDate_endDate___block_invoke_2;
    v6[3] = &unk_1E5A855A0;
    id v4 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = v4;
    id v8 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    dispatch_async(v3, v6);
  }
  else
  {
    double v5 = *(NSObject **)(a1 + 56);
    dispatch_group_leave(v5);
  }
}

void __87__DDRemoteTimeLineViewControllerProvider_dayViewController_eventsForStartDate_endDate___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) store];
  BOOL v3 = [v2 calendarsForEntityType:0];

  id v4 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_0];
  id v9 = [v3 objectsAtIndexes:v4];

  double v5 = [*(id *)(a1 + 32) store];
  v6 = [v5 predicateForEventsWithStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) calendars:v9];

  id v7 = [*(id *)(a1 + 32) store];
  id v8 = [v7 eventsMatchingPredicate:v6];
  [*(id *)(a1 + 32) setEvents:v8];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __87__DDRemoteTimeLineViewControllerProvider_dayViewController_eventsForStartDate_endDate___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isHidden] ^ 1;
}

- (BOOL)dayViewControllerShouldRespondToApplicationDidBecomeActiveStateChange:(id)a3
{
  return 1;
}

- (id)dayViewController:(id)a3 createEventAtDate:(id)a4 allDay:(BOOL)a5
{
  return 0;
}

- (BOOL)dayViewControllerShouldAllowLongPress:(id)a3
{
  return 0;
}

- (void)dayViewControllerDidReloadData:(id)a3
{
  id v4 = a3;
  id v5 = [(DDRemoteTimeLineViewControllerProvider *)self event];
  [v4 scrollEventIntoView:v5 animated:0];
}

- (BOOL)delegateWantsToHandleDayViewController:(id)a3 gestureCommittingOccurrence:(id)a4
{
  return 0;
}

- (BOOL)dayviewControllerShouldAllowSwipeToChangeDays:(id)a3
{
  return 1;
}

- (BOOL)dayViewControllerShouldShowDetachDialogOnGestureDraggingEnd:(id)a3
{
  return 0;
}

- (id)selectedEventsForEditMenu
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (NSArray)events
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEvents:(id)a3
{
}

- (EKEvent)event
{
  return (EKEvent *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEvent:(id)a3
{
}

- (EKEventStore)store
{
  return (EKEventStore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_shieldView, 0);
}

@end