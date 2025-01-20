@interface AXPIFingerController
- (AXAssertionCoordinator)suppressVisualsAssertionCoodinator;
- (AXPIFingerAppearanceDelegate)appearanceDelegate;
- (AXPIFingerController)init;
- (AXPIFingerController)initWithDisplayUUID:(id)a3;
- (BOOL)_isInUpdateBlock;
- (BOOL)isPerformingGesture;
- (BOOL)isPinchEnabled;
- (BOOL)moveFingersTo3DPoints:(id)a3;
- (BOOL)moveFingersToPoints:(id)a3;
- (BOOL)shouldAddRealEventFlag;
- (CGPoint)_fingerLocationFromSceneReferencePoint:(CGPoint)a3;
- (CGPoint)_sceneReferencePointFromFingerLocation:(CGPoint)a3;
- (CGPoint)midpointForFingers;
- (CGPoint)midpointOfStartingFingersForGesture:(id)a3;
- (CGRect)fixedReferenceBounds;
- (CGRect)rectForFingersAtPoints:(id)a3;
- (NSArray)fingerModels;
- (UIView)fingerContainerView;
- (UIWindow)fixedReferenceWindow;
- (id)_eventTouchInfoForFinger:(id)a3;
- (id)_eventTouchInfoForFingerLocation:(CGPoint)a3 force:(double)a4;
- (id)_handleStartingFingersForGesture:(id)a3 animated:(BOOL)a4 startPointForAnimation:(CGPoint)a5 midpoint:(CGPoint *)a6 showFingers:(BOOL)a7;
- (id)_pointStringsFromFingers;
- (id)_showStartingFingersForGesture:(id)a3 animated:(BOOL)a4 startPointForAnimation:(CGPoint)a5;
- (id)_touchInfosByIdentifierForPressedFingers;
- (id)acquireAssertionToSuppressVisualsWithReason:(id)a3;
- (id)fingerModelAtPoint:(CGPoint)a3;
- (id)legacyLiftFingersUp;
- (id)legacyPressFingersDown;
- (unint64_t)_fingerIdentifierForIndex:(unint64_t)a3;
- (unint64_t)numberOfFingers;
- (unint64_t)senderID;
- (void)_endGestureWithSuccess:(BOOL)a3;
- (void)_interruptGestureIfNeeded;
- (void)_performGesture:(id)a3 shouldShowFingers:(BOOL)a4 completion:(id)a5;
- (void)_replayEventAtIndex:(unint64_t)a3 inGesture:(id)a4 allFingerIdentifiers:(id)a5;
- (void)_sendMoveEventIfNeededForFingerModel:(id)a3 atIndex:(unint64_t)a4;
- (void)_showFingerModels:(id)a3 animated:(BOOL)a4 startPointForAnimation:(CGPoint)a5 shouldShowPinchChain:(BOOL)a6 shouldReuseFingers:(BOOL)a7;
- (void)animateToTapWithDuration:(double)a3;
- (void)assertionCoordinator:(id)a3 assertionsDidBecomeActive:(BOOL)a4;
- (void)beginUpdates;
- (void)cancelCircularProgressAnimation;
- (void)cancelGesture;
- (void)clearAllFingersAnimated:(BOOL)a3 endPointForAnimation:(CGPoint)a4;
- (void)dealloc;
- (void)didUpdateForceForFingerModel:(id)a3;
- (void)didUpdateLocationForFingerModel:(id)a3;
- (void)didUpdatePressStateForFingerModel:(id)a3;
- (void)didUpdateSelectedStateForFingerModel:(id)a3;
- (void)didUpdateShapeForFingerModel:(id)a3;
- (void)endUpdates;
- (void)enumerateFingersUsingBlock:(id)a3;
- (void)liftFingersUpAnimated:(BOOL)a3;
- (void)liftFingersUpAnimated:(BOOL)a3 sendTouchEvents:(BOOL)a4;
- (void)performCircularProgressAnimationOnFingersWithDuration:(double)a3 completion:(id)a4;
- (void)performDownAtPoint:(CGPoint)a3;
- (void)performGesture:(id)a3;
- (void)performGesture:(id)a3 completion:(id)a4;
- (void)performMoveToPoint:(CGPoint)a3;
- (void)performUpAtPoint:(CGPoint)a3;
- (void)performWithoutPreparingGesture:(id)a3 completion:(id)a4;
- (void)pressFingersDownAnimated:(BOOL)a3;
- (void)pressFingersDownAnimated:(BOOL)a3 sendTouchEvents:(BOOL)a4;
- (void)resetPinchFingers;
- (void)setAppearanceDelegate:(id)a3;
- (void)setFixedReferenceBounds:(CGRect)a3;
- (void)setFixedReferenceWindow:(id)a3;
- (void)setSenderID:(unint64_t)a3;
- (void)setShouldAddRealEventFlag:(BOOL)a3;
- (void)showFingerModels:(id)a3 animated:(BOOL)a4 startPointForAnimation:(CGPoint)a5;
- (void)showPinchFingersAnimated:(BOOL)a3 midpoint:(CGPoint)a4;
- (void)showStartingFingersForGesture:(id)a3;
- (void)showStartingFingersForGesture:(id)a3 animated:(BOOL)a4 startPointForAnimation:(CGPoint)a5;
- (void)updateWithFingerModel:(id)a3 forFingerAtIndex:(unint64_t)a4;
@end

