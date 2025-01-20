@interface IMBrand(ChatKit)
+ (id)makeBrandPlacecardForIMBrand:()ChatKit;
- (id)primaryBrandColor;
- (id)secondaryBrandColor;
@end

@implementation IMBrand(ChatKit)

- (id)primaryBrandColor
{
  v1 = [a1 brand];
  v2 = [v1 primaryBrandColor];

  return v2;
}

- (id)secondaryBrandColor
{
  v1 = [a1 brand];
  v2 = [v1 secondaryBrandColor];

  return v2;
}

+ (id)makeBrandPlacecardForIMBrand:()ChatKit
{
  uint64_t v3 = makeBrandPlacecardForIMBrand__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&makeBrandPlacecardForIMBrand__onceToken, &__block_literal_global_74);
  }
  v5 = (void *)makeBrandPlacecardForIMBrand__BSBrandClass;
  v6 = [v4 brand];

  v7 = [v5 makeBrandPlacecardForBrand:v6];

  return v7;
}

@end