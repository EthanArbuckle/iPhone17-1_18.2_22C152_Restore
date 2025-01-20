@interface MALegacyProgressReporter
- (BOOL)isCancelled;
- (BOOL)isCancelledWithProgress:(double)a3 currentTime:(double)a4;
- (MALegacyProgressReporter)initWithProgressBlock:(id)a3;
- (id)childProgressWithOffset:(double)a3 scale:(double)a4;
- (id)progressBlock;
- (void)setIsCancelled:(BOOL)a3;
@end

@implementation MALegacyProgressReporter

- (void).cxx_destruct
{
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
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
  p_isCancelled = &self->_isCancelled;
  if (self->_isCancelled) {
    return 1;
  }
  if (a3 != 1.0 && a4 - self->_lastProgressCallTime < 0.01) {
    return 0;
  }
  self->_lastProgressCallTime = a4;
  (*((void (**)(void))self->_progressBlock + 2))();
  return *p_isCancelled;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (MALegacyProgressReporter)initWithProgressBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MALegacyProgressReporter;
  v5 = [(MAProgressReporter *)&v9 initForSubclasses];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id progressBlock = v5->_progressBlock;
    v5->_id progressBlock = v6;

    v5->_isCancelled = 0;
    v5->_lastProgressCallTime = 0.0;
  }

  return v5;
}

@end