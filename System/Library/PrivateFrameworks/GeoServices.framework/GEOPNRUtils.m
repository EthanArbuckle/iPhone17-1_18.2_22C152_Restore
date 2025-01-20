@interface GEOPNRUtils
+ (id)_stringByStrippingFormattingAndNotVisiblyAllowable:(id)a3;
@end

@implementation GEOPNRUtils

+ (id)_stringByStrippingFormattingAndNotVisiblyAllowable:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (MEMORY[0x1E4F8A218])
  {
    v6 = (const void *)_PNCreateStringByStrippingFormattingAndNotVisiblyAllowable();
    CFAutorelease(v6);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v3;
  }
  v7 = v5;

  return v7;
}

@end