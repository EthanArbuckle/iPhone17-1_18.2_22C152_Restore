@interface UIFont
+ (id)bsui_defaultFont:(void *)a3 forTextStyle:(uint64_t)a4 hiFontStyle:(void *)a5 contentSizeCategory:;
@end

@implementation UIFont

+ (id)bsui_defaultFont:(void *)a3 forTextStyle:(uint64_t)a4 hiFontStyle:(void *)a5 contentSizeCategory:
{
  id v8 = a3;
  id v9 = a5;
  self;
  if (v9) {
    [MEMORY[0x1E4F42F80] traitCollectionWithPreferredContentSizeCategory:v9];
  }
  else {
  v10 = [MEMORY[0x1E4F42F80] currentTraitCollection];
  }
  if (a4 == 1)
  {
    if (a2) {
      [MEMORY[0x1E4F42A30] defaultFontForTextStyle:v8];
    }
    else {
    v13 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v8 compatibleWithTraitCollection:v10];
    }
  }
  else
  {
    uint64_t v11 = (a4 << 12) & 0x18000 | (a4 >> 1) & 3;
    if (a2)
    {
      v12 = [MEMORY[0x1E4F42A38] defaultFontDescriptorWithTextStyle:v8 addingSymbolicTraits:(a4 << 12) & 0x18000 | (a4 >> 1) & 3 options:0];
    }
    else
    {
      v14 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:v8 compatibleWithTraitCollection:v10];
      uint64_t v15 = [v14 fontDescriptorWithSymbolicTraits:v11];

      v12 = (void *)v15;
    }
    v13 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v12 size:0.0];
  }

  return v13;
}

@end