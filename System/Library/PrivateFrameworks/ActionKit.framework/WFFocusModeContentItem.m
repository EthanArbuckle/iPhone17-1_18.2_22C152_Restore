@interface WFFocusModeContentItem
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (id)focusMode;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (unint64_t)preferredDisplayStyle;
@end

@implementation WFFocusModeContentItem

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Focuses");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Focuses", @"Focuses");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Focus", @"Focus");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v4 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
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

+ (id)propertyBuilders
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F33808];
  id v3 = WFLocalizedContentPropertyNameMarker(@"Icon");
  v4 = [v2 keyPath:@"focusMode.symbolImage" name:v3 class:objc_opt_class()];
  v7[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  return v5;
}

- (unint64_t)preferredDisplayStyle
{
  return 2;
}

- (BOOL)getListSubtitle:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = WFLocalizedString(@"Focus");
    (*((void (**)(id, void *))a3 + 2))(v4, v5);
  }
  return 1;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  if (a3)
  {
    id v6 = a3;
    v7 = [(WFFocusModeContentItem *)self focusMode];
    v8 = [v7 symbolImage];
    (*((void (**)(id, void *, void))a3 + 2))(v6, v8, 0);
  }
  return 1;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if ((Class)objc_opt_class() == a3)
  {
    v8 = (void *)MEMORY[0x263F33908];
    v9 = [(WFFocusModeContentItem *)self focusMode];
    uint64_t v10 = [v9 displayName];
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v8 = (void *)MEMORY[0x263F33908];
    v9 = [(WFFocusModeContentItem *)self focusMode];
    uint64_t v10 = [v9 symbolImage];
  }
  v11 = (void *)v10;
  v7 = [v8 object:v10];

LABEL_7:
  return v7;
}

- (id)focusMode
{
  v2 = [(WFFocusModeContentItem *)self objectForClass:objc_opt_class()];
  id v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v2 = v3;
    }
    else {
      v2 = 0;
    }
  }
  id v4 = v2;

  return v4;
}

@end