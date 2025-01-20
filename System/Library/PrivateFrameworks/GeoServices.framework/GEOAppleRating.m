@interface GEOAppleRating
- (BOOL)isRecommended;
- (GEOAppleRating)initWithRating:(id)a3;
- (NSString)localizedTitle;
- (double)maxScore;
- (double)percentage;
- (double)score;
- (int)numberOfRatingsUsedForScore;
- (int64_t)ratingType;
@end

@implementation GEOAppleRating

- (GEOAppleRating)initWithRating:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5 && (*((unsigned char *)v5 + 48) & 8) != 0 && *((_DWORD *)v5 + 11) == 4)
  {
    v11.receiver = self;
    v11.super_class = (Class)GEOAppleRating;
    v8 = [(GEOAppleRating *)&v11 init];
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_pdRating, a3);
    }
    self = v9;
    v7 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: rating.ratingType == GEOPDRating_RatingType_APPLE_RATING", buf, 2u);
    }
    v7 = 0;
  }

  return v7;
}

- (double)percentage
{
  [(GEOAppleRating *)self maxScore];
  if (v3 == 0.0) {
    return 0.0;
  }
  [(GEOAppleRating *)self score];
  double v5 = v4;
  [(GEOAppleRating *)self maxScore];
  return v5 / v6;
}

- (double)score
{
  pdRating = self->_pdRating;
  if (pdRating) {
    return pdRating->_score;
  }
  else {
    return 0.0;
  }
}

- (double)maxScore
{
  pdRating = self->_pdRating;
  if (!pdRating) {
    return 0.0;
  }
  double result = 5.0;
  if (*(unsigned char *)&pdRating->_flags) {
    return pdRating->_maxScore;
  }
  return result;
}

- (int)numberOfRatingsUsedForScore
{
  pdRating = self->_pdRating;
  if (pdRating) {
    return pdRating->_numRatingsUsedForScore;
  }
  else {
    return 0;
  }
}

- (NSString)localizedTitle
{
  return (NSString *)[(GEOPDRating *)self->_pdRating displayTitle];
}

- (int64_t)ratingType
{
  v2 = [(GEOPDRating *)self->_pdRating displayTitle];
  int64_t v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)isRecommended
{
  [(GEOAppleRating *)self percentage];
  return v2 > 0.5;
}

- (void).cxx_destruct
{
}

@end