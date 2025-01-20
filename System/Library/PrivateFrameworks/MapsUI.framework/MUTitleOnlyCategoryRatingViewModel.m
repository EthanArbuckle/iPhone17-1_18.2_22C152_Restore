@interface MUTitleOnlyCategoryRatingViewModel
- (BOOL)hasPercentage;
- (BOOL)hasSubtitle;
- (BOOL)isEqual:(id)a3;
- (MUTitleOnlyCategoryRatingViewModel)initWithCategoryTitle:(id)a3;
- (NSString)categoryTitle;
- (double)maxScore;
- (double)score;
- (unint64_t)displayPercentage;
- (unint64_t)hash;
- (unint64_t)numberOfRatingsUsedForScore;
@end

@implementation MUTitleOnlyCategoryRatingViewModel

- (MUTitleOnlyCategoryRatingViewModel)initWithCategoryTitle:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUTitleOnlyCategoryRatingViewModel;
  v5 = [(MUTitleOnlyCategoryRatingViewModel *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    categoryTitle = v5->_categoryTitle;
    v5->_categoryTitle = (NSString *)v6;
  }
  return v5;
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
  return 0;
}

- (BOOL)hasSubtitle
{
  return 0;
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
  id v4 = (MUTitleOnlyCategoryRatingViewModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    categoryTitle = self->_categoryTitle;
    v7 = [(MUTitleOnlyCategoryRatingViewModel *)v5 categoryTitle];
    if (categoryTitle == v7) {
      char v8 = 1;
    }
    else {
      char v8 = [(NSString *)categoryTitle isEqual:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSString)categoryTitle
{
  return self->_categoryTitle;
}

- (void).cxx_destruct
{
}

@end