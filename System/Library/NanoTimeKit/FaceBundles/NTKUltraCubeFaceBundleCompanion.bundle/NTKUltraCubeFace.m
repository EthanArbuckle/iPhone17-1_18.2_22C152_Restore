@interface NTKUltraCubeFace
+ (BOOL)_customEditMode:(int64_t)a3 hasActionForOption:(id)a4 forDevice:(id)a5;
+ (BOOL)_customEditModeIsRows:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)isColorEffectFeatureEnabledForDevice:(id)a3;
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (BOOL)needsAppleNeuralEngine;
+ (BOOL)supportsExternalAssets;
+ (id)_complicationSlotDescriptors;
+ (id)_dateComplicationSlotForDevice:(id)a3;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)pigmentFaceDomain;
+ (id)sortableFaceWithAssets:(id)a3 forDevice:(id)a4;
+ (unint64_t)_dateComplicationSlotSupportedStylesForDevice:(id)a3;
- (BOOL)_colorEffectsSupportedForEditMode:(int64_t)a3;
- (BOOL)_createResourceDirectorySuitableForSharingAtPath:(id)a3 error:(id *)a4;
- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3;
- (BOOL)_sanitizeFaceConfiguration:(id *)a3;
- (BOOL)_shouldSanitizeFaceConfigurationWhenAddingSharedFace;
- (BOOL)hasSampleResourceDirectory;
- (BOOL)isValidConfigurationToAddToLibrary;
- (BOOL)requiresPigmentEditOption;
- (BOOL)shouldColorEditModeBeAtTop;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)_resourceDirectorySnapshotKey;
- (id)addFaceDetailViewController;
- (id)bundleIdentifierForUpgrade;
- (id)copyFromGalleryFace;
- (id)copyWithZone:(_NSZone *)a3;
- (id)faceSharingName;
- (id)libraryDetailViewController;
- (id)upgradeContext;
- (int64_t)_customEditModeForUniqueConfiguration;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)_cleanupEditOptions;
- (void)_prepareEditOptions;
- (void)_updateForResourceDirectoryChange:(id)a3;
- (void)companionEditorWithAssets:(id)a3 completion:(id)a4;
@end

