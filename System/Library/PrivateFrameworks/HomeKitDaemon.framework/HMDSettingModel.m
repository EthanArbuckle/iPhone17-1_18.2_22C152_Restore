@interface HMDSettingModel
+ (id)hmbProperties;
- (BOOL)setSettingValue:(id)a3;
- (id)copyWithNewParentModelID:(id)a3;
@end

@implementation HMDSettingModel

- (id)copyWithNewParentModelID:(id)a3
{
  id v4 = a3;
  v5 = [HMDSettingModel alloc];
  v6 = [(HMBModel *)self hmbModelID];
  v7 = [(HMBModel *)v5 initWithModelID:v6 parentModelID:v4];

  v8 = [(HMDSettingModel *)self type];
  [(HMDSettingModel *)v7 setType:v8];

  v9 = [(HMDSettingModel *)self properties];
  [(HMDSettingModel *)v7 setProperties:v9];

  v10 = [(HMDSettingModel *)self name];
  [(HMDSettingModel *)v7 setName:v10];

  v11 = [(HMDSettingModel *)self numberValue];
  [(HMDSettingModel *)v7 setNumberValue:v11];

  v12 = [(HMDSettingModel *)self stringValue];
  [(HMDSettingModel *)v7 setStringValue:v12];

  v13 = [(HMDSettingModel *)self dataValue];
  [(HMDSettingModel *)v7 setDataValue:v13];

  v14 = [(HMDSettingModel *)self selectionIdentifier];
  [(HMDSettingModel *)v7 setSelectionIdentifier:v14];

  v15 = [(HMDSettingModel *)self selectionValue];
  [(HMDSettingModel *)v7 setSelectionValue:v15];

  return v7;
}

- (BOOL)setSettingValue:(id)a3
{
  id v4 = a3;
  switch([v4 type])
  {
    case 1:
      v5 = [v4 dataValue];
      [(HMDSettingModel *)self setDataValue:v5];
      goto LABEL_7;
    case 2:
      v5 = [v4 numberValue];
      [(HMDSettingModel *)self setNumberValue:v5];
      goto LABEL_7;
    case 3:
      v5 = [v4 stringValue];
      [(HMDSettingModel *)self setStringValue:v5];
      goto LABEL_7;
    case 4:
      v7 = [v4 selectionIdentifier];
      [(HMDSettingModel *)self setSelectionIdentifier:v7];

      v5 = [v4 selectionValue];
      [(HMDSettingModel *)self setSelectionValue:v5];
LABEL_7:

      goto LABEL_8;
    case 5:
LABEL_8:
      BOOL v6 = 1;
      break;
    default:
      BOOL v6 = 0;
      break;
  }

  return v6;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_58759 != -1) {
    dispatch_once(&hmbProperties_onceToken_58759, &__block_literal_global_58760);
  }
  v2 = (void *)hmbProperties__properties_58761;
  return v2;
}

void __32__HMDSettingModel_hmbProperties__block_invoke()
{
  v11[8] = *MEMORY[0x263EF8340];
  v10[0] = @"type";
  v0 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v11[0] = v0;
  v10[1] = @"properties";
  v1 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v11[1] = v1;
  v10[2] = @"name";
  v2 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v11[2] = v2;
  v10[3] = @"numberValue";
  v3 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v11[3] = v3;
  v10[4] = @"stringValue";
  id v4 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v11[4] = v4;
  v10[5] = @"dataValue";
  v5 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v11[5] = v5;
  v10[6] = @"selectionIdentifier";
  BOOL v6 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v11[6] = v6;
  v10[7] = @"selectionValue";
  v7 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v11[7] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:8];
  v9 = (void *)hmbProperties__properties_58761;
  hmbProperties__properties_58761 = v8;
}

@end