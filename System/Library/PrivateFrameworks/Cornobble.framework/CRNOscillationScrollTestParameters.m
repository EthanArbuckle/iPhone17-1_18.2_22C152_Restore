@interface CRNOscillationScrollTestParameters
- (BOOL)finishWithHalfIteration;
- (BOOL)preventDismissalGestures;
- (BOOL)shouldFlick;
- (CGPoint)finalFingerPosition;
- (CGPoint)initialFingerPosition;
- (CGRect)scrollingBounds;
- (CRNOscillationScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 useFlicks:(BOOL)a6 preventDismissalGestures:(BOOL)a7 initialAmplitude:(double)a8 amplitudeVariationPerIteration:(double)a9 initialDirection:(int64_t)a10 iterationDuration:(double)a11 finishWithHalfIteration:(BOOL)a12;
- (CRNOscillationScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 useFlicks:(BOOL)a6 preventDismissalGestures:(BOOL)a7 initialAmplitude:(double)a8 amplitudeVariationPerIteration:(double)a9 initialDirection:(int64_t)a10 iterationDuration:(double)a11 finishWithHalfIteration:(BOOL)a12 completionHandler:(id)a13;
- (NSString)testName;
- (RCPSyntheticEventStream)eventStream;
- (double)amplitudeVariationPerIteration;
- (double)initialAmplitude;
- (double)iterationDuration;
- (id)completionHandler;
- (id)composerBlock;
- (int64_t)initialDirection;
- (int64_t)realInitialDirection;
- (unint64_t)iterations;
- (void)scrollWithComposer:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 duration:(double)a6;
- (void)setAmplitudeVariationPerIteration:(double)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setFinishWithHalfIteration:(BOOL)a3;
- (void)setInitialAmplitude:(double)a3;
- (void)setInitialDirection:(int64_t)a3;
- (void)setIterationDuration:(double)a3;
- (void)setIterations:(unint64_t)a3;
- (void)setPreventDismissalGestures:(BOOL)a3;
- (void)setScrollingBounds:(CGRect)a3;
- (void)setShouldFlick:(BOOL)a3;
- (void)setTestName:(id)a3;
@end

@implementation CRNOscillationScrollTestParameters

double __51__CRNOscillationScrollTestParameters_composerBlock__block_invoke_2(uint64_t a1, double *a2, int a3)
{
  [*(id *)(a1 + 32) amplitudeVariationPerIteration];
  if (!a3) {
    double v6 = -v6;
  }
  double v7 = v6 * 0.5;
  if (*(void *)(a1 + 40) == 2) {
    double v8 = -0.0;
  }
  else {
    double v8 = v7;
  }
  if (*(void *)(a1 + 40) != 2) {
    double v7 = -0.0;
  }
  double result = a2[1] + v7;
  *a2 = *a2 + v8;
  a2[1] = result;
  return result;
}

- (double)amplitudeVariationPerIteration
{
  return self->_amplitudeVariationPerIteration;
}

- (BOOL)shouldFlick
{
  return self->_shouldFlick;
}

- (CGPoint)initialFingerPosition
{
  [(CRNOscillationScrollTestParameters *)self scrollingBounds];
  double Midpoint = CRNCGRectGetMidpoint(v3, v4, v5, v6);
  double v9 = v8;
  [(CRNOscillationScrollTestParameters *)self initialAmplitude];
  double v11 = v10 * 0.5;
  uint64_t v12 = CRNOppositeDirectionFrom([(CRNOscillationScrollTestParameters *)self realInitialDirection]);
  double v13 = CRNCGPointAdvanceInDirectionByAmount(v12, Midpoint, v9, v11);
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)finalFingerPosition
{
  [(CRNOscillationScrollTestParameters *)self scrollingBounds];
  double Midpoint = CRNCGRectGetMidpoint(v3, v4, v5, v6);
  double v9 = v8;
  [(CRNOscillationScrollTestParameters *)self initialAmplitude];
  double v11 = v10 * 0.5;
  uint64_t v12 = [(CRNOscillationScrollTestParameters *)self realInitialDirection];
  double v13 = CRNCGPointAdvanceInDirectionByAmount(v12, Midpoint, v9, v11);
  result.y = v14;
  result.x = v13;
  return result;
}

- (int64_t)realInitialDirection
{
  return self->_realInitialDirection;
}

- (unint64_t)iterations
{
  return self->_iterations;
}

- (CGRect)scrollingBounds
{
  double x = self->_scrollingBounds.origin.x;
  double y = self->_scrollingBounds.origin.y;
  double width = self->_scrollingBounds.size.width;
  double height = self->_scrollingBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)initialAmplitude
{
  return self->_initialAmplitude;
}

- (BOOL)finishWithHalfIteration
{
  return self->_finishWithHalfIteration;
}

- (BOOL)preventDismissalGestures
{
  return self->_preventDismissalGestures;
}

- (double)iterationDuration
{
  return self->_iterationDuration;
}

- (id)composerBlock
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__CRNOscillationScrollTestParameters_composerBlock__block_invoke;
  v4[3] = &unk_264CC11C0;
  v4[4] = self;
  v2 = (void *)MEMORY[0x237E0E480](v4, a2);
  return v2;
}

- (CRNOscillationScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 useFlicks:(BOOL)a6 preventDismissalGestures:(BOOL)a7 initialAmplitude:(double)a8 amplitudeVariationPerIteration:(double)a9 initialDirection:(int64_t)a10 iterationDuration:(double)a11 finishWithHalfIteration:(BOOL)a12 completionHandler:(id)a13
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v26 = a3;
  id v27 = a13;
  v37.receiver = self;
  v37.super_class = (Class)CRNOscillationScrollTestParameters;
  v28 = [(CRNOscillationScrollTestParameters *)&v37 init];
  if (v28)
  {
    uint64_t v29 = [v26 copy];
    testName = v28->_testName;
    v28->_testName = (NSString *)v29;

    v28->_iterations = a4;
    v28->_scrollingBounds.origin.CGFloat x = x;
    v28->_scrollingBounds.origin.CGFloat y = y;
    v28->_scrollingBounds.size.CGFloat width = width;
    v28->_scrollingBounds.size.CGFloat height = height;
    v28->_shouldFlick = a6;
    v28->_preventDismissalGestures = a7;
    v28->_amplitudeVariationPerIteration = a9;
    v28->_initialAmplitude = a8;
    v28->_initialDirection = a10;
    v28->_iterationDuration = a11;
    v28->_finishWithHalfIteration = a12;
    uint64_t v31 = MEMORY[0x237E0E480](v27);
    id completionHandler = v28->_completionHandler;
    v28->_id completionHandler = (id)v31;

    if (a10 == 6 || a10 == 5)
    {
      v33 = [MEMORY[0x263F1C408] sharedApplication];
      uint64_t v34 = [v33 userInterfaceLayoutDirection];
      uint64_t v35 = 1;
      if (v34) {
        uint64_t v35 = 2;
      }
      v28->_realInitialDirection = v35;
    }
    else
    {
      v28->_realInitialDirection = a10;
    }
  }

  return v28;
}

- (CRNOscillationScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 useFlicks:(BOOL)a6 preventDismissalGestures:(BOOL)a7 initialAmplitude:(double)a8 amplitudeVariationPerIteration:(double)a9 initialDirection:(int64_t)a10 iterationDuration:(double)a11 finishWithHalfIteration:(BOOL)a12
{
  return -[CRNOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:completionHandler:](self, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:completionHandler:", a3, a4, a6, a7, a10, a12, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a8, a9, a11, 0);
}

void __51__CRNOscillationScrollTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) iterationDuration];
  double v5 = v4;
  uint64_t v6 = CRNAxisFromScrollDirection([*(id *)(a1 + 32) realInitialDirection]);
  [*(id *)(a1 + 32) initialFingerPosition];
  double v8 = v7;
  double v10 = v9;
  double v21 = v7;
  double v22 = v9;
  [*(id *)(a1 + 32) finalFingerPosition];
  double v19 = v11;
  double v20 = v12;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __51__CRNOscillationScrollTestParameters_composerBlock__block_invoke_2;
  v18[3] = &unk_264CC1278;
  v18[4] = *(void *)(a1 + 32);
  v18[5] = v6;
  double v13 = (void (**)(void, void, void))MEMORY[0x237E0E480](v18);
  if ([*(id *)(a1 + 32) preventDismissalGestures])
  {
    double v14 = CRNCGPointAdvanceInDirectionByAmount([*(id *)(a1 + 32) realInitialDirection], v8, v10, 75.0);
    objc_msgSend(v3, "dragWithStartPoint:endPoint:duration:", v8, v10, v14, v15, 0.3);
  }
  if (([*(id *)(a1 + 32) shouldFlick] & 1) == 0) {
    objc_msgSend(v3, "touchDown:", v8, v10);
  }
  double v16 = v5 * 0.5;
  if ([*(id *)(a1 + 32) iterations])
  {
    unint64_t v17 = 1;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "scrollWithComposer:fromPoint:toPoint:duration:", v3, v21, v22, v19, v20, v16);
      ((void (**)(void, double *, void))v13)[2](v13, &v21, 0);
      objc_msgSend(*(id *)(a1 + 32), "scrollWithComposer:fromPoint:toPoint:duration:", v3, v19, v20, v21, v22, v16);
      ((void (**)(void, double *, uint64_t))v13)[2](v13, &v19, 1);
      ++v17;
    }
    while (v17 <= [*(id *)(a1 + 32) iterations]);
  }
  if ([*(id *)(a1 + 32) finishWithHalfIteration]) {
    objc_msgSend(*(id *)(a1 + 32), "scrollWithComposer:fromPoint:toPoint:duration:", v3, v21, v22, v19, v20, v16);
  }
  if (([*(id *)(a1 + 32) shouldFlick] & 1) == 0) {
    objc_msgSend(v3, "liftUp:", v21, v22);
  }
}

