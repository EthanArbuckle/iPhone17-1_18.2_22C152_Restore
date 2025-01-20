@interface NSData(NSDataExtensions)
- (id)mf_subdataWithRange:()NSDataExtensions;
- (uint64_t)mf_immutable;
@end

@implementation NSData(NSDataExtensions)

- (id)mf_subdataWithRange:()NSDataExtensions
{
  BOOL v7 = 0;
  if (sDefaultThreshold <= a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        BOOL v7 = 1;
      }
    }
  }
  id v8 = -[MFData _initWithRange:from:retainingParent:]([MFData alloc], "_initWithRange:from:retainingParent:", a3, a4, a1, v7);
  return v8;
}

- (uint64_t)mf_immutable
{
  return 0;
}

@end