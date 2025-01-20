@interface MIOImageSize
- (BOOL)isEqual:(id)a3;
- (MIOImageSize)initWithSpecification:(const void *)a3;
- (id).cxx_construct;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)pixelsHigh;
- (int64_t)pixelsWide;
- (unint64_t)hash;
@end

@implementation MIOImageSize

- (MIOImageSize)initWithSpecification:(const void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MIOImageSize;
  v4 = [(MIOImageSize *)&v7 init];
  v5 = (MIOImageSize *)v4;
  if (v4) {
    CoreML::Specification::ImageFeatureType_ImageSize::CopyFrom((std::string *)(v4 + 8), (const CoreML::Specification::Int64Range *)a3);
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"MIOImageSize {%zd, %zd}", -[MIOImageSize pixelsWide](self, "pixelsWide"), -[MIOImageSize pixelsHigh](self, "pixelsHigh")];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MIOImageSize *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(MIOImageSize *)self pixelsWide];
      if (v6 == [(MIOImageSize *)v5 pixelsWide])
      {
        int64_t v7 = [(MIOImageSize *)self pixelsHigh];
        BOOL v8 = v7 == [(MIOImageSize *)v5 pixelsHigh];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t v3 = [(MIOImageSize *)self pixelsWide];
  return [(MIOImageSize *)self pixelsHigh] ^ v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[MIOImageSize pixelsWide](self, "pixelsWide"));
  int64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "pixelsWide"));
  int64_t v7 = [v5 compare:v6];

  if (!v7)
  {
    BOOL v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[MIOImageSize pixelsHigh](self, "pixelsHigh"));
    v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "pixelsHigh"));
    int64_t v7 = [v8 compare:v9];
  }
  return v7;
}

- (int64_t)pixelsWide
{
  return self->_imageSizeParams.width_;
}

- (int64_t)pixelsHigh
{
  return self->_imageSizeParams.height_;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end