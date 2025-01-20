@interface NTKCollieFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_dateComplicationSlotForDevice:(id)a3;
+ (id)_defaultColorEditOptionForDevice:(id)a3;
+ (id)_defaultNumeralEditOptionForDevice:(id)a3;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_defaultStyleEditOptionForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)faceForAvatarRecordIdentifier:(id)a3 forDevice:(id)a4;
+ (id)pigmentFaceDomain;
+ (unint64_t)_dateComplicationSlotSupportedStylesForDevice:(id)a3;
- (BOOL)_option:(id)a3 isValidForCustomEditMode:(int64_t)a4 slot:(id)a5 configuration:(id)a6;
- (BOOL)_sanitizeFaceConfiguration:(id *)a3;
- (BOOL)_shouldIncludeResourceDirectoryForSharing;
- (BOOL)_shouldSanitizeFaceConfigurationWhenAddingSharedFace;
- (BOOL)hasLocalAvatar;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_createSharingMetadata;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_defaultOptionForMissingCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)_uniqueOptionForCustomEditMode:(int64_t)a3 slot:(id)a4 withExistingOptions:(id)a5;
- (id)faceSharingName;
- (id)unsafeDailySnapshotKey;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)_commonInit;
- (void)_handleSharingMetadata:(id)a3;
- (void)_noteOptionChangedFrom:(id)a3 to:(id)a4 forCustomEditMode:(int64_t)a5 slot:(id)a6;
- (void)didMoveToLibrary;
- (void)ensureBridgeMemojiResources;
- (void)ensureBridgeMemojiResourcesForStyleEditOption:(id)a3;
@end

@implementation NTKCollieFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  int v4 = _os_feature_enabled_impl();
  LOBYTE(v5) = 1;
  if ([v3 deviceCategory] != (char *)&dword_0 + 1 && v4)
  {
    id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D5DDA3E7-8863-48E3-95C7-3C65C5E31718"];
    unsigned int v5 = [v3 supportsCapability:v6] ^ 1;
  }
  return v5;
}

- (int64_t)timeStyle
{
  return 1;
}

- (void)_commonInit
{
  +[NTKCollieStyleEditOption invalidateCache];
  v3.receiver = self;
  v3.super_class = (Class)NTKCollieFace;
  [(NTKCollieFace *)&v3 _commonInit];
}

- (BOOL)hasLocalAvatar
{
  if (!self->_hasLocalAvatar && !self->_checkedForLocalAvatar)
  {
    objc_super v3 = [(NTKCollieFace *)self resourceDirectory];
    self->_hasLocalAvatar = +[NTKCollieStyleEditOption hasSharedMemojiForResourceDirectory:v3];
  }
  self->_checkedForLocalAvatar = 1;
  return self->_hasLocalAvatar;
}

- (id)unsafeDailySnapshotKey
{
  v17.receiver = self;
  v17.super_class = (Class)NTKCollieFace;
  objc_super v3 = [(NTKCollieFace *)&v17 unsafeDailySnapshotKey];
  if ([v3 isEqualToString:NTKSensitiveSnapshotKey])
  {
    id v4 = v3;
  }
  else
  {
    unsigned int v5 = [(NTKCollieFace *)self selectedOptionForCustomEditMode:15 slot:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      if ([v6 isRegularMemoji])
      {
        v7 = objc_opt_new();
        v8 = [(NTKCollieFace *)self configuration];
        [v8 appendCustomDataToDailySnapshotKey:v7];

        id v9 = [v3 rangeOfString:v7];
        if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v11 = objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v9, v10, &stru_29398);

          objc_super v3 = (void *)v11;
        }
      }
      if (([v6 isRegularMemoji] & 1) != 0
        || ([v6 isToyboxMemoji] & 1) != 0
        || [v6 isSharedMemoji])
      {
        v12 = [(NTKCollieFace *)self resourceDirectory];
        +[NTKCollieFaceView _snapshotImageSize];
        if (+[NTKCollieStyleEditOption hasSnapshotImageForOption:resourceDirectory:size:](NTKCollieStyleEditOption, "hasSnapshotImageForOption:resourceDirectory:size:", v6, v12))
        {
          v13 = +[NTKCollieStyleEditOption avatarSha1StringForOption:v6 resourceDirectory:v12];
          if (v13)
          {
            uint64_t v14 = +[NSString stringWithFormat:@"-(%@)", v13];
            uint64_t v15 = [v3 stringByAppendingString:v14];

            objc_super v3 = (void *)v14;
          }
          else
          {
            uint64_t v15 = [v3 stringByAppendingString:@"-(nil)"];
          }
        }
        else
        {
          uint64_t v15 = [v3 stringByAppendingString:@"-(nosnap)"];
          v13 = v3;
        }

        objc_super v3 = (void *)v15;
      }
    }
    id v4 = v3;
  }

  return v4;
}

