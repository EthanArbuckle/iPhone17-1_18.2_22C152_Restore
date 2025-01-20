@interface UIFont(ITKUtilities)
+ (id)itk_preferredFontWithTextStyle:()ITKUtilities weight:;
- (id)itk_fontWithWeight:()ITKUtilities;
@end

@implementation UIFont(ITKUtilities)

+ (id)itk_preferredFontWithTextStyle:()ITKUtilities weight:
{
  v3 = objc_msgSend(a1, "preferredFontForTextStyle:");
  v4 = objc_msgSend(v3, "itk_fontWithWeight:", a2);

  return v4;
}

- (id)itk_fontWithWeight:()ITKUtilities
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v12 = *MEMORY[0x263F83528];
  uint64_t v10 = *MEMORY[0x263F83650];
  v2 = objc_msgSend(NSNumber, "numberWithDouble:");
  v11 = v2;
  v3 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];

  v5 = [a1 fontDescriptor];
  v6 = [v5 fontDescriptorByAddingAttributes:v4];

  v7 = (void *)MEMORY[0x263F82760];
  [a1 pointSize];
  v8 = objc_msgSend(v7, "fontWithDescriptor:size:", v6);

  return v8;
}

@end