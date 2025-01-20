@interface MKFirstPartyRatingStringBuilder
+ (id)_colorForPercentage:(double)a3;
+ (id)_stringForPercentage:(double)a3;
+ (id)carPlayHeaderStringForMapItem:(id)a3 titleAttributes:(id)a4 providerAttributes:(id)a5;
+ (id)compactUserRecommendedRatingSummaryStringForMapItem:(id)a3;
+ (id)percentageStringForMapItem:(id)a3 showNumberOfRatings:(BOOL)a4 textColor:(id)a5 font:(id)a6 theme:(id)a7;
+ (id)ratingAndReviewSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6;
+ (id)ratingColorForMapItem:(id)a3;
+ (id)ratingPercentageAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6;
+ (id)ratingStringForPercentage:(double)a3 font:(id)a4 color:(id)a5 includeGlyph:(BOOL)a6;
+ (id)ratingSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6;
+ (id)ratingSymbolName;
+ (id)thumbRecommendStringWithMapItem:(id)a3 font:(id)a4 includeGlyph:(BOOL)a5;
+ (id)userRecommendationStringWithFont:(id)a3 ratingState:(int64_t)a4 numberOfPhotosAdded:(unint64_t)a5;
+ (id)userRecommendedRatingSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6;
@end

@implementation MKFirstPartyRatingStringBuilder

+ (id)ratingSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6
{
  return (id)objc_msgSend(a1, "thumbRecommendStringWithMapItem:font:includeGlyph:", a3, a5, 1, a6);
}

+ (id)ratingAndReviewSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6
{
  return (id)[a1 percentageStringForMapItem:a3 showNumberOfRatings:1 textColor:a4 font:a5 theme:a6];
}

+ (id)userRecommendedRatingSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6
{
  return (id)[a1 percentageStringForMapItem:a3 showNumberOfRatings:0 textColor:a4 font:a5 theme:a6];
}

+ (id)ratingSymbolName
{
  return @"hand.thumbsup.fill";
}

+ (id)_colorForPercentage:(double)a3
{
  if (a3 <= 0.5)
  {
    v4 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else
  {
    v3 = +[MKInfoCardThemeManager currentTheme];
    v4 = [v3 textColor];
  }

  return v4;
}

+ (id)thumbRecommendStringWithMapItem:(id)a3 font:(id)a4 includeGlyph:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v9 = [a3 _geoMapItem];
  v10 = [v9 _overallAppleRating];

  [v10 percentage];
  v11 = objc_msgSend(a1, "ratingStringForPercentage:font:color:includeGlyph:", v8, 0, v5);

  return v11;
}

+ (id)_stringForPercentage:(double)a3
{
  v4 = _MKLocalizedStringFromThisBundle(@"%lu%% [UGC]");
  BOOL v5 = objc_msgSend(NSString, "stringWithFormat:", v4, (unint64_t)(a3 * 100.0));

  return v5;
}

+ (id)ratingStringForPercentage:(double)a3 font:(id)a4 color:(id)a5 includeGlyph:(BOOL)a6
{
  BOOL v6 = a6;
  v37[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  if (a3 < 0.0 || a3 > 1.0)
  {
    v31 = objc_opt_new();
  }
  else
  {
    BOOL v34 = v6;
    id v13 = objc_alloc_init(MEMORY[0x1E4F42698]);
    v14 = (void *)MEMORY[0x1E4F42A80];
    v15 = [a1 ratingSymbolName];
    v16 = objc_msgSend(v14, "_mapkit_systemImageNamed:", v15);

    v17 = (void *)MEMORY[0x1E4F42A98];
    [v10 pointSize];
    double v18 = *MEMORY[0x1E4F43908];
    v33 = objc_msgSend(v17, "_mapkit_configurationWithPointSize:weight:scale:", 1);
    v19 = objc_msgSend(v16, "_mapkit_imageWithSymbolConfiguration:");

    v20 = [v19 imageWithRenderingMode:2];

    [v13 setImage:v20];
    id v21 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    v22 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v13];
    [v21 appendAttributedString:v22];

    if (!v11)
    {
      id v11 = [a1 _colorForPercentage:a3];
    }
    id v35 = v10;
    v36[0] = *MEMORY[0x1E4F42508];
    v23 = objc_msgSend(v10, "_mapkit_fontWithWeight:", v18);
    v36[1] = *MEMORY[0x1E4F42510];
    v37[0] = v23;
    v37[1] = v11;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];

    objc_msgSend(v21, "addAttributes:range:", v24, 0, objc_msgSend(v21, "length"));
    v25 = [a1 _stringForPercentage:a3];
    id v26 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    v27 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" " attributes:0];
    [v26 appendAttributedString:v27];

    v28 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v25];
    [v26 appendAttributedString:v28];

    objc_msgSend(v26, "setAttributes:range:", v24, 0, objc_msgSend(v26, "length"));
    id v29 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    v30 = v29;
    if (v34) {
      [v29 appendAttributedString:v21];
    }
    [v30 appendAttributedString:v26];
    v31 = (void *)[v30 copy];

    id v10 = v35;
  }

  return v31;
}

