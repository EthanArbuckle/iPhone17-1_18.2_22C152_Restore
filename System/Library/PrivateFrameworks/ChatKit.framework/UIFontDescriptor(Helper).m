@interface UIFontDescriptor(Helper)
- (id)ck_fontDescriptorByAddingSymbolicTrait:()Helper;
- (id)ck_fontDescriptorByRemovingSymbolicTrait:()Helper;
- (id)ck_fontDescriptorBySettingBoldEnabled:()Helper;
- (id)ck_fontDescriptorBySettingItalicEnabled:()Helper;
- (uint64_t)ck_hasBoldTrait;
- (uint64_t)ck_hasItalicTrait;
@end

@implementation UIFontDescriptor(Helper)

- (id)ck_fontDescriptorByRemovingSymbolicTrait:()Helper
{
  if (([a1 symbolicTraits] & a3) != 0)
  {
    objc_msgSend(a1, "fontDescriptorWithSymbolicTraits:", objc_msgSend(a1, "symbolicTraits") & ~a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = a1;
  }

  return v5;
}

- (id)ck_fontDescriptorByAddingSymbolicTrait:()Helper
{
  if (([a1 symbolicTraits] & a3) != 0)
  {
    id v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "fontDescriptorWithSymbolicTraits:", objc_msgSend(a1, "symbolicTraits") | a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (uint64_t)ck_hasItalicTrait
{
  return [a1 symbolicTraits] & 1;
}

- (uint64_t)ck_hasBoldTrait
{
  return ([a1 symbolicTraits] >> 1) & 1;
}

- (id)ck_fontDescriptorBySettingBoldEnabled:()Helper
{
  if (a3) {
    objc_msgSend(a1, "ck_fontDescriptorByAddingSymbolicTrait:", 2);
  }
  else {
  v3 = objc_msgSend(a1, "ck_fontDescriptorByRemovingSymbolicTrait:", 2);
  }

  return v3;
}

- (id)ck_fontDescriptorBySettingItalicEnabled:()Helper
{
  if (a3) {
    objc_msgSend(a1, "ck_fontDescriptorByAddingSymbolicTrait:", 1);
  }
  else {
  v3 = objc_msgSend(a1, "ck_fontDescriptorByRemovingSymbolicTrait:", 1);
  }

  return v3;
}

@end