@implementation AXPIFingerController

- (AXPIFingerController)init
{
  return [(AXPIFingerController *)self initWithDisplayUUID:0];
}

- (AXPIFingerController)initWithDisplayUUID:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AXPIFingerController;
  v5 = [(AXPIFingerController *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    v7 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v6;

    v8 = [[AXPIFingerEventSender alloc] initWithDisplayUUID:v4];
    v9 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v8;

    [*((id *)v5 + 3) setSenderID:0x8000000817319372];
    v10 = objc_alloc_init(AXPIFingerContainerView);
    v11 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v10;

    [*((id *)v5 + 1) setUserInteractionEnabled:0];
    long long v12 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
    *(_OWORD *)(v5 + 104) = *MEMORY[0x263F001A0];
    *(_OWORD *)(v5 + 120) = v12;
    v13 = AXPIDefaultAppearanceForDevice();
    [v5 setAppearanceDelegate:v13];
  }
  return (AXPIFingerController *)v5;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_fingerModels;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) setDelegate:0];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)AXPIFingerController;
  [(AXPIFingerController *)&v8 dealloc];
}

- (BOOL)isPinchEnabled
{
  return [(AXPIFingerContainerView *)self->_fingerContainerView isPinchChainVisible];
}

- (void)setShouldAddRealEventFlag:(BOOL)a3
{
}

- (BOOL)shouldAddRealEventFlag
{
  return [(AXPIFingerEventSender *)self->_eventSender shouldAddRealEventFlag];
}

- (void)setSenderID:(unint64_t)a3
{
}

- (unint64_t)senderID
{
  return [(AXPIFingerEventSender *)self->_eventSender senderID];
}

- (unint64_t)numberOfFingers
{
  return [(NSMutableArray *)self->_fingerModels count];
}

- (void)clearAllFingersAnimated:(BOOL)a3 endPointForAnimation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL v6 = a3;
  -[AXPIFingerController liftFingersUpAnimated:](self, "liftFingersUpAnimated:");
  [(AXPIFingerController *)self _interruptGestureIfNeeded];
  [(AXPIFingerController *)self enumerateFingersUsingBlock:&__block_literal_global_3];
  -[AXPIFingerContainerView clearAllFingersAnimated:endPointForAnimation:](self->_fingerContainerView, "clearAllFingersAnimated:endPointForAnimation:", v6, x, y);
  fingerModels = self->_fingerModels;
  [(NSMutableArray *)fingerModels removeAllObjects];
}

uint64_t __69__AXPIFingerController_clearAllFingersAnimated_endPointForAnimation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDelegate:0];
}

- (void)showFingerModels:(id)a3 animated:(BOOL)a4 startPointForAnimation:(CGPoint)a5
{
}

- (void)_showFingerModels:(id)a3 animated:(BOOL)a4 startPointForAnimation:(CGPoint)a5 shouldShowPinchChain:(BOOL)a6 shouldReuseFingers:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double y = a5.y;
  double x = a5.x;
  BOOL v11 = a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v13 = a3;
  if (v7)
  {
    [(AXPIFingerController *)self _interruptGestureIfNeeded];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __114__AXPIFingerController__showFingerModels_animated_startPointForAnimation_shouldShowPinchChain_shouldReuseFingers___block_invoke;
    v25[3] = &unk_264D863F0;
    v25[4] = self;
    id v26 = v13;
    uint64_t v14 = MEMORY[0x23EC9D040](v25);
    objc_super v15 = (void *)v14;
    if (v11) {
      [MEMORY[0x263F82E00] animateWithDuration:v14 animations:0.25];
    }
    else {
      (*(void (**)(uint64_t))(v14 + 16))(v14);
    }
  }
  else
  {
    if ([(NSMutableArray *)self->_fingerModels count]) {
      -[AXPIFingerController clearAllFingersAnimated:endPointForAnimation:](self, "clearAllFingersAnimated:endPointForAnimation:", v11, x, y);
    }
    [(NSMutableArray *)self->_fingerModels addObjectsFromArray:v13];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v16 = v13;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "setDelegate:", self, (void)v21);
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v18);
    }

    -[AXPIFingerContainerView showFingerModels:animated:startPointForAnimation:shouldShowPinchChain:](self->_fingerContainerView, "showFingerModels:animated:startPointForAnimation:shouldShowPinchChain:", v16, v11, v8, x, y);
  }
}

void __114__AXPIFingerController__showFingerModels_animated_startPointForAnimation_shouldShowPinchChain_shouldReuseFingers___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __114__AXPIFingerController__showFingerModels_animated_startPointForAnimation_shouldShowPinchChain_shouldReuseFingers___block_invoke_2;
  v2[3] = &unk_264D86668;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateFingersUsingBlock:v2];
}

void __114__AXPIFingerController__showFingerModels_animated_startPointForAnimation_shouldShowPinchChain_shouldReuseFingers___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 objectAtIndexedSubscript:a3];
  [v5 updateWithPropertiesFromFingerModel:v6];
}