@implementation NTKUltraCubeFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
  if ([v3 supportsCapability:v4]) {
    char v5 = [v3 deviceCategory] == (char *)&dword_0 + 1;
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (int64_t)timeStyle
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKUltraCubeFace;
  id v4 = [(NTKUltraCubeFace *)&v8 copyWithZone:a3];
  id v5 = [(NSString *)self->_cachedResourceDirectorySnapshotKey copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (id)_faceDescriptionKey
{
  v2 = [(NTKUltraCubeFace *)self device];
  unsigned int v3 = +[NTKUltraCubeFace isColorEffectFeatureEnabledForDevice:v2];

  if (v3) {
    return @"FACE_STYLE_ULTRACUBE_FACE_DESCRIPTION";
  }
  else {
    return @"FACE_STYLE_ULTRACUBE_FACE_DESCRIPTION_PRE2K22";
  }
}

- (id)_faceDescription
{
  v2 = [(NTKUltraCubeFace *)self _faceDescriptionKey];
  unsigned int v3 = +[NTKUltraCubeFaceBundle localizedStringForKey:v2 comment:v2];

  return v3;
}

- (BOOL)isValidConfigurationToAddToLibrary
{
  return ![(NTKUltraCubeFace *)self hasSampleResourceDirectory];
}

- (id)faceSharingName
{
  return +[NTKUltraCubeFaceBundle localizedStringForKey:@"FACE_STYLE_ULTRACUBE_IN_TITLE_CASE" comment:@"UltraCube"];
}

- (BOOL)_createResourceDirectorySuitableForSharingAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  v12 = v7;
  objc_super v8 = +[NSArray arrayWithObjects:&v12 count:1];

  id v9 = [objc_alloc((Class)NTKResourceDirectoryScrubber) initWithOperations:v8];
  v10 = [(NTKUltraCubeFace *)self resourceDirectory];
  LOBYTE(a4) = [v9 scrubDirectoryAtPath:v10 toDestinationPath:v6 error:a4];

  return (char)a4;
}

- (BOOL)_shouldSanitizeFaceConfigurationWhenAddingSharedFace
{
  return 1;
}

- (BOOL)_sanitizeFaceConfiguration:(id *)a3
{
  id v5 = [(NTKUltraCubeFace *)self resourceDirectory];
  id v6 = +[NTKUltraCubeResourcesManifest manifestForResourceDirectory:v5];

  if (!v6)
  {
    if (a3)
    {
      +[NSError errorWithDomain:kNTKPhotosErrorDomain code:1006 userInfo:0];
      BOOL v12 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    BOOL v12 = 0;
    goto LABEL_10;
  }
  if (![v6 validateManifestWithError:a3]) {
    goto LABEL_9;
  }
  v7 = [(NTKUltraCubeFace *)self resourceDirectory];
  objc_super v8 = +[NTKUltraCubePhotosReader readerForResourceDirectory:v7];

  id v9 = [v8 count];
  v10 = [v6 imageList];
  id v11 = [v10 count];
  BOOL v12 = v9 == v11;

  if (a3 && v9 != v11)
  {
    *a3 = +[NSError errorWithDomain:kNTKResourceDirectoryDomain code:2003 userInfo:0];
  }

LABEL_10:
  return v12;
}

- (void)_updateForResourceDirectoryChange:(id)a3
{
  self->_cachedResourceDirectorySnapshotKey = 0;
  _objc_release_x1();
}

- (id)_resourceDirectorySnapshotKey
{
  uint64_t v3 = [(NTKUltraCubeFace *)self resourceDirectory];
  if (!v3) {
    goto LABEL_6;
  }
  id v4 = (void *)v3;
  id v5 = +[NSFileManager defaultManager];
  id v6 = [(NTKUltraCubeFace *)self resourceDirectory];
  unsigned int v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    cachedResourceDirectorySnapshotKey = self->_cachedResourceDirectorySnapshotKey;
    if (!cachedResourceDirectorySnapshotKey)
    {
      id v9 = [(NTKUltraCubeFace *)self resourceDirectory];
      v10 = +[NTKUltraCubePhotosReader readerForResourceDirectory:v9];

      id v11 = (char *)[v10 version];
      if (v11 == (unsigned char *)&dword_0 + 2)
      {
        BOOL v12 = [v10 firstObject];
        v13 = [v12 uniqueIdentifier];
        v14 = self->_cachedResourceDirectorySnapshotKey;
        self->_cachedResourceDirectorySnapshotKey = v13;
      }
      else
      {
        v17 = +[NSString stringWithFormat:@"version-outdated-%ld", v11];
        BOOL v12 = self->_cachedResourceDirectorySnapshotKey;
        self->_cachedResourceDirectorySnapshotKey = v17;
      }

      cachedResourceDirectorySnapshotKey = self->_cachedResourceDirectorySnapshotKey;
    }
    v16 = cachedResourceDirectorySnapshotKey;
  }
  else
  {
LABEL_6:
    v15 = self->_cachedResourceDirectorySnapshotKey;
    self->_cachedResourceDirectorySnapshotKey = 0;

    v16 = 0;
  }

  return v16;
}

- (id)copyFromGalleryFace
{
  id v2 = [(NTKUltraCubeFace *)self copy];
  uint64_t v3 = +[NTKUltraCubeUserState userState];
  unsigned int v4 = [v3 hasUserEverAddedFaceToLibrary];

  if (v4) {
    [v2 setResourceDirectory:0];
  }
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v2 resourceDirectory];
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Transferring ultracube face from gallery to face library with resource directory %@", (uint8_t *)&v8, 0xCu);
  }
  return v2;
}

