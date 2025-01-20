@interface WFFileSizeContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (int64_t)tableTemplateSubjectType;
- (WFFileSize)fileSize;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
@end

@implementation WFFileSizeContentItem

+ (int64_t)tableTemplateSubjectType
{
  return 6;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d File sizes");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"File sizes", @"File sizes");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"File size", @"File size");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Documents";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = +[WFObjectType typeWithClass:objc_opt_class()];
  v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if ((Class)objc_opt_class() == a3)
  {
    v8 = [(WFFileSizeContentItem *)self fileSize];
    uint64_t v9 = [v8 formattedString];
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v10 = NSNumber;
    v8 = [(WFFileSizeContentItem *)self fileSize];
    uint64_t v9 = objc_msgSend(v10, "numberWithLongLong:", objc_msgSend(v8, "byteCount"));
  }
  v11 = (void *)v9;
  v7 = +[WFObjectRepresentation object:v9];

LABEL_7:
  return v7;
}

- (WFFileSize)fileSize
{
  uint64_t v3 = objc_opt_class();
  return (WFFileSize *)[(WFContentItem *)self objectForClass:v3];
}

@end