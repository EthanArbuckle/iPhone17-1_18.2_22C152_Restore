@interface WFArticleContentItem
+ (id)URLCoercionHandler;
+ (id)coercions;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)dateCoercionHandler;
+ (id)fileWithHTML:(id)a3 named:(id)a4;
+ (id)htmlCoercionHandler;
+ (id)imageCoercionHandler;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringCoercionHandler;
+ (id)stringConversionBehavior;
- (BOOL)getListSubtitle:(id)a3;
- (WFArticle)article;
- (id)defaultSourceForRepresentation:(id)a3;
- (id)htmlRepresentation;
@end

@implementation WFArticleContentItem

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 wfType];
  int v6 = [v5 conformsToClass:objc_opt_class()];

  if (v6)
  {
    v7 = [v4 object];

    v8 = [v7 URL];
    v9 = +[WFURLContentItem attributionSetContentOfURL:v8];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFArticleContentItem;
    v9 = [(WFContentItem *)&v11 defaultSourceForRepresentation:v4];
  }
  return v9;
}

- (id)htmlRepresentation
{
  v2 = [(WFArticleContentItem *)self article];
  v3 = [v2 body];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    int v6 = [v2 excerpt];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [v2 title];
    }
    id v5 = v8;
  }
  return v5;
}

- (WFArticle)article
{
  uint64_t v3 = objc_opt_class();
  return (WFArticle *)[(WFContentItem *)self objectForClass:v3];
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Articles");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Articles", @"Articles");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Article (singular)", @"Article");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Web";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)coercions
{
  v20[5] = *MEMORY[0x263EF8340];
  v19 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB00]];
  v18 = [a1 htmlCoercionHandler];
  v17 = +[WFCoercion coercionToType:v19 handler:v18];
  v20[0] = v17;
  uint64_t v3 = objc_opt_class();
  id v4 = [a1 stringCoercionHandler];
  id v5 = +[WFCoercion coercionToClass:v3 handler:v4];
  v20[1] = v5;
  uint64_t v6 = objc_opt_class();
  v7 = [a1 dateCoercionHandler];
  id v8 = +[WFCoercion coercionToClass:v6 handler:v7];
  v20[2] = v8;
  uint64_t v9 = objc_opt_class();
  v10 = [a1 URLCoercionHandler];
  objc_super v11 = +[WFCoercion coercionToClass:v9 handler:v10];
  v20[3] = v11;
  uint64_t v12 = objc_opt_class();
  v13 = [a1 imageCoercionHandler];
  v14 = +[WFCoercion coercionToClass:v12 handler:v13];
  v20[4] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:5];

  return v15;
}

+ (id)imageCoercionHandler
{
  return +[WFCoercionHandler asynchronousBlock:&__block_literal_global_84 availabilityCheck:&__block_literal_global_87];
}

BOOL __44__WFArticleContentItem_imageCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 article];
  uint64_t v3 = [v2 mainImageURL];
  BOOL v4 = v3 != 0;

  return v4;
}

void __44__WFArticleContentItem_imageCoercionHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a2 article];
  id v12 = [v8 mainImageURL];

  uint64_t v9 = +[WFContentItem itemWithObject:v12];
  v10 = [v7 requestedType];
  objc_super v11 = [v7 options];

  [v9 getRepresentationsForType:v10 options:v11 completionHandler:v6];
}

+ (id)URLCoercionHandler
{
  return +[WFCoercionHandler block:&__block_literal_global_80 availabilityCheck:&__block_literal_global_82_6803];
}

BOOL __42__WFArticleContentItem_URLCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 article];
  uint64_t v3 = [v2 URL];
  BOOL v4 = v3 != 0;

  return v4;
}

id __42__WFArticleContentItem_URLCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 article];
  BOOL v4 = [v3 URL];
  id v5 = [v2 article];

  id v6 = [v5 title];
  id v7 = +[WFObjectRepresentation object:v4 named:v6];

  return v7;
}

