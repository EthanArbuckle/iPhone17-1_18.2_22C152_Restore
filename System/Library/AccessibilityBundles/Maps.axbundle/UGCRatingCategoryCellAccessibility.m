@interface UGCRatingCategoryCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)_axClearRating;
@end

@implementation UGCRatingCategoryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UGCRatingCategoryCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UGCRatingCategoryCell", @"likeDislikeViewDidSelectDislike:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UGCRatingCategoryCell", @"likeDislikeViewDidSelectLike:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UGCRatingCategoryCell", @"_updateState:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UGCRatingCategoryCell", @"currentState", "q", 0);
  [v3 validateClass:@"UGCRatingCategoryCell" hasInstanceVariable:@"_categoryView" withType:"MUAppleRatingRowView"];
  [v3 validateClass:@"MUAppleRatingRowView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"MUAppleRatingRowView" hasInstanceVariable:@"_subtitleLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(UGCRatingCategoryCellAccessibility *)self safeValueForKey:@"_categoryView"];
  id v3 = [v2 safeValueForKey:@"_titleLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [v2 safeValueForKey:@"_subtitleLabel"];
  v6 = [v5 accessibilityLabel];

  v7 = __AXStringForVariables();

  return v7;
}

- (id)accessibilityValue
{
  unsigned int v2 = [(UGCRatingCategoryCellAccessibility *)self safeIntForKey:@"currentState"];
  if (v2 > 2)
  {
    id v3 = &stru_26F6E7138;
  }
  else
  {
    AXMapsLocString(off_26512D7B0[v2]);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)accessibilityCustomActions
{
  v19[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F1C390]);
  v4 = AXMapsLocString(@"LIKE");
  v5 = (void *)[v3 initWithName:v4 target:self selector:sel_likeDislikeViewDidSelectLike_];

  id v6 = objc_alloc(MEMORY[0x263F1C390]);
  v7 = AXMapsLocString(@"DISLIKE");
  v8 = (void *)[v6 initWithName:v7 target:self selector:sel_likeDislikeViewDidSelectDislike_];

  id v9 = objc_alloc(MEMORY[0x263F1C390]);
  v10 = AXMapsLocString(@"CLEAR_RATING");
  v11 = (void *)[v9 initWithName:v10 target:self selector:sel__axClearRating];

  int v12 = [(UGCRatingCategoryCellAccessibility *)self safeIntForKey:@"currentState"];
  switch(v12)
  {
    case 2:
      v17 = v8;
      v13 = &v17;
LABEL_7:
      v14 = v11;
      goto LABEL_8;
    case 1:
      v18 = v5;
      v13 = &v18;
      goto LABEL_7;
    case 0:
      v19[0] = v5;
      v13 = (void **)v19;
      v14 = v8;
LABEL_8:
      v13[1] = v14;
      v15 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:");
      goto LABEL_10;
  }
  v15 = (void *)MEMORY[0x263EFFA68];
LABEL_10:

  return v15;
}

- (void)_axClearRating
{
}

@end