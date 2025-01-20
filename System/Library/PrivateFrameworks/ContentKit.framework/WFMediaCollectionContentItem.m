@interface WFMediaCollectionContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)ownedTypes;
- (MPMediaItemCollection)collection;
@end

@implementation WFMediaCollectionContentItem

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Media Collections");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Media Collections", @"Media Collections");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Media Collection", @"Media Collection");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Media";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClassName:@"MPMediaItemCollection" frameworkName:@"MediaPlayer" location:2];
  v4 = objc_msgSend(v2, "orderedSetWithObjects:", v3, 0);

  return v4;
}

- (MPMediaItemCollection)collection
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  id v3 = (void *)getMPMediaItemCollectionClass_softClass;
  uint64_t v11 = getMPMediaItemCollectionClass_softClass;
  if (!getMPMediaItemCollectionClass_softClass)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getMPMediaItemCollectionClass_block_invoke;
    v7[3] = &unk_26428AC60;
    v7[4] = &v8;
    __getMPMediaItemCollectionClass_block_invoke((uint64_t)v7);
    id v3 = (void *)v9[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  v5 = [(WFContentItem *)self objectForClass:v4];
  return (MPMediaItemCollection *)v5;
}

@end