- (id)faceSharingName
{
  return +[NTKCollieFaceBundle localizedStringForKey:@"COLLIE_FACE_NAME_IN_TITLE_CASE" comment:&stru_29398];
}

- (BOOL)_shouldIncludeResourceDirectoryForSharing
{
  return 0;
}

+ (id)faceForAvatarRecordIdentifier:(id)a3 forDevice:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[NTKCollieStyleEditOption endCache];
  v8 = +[NTKCollieStyleEditOption optionWithAvatarRecordIdentifier:v7 forDevice:v6];

  if (v8)
  {
    id v9 = NTKCollieFaceNSBundle();
    uint64_t v10 = [v9 bundleIdentifier];
    uint64_t v11 = +[NTKCollieFaceBundle analyticsIdentifier];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_131D4;
    v14[3] = &unk_29080;
    id v15 = v8;
    id v17 = a1;
    id v16 = v6;
    v12 = [a1 bundledFaceWithIdentifier:v10 analyticsIdentifier:v11 forDevice:v16 initCustomization:v14];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)didMoveToLibrary
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCollieFace;
  [(NTKCollieFace *)&v5 didMoveToLibrary];
  objc_super v3 = +[NTKCollieAvatarStoreListener sharedInstance];
  avtStoreListener = self->_avtStoreListener;
  self->_avtStoreListener = v3;
}

- (BOOL)_shouldSanitizeFaceConfigurationWhenAddingSharedFace
{
  return 1;
}

- (BOOL)_sanitizeFaceConfiguration:(id *)a3
{
  objc_super v5 = [(NTKCollieFace *)self selectedOptionForCustomEditMode:15 slot:0];
  id v6 = [v5 styleName];
  if ([v6 isSharedMemojiStyleName])
  {
    id v7 = [(NTKCollieFace *)self resourceDirectory];
    v8 = [(NTKCollieFace *)self device];
    unsigned __int8 v9 = +[NTKCollieStyleEditOption validateSharedMemojiResourceDirectory:v7 forDevice:v8 error:a3];
  }
  else if ([v6 isToyboxAnyStyleName])
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    unsigned __int8 v9 = [v6 isRegularAnimojiStyleName];
  }

  return v9;
}

- (id)_createSharingMetadata
{
  objc_super v3 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[NTKCollieFace _createSharingMetadata]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s: starting", (uint8_t *)&v10, 0xCu);
  }

  id v4 = [(NTKCollieFace *)self selectedOptionForCustomEditMode:15 slot:0];
  if (([v4 isRegularMemoji] & 1) != 0 || objc_msgSend(v4, "isSharedMemoji"))
  {
    objc_super v5 = [(NTKCollieFace *)self resourceDirectory];
    id v6 = +[NTKCollieStyleEditOption avatarDataRepresentationForOption:v4 resourceDirectory:v5];

    id v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:0];
    if (v7)
    {
      v8 = +[NSDictionary dictionaryWithObject:v7 forKey:@"avatar_data_key"];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_handleSharingMetadata:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[NTKCollieFace _handleSharingMetadata:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s: starting", buf, 0xCu);
  }

  id v6 = [v4 objectForKey:@"avatar_data_key"];

  id v7 = +[NSJSONSerialization dataWithJSONObject:v6 options:1 error:0];
  if (v7)
  {
    v8 = [(NTKCollieFace *)self device];
    id v16 = 0;
    unsigned int v9 = +[NTKCollieStyleEditOption validateMemojiDataRepresentation:v7 forDevice:v8 error:&v16];
    id v10 = v16;

    if (v9)
    {
      uint64_t v11 = NTKNewUniqueTeporaryResourceDirectory();
      id v15 = v10;
      +[NTKCollieStyleEditOption saveSharedMemojiDataRepresentation:v7 resourceDirectory:v11 error:&v15];
      id v12 = v15;

      if (v12)
      {
        v13 = +[NTKCollieFaceBundle logObject];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_19144((uint64_t)v12, v13);
        }
      }
      else
      {
        [(NTKCollieFace *)self setResourceDirectory:v11];
        uint64_t v14 = [(NTKCollieFace *)self device];
        v13 = +[NTKCollieStyleEditOption optionWithStyleName:@"local-memoji" forDevice:v14];

        [(NTKCollieFace *)self selectOption:v13 forCustomEditMode:15 slot:0];
      }
    }
    else
    {
      id v12 = v10;
    }
  }
  else
  {
    id v12 = 0;
  }
}

