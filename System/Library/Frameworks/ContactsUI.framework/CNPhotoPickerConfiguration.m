@interface CNPhotoPickerConfiguration
+ (CNPhotoPickerConfiguration)contactsConfiguration;
+ (CNPhotoPickerConfiguration)gameCenterConfiguration;
- (BOOL)allowAnimojiCreation;
- (BOOL)allowPhotoCapture;
- (BOOL)allowPhotoFromLibrary;
- (BOOL)allowRotation;
- (BOOL)includeAnimoji;
- (BOOL)includeContactImage;
- (BOOL)includeEmoji;
- (BOOL)includeFaces;
- (BOOL)includeMonograms;
- (BOOL)includeRecents;
- (BOOL)includeUnifiedContactImages;
- (CNPhotoPickerConfiguration)initWithIncludeContactImage:(BOOL)a3 includeUnifiedContactImages:(BOOL)a4 includeFaces:(BOOL)a5 includeMonograms:(BOOL)a6 includeAnimoji:(BOOL)a7 includeRecents:(BOOL)a8 includeEmoji:(BOOL)a9 allowPhotoCapture:(BOOL)a10 allowPhotoFromLibrary:(BOOL)a11 allowAnimojiCreation:(BOOL)a12 allowRotation:(BOOL)a13;
- (id)configurationBySettingAllowsPhotoCapture:(BOOL)a3;
@end

@implementation CNPhotoPickerConfiguration

- (BOOL)allowRotation
{
  return self->_allowRotation;
}

- (BOOL)allowAnimojiCreation
{
  return self->_allowAnimojiCreation;
}

- (BOOL)allowPhotoFromLibrary
{
  return self->_allowPhotoFromLibrary;
}

- (BOOL)allowPhotoCapture
{
  return self->_allowPhotoCapture;
}

- (BOOL)includeEmoji
{
  return self->_includeEmoji;
}

- (BOOL)includeRecents
{
  return self->_includeRecents;
}

- (BOOL)includeAnimoji
{
  return self->_includeAnimoji;
}

- (BOOL)includeMonograms
{
  return self->_includeMonograms;
}

- (BOOL)includeFaces
{
  return self->_includeFaces;
}

- (BOOL)includeUnifiedContactImages
{
  return self->_includeUnifiedContactImages;
}

- (BOOL)includeContactImage
{
  return self->_includeContactImage;
}

- (CNPhotoPickerConfiguration)initWithIncludeContactImage:(BOOL)a3 includeUnifiedContactImages:(BOOL)a4 includeFaces:(BOOL)a5 includeMonograms:(BOOL)a6 includeAnimoji:(BOOL)a7 includeRecents:(BOOL)a8 includeEmoji:(BOOL)a9 allowPhotoCapture:(BOOL)a10 allowPhotoFromLibrary:(BOOL)a11 allowAnimojiCreation:(BOOL)a12 allowRotation:(BOOL)a13
{
  v23.receiver = self;
  v23.super_class = (Class)CNPhotoPickerConfiguration;
  v19 = [(CNPhotoPickerConfiguration *)&v23 init];
  v20 = v19;
  if (v19)
  {
    v19->_includeContactImage = a3;
    v19->_includeUnifiedContactImages = a4;
    v19->_includeMonograms = a6;
    v19->_includeAnimoji = a7;
    v19->_includeFaces = a5;
    v19->_includeRecents = a8;
    v19->_includeEmoji = a9;
    v19->_allowPhotoCapture = a10;
    v19->_allowPhotoFromLibrary = a11;
    v19->_allowAnimojiCreation = a12;
    v19->_allowRotation = a13;
    v21 = v19;
  }

  return v20;
}

- (id)configurationBySettingAllowsPhotoCapture:(BOOL)a3
{
  v4 = [CNPhotoPickerConfiguration alloc];
  BOOL v5 = [(CNPhotoPickerConfiguration *)self includeContactImage];
  BOOL v6 = [(CNPhotoPickerConfiguration *)self includeUnifiedContactImages];
  BOOL v7 = [(CNPhotoPickerConfiguration *)self includeFaces];
  BOOL v8 = [(CNPhotoPickerConfiguration *)self includeMonograms];
  BOOL v9 = [(CNPhotoPickerConfiguration *)self includeAnimoji];
  BOOL v10 = [(CNPhotoPickerConfiguration *)self includeRecents];
  BOOL v11 = [(CNPhotoPickerConfiguration *)self includeEmoji];
  BOOL v12 = [(CNPhotoPickerConfiguration *)self allowPhotoFromLibrary];
  BYTE4(v15) = 0;
  BYTE3(v15) = [(CNPhotoPickerConfiguration *)self allowAnimojiCreation];
  BYTE2(v15) = v12;
  BYTE1(v15) = a3;
  LOBYTE(v15) = v11;
  v13 = -[CNPhotoPickerConfiguration initWithIncludeContactImage:includeUnifiedContactImages:includeFaces:includeMonograms:includeAnimoji:includeRecents:includeEmoji:allowPhotoCapture:allowPhotoFromLibrary:allowAnimojiCreation:allowRotation:](v4, "initWithIncludeContactImage:includeUnifiedContactImages:includeFaces:includeMonograms:includeAnimoji:includeRecents:includeEmoji:allowPhotoCapture:allowPhotoFromLibrary:allowAnimojiCreation:allowRotation:", v5, v6, v7, v8, v9, v10, v15);

  return v13;
}

+ (CNPhotoPickerConfiguration)gameCenterConfiguration
{
  BYTE4(v4) = 1;
  LODWORD(v4) = 0x1000000;
  v2 = objc_msgSend(objc_alloc((Class)a1), "initWithIncludeContactImage:includeUnifiedContactImages:includeFaces:includeMonograms:includeAnimoji:includeRecents:includeEmoji:allowPhotoCapture:allowPhotoFromLibrary:allowAnimojiCreation:allowRotation:", 1, 0, 0, 1, 1, 0, v4);

  return (CNPhotoPickerConfiguration *)v2;
}

+ (CNPhotoPickerConfiguration)contactsConfiguration
{
  BYTE4(v4) = 0;
  LODWORD(v4) = 16843009;
  v2 = objc_msgSend(objc_alloc((Class)a1), "initWithIncludeContactImage:includeUnifiedContactImages:includeFaces:includeMonograms:includeAnimoji:includeRecents:includeEmoji:allowPhotoCapture:allowPhotoFromLibrary:allowAnimojiCreation:allowRotation:", 1, 1, 1, 1, 1, 1, v4);

  return (CNPhotoPickerConfiguration *)v2;
}

@end