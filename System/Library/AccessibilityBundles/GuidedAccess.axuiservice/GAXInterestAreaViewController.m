@interface GAXInterestAreaViewController
- (BOOL)_interestAreaPath:(id)a3 shouldShowResizingKnobAtPosition:(unint64_t)a4;
- (BOOL)allowsDimmingInterestAreaPaths;
- (BOOL)backgroundShouldCoverEverything;
- (BOOL)interestAreaView:(id)a3 shouldAddCloseButtonForInterestAreaPathAtIndex:(unint64_t)a4;
- (BOOL)interestAreaView:(id)a3 shouldDisableSmartLayoutRelativeToEdgesForInterestAreaPathAtIndex:(unint64_t)a4;
- (BOOL)interestAreaViewIsAccessibilityElement:(id)a3;
- (BOOL)isEditing;
- (BOOL)outOfBoundsDrawingEnabled;
- (BOOL)shouldAllowEditingInterestAreas;
- (BOOL)shouldNotifyDelegateOfInterestAreaPathsChange;
- (CGPoint)_locationForTouch:(id)a3;
- (CGPoint)lastTranslationAppliedToPathBeingDragged;
- (CGRect)_boundsForConstrainingFingerPath;
- (GAXInterestAreaViewControllerDelegate)delegate;
- (GAXPathInterpolator)pathInterpolator;
- (GAXPathMapping)cachedInterestAreaPathsForStorage;
- (GAXPathMapping)interestAreaPathMapping;
- (GAXPathMapping)interestAreaPaths;
- (GAXPathMapping)interestAreaPathsForStorage;
- (GAXPathMapping)interestAreaPathsInScreenCoordinates;
- (GAXStyleProvider)styleProvider;
- (NSMutableArray)orderedInterestAreaPaths;
- (NSSet)oldInterestAreaPathsIntersectingWithMovingPath;
- (UIBezierPath)currentInterpolatedPath;
- (UIBezierPath)fingerPath;
- (UITouch)currentTouch;
- (double)scaleForSpecialControlsInInterestAreaView:(id)a3;
- (double)snapAnimationDidStartTimeInterval;
- (float)snapAnimationProgress;
- (float)snapAnimationRawProgress;
- (id)_childrenOfParentInterestAreaPath:(id)a3;
- (id)_interestAreaPathAtIndex:(unint64_t)a3 parent:(id *)a4;
- (id)_interestAreaPathsIntersectingPath:(id)a3;
- (id)_orientationAgnosticPathsFromOrientationAwarePaths:(id)a3 shouldConsolidateOrientationsOnSameAxis:(BOOL)a4;
- (id)_parentOfInterestAreaPath:(id)a3;
- (id)_referenceViewForConvertingFromAndToWindowCoordinateSystem;
- (id)interestAreaView:(id)a3 dynamicInterestAreaPathAtIndex:(unint64_t)a4;
- (id)interestAreaView:(id)a3 interestAreaPathAtIndex:(unint64_t)a4;
- (int)_backgroundStyleForCurrentState;
- (int)_backgroundStyleForEditing:(BOOL)a3;
- (int64_t)_compareInterestAreaPath:(id)a3 toPath:(id)a4;
- (unint64_t)_numberOfInterestAreaPaths;
- (unint64_t)interestAreaPathsUpdateCount;
- (unint64_t)interestAreaView:(id)a3 visibleKnobPositionsForInterestAreaPathAtIndex:(unint64_t)a4;
- (unint64_t)numberOfDynamicInterestAreaPathsForInterestAreaView:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addInterestAreaPath:(id)a3 withParent:(id)a4 notifyDelegate:(BOOL)a5;
- (void)_addInterestAreaPath:(id)a3 withParent:(id)a4 notifyInterestAreaView:(BOOL)a5 notifyDelegate:(BOOL)a6;
- (void)_applyInterestAreaPathsForStorage;
- (void)_applyInterestAreaPathsForStorageAnimated:(BOOL)a3;
- (void)_archiveInterestAreaPathsForStorage;
- (void)_beginInterestAreaPathsUpdate;
- (void)_computeFinalPathForFingerPath:(id)a3 completion:(id)a4;
- (void)_didFinishRecordingCurrentSequenceOfTouchEvents;
- (void)_didRecordTouchEventAtLocation:(CGPoint)a3;
- (void)_displayDidRefresh:(id)a3;
- (void)_endInterestAreaPathsUpdate;
- (void)_endInterestAreaPathsUpdateAnimated:(BOOL)a3;
- (void)_enumerateInterestAreaPathsUsingBlock:(id)a3;
- (void)_interestAreaPath:(id)a3 ensureExistenceOfKnownParent:(id)a4 orFindAdoptiveParentUsingDirectIntersectingInterestAreaPaths:(id)a5 orphanedInterestAreaPaths:(id)a6;
- (void)_interestAreaPathsDidChange;
- (void)_makeInterestAreaPath:(id)a3 adoptOtherInterestAreaPath:(id)a4 notifyDelegate:(BOOL)a5;
- (void)_removeInterestAreaPathAtIndices:(id)a3 notifyDelegate:(BOOL)a4;
- (void)_updateBackgroundVisibilityAnimated:(BOOL)a3;
- (void)_updateInterestAreaPathsWithPath:(id)a3 updatedInterestAreaPathAlreadyAdded:(BOOL)a4;
- (void)commonInit;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)interestAreaView:(id)a3 didActivateCloseButtonForInterestAreaPathAtIndex:(unint64_t)a4;
- (void)interestAreaView:(id)a3 didFinishMovingInterestAreaPathAtIndex:(unint64_t)a4;
- (void)interestAreaView:(id)a3 didFinishMovingResizingKnobAtPosition:(unint64_t)a4 forInterestAreaPathAtIndex:(unint64_t)a5;
- (void)interestAreaView:(id)a3 interestAreaPathAtIndex:(unint64_t)a4 wasMovedWithTranslation:(CGPoint)a5;
- (void)interestAreaView:(id)a3 resizingKnobAtPosition:(unint64_t)a4 wasMovedToPoint:(CGPoint)a5 forInterestAreaPathAtIndex:(unint64_t)a6 constrainedResizingKnobCenter:(CGPoint *)a7;
- (void)interestAreaView:(id)a3 willBeginMovingInterestAreaPathAtIndex:(unint64_t)a4;
- (void)interestAreaView:(id)a3 willBeginMovingResizingKnobAtPosition:(unint64_t)a4 forInterestAreaPathAtIndex:(unint64_t)a5;
- (void)loadView;
- (void)setAllowsDimmingInterestAreaPaths:(BOOL)a3;
- (void)setAllowsDimmingInterestAreaPaths:(BOOL)a3 animated:(BOOL)a4;
- (void)setBackgroundShouldCoverEverything:(BOOL)a3;
- (void)setBackgroundShouldCoverEverything:(BOOL)a3 animated:(BOOL)a4;
- (void)setCachedInterestAreaPathsForStorage:(id)a3;
- (void)setCurrentInterpolatedPath:(id)a3;
- (void)setCurrentTouch:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFingerPath:(id)a3;
- (void)setInterestAreaPathMapping:(id)a3;
- (void)setInterestAreaPaths:(id)a3;
- (void)setInterestAreaPaths:(id)a3 animated:(BOOL)a4;
- (void)setInterestAreaPathsForStorage:(id)a3;
- (void)setInterestAreaPathsForStorage:(id)a3 animated:(BOOL)a4;
- (void)setInterestAreaPathsUpdateCount:(unint64_t)a3;
- (void)setLastTranslationAppliedToPathBeingDragged:(CGPoint)a3;
- (void)setOldInterestAreaPathsIntersectingWithMovingPath:(id)a3;
- (void)setOrderedInterestAreaPaths:(id)a3;
- (void)setOutOfBoundsDrawingEnabled:(BOOL)a3;
- (void)setPathInterpolator:(id)a3;
- (void)setShouldNotifyDelegateOfInterestAreaPathsChange:(BOOL)a3;
- (void)setSnapAnimationDidStartTimeInterval:(double)a3;
- (void)setStyleProvider:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)transitionIn;
- (void)transitionOutIncludingBackground:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation GAXInterestAreaViewController

- (void)commonInit
{
  v3.receiver = self;
  v3.super_class = (Class)GAXInterestAreaViewController;
  [(GAXViewController *)&v3 commonInit];
  [(GAXInterestAreaViewController *)self setAllowsDimmingInterestAreaPaths:1];
}

- (void)setEditing:(BOOL)a3
{
}

- (void)setAllowsDimmingInterestAreaPaths:(BOOL)a3
{
}

- (GAXPathMapping)interestAreaPaths
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_174DC;
  v9 = sub_174EC;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_174F4;
  v4[3] = &unk_5D448;
  v4[4] = &v5;
  [(GAXInterestAreaViewController *)self _enumerateInterestAreaPathsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (GAXPathMapping *)v2;
}

- (void)setInterestAreaPaths:(id)a3
{
}

- (GAXPathMapping)interestAreaPathsForStorage
{
  objc_super v3 = [(GAXInterestAreaViewController *)self interestAreaPaths];
  v4 = [(GAXInterestAreaViewController *)self _orientationAgnosticPathsFromOrientationAwarePaths:v3 shouldConsolidateOrientationsOnSameAxis:1];

  return (GAXPathMapping *)v4;
}

- (void)setInterestAreaPathsForStorage:(id)a3
{
}

- (GAXPathMapping)interestAreaPathsInScreenCoordinates
{
  [(GAXInterestAreaViewController *)self _applyInterestAreaPathsForStorage];
  objc_super v3 = [(GAXInterestAreaViewController *)self interestAreaPaths];
  v4 = [(GAXInterestAreaViewController *)self _orientationAgnosticPathsFromOrientationAwarePaths:v3 shouldConsolidateOrientationsOnSameAxis:0];

  return (GAXPathMapping *)v4;
}

