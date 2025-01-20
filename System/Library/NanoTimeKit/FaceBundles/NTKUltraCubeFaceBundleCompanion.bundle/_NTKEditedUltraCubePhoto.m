@interface _NTKEditedUltraCubePhoto
- (BOOL)isInResourceDirectory;
- (BOOL)isUserAdjusted;
- (NTKUltraCubePhoto)photo;
- (PHAsset)asset;
- (_NTKLayoutDescriptor)layout;
- (unint64_t)subsampleFactor;
- (void)setAsset:(id)a3;
- (void)setLayout:(id)a3;
- (void)setPhoto:(id)a3;
- (void)setSubsampleFactor:(unint64_t)a3;
- (void)setUserAdjusted:(BOOL)a3;
@end

@implementation _NTKEditedUltraCubePhoto

- (BOOL)isInResourceDirectory
{
  v2 = [(_NTKEditedUltraCubePhoto *)self photo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (unint64_t)subsampleFactor
{
  return self->_subsampleFactor;
}

- (void)setSubsampleFactor:(unint64_t)a3
{
  self->_subsampleFactor = a3;
}

- (NTKUltraCubePhoto)photo
{
  return self->_photo;
}

- (void)setPhoto:(id)a3
{
}

- (_NTKLayoutDescriptor)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (BOOL)isUserAdjusted
{
  return self->_userAdjusted;
}

- (void)setUserAdjusted:(BOOL)a3
{
  self->_userAdjusted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_photo, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

@end