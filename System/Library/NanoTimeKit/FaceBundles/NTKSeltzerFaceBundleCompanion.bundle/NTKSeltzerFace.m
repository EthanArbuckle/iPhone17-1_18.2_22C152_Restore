@interface NTKSeltzerFace
+ (BOOL)_customEditModeIsRows:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)complicationConfiguration;
+ (id)pigmentFaceDomain;
+ (int64_t)_complicationFontStyleForSlot:(id)a3;
- (BOOL)_snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)selectOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
@end

@implementation NTKSeltzerFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 deviceCategory] == (char *)&dword_0 + 1)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"];
    unsigned int v4 = [v3 supportsCapability:v5] ^ 1;
  }
  return v4;
}

- (int64_t)timeStyle
{
  v2 = [(NTKSeltzerFace *)self selectedOptionForCustomEditMode:15 slot:0];
  int64_t v3 = [v2 style] != 0;

  return v3;
}

- (void)selectOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(NTKSeltzerFace *)self selectedOptionForCustomEditMode:a4 slot:v9];
  v13.receiver = self;
  v13.super_class = (Class)NTKSeltzerFace;
  [(NTKSeltzerFace *)&v13 selectOption:v8 forCustomEditMode:a4 slot:v9];

  if (a4 == 15 && (NTKEqualObjects() & 1) == 0)
  {
    id v11 = v10;
    id v12 = [v8 style];
    if (v12 != [v11 style]) {
      [(NTKSeltzerFace *)self _notifyObserversFaceTimeStyleChanged];
    }
  }
}

- (id)faceSharingName
{
  return +[NTKSeltzerFaceBundle localizedStringForKey:@"SELTZER_FACE_NAME" comment:@"Seltzer"];
}

- (id)_faceDescription
{
  v2 = [(NTKSeltzerFace *)self device];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"BD0302DD-00BC-43C2-81E9-48C038E6F8BB"];
  unsigned int v4 = [v2 supportsCapability:v3];

  if (v4) {
    CFStringRef v5 = @"SELTZER_FACE_DESCRIPTION_LIGHTHOUSE";
  }
  else {
    CFStringRef v5 = @"SELTZER_FACE_DESCRIPTION";
  }

  return +[NTKSeltzerFaceBundle localizedStringForKey:v5 comment:@"description"];
}

- (BOOL)_snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  return [a3 calendarDateMatchesContext:a4] ^ 1;
}

+ (id)complicationConfiguration
{
  if (qword_15E28 != -1) {
    dispatch_once(&qword_15E28, &stru_10438);
  }
  v2 = (void *)qword_15E20;

  return v2;
}

+ (int64_t)_complicationFontStyleForSlot:(id)a3
{
  return 1;
}

+ (BOOL)_customEditModeIsRows:(int64_t)a3 forDevice:(id)a4
{
  return a3 == 12;
}

+ (id)pigmentFaceDomain
{
  return @"seltzer";
}

- (id)_customEditModes
{
  return &off_10B00;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10 || a3 == 12 || a3 == 15)
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
  if (a3 == 15)
  {
    v7 = [(NTKSeltzerFace *)self device];
    uint64_t v8 = +[NTKDualTimeStyleEditOption optionWithStyle:0 forDevice:v7];
    goto LABEL_5;
  }
  if (a3 == 12)
  {
    v7 = [(NTKSeltzerFace *)self device];
    uint64_t v8 = +[NTKSeltzerCalendarEditOption defaultOptionForDevice:v7];
LABEL_5:
    id v9 = (void *)v8;

    goto LABEL_7;
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  if (a3 == 15)
  {
    uint64_t v7 = NTKCompanionClockFaceLocalizedString();
  }
  else if (a3 == 12)
  {
    uint64_t v7 = +[NTKSeltzerFaceBundle localizedStringForKey:@"SELTZER_EDIT_MODE_LABEL_CALENDAR" comment:@"Calendar"];
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___NTKSeltzerFace;
    uint64_t v7 = objc_msgSendSuper2(&v10, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, v6);
  }
  uint64_t v8 = (void *)v7;

  return v8;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  CFStringRef v5 = -[NTKSeltzerFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKSeltzerFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKSeltzerFace *)self _optionClassForCustomEditMode:a4];
  id v9 = [(NTKSeltzerFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKSeltzerFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKSeltzerFace *)self device];
  id v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

@end