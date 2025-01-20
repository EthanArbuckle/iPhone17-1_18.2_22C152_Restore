@interface CRNPagingScrollTestParameters
- (BOOL)useFlicks;
- (CGRect)scrollingBounds;
- (CRNPagingScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 amplitude:(double)a6 direction:(int64_t)a7 iterationDuration:(double)a8 useFlicks:(BOOL)a9 completionHandler:(id)a10;
- (NSString)testName;
- (RCPSyntheticEventStream)eventStream;
- (double)amplitude;
- (double)iterationDuration;
- (id)completionHandler;
- (id)composerBlock;
- (int64_t)direction;
- (int64_t)realDirection;
- (unint64_t)iterations;
- (void)scrollWithComposer:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 duration:(double)a6;
- (void)setAmplitude:(double)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setIterationDuration:(double)a3;
- (void)setIterations:(unint64_t)a3;
- (void)setScrollingBounds:(CGRect)a3;
- (void)setTestName:(id)a3;
- (void)setUseFlicks:(BOOL)a3;
@end

@implementation CRNPagingScrollTestParameters

- (CRNPagingScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 amplitude:(double)a6 direction:(int64_t)a7 iterationDuration:(double)a8 useFlicks:(BOOL)a9 completionHandler:(id)a10
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v21 = a3;
  id v22 = a10;
  v32.receiver = self;
  v32.super_class = (Class)CRNPagingScrollTestParameters;
  v23 = [(CRNPagingScrollTestParameters *)&v32 init];
  if (v23)
  {
    uint64_t v24 = [v21 copy];
    testName = v23->_testName;
    v23->_testName = (NSString *)v24;

    v23->_iterations = a4;
    v23->_scrollingBounds.origin.CGFloat x = x;
    v23->_scrollingBounds.origin.CGFloat y = y;
    v23->_scrollingBounds.size.CGFloat width = width;
    v23->_scrollingBounds.size.CGFloat height = height;
    v23->_amplitude = a6;
    v23->_useFlicks = a9;
    v23->_direction = a7;
    v23->_iterationDuration = a8;
    uint64_t v26 = MEMORY[0x237E0E480](v22);
    id completionHandler = v23->_completionHandler;
    v23->_id completionHandler = (id)v26;

    if (a7 == 6 || a7 == 5)
    {
      v28 = [MEMORY[0x263F1C408] sharedApplication];
      uint64_t v29 = [v28 userInterfaceLayoutDirection];
      uint64_t v30 = 1;
      if (v29) {
        uint64_t v30 = 2;
      }
      v23->_realDirection = v30;
    }
    else
    {
      v23->_realDirection = a7;
    }
  }

  return v23;
}

- (id)composerBlock
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__CRNPagingScrollTestParameters_composerBlock__block_invoke;
  v4[3] = &unk_264CC11C0;
  v4[4] = self;
  v2 = (void *)MEMORY[0x237E0E480](v4, a2);
  return v2;
}

void __46__CRNPagingScrollTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  [*(id *)(a1 + 32) scrollingBounds];
  double Midpoint = CRNCGRectGetMidpoint(v3, v4, v5, v6);
  double v9 = v8;
  switch([*(id *)(a1 + 32) realDirection])
  {
    case 2:
      [*(id *)(a1 + 32) scrollingBounds];
      double v10 = CGRectGetMinX(v22) + 1.5;
      [*(id *)(a1 + 32) amplitude];
      double Midpoint = v10 + v12;
      goto LABEL_4;
    case 3:
      [*(id *)(a1 + 32) scrollingBounds];
      double v13 = CGRectGetMaxY(v23) + -1.5;
      [*(id *)(a1 + 32) amplitude];
      double v9 = v13 - v14;
      goto LABEL_7;
    case 4:
      [*(id *)(a1 + 32) scrollingBounds];
      double v13 = CGRectGetMinY(v24) + 1.5;
      [*(id *)(a1 + 32) amplitude];
      double v9 = v13 + v15;
LABEL_7:
      double v10 = Midpoint;
      break;
    default:
      [*(id *)(a1 + 32) scrollingBounds];
      double v10 = CGRectGetMaxX(v21) + -1.5;
      [*(id *)(a1 + 32) amplitude];
      double Midpoint = v10 - v11;
LABEL_4:
      double v13 = v9;
      break;
  }
  if ([*(id *)(a1 + 32) iterations])
  {
    unint64_t v16 = 1;
    do
    {
      v17 = *(void **)(a1 + 32);
      [v17 iterationDuration];
      objc_msgSend(v17, "scrollWithComposer:fromPoint:toPoint:duration:", v19, v10, v13, Midpoint, v9, v18);
      ++v16;
    }
    while (v16 <= [*(id *)(a1 + 32) iterations]);
  }
}

- (void)scrollWithComposer:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 duration:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  id v12 = a3;
  if ([(CRNPagingScrollTestParameters *)self useFlicks])
  {
    objc_msgSend(v12, "sendFlickWithStartPoint:endPoint:duration:", v10, v9, x, y, 0.5);
    [v12 advanceTime:a6 + -0.5];
  }
  else
  {
    objc_msgSend(v12, "dragWithStartPoint:endPoint:duration:", v10, v9, x, y, a6);
  }
}

- (RCPSyntheticEventStream)eventStream
{
  if (RecapLibraryCore_2())
  {
    uint64_t v9 = 0;
    double v10 = &v9;
    uint64_t v11 = 0x2050000000;
    CGFloat v3 = (void *)getRCPSyntheticEventStreamClass_softClass_2;
    uint64_t v12 = getRCPSyntheticEventStreamClass_softClass_2;
    if (!getRCPSyntheticEventStreamClass_softClass_2)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __getRCPSyntheticEventStreamClass_block_invoke_2;
      v8[3] = &unk_264CC1198;
      v8[4] = &v9;
      __getRCPSyntheticEventStreamClass_block_invoke_2((uint64_t)v8);
      CGFloat v3 = (void *)v10[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v9, 8);
    CGFloat v5 = [(CRNPagingScrollTestParameters *)self composerBlock];
    CGFloat v6 = [v4 eventStreamWithEventActions:v5];
  }
  else
  {
    CGFloat v6 = 0;
  }
  return (RCPSyntheticEventStream *)v6;
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

- (unint64_t)iterations
{
  return self->_iterations;
}

- (void)setIterations:(unint64_t)a3
{
  self->_iterations = a3;
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

- (void)setScrollingBounds:(CGRect)a3
{
  self->_scrollingBounds = a3;
}

- (double)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(double)a3
{
  self->_amplitude = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (double)iterationDuration
{
  return self->_iterationDuration;
}

- (void)setIterationDuration:(double)a3
{
  self->_iterationDuration = a3;
}

- (BOOL)useFlicks
{
  return self->_useFlicks;
}

- (void)setUseFlicks:(BOOL)a3
{
  self->_useFlicks = a3;
}

- (int64_t)realDirection
{
  return self->_realDirection;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end