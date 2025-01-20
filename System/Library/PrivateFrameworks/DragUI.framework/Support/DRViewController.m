@interface DRViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)hasActiveDragSession;
- (CATransform3D)transformToLocalWindowForCoordinateSpaceTransformToDisplay:(SEL)a3;
- (CGRect)_defaultInitialViewFrame;
- (DRViewController)initWithDelegate:(id)a3 initialFrame:(CGRect)a4;
- (DRViewControllerDelegate)delegate;
- (NSDictionary)controllers;
- (NSMutableDictionary)portalViewByDisplayIdentifiers;
- (NSMutableSet)activeTouches;
- (NSMutableSet)pendingRemovalControllers;
- (UIView)contentView;
- (id)newSessionControllerForSession:(unsigned int)a3;
- (id)sessionViewModelForAddingTouch:(id)a3;
- (id)sessionViewModelForBeginningDragManipulationAtLocation:(CGPoint)a3;
- (id)viewModelForSessionID:(unsigned int)a3;
- (id)visibleDroppedItemsForSession:(unsigned int)a3 transform:(CATransform3D *)a4 targetScreen:(id)a5;
- (unsigned)sessionIDForViewModel:(id)a3;
- (void)addSession:(id)a3 withSourceClient:(id)a4 touchIDs:(id)a5 itemCount:(unint64_t)a6 centroid:(CAPoint3D)a7 sourceContextID:(unsigned int)a8 initialCentroidInSourceContext:(CAPoint3D)a9 preferredPreviewIndexes:(id)a10;
- (void)animateOutVisibleItemsForSession:(unsigned int)a3 withOperation:(unint64_t)a4;
- (void)configurePortalViewForDragSessionOriginatingFromViewController:(id)a3;
- (void)dealloc;
- (void)fenceForSession:(unsigned int)a3 withHandle:(id)a4;
- (void)loadView;
- (void)moveSessionWithID:(unsigned int)a3 toLocation:(CAPoint3D)a4;
- (void)observeInterfaceOrientationUpdates;
- (void)orientationObserver:(id)a3 orientationDidChange:(id)a4;
- (void)removeSession:(unsigned int)a3 immediately:(BOOL)a4;
- (void)removeTouches:(id)a3;
- (void)sessionController:(id)a3 didUpdatePresentation:(id)a4;
- (void)sessionController:(id)a3 requestImagesForClient:(id)a4 itemIndexes:(id)a5;
- (void)sessionController:(id)a3 setTouchOffset:(CGPoint)a4;
- (void)setActiveTouches:(id)a3;
- (void)setPendingRemovalControllers:(id)a3;
- (void)setPortalViewByDisplayIdentifiers:(id)a3;
- (void)teardownPortalViewForDragSessionOriginatingFromViewController:(id)a3;
- (void)updateWithTouches:(id)a3;
@end

@implementation DRViewController

- (DRViewController)initWithDelegate:(id)a3 initialFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  v10 = [(DRViewController *)self init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v9);
    uint64_t v12 = objc_opt_new();
    controllers = v11->_controllers;
    v11->_controllers = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    activeTouches = v11->_activeTouches;
    v11->_activeTouches = (NSMutableSet *)v14;

    uint64_t v16 = objc_opt_new();
    pendingRemovalControllers = v11->_pendingRemovalControllers;
    v11->_pendingRemovalControllers = (NSMutableSet *)v16;

    v11->_initialFrame.origin.CGFloat x = x;
    v11->_initialFrame.origin.CGFloat y = y;
    v11->_initialFrame.size.CGFloat width = width;
    v11->_initialFrame.size.CGFloat height = height;
    v11->_currentOrientation = 1;
  }

  return v11;
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)DRViewController;
  [(DRViewController *)&v7 loadView];
  v3 = (UIView *)objc_opt_new();
  v4 = [(DRViewController *)self view];
  [v4 frame];
  -[UIView setFrame:](v3, "setFrame:");

  [(UIView *)v3 setAutoresizingMask:18];
  [(UIView *)v3 setMultipleTouchEnabled:1];
  v5 = [(DRViewController *)self view];
  [v5 addSubview:v3];

  contentView = self->_contentView;
  self->_contentView = v3;
}