- (void)showPinchFingersAnimated:(BOOL)a3 midpoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL v6 = a3;
  if ([(NSMutableArray *)self->_fingerModels count]) {
    -[AXPIFingerController clearAllFingersAnimated:endPointForAnimation:](self, "clearAllFingersAnimated:endPointForAnimation:", v6, x, y);
  }
  [(AXPIFingerContainerView *)self->_fingerContainerView bounds];
  +[AXPIFingerUtilities defaultPinchLocationsAroundPoint:withinBounds:](AXPIFingerUtilities, "defaultPinchLocationsAroundPoint:withinBounds:", x, y, v8, v9, v10, v11);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  long long v12 = +[AXPIFingerUtilities fingerModelsForPointStrings:v13];
  -[AXPIFingerController _showFingerModels:animated:startPointForAnimation:shouldShowPinchChain:shouldReuseFingers:](self, "_showFingerModels:animated:startPointForAnimation:shouldShowPinchChain:shouldReuseFingers:", v12, v6, 1, 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

- (void)resetPinchFingers
{
  [(AXPIFingerController *)self midpointForFingers];
  double v4 = v3;
  double v6 = v5;
  [(AXPIFingerContainerView *)self->_fingerContainerView bounds];
  +[AXPIFingerUtilities defaultPinchLocationsAroundPoint:withinBounds:](AXPIFingerUtilities, "defaultPinchLocationsAroundPoint:withinBounds:", v4, v6, v7, v8, v9, v10);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  double v11 = [v17 firstObject];
  CGPoint v12 = CGPointFromString(v11);
  id v13 = [(NSMutableArray *)self->_fingerModels objectAtIndexedSubscript:0];
  objc_msgSend(v13, "setLocation:", v12.x, v12.y);

  uint64_t v14 = [v17 lastObject];
  CGPoint v15 = CGPointFromString(v14);
  id v16 = [(NSMutableArray *)self->_fingerModels objectAtIndexedSubscript:1];
  objc_msgSend(v16, "setLocation:", v15.x, v15.y);
}

- (CGPoint)_sceneReferencePointFromFingerLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(AXPIFingerController *)self fixedReferenceWindow];

  fingerContainerView = self->_fingerContainerView;
  double v8 = [(AXPIFingerContainerView *)fingerContainerView window];
  double v9 = v8;
  if (v6)
  {
    -[AXPIFingerContainerView convertPoint:toView:](self->_fingerContainerView, "convertPoint:toView:", 0, x, y);
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = [(AXPIFingerController *)self fixedReferenceWindow];
    objc_msgSend(v9, "convertPoint:toWindow:", v14, v11, v13);
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    uint64_t v14 = [v8 screen];
    uint64_t v19 = [v14 fixedCoordinateSpace];
    -[AXPIFingerContainerView convertPoint:toCoordinateSpace:](fingerContainerView, "convertPoint:toCoordinateSpace:", v19, x, y);
    double v16 = v20;
    double v18 = v21;
  }
  double v22 = v16;
  double v23 = v18;
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (CGPoint)_fingerLocationFromSceneReferencePoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(AXPIFingerController *)self fixedReferenceWindow];

  fingerContainerView = self->_fingerContainerView;
  double v8 = [(AXPIFingerContainerView *)fingerContainerView window];
  double v9 = v8;
  if (v6)
  {
    double v10 = [(AXPIFingerController *)self fixedReferenceWindow];
    objc_msgSend(v9, "convertPoint:fromWindow:", v10, x, y);
    -[AXPIFingerContainerView convertPoint:fromView:](fingerContainerView, "convertPoint:fromView:", 0);
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v10 = [v8 screen];
    double v15 = [v10 fixedCoordinateSpace];
    -[AXPIFingerContainerView convertPoint:fromCoordinateSpace:](fingerContainerView, "convertPoint:fromCoordinateSpace:", v15, x, y);
    double v12 = v16;
    double v14 = v17;
  }
  double v18 = v12;
  double v19 = v14;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (id)_eventTouchInfoForFingerLocation:(CGPoint)a3 force:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  double v8 = objc_alloc_init(AXPIFingerEventTouchInfo);
  -[AXPIFingerController _sceneReferencePointFromFingerLocation:](self, "_sceneReferencePointFromFingerLocation:", x, y);
  double v10 = v9;
  double v12 = v11;
  [(AXPIFingerController *)self fixedReferenceBounds];
  if (CGRectIsNull(v26))
  {
    double v13 = [(AXPIFingerContainerView *)self->_fingerContainerView window];

    if (v13)
    {
      double v14 = [(AXPIFingerContainerView *)self->_fingerContainerView window];
      double v15 = [v14 screen];
      [v15 _referenceBounds];
      double v17 = v16;
      double v19 = v18;
    }
    else
    {
      double v14 = [MEMORY[0x263F82B60] mainScreen];
      [v14 _referenceBounds];
      double v17 = v22;
      double v19 = v23;
    }
  }
  else
  {
    [(AXPIFingerController *)self fixedReferenceBounds];
    double v17 = v20;
    double v19 = v21;
  }
  -[AXPIFingerEventTouchInfo setNormalizedLocation:](v8, "setNormalizedLocation:", v10 / v17, v12 / v19);
  [(AXPIFingerEventTouchInfo *)v8 setForce:a4];
  return v8;
}

