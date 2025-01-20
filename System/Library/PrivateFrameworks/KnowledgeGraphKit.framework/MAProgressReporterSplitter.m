@interface MAProgressReporterSplitter
- (MAProgressReporterSplitter)initWithProgressReporter:(id)a3;
- (id)childProgressReporterToCheckpoint:(double)a3;
@end

@implementation MAProgressReporterSplitter

- (void).cxx_destruct
{
}

- (id)childProgressReporterToCheckpoint:(double)a3
{
  id result = [(MAProgressReporter *)self->_progressReporter childProgressReporterFromStart:self->_previousCheckpoint toEnd:a3];
  self->_previousCheckpoint = a3;
  return result;
}

- (MAProgressReporterSplitter)initWithProgressReporter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAProgressReporterSplitter;
  v6 = [(MAProgressReporterSplitter *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_progressReporter, a3);
    v7->_previousCheckpoint = 0.0;
  }

  return v7;
}

@end