- (void)setBackgroundShouldCoverEverything:(BOOL)a3
{
}

- (GAXPathMapping)interestAreaPathMapping
{
  if (!self->_interestAreaPathMapping
    && [(GAXInterestAreaViewController *)self interestAreaPathsUpdateCount])
  {
    objc_super v3 = (GAXPathMapping *)objc_opt_new();
    interestAreaPathMapping = self->_interestAreaPathMapping;
    self->_interestAreaPathMapping = v3;
  }
  uint64_t v5 = self->_interestAreaPathMapping;

  return v5;
}

- (NSMutableArray)orderedInterestAreaPaths
{
  if (!self->_orderedInterestAreaPaths
    && [(GAXInterestAreaViewController *)self interestAreaPathsUpdateCount])
  {
    objc_super v3 = (NSMutableArray *)objc_opt_new();
    orderedInterestAreaPaths = self->_orderedInterestAreaPaths;
    self->_orderedInterestAreaPaths = v3;
  }
  uint64_t v5 = self->_orderedInterestAreaPaths;

  return v5;
}

- (void)setStyleProvider:(id)a3
{
  uint64_t v5 = (GAXStyleProvider *)a3;
  if (self->_styleProvider != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)&self->_styleProvider, a3);
    if ([(GAXInterestAreaViewController *)self isViewLoaded])
    {
      v6 = [(GAXInterestAreaViewController *)self interestAreaView];
      [v6 setStyleProvider:v7];
    }
  }

  _objc_release_x2();
}

- (float)snapAnimationRawProgress
{
  objc_super v3 = [(GAXInterestAreaViewController *)self styleProvider];
  v4 = v3;
  if (v3)
  {
    [v3 interestAreaViewSnapAnimationDuration];
    double v6 = v5;
  }
  else
  {
    double v6 = 1.0;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v8 = v7;
  [(GAXInterestAreaViewController *)self snapAnimationDidStartTimeInterval];
  *(float *)&double v9 = (v8 - v9) / v6;
  float v10 = fminf(*(float *)&v9, 1.0);

  return v10;
}

- (float)snapAnimationProgress
{
  objc_super v3 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [(GAXInterestAreaViewController *)self snapAnimationRawProgress];
  objc_msgSend(v3, "_solveForInput:");
  float v5 = v4;

  return v5;
}

- (BOOL)shouldAllowEditingInterestAreas
{
  BOOL v3 = [(GAXInterestAreaViewController *)self isEditing];
  if (v3) {
    LOBYTE(v3) = ![(GAXInterestAreaViewController *)self backgroundShouldCoverEverything];
  }
  return v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_editing != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_editing = a3;
    if ([(GAXInterestAreaViewController *)self isViewLoaded])
    {
      id v7 = [(GAXInterestAreaViewController *)self interestAreaView];
      [v7 setSpecialControlsVisible:v5 animated:v4];
      [(GAXInterestAreaViewController *)self _updateBackgroundVisibilityAnimated:v4];
    }
  }
}

- (void)setAllowsDimmingInterestAreaPaths:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_allowsDimmingInterestAreaPaths != a3)
  {
    self->_allowsDimmingInterestAreaPaths = a3;
    [(GAXInterestAreaViewController *)self _updateBackgroundVisibilityAnimated:a4];
  }
}

- (void)setInterestAreaPaths:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(GAXInterestAreaViewController *)self interestAreaView];
  unint64_t v8 = [(GAXInterestAreaViewController *)self numberOfInterestAreaPathsForInterestAreaView:v7];
  [(GAXInterestAreaViewController *)self setCachedInterestAreaPathsForStorage:0];
  [(GAXInterestAreaViewController *)self setInterestAreaPathMapping:0];
  [(GAXInterestAreaViewController *)self setOrderedInterestAreaPaths:0];
  if (v4)
  {
    double v9 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v8);
    [v7 deleteInterestAreaPathsAtIndices:v9];
  }
  [(GAXInterestAreaViewController *)self _beginInterestAreaPathsUpdate];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_17AF0;
  v10[3] = &unk_5D470;
  v10[4] = self;
  BOOL v11 = v4;
  [v6 enumeratePathsAndParentsUsingBlock:v10];

  if (!v4) {
    [v7 reloadAllInterestAreaPaths];
  }
  [(GAXInterestAreaViewController *)self _endInterestAreaPathsUpdateAnimated:v4];
}

- (void)setInterestAreaPathsForStorage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(GAXInterestAreaViewController *)self setCachedInterestAreaPathsForStorage:a3];

  [(GAXInterestAreaViewController *)self _applyInterestAreaPathsForStorageAnimated:v4];
}

- (void)setBackgroundShouldCoverEverything:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_backgroundShouldCoverEverything != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_backgroundShouldCoverEverything = a3;
    if ([(GAXInterestAreaViewController *)self isViewLoaded])
    {
      id v7 = [(GAXInterestAreaViewController *)self interestAreaView];
      [v7 setBackgroundShouldCoverEverything:v5 animated:v4];
    }
  }
}

- (void)transitionIn
{
  [(GAXInterestAreaViewController *)self _applyInterestAreaPathsForStorage];
  self->_allowsDimmingInterestAreaPaths = 1;

  [(GAXInterestAreaViewController *)self setEditing:1 animated:1];
}

- (void)transitionOutIncludingBackground:(BOOL)a3
{
  self->_allowsDimmingInterestAreaPaths = !a3;
  [(GAXInterestAreaViewController *)self setEditing:0 animated:1];
}

- (void)loadView
{
  id v4 = (id)objc_opt_new();
  objc_msgSend(v4, "setSpecialControlsVisible:", -[GAXInterestAreaViewController isEditing](self, "isEditing"));
  objc_msgSend(v4, "setBackgroundShouldCoverEverything:", -[GAXInterestAreaViewController backgroundShouldCoverEverything](self, "backgroundShouldCoverEverything"));
  [v4 setDataSource:self];
  [v4 setDelegate:self];
  BOOL v3 = [(GAXInterestAreaViewController *)self styleProvider];
  [v4 setStyleProvider:v3];

  [(GAXViewController *)self setView:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GAXInterestAreaViewController;
  [(GAXInterestAreaViewController *)&v4 viewWillAppear:a3];
  [(GAXInterestAreaViewController *)self _updateBackgroundVisibilityAnimated:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GAXInterestAreaViewController;
  [(GAXInterestAreaViewController *)&v4 viewDidAppear:a3];
  [(GAXInterestAreaViewController *)self _applyInterestAreaPathsForStorage];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GAXInterestAreaViewController;
  -[GAXInterestAreaViewController willRotateToInterfaceOrientation:duration:](&v8, "willRotateToInterfaceOrientation:duration:");
  id v7 = [(GAXInterestAreaViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 interestAreaViewController:self willRotateToInterfaceOrientation:a3 duration:a4];
  }
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GAXInterestAreaViewController;
  -[GAXInterestAreaViewController didRotateFromInterfaceOrientation:](&v6, "didRotateFromInterfaceOrientation:");
  BOOL v5 = [(GAXInterestAreaViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 interestAreaViewController:self didRotateFromInterfaceOrientation:a3];
  }
}

- (void)_displayDidRefresh:(id)a3
{
  id v12 = a3;
  BOOL v5 = [(GAXInterestAreaViewController *)self pathInterpolator];
  if (v5)
  {
    [(GAXInterestAreaViewController *)self setCurrentInterpolatedPath:0];
    objc_super v6 = [(GAXInterestAreaViewController *)self interestAreaView];
    [(GAXInterestAreaViewController *)self snapAnimationProgress];
    if (v7 >= 1.0)
    {
      objc_super v8 = [(GAXInterestAreaViewController *)self pathInterpolator];
      double v9 = [v8 endingPath];

      [(GAXInterestAreaViewController *)self setFingerPath:0];
      [(GAXInterestAreaViewController *)self setPathInterpolator:0];
      [(GAXInterestAreaViewController *)self setCurrentInterpolatedPath:0];
      [v12 removeTarget:self selector:a2];
      float v10 = [(GAXInterestAreaViewController *)self interestAreaView];
      BOOL v11 = +[NSIndexSet indexSetWithIndex:0];
      [v10 deleteDynamicInterestAreaPathAtIndices:v11];

      [(GAXInterestAreaViewController *)self _updateInterestAreaPathsWithPath:v9 updatedInterestAreaPathAlreadyAdded:0];
      [(GAXInterestAreaViewController *)self _didFinishRecordingCurrentSequenceOfTouchEvents];
      [(GAXInterestAreaViewController *)self _updateBackgroundVisibilityAnimated:1];
      [v6 reloadAllAccessoryControls];
    }
    [v6 reloadDynamicInterestAreaPathAtIndex:0];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(GAXInterestAreaViewController *)self shouldAllowEditingInterestAreas])
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    objc_super v8 = [(GAXInterestAreaViewController *)self interestAreaView];
    double v9 = [v6 anyObject];
    [(GAXInterestAreaViewController *)self setCurrentTouch:v9];
    [(GAXInterestAreaViewController *)self _locationForTouch:v9];
    double v11 = v10;
    double v13 = v12;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1820C;
    v16[3] = &unk_5D498;
    *(double *)&v16[5] = v10;
    *(double *)&v16[6] = v12;
    v16[4] = &v17;
    [(GAXInterestAreaViewController *)self _enumerateInterestAreaPathsUsingBlock:v16];
    if (!*((unsigned char *)v18 + 24))
    {
      v14 = objc_opt_new();
      [(GAXInterestAreaViewController *)self setFingerPath:v14];
      objc_msgSend(v14, "moveToPoint:", v11, v13);
      -[GAXInterestAreaViewController _didRecordTouchEventAtLocation:](self, "_didRecordTouchEventAtLocation:", v11, v13);
      [v8 insertDynamicInterestAreaPathAtIndex:0];
    }
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)GAXInterestAreaViewController;
    [(GAXInterestAreaViewController *)&v15 touchesBegan:v6 withEvent:v7];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(GAXInterestAreaViewController *)self shouldAllowEditingInterestAreas])
  {
    objc_super v8 = [(GAXInterestAreaViewController *)self fingerPath];
    uint64_t v9 = [(GAXInterestAreaViewController *)self currentTouch];
    double v10 = (void *)v9;
    if (v8 && v9 && [v6 containsObject:v9])
    {
      double v11 = [(GAXInterestAreaViewController *)self interestAreaView];
      [(GAXInterestAreaViewController *)self _locationForTouch:v10];
      double v13 = v12;
      double v15 = v14;
      objc_msgSend(v8, "addLineToPoint:");
      -[GAXInterestAreaViewController _didRecordTouchEventAtLocation:](self, "_didRecordTouchEventAtLocation:", v13, v15);
      [v11 reloadDynamicInterestAreaPathAtIndex:0];
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)GAXInterestAreaViewController;
    [(GAXInterestAreaViewController *)&v16 touchesMoved:v6 withEvent:v7];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(GAXInterestAreaViewController *)self shouldAllowEditingInterestAreas])
  {
    id v8 = [(GAXInterestAreaViewController *)self fingerPath];
    uint64_t v9 = [(GAXInterestAreaViewController *)self currentTouch];
    double v10 = (void *)v9;
    if (v8 && v9 && [v6 containsObject:v9])
    {
      double v11 = [(GAXInterestAreaViewController *)self interestAreaView];
      [(GAXInterestAreaViewController *)self _locationForTouch:v10];
      double v13 = v12;
      double v15 = v14;
      objc_msgSend(v8, "addLineToPoint:");
      [v8 closePath];
      objc_super v16 = [v8 equivalentPathForDirection:0];

      [(GAXInterestAreaViewController *)self setFingerPath:v16];
      -[GAXInterestAreaViewController _didRecordTouchEventAtLocation:](self, "_didRecordTouchEventAtLocation:", v13, v15);
      [v11 reloadDynamicInterestAreaPathAtIndex:0];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1853C;
      v19[3] = &unk_5D4E8;
      v19[4] = self;
      id v8 = v16;
      id v20 = v8;
      id v21 = v11;
      id v17 = v11;
      [(GAXInterestAreaViewController *)self _computeFinalPathForFingerPath:v8 completion:v19];
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)GAXInterestAreaViewController;
    [(GAXInterestAreaViewController *)&v18 touchesEnded:v6 withEvent:v7];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(GAXInterestAreaViewController *)self shouldAllowEditingInterestAreas])
  {
    [(GAXInterestAreaViewController *)self touchesEnded:v7 withEvent:v6];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GAXInterestAreaViewController;
    [(GAXInterestAreaViewController *)&v8 touchesCancelled:v7 withEvent:v6];
  }
}

