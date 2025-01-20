@interface MARootProgressReporter
- (BOOL)isCancelled;
- (BOOL)isCancelledWithProgress:(double)a3 currentTime:(double)a4;
- (MARootProgressReporter)init;
- (MARootProgressReporter)initWithProgressBlock:(id)a3;
- (double)progress;
- (id)childProgressWithOffset:(double)a3 scale:(double)a4;
- (id)progressBlock;
- (void)cancelOperation;
- (void)setIsCancelled:(BOOL)a3;
@end

@implementation MARootProgressReporter

- (void).cxx_destruct
{
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (double)progress
{
  return self->_progress;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (id)childProgressWithOffset:(double)a3 scale:(double)a4
{
  v4 = [[MAChildProgressReporter alloc] initWithParentProgress:self offset:a3 scale:a4];
  return v4;
}

- (BOOL)isCancelledWithProgress:(double)a3 currentTime:(double)a4
{
  BOOL v7 = [(MARootProgressReporter *)self isCancelled];
  if (!v7)
  {
    self->_progress = a3;
    if (a3 == 1.0 || a4 - self->_lastProgressCallTime >= 0.01)
    {
      self->_lastProgressCallTime = a4;
      (*((void (**)(double))self->_progressBlock + 2))(a3);
    }
  }
  return v7;
}

- (void)cancelOperation
{
}

- (MARootProgressReporter)init
{
  v6.receiver = self;
  v6.super_class = (Class)MARootProgressReporter;
  v2 = [(MAProgressReporter *)&v6 initForSubclasses];
  v3 = v2;
  if (v2)
  {
    v4 = (void *)v2[3];
    v2[3] = &__block_literal_global;

    v3[4] = 0;
    *((unsigned char *)v3 + 16) = 0;
    v3[1] = 0;
  }
  return (MARootProgressReporter *)v3;
}

- (MARootProgressReporter)initWithProgressBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MARootProgressReporter;
  v5 = [(MAProgressReporter *)&v9 initForSubclasses];
  if (v5)
  {
    objc_super v6 = _Block_copy(v4);
    id progressBlock = v5->_progressBlock;
    v5->_id progressBlock = v6;

    v5->_progress = 0.0;
    v5->_isCancelled = 0;
    v5->_lastProgressCallTime = 0.0;
  }

  return v5;
}

@end