+ (id)compactUserRecommendedRatingSummaryStringForMapItem:(id)a3
{
  v4 = [a3 _geoMapItem];
  BOOL v5 = [v4 _overallAppleRating];

  if (v5)
  {
    BOOL v6 = _MKLocalizedStringFromThisBundle(@"Percentage (Count) [UGC]");
    [v5 percentage];
    v7 = objc_msgSend(a1, "_stringForPercentage:");
    id v8 = +[MKFirstPartyRatingFormatter stringFromCount:](MKFirstPartyRatingFormatter, "stringFromCount:", (int)[v5 numberOfRatingsUsedForScore]);
    v9 = objc_msgSend(NSString, "localizedStringWithFormat:", v6, v7, v8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: overallRating != ((void *)0)", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

+ (id)ratingPercentageAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v24 = a6;
  v12 = [a3 _geoMapItem];
  id v13 = [v12 _overallAppleRating];

  if (v13)
  {
    uint64_t v14 = _MKLocalizedStringFromThisBundle(@"Recommend (%@) [UGC]");
    v15 = +[MKFirstPartyRatingFormatter stringFromCount:](MKFirstPartyRatingFormatter, "stringFromCount:", (int)[v13 numberOfRatingsUsedForScore]);
    v23 = (void *)v14;
    v16 = objc_msgSend(NSString, "localizedStringWithFormat:", v14, v15);
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v16];
    v26[0] = *MEMORY[0x1E4F42508];
    double v18 = v11;
    if (!v11)
    {
      BOOL v6 = +[MKFontManager sharedManager];
      double v18 = [v6 subtitleFont];
    }
    v27[0] = v18;
    v26[1] = *MEMORY[0x1E4F42510];
    v19 = v10;
    if (!v10)
    {
      v19 = [v24 textColor];
    }
    v27[1] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
    if (v10)
    {
      if (v11)
      {
LABEL_8:
        objc_msgSend(v17, "setAttributes:range:", v20, 0, objc_msgSend(v17, "length"));
        id v21 = (void *)[v17 copy];

        goto LABEL_9;
      }
    }
    else
    {

      if (v11) {
        goto LABEL_8;
      }
    }

    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: overallRating != ((void *)0)", buf, 2u);
  }
  id v21 = 0;
LABEL_9:

  return v21;
}

+ (id)percentageStringForMapItem:(id)a3 showNumberOfRatings:(BOOL)a4 textColor:(id)a5 font:(id)a6 theme:(id)a7
{
  uint64_t v10 = a4;
  v28[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [a1 thumbRecommendStringWithMapItem:v12 font:v14 includeGlyph:1];
  unint64_t v17 = 0x1E4F28000;
  if (v10)
  {
    double v18 = [a1 ratingPercentageAttributedStringForMapItem:v12 textColor:v13 font:v14 theme:v15];
    goto LABEL_10;
  }
  v19 = _MKLocalizedStringFromThisBundle(@"Recommend [UGC]");
  v27[0] = *MEMORY[0x1E4F42508];
  v20 = v14;
  if (!v14)
  {
    uint64_t v10 = +[MKFontManager sharedManager];
    v20 = [(id)v10 subtitleFont];
  }
  v28[0] = v20;
  v27[1] = *MEMORY[0x1E4F42510];
  id v21 = v13;
  if (!v13)
  {
    id v21 = [v15 textColor];
  }
  v28[1] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  if (!v13)
  {

    if (v14) {
      goto LABEL_9;
    }
LABEL_14:

    goto LABEL_9;
  }
  if (!v14) {
    goto LABEL_14;
  }
LABEL_9:
  unint64_t v17 = 0x1E4F28000uLL;
  double v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v19 attributes:v22];

LABEL_10:
  id v23 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  [v23 appendAttributedString:v16];
  id v24 = (void *)[objc_alloc(*(Class *)(v17 + 2840)) initWithString:@" " attributes:0];
  [v23 appendAttributedString:v24];

  [v23 appendAttributedString:v18];
  v25 = (void *)[v23 copy];

  return v25;
}

+ (id)carPlayHeaderStringForMapItem:(id)a3 titleAttributes:(id)a4 providerAttributes:(id)a5
{
  id v7 = a4;
  id v8 = [a3 _geoMapItem];
  v9 = [v8 _overallAppleRating];

  [v9 percentage];
  double v11 = v10;
  id v12 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];
  id v13 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F42510]];

  id v14 = [a1 ratingStringForPercentage:v12 font:v13 color:0 includeGlyph:v11];

  return v14;
}

