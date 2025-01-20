@interface MKStarRatingAndLabelView
+ (id)ratingAndReviewsAsAttributedString:(double)a3 style:(int64_t)a4 font:(id)a5 numberOfReviews:(unint64_t)a6 textColor:(id)a7 theme:(id)a8;
+ (id)reviewsString:(unint64_t)a3 providerName:(id)a4;
+ (id)starRatingAndProviderAsAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 showReviewsOrTips:(BOOL)a6 showNumberOfReviews:(BOOL)a7 ratingStyle:(int64_t)a8 theme:(id)a9;
+ (id)starRatingAndProviderAsAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 showReviewsOrTips:(BOOL)a6 theme:(id)a7;
@end

@implementation MKStarRatingAndLabelView

+ (id)reviewsString:(unint64_t)a3 providerName:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3 == 1)
  {
    uint64_t v9 = [v5 length];
    v10 = NSString;
    if (v9)
    {
      v8 = _MKLocalizedStringFromThisBundle(@"%1$d review on %2$@");
      v16 = v6;
    }
    else
    {
      v8 = _MKLocalizedStringFromThisBundle(@"%d review");
    }
    objc_msgSend(v10, "localizedStringWithFormat:", v8, 1, v16);
  }
  else
  {
    if (a3)
    {
      uint64_t v11 = [v5 length];
      v12 = NSString;
      if (v11)
      {
        v13 = _MKLocalizedStringFromThisBundle(@"PlacecardReviewProvider_Plural");
        objc_msgSend(v12, "localizedStringWithFormat:", v13, a3, v6);
      }
      else
      {
        v13 = _MKLocalizedStringFromThisBundle(@"PlacecardReview_Plural");
        objc_msgSend(v12, "localizedStringWithFormat:", v13, a3, v16);
      v14 = };

      goto LABEL_15;
    }
    if (![v5 length])
    {
      v14 = _MKLocalizedStringFromThisBundle(@"No reviews");
      goto LABEL_15;
    }
    v7 = NSString;
    v8 = _MKLocalizedStringFromThisBundle(@"No reviews on %@");
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v6, v16);
  v14 = };

LABEL_15:

  return v14;
}

+ (id)ratingAndReviewsAsAttributedString:(double)a3 style:(int64_t)a4 font:(id)a5 numberOfReviews:(unint64_t)a6 textColor:(id)a7 theme:(id)a8
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  v17 = +[MKStarRatingView ratingAsAttributedString:v14 baseFont:a4 style:v16 theme:a3];
  id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
  v19 = +[MKStarRatingAndLabelView reviewsString:a6 providerName:0];
  v37[0] = *MEMORY[0x1E4F42510];
  v20 = v15;
  if (!v15)
  {
    v20 = [v16 textColor];
  }
  v38[0] = v20;
  v37[1] = *MEMORY[0x1E4F42508];
  v21 = v14;
  if (!v14)
  {
    v8 = +[MKFontManager sharedManager];
    v21 = [v8 subtitleFont];
  }
  v38[1] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  v23 = (void *)[v18 initWithString:v19 attributes:v22];

  if (v14)
  {
    if (v15) {
      goto LABEL_7;
    }
  }
  else
  {

    if (v15) {
      goto LABEL_7;
    }
  }

LABEL_7:
  id v24 = objc_alloc(MEMORY[0x1E4F28E48]);
  v25 = _MKLocalizedStringFromThisBundle(@"PlaceCard_StarAndReviewCount");
  v26 = (void *)[v24 initWithString:v25];

  v27 = [v26 string];
  uint64_t v28 = [v27 rangeOfString:@"%1$@"];
  uint64_t v30 = v29;

  if (v28 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v26, "replaceCharactersInRange:withAttributedString:", v28, v30, v17);
  }
  v31 = [v26 string];
  uint64_t v32 = [v31 rangeOfString:@"%2$@"];
  uint64_t v34 = v33;

  if (v32 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v26, "replaceCharactersInRange:withAttributedString:", v32, v34, v23);
  }
  v35 = (void *)[v26 copy];

  return v35;
}