- (id)_eventTouchInfoForFinger:(id)a3
{
  id v4 = a3;
  [v4 location];
  double v6 = v5;
  double v8 = v7;
  [v4 force];
  double v10 = -[AXPIFingerController _eventTouchInfoForFingerLocation:force:](self, "_eventTouchInfoForFingerLocation:force:", v6, v8, v9);
  double v11 = [v4 location3D];

  [v10 setLocation3D:v11];
  return v10;
}

- (id)_touchInfosByIdentifierForPressedFingers
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  double v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_fingerModels;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isPressed", (void)v14))
        {
          double v11 = [(AXPIFingerController *)self _eventTouchInfoForFinger:v10];
          double v12 = [NSNumber numberWithUnsignedInteger:v8 + i];
          [v3 setObject:v11 forKeyedSubscript:v12];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      v8 += i;
    }
    while (v6);
  }

  return v3;
}

- (void)pressFingersDownAnimated:(BOOL)a3 sendTouchEvents:(BOOL)a4
{
  [(AXPIFingerContainerView *)self->_fingerContainerView setShouldAnimatePress:a3];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__AXPIFingerController_pressFingersDownAnimated_sendTouchEvents___block_invoke;
  v6[3] = &unk_264D86690;
  BOOL v7 = a4;
  v6[4] = self;
  [(AXPIFingerController *)self enumerateFingersUsingBlock:v6];
  [(AXPIFingerContainerView *)self->_fingerContainerView setShouldAnimatePress:0];
}

uint64_t __65__AXPIFingerController_pressFingersDownAnimated_sendTouchEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v4 = [v3 setPressed:1 sendDelegateCallback:1];
  }
  else
  {
    [v3 setPressed:1 sendDelegateCallback:0];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) indexOfObject:v7];
    id v5 = v7;
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_6;
    }
    uint64_t v4 = [*(id *)(a1 + 32) updateWithFingerModel:v7 forFingerAtIndex:v4];
  }
  id v5 = v7;
LABEL_6:
  return MEMORY[0x270F9A758](v4, v5);
}

- (void)liftFingersUpAnimated:(BOOL)a3 sendTouchEvents:(BOOL)a4
{
  [(AXPIFingerContainerView *)self->_fingerContainerView setShouldAnimatePress:a3];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__AXPIFingerController_liftFingersUpAnimated_sendTouchEvents___block_invoke;
  v6[3] = &unk_264D86690;
  BOOL v7 = a4;
  v6[4] = self;
  [(AXPIFingerController *)self enumerateFingersUsingBlock:v6];
  [(AXPIFingerContainerView *)self->_fingerContainerView setShouldAnimatePress:0];
}

uint64_t __62__AXPIFingerController_liftFingersUpAnimated_sendTouchEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v4 = [v3 setPressed:0 sendDelegateCallback:1];
  }
  else
  {
    [v3 setPressed:0 sendDelegateCallback:0];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) indexOfObject:v7];
    id v5 = v7;
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_6;
    }
    uint64_t v4 = [*(id *)(a1 + 32) updateWithFingerModel:v7 forFingerAtIndex:v4];
  }
  id v5 = v7;
LABEL_6:
  return MEMORY[0x270F9A758](v4, v5);
}

- (void)pressFingersDownAnimated:(BOOL)a3
{
}

- (void)liftFingersUpAnimated:(BOOL)a3
{
}

- (void)performCircularProgressAnimationOnFingersWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  [(AXPIFingerController *)self cancelCircularProgressAnimation];
  [(AXPIFingerContainerView *)self->_fingerContainerView performCircularProgressAnimationOnFingersWithDuration:v6 completion:a3];
}

- (void)cancelCircularProgressAnimation
{
}

- (void)enumerateFingersUsingBlock:(id)a3
{
  id v4 = a3;
  [(AXPIFingerController *)self beginUpdates];
  fingerModels = self->_fingerModels;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__AXPIFingerController_enumerateFingersUsingBlock___block_invoke;
  v7[3] = &unk_264D866B8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)fingerModels enumerateObjectsUsingBlock:v7];
  [(AXPIFingerController *)self endUpdates];
}

