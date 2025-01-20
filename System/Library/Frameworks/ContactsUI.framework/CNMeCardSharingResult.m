@interface CNMeCardSharingResult
- (BOOL)didSaveImageToMeCard;
- (CNContactImage)contactImage;
- (CNMeCardSharingResult)initWithGivenName:(id)a3 familyName:(id)a4 contactImage:(id)a5 wallpaper:(id)a6 watchWallpaperImageData:(id)a7 didSaveImageToMeCard:(BOOL)a8;
- (CNWallpaper)wallpaper;
- (NSData)watchWallpaperImageData;
- (NSString)familyName;
- (NSString)givenName;
- (id)description;
@end

@implementation CNMeCardSharingResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchWallpaperImageData, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
  objc_storeStrong((id *)&self->_contactImage, 0);
  objc_storeStrong((id *)&self->_familyName, 0);

  objc_storeStrong((id *)&self->_givenName, 0);
}

- (BOOL)didSaveImageToMeCard
{
  return self->_didSaveImageToMeCard;
}

- (NSData)watchWallpaperImageData
{
  return self->_watchWallpaperImageData;
}

- (CNWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (CNContactImage)contactImage
{
  return self->_contactImage;
}

- (NSString)familyName
{
  return self->_familyName;
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
  id v6 = (id)[v3 appendName:@"contactImage" object:self->_contactImage];
  id v7 = (id)[v3 appendName:@"wallpaper" object:self->_wallpaper];
  id v8 = (id)[v3 appendName:@"watchWallpaperImageData" object:self->_watchWallpaperImageData];
  id v9 = (id)[v3 appendName:@"didSaveToMeCard" BOOLValue:self->_didSaveImageToMeCard];
  v10 = [v3 build];

  return v10;
}

- (CNMeCardSharingResult)initWithGivenName:(id)a3 familyName:(id)a4 contactImage:(id)a5 wallpaper:(id)a6 watchWallpaperImageData:(id)a7 didSaveImageToMeCard:(BOOL)a8
{
  id v23 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CNMeCardSharingResult;
  v18 = [(CNMeCardSharingResult *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_givenName, a3);
    objc_storeStrong((id *)&v19->_familyName, a4);
    objc_storeStrong((id *)&v19->_contactImage, a5);
    objc_storeStrong((id *)&v19->_wallpaper, a6);
    objc_storeStrong((id *)&v19->_watchWallpaperImageData, a7);
    v19->_didSaveImageToMeCard = a8;
    v20 = v19;
  }

  return v19;
}

@end