- (int64_t)_compareInterestAreaPath:(id)a3 toPath:(id)a4
{
  id v5 = a4;
  [a3 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v5 bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  CGFloat rect = v7;
  v29.origin.x = v7;
  v29.origin.y = v9;
  v29.size.width = v11;
  v29.size.height = v13;
  double MinY = CGRectGetMinY(v29);
  v30.origin.x = v15;
  v30.origin.y = v17;
  v30.size.width = v19;
  v30.size.height = v21;
  double v23 = CGRectGetMinY(v30);
  if (MinY >= v23) {
    int64_t result = 1;
  }
  else {
    int64_t result = -1;
  }
  if (MinY == v23)
  {
    v31.origin.x = rect;
    v31.origin.y = v9;
    v31.size.width = v11;
    v31.size.height = v13;
    double MinX = CGRectGetMinX(v31);
    v32.origin.x = v15;
    v32.origin.y = v17;
    v32.size.width = v19;
    v32.size.height = v21;
    double v26 = CGRectGetMinX(v32);
    if (MinX >= v26) {
      int64_t v27 = 1;
    }
    else {
      int64_t v27 = -1;
    }
    if (MinX == v26) {
      return 0;
    }
    else {
      return v27;
    }
  }
  return result;
}

- (void)_interestAreaPath:(id)a3 ensureExistenceOfKnownParent:(id)a4 orFindAdoptiveParentUsingDirectIntersectingInterestAreaPaths:(id)a5 orphanedInterestAreaPaths:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12)
  {
    id v12 = [(GAXInterestAreaViewController *)self _interestAreaPathsIntersectingPath:v10];
    if (!v12)
    {
      double v23 = 0;
      int v22 = 1;
LABEL_31:
      if ([v12 count])
      {
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_18CF0;
        v31[3] = &unk_5D510;
        v31[4] = self;
        [v12 sortUsingComparator:v31];
        v24 = [v12 firstObject];
        if (v24) {
          int v25 = v22;
        }
        else {
          int v25 = 0;
        }
        if (v25 == 1)
        {
          [(GAXInterestAreaViewController *)self _makeInterestAreaPath:0 adoptOtherInterestAreaPath:v24 notifyDelegate:1];
          [v13 removeObject:v24];
        }
      }
      else
      {
        v24 = 0;
      }
      [(GAXInterestAreaViewController *)self _makeInterestAreaPath:v24 adoptOtherInterestAreaPath:v10 notifyDelegate:1];
      [v13 removeObject:v10];

      goto LABEL_39;
    }
  }
  id v28 = v13;
  double v14 = objc_opt_new();
  id v29 = v12;
  id v15 = [objc_alloc((Class)NSMutableSet) initWithSet:v12];
  if (![v15 count])
  {

    id v12 = 0;
    int v22 = 1;
LABEL_30:
    id v13 = v28;
    double v23 = v29;
    goto LABEL_31;
  }
  int64_t v27 = v10;
  char v16 = 0;
  id v12 = 0;
  char v30 = 1;
  do
  {
    id v17 = [v15 anyObject];
    if (!v17) {
      _AXAssert();
    }
    if (([v14 containsObject:v17] & 1) == 0)
    {
      if (v17 == v11)
      {
        char v16 = 1;
LABEL_21:
        [v14 addObject:v17];
        goto LABEL_22;
      }
      id v18 = v11;
      CGFloat v19 = [(GAXInterestAreaViewController *)self _interestAreaPathsIntersectingPath:v17];
      double v20 = [v19 allObjects];
      [v15 addObjectsFromArray:v20];
      if (v30)
      {
        if (!v12) {
          id v12 = (id)objc_opt_new();
        }
        CGFloat v21 = [(GAXInterestAreaViewController *)self _parentOfInterestAreaPath:v17];
        if (!v21)
        {
          [v12 removeAllObjects];
          char v30 = 0;
          if (!v17) {
            goto LABEL_20;
          }
          goto LABEL_19;
        }
      }
      else
      {
        CGFloat v21 = [(GAXInterestAreaViewController *)self _parentOfInterestAreaPath:v17];
        if (v21) {
          goto LABEL_20;
        }
        if (!v12)
        {
          id v12 = (id)objc_opt_new();
          if (!v17) {
            goto LABEL_20;
          }
          goto LABEL_19;
        }
      }
      if (v17) {
LABEL_19:
      }
        [v12 addObject:v17];
LABEL_20:

      id v11 = v18;
      goto LABEL_21;
    }
LABEL_22:
    [v15 removeObject:v17];
  }
  while ([v15 count] && (v16 & 1) == 0);

  if ((v16 & 1) == 0)
  {
    int v22 = v30 & 1;
    id v10 = v27;
    goto LABEL_30;
  }
  [v11 topLeftPointOnPath];
  id v10 = v27;
  if (objc_msgSend(v27, "containsPoint:"))
  {
    [(GAXInterestAreaViewController *)self _makeInterestAreaPath:0 adoptOtherInterestAreaPath:v27 notifyDelegate:1];
    id v13 = v28;
    [(GAXInterestAreaViewController *)self _interestAreaPath:v11 ensureExistenceOfKnownParent:0 orFindAdoptiveParentUsingDirectIntersectingInterestAreaPaths:0 orphanedInterestAreaPaths:v28];
    double v26 = [(GAXInterestAreaViewController *)self _parentOfInterestAreaPath:v11];
    if (v26 != v27) {
      [(GAXInterestAreaViewController *)self _interestAreaPath:v27 ensureExistenceOfKnownParent:v26 orFindAdoptiveParentUsingDirectIntersectingInterestAreaPaths:0 orphanedInterestAreaPaths:v28];
    }

    double v23 = v29;
  }
  else
  {
    id v13 = v28;
    double v23 = v29;
  }
LABEL_39:
}

