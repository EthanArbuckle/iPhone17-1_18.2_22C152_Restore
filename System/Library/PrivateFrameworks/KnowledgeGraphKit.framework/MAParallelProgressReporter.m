@interface MAParallelProgressReporter
- (BOOL)isCancelled;
- (BOOL)isCancelledWithProgress:(double)a3;
- (MAParallelProgress)parallelProgress;
- (MAParallelProgressReporter)initWithParallelProgress:(id)a3 index:(unint64_t)a4;
- (id)childProgressWithOffset:(double)a3 scale:(double)a4;
- (unint64_t)index;
@end

@implementation MAParallelProgressReporter

- (void).cxx_destruct
{
}

- (unint64_t)index
{
  return self->_index;
}

- (MAParallelProgress)parallelProgress
{
  return self->_parallelProgress;
}

- (id)childProgressWithOffset:(double)a3 scale:(double)a4
{
  v4 = [[MAChildProgressReporter alloc] initWithParentProgress:self offset:a3 scale:a4];
  return v4;
}

- (BOOL)isCancelledWithProgress:(double)a3
{
  return [(MAParallelProgress *)self->_parallelProgress isCancelledWithProgress:self->_index index:a3];
}

- (BOOL)isCancelled
{
  return [(MAParallelProgress *)self->_parallelProgress isCancelled];
}

- (MAParallelProgressReporter)initWithParallelProgress:(id)a3 index:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MAParallelProgressReporter;
  v8 = [(MAProgressReporter *)&v11 initForSubclasses];
  v9 = (MAParallelProgressReporter *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 1, a3);
    v9->_index = a4;
  }

  return v9;
}

@end