- (CGRect)_defaultInitialViewFrame
{
  double x = self->_initialFrame.origin.x;
  double y = self->_initialFrame.origin.y;
  double width = self->_initialFrame.size.width;
  double height = self->_initialFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)hasActiveDragSession
{
  v2 = [(DRViewController *)self controllers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)addSession:(id)a3 withSourceClient:(id)a4 touchIDs:(id)a5 itemCount:(unint64_t)a6 centroid:(CAPoint3D)a7 sourceContextID:(unsigned int)a8 initialCentroidInSourceContext:(CAPoint3D)a9 preferredPreviewIndexes:(id)a10
{
  double z = a9.z;
  double y = a9.y;
  double x = a9.x;
  double v17 = a7.z;
  double v18 = a7.y;
  double v19 = a7.x;
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v92 = a10;
  v24 = [(DRViewController *)self controllers];
  id v25 = [v24 count];

  if (!v25) {
    _UIUpdateRequestActivate();
  }
  id v26 = -[DRViewController newSessionControllerForSession:](self, "newSessionControllerForSession:", [v21 identifier]);
  [v26 setOrientation:self->_currentOrientation withDuration:0 direction:0.0];
  controllers = self->_controllers;
  v28 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v21 identifier]);
  [(NSMutableDictionary *)controllers setObject:v26 forKeyedSubscript:v28];

  v29 = [v26 model];
  v91 = v22;
  id v30 = [v29 addClientModelForClient:v22 isSource:1];

  if ([v23 count])
  {
    unint64_t v88 = a6;
    v89 = self;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v31 = v23;
    id v32 = v23;
    id v33 = [v32 countByEnumeratingWithState:&v97 objects:v102 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v98;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v98 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v37 = *(void *)(*((void *)&v97 + 1) + 8 * i);
          v38 = [v26 model];
          [v38 addTouchID:v37];
        }
        id v34 = [v32 countByEnumeratingWithState:&v97 objects:v102 count:16];
      }
      while (v34);
    }

    id v23 = v31;
    a6 = v88;
    self = v89;
  }
  else
  {
    v39 = [v26 model];
    [v39 setUsesSynthesizedTouch:1];
  }
  id v40 = [v21 rotatable];
  v41 = [v26 model];
  [v41 setRotatable:v40];

  id v42 = [v21 resizable];
  v43 = [v26 model];
  [v43 setResizable:v42];

  [v21 minimumResizableSize];
  double v45 = v44;
  double v47 = v46;
  v48 = [v26 model];
  objc_msgSend(v48, "setMinimumResizableSize:", v45, v47);

  [v21 maximumResizableSize];
  double v50 = v49;
  double v52 = v51;
  v53 = [v26 model];
  objc_msgSend(v53, "setMaximumResizableSize:", v50, v52);

  id v54 = [v21 wantsElasticEffects];
  v55 = [v26 model];
  [v55 setWantsElasticEffects:v54];

  [v21 originalRotation];
  double v57 = v56;
  v58 = [v26 model];
  [v58 setOriginalRotation:v57];

  [v21 originalScale];
  double v60 = v59;
  double v62 = v61;
  v63 = [v26 model];
  objc_msgSend(v63, "setOriginalScale:", v60, v62);

  v64 = [v26 model];
  [v64 setSourceContextID:a8];

  v65 = [v26 model];
  objc_msgSend(v65, "setInitialCentroidInSourceContext:", x, y, z);

  id v66 = [v21 continuityDisplayWantsDragsHidden];
  v67 = [v26 model];
  [v67 setContinuityDisplayWantsDragsHidden:v66];

  id v68 = [v21 sourceRestrictsDragToSelf];
  v69 = [v26 model];
  [v69 setSourceRestrictsDragToSelf:v68];

  id v70 = [v21 sourceRestrictsDragToLocalDevice];
  v71 = [v26 model];
  [v71 setSourceRestrictsDragToLocalDevice:v70];

  v72 = [v26 model];
  [v72 addInitialItemsWithCount:a6];

  v73 = [v26 model];
  [v73 setPreferredPreviewIndexes:v92];

  v74 = [v26 model];
  objc_msgSend(v74, "updateLocationWithoutTouches:", v19, v18, v17);

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  v75 = self->_activeTouches;
  id v76 = [(NSMutableSet *)v75 countByEnumeratingWithState:&v93 objects:v101 count:16];
  if (v76)
  {
    id v77 = v76;
    uint64_t v78 = *(void *)v94;
    do
    {
      for (j = 0; j != v77; j = (char *)j + 1)
      {
        if (*(void *)v94 != v78) {
          objc_enumerationMutation(v75);
        }
        v80 = *(void **)(*((void *)&v93 + 1) + 8 * (void)j);
        v81 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v80 _touchIdentifier]);
        [v80 locationInView:0];
        double v83 = v82;
        double v85 = v84;
        v86 = [v26 model];
        objc_msgSend(v86, "updateLocation:ofTouchID:", v81, v83, v85, 0.0);
      }
      id v77 = [(NSMutableSet *)v75 countByEnumeratingWithState:&v93 objects:v101 count:16];
    }
    while (v77);
  }

  v87 = [v26 model];
  [v26 viewModelInvalidated:v87];
}

