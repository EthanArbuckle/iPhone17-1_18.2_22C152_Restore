@interface MAProgressReporter
+ (MAProgressReporter)ignoreProgress;
+ (MAProgressReporter)progressReporterWithProgressBlock:(id)a3;
- (BOOL)isCancelled;
- (BOOL)isCancelledWithProgress:(double)a3;
- (BOOL)isCancelledWithProgress:(double)a3 currentTime:(double)a4;
- (BOOL)isCancelledWithUnitsCompleted:(unint64_t)a3 outOf:(unint64_t)a4;
- (id)childProgressReporterForStep:(unint64_t)a3 outOf:(unint64_t)a4;
- (id)childProgressReporterFromStart:(double)a3 toEnd:(double)a4;
- (id)childProgressWithOffset:(double)a3 scale:(double)a4;
- (id)initForSubclasses;
- (id)progressReportersForParallelOperationsWithCount:(unint64_t)a3;
@end

@implementation MAProgressReporter

- (id)progressReportersForParallelOperationsWithCount:(unint64_t)a3
{
  v4 = [[MAParallelProgress alloc] initWithProgressReporter:self parallelOperationCount:a3];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
  if (a3)
  {
    uint64_t v6 = 0;
    do
    {
      v7 = [[MAParallelProgressReporter alloc] initWithParallelProgress:v4 index:v6];
      [v5 addObject:v7];

      ++v6;
    }
    while (a3 != v6);
  }

  return v5;
}

+ (MAProgressReporter)progressReporterWithProgressBlock:(id)a3
{
  id v3 = a3;
  v4 = [[MALegacyProgressReporter alloc] initWithProgressBlock:v3];

  return (MAProgressReporter *)v4;
}

+ (MAProgressReporter)ignoreProgress
{
  v2 = objc_alloc_init(MAIgnoreProgressReporter);
  return (MAProgressReporter *)v2;
}

- (id)childProgressReporterForStep:(unint64_t)a3 outOf:(unint64_t)a4
{
  return [(MAProgressReporter *)self childProgressWithOffset:(double)a3 / (double)a4 scale:1.0 / (double)a4];
}

- (id)childProgressReporterFromStart:(double)a3 toEnd:(double)a4
{
  return [(MAProgressReporter *)self childProgressWithOffset:a3 scale:a4 - a3];
}

- (id)childProgressWithOffset:(double)a3 scale:(double)a4
{
  KGAbstractMethodException(self, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (BOOL)isCancelledWithUnitsCompleted:(unint64_t)a3 outOf:(unint64_t)a4
{
  return [(MAProgressReporter *)self isCancelledWithProgress:(double)a3 / (double)a4];
}

- (BOOL)isCancelledWithProgress:(double)a3 currentTime:(double)a4
{
  KGAbstractMethodException(self, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (BOOL)isCancelledWithProgress:(double)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  return [(MAProgressReporter *)self isCancelledWithProgress:a3 currentTime:Current];
}

- (BOOL)isCancelled
{
  KGAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)initForSubclasses
{
  v3.receiver = self;
  v3.super_class = (Class)MAProgressReporter;
  return [(MAProgressReporter *)&v3 init];
}

@end