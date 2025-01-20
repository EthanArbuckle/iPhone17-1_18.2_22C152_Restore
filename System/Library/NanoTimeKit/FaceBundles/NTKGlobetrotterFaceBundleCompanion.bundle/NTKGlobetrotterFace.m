@interface NTKGlobetrotterFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)complicationConfiguration;
+ (id)pigmentFaceDomain;
- (BOOL)_snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (id)unsafeDailySnapshotKey;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)selectOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
@end

@implementation NTKGlobetrotterFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 deviceCategory] == (char *)&dword_0 + 1)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
    unsigned int v4 = [v3 supportsCapability:v5] ^ 1;
  }
  return v4;
}

- (int64_t)timeStyle
{
  v2 = [(NTKGlobetrotterFace *)self selectedOptionForCustomEditMode:15 slot:0];
  int64_t v3 = [v2 style] != 0;

  return v3;
}

- (void)selectOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(NTKGlobetrotterFace *)self selectedOptionForCustomEditMode:a4 slot:v9];
  v13.receiver = self;
  v13.super_class = (Class)NTKGlobetrotterFace;
  [(NTKGlobetrotterFace *)&v13 selectOption:v8 forCustomEditMode:a4 slot:v9];

  if (a4 == 15 && (NTKEqualObjects() & 1) == 0)
  {
    id v11 = v10;
    id v12 = [v8 style];
    if (v12 != [v11 style]) {
      [(NTKGlobetrotterFace *)self _notifyObserversFaceTimeStyleChanged];
    }
  }
}

- (id)unsafeDailySnapshotKey
{
  v8.receiver = self;
  v8.super_class = (Class)NTKGlobetrotterFace;
  v2 = [(NTKGlobetrotterFace *)&v8 unsafeDailySnapshotKey];
  if ([v2 isEqualToString:NTKSensitiveSnapshotKey])
  {
    id v3 = v2;
  }
  else
  {
    unsigned int v4 = +[NSTimeZone localTimeZone];
    id v5 = [v4 name];
    v6 = [v5 stringByReplacingOccurrencesOfString:@"/" withString:@"-"];

    id v3 = [v2 stringByAppendingString:v6];
  }

  return v3;
}

- (BOOL)_snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  return [a3 calendarDateMatchesContext:a4] ^ 1;
}

- (id)faceSharingName
{
  return +[NTKGlobetrotterFaceBundle localizedStringForKey:@"FACE_STYLE_GLOBETROTTER_IN_TITLE_CASE" comment:@"Globetrotter"];
}

- (id)_faceDescription
{
  return +[NTKGlobetrotterFaceBundle localizedStringForKey:@"FACE_STYLE_GLOBETROTTER_DESCRIPTION" comment:@"description"];
}

+ (id)complicationConfiguration
{
  if (qword_16208 != -1) {
    dispatch_once(&qword_16208, &stru_104E0);
  }
  v2 = (void *)qword_16200;

  return v2;
}

+ (id)pigmentFaceDomain
{
  return @"globetrotter";
}

- (id)_customEditModes
{
  v2 = [(NTKGlobetrotterFace *)self device];
  int v3 = NTKShowIndicScriptNumerals();

  if (v3) {
    return &off_11150;
  }
  else {
    return &off_11168;
  }
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10 || a3 == 15 || a3 == 19)
  {
    unsigned int v4 = objc_opt_class();
  }
  else
  {
    unsigned int v4 = 0;
  }
  return (Class)v4;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 19)
  {
    CLKLocaleNumberSystemForFirstLanguage();
    uint64_t v9 = NTKNumeralOptionFromCLKLocaleNumberSystem();
    v7 = [(NTKGlobetrotterFace *)self device];
    uint64_t v8 = +[NTKNumeralEditOption optionWithNumeral:v9 forDevice:v7];
    goto LABEL_5;
  }
  if (a3 == 15)
  {
    v7 = [(NTKGlobetrotterFace *)self device];
    uint64_t v8 = +[NTKDualTimeStyleEditOption optionWithStyle:0 forDevice:v7];
LABEL_5:
    v10 = (void *)v8;

    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v5 = -[NTKGlobetrotterFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKGlobetrotterFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKGlobetrotterFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v9 = [(NTKGlobetrotterFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKGlobetrotterFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKGlobetrotterFace *)self device];
  uint64_t v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

@end