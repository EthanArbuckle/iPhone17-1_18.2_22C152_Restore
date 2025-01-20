@interface WFEmailContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
- (WFEmail)email;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5;
- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5;
@end

@implementation WFEmailContentItem

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Emails");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Emails", @"Emails");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Email", @"Email");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Sharing";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB00]];
  v5 = +[WFObjectType typeWithClass:objc_opt_class()];
  v6 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);

  return v6;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)propertyBuilders
{
  v16[5] = *MEMORY[0x263EF8340];
  v15 = WFLocalizedContentPropertyNameMarker(@"Subject");
  v14 = +[WFContentPropertyBuilder keyPath:@"email.subject" name:v15 class:objc_opt_class()];
  v16[0] = v14;
  v13 = WFLocalizedContentPropertyNameMarker(@"Sender");
  v12 = +[WFContentPropertyBuilder block:&__block_literal_global_24479 name:v13 class:objc_opt_class()];
  v16[1] = v12;
  v2 = WFLocalizedContentPropertyNameMarker(@"Recipients");
  id v3 = +[WFContentPropertyBuilder block:&__block_literal_global_20_24481 name:v2 class:objc_opt_class()];
  v4 = [v3 multipleValues:1];
  v16[2] = v4;
  v5 = WFLocalizedContentPropertyNameMarker(@"Attachments");
  v6 = +[WFContentPropertyBuilder block:&__block_literal_global_25_24484 name:v5 class:objc_opt_class()];
  v7 = [v6 multipleValues:1];
  v16[3] = v7;
  v8 = WFLocalizedContentPropertyNameMarker(@"Content");
  v9 = +[WFContentPropertyBuilder block:&__block_literal_global_33 name:v8 class:objc_opt_class()];
  v16[4] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:5];

  return v10;
}

void __38__WFEmailContentItem_propertyBuilders__block_invoke_31(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v6 = [a2 email];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__WFEmailContentItem_propertyBuilders__block_invoke_2_34;
  v8[3] = &unk_26428AA60;
  id v9 = v5;
  id v7 = v5;
  [v6 fetchContentRepresentationWithCompletionHandler:v8];
}

void __38__WFEmailContentItem_propertyBuilders__block_invoke_2_34(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = getWFContentItemLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      id v9 = "+[WFEmailContentItem propertyBuilders]_block_invoke_2";
      __int16 v10 = 2114;
      id v11 = v6;
      _os_log_impl(&dword_216505000, v7, OS_LOG_TYPE_ERROR, "%s Could not get email content due to error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __38__WFEmailContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = [a2 email];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__WFEmailContentItem_propertyBuilders__block_invoke_4;
  v8[3] = &unk_26428AF18;
  id v9 = v5;
  id v7 = v5;
  [v6 fetchAttachmentsWithCompletionHandler:v8];
}

void __38__WFEmailContentItem_propertyBuilders__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = getWFContentItemLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      id v9 = "+[WFEmailContentItem propertyBuilders]_block_invoke_4";
      __int16 v10 = 2114;
      id v11 = v6;
      _os_log_impl(&dword_216505000, v7, OS_LOG_TYPE_ERROR, "%s Could not get email content due to error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __38__WFEmailContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  id v6 = a4;
  id v8 = [a2 email];
  id v7 = [v8 recipients];
  ((void (**)(void, void *))a4)[2](v6, v7);
}

void __38__WFEmailContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  id v6 = a4;
  id v8 = [a2 email];
  id v7 = [v8 sender];
  ((void (**)(void, void *))a4)[2](v6, v7);
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v8 conformsToUTType:*MEMORY[0x263F1DB00]])
  {
    id v9 = [(WFEmailContentItem *)self email];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __65__WFEmailContentItem_generateFileRepresentation_options_forType___block_invoke;
    v11[3] = &unk_26428AA60;
    id v12 = v7;
    [v9 fetchContentRepresentationWithCompletionHandler:v11];
  }
  else
  {
    __int16 v10 = [(id)objc_opt_class() badCoercionErrorForType:v8];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

uint64_t __65__WFEmailContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  if ((Class)objc_opt_class() == a5)
  {
    id v11 = [(WFEmailContentItem *)self email];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68__WFEmailContentItem_generateObjectRepresentation_options_forClass___block_invoke;
    v12[3] = &unk_26428AAB0;
    id v14 = v8;
    v12[4] = self;
    id v13 = v9;
    [v11 fetchContentRepresentationWithCompletionHandler:v12];
  }
  else
  {
    __int16 v10 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
    (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v10);
  }
}

void __68__WFEmailContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__WFEmailContentItem_generateObjectRepresentation_options_forClass___block_invoke_2;
  v7[3] = &unk_26428AA88;
  id v4 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 32);
  id v9 = v4;
  id v5 = a2;
  id v6 = objc_msgSend(v8, "name", v7[0], 3221225472, __68__WFEmailContentItem_generateObjectRepresentation_options_forClass___block_invoke_2, &unk_26428AA88, v8);
  +[WFRichTextContentItem loadAttributedStringInWebViewFromHTMLFile:v5 handler:v7 attributedStringOptions:0 documentAttributes:0 name:v6 coercionOptions:*(void *)(a1 + 40)];
}

void __68__WFEmailContentItem_generateObjectRepresentation_options_forClass___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a4;
  id v9 = [a2 string];
  id v8 = [*(id *)(a1 + 32) name];
  (*(void (**)(uint64_t, id, void *, id))(v6 + 16))(v6, v9, v8, v7);
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if ((Class)objc_opt_class() == a3
    && ([(WFEmailContentItem *)self email],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 sender],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    id v9 = [(WFEmailContentItem *)self email];
    __int16 v10 = [v9 sender];
    id v11 = [(WFEmailContentItem *)self email];
    id v12 = [v11 sender];
    id v13 = [v12 address];
    uint64_t v6 = +[WFObjectRepresentation object:v10 named:v13];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (WFEmail)email
{
  uint64_t v3 = objc_opt_class();
  return (WFEmail *)[(WFContentItem *)self objectForClass:v3];
}

@end