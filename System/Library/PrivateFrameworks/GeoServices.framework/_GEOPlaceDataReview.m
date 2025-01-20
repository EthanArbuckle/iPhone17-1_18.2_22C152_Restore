@interface _GEOPlaceDataReview
- (NSDate)_date;
- (NSString)_identifier;
- (NSString)_localizedSnippet;
- (NSString)_localizedSnippetLocale;
- (NSString)_reviewerImageURLString;
- (NSString)_reviewerName;
- (_GEOPlaceDataReview)initWithPlaceData:(id)a3 review:(id)a4;
- (double)_maxScore;
- (double)_normalizedScore;
- (double)_score;
@end

@implementation _GEOPlaceDataReview

- (_GEOPlaceDataReview)initWithPlaceData:(id)a3 review:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_GEOPlaceDataReview;
  v9 = [(_GEOPlaceDataReview *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placeData, a3);
    objc_storeStrong((id *)&v10->_review, a4);
    v11 = v10;
  }

  return v10;
}

- (double)_score
{
  -[GEOPDReview rating]((id *)&self->_review->super.super.isa);
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    double v3 = v2[4];
  }
  else {
    double v3 = 0.0;
  }

  return v3;
}

- (double)_maxScore
{
  uint64_t v2 = -[GEOPDReview rating]((id *)&self->_review->super.super.isa);
  if (v2)
  {
    double v3 = 5.0;
    if (*(unsigned char *)(v2 + 48)) {
      double v3 = *(double *)(v2 + 24);
    }
  }
  else
  {
    double v3 = 0.0;
  }

  return v3;
}

- (double)_normalizedScore
{
  uint64_t v3 = -[GEOPDReview rating]((id *)&self->_review->super.super.isa);
  v4 = (void *)v3;
  double v5 = 0.0;
  double v6 = 0.0;
  if (v3) {
    double v6 = *(double *)(v3 + 32);
  }
  uint64_t v7 = -[GEOPDReview rating]((id *)&self->_review->super.super.isa);
  if (v7)
  {
    double v5 = 5.0;
    if (*(unsigned char *)(v7 + 48)) {
      double v5 = *(double *)(v7 + 24);
    }
  }

  return v6 / v5 * 5.0;
}

- (NSString)_localizedSnippet
{
  return (NSString *)[(GEOPDReview *)self->_review _bestSnippet];
}

- (NSString)_localizedSnippetLocale
{
  return (NSString *)[(GEOPDReview *)self->_review _bestSnippetLocale];
}

- (NSDate)_date
{
  review = self->_review;
  if (review) {
    double reviewTime = review->_reviewTime;
  }
  else {
    double reviewTime = 0.0;
  }
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:reviewTime];
}

- (NSString)_reviewerName
{
  -[GEOPDReview reviewer]((id *)&self->_review->super.super.isa);
  uint64_t v2 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = -[GEOPDUser name](v2);

  return (NSString *)v3;
}

- (NSString)_reviewerImageURLString
{
  -[GEOPDReview reviewer]((id *)&self->_review->super.super.isa);
  uint64_t v2 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = -[GEOPDUser image](v2);
  v4 = [v3 bestURL];

  return (NSString *)v4;
}

- (NSString)_identifier
{
  return -[GEOPDReview reviewId]((id *)&self->_review->super.super.isa);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_review, 0);

  objc_storeStrong((id *)&self->_placeData, 0);
}

@end