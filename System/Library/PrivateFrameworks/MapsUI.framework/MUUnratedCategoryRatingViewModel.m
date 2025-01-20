@interface MUUnratedCategoryRatingViewModel
- (BOOL)hasPercentage;
- (BOOL)hasSubtitle;
- (BOOL)isEqual:(id)a3;
- (MUUnratedCategoryRatingViewModel)initWithCategoryTitle:(id)a3 clientCountAdjustment:(int64_t)a4;
- (NSString)categoryTitle;
- (double)maxScore;
- (double)score;
- (unint64_t)displayPercentage;
- (unint64_t)hash;
- (unint64_t)numberOfRatingsUsedForScore;
@end

@implementation MUUnratedCategoryRatingViewModel

- (MUUnratedCategoryRatingViewModel)initWithCategoryTitle:(id)a3 clientCountAdjustment:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUUnratedCategoryRatingViewModel;
  v7 = [(MUUnratedCategoryRatingViewModel *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    categoryTitle = v7->_categoryTitle;
    v7->_categoryTitle = (NSString *)v8;

    v7->_countAdjustment = a4;
  }

  return v7;
}

- (unint64_t)displayPercentage
{
  return 0;
}

- (double)score
{
  return 0.0;
}

- (double)maxScore
{
  return 0.0;
}

- (unint64_t)numberOfRatingsUsedForScore
{
  return self->_countAdjustment & ~(self->_countAdjustment >> 63);
}

- (BOOL)hasSubtitle
{
  return 1;
}

- (BOOL)hasPercentage
{
  return 0;
}

- (unint64_t)hash
{
  return [(NSString *)self->_categoryTitle hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MUUnratedCategoryRatingViewModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    categoryTitle = self->_categoryTitle;
    uint64_t v8 = [(MUUnratedCategoryRatingViewModel *)v6 categoryTitle];
    BOOL v9 = (categoryTitle == v8 || [(NSString *)categoryTitle isEqual:v8])
      && self->_countAdjustment == v6->_countAdjustment;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSString)categoryTitle
{
  return self->_categoryTitle;
}

- (void).cxx_destruct
{
}

@end