+ (id)dateCoercionHandler
{
  return +[WFCoercionHandler block:&__block_literal_global_73 availabilityCheck:&__block_literal_global_78];
}

BOOL __43__WFArticleContentItem_dateCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 article];
  uint64_t v3 = [v2 publishedDate];
  BOOL v4 = v3 != 0;

  return v4;
}

id __43__WFArticleContentItem_dateCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 article];
  uint64_t v3 = [v2 publishedDate];
  BOOL v4 = WFLocalizedContentPropertyNameMarker(@"Article Publish Date");
  id v5 = +[WFObjectRepresentation object:v3 named:v4];

  return v5;
}

+ (id)stringCoercionHandler
{
  return +[WFCoercionHandler asynchronousBlock:&__block_literal_global_67 availabilityCheck:&__block_literal_global_71];
}

BOOL __45__WFArticleContentItem_stringCoercionHandler__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 article];
  BOOL v4 = [v3 body];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v2 article];
    id v7 = [v6 excerpt];
    if (v7)
    {
      BOOL v5 = 1;
    }
    else
    {
      id v8 = [v2 article];
      uint64_t v9 = [v8 title];
      BOOL v5 = v9 != 0;
    }
  }

  return v5;
}

void __45__WFArticleContentItem_stringCoercionHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [v8 article];
  v10 = [v9 title];

  objc_super v11 = objc_opt_class();
  id v12 = [v8 htmlRepresentation];

  v13 = [v11 fileWithHTML:v12 named:v10];

  uint64_t v17 = MEMORY[0x263EF8330];
  id v18 = v10;
  id v19 = v6;
  id v14 = v10;
  id v15 = v6;
  v16 = objc_msgSend(v7, "options", v17, 3221225472, __45__WFArticleContentItem_stringCoercionHandler__block_invoke_2, &unk_26428AA88);

  +[WFRichTextContentItem loadAttributedStringInWebViewFromHTMLFile:v13 handler:&v17 attributedStringOptions:0 documentAttributes:0 name:v14 coercionOptions:v16];
}

void __45__WFArticleContentItem_stringCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    id v7 = [a2 string];
    BOOL v4 = +[WFObjectRepresentation object:v7 named:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v4, 0);
  }
  else
  {
    BOOL v5 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v6 = *(void *)(a1 + 40);
    v5(v6);
  }
}

+ (id)htmlCoercionHandler
{
  return +[WFCoercionHandler block:&__block_literal_global_6812 availabilityCheck:&__block_literal_global_64];
}

BOOL __43__WFArticleContentItem_htmlCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 article];
  BOOL v4 = [v3 body];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = [v2 article];
    id v7 = [v6 excerpt];
    if (v7)
    {
      BOOL v5 = 1;
    }
    else
    {
      id v8 = [v2 article];
      uint64_t v9 = [v8 title];
      BOOL v5 = v9 != 0;
    }
  }

  return v5;
}

id __43__WFArticleContentItem_htmlCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  BOOL v4 = [v2 htmlRepresentation];
  BOOL v5 = [v2 article];

  uint64_t v6 = [v5 title];
  id v7 = [v3 fileWithHTML:v4 named:v6];

  return v7;
}

+ (id)stringConversionBehavior
{
  id v2 = [a1 propertyForName:@"Body"];
  uint64_t v3 = +[WFContentItemStringConversionBehavior accessingProperty:v2];

  return v3;
}

+ (id)fileWithHTML:(id)a3 named:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[WFRichTextContentItem normalizedHTMLDocumentFromHTML:a3];
  id v7 = [v6 dataUsingEncoding:4];
  id v8 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB00]];
  if (v5)
  {
    uint64_t v9 = +[WFFileRepresentation fileWithData:v7 ofType:v8 proposedFilename:v5];
  }
  else
  {
    v10 = [(id)objc_opt_class() localizedTypeDescription];
    uint64_t v9 = +[WFFileRepresentation fileWithData:v7 ofType:v8 proposedFilename:v10];
  }
  return v9;
}