- (id)_customEditModes
{
  uint64_t v3 = +[NSMutableArray array];
  unsigned int v4 = [(NTKUltraCubeFace *)self device];
  unsigned int v5 = +[NTKUltraCubeFace isColorEffectFeatureEnabledForDevice:v4];

  [v3 addObject:&off_4B848];
  if (v5)
  {
    [v3 addObject:&off_4B860];
    [v3 addObject:&off_4B878];
  }
  [v3 addObject:&off_4B890];
  id v6 = [v3 copy];

  return v6;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = 0;
  if (-[NTKUltraCubeFace _colorEffectsSupportedForEditMode:](self, "_colorEffectsSupportedForEditMode:", a3, a4))
  {
    switch(a3)
    {
      case 10:
        unsigned int v7 = [(NTKUltraCubeFace *)self device];
        uint64_t v8 = +[NTKPhotosColorEditOption optionWithColor:3000 forDevice:v7];
        goto LABEL_7;
      case 12:
        unsigned int v7 = [(NTKUltraCubeFace *)self device];
        uint64_t v8 = +[NTKUltraCubeContentEditOption optionWithUltraCubeContent:0 forDevice:v7];
        goto LABEL_7;
      case 13:
        unsigned int v7 = [(NTKUltraCubeFace *)self device];
        uint64_t v8 = +[NTKUltraCubeTypefaceEditOption optionWithTypeface:1 forDevice:v7];
        goto LABEL_7;
      case 15:
        unsigned int v7 = [(NTKUltraCubeFace *)self device];
        uint64_t v8 = +[NTKUltraCubeColorEffectEditOption optionWithColorEffect:0 forDevice:v7];
LABEL_7:
        id v6 = (void *)v8;

        break;
      default:
        break;
    }
  }

  return v6;
}

+ (BOOL)_customEditModeIsRows:(int64_t)a3 forDevice:(id)a4
{
  return a3 == 12;
}

+ (BOOL)_customEditMode:(int64_t)a3 hasActionForOption:(id)a4 forDevice:(id)a5
{
  id v6 = a4;
  unsigned int v7 = v6;
  BOOL v8 = a3 == 12 && [v6 ultracubeContent] == 0;

  return v8;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  if (a3 == 12)
  {
    unsigned int v7 = @"EDIT_MODE_LABEL_CONTENT";
    goto LABEL_5;
  }
  if (a3 == 13)
  {
    unsigned int v7 = @"EDIT_MODE_LABEL_TYPEFACE";
LABEL_5:
    BOOL v8 = [(__CFString *)v7 stringByAppendingString:@"_COMPANION"];
    id v9 = +[NTKUltraCubeFaceBundle localizedStringForKey:v8 comment:v8];

    goto LABEL_7;
  }
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___NTKUltraCubeFace;
  id v9 = objc_msgSendSuper2(&v11, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, v6);
LABEL_7:

  return v9;
}

- (int64_t)_customEditModeForUniqueConfiguration
{
  return 0;
}

- (void)_prepareEditOptions
{
  self->_editing = 1;
}

- (void)_cleanupEditOptions
{
  self->_editing = 0;
}

- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKUltraCubeFace;
  return [(NTKUltraCubeFace *)&v4 _hasOptionsForCustomEditMode:a3];
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = 0;
  if (-[NTKUltraCubeFace _colorEffectsSupportedForEditMode:](self, "_colorEffectsSupportedForEditMode:", a3, a4))
  {
    switch(a3)
    {
      case 10:
        unsigned int v7 = (__objc2_class *)NTKPhotosColorEditOption;
        goto LABEL_7;
      case 12:
        unsigned int v7 = NTKUltraCubeContentEditOption;
        goto LABEL_7;
      case 13:
        unsigned int v7 = NTKUltraCubeTypefaceEditOption;
        goto LABEL_7;
      case 15:
        unsigned int v7 = NTKUltraCubeColorEffectEditOption;
LABEL_7:
        BOOL v8 = [(NTKUltraCubeFace *)self device];
        id v6 = [(__objc2_class *)v7 numberOfOptionsForDevice:v8];

        break;
      default:
        return (unint64_t)v6;
    }
  }
  return (unint64_t)v6;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  BOOL v8 = 0;
  if ([(NTKUltraCubeFace *)self _colorEffectsSupportedForEditMode:a4])
  {
    switch(a4)
    {
      case 10:
        id v9 = (__objc2_class *)NTKPhotosColorEditOption;
        goto LABEL_7;
      case 12:
        id v9 = NTKUltraCubeContentEditOption;
        goto LABEL_7;
      case 13:
        id v9 = NTKUltraCubeTypefaceEditOption;
        goto LABEL_7;
      case 15:
        id v9 = NTKUltraCubeColorEffectEditOption;
LABEL_7:
        v10 = [(NTKUltraCubeFace *)self device];
        BOOL v8 = [(__objc2_class *)v9 optionAtIndex:a3 forDevice:v10];

        break;
      default:
        break;
    }
  }

  return v8;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(NTKUltraCubeFace *)self _colorEffectsSupportedForEditMode:a4])
  {
    switch(a4)
    {
      case 10:
        id v9 = (__objc2_class *)NTKPhotosColorEditOption;
        goto LABEL_7;
      case 12:
        id v9 = NTKUltraCubeContentEditOption;
        goto LABEL_7;
      case 13:
        id v9 = NTKUltraCubeTypefaceEditOption;
        goto LABEL_7;
      case 15:
        id v9 = NTKUltraCubeColorEffectEditOption;
LABEL_7:
        v10 = [(NTKUltraCubeFace *)self device];
        unint64_t v8 = (unint64_t)[(__objc2_class *)v9 indexOfOption:v7 forDevice:v10];

        break;
      default:
        break;
    }
  }

  return v8;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (-[NTKUltraCubeFace _colorEffectsSupportedForEditMode:](self, "_colorEffectsSupportedForEditMode:")
    && (unint64_t)(a3 - 10) <= 5
    && ((0x2Du >> (a3 - 10)) & 1) != 0)
  {
    objc_super v4 = objc_opt_class();
  }
  else
  {
    objc_super v4 = 0;
  }

  return (Class)v4;
}

- (BOOL)shouldColorEditModeBeAtTop
{
  return 0;
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
  id v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)_complicationSlotDescriptors
{
  id v2 = NTKAllUtilityLargeNarrowComplicationTypes();
  v9[0] = NTKComplicationSlotDate;
  uint64_t v3 = NTKWrappedDateComplicationType();
  objc_super v4 = NTKComplicationSlotDescriptor();
  v10[0] = v4;
  v9[1] = NTKComplicationSlotBottom;
  unsigned int v5 = NTKComplicationTypeRankedListWithDefaultTypes();
  id v6 = NTKComplicationSlotDescriptor();
  v10[1] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
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
    v8.super_class = (Class)NTKUltraCubeFace;
    uint64_t v5 = [(NTKUltraCubeFace *)&v8 _localizedNameForComplicationSlot:v4];
  }
  id v6 = (void *)v5;

  return v6;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return +[NTKPhotosColorEditOption pigmentFaceDomain];
}

+ (BOOL)isColorEffectFeatureEnabledForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"];
  unsigned __int8 v5 = [v3 supportsCapability:v4];

  return v5;
}

- (BOOL)_colorEffectsSupportedForEditMode:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xC) {
    return 1;
  }
  id v4 = [(NTKUltraCubeFace *)self device];
  BOOL v5 = +[NTKUltraCubeFace isColorEffectFeatureEnabledForDevice:v4];

  return v5;
}

- (id)bundleIdentifierForUpgrade
{
  return @"com.apple.NTKParmesanFaceBundle";
}

