@interface ASCFixedCornerRadiusOfferBackgroundStyle
- (ASCFixedCornerRadiusOfferBackgroundStyle)initWithCornerRadius:(double)a3;
- (BOOL)isEqual:(id)a3;
- (double)cornerRadius;
- (unint64_t)hash;
@end

@implementation ASCFixedCornerRadiusOfferBackgroundStyle

- (ASCFixedCornerRadiusOfferBackgroundStyle)initWithCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASCFixedCornerRadiusOfferBackgroundStyle;
  result = [(ASCOfferBackgroundStyle *)&v5 _init];
  if (result) {
    result->_cornerRadius = a3;
  }
  return result;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  [(ASCFixedCornerRadiusOfferBackgroundStyle *)self cornerRadius];
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  unint64_t v4 = [(ASCHasher *)v3 finalizeHash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    [(ASCFixedCornerRadiusOfferBackgroundStyle *)self cornerRadius];
    double v9 = v8;
    [v7 cornerRadius];
    BOOL v11 = v9 == v10;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

@end