- (void)_updateInterestAreaPathsWithPath:(id)a3 updatedInterestAreaPathAlreadyAdded:(BOOL)a4
{
  BOOL v61 = a4;
  id v5 = a3;
  v58 = v5;
  if (!v5 || ([v5 isEmpty] & 1) != 0) {
    goto LABEL_106;
  }
  if (v61)
  {
    uint64_t v54 = [(GAXInterestAreaViewController *)self _parentOfInterestAreaPath:v5];
  }
  else
  {
    uint64_t v54 = 0;
  }
  v110[0] = 0;
  v110[1] = v110;
  v110[2] = 0x3032000000;
  v110[3] = sub_174DC;
  v110[4] = sub_174EC;
  id v111 = 0;
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x3032000000;
  v107 = sub_174DC;
  v108 = sub_174EC;
  id v109 = 0;
  v98[0] = _NSConcreteStackBlock;
  v98[1] = 3221225472;
  v98[2] = sub_19890;
  v98[3] = &unk_5D538;
  BOOL v103 = v61;
  id v6 = v5;
  id v99 = v6;
  v100 = self;
  v101 = v110;
  v102 = &v104;
  [(GAXInterestAreaViewController *)self _enumerateInterestAreaPathsUsingBlock:v98];
  uint64_t v7 = v105[5];
  if (v7) {
    [(GAXInterestAreaViewController *)self _removeInterestAreaPathAtIndices:v7 notifyDelegate:1];
  }
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x3032000000;
  v95 = sub_174DC;
  v96 = sub_174EC;
  id v97 = 0;
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_199DC;
  v91[3] = &unk_5D560;
  v91[4] = v110;
  v91[5] = &v92;
  -[GAXInterestAreaViewController _enumerateInterestAreaPathsUsingBlock:](self, "_enumerateInterestAreaPathsUsingBlock:", v91, v54);
  v56 = [(GAXInterestAreaViewController *)self _interestAreaPathsIntersectingPath:v6];
  if (v56)
  {
    id v8 = objc_alloc((Class)NSMutableArray);
    CGFloat v9 = [v56 allObjects];
    id v62 = [v8 initWithArray:v9];

    if (!v61)
    {
      id v10 = v62;
      if (!v62) {
        goto LABEL_42;
      }
      goto LABEL_44;
    }
  }
  else
  {
    if (!v61)
    {
LABEL_42:
      [(GAXInterestAreaViewController *)self _addInterestAreaPath:v6 withParent:0 notifyDelegate:1];
      id v26 = 0;
      goto LABEL_93;
    }
    id v62 = 0;
  }
  if (v55) {
    [(GAXInterestAreaViewController *)self _interestAreaPath:v6 ensureExistenceOfKnownParent:v55 orFindAdoptiveParentUsingDirectIntersectingInterestAreaPaths:v56 orphanedInterestAreaPaths:v93[5]];
  }
  v59 = [(GAXInterestAreaViewController *)self oldInterestAreaPathsIntersectingWithMovingPath];
  if ([v59 count])
  {
    id v11 = [objc_alloc((Class)NSMutableSet) initWithSet:v59];
    id v12 = objc_opt_new();
    v64 = objc_opt_new();
    while ([v11 count])
    {
      id v13 = [v11 anyObject];
      if (!v13) {
        _AXAssert();
      }
      [v12 addObject:v13];
      double v14 = [(GAXInterestAreaViewController *)self _interestAreaPathsIntersectingPath:v13];
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v15 = v14;
      id v16 = [v15 countByEnumeratingWithState:&v87 objects:v117 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v88;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v88 != v17) {
              objc_enumerationMutation(v15);
            }
            uint64_t v19 = *(void *)(*((void *)&v87 + 1) + 8 * i);
            if (([v12 containsObject:v19] & 1) == 0) {
              [v11 addObject:v19];
            }
          }
          id v16 = [v15 countByEnumeratingWithState:&v87 objects:v117 count:16];
        }
        while (v16);
      }

      [v64 addObject:v13];
      [v11 removeObject:v13];
    }
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v20 = v64;
    id v21 = [v20 countByEnumeratingWithState:&v83 objects:v116 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v84;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v84 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = *(void *)(*((void *)&v83 + 1) + 8 * (void)j);
          int v25 = [(GAXInterestAreaViewController *)self _parentOfInterestAreaPath:v24];
          if (v25) {
            [(GAXInterestAreaViewController *)self _interestAreaPath:v24 ensureExistenceOfKnownParent:v25 orFindAdoptiveParentUsingDirectIntersectingInterestAreaPaths:0 orphanedInterestAreaPaths:v93[5]];
          }
        }
        id v21 = [v20 countByEnumeratingWithState:&v83 objects:v116 count:16];
      }
      while (v21);
    }

    id v10 = v62;
    if (!v62)
    {
      if (!v61) {
        goto LABEL_42;
      }
LABEL_90:
      [(GAXInterestAreaViewController *)self _makeInterestAreaPath:0 adoptOtherInterestAreaPath:v6 notifyDelegate:1];
      [(id)v93[5] removeObject:v6];
      id v26 = 0;
      goto LABEL_93;
    }
  }
  else
  {

    id v10 = v62;
    if (!v62) {
      goto LABEL_90;
    }
  }
LABEL_44:
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_19A90;
  v82[3] = &unk_5D510;
  v82[4] = self;
  int64_t v27 = v10;
  [v10 sortUsingComparator:v82];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v26 = v27;
  id v28 = 0;
  id v29 = [v26 countByEnumeratingWithState:&v78 objects:v115 count:16];
  if (!v29) {
    goto LABEL_87;
  }
  uint64_t v30 = *(void *)v79;
  uint64_t v63 = *(void *)v79;
  id v60 = v26;
  do
  {
    CGRect v31 = 0;
    id v65 = v29;
    do
    {
      if (*(void *)v79 != v30) {
        objc_enumerationMutation(v26);
      }
      id v32 = *(id *)(*((void *)&v78 + 1) + 8 * (void)v31);
      if (v28)
      {
        if (v32 == v28) {
          goto LABEL_85;
        }
        uint64_t v33 = [(GAXInterestAreaViewController *)self _parentOfInterestAreaPath:*(void *)(*((void *)&v78 + 1) + 8 * (void)v31)];
        id v34 = (id)v33;
        if (v33) {
          BOOL v35 = v33 == (void)v28;
        }
        else {
          BOOL v35 = 1;
        }
        if (!v35)
        {
          v37 = [(GAXInterestAreaViewController *)self _childrenOfParentInterestAreaPath:v33];
          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          id v38 = v37;
          id v39 = [v38 countByEnumeratingWithState:&v70 objects:v113 count:16];
          id v40 = v39;
          if (v39)
          {
            uint64_t v41 = *(void *)v71;
            do
            {
              v42 = 0;
              do
              {
                if (*(void *)v71 != v41) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v43 = *(void *)(*((void *)&v70 + 1) + 8 * (void)v42);
                [(GAXInterestAreaViewController *)self _makeInterestAreaPath:v28 adoptOtherInterestAreaPath:v43 notifyDelegate:1];
                [(id)v93[5] removeObject:v43];
                v42 = (char *)v42 + 1;
              }
              while (v40 != v42);
              id v40 = [v38 countByEnumeratingWithState:&v70 objects:v113 count:16];
            }
            while (v40);
          }

          id v26 = v60;
          uint64_t v30 = v63;
          id v29 = v65;
          [(GAXInterestAreaViewController *)self _makeInterestAreaPath:v28 adoptOtherInterestAreaPath:v34 notifyDelegate:1];
          [(id)v93[5] removeObject:v34];
          goto LABEL_83;
        }
        [(GAXInterestAreaViewController *)self _makeInterestAreaPath:v28 adoptOtherInterestAreaPath:v32 notifyDelegate:1];
        [(id)v93[5] removeObject:v32];
LABEL_84:

        goto LABEL_85;
      }
      id v28 = [(GAXInterestAreaViewController *)self _parentOfInterestAreaPath:*(void *)(*((void *)&v78 + 1) + 8 * (void)v31)];
      if (!v28) {
        id v28 = v32;
      }
      [v28 topLeftPointOnPath];
      if (objc_msgSend(v6, "containsPoint:"))
      {
        v36 = [(GAXInterestAreaViewController *)self _childrenOfParentInterestAreaPath:v28];
        if (v61) {
          [(GAXInterestAreaViewController *)self _makeInterestAreaPath:0 adoptOtherInterestAreaPath:v6 notifyDelegate:1];
        }
        else {
          [(GAXInterestAreaViewController *)self _addInterestAreaPath:v6 withParent:0 notifyDelegate:1];
        }
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v34 = v36;
        id v44 = [v34 countByEnumeratingWithState:&v74 objects:v114 count:16];
        if (v44)
        {
          uint64_t v45 = *(void *)v75;
          do
          {
            for (k = 0; k != v44; k = (char *)k + 1)
            {
              if (*(void *)v75 != v45) {
                objc_enumerationMutation(v34);
              }
              uint64_t v47 = *(void *)(*((void *)&v74 + 1) + 8 * (void)k);
              [(GAXInterestAreaViewController *)self _makeInterestAreaPath:v6 adoptOtherInterestAreaPath:v47 notifyDelegate:1];
              [(id)v93[5] removeObject:v47];
            }
            id v44 = [v34 countByEnumeratingWithState:&v74 objects:v114 count:16];
          }
          while (v44);
        }

        uint64_t v30 = v63;
        id v29 = v65;
        if (v28 != v6) {
          [(GAXInterestAreaViewController *)self _makeInterestAreaPath:v6 adoptOtherInterestAreaPath:v28 notifyDelegate:1];
        }
        [(id)v93[5] removeObject:v28];
        id v38 = v28;
        id v28 = v6;
LABEL_83:

        goto LABEL_84;
      }
      if ([(id)v93[5] containsObject:v28])
      {
        [(GAXInterestAreaViewController *)self _makeInterestAreaPath:0 adoptOtherInterestAreaPath:v28 notifyDelegate:1];
        [(id)v93[5] removeObject:v28];
      }
LABEL_85:
      CGRect v31 = (char *)v31 + 1;
    }
    while (v31 != v29);
    id v29 = [v26 countByEnumeratingWithState:&v78 objects:v115 count:16];
  }
  while (v29);
LABEL_87:

  if (v28 != v6)
  {
    if (v61) {
      [(GAXInterestAreaViewController *)self _makeInterestAreaPath:v28 adoptOtherInterestAreaPath:v6 notifyDelegate:1];
    }
    else {
      [(GAXInterestAreaViewController *)self _addInterestAreaPath:v6 withParent:v28 notifyDelegate:1];
    }
  }