- (id)newSessionControllerForSession:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [DRSessionController alloc];
  return [(DRSessionController *)v5 initWithSessionID:v3 delegate:self];
}

- (void)removeSession:(unsigned int)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  objc_super v7 = [(DRViewController *)self controllers];
  v8 = +[NSNumber numberWithUnsignedInt:v5];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000A590;
    v15[3] = &unk_100054DA8;
    id v10 = v9;
    id v16 = v10;
    double v17 = self;
    int v18 = v5;
    v11 = objc_retainBlock(v15);
    if (v4
      && ([(DRViewController *)self pendingRemovalControllers],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v13 = [v12 containsObject:v10],
          v12,
          (v13 & 1) == 0))
    {
      ((void (*)(void *))v11[2])(v11);
    }
    else
    {
      [v10 performAfterAnimationsComplete:v11];
      uint64_t v14 = [(DRViewController *)self pendingRemovalControllers];
      [v14 addObject:v10];
    }
  }
}

- (id)viewModelForSessionID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v4 = [(DRViewController *)self controllers];
  uint64_t v5 = +[NSNumber numberWithUnsignedInt:v3];
  v6 = [v4 objectForKeyedSubscript:v5];
  objc_super v7 = [v6 model];

  return v7;
}

- (unsigned)sessionIDForViewModel:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_controllers allValues];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 model];

        if (v10 == v4)
        {
          LODWORD(v6) = [v9 sessionID];
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)updateWithTouches:(id)a3
{
  id v4 = a3;
  [(NSMutableSet *)self->_activeTouches unionSet:v4];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v10 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 _touchIdentifier]);
        [v9 locationInView:0];
        double v12 = v11;
        double v14 = v13;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v15 = [(DRViewController *)self controllers];
        id v16 = [v15 objectEnumerator];

        id v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v24;
          do
          {
            for (j = 0; j != v18; j = (char *)j + 1)
            {
              if (*(void *)v24 != v19) {
                objc_enumerationMutation(v16);
              }
              id v21 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)j) model];
              objc_msgSend(v21, "updateLocation:ofTouchID:", v10, v12, v14, 0.0);
            }
            id v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v18);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v6);
  }
}

- (void)moveSessionWithID:(unsigned int)a3 toLocation:(CAPoint3D)a4
{
  double z = a4.z;
  double y = a4.y;
  double x = a4.x;
  uint64_t v7 = *(void *)&a3;
  v8 = [(DRViewController *)self controllers];
  id v9 = +[NSNumber numberWithUnsignedInt:v7];
  id v11 = [v8 objectForKeyedSubscript:v9];

  id v10 = [v11 model];
  objc_msgSend(v10, "updateLocationWithoutTouches:", x, y, z);
}

- (id)sessionViewModelForAddingTouch:(id)a3
{
  id v4 = a3;
  if ([v4 _edgeType])
  {
    id v5 = 0;
  }
  else
  {
    [v4 locationInView:0];
    double v7 = v6;
    v8 = [v4 window];
    id v9 = [v8 screen];
    id v10 = [(DRViewController *)self view];
    id v11 = [v10 window];
    double v12 = [v11 screen];
    double v13 = sub_100006044(v9, v12, v7);
    double v15 = v14;

    id v16 = [v4 window];
    id v17 = [v16 windowScene];
    id v18 = sub_100005F80(v17);

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v19 = [(DRViewController *)self controllers];
    v20 = [v19 objectEnumerator];

    id v21 = [v20 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v41;
LABEL_5:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v41 != v23) {
          objc_enumerationMutation(v20);
        }
        id v5 = [*(id *)(*((void *)&v40 + 1) + 8 * v24) model];
        if (objc_msgSend(v5, "acceptsSynthesizedTouchAtLocation:displayIdentifier:", v18, v13, v15)) {
          break;
        }

        if (v22 == (id)++v24)
        {
          id v22 = [v20 countByEnumeratingWithState:&v40 objects:v45 count:16];
          if (v22) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v25 = [(DRViewController *)self controllers];
      v20 = [v25 objectEnumerator];

      id v26 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v37;
        while (2)
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v37 != v28) {
              objc_enumerationMutation(v20);
            }
            long long v30 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            id v5 = [v30 model];
            id v31 = [v30 view];
            id v32 = [v31 _window];

            if (v32)
            {
              [v31 setUserInteractionEnabled:1];
              id v33 = objc_msgSend(v31, "hitTest:withEvent:", 0, v13, v15);
              [v31 setUserInteractionEnabled:0];
              if (v33) {
                BOOL v34 = v33 == v31;
              }
              else {
                BOOL v34 = 1;
              }
              if (!v34 && ([v5 canAddTouches] & 1) != 0)
              {

                goto LABEL_27;
              }
            }
          }
          id v27 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }
      id v5 = 0;
    }
