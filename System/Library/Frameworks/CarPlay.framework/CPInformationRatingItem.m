@interface CPInformationRatingItem
+ (BOOL)supportsSecureCoding;
- (CPInformationRatingItem)initWithCoder:(id)a3;
- (CPInformationRatingItem)initWithRating:(NSNumber *)rating maximumRating:(NSNumber *)maximumRating title:(NSString *)title detail:(NSString *)detail;
- (CPInformationRatingItem)initWithTitle:(id)a3 detail:(id)a4;
- (NSNumber)maximumRating;
- (NSNumber)rating;
- (void)_santizeRatingItem;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPInformationRatingItem

- (CPInformationRatingItem)initWithRating:(NSNumber *)rating maximumRating:(NSNumber *)maximumRating title:(NSString *)title detail:(NSString *)detail
{
  v10 = rating;
  v11 = maximumRating;
  v19.receiver = self;
  v19.super_class = (Class)CPInformationRatingItem;
  v12 = [(CPInformationItem *)&v19 initWithTitle:title detail:detail];
  if (v12)
  {
    if (v10)
    {
      v13 = (void *)[(NSNumber *)v10 copy];
    }
    else
    {
      v13 = [NSNumber numberWithFloat:0.0];
    }
    v14 = v13;
    objc_storeStrong((id *)&v12->_rating, v13);

    if (v11)
    {
      v16 = (void *)[(NSNumber *)v11 copy];
    }
    else
    {
      LODWORD(v15) = 5.0;
      v16 = [NSNumber numberWithFloat:v15];
    }
    v17 = v16;
    objc_storeStrong((id *)&v12->_maximumRating, v16);

    [(CPInformationRatingItem *)v12 _santizeRatingItem];
  }

  return v12;
}

- (CPInformationRatingItem)initWithTitle:(id)a3 detail:(id)a4
{
  return [(CPInformationRatingItem *)self initWithRating:0 maximumRating:0 title:a3 detail:a4];
}

- (void)_santizeRatingItem
{
  [(NSNumber *)self->_maximumRating floatValue];
  double v4 = fmax(fmin(roundf(v3), 5.0), 1.0);
  [(NSNumber *)self->_rating floatValue];
  double v6 = fmax(fmin(round(v5 + v5) * 0.5, v4), 0.0);
  *(float *)&double v6 = v6;
  v7 = [NSNumber numberWithFloat:v6];
  rating = self->_rating;
  self->_rating = v7;

  *(float *)&double v9 = v4;
  self->_maximumRating = [NSNumber numberWithFloat:v9];

  MEMORY[0x270F9A758]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPInformationRatingItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPInformationRatingItem;
  float v5 = [(CPInformationItem *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPInformationRatingItemRatingKey"];
    rating = v5->_rating;
    v5->_rating = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPInformationRatingItemMaximumRatingKey"];
    maximumRating = v5->_maximumRating;
    v5->_maximumRating = (NSNumber *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPInformationRatingItem;
  id v4 = a3;
  [(CPInformationItem *)&v7 encodeWithCoder:v4];
  float v5 = [(CPInformationRatingItem *)self rating];
  [v4 encodeObject:v5 forKey:@"kCPInformationRatingItemRatingKey"];

  uint64_t v6 = [(CPInformationRatingItem *)self maximumRating];
  [v4 encodeObject:v6 forKey:@"kCPInformationRatingItemMaximumRatingKey"];
}

- (NSNumber)rating
{
  return self->_rating;
}

- (NSNumber)maximumRating
{
  return self->_maximumRating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumRating, 0);

  objc_storeStrong((id *)&self->_rating, 0);
}

@end