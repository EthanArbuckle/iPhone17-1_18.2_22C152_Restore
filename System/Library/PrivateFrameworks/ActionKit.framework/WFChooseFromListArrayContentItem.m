@interface WFChooseFromListArrayContentItem
+ (id)itemWithObjects:(id)a3 named:(id)a4;
+ (id)ownedTypes;
- (BOOL)getListSubtitle:(id)a3;
- (NSArray)items;
- (id)allowedClassesForDecodingInternalRepresentations;
@end

@implementation WFChooseFromListArrayContentItem

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)itemWithObjects:(id)a3 named:(id)a4
{
  id v6 = a4;
  v7 = objc_msgSend(a3, "if_compactMap:", &__block_literal_global_27644);
  v8 = [a1 itemWithItems:v7 named:v6];

  return v8;
}

uint64_t __58__WFChooseFromListArrayContentItem_itemWithObjects_named___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F337C8] itemWithObject:a2];
}

- (id)allowedClassesForDecodingInternalRepresentations
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

- (BOOL)getListSubtitle:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = NSString;
  id v6 = WFLocalizedPluralString(@"%d items");
  v7 = [(WFChooseFromListArrayContentItem *)self items];
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v6, objc_msgSend(v7, "count"));

  if (v4) {
    v4[2](v4, v8);
  }

  return 1;
}

- (NSArray)items
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)[(WFChooseFromListArrayContentItem *)self objectForClass:v3];
}

@end