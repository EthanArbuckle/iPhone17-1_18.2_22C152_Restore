@interface __NSMallocBlock
- (__NSMallocBlock)retain;
- (unint64_t)retainCount;
@end

@implementation __NSMallocBlock

- (__NSMallocBlock)retain
{
  return self;
}

- (unint64_t)retainCount
{
  return 1;
}

@end