LABEL_27:
  }
  return v5;
}

- (id)sessionViewModelForBeginningDragManipulationAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(DRViewController *)self controllers];
  double v6 = [v5 objectEnumerator];

  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        double v12 = [v11 model];
        double v13 = [v11 view];
        double v14 = [v13 _window];

        if (v14)
        {
          [v13 setUserInteractionEnabled:1];
          double v15 = objc_msgSend(v13, "hitTest:withEvent:", 0, x, y);
          [v13 setUserInteractionEnabled:0];
          if (v15) {
            BOOL v16 = v15 == v13;
          }
          else {
            BOOL v16 = 1;
          }
          if (!v16
            && [v12 canAddManipulatedTouch]
            && ![v12 isManipulatingTransform])
          {

            goto LABEL_18;
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  double v12 = 0;
LABEL_18:

  return v12;
}

- (void)configurePortalViewForDragSessionOriginatingFromViewController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 view];
  double v6 = [v5 window];
  id v7 = [v6 windowScene];
  id v8 = sub_100005F80(v7);

  portalViewByDisplayIdentifiers = self->_portalViewByDisplayIdentifiers;
  if (!portalViewByDisplayIdentifiers)
  {
    id v10 = (NSMutableDictionary *)objc_opt_new();
    id v11 = self->_portalViewByDisplayIdentifiers;
    self->_portalViewByDisplayIdentifiers = v10;

    portalViewByDisplayIdentifiers = self->_portalViewByDisplayIdentifiers;
  }
  id v12 = [(NSMutableDictionary *)portalViewByDisplayIdentifiers objectForKeyedSubscript:v8];
  if (!v12)
  {
    id v13 = objc_alloc((Class)_UIPortalView);
    double v14 = [v4 contentView];
    id v12 = [v13 initWithSourceView:v14];

    [v12 setUserInteractionEnabled:0];
    double v15 = [v12 portalLayer];
    [v15 setCrossDisplay:1];

    [(NSMutableDictionary *)self->_portalViewByDisplayIdentifiers setObject:v12 forKey:v8];
  }
  uint64_t v16 = v4[2];
  double v17 = 0.0;
  double v18 = 0.0;
  if (v16 != 1)
  {
    if (v16 == 3)
    {
      double v18 = 1.57079633;
    }
    else if (v16 == 4)
    {
      double v18 = -1.57079633;
    }
    else
    {
      double v18 = 3.14159265;
      if (v16 != 2) {
        double v18 = 0.0;
      }
    }
  }
  int64_t currentOrientation = self->_currentOrientation;
  if (currentOrientation != 1)
  {
    if (currentOrientation == 3)
    {
      double v17 = 1.57079633;
    }
    else if (currentOrientation == 4)
    {
      double v17 = -1.57079633;
    }
    else
    {
      double v17 = 3.14159265;
      if (currentOrientation != 2) {
        double v17 = 0.0;
      }
    }
  }
  memset(&v29, 0, sizeof(v29));
  CGAffineTransformMakeRotation(&v29, v18 - v17);
  CGAffineTransform v27 = v29;
  CGAffineTransformInvert(&v28, &v27);
  CGAffineTransform v26 = v28;
  [v12 setTransform:&v26];
  long long v20 = [v4 view];
  [v20 bounds];
  CGFloat v22 = v21;
  uint64_t v23 = [v4 _screen];
  uint64_t v24 = [(DRViewController *)self _screen];
  objc_msgSend(v12, "setFrame:", sub_100006354(v23, v24, v22));

  long long v25 = [(DRViewController *)self view];
  [v25 addSubview:v12];
}

