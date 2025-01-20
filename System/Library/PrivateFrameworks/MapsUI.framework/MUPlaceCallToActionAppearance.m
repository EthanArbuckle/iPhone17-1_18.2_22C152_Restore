@interface MUPlaceCallToActionAppearance
+ (id)userRecommendedAppearanceForNumberOfPhotosAdded:(unint64_t)a3;
+ (id)userRecommendedAppearanceForRatingState:(int64_t)a3;
+ (id)userRecommendedAppearanceForRatingState:(int64_t)a3 numberOfPhotosAdded:(unint64_t)a4;
+ (id)userRecommendedLoadingAppearance;
- (BOOL)isEqual:(id)a3;
- (MUPlaceCallToActionAppearance)initWithType:(int64_t)a3;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)numberOfPhotosAdded;
- (void)setNumberOfPhotosAdded:(unint64_t)a3;
@end

@implementation MUPlaceCallToActionAppearance

- (MUPlaceCallToActionAppearance)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MUPlaceCallToActionAppearance;
  result = [(MUPlaceCallToActionAppearance *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

+ (id)userRecommendedAppearanceForRatingState:(int64_t)a3 numberOfPhotosAdded:(unint64_t)a4
{
  v6 = [[MUPlaceCallToActionAppearance alloc] initWithType:4];
  [(MKUGCCallToActionViewAppearance *)v6 setRatingState:a3];
  [(MUPlaceCallToActionAppearance *)v6 setNumberOfPhotosAdded:a4];
  return v6;
}

+ (id)userRecommendedAppearanceForNumberOfPhotosAdded:(unint64_t)a3
{
  v4 = [[MUPlaceCallToActionAppearance alloc] initWithType:4];
  [(MUPlaceCallToActionAppearance *)v4 setNumberOfPhotosAdded:a3];
  return v4;
}

+ (id)userRecommendedAppearanceForRatingState:(int64_t)a3
{
  v4 = [[MUPlaceCallToActionAppearance alloc] initWithType:4];
  [(MKUGCCallToActionViewAppearance *)v4 setRatingState:a3];
  return v4;
}

+ (id)userRecommendedLoadingAppearance
{
  v2 = [[MUPlaceCallToActionAppearance alloc] initWithType:5];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MUPlaceCallToActionAppearance *)a3;
  if (v4 == self)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t type = self->_type;
      v6 = v4;
      uint64_t v7 = [(MUPlaceCallToActionAppearance *)v6 type];
      int64_t v8 = [(MKUGCCallToActionViewAppearance *)self ratingState];
      uint64_t v9 = [(MKUGCCallToActionViewAppearance *)v6 ratingState];
      unint64_t v10 = [(MUPlaceCallToActionAppearance *)self numberOfPhotosAdded];
      uint64_t v11 = [(MUPlaceCallToActionAppearance *)v6 numberOfPhotosAdded];

      BOOL v14 = type == v7 && v8 == v9 && v10 == v11;
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  int64_t v3 = [(MUPlaceCallToActionAppearance *)self type];
  unint64_t v4 = [(MUPlaceCallToActionAppearance *)self numberOfPhotosAdded] ^ v3;
  return v4 ^ [(MKUGCCallToActionViewAppearance *)self ratingState];
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)numberOfPhotosAdded
{
  return self->_numberOfPhotosAdded;
}

- (void)setNumberOfPhotosAdded:(unint64_t)a3
{
  self->_numberOfPhotosAdded = a3;
}

@end