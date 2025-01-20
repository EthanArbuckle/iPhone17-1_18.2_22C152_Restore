@interface MKThirdPartyRatingStringBuilder
+ (id)carPlayHeaderStringForMapItem:(id)a3 titleAttributes:(id)a4 providerAttributes:(id)a5;
+ (id)ratingAndReviewSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6;
+ (id)ratingColorForMapItem:(id)a3;
+ (id)ratingSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6;
+ (id)ratingSymbolName;
@end

@implementation MKThirdPartyRatingStringBuilder

+ (id)ratingSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6
{
  return +[MKStarRatingAndLabelView starRatingAndProviderAsAttributedStringForMapItem:a3 textColor:a4 font:a5 showReviewsOrTips:0 showNumberOfReviews:0 ratingStyle:3 theme:a6];
}

+ (id)ratingAndReviewSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6
{
  return +[MKStarRatingAndLabelView starRatingAndProviderAsAttributedStringForMapItem:a3 textColor:a4 font:a5 showReviewsOrTips:1 showNumberOfReviews:1 ratingStyle:3 theme:a6];
}

+ (id)carPlayHeaderStringForMapItem:(id)a3 titleAttributes:(id)a4 providerAttributes:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = NSString;
  id v10 = a4;
  [v7 _normalizedUserRatingScore];
  v12 = objc_msgSend(v9, "stringWithFormat:", @"%.1f ", v11);
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v12 attributes:v10];

  v14 = [v7 _reviewsDisplayName];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    v16 = NSString;
    v17 = [v7 _localizedSampleSizeForUserRatingScoreString];
    v18 = [v16 stringWithFormat:@"(%@) ", v17];

    v34 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v18 attributes:v8];
    objc_msgSend(v13, "appendAttributedString:");
    v19 = _MKLocalizedStringFromThisBundle(@"CarPlay_SearchCell_ReviewsLabel");
    id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
    v21 = NSString;
    v22 = [v7 _reviewsDisplayName];
    v23 = objc_msgSend(v21, "stringWithFormat:", v19, v22);
    v24 = (void *)[v20 initWithString:v23 attributes:v8];

    [v13 appendAttributedString:v24];
    if ([v7 _hasPriceDescription]) {
      int v25 = 1;
    }
    else {
      int v25 = [v7 _hasPriceRange];
    }
    if ([v7 _hasPriceDescription]) {
      [v7 _priceDescription];
    }
    else {
    v27 = [v7 _priceRangeString];
    }
    v28 = v27;
    if (v25 && [v27 length])
    {
      v32 = _MKLocalizedStringFromThisBundle(@" · [List view details separator]");
      [NSString stringWithFormat:@"%@%@", v32, v28];
      v29 = v33 = v18;
      v30 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v29 attributes:v8];
      [v13 appendAttributedString:v30];
      v26 = (void *)[v13 copy];

      v18 = v33;
    }
    else
    {
      v26 = (void *)[v13 copy];
    }
  }
  else
  {
    v26 = (void *)[v13 copy];
  }

  return v26;
}

+ (id)ratingSymbolName
{
  return @"star.fill";
}

+ (id)ratingColorForMapItem:(id)a3
{
  [a3 _normalizedUserRatingScore];
  double v4 = v3;

  return +[MKStarRatingView colorForRating:v4];
}

@end