+ (id)propertyBuilders
{
  v23[8] = *MEMORY[0x263EF8340];
  v20 = WFLocalizedContentPropertyNameMarker(@"Title");
  id v19 = +[WFContentPropertyBuilder keyPath:@"article.title" name:v20 class:objc_opt_class()];
  v23[0] = v19;
  id v18 = WFLocalizedContentPropertyNameMarker(@"Author");
  uint64_t v17 = +[WFContentPropertyBuilder keyPath:@"article.author" name:v18 class:objc_opt_class()];
  v23[1] = v17;
  v16 = WFLocalizedContentPropertyNameMarker(@"Published Date");
  id v15 = +[WFContentPropertyBuilder keyPath:@"article.publishedDate" name:v16 class:objc_opt_class()];
  v23[2] = v15;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __40__WFArticleContentItem_propertyBuilders__block_invoke;
  v22[3] = &__block_descriptor_40_e43_v32__0__WFArticleContentItem_8_16___v____24l;
  v22[4] = a1;
  id v14 = WFLocalizedContentPropertyNameMarker(@"Body");
  uint64_t v3 = +[WFContentPropertyBuilder block:v22 name:v14 class:objc_opt_class()];
  v23[3] = v3;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __40__WFArticleContentItem_propertyBuilders__block_invoke_2;
  v21[3] = &__block_descriptor_40_e43_v32__0__WFArticleContentItem_8_16___v____24l;
  v21[4] = a1;
  BOOL v4 = WFLocalizedContentPropertyNameMarker(@"Excerpt");
  id v5 = +[WFContentPropertyBuilder block:v21 name:v4 class:objc_opt_class()];
  v23[4] = v5;
  uint64_t v6 = WFLocalizedContentPropertyNameMarker(@"Number of Words");
  id v7 = +[WFContentPropertyBuilder keyPath:@"article.numberOfWords" name:v6 class:objc_opt_class()];
  v23[5] = v7;
  id v8 = WFLocalizedContentPropertyNameMarker(@"Main Image URL");
  uint64_t v9 = +[WFContentPropertyBuilder keyPath:@"article.mainImageURL" name:v8 class:objc_opt_class()];
  v23[6] = v9;
  v10 = WFLocalizedContentPropertyNameMarker(@"URL");
  objc_super v11 = +[WFContentPropertyBuilder keyPath:@"article.URL" name:v10 class:objc_opt_class()];
  v23[7] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:8];

  return v12;
}

void __40__WFArticleContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v13 = a2;
  uint64_t v6 = a4;
  id v7 = [v13 article];
  id v8 = [v7 body];

  if (v8)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    v10 = [v13 article];
    objc_super v11 = [v10 title];
    id v12 = [v9 fileWithHTML:v8 named:v11];
    v6[2](v6, v12);
  }
  else
  {
    v6[2](v6, 0);
  }
}

void __40__WFArticleContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v13 = a2;
  uint64_t v6 = a4;
  id v7 = [v13 article];
  id v8 = [v7 excerpt];

  if (v8)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    v10 = [v13 article];
    objc_super v11 = [v10 title];
    id v12 = [v9 fileWithHTML:v8 named:v11];
    v6[2](v6, v12);
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (BOOL)getListSubtitle:(id)a3
{
  BOOL v4 = (void (**)(id, void *))a3;
  id v5 = [(WFArticleContentItem *)self article];
  uint64_t v6 = [v5 publishedDate];

  if (v6)
  {
    id v7 = objc_opt_new();
    [v7 setDateStyle:3];
    [v7 setTimeStyle:1];
    [v7 setDoesRelativeDateFormatting:1];
    if (v4)
    {
      id v8 = [v7 stringFromDate:v6];
      v4[2](v4, v8);
    }
  }

  return v6 != 0;
}

@end