@interface NTKCaliforniaFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)complicationConfiguration;
+ (id)pigmentFaceDomain;
- (BOOL)hasPrideEditOptions;
- (BOOL)isFullscreenConfiguration;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)complicationSlotsHiddenByEditOption:(id)a3;
- (id)defaultColorForDevice:(id)a3;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4;
- (void)setIsLibraryFace:(BOOL)a3;
@end

@implementation NTKCaliforniaFace

- (id)_faceDescriptionKey
{
  v2 = [(NTKCaliforniaFace *)self device];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"];
  unsigned int v4 = [v2 supportsCapability:v3];

  v5 = @"FACE_STYLE_CALIFORNIA_DESCRIPTION";
  if (v4)
  {
    v5 = [@"FACE_STYLE_CALIFORNIA_DESCRIPTION" stringByAppendingString:@"_KINCAID"];
  }

  return v5;
}

- (id)_faceDescription
{
  v2 = [(NTKCaliforniaFace *)self _faceDescriptionKey];
  id v3 = +[NTKCaliforniaFaceBundle localizedStringForKey:v2 comment:@"California Face Description"];

  return v3;
}

- (id)faceSharingName
{
  return +[NTKCaliforniaFaceBundle localizedStringForKey:@"FACE_STYLE_CALIFORNIA_IN_TITLE_CASE" comment:@"California"];
}

+ (BOOL)isRestrictedForDevice:(id)a3
{
  return [a3 deviceCategory] == (char *)&dword_0 + 1;
}

- (void)setIsLibraryFace:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKCaliforniaFace;
  -[NTKCaliforniaFace setIsLibraryFace:](&v9, "setIsLibraryFace:");
  if (v3)
  {
    v5 = [(NTKCaliforniaFace *)self selectedOptionForCustomEditMode:13 slot:0];
    if ([v5 style] == (id)-1)
    {
      unint64_t v6 = +[NTKCaliforniaStyleEditOption resolvedAutomaticStyleForCurrentLocale];
      v7 = [(NTKCaliforniaFace *)self device];
      v8 = +[NTKCaliforniaStyleEditOption optionWithStyle:v6 forDevice:v7];
      [(NTKCaliforniaFace *)self selectOption:v8 forCustomEditMode:13 slot:0];
    }
  }
}

+ (id)complicationConfiguration
{
  if (qword_1F0B8 != -1) {
    dispatch_once(&qword_1F0B8, &stru_18600);
  }
  v2 = (void *)qword_1F0B0;

  return v2;
}

- (BOOL)hasPrideEditOptions
{
  return 1;
}

- (id)_customEditModes
{
  return &off_1B4E0;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 15:
      v7 = [(NTKCaliforniaFace *)self device];
      uint64_t v8 = +[NTKAnalogDialShapeEditOption optionWithShape:1 forDevice:v7];
      goto LABEL_7;
    case 13:
      v7 = [(NTKCaliforniaFace *)self device];
      uint64_t v8 = +[NTKCaliforniaStyleEditOption optionWithStyle:2 forDevice:v7];
      goto LABEL_7;
    case 10:
      v7 = [(NTKCaliforniaFace *)self device];
      uint64_t v8 = [(NTKCaliforniaFace *)self defaultColorForDevice:v7];
LABEL_7:
      objc_super v9 = (void *)v8;

      goto LABEL_9;
  }
  objc_super v9 = 0;
LABEL_9:

  return v9;
}

- (id)defaultColorForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 3000;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1F0C0);
  id WeakRetained = objc_loadWeakRetained(&qword_1F0C8);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = objc_loadWeakRetained(&qword_1F0C8);
    if (v7 == v4)
    {
      id v8 = [v4 version];
      uint64_t v9 = qword_1F0D0;

      if (v8 == (id)v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v10 = objc_storeWeak(&qword_1F0C8, v4);
  qword_1F0D0 = (uint64_t)[v4 version];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_2E08;
  v15[3] = &unk_18628;
  v15[4] = &v16;
  sub_2E08((uint64_t)v15, v4);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1F0C0);
  uint64_t v11 = v17[3];
  v12 = [(NTKCaliforniaFace *)self device];
  v13 = +[NTKCaliforniaColorEditOption optionWithCaliforniaColor:v11 forDevice:v12];

  _Block_object_dispose(&v16, 8);

  return v13;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10 || a3 == 15 || a3 == 13)
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }
  return (Class)v4;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 13 && [v8 style] == (id)-1)
  {
    unint64_t v13 = +[NTKCaliforniaStyleEditOption resolvedAutomaticStyleForCurrentLocale];
    v14 = [(NTKCaliforniaFace *)self device];
    uint64_t v15 = +[NTKCaliforniaStyleEditOption optionWithStyle:v13 forDevice:v14];

    id v12 = [(NTKCaliforniaFace *)self _indexOfOption:v15 forCustomEditMode:13 slot:v9];
    id v8 = (id)v15;
  }
  else
  {
    id v10 = [(NTKCaliforniaFace *)self _optionClassForCustomEditMode:a4];
    uint64_t v11 = [(NTKCaliforniaFace *)self device];
    id v12 = [(objc_class *)v10 indexOfOption:v8 forDevice:v11];
  }
  return (unint64_t)v12;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKCaliforniaFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKCaliforniaFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a5;
  if (a3 == -1 && a4 == 13)
  {
    id v9 = [(NTKCaliforniaFace *)self _optionAtIndex:+[NTKCaliforniaStyleEditOption resolvedAutomaticStyleForCurrentLocale] forCustomEditMode:13 slot:v8];
  }
  else
  {
    id v10 = [(NTKCaliforniaFace *)self _optionClassForCustomEditMode:a4];
    uint64_t v11 = [(NTKCaliforniaFace *)self device];
    id v9 = [(objc_class *)v10 optionAtIndex:a3 forDevice:v11];
  }

  return v9;
}

