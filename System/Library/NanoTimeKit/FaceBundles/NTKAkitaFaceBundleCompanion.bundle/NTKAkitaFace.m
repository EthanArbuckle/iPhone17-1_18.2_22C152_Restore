@interface NTKAkitaFace
+ (BOOL)isRestrictedForDevice:(id)a3;
- (BOOL)isEditable;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)faceSharingName;
- (int64_t)timeStyle;
@end

@implementation NTKAkitaFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D5DDA3E7-8863-48E3-95C7-3C65C5E31718"];
  unsigned __int8 v5 = [v3 supportsCapability:v4];

  return v5 ^ 1;
}

- (int64_t)timeStyle
{
  return 1;
}

- (id)faceSharingName
{
  return +[NTKAkitaFaceBundle localizedStringForKey:@"FACE_STYLE_AKITA_IN_TITLE_CASE" comment:@"Akita"];
}

- (BOOL)isEditable
{
  return 0;
}

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_AKITA_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKAkitaFace *)self _faceDescriptionKey];
  id v3 = +[NTKAkitaFaceBundle localizedStringForKey:v2 comment:@"FACE_STYLE_AKITA_DESCRIPTION"];

  return v3;
}

@end