- (id)_uniqueOptionForCustomEditMode:(int64_t)a3 slot:(id)a4 withExistingOptions:(id)a5
{
  if (a3 == 15)
  {
    id v6 = a5;
    id v7 = [(NTKCollieFace *)self device];
    v8 = +[NTKCollieStyleEditOption uniqueOptionForDevice:v7 existingOptions:v6];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)NTKCollieFace;
    id v11 = a5;
    v8 = [(NTKCollieFace *)&v13 _uniqueOptionForCustomEditMode:a3 slot:a4 withExistingOptions:v11];
  }

  return v8;
}

- (id)_customEditModes
{
  id v3 = [&off_29DA0 mutableCopy];
  id v4 = [(NTKCollieFace *)self device];
  int v5 = NTKShowIndicScriptNumerals();

  if (v5) {
    [v3 addObject:&off_29EA8];
  }
  [v3 addObject:&off_29EC0];

  return v3;
}

+ (id)_defaultColorEditOptionForDevice:(id)a3
{
  return +[NTKCollieColorEditOption optionWithFaceColor:1 forDevice:a3];
}

+ (id)_defaultStyleEditOptionForDevice:(id)a3
{
  return +[NTKCollieStyleEditOption optionWithStyleName:@"unicorn" forDevice:a3];
}

+ (id)_defaultNumeralEditOptionForDevice:(id)a3
{
  id v3 = a3;
  CLKLocaleNumberSystemForFirstLanguage();
  id v4 = +[NTKNumeralEditOption optionWithNumeral:NTKNumeralOptionFromCLKLocaleNumberSystem() forDevice:v3];

  return v4;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 19:
      id v10 = objc_opt_class();
      v8 = [(NTKCollieFace *)self device];
      uint64_t v9 = [v10 _defaultNumeralEditOptionForDevice:v8];
      goto LABEL_7;
    case 15:
      id v11 = objc_opt_class();
      v8 = [(NTKCollieFace *)self device];
      uint64_t v9 = [v11 _defaultStyleEditOptionForDevice:v8];
      goto LABEL_7;
    case 10:
      id v7 = objc_opt_class();
      v8 = [(NTKCollieFace *)self device];
      uint64_t v9 = [v7 _defaultColorEditOptionForDevice:v8];
LABEL_7:
      id v12 = (void *)v9;

      goto LABEL_9;
  }
  id v12 = 0;
LABEL_9:

  return v12;
}

- (id)_defaultOptionForMissingCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 10)
  {
    id v4 = [(NTKCollieFace *)self device];
    int v5 = +[NTKCollieColorEditOption optionWithFaceColor:200 forDevice:v4];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKCollieFace;
    int v5 = [(NTKCollieFace *)&v7 _defaultOptionForMissingCustomEditMode:a3 slot:a4];
  }

  return v5;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 19:
      objc_super v7 = (__objc2_class *)NTKNumeralEditOption;
      break;
    case 15:
      v8 = [(NTKCollieFace *)self resourceDirectory];
      id v10 = [(NTKCollieFace *)self device];
      id v9 = +[NTKCollieStyleEditOption numberOfOptionsWithResourceDirectory:v8 forDevice:v10];

      goto LABEL_8;
    case 10:
      objc_super v7 = NTKCollieColorEditOption;
      break;
    default:
      id v9 = 0;
      goto LABEL_10;
  }
  v8 = [(NTKCollieFace *)self device];
  id v9 = [(__objc2_class *)v7 numberOfOptionsForDevice:v8];
