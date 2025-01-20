@interface WFGiphyContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)stringConversionBehavior;
- (WFFileType)preferredFileType;
- (id)object;
- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5;
- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5;
- (void)getPreferredFileSize:(id)a3;
@end

@implementation WFGiphyContentItem

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Giphy items");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Giphy items", @"Giphy items");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Giphy item", @"Giphy item");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F33A40];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v4 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DAD0]];
  v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

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

- (WFFileType)preferredFileType
{
  return (WFFileType *)[MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DAD0]];
}

- (void)getPreferredFileSize:(id)a3
{
  id v5 = a3;
  id v7 = [(WFGiphyContentItem *)self object];
  v6 = [v7 originalImage];
  (*((void (**)(id, uint64_t))a3 + 2))(v5, [v6 fileSize]);
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v7 = (void (**)(id, uint64_t, void *, void))a3;
  if ((Class)objc_opt_class() == a5)
  {
    id v10 = [(WFGiphyContentItem *)self object];
    uint64_t v8 = [v10 url];
    v9 = [(WFGiphyContentItem *)self name];
    v7[2](v7, v8, v9, 0);

    id v7 = (void (**)(id, uint64_t, void *, void))v8;
  }
  else
  {
    id v10 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
    ((void (*)(void (**)(id, uint64_t, void *, void), void, void))v7[2])(v7, 0, 0);
  }
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [(WFGiphyContentItem *)self object];
  id v10 = [v9 originalImage];
  v11 = [v10 url];

  if ([v8 conformsToUTType:*MEMORY[0x263F1DBA8]])
  {
    v12 = [(WFGiphyContentItem *)self object];
    v13 = [v12 originalImage];
    uint64_t v14 = [v13 videoURL];

    v11 = (void *)v14;
  }
  v15 = objc_msgSend(MEMORY[0x263EFC640], "wf_sharedSession");
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __65__WFGiphyContentItem_generateFileRepresentation_options_forType___block_invoke;
  v19[3] = &unk_264E5E7C8;
  v21 = self;
  id v22 = v7;
  id v20 = v8;
  id v16 = v8;
  id v17 = v7;
  v18 = [v15 downloadTaskWithURL:v11 completionHandler:v19];
  [v18 resume];
}

void __65__WFGiphyContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v17 = a2;
  if (!v17 || a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F852B8];
    id v8 = [a3 MIMEType];
    v9 = [v7 typeFromMIMEType:v8];

    id v10 = [v9 typeDescription];

    if (!v10)
    {
      v11 = *(void **)(a1 + 32);
      if (v11)
      {
        id v12 = v11;
      }
      else
      {
        id v12 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DAD0]];
      }
      id v13 = v12;

      v9 = v13;
    }
    uint64_t v14 = (void *)MEMORY[0x263F33870];
    v15 = [*(id *)(a1 + 40) name];
    id v16 = [v14 fileWithURL:v17 options:3 ofType:v9 proposedFilename:v15];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)object
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFGiphyContentItem *)self objectForClass:v3];
}

@end