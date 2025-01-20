@interface HUSymbolIconColorConfiguration
+ (id)iconColorConfigurationForItem:(id)a3;
+ (id)iconColorConfigurationForSymbolIconAccessoryType:(id)a3;
+ (id)iconColorConfigurationForSymbolIconIdentifier:(id)a3;
- (HUSymbolIconColorConfiguration)initWithPrimaryColor:(id)a3;
- (UIColor)activeIconBackgroundColor;
- (UIColor)disabledIconBackgroundColor;
- (UIColor)disabledIconColor;
- (UIColor)iconBackgroundColorInDescriptiveView;
- (UIColor)iconColorInDescriptiveView;
- (UIColor)inactiveIconBackgroundColor;
- (UIColor)primaryColor;
- (void)setPrimaryColor:(id)a3;
@end

@implementation HUSymbolIconColorConfiguration

+ (id)iconColorConfigurationForItem:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F1A3D558]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  objc_opt_class();
  v7 = [v6 homeKitObject];

  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  v10 = objc_msgSend(v9, "hf_effectiveServiceType");

  if (v10)
  {
    if (_MergedGlobals_618 != -1) {
      dispatch_once(&_MergedGlobals_618, &__block_literal_global_76_0);
    }
    id v11 = (id)qword_1EBA477E8;
    v12 = [v11 objectForKeyedSubscript:v10];
    v13 = [a1 iconColorConfigurationForSymbolIconAccessoryType:v12];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __64__HUSymbolIconColorConfiguration_iconColorConfigurationForItem___block_invoke_2()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F68CD8];
  uint64_t v1 = *MEMORY[0x1E4F2DE28];
  v5[0] = *MEMORY[0x1E4F2DE78];
  v5[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F68CD0];
  v6[0] = v0;
  v6[1] = v2;
  v5[2] = *MEMORY[0x1E4F2DE88];
  v6[2] = *MEMORY[0x1E4F68CE0];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  id v4 = (void *)qword_1EBA477E8;
  qword_1EBA477E8 = v3;
}

+ (id)iconColorConfigurationForSymbolIconIdentifier:(id)a3
{
  id v4 = HFSymbolIconAccessoryTypeForSymbol();
  v5 = [a1 iconColorConfigurationForSymbolIconAccessoryType:v4];

  return v5;
}

+ (id)iconColorConfigurationForSymbolIconAccessoryType:(id)a3
{
  uint64_t v3 = +[HUSymbolIconColorProvider primaryColorForSymbolIconAccessoryType:a3];
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPrimaryColor:v3];

  return v4;
}

- (HUSymbolIconColorConfiguration)initWithPrimaryColor:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)HUSymbolIconColorConfiguration;
    id v6 = [(HUSymbolIconColorConfiguration *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_primaryColor, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (UIColor)disabledIconColor
{
  return 0;
}

- (UIColor)activeIconBackgroundColor
{
  return 0;
}

- (UIColor)inactiveIconBackgroundColor
{
  return 0;
}

- (UIColor)disabledIconBackgroundColor
{
  return 0;
}

- (UIColor)iconColorInDescriptiveView
{
  return 0;
}

- (UIColor)iconBackgroundColorInDescriptiveView
{
  return 0;
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (void)setPrimaryColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end