- (void)teardownPortalViewForDragSessionOriginatingFromViewController:(id)a3
{
  id v4 = [a3 view];
  id v5 = [v4 window];
  double v6 = [v5 windowScene];
  sub_100005F80(v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [(NSMutableDictionary *)self->_portalViewByDisplayIdentifiers objectForKey:v9];
  id v8 = v7;
  if (v7)
  {
    [v7 removeFromSuperview];
    [(NSMutableDictionary *)self->_portalViewByDisplayIdentifiers removeObjectForKey:v9];
  }
}

- (void)removeTouches:(id)a3
{
  id v18 = a3;
  -[NSMutableSet minusSet:](self->_activeTouches, "minusSet:");
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [(DRViewController *)self controllers];
  id v5 = [v4 objectEnumerator];

  id obj = v5;
  id v19 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    uint64_t v17 = *(void *)v25;
    do
    {
      double v6 = 0;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v6);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v8 = v18;
        id v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v21;
          do
          {
            id v12 = 0;
            do
            {
              if (*(void *)v21 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v12);
              double v14 = [v7 model];
              double v15 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v13 _touchIdentifier]);
              [v14 removeTouchID:v15];

              id v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            id v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v10);
        }

        double v6 = (char *)v6 + 1;
      }
      while (v6 != v19);
      id v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v19);
  }
}

- (void)fenceForSession:(unsigned int)a3 withHandle:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v13 = a4;
  double v6 = [(DRViewController *)self controllers];
  id v7 = +[NSNumber numberWithUnsignedInt:v4];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    +[UIScene _synchronizeDrawingWithFence:v13];
    id v9 = [v8 view];
    id v10 = [v9 superview];

    if (!v10)
    {
      uint64_t v11 = [(DRViewController *)self view];
      [v11 bounds];
      objc_msgSend(v9, "setFrame:");

      id v12 = [(DRViewController *)self contentView];
      [v12 addSubview:v9];
    }
  }
}

- (id)visibleDroppedItemsForSession:(unsigned int)a3 transform:(CATransform3D *)a4 targetScreen:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = [(DRViewController *)self controllers];
  id v10 = +[NSNumber numberWithUnsignedInt:v6];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  long long v12 = *(_OWORD *)&a4->m33;
  v18[4] = *(_OWORD *)&a4->m31;
  v18[5] = v12;
  long long v13 = *(_OWORD *)&a4->m43;
  v18[6] = *(_OWORD *)&a4->m41;
  v18[7] = v13;
  long long v14 = *(_OWORD *)&a4->m13;
  v18[0] = *(_OWORD *)&a4->m11;
  v18[1] = v14;
  long long v15 = *(_OWORD *)&a4->m23;
  v18[2] = *(_OWORD *)&a4->m21;
  v18[3] = v15;
  uint64_t v16 = [v11 visibleDroppedItemsInTargetScreen:v8 transform:v18];

  return v16;
}

- (void)animateOutVisibleItemsForSession:(unsigned int)a3 withOperation:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = [(DRViewController *)self controllers];
  id v7 = +[NSNumber numberWithUnsignedInt:v5];
  id v8 = [v6 objectForKeyedSubscript:v7];

  [v8 animateOutWithOperation:a4];
}

- (void)sessionController:(id)a3 requestImagesForClient:(id)a4 itemIndexes:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(DRViewController *)self delegate];
  id v11 = [v10 sessionID];

  [v12 viewController:self requestImagesForSessionID:v11 client:v9 itemIndexes:v8];
}

- (void)sessionController:(id)a3 setTouchOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v9 = [(DRViewController *)self delegate];
  id v8 = [v7 sessionID];

  objc_msgSend(v9, "viewController:setTouchOffset:forSession:", self, v8, x, y);
}

- (void)sessionController:(id)a3 didUpdatePresentation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(DRViewController *)self delegate];
  id v8 = [v7 sessionID];

  [v9 viewController:self didUpdatePresentation:v6 forSession:v8];
}

