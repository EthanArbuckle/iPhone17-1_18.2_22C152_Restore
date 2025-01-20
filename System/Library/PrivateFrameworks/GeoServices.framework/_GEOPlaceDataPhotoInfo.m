@interface _GEOPlaceDataPhotoInfo
- (CGSize)size;
- (NSString)description;
- (NSURL)url;
- (_GEOPlaceDataPhotoInfo)initWithURL:(id)a3 width:(double)a4 height:(double)a5;
@end

@implementation _GEOPlaceDataPhotoInfo

- (void).cxx_destruct
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSURL)url
{
  return self->_url;
}

- (_GEOPlaceDataPhotoInfo)initWithURL:(id)a3 width:(double)a4 height:(double)a5
{
  id v9 = a3;
  v10 = v9;
  v11 = 0;
  if (a4 > 0.0 && a5 > 0.0)
  {
    v12 = [v9 absoluteString];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      v17.receiver = self;
      v17.super_class = (Class)_GEOPlaceDataPhotoInfo;
      v14 = [(_GEOPlaceDataPhotoInfo *)&v17 init];
      v15 = v14;
      if (v14)
      {
        v14->_size.double width = a4;
        v14->_size.double height = a5;
        objc_storeStrong((id *)&v14->_url, a3);
      }
      self = v15;
      v11 = self;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"url : %@ \n width : %f \n height : %f", self->_url, *(void *)&self->_size.width, *(void *)&self->_size.height];
}

@end