- (RCPSyntheticEventStream)eventStream
{
  if (RecapLibraryCore_4())
  {
    uint64_t v9 = 0;
    double v10 = &v9;
    uint64_t v11 = 0x2050000000;
    id v3 = (void *)getRCPSyntheticEventStreamClass_softClass_4;
    uint64_t v12 = getRCPSyntheticEventStreamClass_softClass_4;
    if (!getRCPSyntheticEventStreamClass_softClass_4)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __getRCPSyntheticEventStreamClass_block_invoke_4;
      v8[3] = &unk_264CC1198;
      v8[4] = &v9;
      __getRCPSyntheticEventStreamClass_block_invoke_4((uint64_t)v8);
      id v3 = (void *)v10[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v9, 8);
    double v5 = [(CRNOscillationScrollTestParameters *)self composerBlock];
    uint64_t v6 = [v4 eventStreamWithEventActions:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (RCPSyntheticEventStream *)v6;
}

- (void)scrollWithComposer:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 duration:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  id v15 = a3;
  if ([(CRNOscillationScrollTestParameters *)self shouldFlick])
  {
    double v12 = a6 + -0.5;
    objc_msgSend(v15, "sendFlickWithStartPoint:endPoint:duration:", v10, v9, x, y, 0.5);
    if (v12 >= 0.0)
    {
      double v14 = v15;
      double v13 = v12;
    }
    else
    {
      double v13 = 0.3;
      double v14 = v15;
    }
    [v14 advanceTime:v13];
  }
  else
  {
    objc_msgSend(v15, "moveToPoint:duration:", x, y, a6);
  }
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void)setIterations:(unint64_t)a3
{
  self->_iterations = a3;
}

- (void)setScrollingBounds:(CGRect)a3
{
  self->_scrollingBounds = a3;
}

- (void)setShouldFlick:(BOOL)a3
{
  self->_shouldFlick = a3;
}

- (void)setPreventDismissalGestures:(BOOL)a3
{
  self->_preventDismissalGestures = a3;
}

- (void)setFinishWithHalfIteration:(BOOL)a3
{
  self->_finishWithHalfIteration = a3;
}

- (void)setAmplitudeVariationPerIteration:(double)a3
{
  self->_amplitudeVariationPerIteration = a3;
}

- (void)setInitialAmplitude:(double)a3
{
  self->_initialAmplitude = a3;
}

- (int64_t)initialDirection
{
  return self->_initialDirection;
}

- (void)setInitialDirection:(int64_t)a3
{
  self->_initialDirection = a3;
}

- (void)setIterationDuration:(double)a3
{
  self->_iterationDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end