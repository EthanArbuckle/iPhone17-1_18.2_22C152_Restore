@interface NTKLilypadFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_faceGalleryIsRestricted;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultName;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)argon_embeddedOverlayAssetURL;
- (id)faceSharingName;
- (int64_t)argon_overlayAssetType;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKLilypadFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"1087B4F0-9D95-407D-98BC-195A5FB6EDF5"];
  unsigned int v5 = [v3 supportsCapability:v4];

  if ([v3 sizeClass]
    && ([v3 sizeClass] != (char *)&dword_0 + 1 ? (unsigned int v6 = v5) : (unsigned int v6 = 0), v6 == 1))
  {
    char v7 = NTKGizmoOrCompanionAreRussian();
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (int64_t)timeStyle
{
  return 1;
}

- (id)_defaultName
{
  return +[NTKLilypadFaceBundle localizedStringForKey:@"LILYPAD_FACE_NAME_IN_TITLE_CASE" comment:@"Lilypad"];
}

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_LILYPAD_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKLilypadFace *)self _faceDescriptionKey];
  id v3 = +[NTKLilypadFaceBundle localizedStringForKey:v2 comment:@"Lilypad face description"];

  return v3;
}

- (id)faceSharingName
{
  return +[NTKLilypadFaceBundle localizedStringForKey:@"LILYPAD_FACE_NAME_IN_TITLE_CASE" comment:@"Lilypad"];
}

- (BOOL)_faceGalleryIsRestricted
{
  return 1;
}

- (id)_customEditModes
{
  return &off_CA08;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  unsigned int v5 = [(NTKLilypadFace *)self device];
  if (a3 == 15)
  {
    unsigned int v6 = +[NTKFaceBackgroundStyleEditOption optionWithBackgroundStyle:1 forDevice:v5];
  }
  else
  {
    unsigned int v6 = 0;
  }

  return v6;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  unsigned int v5 = -[NTKLilypadFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  unsigned int v6 = [(NTKLilypadFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKLilypadFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKLilypadFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKLilypadFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKLilypadFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 15)
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }
  return (Class)v4;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15)
  {
    id v4 = objc_msgSend(@"EDIT_MODE_LABEL_LILYPAD_STYLE", "stringByAppendingString:", @"_COMPANION", a4);
    unsigned int v5 = +[NTKLilypadFaceBundle localizedStringForKey:v4 comment:@"Lilypad custom edit mode name"];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NTKLilypadFace;
    unsigned int v5 = objc_msgSendSuper2(&v7, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, a4);
  }

  return v5;
}

- (int64_t)argon_overlayAssetType
{
  v2 = [(NTKLilypadFace *)self device];
  [v2 sizeClass];

  return 1;
}

- (id)argon_embeddedOverlayAssetURL
{
  v2 = [(NTKLilypadFace *)self device];
  uint64_t v3 = (char *)[v2 sizeClass];

  if ((unint64_t)(v3 - 2) > 6)
  {
    unsigned int v6 = 0;
  }
  else
  {
    id v4 = off_C3C8[(void)(v3 - 2)];
    unsigned int v5 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v6 = [v5 URLForResource:v4 withExtension:@"pdf"];
  }

  return v6;
}

@end