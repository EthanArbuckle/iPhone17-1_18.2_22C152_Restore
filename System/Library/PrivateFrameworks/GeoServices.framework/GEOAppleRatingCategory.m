@interface GEOAppleRatingCategory
- (GEOAppleRatingCategory)initWithRatingCategory:(id)a3;
- (NSString)key;
- (NSString)localizedTitle;
@end

@implementation GEOAppleRatingCategory

- (GEOAppleRatingCategory)initWithRatingCategory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOAppleRatingCategory;
  v6 = [(GEOAppleRatingCategory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ratingCategory, a3);
  }

  return v7;
}

- (NSString)localizedTitle
{
  return (NSString *)[(GEOPDRatingCategory *)self->_ratingCategory displayTitle];
}

- (NSString)key
{
  return -[GEOPDRatingCategory key]((id *)&self->_ratingCategory->super.super.isa);
}

- (void).cxx_destruct
{
}

@end