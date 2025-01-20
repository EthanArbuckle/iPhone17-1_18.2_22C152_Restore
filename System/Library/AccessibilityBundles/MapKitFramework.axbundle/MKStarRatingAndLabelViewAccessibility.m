@interface MKStarRatingAndLabelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)ratingAndReviewsAsAttributedString:(double)a3 style:(int64_t)a4 font:(id)a5 numberOfReviews:(unint64_t)a6 textColor:(id)a7 theme:(id)a8;
+ (id)safeCategoryTargetClassName;
+ (id)starRatingAndProviderAsAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 showReviewsOrTips:(BOOL)a6 showNumberOfReviews:(BOOL)a7 ratingStyle:(int64_t)a8 theme:(id)a9;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
@end

@implementation MKStarRatingAndLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKStarRatingAndLabelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"MKStarRatingAndLabelView", @"starRatingAndProviderAsAttributedStringForMapItem: textColor: font: showReviewsOrTips: showNumberOfReviews: ratingStyle: theme:", "@", "@", "@", "@", "B", "B", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"MKStarRatingAndLabelView", @"ratingAndReviewsAsAttributedString: style: font: numberOfReviews: textColor:theme:", "@", "d", "q", "@", "Q", "@", "@", 0);
  [v3 validateClass:@"MKStarRatingView"];
}

+ (id)ratingAndReviewsAsAttributedString:(double)a3 style:(int64_t)a4 font:(id)a5 numberOfReviews:(unint64_t)a6 textColor:(id)a7 theme:(id)a8
{
  v20[1] = *MEMORY[0x263EF8340];
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___MKStarRatingAndLabelViewAccessibility;
  v9 = objc_msgSendSuper2(&v18, sel_ratingAndReviewsAsAttributedString_style_font_numberOfReviews_textColor_theme_, a4, a5, a6, a7, a8);
  v10 = (void *)[v9 mutableCopy];
  v11 = UIAXStarRatingStringForRating();
  v12 = NSString;
  v13 = AXMapsLocString(@"REVIEWS_COUNT_FORMAT");
  v17 = objc_msgSend(v12, "localizedStringWithFormat:", v13, a6);
  v14 = __AXStringForVariables();

  uint64_t v19 = *MEMORY[0x263F218E8];
  v20[0] = v14;
  v15 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, &v19, 1, v17, @"__AXStringForVariablesSentinel");
  objc_msgSend(v10, "addAttributes:range:", v15, 0, objc_msgSend(v10, "length"));

  return v10;
}

+ (id)starRatingAndProviderAsAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 showReviewsOrTips:(BOOL)a6 showNumberOfReviews:(BOOL)a7 ratingStyle:(int64_t)a8 theme:(id)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  id v15 = a3;
  v28.receiver = a1;
  v28.super_class = (Class)&OBJC_METACLASS___MKStarRatingAndLabelViewAccessibility;
  v16 = objc_msgSendSuper2(&v28, sel_starRatingAndProviderAsAttributedStringForMapItem_textColor_font_showReviewsOrTips_showNumberOfReviews_ratingStyle_theme_, v15, a4, a5, v11, v10, a8, a9);
  if ([v15 _sampleSizeForUserRatingScore])
  {
    v17 = [v15 _reviewsDisplayName];
    uint64_t v18 = [v15 _sampleSizeForUserRatingScore];
    [v15 _normalizedUserRatingScore];
    uint64_t v19 = UIAXStarRatingStringForRating();
    if (v10)
    {
      uint64_t v20 = [v17 length];
      v21 = NSString;
      if (v20)
      {
        v22 = AXMapsLocString(@"REVIEWS_COUNT_WITH_PROVIDER_FORMAT");
        objc_msgSend(v21, "localizedStringWithFormat:", v22, v18, v17);
      }
      else
      {
        v22 = AXMapsLocString(@"REVIEWS_COUNT_FORMAT");
        objc_msgSend(v21, "localizedStringWithFormat:", v22, v18, v27);
      v23 = };

      v26 = v23;
      v27 = @"__AXStringForVariablesSentinel";
      uint64_t v24 = __AXStringForVariables();

      uint64_t v19 = (void *)v24;
    }
    objc_msgSend(v16, "setAccessibilityLabel:", v19, v26, v27);
  }

  return v16;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end