uint64_t __51__AXPIFingerController_enumerateFingersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGPoint)midpointForFingers
{
  v2 = +[AXPIFingerUtilities pointStringsForFingerModels:self->_fingerModels];
  AX_CGPointGetMidpointOfAllPoints();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)midpointOfStartingFingersForGesture:(id)a3
{
  long long v6 = *MEMORY[0x263F00148];
  id v3 = -[AXPIFingerController _handleStartingFingersForGesture:animated:startPointForAnimation:midpoint:showFingers:](self, "_handleStartingFingersForGesture:animated:startPointForAnimation:midpoint:showFingers:", a3, 0, &v6, 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  double v5 = *((double *)&v6 + 1);
  double v4 = *(double *)&v6;
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (id)_showStartingFingersForGesture:(id)a3 animated:(BOOL)a4 startPointForAnimation:(CGPoint)a5
{
  return -[AXPIFingerController _handleStartingFingersForGesture:animated:startPointForAnimation:midpoint:showFingers:](self, "_handleStartingFingersForGesture:animated:startPointForAnimation:midpoint:showFingers:", a3, a4, 0, 1, a5.x, a5.y);
}

- (id)_handleStartingFingersForGesture:(id)a3 animated:(BOOL)a4 startPointForAnimation:(CGPoint)a5 midpoint:(CGPoint *)a6 showFingers:(BOOL)a7
{
  BOOL v7 = a7;
  double y = a5.y;
  double x = a5.x;
  BOOL v33 = a4;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  double v12 = *MEMORY[0x263F00148];
  double v11 = *(double *)(MEMORY[0x263F00148] + 8);
  double v13 = [MEMORY[0x263F22998] server];
  uint64_t v14 = [v13 activeInterfaceOrientation];

  [v10 updateForLandscape:(unint64_t)(v14 - 3) < 2];
  long long v15 = [MEMORY[0x263EFF980] array];
  long long v16 = [MEMORY[0x263EFF980] array];
  uint64_t v35 = [v10 numberOfEvents];
  if (v35)
  {
    for (uint64_t i = 0; i != v35; ++i)
    {
      double v18 = [v10 fingerIdentifiersAtEventIndex:i];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v38 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8 * j);
            if (([v15 containsObject:v23] & 1) == 0)
            {
              [v15 addObject:v23];
              [v10 pointForFingerIdentifier:v23 atEventIndex:i];
              double v25 = v24;
              double v27 = v26;
              if ([v10 arePointsDeviceRelative])
              {
                -[AXPIFingerController _fingerLocationFromSceneReferencePoint:](self, "_fingerLocationFromSceneReferencePoint:", v25, v27);
                double v25 = v28;
                double v27 = v29;
              }
              double v12 = v12 + v25;
              double v11 = v11 + v27;
              if (v7)
              {
                v30 = +[AXPIFingerModel fingerModelForLocation:](AXPIFingerModel, "fingerModelForLocation:", v25, v27);
                [v16 addObject:v30];
              }
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v20);
      }
    }
  }
  unint64_t v31 = [v15 count];
  if (v31)
  {
    double v12 = v12 / (double)v31;
    double v11 = v11 / (double)v31;
  }
  if (a6)
  {
    a6->double x = v12;
    a6->double y = v11;
  }
  if (v7) {
    -[AXPIFingerController _showFingerModels:animated:startPointForAnimation:shouldShowPinchChain:shouldReuseFingers:](self, "_showFingerModels:animated:startPointForAnimation:shouldShowPinchChain:shouldReuseFingers:", v16, v33, 0, [v16 count] == -[NSMutableArray count](self->_fingerModels, "count"), x, y);
  }

  return v15;
}

- (void)showStartingFingersForGesture:(id)a3
{
}

- (void)showStartingFingersForGesture:(id)a3 animated:(BOOL)a4 startPointForAnimation:(CGPoint)a5
{
  id v5 = -[AXPIFingerController _showStartingFingersForGesture:animated:startPointForAnimation:](self, "_showStartingFingersForGesture:animated:startPointForAnimation:", a3, a4, a5.x, a5.y);
}

- (void)_replayEventAtIndex:(unint64_t)a3 inGesture:(id)a4 allFingerIdentifiers:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(AXPIFingerController *)self beginUpdates];
  uint64_t v10 = [v8 numberOfEvents];
  double v11 = [v8 fingerIdentifiersAtEventIndex:a3];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  double v22 = __75__AXPIFingerController__replayEventAtIndex_inGesture_allFingerIdentifiers___block_invoke;
  uint64_t v23 = &unk_264D866E0;
  double v24 = self;
  id v12 = v11;
  id v25 = v12;
  id v13 = v8;
  id v26 = v13;
  unint64_t v27 = a3;
  [v9 enumerateObjectsUsingBlock:&v20];

  [(AXPIFingerController *)self endUpdates];
  [v13 timeAtEventIndex:a3];
  if (v10 - 1 > a3)
  {
    double v15 = v14;
    [v13 timeAtEventIndex:a3 + 1];
    double v17 = v16 - v15;
    double v18 = [MEMORY[0x263EFF9F0] currentRunLoop];
    uint64_t v19 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v17];
    [v18 runUntilDate:v19];
  }
}

void __75__AXPIFingerController__replayEventAtIndex_inGesture_allFingerIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  id v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndexedSubscript:a3];
  if ([*(id *)(a1 + 40) containsObject:v12])
  {
    [*(id *)(a1 + 48) pointForFingerIdentifier:v12 atEventIndex:*(void *)(a1 + 56)];
    double v7 = v6;
    double v9 = v8;
    if ([*(id *)(a1 + 48) arePointsDeviceRelative])
    {
      objc_msgSend(*(id *)(a1 + 32), "_fingerLocationFromSceneReferencePoint:", v7, v9);
      double v7 = v10;
      double v9 = v11;
    }
    objc_msgSend(v5, "setLocation:", v7, v9);
    [v5 setPressed:1];
    [*(id *)(a1 + 48) forceForFingerIdentifier:v12 atEventIndex:*(void *)(a1 + 56)];
    objc_msgSend(v5, "setForce:");
  }
  else
  {
    [v5 setPressed:0];
  }
}