LABEL_93:
  id v48 = [(GAXInterestAreaViewController *)self _parentOfInterestAreaPath:v6];
  if (!v48) {
    id v48 = v6;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v49 = (id)v93[5];
  id v50 = [v49 countByEnumeratingWithState:&v66 objects:v112 count:16];
  if (v50)
  {
    uint64_t v51 = *(void *)v67;
    do
    {
      for (m = 0; m != v50; m = (char *)m + 1)
      {
        if (*(void *)v67 != v51) {
          objc_enumerationMutation(v49);
        }
        if (*(id *)(*((void *)&v66 + 1) + 8 * (void)m) == v6) {
          id v53 = 0;
        }
        else {
          id v53 = v48;
        }
        -[GAXInterestAreaViewController _makeInterestAreaPath:adoptOtherInterestAreaPath:notifyDelegate:](self, "_makeInterestAreaPath:adoptOtherInterestAreaPath:notifyDelegate:", v53);
      }
      id v50 = [v49 countByEnumeratingWithState:&v66 objects:v112 count:16];
    }
    while (v50);
  }

  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(&v104, 8);

  _Block_object_dispose(v110, 8);
LABEL_106:
}

- (void)_computeFinalPathForFingerPath:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GAXInterestAreaViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v8 getInterestAreaPathForFingerPath:v6 interestAreaViewController:self completion:v7];
  }
  else
  {
    id v10 = v7;
    id v9 = v6;
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

- (void)_interestAreaPathsDidChange
{
  id v3 = [(GAXInterestAreaViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 interestAreaPathsDidChangeForInterestAreaViewController:self];
  }
}

- (CGRect)_boundsForConstrainingFingerPath
{
  id v3 = [(GAXInterestAreaViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v3 boundsForConstrainingFingerPathInInterestAreaViewController:self];
    CGFloat x = v4;
    CGFloat y = v6;
    CGFloat width = v8;
    CGFloat height = v10;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)_enumerateInterestAreaPathsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(GAXInterestAreaViewController *)self orderedInterestAreaPaths];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_19D50;
  v7[3] = &unk_5D5B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (unint64_t)_numberOfInterestAreaPaths
{
  id v2 = [(GAXInterestAreaViewController *)self orderedInterestAreaPaths];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)_interestAreaPathAtIndex:(unint64_t)a3 parent:(id *)a4
{
  id v7 = [(GAXInterestAreaViewController *)self orderedInterestAreaPaths];
  id v8 = [v7 objectAtIndex:a3];

  if (a4)
  {
    *a4 = [(GAXInterestAreaViewController *)self _parentOfInterestAreaPath:v8];
  }

  return v8;
}

- (id)_parentOfInterestAreaPath:(id)a3
{
  id v4 = a3;
  id v5 = [(GAXInterestAreaViewController *)self interestAreaPathMapping];
  id v6 = [v5 parentOfPath:v4];

  return v6;
}

- (id)_childrenOfParentInterestAreaPath:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_174DC;
  uint64_t v19 = sub_174EC;
  id v20 = 0;
  id v5 = [(GAXInterestAreaViewController *)self interestAreaPathMapping];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_1A068;
  double v12 = &unk_5D5D8;
  id v6 = v4;
  id v13 = v6;
  double v14 = &v15;
  [v5 enumeratePathsAndParentsUsingBlock:&v9];

  if (v16[5])
  {
    id v7 = +[NSSet setWithSet:](NSSet, "setWithSet:", v9, v10, v11, v12);
  }
  else
  {
    id v7 = 0;
  }

  _Block_object_dispose(&v15, 8);

  return v7;
}

- (id)_interestAreaPathsIntersectingPath:(id)a3
{
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_174DC;
  uint64_t v17 = sub_174EC;
  id v18 = 0;
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_1A258;
  uint64_t v10 = &unk_5D4C0;
  id v4 = a3;
  id v11 = v4;
  double v12 = &v13;
  [(GAXInterestAreaViewController *)self _enumerateInterestAreaPathsUsingBlock:&v7];
  if (v14[5])
  {
    id v5 = +[NSSet setWithSet:](NSSet, "setWithSet:", v7, v8, v9, v10);
  }
  else
  {
    id v5 = 0;
  }

  _Block_object_dispose(&v13, 8);

  return v5;
}

- (void)_beginInterestAreaPathsUpdate
{
  id v3 = (char *)[(GAXInterestAreaViewController *)self interestAreaPathsUpdateCount] + 1;

  [(GAXInterestAreaViewController *)self setInterestAreaPathsUpdateCount:v3];
}

- (void)_endInterestAreaPathsUpdate
{
}

- (void)_endInterestAreaPathsUpdateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(GAXInterestAreaViewController *)self interestAreaPathsUpdateCount];
  if (v5)
  {
    unint64_t v6 = v5 - 1;
    [(GAXInterestAreaViewController *)self setInterestAreaPathsUpdateCount:v5 - 1];
    if (!v6)
    {
      [(GAXInterestAreaViewController *)self _updateBackgroundVisibilityAnimated:v3];
      if ([(GAXInterestAreaViewController *)self shouldNotifyDelegateOfInterestAreaPathsChange])
      {
        [(GAXInterestAreaViewController *)self _interestAreaPathsDidChange];
        [(GAXInterestAreaViewController *)self setShouldNotifyDelegateOfInterestAreaPathsChange:0];
      }
    }
  }

  [(GAXInterestAreaViewController *)self _archiveInterestAreaPathsForStorage];
}

- (void)_addInterestAreaPath:(id)a3 withParent:(id)a4 notifyDelegate:(BOOL)a5
{
}

- (void)_addInterestAreaPath:(id)a3 withParent:(id)a4 notifyInterestAreaView:(BOOL)a5 notifyDelegate:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v19 = a3;
  id v10 = a4;
  id v11 = [(GAXInterestAreaViewController *)self interestAreaPathMapping];
  unsigned __int8 v12 = [v11 containsPath:v19];

  if (v12) {
    goto LABEL_9;
  }
  if (!v7)
  {
    uint64_t v17 = [(GAXInterestAreaViewController *)self interestAreaPathMapping];
    [v17 addPath:v19 withParentPath:v10];

    id v18 = [(GAXInterestAreaViewController *)self orderedInterestAreaPaths];
    [v18 addObject:v19];

    if (!v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [(GAXInterestAreaViewController *)self _beginInterestAreaPathsUpdate];
  uint64_t v13 = [(GAXInterestAreaViewController *)self interestAreaPathMapping];
  [v13 addPath:v19 withParentPath:v10];

  double v14 = [(GAXInterestAreaViewController *)self orderedInterestAreaPaths];
  [v14 addObject:v19];

  uint64_t v15 = [(GAXInterestAreaViewController *)self interestAreaView];
  id v16 = [(GAXInterestAreaViewController *)self orderedInterestAreaPaths];
  objc_msgSend(v15, "insertInterestAreaPathAtIndex:", (char *)objc_msgSend(v16, "count") - 1);

  [(GAXInterestAreaViewController *)self _updateBackgroundVisibilityAnimated:0];
  if (v6) {
LABEL_6:
  }
    [(GAXInterestAreaViewController *)self setShouldNotifyDelegateOfInterestAreaPathsChange:1];
LABEL_7:
  if (v7) {
    [(GAXInterestAreaViewController *)self _endInterestAreaPathsUpdate];
  }
LABEL_9:
}

- (void)_makeInterestAreaPath:(id)a3 adoptOtherInterestAreaPath:(id)a4 notifyDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  id v8 = a4;
  id v9 = [(GAXInterestAreaViewController *)self interestAreaPathMapping];
  if ([v9 containsPath:v8])
  {
    [(GAXInterestAreaViewController *)self _beginInterestAreaPathsUpdate];
    [v9 replaceParentOfPath:v8 withPath:v10];
    if (v5) {
      [(GAXInterestAreaViewController *)self setShouldNotifyDelegateOfInterestAreaPathsChange:1];
    }
    [(GAXInterestAreaViewController *)self _endInterestAreaPathsUpdate];
  }
}

- (void)_removeInterestAreaPathAtIndices:(id)a3 notifyDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(GAXInterestAreaViewController *)self interestAreaPathMapping];
  id v8 = [(GAXInterestAreaViewController *)self orderedInterestAreaPaths];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  id v17 = 0;
  id v17 = [v8 count];
  [(GAXInterestAreaViewController *)self _beginInterestAreaPathsUpdate];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1A77C;
  v12[3] = &unk_5D600;
  uint64_t v15 = v16;
  id v9 = v8;
  id v13 = v9;
  id v10 = v7;
  id v14 = v10;
  [v6 enumerateIndexesWithOptions:2 usingBlock:v12];
  id v11 = [(GAXInterestAreaViewController *)self interestAreaView];
  [v11 deleteInterestAreaPathsAtIndices:v6];

  if (v4) {
    [(GAXInterestAreaViewController *)self setShouldNotifyDelegateOfInterestAreaPathsChange:1];
  }
  [(GAXInterestAreaViewController *)self _endInterestAreaPathsUpdate];

  _Block_object_dispose(v16, 8);
}

- (int)_backgroundStyleForEditing:(BOOL)a3
{
  int result = [(GAXInterestAreaViewController *)self allowsDimmingInterestAreaPaths];
  if (result)
  {
    if (a3) {
      return 2;
    }
    else {
      return [(GAXInterestAreaViewController *)self numberOfInterestAreaPathsForInterestAreaView:0] != 0;
    }
  }
  return result;
}

