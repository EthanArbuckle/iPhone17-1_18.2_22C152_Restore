@interface WFTodoistProject
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
+ (id)collapsedJSONTransformer;
+ (id)colorJSONTransformer;
- (BOOL)collapsed;
- (NSString)name;
- (WFColor)color;
- (int64_t)projectId;
@end

@implementation WFTodoistProject

+ (id)collapsedJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x263F08D50], "mtl_BOOLeanValueTransformer");
}

+ (id)colorJSONTransformer
{
  v27[20] = *MEMORY[0x263EF8340];
  id v19 = (id)MEMORY[0x263F86848];
  v26[0] = &unk_26F076200;
  v25 = [MEMORY[0x263F851A8] colorWithRGBAValue:3089457151];
  v27[0] = v25;
  v26[1] = &unk_26F076218;
  v24 = [MEMORY[0x263F851A8] colorWithRGBAValue:3678418431];
  v27[1] = v24;
  v26[2] = &unk_26F076230;
  v23 = [MEMORY[0x263F851A8] colorWithRGBAValue:4288230399];
  v27[2] = v23;
  v26[3] = &unk_26F076248;
  v22 = [MEMORY[0x263F851A8] colorWithRGBAValue:4207935743];
  v27[3] = v22;
  v26[4] = &unk_26F076260;
  v21 = [MEMORY[0x263F851A8] colorWithRGBAValue:2948086783];
  v27[4] = v21;
  v26[5] = &unk_26F076278;
  v18 = [MEMORY[0x263F851A8] colorWithRGBAValue:2127317503];
  v27[5] = v18;
  v26[6] = &unk_26F076290;
  v17 = [MEMORY[0x263F851A8] colorWithRGBAValue:697579775];
  v27[6] = v17;
  v26[7] = &unk_26F0762A8;
  v16 = [MEMORY[0x263F851A8] colorWithRGBAValue:1791802623];
  v27[7] = v16;
  v26[8] = &unk_26F0762C0;
  v15 = [MEMORY[0x263F851A8] colorWithRGBAValue:361737727];
  v27[8] = v15;
  v26[9] = &unk_26F0762D8;
  v14 = [MEMORY[0x263F851A8] colorWithRGBAValue:346748415];
  v27[9] = v14;
  v26[10] = &unk_26F0762F0;
  v13 = [MEMORY[0x263F851A8] colorWithRGBAValue:2529422335];
  v27[10] = v13;
  v26[11] = &unk_26F076308;
  v2 = [MEMORY[0x263F851A8] colorWithRGBAValue:1081343999];
  v27[11] = v2;
  v26[12] = &unk_26F076320;
  v3 = [MEMORY[0x263F851A8] colorWithRGBAValue:2286813183];
  v27[12] = v3;
  v26[13] = &unk_26F076338;
  v4 = [MEMORY[0x263F851A8] colorWithRGBAValue:2939743231];
  v27[13] = v4;
  v26[14] = &unk_26F076350;
  v5 = [MEMORY[0x263F851A8] colorWithRGBAValue:3952536575];
  v27[14] = v5;
  v26[15] = &unk_26F076368;
  v6 = [MEMORY[0x263F851A8] colorWithRGBAValue:3763442943];
  v27[15] = v6;
  v26[16] = &unk_26F076380;
  v7 = [MEMORY[0x263F851A8] colorWithRGBAValue:4287464959];
  v27[16] = v7;
  v26[17] = &unk_26F076398;
  v8 = [MEMORY[0x263F851A8] colorWithRGBAValue:2155905279];
  v27[17] = v8;
  v26[18] = &unk_26F0763B0;
  v9 = [MEMORY[0x263F851A8] colorWithRGBAValue:3099113727];
  v27[18] = v9;
  v26[19] = &unk_26F0763C8;
  v10 = [MEMORY[0x263F851A8] colorWithRGBAValue:3433862143];
  v27[19] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:20];
  objc_msgSend(v19, "mtl_valueMappingTransformerWithDictionary:", v11);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)JSONKeyPathsByPropertyKey
{
  v5[4] = *MEMORY[0x263EF8340];
  v4[0] = @"projectId";
  v4[1] = @"name";
  v5[0] = @"id";
  v5[1] = @"name";
  v4[2] = @"color";
  v4[3] = @"collapsed";
  v5[2] = @"color";
  v5[3] = @"collapsed";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)collapsed
{
  return self->_collapsed;
}

- (WFColor)color
{
  return self->_color;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)projectId
{
  return self->_projectId;
}

@end