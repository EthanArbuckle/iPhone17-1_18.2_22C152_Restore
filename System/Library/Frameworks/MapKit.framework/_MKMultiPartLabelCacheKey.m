@interface _MKMultiPartLabelCacheKey
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (NSAttributedString)attributedString;
- (_MKMultiPartLabelCacheKey)initWithAttributedString:(id)a3 size:(CGSize)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation _MKMultiPartLabelCacheKey

- (_MKMultiPartLabelCacheKey)initWithAttributedString:(id)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_MKMultiPartLabelCacheKey;
  v8 = [(_MKMultiPartLabelCacheKey *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    attributedString = v8->_attributedString;
    v8->_attributedString = (NSAttributedString *)v9;

    v8->_size.CGFloat width = width;
    v8->_size.CGFloat height = height;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  attributedString = self->_attributedString;
  double width = self->_size.width;
  double height = self->_size.height;

  return (id)objc_msgSend(v4, "initWithAttributedString:size:", attributedString, width, height);
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if ([v5 isMemberOfClass:objc_opt_class()])
  {
    [(_MKMultiPartLabelCacheKey *)self size];
    double v7 = v6;
    double v9 = v8;
    [v5 size];
    if (v7 == v11 && v9 == v10)
    {
      v14 = [(_MKMultiPartLabelCacheKey *)self attributedString];
      if (v14 || ([v5 attributedString], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v15 = [(_MKMultiPartLabelCacheKey *)self attributedString];
        v16 = [v5 attributedString];
        char v13 = [v15 isEqual:v16];

        if (v14)
        {
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        char v13 = 1;
      }

      goto LABEL_13;
    }
  }
  char v13 = 0;
LABEL_14:

  return v13;
}

- (unint64_t)hash
{
  [(_MKMultiPartLabelCacheKey *)self size];
  if (v3 < 0.0) {
    double v3 = -v3;
  }
  long double v4 = floor(v3 + 0.5);
  double v5 = (v3 - v4) * 1.84467441e19;
  double v6 = fmod(v4, 1.84467441e19);
  unint64_t v7 = 2654435761u * (unint64_t)v6;
  unint64_t v8 = v7 + (unint64_t)v5;
  if (v5 <= 0.0) {
    unint64_t v8 = 2654435761u * (unint64_t)v6;
  }
  unint64_t v9 = v7 - (unint64_t)fabs(v5);
  if (v5 < 0.0) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = v8;
  }
  [(_MKMultiPartLabelCacheKey *)self size];
  double v12 = -v11;
  if (v11 >= 0.0) {
    double v12 = v11;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  double v15 = fmod(v13, 1.84467441e19);
  unint64_t v16 = 2654435761u * (unint64_t)v15;
  unint64_t v17 = v16 + (unint64_t)v14;
  if (v14 <= 0.0) {
    unint64_t v17 = 2654435761u * (unint64_t)v15;
  }
  unint64_t v18 = v16 - (unint64_t)fabs(v14);
  if (v14 < 0.0) {
    unint64_t v19 = v18;
  }
  else {
    unint64_t v19 = v17;
  }
  v20 = [(_MKMultiPartLabelCacheKey *)self attributedString];
  unint64_t v21 = v19 ^ v10 ^ [v20 hash];

  return v21;
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(_MKMultiPartLabelCacheKey *)self size];
  double v5 = NSStringFromCGSize(v10);
  double v6 = [(_MKMultiPartLabelCacheKey *)self attributedString];
  unint64_t v7 = [v3 stringWithFormat:@"<%@:%p\nsize=%@\nattributedString =%@\n>", v4, self, v5, v6];

  return v7;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end