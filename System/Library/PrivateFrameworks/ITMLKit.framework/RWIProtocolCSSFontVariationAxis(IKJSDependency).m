@interface RWIProtocolCSSFontVariationAxis(IKJSDependency)
+ (id)safe_initWithTag:()IKJSDependency minimumValue:maximumValue:defaultValue:;
@end

@implementation RWIProtocolCSSFontVariationAxis(IKJSDependency)

+ (id)safe_initWithTag:()IKJSDependency minimumValue:maximumValue:defaultValue:
{
  v13[4] = *MEMORY[0x1E4F143B8];
  double v10 = a2;
  double v11 = a1;
  double v9 = a3;
  id v12 = a6;
  v13[0] = &v12;
  v13[1] = &v11;
  v13[2] = &v10;
  v13[3] = &v9;
  id v6 = objc_alloc(MEMORY[0x1E4FB6BD8]);
  v7 = objc_msgSend(v6, "ik_initWithSelectorString:arguments:", @"initWithTag:minimumValue:maximumValue:defaultValue:", v13);

  return v7;
}

@end