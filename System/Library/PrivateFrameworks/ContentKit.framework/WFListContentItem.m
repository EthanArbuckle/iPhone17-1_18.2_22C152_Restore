@interface WFListContentItem
+ (id)contentCategories;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (WFListItem)listItem;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)richListTitle;
@end

@implementation WFListContentItem

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  return &stru_26C71CE08;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  return &stru_26C71CE08;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)outputTypes
{
  return (id)[MEMORY[0x263EFF9D8] orderedSet];
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

- (WFListItem)listItem
{
  uint64_t v3 = objc_opt_class();
  return (WFListItem *)[(WFContentItem *)self objectForClass:v3];
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  v5 = (void (**)(id, void *, void *))a3;
  v6 = [(WFListContentItem *)self listItem];
  v7 = [v6 image];

  if (v5)
  {
    uint64_t v13 = *MEMORY[0x263F85630];
    v8 = NSNumber;
    if ([v7 displayStyle] == 1) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 1;
    }
    v10 = [v8 numberWithUnsignedInteger:v9];
    v14[0] = v10;
    v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

    v5[2](v5, v7, v11);
  }

  return v7 != 0;
}

- (BOOL)getListSubtitle:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(WFListContentItem *)self listItem];
  v6 = [v5 subtitle];

  if (v4)
  {
    v7 = [(WFListContentItem *)self listItem];
    v8 = [v7 subtitle];
    v4[2](v4, v8);
  }
  return v6 != 0;
}

- (id)richListTitle
{
  v2 = [(WFListContentItem *)self listItem];
  uint64_t v3 = [v2 title];

  return v3;
}

@end