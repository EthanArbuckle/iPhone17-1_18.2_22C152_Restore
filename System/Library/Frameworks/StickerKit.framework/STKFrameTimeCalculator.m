@interface STKFrameTimeCalculator
+ (id)createFramesFromImages:(id)a3 durations:(id)a4;
- (NSArray)frames;
- (STKFrameTimeCalculator)initWithImages:(id)a3 durations:(id)a4;
- (double)duration;
- (id)imageForDate:(id)a3 playbackStartDate:(id)a4;
- (int64_t)frameCount;
- (int64_t)lastFrameIndex;
- (void)setDuration:(double)a3;
- (void)setFrameCount:(int64_t)a3;
- (void)setFrames:(id)a3;
- (void)setLastFrameIndex:(int64_t)a3;
@end

@implementation STKFrameTimeCalculator

- (STKFrameTimeCalculator)initWithImages:(id)a3 durations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v8 == [v7 count])
  {
    v16.receiver = self;
    v16.super_class = (Class)STKFrameTimeCalculator;
    v9 = [(STKFrameTimeCalculator *)&v16 init];
    if (v9)
    {
      uint64_t v10 = [(id)objc_opt_class() createFramesFromImages:v6 durations:v7];
      frames = v9->_frames;
      v9->_frames = (NSArray *)v10;

      v12 = [(NSArray *)v9->_frames lastObject];
      [v12 end];
      v9->_duration = v13;

      v9->_lastFrameIndex = -1;
    }
    self = v9;
    v14 = self;
  }
  else
  {
    [MEMORY[0x263F4BE58] handleFailedAssertWithCondition:"__objc_no", "-[STKFrameTimeCalculator initWithImages:durations:]", 0, 0, @"frame count and duration count do not match, returning nil" functionName simulateCrash showAlert format];
    v14 = 0;
  }

  return v14;
}

+ (id)createFramesFromImages:(id)a3 durations:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__STKFrameTimeCalculator_createFramesFromImages_durations___block_invoke;
  v10[3] = &unk_2651CCAC8;
  id v7 = v6;
  id v11 = v7;
  v12 = v13;
  uint64_t v8 = objc_msgSend(v5, "itk_map:", v10);

  _Block_object_dispose(v13, 8);

  return v8;
}

SKIFrame *__59__STKFrameTimeCalculator_createFramesFromImages_durations___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectAtIndexedSubscript:a3];
  [v7 doubleValue];
  double v9 = v8;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  double v11 = *(double *)(v10 + 24);
  *(double *)(v10 + 24) = v9 + v11;
  v12 = [[SKIFrame alloc] initWithStart:v6 duration:v11 image:v9];

  return v12;
}

- (id)imageForDate:(id)a3 playbackStartDate:(id)a4
{
  [a3 timeIntervalSinceDate:a4];
  long double v6 = v5;
  [(STKFrameTimeCalculator *)self duration];
  double v8 = fmod(v6, v7);
  double v9 = [(STKFrameTimeCalculator *)self frames];
  if ([(STKFrameTimeCalculator *)self lastFrameIndex] < 0) {
    goto LABEL_9;
  }
  uint64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", -[STKFrameTimeCalculator lastFrameIndex](self, "lastFrameIndex"));
  if ([v10 comparisonForTimeInterval:v8])
  {
    unint64_t v11 = [(STKFrameTimeCalculator *)self lastFrameIndex] + 1;
    unint64_t v12 = v11 % [v9 count];
    double v13 = [v9 objectAtIndexedSubscript:v12];
    if ([v13 comparisonForTimeInterval:v8])
    {
      v14 = 0;
    }
    else
    {
      [(STKFrameTimeCalculator *)self setLastFrameIndex:v12];
      v14 = [v13 image];
    }
  }
  else
  {
    v14 = [v10 image];
  }

  if (!v14)
  {
LABEL_9:
    uint64_t v15 = 0;
    uint64_t v16 = [v9 count] - 1;
    while (1)
    {
      uint64_t v17 = v16 - v15;
      if (v16 < v15) {
        ++v17;
      }
      uint64_t v18 = v15 + (v17 >> 1);
      if (v18 < 0 || v18 >= (unint64_t)[v9 count]) {
        break;
      }
      v19 = [v9 objectAtIndexedSubscript:v18];
      uint64_t v20 = [v19 comparisonForTimeInterval:v8];
      if (v20 == -1)
      {
        v14 = 0;
        uint64_t v15 = v18 + 1;
      }
      else if (v20 == 1)
      {
        v14 = 0;
        uint64_t v16 = v18 - 1;
      }
      else if (v20)
      {
        v14 = 0;
      }
      else
      {
        v14 = [v19 image];
        [(STKFrameTimeCalculator *)self setLastFrameIndex:v18];
      }

      if (v14) {
        goto LABEL_24;
      }
    }
    v14 = 0;
  }
LABEL_24:

  return v14;
}

- (int64_t)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(int64_t)a3
{
  self->_frameCount = a3;
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)lastFrameIndex
{
  return self->_lastFrameIndex;
}

- (void)setLastFrameIndex:(int64_t)a3
{
  self->_lastFrameIndex = a3;
}

- (void).cxx_destruct
{
}

@end