- (void)performGesture:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __39__AXPIFingerController_performGesture___block_invoke;
  v3[3] = &unk_264D86708;
  v3[4] = self;
  [(AXPIFingerController *)self performGesture:a3 completion:v3];
}

uint64_t __39__AXPIFingerController_performGesture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearAllFingersAnimated:endPointForAnimation:", 1, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

- (void)performGesture:(id)a3 completion:(id)a4
{
}

- (void)performWithoutPreparingGesture:(id)a3 completion:(id)a4
{
}

- (void)_performGesture:(id)a3 shouldShowFingers:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v16 = a3;
  id v8 = a5;
  [(AXPIFingerEventSender *)self->_eventSender startNewGeneration];
  double v9 = -[AXPIFingerController _handleStartingFingersForGesture:animated:startPointForAnimation:midpoint:showFingers:](self, "_handleStartingFingersForGesture:animated:startPointForAnimation:midpoint:showFingers:", v16, 0, 0, v6, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  unint64_t v10 = [v16 numberOfEvents];
  BOOL v11 = 1;
  self->_isPerformingGesture = 1;
  id v12 = (void *)MEMORY[0x23EC9D040](v8);
  id gestureCompletion = self->_gestureCompletion;
  self->_id gestureCompletion = v12;

  if (v10)
  {
    [(AXPIFingerController *)self _replayEventAtIndex:0 inGesture:v16 allFingerIdentifiers:v9];
    if (self->_isPerformingGesture)
    {
      uint64_t v14 = 1;
      do
      {
        unint64_t v15 = v14;
        if (v10 == v14) {
          break;
        }
        [(AXPIFingerController *)self _replayEventAtIndex:v14 inGesture:v16 allFingerIdentifiers:v9];
        uint64_t v14 = v15 + 1;
      }
      while (self->_isPerformingGesture);
      BOOL v11 = v15 >= v10;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  [(AXPIFingerController *)self _endGestureWithSuccess:v11];
}

- (void)cancelGesture
{
  self->_isPerformingGesture = 0;
}

- (void)_interruptGestureIfNeeded
{
  if (self->_isPerformingGesture) {
    [(AXPIFingerController *)self _endGestureWithSuccess:0];
  }
}

- (void)_endGestureWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  [(AXPIFingerController *)self liftFingersUpAnimated:1];
  self->_isPerformingGesture = 0;
  if (self->_gestureCompletion)
  {
    BOOL v6 = (void (**)(id, BOOL))MEMORY[0x23EC9D040]();
    id gestureCompletion = self->_gestureCompletion;
    self->_id gestureCompletion = 0;

    v6[2](v6, v3);
  }
}

- (id)fingerModelAtPoint:(CGPoint)a3
{
  unint64_t v4 = -[AXPIFingerContainerView indexOfFingerAtPoint:](self->_fingerContainerView, "indexOfFingerAtPoint:", a3.x, a3.y);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSMutableArray *)self->_fingerModels objectAtIndexedSubscript:v4];
  }
  return v5;
}

- (AXAssertionCoordinator)suppressVisualsAssertionCoodinator
{
  suppressVisualsAssertionCoodinator = self->_suppressVisualsAssertionCoodinator;
  if (!suppressVisualsAssertionCoodinator)
  {
    unint64_t v4 = (AXAssertionCoordinator *)[objc_alloc(MEMORY[0x263F22830]) initWithIdentifier:@"SuppressVisualsAssertion" delegate:self];
    id v5 = self->_suppressVisualsAssertionCoodinator;
    self->_suppressVisualsAssertionCoodinator = v4;

    suppressVisualsAssertionCoodinator = self->_suppressVisualsAssertionCoodinator;
  }
  return suppressVisualsAssertionCoodinator;
}

- (id)acquireAssertionToSuppressVisualsWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(AXPIFingerController *)self suppressVisualsAssertionCoodinator];
  BOOL v6 = [v5 acquireAssertionWithReason:v4];

  return v6;
}

- (void)assertionCoordinator:(id)a3 assertionsDidBecomeActive:(BOOL)a4
{
}

uint64_t __71__AXPIFingerController_assertionCoordinator_assertionsDidBecomeActive___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setShouldSuppressFingerVisuals:*(unsigned __int8 *)(a1 + 40)];
}

- (id)_pointStringsFromFingers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_fingerModels;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "location", (void)v11);
        double v9 = NSStringFromCGPoint(v18);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)legacyPressFingersDown
{
  [(AXPIFingerController *)self pressFingersDownAnimated:1];
  return [(AXPIFingerController *)self _pointStringsFromFingers];
}

- (id)legacyLiftFingersUp
{
  [(AXPIFingerController *)self liftFingersUpAnimated:1];
  return [(AXPIFingerController *)self _pointStringsFromFingers];
}

