@interface NTKPrideWeaveFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)complicationConfiguration;
- (BOOL)_faceGalleryIsRestricted;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)complicationSlotsHiddenByEditOption:(id)a3;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKPrideWeaveFace

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

+ (id)complicationConfiguration
{
  if (qword_2C898 != -1) {
    dispatch_once(&qword_2C898, &stru_24730);
  }
  v2 = (void *)qword_2C890;

  return v2;
}

- (id)_customEditModes
{
  return &off_25AB8;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 12)
  {
    id v4 = [(NTKPrideWeaveFace *)self device];
    unsigned int v5 = +[NTKAnalogDialShapeEditOption optionWithShape:1 forDevice:v4];
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  unsigned int v5 = -[NTKPrideWeaveFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  unsigned int v6 = [(NTKPrideWeaveFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKPrideWeaveFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKPrideWeaveFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKPrideWeaveFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKPrideWeaveFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (id)complicationSlotsHiddenByEditOption:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 dialShape] == (char *)&dword_0 + 1)
  {
    v9[0] = NTKComplicationSlotTopLeft;
    v9[1] = NTKComplicationSlotTopRight;
    v9[2] = NTKComplicationSlotBottomLeft;
    v9[3] = NTKComplicationSlotBottomRight;
    uint64_t v5 = +[NSArray arrayWithObjects:v9 count:4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKPrideWeaveFace;
    uint64_t v5 = [(NTKPrideWeaveFace *)&v8 complicationSlotsHiddenByEditOption:v4];
  }
  unsigned int v6 = (void *)v5;

  return v6;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 12)
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }
  return (Class)v4;
}

- (id)faceSharingName
{
  return +[NTKPrideWeaveFaceBundle localizedStringForKey:@"FACE_NAME_IN_TITLE_CASE" comment:@"Pride Weave"];
}

- (id)_faceDescription
{
  v2 = [(NTKPrideWeaveFace *)self device];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"BD0302DD-00BC-43C2-81E9-48C038E6F8BB"];
  unsigned int v4 = [v2 supportsCapability:v3];

  if (v4) {
    CFStringRef v5 = @"FACE_STYLE_PRIDE_WEAVE_DESCRIPTION_LIGHTHOUSE";
  }
  else {
    CFStringRef v5 = @"FACE_STYLE_PRIDE_WEAVE_DESCRIPTION";
  }

  return +[NTKPrideWeaveFaceBundle localizedStringForKey:v5 comment:&stru_24D98];
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 12)
  {
    unsigned int v4 = objc_msgSend(@"EDIT_MODE_LABEL_DIAL", "stringByAppendingString:", @"_COMPANION", a4);
    CFStringRef v5 = NTKCompanionClockFaceLocalizedString();
  }
  else
  {
    CFStringRef v5 = 0;
  }

  return v5;
}

- (BOOL)_faceGalleryIsRestricted
{
  return 1;
}

@end