- (int)_backgroundStyleForCurrentState
{
  BOOL v3 = [(GAXInterestAreaViewController *)self isEditing];

  return [(GAXInterestAreaViewController *)self _backgroundStyleForEditing:v3];
}

- (void)_updateBackgroundVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(GAXInterestAreaViewController *)self isViewLoaded])
  {
    id v5 = [(GAXInterestAreaViewController *)self interestAreaView];
    objc_msgSend(v5, "setBackgroundStyle:animated:", -[GAXInterestAreaViewController _backgroundStyleForCurrentState](self, "_backgroundStyleForCurrentState"), v3);
  }
}

- (id)_referenceViewForConvertingFromAndToWindowCoordinateSystem
{
  BOOL v3 = [(GAXInterestAreaViewController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v3 referenceViewForConvertingFromAndToWindowCoordinateSystemForInterestAreaViewController:self], (id v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([(GAXInterestAreaViewController *)self isViewLoaded])
    {
      id v5 = [(GAXInterestAreaViewController *)self view];
      id v4 = [v5 window];

      if (v4) {
        id v4 = v5;
      }
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (id)_orientationAgnosticPathsFromOrientationAwarePaths:(id)a3 shouldConsolidateOrientationsOnSameAxis:(BOOL)a4
{
  id v6 = a3;
  if ([(GAXInterestAreaViewController *)self isViewLoaded]
    && ([(GAXInterestAreaViewController *)self view],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        [v7 window],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    id v9 = [(GAXInterestAreaViewController *)self _referenceViewForConvertingFromAndToWindowCoordinateSystem];
    id v10 = [v9 window];
    id v11 = +[UIScreen mainScreen];
    unsigned __int8 v12 = [v11 coordinateSpace];
    id v13 = +[UIScreen mainScreen];
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    uint64_t v22 = +[UIScreen mainScreen];
    double v23 = [v22 fixedCoordinateSpace];
    objc_msgSend(v12, "convertRect:toCoordinateSpace:", v23, v15, v17, v19, v21);
    uint64_t v25 = v24;
    uint64_t v27 = v26;

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1ABE4;
    v32[3] = &unk_5D628;
    id v33 = v9;
    id v34 = v10;
    BOOL v38 = a4;
    id v35 = [(GAXInterestAreaViewController *)self interfaceOrientation];
    uint64_t v36 = v25;
    uint64_t v37 = v27;
    id v28 = v10;
    id v29 = v9;
    uint64_t v30 = [v6 pathMappingByTransformingPointsInPathsUsingBlock:v32];
  }
  else
  {
    uint64_t v30 = 0;
  }

  return v30;
}

- (void)_archiveInterestAreaPathsForStorage
{
  id v3 = [(GAXInterestAreaViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 archiveInterestAreaPathsForStorageInterestAreaViewController:self];
  }
}

- (void)_applyInterestAreaPathsForStorageAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(GAXInterestAreaViewController *)self isViewLoaded])
  {
    id v5 = [(GAXInterestAreaViewController *)self view];
    id v6 = [v5 window];

    if (v6)
    {
      BOOL v7 = [(GAXInterestAreaViewController *)self cachedInterestAreaPathsForStorage];
      if (v7)
      {
        id v8 = [(GAXInterestAreaViewController *)self _referenceViewForConvertingFromAndToWindowCoordinateSystem];
        id v9 = [v8 window];
        id v10 = +[UIScreen mainScreen];
        id v11 = [v10 coordinateSpace];
        unsigned __int8 v12 = +[UIScreen mainScreen];
        [v12 bounds];
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v21 = +[UIScreen mainScreen];
        uint64_t v22 = [v21 fixedCoordinateSpace];
        objc_msgSend(v11, "convertRect:toCoordinateSpace:", v22, v14, v16, v18, v20);
        uint64_t v24 = v23;
        uint64_t v26 = v25;

        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1AEBC;
        v30[3] = &unk_5D650;
        id v32 = v8;
        id v33 = [(GAXInterestAreaViewController *)self interfaceOrientation];
        uint64_t v34 = v24;
        uint64_t v35 = v26;
        id v31 = v9;
        id v27 = v8;
        id v28 = v9;
        id v29 = [v7 pathMappingByTransformingPointsInPathsUsingBlock:v30];
        [(GAXInterestAreaViewController *)self setInterestAreaPaths:v29 animated:v3];
        [(GAXInterestAreaViewController *)self setCachedInterestAreaPathsForStorage:0];
      }
    }
  }
}

- (void)_applyInterestAreaPathsForStorage
{
}

- (CGPoint)_locationForTouch:(id)a3
{
  id v4 = a3;
  id v5 = [(GAXInterestAreaViewController *)self interestAreaView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  [(GAXInterestAreaViewController *)self _boundsForConstrainingFingerPath];
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  if (CGRectIsNull(v18)
    || (v19.origin.CGFloat x = x, v19.origin.y = y, v19.size.width = width, v19.size.height = height, CGRectIsEmpty(v19)))
  {
    double ProjectionToFrame = v7;
    double v15 = v9;
  }
  else
  {
    double ProjectionToFrame = GAX_CGPointGetProjectionToFrame(v7, v9, x, y, width, height);
  }
  result.CGFloat y = v15;
  result.CGFloat x = ProjectionToFrame;
  return result;
}

- (BOOL)_interestAreaPath:(id)a3 shouldShowResizingKnobAtPosition:(unint64_t)a4
{
  id v6 = a3;
  double v7 = v6;
  CGFloat x = CGPointZero.x;
  CGFloat y = CGPointZero.y;
  switch(a4)
  {
    case 1uLL:
      [v6 topLeftPointOnPath];
      goto LABEL_6;
    case 2uLL:
      [v6 topRightPointOnPath];
      goto LABEL_6;
    case 4uLL:
      [v6 bottomRightPointOnPath];
      goto LABEL_6;
    case 8uLL:
      [v6 bottomLeftPointOnPath];
LABEL_6:
      CGFloat x = v10;
      CGFloat y = v11;
      break;
    default:
      break;
  }
  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1B1B8;
  v15[3] = &unk_5D678;
  id v12 = v7;
  CGFloat v18 = x;
  CGFloat v19 = y;
  id v16 = v12;
  double v17 = &v20;
  [(GAXInterestAreaViewController *)self _enumerateInterestAreaPathsUsingBlock:v15];
  char v13 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (void)_didRecordTouchEventAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v6 = [(GAXInterestAreaViewController *)self interestAreaView];
  if (![(GAXInterestAreaViewController *)self outOfBoundsDrawingEnabled])
  {
    [v6 bounds];
    v12.CGFloat x = x;
    v12.CGFloat y = y;
    if (!CGRectContainsPoint(v13, v12))
    {
      double v7 = [(GAXInterestAreaViewController *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        long long v8 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
        long long v10 = *(_OWORD *)&UIEdgeInsetsZero.top;
        long long v11 = v8;
        double v9 = [v7 viewToCoverWithOutOfBoundsDrawingForInterestAreaViewWithController:self edgeInsets:&v10];
        if (v9)
        {
          objc_msgSend(v6, "adjustOutOfBoundsDrawingToCoverView:edgeInsets:", v9, v10, v11);
          [(GAXInterestAreaViewController *)self setOutOfBoundsDrawingEnabled:1];
        }
      }
    }
  }
}

- (void)_didFinishRecordingCurrentSequenceOfTouchEvents
{
  if ([(GAXInterestAreaViewController *)self outOfBoundsDrawingEnabled])
  {
    BOOL v3 = [(GAXInterestAreaViewController *)self interestAreaView];
    objc_msgSend(v3, "adjustOutOfBoundsDrawingToCoverView:edgeInsets:", 0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

    [(GAXInterestAreaViewController *)self setOutOfBoundsDrawingEnabled:0];
  }

  [(GAXInterestAreaViewController *)self setCurrentTouch:0];
}

- (id)interestAreaView:(id)a3 interestAreaPathAtIndex:(unint64_t)a4
{
  if ([(GAXInterestAreaViewController *)self _numberOfInterestAreaPaths] <= a4)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [(GAXInterestAreaViewController *)self _interestAreaPathAtIndex:a4 parent:0];
  }

  return v6;
}

- (unint64_t)numberOfDynamicInterestAreaPathsForInterestAreaView:(id)a3
{
  id v4 = a3;
  id v5 = [(GAXInterestAreaViewController *)self fingerPath];
  if (v5)
  {

LABEL_4:
    id v6 = &dword_0 + 1;
    goto LABEL_5;
  }
  id v6 = [(GAXInterestAreaViewController *)self pathInterpolator];

  if (v6) {
    goto LABEL_4;
  }
LABEL_5:

  return (unint64_t)v6;
}

- (id)interestAreaView:(id)a3 dynamicInterestAreaPathAtIndex:(unint64_t)a4
{
  id v5 = [(GAXInterestAreaViewController *)self pathInterpolator];
  if (v5)
  {
    id v6 = [(GAXInterestAreaViewController *)self currentInterpolatedPath];
    if (!v6)
    {
      [(GAXInterestAreaViewController *)self snapAnimationProgress];
      id v6 = objc_msgSend(v5, "interpolatedPathForProgress:");
      [(GAXInterestAreaViewController *)self setCurrentInterpolatedPath:v6];
    }
  }
  else
  {
    id v6 = [(GAXInterestAreaViewController *)self fingerPath];
  }

  return v6;
}

- (BOOL)interestAreaView:(id)a3 shouldAddCloseButtonForInterestAreaPathAtIndex:(unint64_t)a4
{
  unint64_t v6 = [(GAXInterestAreaViewController *)self _numberOfInterestAreaPaths];
  if (a4 + 1 < v6
    || (unint64_t v7 = v6,
        [(GAXInterestAreaViewController *)self pathInterpolator],
        long long v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        BOOL result = 0,
        v7 > a4)
    && !v8)
  {
    uint64_t v11 = 0;
    id v10 = [(GAXInterestAreaViewController *)self _interestAreaPathAtIndex:a4 parent:&v11];
    return v11 == 0;
  }
  return result;
}

- (void)interestAreaView:(id)a3 didActivateCloseButtonForInterestAreaPathAtIndex:(unint64_t)a4
{
  if ([(GAXInterestAreaViewController *)self _numberOfInterestAreaPaths] > a4)
  {
    unint64_t v6 = objc_opt_new();
    [(GAXInterestAreaViewController *)self _interestAreaPathAtIndex:a4 parent:0];
    double v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    uint64_t v11 = sub_1B6A0;
    CGPoint v12 = &unk_5D6A0;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v6;
    id v7 = v6;
    id v8 = v13;
    [(GAXInterestAreaViewController *)self _enumerateInterestAreaPathsUsingBlock:&v9];
    objc_msgSend(v7, "addIndex:", a4, v9, v10, v11, v12);
    [(GAXInterestAreaViewController *)self _removeInterestAreaPathAtIndices:v7 notifyDelegate:1];
  }
}

- (unint64_t)interestAreaView:(id)a3 visibleKnobPositionsForInterestAreaPathAtIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([(GAXInterestAreaViewController *)self _numberOfInterestAreaPaths] <= a4
    || [(GAXInterestAreaViewController *)self interestAreaView:v6 shouldDisableSmartLayoutRelativeToEdgesForInterestAreaPathAtIndex:a4])
  {
    unint64_t v7 = 0;
  }
  else
  {
    id v8 = [(GAXInterestAreaViewController *)self _interestAreaPathAtIndex:a4 parent:0];
    uint64_t v9 = 0;
    unint64_t v7 = 0;
    do
    {
      uint64_t v10 = qword_45898[v9];
      if ([(GAXInterestAreaViewController *)self _interestAreaPath:v8 shouldShowResizingKnobAtPosition:v10])
      {
        uint64_t v11 = v10;
      }
      else
      {
        uint64_t v11 = 0;
      }
      v7 |= v11;
      ++v9;
    }
    while (v9 != 4);
  }
  return v7;
}

- (void)interestAreaView:(id)a3 willBeginMovingResizingKnobAtPosition:(unint64_t)a4 forInterestAreaPathAtIndex:(unint64_t)a5
{
}

- (void)interestAreaView:(id)a3 resizingKnobAtPosition:(unint64_t)a4 wasMovedToPoint:(CGPoint)a5 forInterestAreaPathAtIndex:(unint64_t)a6 constrainedResizingKnobCenter:(CGPoint *)a7
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v13 = a3;
  if ([(GAXInterestAreaViewController *)self _numberOfInterestAreaPaths] > a6)
  {
    id v14 = [(GAXInterestAreaViewController *)self _interestAreaPathAtIndex:a6 parent:0];
    double v15 = v14;
    double v17 = CGPointZero.x;
    CGFloat v16 = CGPointZero.y;
    double horizontal = UIOffsetZero.horizontal;
    double vertical = UIOffsetZero.vertical;
    double v86 = x;
    double v88 = y;
    double v20 = v16;
    double v21 = CGPointZero.x;
    switch(a4)
    {
      case 1uLL:
        [v14 topLeftPointOnPath];
        double v21 = v22;
        double v20 = v23;
        [v15 bottomRightPoint];
        double v17 = v24;
        double vertical = -1.0;
        double horizontal = -1.0;
        break;
      case 2uLL:
        [v14 topRightPointOnPath];
        double v21 = v25;
        double v20 = v26;
        [v15 bottomLeftPoint];
        double v17 = v27;
        double horizontal = 1.0;
        double vertical = -1.0;
        break;
      case 4uLL:
        [v14 bottomRightPointOnPath];
        double v21 = v28;
        double v20 = v29;
        [v15 topLeftPoint];
        double v17 = v30;
        double vertical = 1.0;
        double horizontal = 1.0;
        break;
      case 8uLL:
        [v14 bottomLeftPointOnPath];
        double v21 = v31;
        double v20 = v32;
        [v15 topRightPoint];
        double v17 = v33;
        double horizontal = -1.0;
        double vertical = 1.0;
        break;
      default:
        break;
    }
    double v90 = v17;
    double v91 = v16;
    uint64_t v34 = [(GAXInterestAreaViewController *)self styleProvider];
    [v34 minimumSizeForInterestAreaPath];
    double v36 = v35;
    double v38 = v37;

    double v83 = v21 - v17;
    double v39 = vabdd_f64(v86, v17);
    double v40 = vabdd_f64(v88, v91);
    if ((v86 - v17) * (v21 - v17) < 0.0 || v39 < v36) {
      double v42 = v17 + horizontal * v36;
    }
    else {
      double v42 = v86;
    }
    double v43 = v20 - v91;
    if ((v88 - v91) * (v20 - v91) < 0.0 || v40 < v38) {
      double v45 = v91 + vertical * v38;
    }
    else {
      double v45 = v88;
    }
    [v13 contentsBounds];
    CGFloat v47 = v46;
    CGFloat v49 = v48;
    CGFloat v76 = v50;
    double v51 = v42;
    CGFloat v53 = v52;
    CGFloat rect = v52;
    double ProjectionToFrame = GAX_CGPointGetProjectionToFrame(v51, v45, v47, v48, v52, v50);
    double v56 = v55;
    [v15 bounds];
    CGFloat v78 = v58;
    CGFloat v79 = v57;
    CGFloat v87 = v59;
    CGFloat v89 = v60;
    v96.origin.CGFloat x = v47;
    v96.origin.CGFloat y = v49;
    v96.size.CGFloat width = v53;
    v96.size.CGFloat height = v76;
    CGFloat v82 = CGRectGetMinX(v96) - v90;
    v97.origin.CGFloat x = v47;
    v97.origin.CGFloat y = v49;
    v97.size.CGFloat width = rect;
    v97.size.CGFloat height = v76;
    CGFloat v81 = CGRectGetMinY(v97) - v91;
    v98.origin.CGFloat x = v47;
    v98.origin.CGFloat y = v49;
    v98.size.CGFloat width = rect;
    v98.size.CGFloat height = v76;
    CGFloat v80 = CGRectGetMaxX(v98) - v90;
    v99.origin.CGFloat x = v47;
    v99.origin.CGFloat y = v49;
    v99.size.CGFloat width = rect;
    v99.size.CGFloat height = v76;
    CGFloat recta = CGRectGetMaxY(v99) - v91;
    v100.origin.CGFloat x = v79;
    v100.size.CGFloat width = v89;
    v100.origin.CGFloat y = v87;
    v100.size.CGFloat height = v78;
    CGFloat MinX = CGRectGetMinX(v100);
    v101.size.CGFloat width = v89;
    CGFloat v77 = MinX - v90;
    v101.origin.CGFloat x = v79;
    v101.origin.CGFloat y = v87;
    v101.size.CGFloat height = v78;
    CGFloat v75 = CGRectGetMinY(v101) - v91;
    v102.origin.CGFloat x = v79;
    v102.origin.CGFloat y = v87;
    v102.size.CGFloat width = v89;
    v102.size.CGFloat height = v78;
    CGFloat v74 = CGRectGetMaxX(v102) - v90;
    v103.origin.CGFloat x = v79;
    v103.origin.CGFloat y = v87;
    v103.size.CGFloat width = v89;
    v103.size.CGFloat height = v78;
    CGFloat MaxY = CGRectGetMaxY(v103);
    uint64_t v63 = 0;
    *(CGFloat *)v95 = v82;
    *(CGFloat *)&v95[1] = v81;
    *(CGFloat *)&v95[2] = v77;
    *(CGFloat *)&v95[3] = v75;
    *(CGFloat *)&v95[4] = v80;
    *(CGFloat *)&v95[5] = recta;
    *(CGFloat *)&v95[6] = v74;
    *(double *)&v95[7] = MaxY - v91;
    char v64 = 1;
    do
    {
      char v65 = v64;
      long long v66 = (double *)&v95[4 * v63];
      double v67 = v66[2];
      if (v67 != 0.0)
      {
        double v68 = horizontal * (v90 + *v66 / v67 * v83);
        if (v68 >= horizontal * ProjectionToFrame) {
          double v68 = horizontal * ProjectionToFrame;
        }
        double ProjectionToFrame = horizontal * v68;
      }
      double v69 = v66[3];
      if (v69 != 0.0)
      {
        double v70 = vertical * (v91 + v66[1] / v69 * v43);
        if (v70 >= vertical * v56) {
          double v70 = vertical * v56;
        }
        double v56 = vertical * v70;
      }
      char v64 = 0;
      uint64_t v63 = 1;
    }
    while ((v65 & 1) != 0);
    if (a7)
    {
      a7->CGFloat x = ProjectionToFrame;
      a7->CGFloat y = v56;
    }
    CGFloat v71 = (ProjectionToFrame - v90) / v83;
    CGFloat v72 = (v56 - v91) / v43;
    long long v73 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v94.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v94.c = v73;
    *(_OWORD *)&v94.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v93.a = *(_OWORD *)&v94.a;
    *(_OWORD *)&v93.c = v73;
    *(_OWORD *)&v93.tCGFloat x = *(_OWORD *)&v94.tx;
    CGAffineTransformTranslate(&v94, &v93, v90 * (1.0 - v71), v91 * (1.0 - v72));
    CGAffineTransform v92 = v94;
    CGAffineTransformScale(&v93, &v92, v71, v72);
    CGAffineTransform v94 = v93;
    [v15 applyTransform:&v93];
    [v13 reloadFrameOfInterestAreaPathAtIndex:a6];
    [v13 reloadAccessoryControlsForInterestAreaPathAtIndex:a6];
  }
}

- (void)interestAreaView:(id)a3 didFinishMovingResizingKnobAtPosition:(unint64_t)a4 forInterestAreaPathAtIndex:(unint64_t)a5
{
}

- (void)interestAreaView:(id)a3 willBeginMovingInterestAreaPathAtIndex:(unint64_t)a4
{
  if ([(GAXInterestAreaViewController *)self _numberOfInterestAreaPaths] > a4)
  {
    id v6 = [(GAXInterestAreaViewController *)self _interestAreaPathAtIndex:a4 parent:0];
    id v7 = [(GAXInterestAreaViewController *)self _interestAreaPathsIntersectingPath:v6];

    [(GAXInterestAreaViewController *)self setOldInterestAreaPathsIntersectingWithMovingPath:v7];
  }
}

- (void)interestAreaView:(id)a3 interestAreaPathAtIndex:(unint64_t)a4 wasMovedWithTranslation:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  if ([(GAXInterestAreaViewController *)self _numberOfInterestAreaPaths] > a4)
  {
    uint64_t v10 = [(GAXInterestAreaViewController *)self _interestAreaPathAtIndex:a4 parent:0];
    [v10 bounds];
    CGFloat v12 = v11;
    CGFloat v44 = v14;
    CGFloat v45 = v13;
    CGFloat v16 = v15;
    CGFloat v42 = v15;
    [v9 contentsBounds];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v49 = v21;
    CGFloat v24 = v23;
    [(GAXInterestAreaViewController *)self lastTranslationAppliedToPathBeingDragged];
    double v47 = x;
    double v50 = y - v26;
    double v51 = x - v25;
    v53.origin.double x = v18;
    v53.origin.double y = v20;
    CGFloat v43 = v20;
    v53.size.CGFloat width = v22;
    v53.size.CGFloat height = v24;
    double v48 = y;
    double MaxX = CGRectGetMaxX(v53);
    v54.origin.double x = v12;
    v54.origin.double y = v45;
    v54.size.CGFloat width = v44;
    v54.size.CGFloat height = v16;
    double v28 = MaxX - CGRectGetMaxX(v54);
    if (v51 >= v28) {
      double v29 = v28;
    }
    else {
      double v29 = v51;
    }
    v55.origin.double x = v18;
    v55.origin.double y = v20;
    v55.size.CGFloat width = v49;
    v55.size.CGFloat height = v24;
    double MinX = CGRectGetMinX(v55);
    v56.origin.double x = v12;
    v56.origin.double y = v45;
    v56.size.CGFloat width = v44;
    v56.size.CGFloat height = v42;
    double v31 = MinX - CGRectGetMinX(v56);
    if (v29 >= v31) {
      double v31 = v29;
    }
    double v46 = v31;
    v57.origin.double x = v18;
    v57.origin.double y = v43;
    v57.size.CGFloat width = v49;
    v57.size.CGFloat height = v24;
    double MaxY = CGRectGetMaxY(v57);
    v58.origin.double x = v12;
    v58.origin.double y = v45;
    v58.size.CGFloat width = v44;
    v58.size.CGFloat height = v42;
    double v33 = MaxY - CGRectGetMaxY(v58);
    CGFloat v34 = v49;
    if (v50 >= v33) {
      double v35 = v33;
    }
    else {
      double v35 = v50;
    }
    CGFloat v36 = v18;
    CGFloat v37 = v43;
    CGFloat v38 = v24;
    double MinY = CGRectGetMinY(*(CGRect *)(&v34 - 2));
    v59.origin.double x = v12;
    v59.origin.double y = v45;
    v59.size.CGFloat width = v44;
    v59.size.CGFloat height = v42;
    double v40 = MinY - CGRectGetMinY(v59);
    if (v35 >= v40) {
      double v41 = v35;
    }
    else {
      double v41 = v40;
    }
    -[GAXInterestAreaViewController setLastTranslationAppliedToPathBeingDragged:](self, "setLastTranslationAppliedToPathBeingDragged:", v47 + v46 - v51, v48 + v41 - v50, *(void *)&v12);
    CGAffineTransformMakeTranslation(&v52, v46, v41);
    [v10 applyTransform:&v52];
    [v9 reloadFrameOfInterestAreaPathAtIndex:a4];
    [v9 reloadAccessoryControlsForInterestAreaPathAtIndex:a4];
  }
}

- (void)interestAreaView:(id)a3 didFinishMovingInterestAreaPathAtIndex:(unint64_t)a4
{
  id v7 = a3;
  if ([(GAXInterestAreaViewController *)self _numberOfInterestAreaPaths] > a4)
  {
    id v6 = [(GAXInterestAreaViewController *)self _interestAreaPathAtIndex:a4 parent:0];
    [(GAXInterestAreaViewController *)self _updateInterestAreaPathsWithPath:v6 updatedInterestAreaPathAlreadyAdded:1];

    [(GAXInterestAreaViewController *)self setOldInterestAreaPathsIntersectingWithMovingPath:0];
    -[GAXInterestAreaViewController setLastTranslationAppliedToPathBeingDragged:](self, "setLastTranslationAppliedToPathBeingDragged:", CGPointZero.x, CGPointZero.y);
    [v7 reloadAllAccessoryControls];
  }
}

- (double)scaleForSpecialControlsInInterestAreaView:(id)a3
{
  id v4 = [(GAXInterestAreaViewController *)self delegate];
  double v5 = 1.0;
  if (objc_opt_respondsToSelector())
  {
    [v4 scaleForSpecialControlsInInterestAreaViewController:self];
    double v5 = v6;
  }

  return v5;
}

- (BOOL)interestAreaViewIsAccessibilityElement:(id)a3
{
  return 0;
}

- (BOOL)interestAreaView:(id)a3 shouldDisableSmartLayoutRelativeToEdgesForInterestAreaPathAtIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([(GAXInterestAreaViewController *)self isEditing])
  {
    BOOL v7 = 0;
  }
  else
  {
    unint64_t v8 = [(GAXInterestAreaViewController *)self numberOfInterestAreaPathsForInterestAreaView:v6];
    if (a4) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = v8 == 1;
    }
    BOOL v7 = v9;
  }

  return v7;
}

