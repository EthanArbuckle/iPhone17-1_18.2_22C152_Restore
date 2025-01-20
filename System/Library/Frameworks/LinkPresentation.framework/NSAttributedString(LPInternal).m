@interface NSAttributedString(LPInternal)
- (uint64_t)_lp_stringType;
- (void)_lp_setStringType:()LPInternal;
@end

@implementation NSAttributedString(LPInternal)

- (uint64_t)_lp_stringType
{
  v2 = objc_getAssociatedObject(a1, a2);
  v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_lp_setStringType:()LPInternal
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel__lp_stringType, v2, (void *)1);
}

@end