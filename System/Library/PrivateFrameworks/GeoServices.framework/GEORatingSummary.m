@interface GEORatingSummary
- (BOOL)isAppleRating;
- (GEORatingSummary)initWithRatingData:(id)a3 attributionMap:(id)a4;
- (NSString)vendorName;
- (float)_normalizedFirstPartyUserRatingScore;
- (float)_normalizedThirdPartyUserRatingScore;
- (float)normalizedUserRatingScore;
- (float)sampleSizeUsedForScore;
@end

@implementation GEORatingSummary

- (GEORatingSummary)initWithRatingData:(id)a3 attributionMap:(id)a4
{
  v7 = a3;
  id v8 = a4;
  if (v7 && (-[GEOPDRatingData _readVendorId]((uint64_t)v7), v7[4]))
  {
    v13.receiver = self;
    v13.super_class = (Class)GEORatingSummary;
    v9 = [(GEORatingSummary *)&v13 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeWeak((id *)&v9->_attributionMap, v8);
      objc_storeStrong(p_isa + 1, a3);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isAppleRating
{
  v2 = -[GEOPDRatingData ratings]((id *)&self->_ratingData->super.super.isa);
  uint64_t v3 = [v2 firstObject];
  BOOL v4 = v3 && (*(unsigned char *)(v3 + 48) & 8) != 0 && *(_DWORD *)(v3 + 44) == 4;

  return v4;
}

- (float)normalizedUserRatingScore
{
  if ([(GEORatingSummary *)self isAppleRating])
  {
    [(GEORatingSummary *)self _normalizedFirstPartyUserRatingScore];
  }
  else
  {
    [(GEORatingSummary *)self _normalizedThirdPartyUserRatingScore];
  }
  return result;
}

- (float)_normalizedFirstPartyUserRatingScore
{
  uint64_t v3 = [GEOAppleRating alloc];
  BOOL v4 = -[GEOPDRatingData ratings]((id *)&self->_ratingData->super.super.isa);
  v5 = [v4 firstObject];
  v6 = [(GEOAppleRating *)v3 initWithRating:v5];

  [(GEOAppleRating *)v6 percentage];
  *(float *)&double v7 = v7;
  float v8 = *(float *)&v7 * 100.0;

  return v8;
}

- (float)_normalizedThirdPartyUserRatingScore
{
  v2 = -[GEOPDRatingData ratings]((id *)&self->_ratingData->super.super.isa);
  uint64_t v3 = [v2 firstObject];

  if (v3)
  {
    double v4 = *(double *)(v3 + 32);
    if (*(unsigned char *)(v3 + 48)) {
      double v4 = v4 * (5.0 / *(double *)(v3 + 24));
    }
  }
  else
  {
    double v4 = 0.0;
  }
  float v5 = v4;

  return v5;
}

- (float)sampleSizeUsedForScore
{
  v2 = -[GEOPDRatingData ratings]((id *)&self->_ratingData->super.super.isa);
  uint64_t v3 = [v2 firstObject];
  if (v3) {
    float v4 = (float)v3[10];
  }
  else {
    float v4 = 0.0;
  }

  return v4;
}

- (NSString)vendorName
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attributionMap);
  float v4 = -[GEOPDRatingData vendorId]((id *)&self->_ratingData->super.super.isa);
  float v5 = [WeakRetained objectForKey:v4];

  v6 = [v5 displayName];

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attributionMap);

  objc_storeStrong((id *)&self->_ratingData, 0);
}

@end