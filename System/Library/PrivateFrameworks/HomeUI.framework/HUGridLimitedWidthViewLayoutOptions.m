@interface HUGridLimitedWidthViewLayoutOptions
+ (id)defaultOptionsForViewSize:(CGSize)a3 columnStyle:(unint64_t)a4 overrideSizeSubclass:(id)a5;
@end

@implementation HUGridLimitedWidthViewLayoutOptions

+ (id)defaultOptionsForViewSize:(CGSize)a3 columnStyle:(unint64_t)a4 overrideSizeSubclass:(id)a5
{
  double width = a3.width;
  v15[3] = *MEMORY[0x1E4F143B8];
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___HUGridLimitedWidthViewLayoutOptions;
  v6 = objc_msgSendSuper2(&v13, sel_defaultOptionsForViewSize_columnStyle_overrideSizeSubclass_, a4, a5, a3.width, a3.height);
  v7 = v6;
  if (width <= 500.0) {
    double v8 = 20.0;
  }
  else {
    double v8 = (width + -500.0) * 0.5;
  }
  uint64_t v9 = [v6 viewSizeSubclass];
  v14[0] = &unk_1F19B5030;
  v14[1] = &unk_1F19B5018;
  v15[0] = &unk_1F19B6380;
  v15[1] = &unk_1F19B6390;
  v14[2] = &unk_1F19B5090;
  v10 = [NSNumber numberWithDouble:v8];
  v15[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  objc_msgSend(v7, "setSectionLeadingMargin:", HUConstantFloatForViewSizeSubclass(v9, v11));

  [v7 sectionLeadingMargin];
  objc_msgSend(v7, "setSectionTrailingMargin:");

  return v7;
}

@end