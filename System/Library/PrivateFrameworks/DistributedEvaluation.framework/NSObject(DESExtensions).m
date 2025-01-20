@interface NSObject(DESExtensions)
- (id)_fides_objectByReplacingValue:()DESExtensions withValue:;
@end

@implementation NSObject(DESExtensions)

- (id)_fides_objectByReplacingValue:()DESExtensions withValue:
{
  id v6 = a4;
  if ([a3 isEqual:a1]) {
    v7 = v6;
  }
  else {
    v7 = a1;
  }
  id v8 = v7;

  return v8;
}

@end