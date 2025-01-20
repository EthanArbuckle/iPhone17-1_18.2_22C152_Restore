@interface NSNumber(AuthKit)
- (BOOL)ak_isBoolean;
- (id)ak_BOOLeanAsInteger;
- (uint64_t)ak_bucketWithSize:()AuthKit;
@end

@implementation NSNumber(AuthKit)

- (BOOL)ak_isBoolean
{
  CFTypeID TypeID = CFBooleanGetTypeID();
  return CFGetTypeID(a1) == TypeID;
}

- (id)ak_BOOLeanAsInteger
{
  if (objc_msgSend(a1, "ak_isBoolean"))
  {
    objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "integerValue"));
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v2 = a1;
  }

  return v2;
}

- (uint64_t)ak_bucketWithSize:()AuthKit
{
  if ([a1 integerValue] < 1) {
    return 0;
  }
  uint64_t result = [a1 integerValue];
  if (a3 >= 2) {
    return a3 + a3 * ((result - 1) / a3);
  }
  return result;
}

@end