- (BOOL)moveFingersToPoints:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(AXPIFingerContainerView *)self->_fingerContainerView bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        CGPoint v30 = CGPointFromString((NSString *)*(void *)(*((void *)&v24 + 1) + 8 * i));
        v31.origin.double x = v6;
        v31.origin.double y = v8;
        v31.size.width = v10;
        v31.size.height = v12;
        if (!CGRectContainsPoint(v31, v30))
        {
          BOOL v19 = 0;
          uint64_t v20 = v13;
          goto LABEL_12;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  uint64_t v18 = [(NSMutableArray *)self->_fingerModels count];
  if (v18 == [v13 count])
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __44__AXPIFingerController_moveFingersToPoints___block_invoke;
    v22[3] = &unk_264D86668;
    id v23 = v13;
    [(AXPIFingerController *)self enumerateFingersUsingBlock:v22];
    BOOL v19 = 1;
    uint64_t v20 = v23;
LABEL_12:
  }
  else
  {
    BOOL v19 = 1;
  }

  return v19;
}

void __44__AXPIFingerController_moveFingersToPoints___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v7 = a2;
  double v5 = [v4 objectAtIndexedSubscript:a3];
  CGPoint v6 = CGPointFromString(v5);

  objc_msgSend(v7, "setLocation:", v6.x, v6.y);
}

- (BOOL)moveFingersTo3DPoints:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->_fingerModels count];
  if (v5 == [v4 count])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __46__AXPIFingerController_moveFingersTo3DPoints___block_invoke;
    v7[3] = &unk_264D86668;
    id v8 = v4;
    [(AXPIFingerController *)self enumerateFingersUsingBlock:v7];
  }
  return 1;
}

void __46__AXPIFingerController_moveFingersTo3DPoints___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 objectAtIndexedSubscript:a3];
  [v5 setLocation3D:v6];
}

- (CGRect)rectForFingersAtPoints:(id)a3
{
  [(AXPIFingerContainerView *)self->_fingerContainerView rectForFingersAtPoints:a3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)animateToTapWithDuration:(double)a3
{
}

- (void)performDownAtPoint:(CGPoint)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  eventSender = self->_eventSender;
  double v4 = -[AXPIFingerController _eventTouchInfoForFingerLocation:force:](self, "_eventTouchInfoForFingerLocation:force:", a3.x, a3.y, 0.0);
  v6[0] = v4;
  double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [(AXPIFingerEventSender *)eventSender performDownWithTouches:v5];
}

- (void)performMoveToPoint:(CGPoint)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  eventSender = self->_eventSender;
  double v4 = -[AXPIFingerController _eventTouchInfoForFingerLocation:force:](self, "_eventTouchInfoForFingerLocation:force:", a3.x, a3.y, 0.0);
  v6[0] = v4;
  double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [(AXPIFingerEventSender *)eventSender performMoveWithTouches:v5];
}

- (void)performUpAtPoint:(CGPoint)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  eventSender = self->_eventSender;
  double v4 = -[AXPIFingerController _eventTouchInfoForFingerLocation:force:](self, "_eventTouchInfoForFingerLocation:force:", a3.x, a3.y, 0.0);
  v6[0] = v4;
  double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [(AXPIFingerEventSender *)eventSender performUpWithTouches:v5];
}

- (void)_sendMoveEventIfNeededForFingerModel:(id)a3 atIndex:(unint64_t)a4
{
  if ([a3 isPressed])
  {
    if ([(AXPIFingerController *)self _isInUpdateBlock])
    {
      self->_didMoveFingersDuringUpdate = 1;
    }
    else
    {
      eventSender = self->_eventSender;
      id v6 = [(AXPIFingerController *)self _touchInfosByIdentifierForPressedFingers];
      [(AXPIFingerEventSender *)eventSender performMoveWithTouchesByFingerIdentifier:v6];
    }
  }
}

- (void)didUpdateForceForFingerModel:(id)a3
{
  id v6 = a3;
  uint64_t v4 = -[NSMutableArray indexOfObject:](self->_fingerModels, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    [(AXPIFingerController *)self updateWithFingerModel:v6 forFingerAtIndex:v4];
    [(AXPIFingerController *)self _sendMoveEventIfNeededForFingerModel:v6 atIndex:v5];
  }
}

- (void)didUpdateLocationForFingerModel:(id)a3
{
  id v6 = a3;
  uint64_t v4 = -[NSMutableArray indexOfObject:](self->_fingerModels, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    [(AXPIFingerController *)self updateWithFingerModel:v6 forFingerAtIndex:v4];
    [(AXPIFingerController *)self _sendMoveEventIfNeededForFingerModel:v6 atIndex:v5];
  }
}

- (void)updateWithFingerModel:(id)a3 forFingerAtIndex:(unint64_t)a4
{
}

