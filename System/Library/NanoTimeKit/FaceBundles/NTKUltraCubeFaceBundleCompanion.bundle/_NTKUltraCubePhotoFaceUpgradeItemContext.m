@interface _NTKUltraCubePhotoFaceUpgradeItemContext
- (CGRect)originalCrop;
- (NSDate)modificationDate;
- (NSString)localIdentifier;
- (NSURL)imageURL;
- (NSURL)maskURL;
- (_NTKUltraCubePhotoFaceUpgradeItemContext)initWithPhoto:(id)a3;
- (int64_t)timeAlignment;
@end

@implementation _NTKUltraCubePhotoFaceUpgradeItemContext

- (_NTKUltraCubePhotoFaceUpgradeItemContext)initWithPhoto:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_NTKUltraCubePhotoFaceUpgradeItemContext;
  v6 = [(_NTKUltraCubePhotoFaceUpgradeItemContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_photo, a3);
  }

  return v7;
}

- (NSString)localIdentifier
{
  return [(NTKUltraCubePhoto *)self->_photo localIdentifier];
}

- (NSDate)modificationDate
{
  return [(NTKUltraCubePhoto *)self->_photo modificationDate];
}

- (CGRect)originalCrop
{
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSURL)imageURL
{
  return [(NTKUltraCubePhoto *)self->_photo baseImageURL];
}

- (NSURL)maskURL
{
  [(NTKUltraCubePhoto *)self->_photo maskedImageZorder];
  double v4 = v3;
  [(NTKUltraCubePhoto *)self->_photo timeElementZorder];
  if (v4 <= v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = [(NTKUltraCubePhoto *)self->_photo maskImageURL];
  }

  return (NSURL *)v6;
}

- (int64_t)timeAlignment
{
  [(NTKUltraCubePhoto *)self->_photo timeElementUnitBaseline];
  if (v2 < 0.5) {
    return 1;
  }
  else {
    return 3;
  }
}

- (void).cxx_destruct
{
}

@end