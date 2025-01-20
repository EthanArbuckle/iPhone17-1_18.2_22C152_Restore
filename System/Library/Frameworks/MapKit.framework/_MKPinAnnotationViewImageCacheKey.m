@interface _MKPinAnnotationViewImageCacheKey
- (BOOL)isEqual:(id)a3;
- (_MKPinAnnotationViewImageCacheKey)initWithMapType:(unint64_t)a3 pinColor:(id)a4 traits:(id)a5;
- (unint64_t)hash;
@end

@implementation _MKPinAnnotationViewImageCacheKey

- (_MKPinAnnotationViewImageCacheKey)initWithMapType:(unint64_t)a3 pinColor:(id)a4 traits:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_MKPinAnnotationViewImageCacheKey;
  v11 = [(_MKPinAnnotationViewImageCacheKey *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_mapType = a3;
    objc_storeStrong((id *)&v11->_pinColor, a4);
    v12->_idiom = [v10 userInterfaceIdiom];
    v12->_userInterfaceStyle = [v10 userInterfaceStyle];
    v13 = v12;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t mapType = self->_mapType;
  return [(UIColor *)self->_pinColor hash] ^ mapType ^ self->_idiom ^ self->_userInterfaceStyle;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_MKPinAnnotationViewImageCacheKey *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = v5;
      if (self->_idiom == v5->_idiom
        && self->_userInterfaceStyle == v5->_userInterfaceStyle
        && self->_mapType == v5->_mapType)
      {
        char v7 = [(UIColor *)self->_pinColor isEqual:v5->_pinColor];
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end