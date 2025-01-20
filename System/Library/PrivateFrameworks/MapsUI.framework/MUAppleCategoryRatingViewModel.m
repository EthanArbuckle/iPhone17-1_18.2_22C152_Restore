@interface MUAppleCategoryRatingViewModel
- (BOOL)hasPercentage;
- (BOOL)hasSubtitle;
- (BOOL)isEqual:(id)a3;
- (MUAppleCategoryRatingViewModel)initWithAppleRating:(id)a3 clientCountAdjustment:(int64_t)a4;
- (NSString)categoryTitle;
- (double)maxScore;
- (double)score;
- (unint64_t)displayPercentage;
- (unint64_t)hash;
- (unint64_t)numberOfRatingsUsedForScore;
@end

@implementation MUAppleCategoryRatingViewModel

- (MUAppleCategoryRatingViewModel)initWithAppleRating:(id)a3 clientCountAdjustment:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUAppleCategoryRatingViewModel;
  v8 = [(MUAppleCategoryRatingViewModel *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appleRating, a3);
    v9->_countAdjustment = a4;
  }

  return v9;
}

- (NSString)categoryTitle
{
  return [(GEOAppleRating *)self->_appleRating categoryTitle];
}

- (unint64_t)displayPercentage
{
  return [(GEOAppleRating *)self->_appleRating displayPercentage];
}

- (double)score
{
  [(GEOAppleRating *)self->_appleRating score];
  return result;
}

- (double)maxScore
{
  [(GEOAppleRating *)self->_appleRating maxScore];
  return result;
}

- (unint64_t)numberOfRatingsUsedForScore
{
  int v3 = [(GEOAppleRating *)self->_appleRating numberOfRatingsUsedForScore];
  return (self->_countAdjustment + v3) & ~((self->_countAdjustment + v3) >> 63);
}

- (BOOL)hasSubtitle
{
  return 1;
}

- (BOOL)hasPercentage
{
  return [(GEOAppleRating *)self->_appleRating hasPercentage];
}

- (unint64_t)hash
{
  return [(GEOAppleRating *)self->_appleRating hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MUAppleCategoryRatingViewModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    appleRating = self->_appleRating;
    BOOL v8 = (appleRating == v6->_appleRating || -[GEOAppleRating isEqual:](appleRating, "isEqual:"))
      && self->_countAdjustment == v6->_countAdjustment;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end