- (CATransform3D)transformToLocalWindowForCoordinateSpaceTransformToDisplay:(SEL)a3
{
  id v6 = [(DRViewController *)self view];
  id v7 = [v6 window];
  id v8 = [v7 screen];

  [v8 scale];
  CGFloat v10 = v9;
  [v8 _referenceBounds];
  double v12 = v11;
  double v14 = v13;
  [v8 _rotation];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  CGAffineTransformMakeRotation(&v29, -v15);
  UIIntegralTransform();
  *(_OWORD *)&m.m11 = v30;
  *(_OWORD *)&m.m13 = v31;
  *(_OWORD *)&m.m21 = v32;
  CGAffineTransformScale((CGAffineTransform *)&v28, (CGAffineTransform *)&m, v10, v10);
  long long v30 = *(_OWORD *)&v28.m11;
  long long v31 = *(_OWORD *)&v28.m13;
  long long v32 = *(_OWORD *)&v28.m21;
  if (BSFloatEqualToFloat())
  {
    double y = -v14;
    double x = 0.0;
  }
  else if (BSFloatEqualToFloat())
  {
    double x = -v12;
    double y = 0.0;
  }
  else if (BSFloatEqualToFloat())
  {
    double x = -v12;
    double y = -v14;
  }
  else
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }
  *(_OWORD *)&m.m11 = v30;
  *(_OWORD *)&m.m13 = v31;
  *(_OWORD *)&m.m21 = v32;
  CGAffineTransformTranslate((CGAffineTransform *)&v28, (CGAffineTransform *)&m, x, y);
  long long v18 = *(_OWORD *)&v28.m11;
  long long v30 = *(_OWORD *)&v28.m11;
  long long v31 = *(_OWORD *)&v28.m13;
  long long v19 = *(_OWORD *)&v28.m21;
  long long v32 = *(_OWORD *)&v28.m21;
  memset(&v28, 0, sizeof(v28));
  *(_OWORD *)&m.m11 = v18;
  *(_OWORD *)&m.m13 = v31;
  *(_OWORD *)&m.m21 = v19;
  CATransform3DMakeAffineTransform(&v27, (CGAffineTransform *)&m);
  CATransform3DInvert(&v28, &v27);
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  long long v20 = *(_OWORD *)&a4->m33;
  *(_OWORD *)&m.m31 = *(_OWORD *)&a4->m31;
  *(_OWORD *)&m.m33 = v20;
  long long v21 = *(_OWORD *)&a4->m43;
  *(_OWORD *)&m.m41 = *(_OWORD *)&a4->m41;
  *(_OWORD *)&m.m43 = v21;
  long long v22 = *(_OWORD *)&a4->m13;
  *(_OWORD *)&m.m11 = *(_OWORD *)&a4->m11;
  *(_OWORD *)&m.m13 = v22;
  long long v23 = *(_OWORD *)&a4->m23;
  *(_OWORD *)&m.m21 = *(_OWORD *)&a4->m21;
  *(_OWORD *)&m.m23 = v23;
  CATransform3D v25 = v28;
  CATransform3DConcat(retstr, &m, &v25);

  return result;
}

- (void)observeInterfaceOrientationUpdates
{
  id v3 = +[DROrientationObserver sharedObserver];
  [v3 addObserver:self];
}

- (void)dealloc
{
  id v3 = +[DROrientationObserver sharedObserver];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DRViewController;
  [(DRViewController *)&v4 dealloc];
}

- (void)orientationObserver:(id)a3 orientationDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [v5 orientation];
  if (v6 != self->_currentOrientation)
  {
    id v7 = v6;
    self->_int64_t currentOrientation = (int64_t)v6;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = [(DRViewController *)self controllers];
    double v9 = [v8 objectEnumerator];

    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          [v5 duration];
          objc_msgSend(v14, "setOrientation:withDuration:direction:", v7, objc_msgSend(v5, "rotationDirection"), v15);
        }
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

- (DRViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DRViewControllerDelegate *)WeakRetained;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (NSDictionary)controllers
{
  return &self->_controllers->super;
}

- (NSMutableSet)activeTouches
{
  return self->_activeTouches;
}

- (void)setActiveTouches:(id)a3
{
}

- (NSMutableSet)pendingRemovalControllers
{
  return self->_pendingRemovalControllers;
}

- (void)setPendingRemovalControllers:(id)a3
{
}

- (NSMutableDictionary)portalViewByDisplayIdentifiers
{
  return self->_portalViewByDisplayIdentifiers;
}

- (void)setPortalViewByDisplayIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portalViewByDisplayIdentifiers, 0);
  objc_storeStrong((id *)&self->_pendingRemovalControllers, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_controllers, 0);
}

@end