LABEL_8:

LABEL_10:
  return (unint64_t)v9;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a5;
  switch(a4)
  {
    case 19:
      id v9 = self;
      uint64_t v10 = 19;
      goto LABEL_6;
    case 15:
      id v12 = [(NTKCollieFace *)self resourceDirectory];
      uint64_t v14 = [(NTKCollieFace *)self device];
      objc_super v13 = +[NTKCollieStyleEditOption optionAtIndex:a3 resourceDirectory:v12 forDevice:v14];

      goto LABEL_8;
    case 10:
      id v9 = self;
      uint64_t v10 = 10;
LABEL_6:
      id v11 = [(NTKCollieFace *)v9 _optionClassForCustomEditMode:v10];
      id v12 = [(NTKCollieFace *)self device];
      objc_super v13 = [(objc_class *)v11 optionAtIndex:a3 forDevice:v12];
LABEL_8:

      goto LABEL_10;
  }
  objc_super v13 = 0;
LABEL_10:

  return v13;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  switch(a4)
  {
    case 19:
      uint64_t v10 = (__objc2_class *)NTKNumeralEditOption;
      break;
    case 15:
      id v11 = [(NTKCollieFace *)self resourceDirectory];
      objc_super v13 = [(NTKCollieFace *)self device];
      unint64_t v12 = +[NTKCollieStyleEditOption indexOfOption:v8 resourceDirectory:v11 forDevice:v13];

      goto LABEL_8;
    case 10:
      uint64_t v10 = NTKCollieColorEditOption;
      break;
    default:
      unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_10;
  }
  id v11 = [(NTKCollieFace *)self device];
  unint64_t v12 = (unint64_t)[(__objc2_class *)v10 indexOfOption:v8 forDevice:v11];
LABEL_8:

LABEL_10:
  return v12;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10 || a3 == 19 || a3 == 15)
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }
  return (Class)v4;
}

- (BOOL)_option:(id)a3 isValidForCustomEditMode:(int64_t)a4 slot:(id)a5 configuration:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a4 != 15) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  id v13 = v10;
  if ([v13 isBridgeMemoji])
  {
    uint64_t v14 = [(NTKCollieFace *)self customDataForKey:@"memoji"];
    id v15 = (void *)v14;
    if (v12 && !v14)
    {
      id v15 = [v12 customDataForKey:@"memoji"];
    }
    if (v15)
    {
      id v16 = [(NTKCollieFace *)self device];
      id v23 = 0;
      unsigned int v17 = +[NTKCollieCustomData validateCustomData:v15 forDevice:v16 error:&v23];
      id v18 = v23;

      if (v17)
      {

        goto LABEL_10;
      }
      v20 = +[NTKCollieFaceBundle logObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_191D0(v13, (uint64_t)v18, v20);
      }
    }
LABEL_16:
    BOOL v19 = 0;
    goto LABEL_17;
  }
LABEL_10:

LABEL_11:
  v22.receiver = self;
  v22.super_class = (Class)NTKCollieFace;
  BOOL v19 = [(NTKCollieFace *)&v22 _option:v10 isValidForCustomEditMode:a4 slot:v11 configuration:v12];
LABEL_17:

  return v19;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15)
  {
    id v4 = +[NTKCollieFaceBundle localizedStringForKey:@"EDIT_MODE_LABEL_STYLE_COLLIE_IN_TITLE_CASE" comment:&stru_29398];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___NTKCollieFace;
    id v4 = objc_msgSendSuper2(&v6, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, a4);
  }

  return v4;
}

