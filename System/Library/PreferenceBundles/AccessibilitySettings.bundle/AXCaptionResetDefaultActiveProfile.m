@interface AXCaptionResetDefaultActiveProfile
@end

@implementation AXCaptionResetDefaultActiveProfile

int64_t __AXCaptionResetDefaultActiveProfile_block_invoke(id a1, id a2, id a3)
{
  id v3 = a3;
  v4 = (void *)MACaptionAppearancePrefCopyProfileOrder();
  v5 = (void *)MACaptionAppearancePrefCopyProfileOrder();

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
    int64_t v6 = (int64_t)[v4 compare:v5];
  }
  else {
    int64_t v6 = -1;
  }

  return v6;
}

@end