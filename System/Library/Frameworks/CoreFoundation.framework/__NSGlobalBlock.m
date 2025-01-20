@interface __NSGlobalBlock
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (unint64_t)retainCount;
@end

@implementation __NSGlobalBlock

- (unint64_t)retainCount
{
  return 1;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

@end