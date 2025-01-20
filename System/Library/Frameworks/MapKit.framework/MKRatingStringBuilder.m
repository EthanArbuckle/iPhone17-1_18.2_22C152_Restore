@interface MKRatingStringBuilder
+ (Class)ratingStringProviderForMapItem:(id)a3;
+ (id)carPlayHeaderStringForMapItem:(id)a3 titleAttributes:(id)a4 providerAttributes:(id)a5;
+ (id)delimitedPriceRangeAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5;
+ (id)priceLabelStringFromMapItem:(id)a3;
+ (id)ratingAndReviewSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6;
+ (id)ratingColorForMapItem:(id)a3;
+ (id)ratingSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6;
+ (id)ratingSymbolNameForMapItem:(id)a3;
@end

@implementation MKRatingStringBuilder

+ (id)ratingSymbolNameForMapItem:(id)a3
{
  v3 = (void *)[a1 ratingStringProviderForMapItem:a3];

  return (id)[v3 ratingSymbolName];
}

+ (Class)ratingStringProviderForMapItem:(id)a3
{
  v3 = [a3 _geoMapItem];
  [v3 _hasAppleRatings];

  v4 = objc_opt_class();

  return (Class)v4;
}

+ (id)ratingSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_msgSend((id)objc_msgSend(a1, "ratingStringProviderForMapItem:", v13), "ratingSummaryAttributedStringForMapItem:textColor:font:theme:", v13, v12, v11, v10);

  return v14;
}

+ (id)ratingAndReviewSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_msgSend((id)objc_msgSend(a1, "ratingStringProviderForMapItem:", v13), "ratingAndReviewSummaryAttributedStringForMapItem:textColor:font:theme:", v13, v12, v11, v10);

  return v14;
}

+ (id)delimitedPriceRangeAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  v9 = [a3 _priceRangeString];
  if ([v9 length])
  {
    id v10 = _MKLocalizedStringFromThisBundle(@"Delimiter [Nano]");
    id v11 = [NSString stringWithFormat:@"%@%@", v10, v9];
    uint64_t v12 = *MEMORY[0x1E4F42508];
    v17[0] = *MEMORY[0x1E4F42510];
    v17[1] = v12;
    v18[0] = v7;
    v18[1] = v8;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v11];
    objc_msgSend(v14, "setAttributes:range:", v13, 0, objc_msgSend(v14, "length"));
    id v15 = (id)[v14 copy];
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F28B18]);
  }

  return v15;
}

+ (id)priceLabelStringFromMapItem:(id)a3
{
  id v3 = a3;
  if ([v3 _hasPriceDescription])
  {
    uint64_t v4 = [v3 _priceDescription];
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_7;
  }
  if ([v3 _hasPriceRange])
  {
    uint64_t v4 = [v3 _priceRangeString];
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

+ (id)carPlayHeaderStringForMapItem:(id)a3 titleAttributes:(id)a4 providerAttributes:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_msgSend((id)objc_msgSend(a1, "ratingStringProviderForMapItem:", v10), "carPlayHeaderStringForMapItem:titleAttributes:providerAttributes:", v10, v9, v8);

  return v11;
}

+ (id)ratingColorForMapItem:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_msgSend(a1, "ratingStringProviderForMapItem:", v4), "ratingColorForMapItem:", v4);

  return v5;
}

@end