- (id)upgradeContext
{
  id v3 = [(NTKUltraCubeFace *)self resourceDirectory];
  id v4 = +[NTKUltraCubePhotosReader readerForResourceDirectory:v3];

  BOOL v5 = [(NTKUltraCubeFace *)self complicationForSlot:NTKComplicationSlotDate];
  id v6 = [(NTKUltraCubeFace *)self complicationForSlot:NTKComplicationSlotBottom];
  id v7 = [(NTKUltraCubeFace *)self selectedOptionsForCustomEditModes];
  objc_super v8 = [v7 objectForKeyedSubscript:&off_4B878];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [(NTKUltraCubeFace *)self selectedOptionsForCustomEditModes];
    uint64_t v10 = [v9 objectForKeyedSubscript:&off_4B890];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v11 = [(NTKUltraCubeFace *)self selectedOptionsForCustomEditModes];
      BOOL v12 = [v11 objectForKeyedSubscript:&off_4B860];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v12 = v12;
        v13 = [[_NTKUltraCubePhotoFaceUpgradeContext alloc] initWithReader:v4 topComplication:v5 bottomComplication:v6 colorEffectOption:v8 colorOption:v12 typefaceOption:v10];
      }
      else
      {
        v16 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_2B954();
        }

        v13 = 0;
      }
      v15 = v10;
    }
    else
    {
      v15 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_2B9C8();
      }
      v13 = 0;
      BOOL v12 = v10;
    }

    v14 = v8;
    objc_super v8 = v12;
  }
  else
  {
    v14 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2BA3C();
    }
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
}

- (id)libraryDetailViewController
{
  id v2 = [[NTKCUltraCubeFaceDetailViewController alloc] initWithLibraryFace:self];

  return v2;
}

- (id)addFaceDetailViewController
{
  id v3 = [NTKCUltraCubeFaceDetailViewController alloc];
  id v4 = [(NTKUltraCubeFace *)self externalAssets];
  BOOL v5 = [(NTKCUltraCubeFaceDetailViewController *)v3 initWithCandidateFace:self externalAssets:v4];

  return v5;
}

+ (BOOL)needsAppleNeuralEngine
{
  return 1;
}

+ (BOOL)supportsExternalAssets
{
  return 1;
}

+ (id)sortableFaceWithAssets:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F27862F8-5179-4DB0-9F89-179EA7CB4011"];
  unsigned __int8 v9 = [v7 supportsCapability:v8];

  if (v9)
  {
LABEL_13:
    id v18 = 0;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v6;
    objc_super v11 = (char *)[v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      BOOL v12 = v11;
      uint64_t v13 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_13;
          }
        }
        BOOL v12 = (char *)[v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    v15 = +[NTKUltraCubeFaceBundle identifier];
    v16 = +[NTKUltraCubeFaceBundle analyticsIdentifier];
    v17 = [a1 bundledFaceWithIdentifier:v15 analyticsIdentifier:v16 forDevice:v7 initCustomization:0];
    [v17 setExternalAssets:v10];
    if (v17) {
      id v18 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v17 priority:300];
    }
    else {
      id v18 = 0;
    }
  }

  return v18;
}

- (void)companionEditorWithAssets:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, id))a4;
  id v7 = [v12 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unsigned __int8 v9 = [NTKCompanionUltraCubePhotosEditor alloc];
    id v10 = [(NTKUltraCubeFace *)self device];
    objc_super v11 = [(NTKCompanionUltraCubePhotosEditor *)v9 initWithResourceDirectory:0 forDevice:v10];

    [(NTKCompanionUltraCubePhotosEditor *)v11 addAssetsFromAssetList:v12];
    v6[2](v6, v11);
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (BOOL)hasSampleResourceDirectory
{
  id v2 = [(NTKUltraCubeFace *)self _resourceDirectorySnapshotKey];
  unsigned __int8 v3 = [v2 hasPrefix:@"GalleryImage-"];

  return v3;
}

@end