- (void)didUpdatePressStateForFingerModel:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->_fingerModels indexOfObject:v4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v5;
    [(AXPIFingerController *)self updateWithFingerModel:v4 forFingerAtIndex:v5];
    unint64_t v7 = [(AXPIFingerController *)self _fingerIdentifierForIndex:v6];
    id v8 = [(AXPIFingerController *)self _eventTouchInfoForFinger:v4];
    if ([(AXPIFingerController *)self _isInUpdateBlock])
    {
      if ([v4 isPressed])
      {
        downInfosByIdentifier = self->_downInfosByIdentifier;
        if (!downInfosByIdentifier)
        {
          CGFloat v10 = [MEMORY[0x263EFF9A0] dictionary];
          double v11 = self->_downInfosByIdentifier;
          self->_downInfosByIdentifier = v10;

          downInfosByIdentifier = self->_downInfosByIdentifier;
        }
      }
      else
      {
        downInfosByIdentifier = self->_upInfosByIdentifier;
        if (!downInfosByIdentifier)
        {
          uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
          upInfosByIdentifier = self->_upInfosByIdentifier;
          self->_upInfosByIdentifier = v16;

          downInfosByIdentifier = self->_upInfosByIdentifier;
        }
      }
      uint64_t v18 = [NSNumber numberWithUnsignedInteger:v7];
      [(NSMutableDictionary *)downInfosByIdentifier setObject:v8 forKeyedSubscript:v18];
    }
    else
    {
      CGFloat v12 = [NSNumber numberWithUnsignedInteger:v7];
      BOOL v19 = v12;
      v20[0] = v8;
      id v13 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];

      int v14 = [v4 isPressed];
      eventSender = self->_eventSender;
      if (v14) {
        [(AXPIFingerEventSender *)eventSender performDownWithTouchesByFingerIdentifier:v13];
      }
      else {
        [(AXPIFingerEventSender *)eventSender performUpWithTouchesByFingerIdentifier:v13];
      }
    }
  }
}

- (void)didUpdateSelectedStateForFingerModel:(id)a3
{
  id v5 = a3;
  uint64_t v4 = -[NSMutableArray indexOfObject:](self->_fingerModels, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    [(AXPIFingerController *)self updateWithFingerModel:v5 forFingerAtIndex:v4];
  }
}

- (void)didUpdateShapeForFingerModel:(id)a3
{
  id v5 = a3;
  uint64_t v4 = -[NSMutableArray indexOfObject:](self->_fingerModels, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    [(AXPIFingerController *)self updateWithFingerModel:v5 forFingerAtIndex:v4];
  }
}

- (unint64_t)_fingerIdentifierForIndex:(unint64_t)a3
{
  return a3 + 1;
}

- (BOOL)_isInUpdateBlock
{
  return self->_updateCount != 0;
}

- (void)beginUpdates
{
}

- (void)endUpdates
{
  unint64_t updateCount = self->_updateCount;
  if (updateCount)
  {
    unint64_t v4 = updateCount - 1;
    self->_unint64_t updateCount = v4;
    if (!v4)
    {
      [(AXPIFingerEventSender *)self->_eventSender performDownWithTouchesByFingerIdentifier:self->_downInfosByIdentifier];
      if (self->_didMoveFingersDuringUpdate)
      {
        eventSender = self->_eventSender;
        uint64_t v6 = [(AXPIFingerController *)self _touchInfosByIdentifierForPressedFingers];
        [(AXPIFingerEventSender *)eventSender performMoveWithTouchesByFingerIdentifier:v6];
      }
      [(AXPIFingerEventSender *)self->_eventSender performUpWithTouchesByFingerIdentifier:self->_upInfosByIdentifier];
      downInfosByIdentifier = self->_downInfosByIdentifier;
      self->_downInfosByIdentifier = 0;

      upInfosByIdentifier = self->_upInfosByIdentifier;
      self->_upInfosByIdentifier = 0;

      self->_didMoveFingersDuringUpdate = 0;
    }
  }
}

- (void)setAppearanceDelegate:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    AXPIDefaultAppearanceForDevice();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;
  objc_storeWeak((id *)&self->_appearanceDelegate, v4);
  [(AXPIFingerContainerView *)self->_fingerContainerView setAppearanceDelegate:v5];
}

- (UIView)fingerContainerView
{
  return &self->_fingerContainerView->super;
}

- (NSArray)fingerModels
{
  return &self->_fingerModels->super;
}

- (BOOL)isPerformingGesture
{
  return self->_isPerformingGesture;
}

- (AXPIFingerAppearanceDelegate)appearanceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  return (AXPIFingerAppearanceDelegate *)WeakRetained;
}

- (UIWindow)fixedReferenceWindow
{
  return self->_fixedReferenceWindow;
}

- (void)setFixedReferenceWindow:(id)a3
{
}

- (CGRect)fixedReferenceBounds
{
  double x = self->_fixedReferenceBounds.origin.x;
  double y = self->_fixedReferenceBounds.origin.y;
  double width = self->_fixedReferenceBounds.size.width;
  double height = self->_fixedReferenceBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFixedReferenceBounds:(CGRect)a3
{
  self->_fixedReferenceBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedReferenceWindow, 0);
  objc_destroyWeak((id *)&self->_appearanceDelegate);
  objc_storeStrong((id *)&self->_suppressVisualsAssertionCoodinator, 0);
  objc_storeStrong(&self->_gestureCompletion, 0);
  objc_storeStrong((id *)&self->_upInfosByIdentifier, 0);
  objc_storeStrong((id *)&self->_downInfosByIdentifier, 0);
  objc_storeStrong((id *)&self->_eventSender, 0);
  objc_storeStrong((id *)&self->_fingerModels, 0);
  objc_storeStrong((id *)&self->_fingerContainerView, 0);
}

@end