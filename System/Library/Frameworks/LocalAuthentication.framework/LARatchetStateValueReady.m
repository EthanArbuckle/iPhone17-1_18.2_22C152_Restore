@interface LARatchetStateValueReady
- (double)duration;
@end

@implementation LARatchetStateValueReady

- (double)duration
{
  v3.receiver = self;
  v3.super_class = (Class)LARatchetStateValueReady;
  [(LARatchetStateValue *)&v3 duration];
  return result;
}

@end