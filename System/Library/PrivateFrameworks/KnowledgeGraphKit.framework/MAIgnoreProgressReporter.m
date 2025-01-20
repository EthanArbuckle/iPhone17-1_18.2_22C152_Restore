@interface MAIgnoreProgressReporter
- (BOOL)isCancelled;
- (BOOL)isCancelledWithProgress:(double)a3 currentTime:(double)a4;
- (MAIgnoreProgressReporter)init;
@end

@implementation MAIgnoreProgressReporter

- (BOOL)isCancelledWithProgress:(double)a3 currentTime:(double)a4
{
  return 0;
}

- (BOOL)isCancelled
{
  return 0;
}

- (MAIgnoreProgressReporter)init
{
  v3.receiver = self;
  v3.super_class = (Class)MAIgnoreProgressReporter;
  return (MAIgnoreProgressReporter *)[(MAProgressReporter *)&v3 initForSubclasses];
}

@end