@interface MUPlaceRatingReviewTitleBuilder
- (BOOL)supportsGuides;
- (BOOL)supportsRatings;
- (BOOL)supportsReviews;
- (id)buildTitleString;
- (unint64_t)titleType;
- (void)setSupportsGuides:(BOOL)a3;
- (void)setSupportsRatings:(BOOL)a3;
- (void)setSupportsReviews:(BOOL)a3;
@end

@implementation MUPlaceRatingReviewTitleBuilder

- (unint64_t)titleType
{
  BOOL v3 = [(MUPlaceRatingReviewTitleBuilder *)self supportsRatings];
  BOOL v4 = [(MUPlaceRatingReviewTitleBuilder *)self supportsReviews];
  BOOL v5 = v4;
  if (v3)
  {
    if (v4 && [(MUPlaceRatingReviewTitleBuilder *)self supportsGuides])
    {
      return 4;
    }
    else if ([(MUPlaceRatingReviewTitleBuilder *)self supportsReviews])
    {
      return 2;
    }
    else if ([(MUPlaceRatingReviewTitleBuilder *)self supportsGuides])
    {
      return 3;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    BOOL v7 = [(MUPlaceRatingReviewTitleBuilder *)self supportsGuides];
    unint64_t v8 = 7;
    if (!v7) {
      unint64_t v8 = 0;
    }
    unint64_t v9 = 5;
    if (v7) {
      unint64_t v9 = 6;
    }
    if (v5) {
      return v9;
    }
    else {
      return v8;
    }
  }
}

- (id)buildTitleString
{
  if ([(MUPlaceRatingReviewTitleBuilder *)self titleType]
    && (unint64_t v3 = [(MUPlaceRatingReviewTitleBuilder *)self titleType] - 1, v3 <= 6))
  {
    _MULocalizedStringFromThisBundle(off_1E574F8E8[v3]);
    BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v4 = &stru_1EE3BF360;
  }
  return v4;
}

- (BOOL)supportsRatings
{
  return self->_supportsRatings;
}

- (void)setSupportsRatings:(BOOL)a3
{
  self->_supportsRatings = a3;
}

- (BOOL)supportsReviews
{
  return self->_supportsReviews;
}

- (void)setSupportsReviews:(BOOL)a3
{
  self->_supportsReviews = a3;
}

- (BOOL)supportsGuides
{
  return self->_supportsGuides;
}

- (void)setSupportsGuides:(BOOL)a3
{
  self->_supportsGuides = a3;
}

@end