- (id)complicationSlotsHiddenByEditOption:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 dialShape] == (char *)&dword_0 + 1)
  {
    uint64_t v10 = NTKComplicationSlotTopLeft;
    uint64_t v11 = NTKComplicationSlotTopRight;
    uint64_t v12 = NTKComplicationSlotBezel;
    uint64_t v13 = NTKComplicationSlotBottomLeft;
    uint64_t v14 = NTKComplicationSlotBottomRight;
    id v4 = &v10;
    uint64_t v5 = 5;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v3 dialShape])
    {
      id v6 = 0;
      goto LABEL_9;
    }
    uint64_t v8 = NTKComplicationSlotSubdialTop;
    uint64_t v9 = NTKComplicationSlotSubdialBottom;
    id v4 = &v8;
    uint64_t v5 = 2;
  }
  id v6 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, v5, v8, v9, v10, v11, v12, v13, v14);
LABEL_9:

  return v6;
}

- (BOOL)isFullscreenConfiguration
{
  v2 = [(NTKCaliforniaFace *)self selectedOptionForCustomEditMode:15 slot:0];
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0 && [v2 dialShape] == (char *)&dword_0 + 1;

  return v3;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  if (a3 == 15)
  {
    id v7 = @"EDIT_MODE_LABEL_DIAL";
LABEL_7:
    uint64_t v8 = [(__CFString *)v7 stringByAppendingString:@"_COMPANION"];
    uint64_t v9 = NTKCompanionClockFaceLocalizedString();

    goto LABEL_9;
  }
  if (a3 == 13)
  {
    if (NTKShowIndicScriptNumerals()) {
      id v7 = @"EDIT_MODE_LABEL_NUMERALS";
    }
    else {
      id v7 = @"EDIT_MODE_LABEL_SYMBOLS_LEGACY";
    }
    goto LABEL_7;
  }
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___NTKCaliforniaFace;
  uint64_t v9 = objc_msgSendSuper2(&v11, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, v6);
LABEL_9:

  return v9;
}

- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4
{
  if ((unint64_t)a4 > 7) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_17430[a4];
  }
  id v6 = [(NTKCaliforniaFace *)self device];
  id v10 = +[NTKCaliforniaColorEditOption optionWithCaliforniaColor:v5 forDevice:v6];

  [(NTKCaliforniaFace *)self selectOption:v10 forCustomEditMode:10 slot:0];
  id v7 = [(NTKCaliforniaFace *)self device];
  uint64_t v8 = +[NTKAnalogDialShapeEditOption optionWithShape:0 forDevice:v7];

  [(NTKCaliforniaFace *)self selectOption:v8 forCustomEditMode:15 slot:0];
  uint64_t v9 = +[NTKComplication anyComplicationOfType:0];
  [(NTKCaliforniaFace *)self setComplication:v9 forSlot:NTKComplicationSlotTopLeft];
  [(NTKCaliforniaFace *)self setComplication:v9 forSlot:NTKComplicationSlotTopRight];
  [(NTKCaliforniaFace *)self setComplication:v9 forSlot:NTKComplicationSlotBottomLeft];
  [(NTKCaliforniaFace *)self setComplication:v9 forSlot:NTKComplicationSlotBottomRight];
  [(NTKCaliforniaFace *)self setComplication:v9 forSlot:NTKComplicationSlotBezel];
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return +[NTKCaliforniaColorEditOption pigmentFaceDomain];
}

@end