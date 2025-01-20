@interface _NSSharedValueTransformer
- (BOOL)_isBooleanTransformer;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
@end

@implementation _NSSharedValueTransformer

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (BOOL)_isBooleanTransformer
{
  return 0;
}

@end