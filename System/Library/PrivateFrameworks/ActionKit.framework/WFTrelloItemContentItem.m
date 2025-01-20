@interface WFTrelloItemContentItem
+ (BOOL)canLowercaseTypeDescription;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
- (id)preferredFileType;
@end

@implementation WFTrelloItemContentItem

+ (id)contentCategories
{
  return (id)MEMORY[0x263EFFA68];
}

+ (BOOL)canLowercaseTypeDescription
{
  return 0;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Trello items");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Trello items", @"Trello items");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Trello item", @"Trello item");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)stringConversionBehavior
{
  v2 = (void *)MEMORY[0x263F337E0];
  id v3 = [a1 propertyForName:@"Name"];
  v4 = [v2 accessingProperty:v3];

  return v4;
}

+ (id)propertyBuilders
{
  v13[4] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F33808] block:&__block_literal_global_1407 name:@"Description" class:objc_opt_class()];
  id v3 = [v2 userInfo:@"WFTrelloDescriptionProperty"];
  v13[0] = v3;
  v4 = [MEMORY[0x263F33808] block:&__block_literal_global_175 name:@"URL" class:objc_opt_class()];
  v5 = [v4 userInfo:@"WFTrelloURLProperty"];
  v13[1] = v5;
  v6 = [MEMORY[0x263F33808] block:&__block_literal_global_181 name:@"Card Due Date" class:objc_opt_class()];
  v7 = [v6 userInfo:@"WFTrelloDueDateProperty"];
  v13[2] = v7;
  v8 = [MEMORY[0x263F33808] block:&__block_literal_global_187 name:@"Card Attachments" class:objc_opt_class()];
  v9 = [v8 multipleValues:1];
  v10 = [v9 userInfo:@"WFTrelloAttachmentsProperty"];
  v13[3] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:4];

  return v11;
}

uint64_t __43__WFTrelloItemContentItem_propertyBuilders__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, void))(a4 + 16))(a4, 0);
}

uint64_t __43__WFTrelloItemContentItem_propertyBuilders__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, void))(a4 + 16))(a4, 0);
}

uint64_t __43__WFTrelloItemContentItem_propertyBuilders__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, void))(a4 + 16))(a4, 0);
}

uint64_t __43__WFTrelloItemContentItem_propertyBuilders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, void))(a4 + 16))(a4, 0);
}

- (id)preferredFileType
{
  return (id)[MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC20]];
}

@end