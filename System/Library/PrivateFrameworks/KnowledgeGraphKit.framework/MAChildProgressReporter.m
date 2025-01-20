@interface MAChildProgressReporter
- (BOOL)isCancelled;
- (BOOL)isCancelledWithProgress:(double)a3 currentTime:(double)a4;
- (MAChildProgressReporter)initWithParentProgress:(id)a3 offset:(double)a4 scale:(double)a5;
- (MAProgressReporter)parentProgress;
- (double)offset;
- (double)scale;
- (id)childProgressWithOffset:(double)a3 scale:(double)a4;
@end

@implementation MAChildProgressReporter

- (void).cxx_destruct
{
}

- (double)scale
{
  return self->_scale;
}

- (double)offset
{
  return self->_offset;
}

- (MAProgressReporter)parentProgress
{
  return self->_parentProgress;
}

- (id)childProgressWithOffset:(double)a3 scale:(double)a4
{
  double scale = self->_scale;
  v5 = [[MAChildProgressReporter alloc] initWithParentProgress:self->_parentProgress offset:self->_offset + a3 * scale scale:scale * a4];
  return v5;
}

- (BOOL)isCancelledWithProgress:(double)a3 currentTime:(double)a4
{
  return [(MAProgressReporter *)self->_parentProgress isCancelledWithProgress:self->_offset + a3 * self->_scale currentTime:a4];
}

- (BOOL)isCancelled
{
  return [(MAProgressReporter *)self->_parentProgress isCancelled];
}

- (MAChildProgressReporter)initWithParentProgress:(id)a3 offset:(double)a4 scale:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MAChildProgressReporter;
  v10 = [(MAProgressReporter *)&v13 initForSubclasses];
  v11 = (MAChildProgressReporter *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 1, a3);
    v11->_offset = a4;
    v11->_double scale = a5;
  }

  return v11;
}

@end