+ (id)starRatingAndProviderAsAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 showReviewsOrTips:(BOOL)a6 theme:(id)a7
{
  return (id)[a1 starRatingAndProviderAsAttributedStringForMapItem:a3 textColor:a4 font:a5 showReviewsOrTips:a6 showNumberOfReviews:1 ratingStyle:3 theme:a7];
}

+ (id)starRatingAndProviderAsAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 showReviewsOrTips:(BOOL)a6 showNumberOfReviews:(BOOL)a7 ratingStyle:(int64_t)a8 theme:(id)a9
{
  BOOL v11 = a7;
  BOOL v12 = a6;
  v55[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  v54[0] = *MEMORY[0x1E4F42508];
  v19 = v17;
  if (!v17)
  {
    uint64_t v9 = +[MKFontManager sharedManager];
    v19 = [v9 subtitleFont];
  }
  v55[0] = v19;
  v54[1] = *MEMORY[0x1E4F42510];
  v20 = v16;
  if (!v16)
  {
    v20 = [v18 textColor];
  }
  v55[1] = v20;
  uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];
  if (v16)
  {
    if (v17) {
      goto LABEL_7;
    }
  }
  else
  {

    if (v17) {
      goto LABEL_7;
    }
  }

LABEL_7:
  if ([v15 _sampleSizeForUserRatingScore])
  {
    [v15 _normalizedUserRatingScore];
    id v52 = v18;
    v22 = +[MKStarRatingView ratingAsAttributedString:v17 baseFont:a8 style:v18 theme:v21];
    v23 = [v15 _reviewsDisplayName];
    BOOL v24 = [v23 length] == 0;

    if (v24 && v11) {
      v25 = @"Place_Header_Reviews_No_Provider_Layout";
    }
    else {
      v25 = @"Place_Header_Reviews_Layout";
    }
    if (v24 && v11 || v11)
    {
      _MKLocalizedStringFromThisBundle(v25);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = @"%1$@";
    }
    uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v26 attributes:v53];
    uint64_t v30 = [v29 string];
    uint64_t v31 = [v30 rangeOfString:@"%1$@"];
    uint64_t v33 = v32;

    if (v31 != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v29, "replaceCharactersInRange:withAttributedString:", v31, v33, v22);
    }
    uint64_t v34 = [v29 string];
    uint64_t v35 = [v34 rangeOfString:@"%2$d"];
    uint64_t v37 = v36;

    if (v35 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v38 = [v15 _localizedSampleSizeForUserRatingScoreString];
      v39 = (void *)v38;
      if (v38) {
        v40 = (__CFString *)v38;
      }
      else {
        v40 = &stru_1ED919588;
      }
      objc_msgSend(v29, "replaceCharactersInRange:withString:", v35, v37, v40);
    }
    v41 = [v29 string];
    uint64_t v42 = [v41 rangeOfString:@"%3$@"];
    uint64_t v44 = v43;

    id v18 = v52;
    if (v42 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v45 = [v15 _reviewsDisplayName];
      v46 = (void *)v45;
      if (v45) {
        v47 = (__CFString *)v45;
      }
      else {
        v47 = &stru_1ED919588;
      }
      objc_msgSend(v29, "replaceCharactersInRange:withString:", v42, v44, v47);
    }
    v48 = (void *)[v29 copy];

    v49 = (void *)v53;
  }
  else
  {
    id v27 = objc_alloc(MEMORY[0x1E4F28B18]);
    if (v12) {
      uint64_t v28 = @"No Reviews";
    }
    else {
      uint64_t v28 = @"No Tips";
    }
    v22 = _MKLocalizedStringFromThisBundle(v28);
    v50 = v27;
    v49 = (void *)v53;
    v48 = (void *)[v50 initWithString:v22 attributes:v53];
  }

  return v48;
}

@end