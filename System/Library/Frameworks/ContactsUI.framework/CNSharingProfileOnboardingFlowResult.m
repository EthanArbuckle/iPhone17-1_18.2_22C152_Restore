@interface CNSharingProfileOnboardingFlowResult
- (BOOL)didPersistImageToContact;
- (CGRect)cropRect;
- (CNWallpaper)wallpaper;
- (NSData)imageData;
- (NSData)watchWallpaperImageData;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)type;
- (id)description;
- (unint64_t)sharingAudience;
- (void)setCropRect:(CGRect)a3;
- (void)setDidPersistImageToContact:(BOOL)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setImageData:(id)a3;
- (void)setSharingAudience:(unint64_t)a3;
- (void)setType:(id)a3;
- (void)setWallpaper:(id)a3;
@end

@implementation CNSharingProfileOnboardingFlowResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_watchWallpaperImageData, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
  objc_storeStrong((id *)&self->_familyName, 0);

  objc_storeStrong((id *)&self->_givenName, 0);
}

- (void)setDidPersistImageToContact:(BOOL)a3
{
  self->_didPersistImageToContact = a3;
}

- (BOOL)didPersistImageToContact
{
  return self->_didPersistImageToContact;
}

- (void)setSharingAudience:(unint64_t)a3
{
  self->_sharingAudience = a3;
}

- (unint64_t)sharingAudience
{
  return self->_sharingAudience;
}

- (void)setType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setImageData:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSData)watchWallpaperImageData
{
  return self->_watchWallpaperImageData;
}

- (void)setWallpaper:(id)a3
{
}

- (CNWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)givenName
{
  return self->_givenName;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"givenName" object:self->_givenName];
  id v5 = (id)[v3 appendName:@"familyName" object:self->_familyName];
  id v6 = (id)[v3 appendName:@"imageData" object:self->_imageData];
  id v7 = (id)[v3 appendName:@"wallpaper" object:self->_wallpaper];
  id v8 = (id)[v3 appendName:@"watchWallpaperImageData" object:self->_watchWallpaperImageData];
  v9 = NSStringFromCGRect(self->_cropRect);
  id v10 = (id)[v3 appendName:@"cropRect" object:v9];

  id v11 = (id)[v3 appendName:@"type" object:self->_type];
  id v12 = (id)[v3 appendName:@"sharingAudience" integerValue:self->_sharingAudience];
  id v13 = (id)[v3 appendName:@"didPersistImageToContact" BOOLValue:self->_didPersistImageToContact];
  v14 = [v3 build];

  return v14;
}

@end