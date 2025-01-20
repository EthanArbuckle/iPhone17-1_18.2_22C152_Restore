@interface TTKSimpleContinuousPathGenerator
- (BOOL)canHandleDoubleLetter;
- (TTKSimpleContinuousPathGenerator)initWithParams:(id)a3;
- (id)generatePathFromInflectionPoints:(id)a3 segmentTiming:(id)a4 keys:(id)a5 string:(id)a6 layout:(id)a7;
- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 duration:(double)a5 segmentTiming:(id)a6 keys:(id)a7 string:(id)a8 layout:(id)a9;
- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 segmentTiming:(id)a5 keys:(id)a6 string:(id)a7 layout:(id)a8;
@end

@implementation TTKSimpleContinuousPathGenerator

- (TTKSimpleContinuousPathGenerator)initWithParams:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TTKSimpleContinuousPathGenerator;
  return [(TTKDefaultContinuousPathGenerator *)&v4 initWithParams:a3];
}

- (id)generatePathFromInflectionPoints:(id)a3 segmentTiming:(id)a4 keys:(id)a5 string:(id)a6 layout:(id)a7
{
  return [(TTKSimpleContinuousPathGenerator *)self generatePathFromInflectionPoints:a3 timestamp:a4 segmentTiming:a5 keys:a6 string:a7 layout:0.0];
}

- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 segmentTiming:(id)a5 keys:(id)a6 string:(id)a7 layout:(id)a8
{
  return [(TTKSimpleContinuousPathGenerator *)self generatePathFromInflectionPoints:a3 timestamp:a5 duration:a6 segmentTiming:a7 keys:a8 string:a4 layout:-1.0];
}

- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 duration:(double)a5 segmentTiming:(id)a6 keys:(id)a7 string:(id)a8 layout:(id)a9
{
  id v13 = a3;
  id v14 = a6;
  v15 = objc_alloc_init(TIContinuousPath);
  self->_double currentTimestamp = a4;
  [(TTKDefaultContinuousPathGenerator *)self timeDelta];
  double v17 = v16;
  if (a5 != -1.0)
  {
    id v18 = [v13 count];
    double v19 = 0.0;
    if ((unint64_t)v18 >= 2)
    {
      uint64_t v20 = 0;
      unint64_t v21 = 1;
      do
      {
        v22 = objc_msgSend(v14, "objectAtIndexedSubscript:", v21 - 1, v19);
        v20 += (uint64_t)[v22 count];

        ++v21;
      }
      while (v21 < (unint64_t)[v13 count]);
      double v19 = (double)v20;
    }
    double v17 = a5 / v19;
  }
  long long v46 = 0uLL;
  v23 = [v13 objectAtIndexedSubscript:0];
  [v23 getValue:&v46];

  if ((unint64_t)[v13 count] >= 2)
  {
    unint64_t v24 = 1;
    do
    {
      v25 = objc_msgSend(v13, "objectAtIndexedSubscript:", v24, 0, 0);
      [v25 getValue:&v45];

      v26 = [v14 objectAtIndexedSubscript:v24 - 1];
      if ([v26 count])
      {
        unint64_t v27 = 0;
        do
        {
          [(TTKDefaultContinuousPathGenerator *)self subtractPoint:v45 byPoint:v46];
          double v29 = v28;
          double v31 = v30;
          v32 = [v26 objectAtIndex:v27];
          [v32 floatValue];
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v29, v31, v33);
          -[TTKDefaultContinuousPathGenerator addPoint:andPoint:](self, "addPoint:andPoint:", v46, v34, v35);
          double v37 = v36;
          double v39 = v38;

          v40 = [TIContinuousPathSample alloc];
          double currentTimestamp = self->_currentTimestamp;
          [(TTKDefaultContinuousPathGenerator *)self force];
          v43 = -[TIContinuousPathSample initWithPoint:timeStamp:force:radius:stage:pathIndex:](v40, "initWithPoint:timeStamp:force:radius:stage:pathIndex:", 7, -1, v37, v39, currentTimestamp, v42, 0.0);
          [(TIContinuousPath *)v15 addSample:v43];
          self->_double currentTimestamp = v17 + self->_currentTimestamp;

          ++v27;
        }
        while (v27 < (unint64_t)[v26 count]);
      }
      long long v46 = v45;

      ++v24;
    }
    while (v24 < (unint64_t)[v13 count]);
  }

  return v15;
}

- (BOOL)canHandleDoubleLetter
{
  return 0;
}

@end