+ (id)userRecommendationStringWithFont:(id)a3 ratingState:(int64_t)a4 numberOfPhotosAdded:(unint64_t)a5
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  double v10 = objc_opt_new();
  double v11 = (uint64_t *)MEMORY[0x1E4F42510];
  unint64_t v12 = 0x1E4F1C000;
  if (a4)
  {
    unint64_t v41 = a5;
    id v13 = (void *)MEMORY[0x1E4F42A80];
    if (a4 == 2)
    {
      id v14 = [a1 ratingSymbolName];
      id v15 = objc_msgSend(v13, "_mapkit_systemImageNamed:", v14);

      double v16 = 1.0;
      unint64_t v17 = @"You Recommend [UGC]";
    }
    else
    {
      id v15 = objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_systemImageNamed:", @"hand.thumbsdown.fill");
      double v16 = 0.0;
      unint64_t v17 = @"You Dislike [UGC]";
    }
    v40 = _MKLocalizedStringFromThisBundle(v17);
    double v18 = [a1 _colorForPercentage:v16];
    v19 = (void *)MEMORY[0x1E4F42A98];
    [v8 pointSize];
    v20 = objc_msgSend(v19, "_mapkit_configurationWithPointSize:weight:scale:", 1);
    id v21 = objc_msgSend(v15, "_mapkit_imageWithSymbolConfiguration:", v20);

    v22 = [v21 imageWithRenderingMode:2];

    id v23 = v8;
    id v24 = objc_alloc_init(MEMORY[0x1E4F42698]);
    [v24 setImage:v22];
    [v10 addObject:v40];
    v25 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v24];
    [v9 appendAttributedString:v25];

    id v26 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    [v9 appendAttributedString:v26];

    double v11 = (uint64_t *)MEMORY[0x1E4F42510];
    uint64_t v27 = *MEMORY[0x1E4F42510];
    v44[0] = *MEMORY[0x1E4F42508];
    v44[1] = v27;
    v45[0] = v23;
    v45[1] = v18;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
    objc_msgSend(v9, "addAttributes:range:", v28, 0, objc_msgSend(v9, "length"));

    id v8 = v23;
    unint64_t v12 = 0x1E4F1C000uLL;

    a5 = v41;
  }
  if (a5)
  {
    id v29 = _MKLocalizedStringFromThisBundle(@"Number Of Photos [UGC]");
    v30 = objc_msgSend(NSString, "localizedStringWithFormat:", v29, a5);
    [v10 addObject:v30];
  }
  v31 = _MKLocalizedStringFromThisBundle(@" · [Delimeter]");
  v32 = [v10 componentsJoinedByString:v31];

  v33 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v32];
  uint64_t v34 = *v11;
  v42[0] = *MEMORY[0x1E4F42508];
  v42[1] = v34;
  v43[0] = v8;
  id v35 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v43[1] = v35;
  v36 = [*(id *)(v12 + 2536) dictionaryWithObjects:v43 forKeys:v42 count:2];

  objc_msgSend(v33, "addAttributes:range:", v36, 0, objc_msgSend(v32, "length"));
  id v37 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  v38 = v37;
  if (a4) {
    [v37 appendAttributedString:v9];
  }
  [v38 appendAttributedString:v33];

  return v38;
}

+ (id)ratingColorForMapItem:(id)a3
{
  v4 = [a3 _geoMapItem];
  BOOL v5 = [v4 _overallAppleRating];
  [v5 percentage];
  BOOL v6 = objc_msgSend(a1, "_colorForPercentage:");

  return v6;
}

@end