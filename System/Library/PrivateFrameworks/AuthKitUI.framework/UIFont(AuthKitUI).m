@interface UIFont(AuthKitUI)
+ (id)ak_dynamicFontWithStyle:()AuthKitUI traits:;
+ (id)ak_preferredFontForSize:()AuthKitUI weight:;
+ (id)ak_preferredFontForStyle:()AuthKitUI weight:;
@end

@implementation UIFont(AuthKitUI)

+ (id)ak_dynamicFontWithStyle:()AuthKitUI traits:
{
  v4 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:a4 options:0];
  v5 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v4 size:0.0];

  return v5;
}

+ (id)ak_preferredFontForStyle:()AuthKitUI weight:
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F42A38], "preferredFontDescriptorWithTextStyle:");
  uint64_t v8 = *MEMORY[0x1E4F43940];
  v3 = [NSNumber numberWithDouble:a1];
  v9[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v5 = [v2 fontDescriptorByAddingAttributes:v4];

  v6 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v5 size:0.0];

  return v6;
}

+ (id)ak_preferredFontForSize:()AuthKitUI weight:
{
  v4 = [MEMORY[0x1E4F42A40] defaultMetrics];
  v5 = [MEMORY[0x1E4F42A30] systemFontOfSize:a1 weight:a2];
  v6 = [v4 scaledFontForFont:v5];

  return v6;
}

@end