- (void)ensureBridgeMemojiResourcesForStyleEditOption:(id)a3
{
  id v4 = a3;
  if ([v4 isBridgeMemoji])
  {
    int v5 = [(NTKCollieFace *)self resourceDirectory];
    if (!v5)
    {
      int v5 = NTKNewUniqueTeporaryResourceDirectory();
      [(NTKCollieFace *)self setResourceDirectory:v5];
    }
    objc_super v6 = [v4 styleName];
    objc_super v7 = [v6 memojiIdentifier];

    id v8 = [(NTKCollieFace *)self customDataForKey:@"memoji"];
    id v10 = +[NTKCollieStyleEditOption bridgeMemojiDataRepresentationForIdentifier:v7 resourceDirectory:v5];
    if (!v10
      || !+[NTKCollieCustomData dataRepresentation:v10 equalsCustomData:v8])
    {
      id v11 = +[NTKCollieFaceBundle logObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v4 styleName];
        *(_DWORD *)buf = 138412290;
        id v15 = v12;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "generating bridge memoji resources for %@", buf, 0xCu);
      }
      +[NTKCollieStyleEditOption pruneResourceDirectory:v5 pruneBridgeMemoji:1];
      if (v8)
      {
        uint64_t v13 = 0;
        +[NTKCollieStyleEditOption saveBridgeMemojiCustomData:v8 identifier:v7 resourceDirectory:v5 error:&v13];
      }
    }
  }
}

- (void)ensureBridgeMemojiResources
{
  id v3 = [(NTKCollieFace *)self selectedOptionForCustomEditMode:15 slot:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(NTKCollieFace *)self ensureBridgeMemojiResourcesForStyleEditOption:v3];
  }
}

- (void)_noteOptionChangedFrom:(id)a3 to:(id)a4 forCustomEditMode:(int64_t)a5 slot:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v19 = "-[NTKCollieFace _noteOptionChangedFrom:to:forCustomEditMode:slot:]";
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%s: starting", buf, 0xCu);
  }

  v17.receiver = self;
  v17.super_class = (Class)NTKCollieFace;
  [(NTKCollieFace *)&v17 _noteOptionChangedFrom:v12 to:v10 forCustomEditMode:a5 slot:v11];

  if (a5 == 15)
  {
    id v14 = v10;
    id v15 = [(NTKCollieFace *)self resourceDirectory];
    id v16 = [v14 customDataWithResourceDirectory:v15];

    [(NTKCollieFace *)self setCustomData:v16 forKey:@"memoji"];
  }
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotDate;
}

+ (id)_dateComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotDate;
}

+ (unint64_t)_dateComplicationSlotSupportedStylesForDevice:(id)a3
{
  return 8;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotDate;
  v4[1] = NTKComplicationSlotBottom;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllUtilityLargeNarrowComplicationTypes();
  id v3 = +[CLKDevice currentDevice];
  unsigned int v4 = [v3 isTinker];

  if (v4)
  {
    v13[0] = NTKComplicationSlotDate;
    int v5 = NTKWrappedDateComplicationType();
    objc_super v6 = NTKComplicationSlotDescriptor();
    v14[0] = v6;
    v13[1] = NTKComplicationSlotBottom;
    objc_super v7 = NTKComplicationSlotDescriptor();
    v14[1] = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  }
  else
  {
    v11[0] = NTKComplicationSlotDate;
    int v5 = NTKWrappedDateComplicationType();
    objc_super v6 = NTKComplicationSlotDescriptor();
    v12[0] = v6;
    v11[1] = NTKComplicationSlotBottom;
    objc_super v7 = NTKComplicationTypeRankedListWithDefaultTypes();
    id v9 = NTKComplicationSlotDescriptor();
    v12[1] = v9;
    id v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  }

  return v8;
}

- (id)_faceDescriptionKey
{
  unint64_t v2 = +[NTKCollieStyleEditOption cloudSyncStatus];
  if (v2 - 1 > 2) {
    return @"FACE_STYLE_COLLIE_DESCRIPTION";
  }
  else {
    return off_290A0[v2 - 1];
  }
}

- (id)_faceDescription
{
  unint64_t v2 = [(NTKCollieFace *)self _faceDescriptionKey];
  id v3 = +[NTKCollieFaceBundle localizedStringForKey:v2 comment:&stru_29398];

  return v3;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:NTKComplicationSlotDate])
  {
    uint64_t v5 = NTKClockFaceLocalizedString();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKCollieFace;
    uint64_t v5 = [(NTKCollieFace *)&v8 _localizedNameForComplicationSlot:v4];
  }
  objc_super v6 = (void *)v5;

  return v6;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return +[NTKCollieColorEditOption pigmentFaceDomain];
}

- (void).cxx_destruct
{
}

@end