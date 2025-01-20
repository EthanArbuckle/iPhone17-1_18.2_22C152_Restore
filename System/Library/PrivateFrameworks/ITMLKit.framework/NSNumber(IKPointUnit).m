@interface NSNumber(IKPointUnit)
- (__CFString)ik_unitStringValue;
- (uint64_t)ik_unit;
- (void)ik_setUnit:()IKPointUnit;
@end

@implementation NSNumber(IKPointUnit)

- (uint64_t)ik_unit
{
  v1 = objc_getAssociatedObject(a1, sel_ik_unit);
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (void)ik_setUnit:()IKPointUnit
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_ik_unit, v2, (void *)1);
}

- (__CFString)ik_unitStringValue
{
  uint64_t v1 = objc_msgSend(a1, "ik_unit");
  id v2 = &stru_1F3E09950;
  if (v1 == 2) {
    id v2 = @"%";
  }
  if (v1 == 1) {
    return @"pt";
  }
  else {
    return v2;
  }
}

@end