- (GAXInterestAreaViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GAXInterestAreaViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)allowsDimmingInterestAreaPaths
{
  return self->_allowsDimmingInterestAreaPaths;
}

- (BOOL)backgroundShouldCoverEverything
{
  return self->_backgroundShouldCoverEverything;
}

- (UITouch)currentTouch
{
  return self->_currentTouch;
}

- (void)setCurrentTouch:(id)a3
{
}

- (UIBezierPath)fingerPath
{
  return self->_fingerPath;
}

- (void)setFingerPath:(id)a3
{
}

- (GAXPathInterpolator)pathInterpolator
{
  return self->_pathInterpolator;
}

- (void)setPathInterpolator:(id)a3
{
}

- (double)snapAnimationDidStartTimeInterval
{
  return self->_snapAnimationDidStartTimeInterval;
}

- (void)setSnapAnimationDidStartTimeInterval:(double)a3
{
  self->_snapAnimationDidStartTimeInterval = a3;
}

- (UIBezierPath)currentInterpolatedPath
{
  return self->_currentInterpolatedPath;
}

- (void)setCurrentInterpolatedPath:(id)a3
{
}

- (void)setInterestAreaPathMapping:(id)a3
{
}

- (void)setOrderedInterestAreaPaths:(id)a3
{
}

- (GAXStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (GAXPathMapping)cachedInterestAreaPathsForStorage
{
  return self->_cachedInterestAreaPathsForStorage;
}

- (void)setCachedInterestAreaPathsForStorage:(id)a3
{
}

- (NSSet)oldInterestAreaPathsIntersectingWithMovingPath
{
  return self->_oldInterestAreaPathsIntersectingWithMovingPath;
}

- (void)setOldInterestAreaPathsIntersectingWithMovingPath:(id)a3
{
}

- (unint64_t)interestAreaPathsUpdateCount
{
  return self->_interestAreaPathsUpdateCount;
}

- (void)setInterestAreaPathsUpdateCount:(unint64_t)a3
{
  self->_interestAreaPathsUpdateCount = a3;
}

- (BOOL)shouldNotifyDelegateOfInterestAreaPathsChange
{
  return self->_shouldNotifyDelegateOfInterestAreaPathsChange;
}

- (void)setShouldNotifyDelegateOfInterestAreaPathsChange:(BOOL)a3
{
  self->_shouldNotifyDelegateOfInterestAreaPathsChange = a3;
}

- (CGPoint)lastTranslationAppliedToPathBeingDragged
{
  double x = self->_lastTranslationAppliedToPathBeingDragged.x;
  double y = self->_lastTranslationAppliedToPathBeingDragged.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastTranslationAppliedToPathBeingDragged:(CGPoint)a3
{
  self->_lastTranslationAppliedToPathBeingDragged = a3;
}

- (BOOL)outOfBoundsDrawingEnabled
{
  return self->_outOfBoundsDrawingEnabled;
}

- (void)setOutOfBoundsDrawingEnabled:(BOOL)a3
{
  self->_outOfBoundsDrawingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldInterestAreaPathsIntersectingWithMovingPath, 0);
  objc_storeStrong((id *)&self->_cachedInterestAreaPathsForStorage, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_orderedInterestAreaPaths, 0);
  objc_storeStrong((id *)&self->_interestAreaPathMapping, 0);
  objc_storeStrong((id *)&self->_currentInterpolatedPath, 0);
  objc_storeStrong((id *)&self->_pathInterpolator, 0);
  objc_storeStrong((id *)&self->_fingerPath, 0);
  objc_storeStrong((id *)&self->_currentTouch, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end