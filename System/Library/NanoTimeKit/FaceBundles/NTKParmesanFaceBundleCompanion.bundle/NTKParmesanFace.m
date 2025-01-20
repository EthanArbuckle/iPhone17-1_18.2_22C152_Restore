@interface NTKParmesanFace
+ (BOOL)_customEditMode:(int64_t)a3 hasActionForOption:(id)a4 forDevice:(id)a5;
+ (BOOL)_customEditModeDeterminesDynamicSections:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)_customEditModeIsRows:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)externalAssetsAreValid:(id)a3;
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (BOOL)needsAppleNeuralEngine;
+ (BOOL)supportsExternalAssets;
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_defaultSelectedSlotForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)_slotForAddColorsViewFrame;
+ (id)_slotsForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)additionalPigmentFaceDomains;
+ (id)pigmentFaceDomain;
+ (id)sortableFaceWithAssets:(id)a3 forDevice:(id)a4;
+ (id)upgradeManagerWithFace:(id)a3 forDevice:(id)a4;
- (BOOL)_allowsEditing;
- (BOOL)_createResourceDirectorySuitableForSharingAtPath:(id)a3 error:(id *)a4;
- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3;
- (BOOL)_sanitizeFaceConfiguration:(id *)a3;
- (BOOL)_shouldSanitizeFaceConfigurationWhenAddingSharedFace;
- (BOOL)applyConfiguration:(id)a3;
- (BOOL)editing;
- (BOOL)isValidConfigurationToAddToLibrary;
- (BOOL)shouldColorEditModeBeAtTop;
- (BOOL)supportsPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (NTKParmesanPigmentProviderCoordinator)pigmentProviderCoordinator;
- (id)_createDynamicContentDirectoryFromReader:(id)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_localizedNameForDynamicSectionCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)_resourceDirectorySnapshotKey;
- (id)_selectDefaultPigmentForStyle:(id)a3;
- (id)_storedPlaceholderName;
- (id)addFaceDetailViewController;
- (id)albumFaceContent;
- (id)companionGalleryName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)editOptionsThatHideEditModes;
- (id)faceSharingName;
- (id)galleryName;
- (id)libraryDetailViewController;
- (id)localizedExplanationMessageForDisabledEditMode:(int64_t)a3;
- (id)pigmentOptionProvider;
- (id)trackedPhotosContent;
- (int64_t)_customEditModeForUniqueConfiguration;
- (int64_t)_dynamicEditMode;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfDynamicSections;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (unint64_t)_selectedStyleOption;
- (void)_cleanupEditOptions;
- (void)_commonInit;
- (void)_noteOptionChangedFrom:(id)a3 to:(id)a4 forCustomEditMode:(int64_t)a5 slot:(id)a6;
- (void)_prepareEditOptions;
- (void)_reportAdditionalAddedToLibraryMetrics;
- (void)_reportAdditionalDailyConfigurationMetrics;
- (void)_startStreamingAssetsFromReader:(id)a3 updateBlock:(id)a4 completionBlock:(id)a5;
- (void)_updateForResourceDirectoryChange:(id)a3;
- (void)applyDefaultConfiguration;
- (void)companionEditorWithAssets:(id)a3 completion:(id)a4;
- (void)prepareForSharing;
- (void)setEditing:(BOOL)a3;
@end

@implementation NTKParmesanFace

- (id)libraryDetailViewController
{
  v3 = [NTKCParmesanFaceDetailViewController alloc];
  v6 = objc_msgSend_initWithLibraryFace_(v3, v4, (uint64_t)self, v5);

  return v6;
}

- (id)addFaceDetailViewController
{
  v3 = [NTKCParmesanFaceDetailViewController alloc];
  v7 = objc_msgSend_externalAssets(self, v4, v5, v6);
  v9 = objc_msgSend_initWithCandidateFace_externalAssets_(v3, v8, (uint64_t)self, (uint64_t)v7);

  return v9;
}

+ (BOOL)needsAppleNeuralEngine
{
  return 1;
}

+ (BOOL)supportsExternalAssets
{
  return 1;
}

+ (BOOL)externalAssetsAreValid:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = a3;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        int isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) == 0 || objc_msgSend_sourceType(v9, v10, v11, v12, (void)v17) != 2)
        {
          objc_opt_class();
          if ((isKindOfClass | objc_opt_isKindOfClass())) {
            continue;
          }
        }
        BOOL v15 = 0;
        goto LABEL_13;
      }
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v14, (uint64_t)&v17, (uint64_t)v21, 16);
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_13:

  return v15;
}

+ (id)sortableFaceWithAssets:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v11 = objc_msgSend_initWithUUIDString_(v8, v9, @"F27862F8-5179-4DB0-9F89-179EA7CB4011", v10);
  int v14 = objc_msgSend_supportsCapability_(v7, v12, (uint64_t)v11, v13);

  if (v14)
  {
    if (objc_msgSend_externalAssetsAreValid_(a1, v15, (uint64_t)v6, v16))
    {
      long long v20 = objc_msgSend_identifier(NTKParmesanFaceBundle, v17, v18, v19);
      v24 = objc_msgSend_analyticsIdentifier(NTKParmesanFaceBundle, v21, v22, v23);
      v26 = objc_msgSend_bundledFaceWithIdentifier_analyticsIdentifier_forDevice_initCustomization_(a1, v25, (uint64_t)v20, (uint64_t)v24, v7, &unk_26FB1C180);
      v28 = objc_msgSend_optionWithContent_device_(NTKParmesanContentEditOption, v27, 1, (uint64_t)v7);
      objc_msgSend_selectOption_forCustomEditMode_slot_(v26, v29, (uint64_t)v28, 12, 0);
      objc_msgSend_setExternalAssets_(v26, v30, (uint64_t)v6, v31);
      if (v26)
      {
        id v32 = objc_alloc(MEMORY[0x263F579E8]);
        v34 = objc_msgSend_initWithFace_priority_(v32, v33, (uint64_t)v26, 400);
      }
      else
      {
        v34 = 0;
      }

      goto LABEL_11;
    }
    v35 = objc_msgSend_logObject(NTKParmesanFaceBundle, v17, v18, v19);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_246C2A058(v35);
    }
  }
  v34 = 0;
LABEL_11:

  return v34;
}

- (void)companionEditorWithAssets:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v11 = objc_msgSend_firstObject(v6, v8, v9, v10);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v16 = objc_msgSend_firstObject(v6, v13, v14, v15);
  objc_opt_class();
  char v17 = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v21 = objc_msgSend_logObject(NTKParmesanFaceBundle, v18, v19, v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_246B51000, v21, OS_LOG_TYPE_INFO, "Creating parmesan editor to handle PHAssets", buf, 2u);
    }

    uint64_t v22 = [NTKCParmesanPhotosEditor alloc];
    v26 = objc_msgSend_device(self, v23, v24, v25);
    v28 = objc_msgSend_initWithResourceDirectory_forDevice_(v22, v27, 0, (uint64_t)v26);

    objc_msgSend_addAssetsFromAssetList_(v28, v29, (uint64_t)v6, v30);
LABEL_9:
    v7[2](v7, v28);
    goto LABEL_16;
  }
  if (v17)
  {
    uint64_t v31 = objc_msgSend_logObject(NTKParmesanFaceBundle, v18, v19, v20);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v47[0] = 0;
      _os_log_impl(&dword_246B51000, v31, OS_LOG_TYPE_INFO, "Creating paremsan editor to handle UIImages", (uint8_t *)v47, 2u);
    }

    id v32 = [NTKParmesanImageEditor alloc];
    v36 = objc_msgSend_device(self, v33, v34, v35);
    v28 = objc_msgSend_initForDevice_(v32, v37, (uint64_t)v36, v38);

    objc_msgSend_addImages_(v28, v39, (uint64_t)v6, v40);
    goto LABEL_9;
  }
  v28 = objc_msgSend_firstObject(v6, v18, v19, v20);
  if (v28)
  {
    v44 = (objc_class *)objc_opt_class();
    NSStringFromClass(v44);
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = @"nil";
  }
  v46 = objc_msgSend_logObject(NTKParmesanFaceBundle, v41, v42, v43);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
    sub_246C2A09C((uint64_t)v45, v46);
  }

  v7[2](v7, 0);
LABEL_16:
}

+ (id)_complicationSlotDescriptors
{
  v11[2] = *MEMORY[0x263EF8340];
  v2 = NTKAllUtilitySmallFlatComplicationTypes();
  v10[0] = *MEMORY[0x263F57850];
  id v3 = NTKComplicationTypeRankedListWithDefaultTypes();
  v4 = NTKComplicationSlotDescriptor();
  v11[0] = v4;
  v10[1] = *MEMORY[0x263F57820];
  uint64_t v5 = NTKComplicationTypeRankedListWithDefaultTypes();
  id v6 = NTKComplicationSlotDescriptor();
  v11[1] = v6;
  id v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v7, (uint64_t)v11, (uint64_t)v10, 2);

  return v8;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return (id)*MEMORY[0x263F57850];
}

+ (id)_orderedComplicationSlots
{
  v5[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F57820];
  v5[0] = *MEMORY[0x263F57850];
  v5[1] = v2;
  id v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v5, 2);

  return v3;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, *MEMORY[0x263F57850], v5))
  {
    objc_msgSend_stringWithFormat_(NSString, v6, @"SLOT_LABEL_%@", v7, @"TOP");
  }
  else
  {
    int isEqualToString = objc_msgSend_isEqualToString_(v3, v6, *MEMORY[0x263F57820], v7);
    uint64_t v11 = @"BOTTOM";
    if (!isEqualToString) {
      uint64_t v11 = 0;
    }
    objc_msgSend_stringWithFormat_(NSString, v9, @"SLOT_LABEL_%@", v10, v11);
  uint64_t v12 = };
  uint64_t v13 = NTKClockFaceLocalizedString();

  return v13;
}

- (void)_reportAdditionalDailyConfigurationMetrics
{
  objc_msgSend_shared(NTKParmesanAnalyticsReporter, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendParmesanFaceSnapshotEvent_(v7, v5, (uint64_t)self, v6);
}

- (void)_reportAdditionalAddedToLibraryMetrics
{
  objc_msgSend_shared(NTKParmesanAnalyticsReporter, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendAddedNewParmesanFaceEvent_(v7, v5, (uint64_t)self, v6);
}

- (void)_prepareEditOptions
{
}

- (void)_cleanupEditOptions
{
}

- (id)_customEditModes
{
  uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF980], a2, v2, v3);
  objc_msgSend_addObjectsFromArray_(v5, v6, (uint64_t)&unk_26FB34F50, v7);
  uint64_t v11 = objc_msgSend_device(self, v8, v9, v10);
  int v12 = NTKShowIndicScriptNumerals();

  if (v12) {
    objc_msgSend_addObject_(v5, v13, (uint64_t)&unk_26FB35310, v14);
  }
  objc_msgSend_addObjectsFromArray_(v5, v13, (uint64_t)&unk_26FB34F68, v14);
  uint64_t v18 = objc_msgSend_copy(v5, v15, v16, v17);

  return v18;
}

- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKParmesanFace;
  return [(NTKFace *)&v4 _hasOptionsForCustomEditMode:a3];
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (unint64_t)(a3 - 10) <= 9 && ((0x23Du >> (a3 - 10)))
  {
    objc_super v4 = objc_opt_class();
  }
  else
  {
    objc_super v4 = 0;
  }
  return (Class)v4;
}

+ (id)_slotsForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 10)
  {
    uint64_t v5 = objc_msgSend__colorSlots(a1, a2, a3, (uint64_t)a4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

+ (id)_slotForAddColorsViewFrame
{
  return @"style-color";
}

+ (id)_defaultSelectedSlotForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 10)
  {
    uint64_t v5 = @"style-color";
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

+ (BOOL)_customEditModeIsRows:(int64_t)a3 forDevice:(id)a4
{
  return a3 == 12;
}

+ (BOOL)_customEditMode:(int64_t)a3 hasActionForOption:(id)a4 forDevice:(id)a5
{
  return a3 == 12;
}

- (int64_t)_customEditModeForUniqueConfiguration
{
  return 0;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v9 = a4;
  if (a3 == 10)
  {
    uint64_t v10 = objc_msgSend__selectedStyleOption(self, v6, v7, v8);
    uint64_t v14 = objc_msgSend_device(self, v11, v12, v13);
    uint64_t v16 = objc_msgSend_numberOfOptionsForSlot_style_device_(NTKParmesanColorEditOption, v15, (uint64_t)v9, v10, v14);
  }
  else
  {
    uint64_t v17 = objc_msgSend__optionClassForCustomEditMode_(self, v6, a3, v8);
    uint64_t v14 = objc_msgSend_device(self, v18, v19, v20);
    uint64_t v16 = objc_msgSend_numberOfOptionsForDevice_(v17, v21, (uint64_t)v14, v22);
  }
  unint64_t v23 = v16;

  return v23;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v11 = a5;
  if (a4 == 10)
  {
    uint64_t v12 = objc_msgSend__selectedStyleOption(self, v8, v9, v10);
    uint64_t v16 = objc_msgSend_device(self, v13, v14, v15);
    objc_msgSend_optionAtIndex_slot_style_device_(NTKParmesanColorEditOption, v17, a3, (uint64_t)v11, v12, v16);
  }
  else
  {
    uint64_t v18 = objc_msgSend__optionClassForCustomEditMode_(self, v8, a4, v10);
    uint64_t v16 = objc_msgSend_device(self, v19, v20, v21);
    objc_msgSend_optionAtIndex_forDevice_(v18, v22, a3, (uint64_t)v16);
  unint64_t v23 = };

  return v23;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a5;
  id v12 = a3;
  if (a4 == 10)
  {
    uint64_t v13 = objc_msgSend__selectedStyleOption(self, v9, v10, v11);
    uint64_t v17 = objc_msgSend_device(self, v14, v15, v16);
    uint64_t v19 = objc_msgSend_indexOfOption_slot_style_device_(NTKParmesanColorEditOption, v18, (uint64_t)v12, (uint64_t)v8, v13, v17);
  }
  else
  {
    uint64_t v20 = objc_msgSend__optionClassForCustomEditMode_(self, v9, a4, v11);
    uint64_t v17 = objc_msgSend_device(self, v21, v22, v23);
    uint64_t v19 = objc_msgSend_indexOfOption_forDevice_(v20, v24, (uint64_t)v12, (uint64_t)v17);
  }
  unint64_t v25 = v19;

  return v25;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  uint64_t v13 = objc_msgSend_device(self, v7, v8, v9);
  uint64_t v14 = 0;
  switch(a3)
  {
    case 10:
      uint64_t v15 = objc_msgSend__selectedStyleOption(self, v10, v11, v12);
      uint64_t v17 = objc_msgSend_defaultOptionForSlot_style_device_(NTKParmesanColorEditOption, v16, (uint64_t)v6, v15, v13);
      goto LABEL_7;
    case 12:
      uint64_t v17 = objc_msgSend_optionWithContent_device_(NTKParmesanContentEditOption, v10, 0, (uint64_t)v13);
      goto LABEL_7;
    case 13:
      uint64_t v17 = objc_msgSend_optionWithTypeface_device_(NTKParmesanTypefaceEditOption, v10, 0, (uint64_t)v13);
      goto LABEL_7;
    case 14:
      uint64_t v17 = objc_msgSend_optionWithTime_device_(NTKParmesanTimeEditOption, v10, 0, (uint64_t)v13);
      goto LABEL_7;
    case 15:
      uint64_t v17 = objc_msgSend_optionWithStyle_device_(NTKParmesanStyleEditOption, v10, 0, (uint64_t)v13);
LABEL_7:
      uint64_t v14 = (void *)v17;
      break;
    case 19:
      uint64_t v19 = objc_msgSend_device(self, v10, v11, v12);
      uint64_t v14 = objc_msgSend_defaultOptionForDevice_(NTKParmesanNumeralsEditOption, v20, (uint64_t)v19, v21);

      break;
    default:
      break;
  }

  return v14;
}

- (BOOL)shouldColorEditModeBeAtTop
{
  return 0;
}

+ (BOOL)_customEditModeDeterminesDynamicSections:(int64_t)a3 forDevice:(id)a4
{
  return a3 == 15;
}

- (int64_t)_dynamicEditMode
{
  return 10;
}

- (unint64_t)_numberOfDynamicSections
{
  uint64_t v2 = kParmesanColorSlots((uint64_t)self, a2);
  unint64_t v6 = objc_msgSend_count(v2, v3, v4, v5);

  return v6;
}

- (id)_localizedNameForDynamicSectionCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  uint64_t v9 = v6;
  if (a3 == 10)
  {
    if (objc_msgSend_isEqualToString_(v6, v7, @"time-color", v8))
    {
      objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v10, @"PARMESAN_EDIT_MODE_LABEL_TIME_COLOR", @"[Parmesan] Custom name for time color slot");
      uint64_t v13 = LABEL_6:;
      goto LABEL_8;
    }
    if (objc_msgSend_isEqualToString_(v9, v10, @"style-color", v11))
    {
      objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v12, @"PARMESAN_EDIT_MODE_LABEL_STYLE_COLOR", @"[Parmesan] Custom name for style color slot");
      goto LABEL_6;
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)NTKParmesanFace;
  uint64_t v13 = [(NTKFace *)&v16 _localizedNameForDynamicSectionCustomEditMode:a3 slot:v9];
LABEL_8:
  uint64_t v14 = (void *)v13;

  return v14;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  id v7 = a4;
  switch(a3)
  {
    case 12:
      objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v6, @"PARMESAN_EDIT_MODE_LABEL_CONTENT", @"[Parmesan] Custom name for content edit mode");
      goto LABEL_7;
    case 13:
      objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v6, @"PARMESAN_EDIT_MODE_LABEL_TYPEFACE", @"[Parmesan] Custom name for typeface edit mode");
      goto LABEL_7;
    case 14:
      objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v6, @"PARMESAN_EDIT_MODE_LABEL_POSITION", @"[Parmesan] Custom name for position edit mode");
      goto LABEL_7;
    case 19:
      objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v6, @"PARMESAN_EDIT_MODE_LABEL_NUMERALS", @"[Parmesan] Custom name for numerals edit mode");
      uint64_t v8 = LABEL_7:;
      break;
    default:
      v11.receiver = a1;
      v11.super_class = (Class)&OBJC_METACLASS___NTKParmesanFace;
      uint64_t v8 = objc_msgSendSuper2(&v11, sel__localizedNameOverrideForCustomEditMode_forDevice_, a3, v7);
      break;
  }
  uint64_t v9 = (void *)v8;

  return v9;
}

- (id)editOptionsThatHideEditModes
{
  v12[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_device(self, a2, v2, v3);
  id v7 = objc_msgSend_partiallySupportedEditOptionsForDevice_(NTKParmesanNumeralsEditOption, v5, (uint64_t)v4, v6);

  v11[0] = &unk_26FB352F8;
  v11[1] = &unk_26FB352E0;
  v12[0] = v7;
  v12[1] = v7;
  uint64_t v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v8, (uint64_t)v12, (uint64_t)v11, 2);

  return v9;
}

- (id)localizedExplanationMessageForDisabledEditMode:(int64_t)a3
{
  if (a3 == 14)
  {
    objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, a2, @"PARMESAN_TIME_SIZE_CANNOT_BE_CHANGED_EXPLANATION", @"Time size cannot be changed explanation");
    goto LABEL_5;
  }
  if (a3 == 13)
  {
    objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, a2, @"PARMESAN_TIME_FONT_CANNOT_BE_CHANGED_EXPLANATION", @"Time font cannot be changed explanation");
LABEL_5:
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  uint64_t v3 = &stru_26FB23210;
LABEL_7:

  return v3;
}

- (void)_commonInit
{
  v9.receiver = self;
  v9.super_class = (Class)NTKParmesanFace;
  [(NTKFace *)&v9 _commonInit];
  uint64_t v3 = [NTKParmesanPigmentProviderCoordinator alloc];
  uint64_t v6 = (NTKParmesanPigmentProviderCoordinator *)objc_msgSend_initWithSelectedStyle_(v3, v4, 0, v5);
  pigmentProviderCoordinator = self->_pigmentProviderCoordinator;
  self->_pigmentProviderCoordinator = v6;

  cachedGalleryName = self->_cachedGalleryName;
  self->_cachedGalleryName = 0;
}

- (BOOL)_allowsEditing
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)NTKParmesanFace;
  uint64_t v4 = [(NTKFace *)&v16 copyWithZone:a3];
  uint64_t v8 = objc_msgSend_copy(self->_cachedGalleryName, v5, v6, v7);
  objc_super v9 = (void *)v4[20];
  v4[20] = v8;

  uint64_t v13 = objc_msgSend_copy(self->_cachedResourceDirectorySnapshotKey, v10, v11, v12);
  uint64_t v14 = (void *)v4[21];
  v4[21] = v13;

  return v4;
}

- (void)_updateForResourceDirectoryChange:(id)a3
{
  cachedResourceDirectorySnapshotKey = self->_cachedResourceDirectorySnapshotKey;
  self->_cachedResourceDirectorySnapshotKey = 0;
}

- (id)_resourceDirectorySnapshotKey
{
  uint64_t v8 = objc_msgSend__storedPlaceholderName(self, a2, v2, v3);
  if (v8)
  {
    objc_super v9 = 0;
    goto LABEL_11;
  }
  uint64_t v10 = objc_msgSend_resourceDirectory(self, v5, v6, v7);
  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v14 = (void *)v10;
  uint64_t v15 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v11, v12, v13);
  uint64_t v19 = objc_msgSend_resourceDirectory(self, v16, v17, v18);
  int v22 = objc_msgSend_fileExistsAtPath_(v15, v20, (uint64_t)v19, v21);

  if (v22)
  {
    cachedResourceDirectorySnapshotKey = self->_cachedResourceDirectorySnapshotKey;
    if (cachedResourceDirectorySnapshotKey)
    {
      objc_super v9 = cachedResourceDirectorySnapshotKey;
      goto LABEL_11;
    }
    v37 = objc_msgSend_resourceDirectory(self, v23, v24, v25);
    uint64_t v40 = objc_msgSend_readerForResourceDirectory_(NTKParmesanAssetReader, v38, (uint64_t)v37, v39);

    uint64_t v44 = objc_msgSend_version(v40, v41, v42, v43);
    if (v44 == 2)
    {
      v48 = objc_msgSend_firstObject(v40, v45, v46, v47);
      v50 = objc_msgSend_selectedOptionForCustomEditMode_slot_(self, v49, 14, 0);
      objc_msgSend_uniqueSnapshotIdentifierForTimeOption_(v48, v51, (uint64_t)v50, v52);
      v53 = (NSString *)objc_claimAutoreleasedReturnValue();
      v54 = self->_cachedResourceDirectorySnapshotKey;
      self->_cachedResourceDirectorySnapshotKey = v53;
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v45, @"version-outdated-%ld", v47, v44);
      v55 = (NSString *)objc_claimAutoreleasedReturnValue();
      v48 = self->_cachedResourceDirectorySnapshotKey;
      self->_cachedResourceDirectorySnapshotKey = v55;
    }

    objc_super v9 = self->_cachedResourceDirectorySnapshotKey;
    if (v9) {
      goto LABEL_11;
    }
  }
  else
  {
LABEL_7:
    v27 = self->_cachedResourceDirectorySnapshotKey;
    self->_cachedResourceDirectorySnapshotKey = 0;
  }
  uint64_t v31 = objc_msgSend_currentDevice(MEMORY[0x263EFD180], v28, v29, v30);
  int isTinker = objc_msgSend_isTinker(v31, v32, v33, v34);

  if (isTinker) {
    objc_super v9 = @"T";
  }
  else {
    objc_super v9 = 0;
  }
LABEL_11:

  return v9;
}

- (id)_faceDescriptionKey
{
  if (NTKPeerDeviceHandlesWideLoads()) {
    return @"FACE_PARMESAN_DESCRIPTION_24";
  }
  else {
    return @"FACE_PARMESAN_DESCRIPTION_06";
  }
}

- (id)faceSharingName
{
  return (id)objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, a2, @"FACE_PARMESAN_IN_TITLE_CASE", @"Parmesan");
}

- (id)_faceDescription
{
  uint64_t v4 = objc_msgSend__faceDescriptionKey(self, a2, v2, v3);
  uint64_t v6 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v5, (uint64_t)v4, (uint64_t)v4);

  return v6;
}

- (id)galleryName
{
  cachedGalleryName = self->_cachedGalleryName;
  if (cachedGalleryName)
  {
    uint64_t v5 = cachedGalleryName;
  }
  else
  {
    uint64_t v7 = objc_msgSend_resourceDirectory(self, a2, v2, v3);
    uint64_t v10 = objc_msgSend_readerForResourceDirectory_(NTKParmesanAssetReader, v8, (uint64_t)v7, v9);
    if (objc_msgSend_isShuffle(v10, v11, v12, v13))
    {
      uint64_t v17 = objc_msgSend_shuffleSelection(v10, v14, v15, v16);
      uint64_t v21 = objc_msgSend_shuffleName(v17, v18, v19, v20);
      uint64_t v24 = objc_msgSend_stringByAppendingString_(v21, v22, @" ", v23);
      v26 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v25, @"PARMESAN_SHUFFLE", @"Shuffle");
      objc_msgSend_stringByAppendingString_(v24, v27, (uint64_t)v26, v28);
      uint64_t v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      uint64_t v30 = self->_cachedGalleryName;
      self->_cachedGalleryName = v29;

      uint64_t v5 = self->_cachedGalleryName;
    }
    else
    {
      v32.receiver = self;
      v32.super_class = (Class)NTKParmesanFace;
      uint64_t v5 = [(NTKFace *)&v32 galleryName];
    }
  }

  return v5;
}

- (id)companionGalleryName
{
  return (id)((uint64_t (*)(NTKParmesanFace *, char *))MEMORY[0x270F9A6D0])(self, sel_galleryName);
}

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_deviceCategory(v3, v4, v5, v6);
  char v8 = _os_feature_enabled_impl();
  id v9 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v12 = objc_msgSend_initWithUUIDString_(v9, v10, @"DAB81146-4105-445B-94AD-14033A199AC4", v11);
  char v15 = objc_msgSend_supportsCapability_(v3, v13, (uint64_t)v12, v14);

  id v16 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v19 = objc_msgSend_initWithUUIDString_(v16, v17, @"F27862F8-5179-4DB0-9F89-179EA7CB4011", v18);
  char v22 = objc_msgSend_supportsCapability_(v3, v20, (uint64_t)v19, v21);

  if (v7 == 1) {
    char v23 = 0;
  }
  else {
    char v23 = v8;
  }
  return v23 & v15 & v22 ^ 1;
}

- (id)albumFaceContent
{
  return 0;
}

- (id)trackedPhotosContent
{
  id v3 = objc_msgSend_selectedOptionForCustomEditMode_slot_(self, a2, 12, 0);
  uint64_t v10 = 0;
  if (!objc_msgSend_content(v3, v4, v5, v6))
  {
    uint64_t v11 = objc_msgSend_resourceDirectory(self, v7, v8, v9);
    uint64_t v14 = objc_msgSend_readerForResourceDirectory_(NTKParmesanAssetReader, v12, (uint64_t)v11, v13);

    id v15 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v19 = objc_msgSend_uuidString(v14, v16, v17, v18);
    char v22 = objc_msgSend_initWithUUIDString_(v15, v20, (uint64_t)v19, v21);

    LODWORD(v19) = objc_msgSend_isShuffle(v14, v23, v24, v25);
    id v26 = objc_alloc(MEMORY[0x263F57AA8]);
    if (v19) {
      uint64_t v29 = objc_msgSend_initWithShuffleUUID_(v26, v27, (uint64_t)v22, v28);
    }
    else {
      uint64_t v29 = objc_msgSend_initWithAlbumUUID_(v26, v27, (uint64_t)v22, v28);
    }
    uint64_t v10 = (void *)v29;
  }

  return v10;
}

- (unint64_t)_selectedStyleOption
{
  uint64_t v2 = objc_msgSend_selectedOptionForCustomEditMode_slot_(self, a2, 15, 0);
  uint64_t v6 = v2;
  if (v2) {
    unint64_t v7 = objc_msgSend_style(v2, v3, v4, v5);
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)supportsPigmentEditOption
{
  return 1;
}

+ (id)pigmentFaceDomain
{
  return @"plain";
}

+ (id)additionalPigmentFaceDomains
{
  v4[4] = *MEMORY[0x263EF8340];
  v4[0] = @"time";
  v4[1] = @"regular";
  v4[2] = @"duotone";
  v4[3] = @"tritone";
  uint64_t v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 4);

  return v2;
}

- (id)pigmentOptionProvider
{
  return self->_pigmentProviderCoordinator;
}

- (void)_noteOptionChangedFrom:(id)a3 to:(id)a4 forCustomEditMode:(int64_t)a5 slot:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v61.receiver = self;
  v61.super_class = (Class)NTKParmesanFace;
  [(NTKFace *)&v61 _noteOptionChangedFrom:a3 to:v10 forCustomEditMode:a5 slot:v11];
  if (objc_msgSend_deviceSupportsPigmentEditOption(self, v12, v13, v14))
  {
    if (a5 == 15)
    {
      uint64_t v38 = objc_msgSend_style(v10, v15, v16, v17);
      objc_msgSend_setSelectedStyle_(self->_pigmentProviderCoordinator, v39, v38, v40);
      objc_msgSend__notifyObserversOptionsDidChangeForEditMode_(self, v41, 10, v42);
      uint64_t v24 = @"style-color";
      v45 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v43, v38, v44);
      v49 = objc_msgSend_stringValue(v45, v46, v47, v48);
      objc_super v32 = objc_msgSend_customDataForKey_(self, v50, (uint64_t)v49, v51);

      if (!v32
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_msgSend_pigmentNamed_(MEMORY[0x263F57A50], v52, (uint64_t)v32, v53),
            (uint64_t v29 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v54 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v52, v38, v53);
        uint64_t v29 = objc_msgSend__selectDefaultPigmentForStyle_(self, v55, (uint64_t)v54, v56);
      }
      v57 = objc_msgSend_selectedOptionForCustomEditMode_slot_(self, v52, 10, (uint64_t)v24);
      v36 = v57;
      if (v29 && (objc_msgSend_isEqual_(v57, v58, (uint64_t)v29, v59) & 1) == 0) {
        objc_msgSend_selectOption_forCustomEditMode_slot_(self, v60, (uint64_t)v29, 10, v24);
      }
      goto LABEL_14;
    }
    if (a5 == 10 && objc_msgSend_isEqualToString_(v11, v15, @"style-color", v17))
    {
      objc_msgSend_pigmentEditOption(v10, v18, v19, v20);
      uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v25 = objc_msgSend__selectedStyleOption(self, v21, v22, v23);
      uint64_t v29 = objc_msgSend_JSONObjectRepresentation(v24, v26, v27, v28);
      objc_super v32 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v30, v25, v31);
      v36 = objc_msgSend_stringValue(v32, v33, v34, v35);
      objc_msgSend_setCustomData_forKey_(self, v37, (uint64_t)v29, (uint64_t)v36);
LABEL_14:

      goto LABEL_15;
    }
  }
LABEL_16:
}

- (void)applyDefaultConfiguration
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)NTKParmesanFace;
  [(NTKFace *)&v23 applyDefaultConfiguration];
  uint64_t v6 = objc_msgSend_device(self, v3, v4, v5);
  uint64_t v9 = objc_msgSend__orderedValuesForDevice_(NTKParmesanStyleEditOption, v7, (uint64_t)v6, v8);

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v9;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v19, (uint64_t)v24, 16);
  if (v12)
  {
    uint64_t v15 = v12;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v10);
        }
        id v18 = (id)objc_msgSend__selectDefaultPigmentForStyle_(self, v13, *(void *)(*((void *)&v19 + 1) + 8 * v17++), v14, (void)v19);
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v19, (uint64_t)v24, 16);
    }
    while (v15);
  }
}

- (id)_selectDefaultPigmentForStyle:(id)a3
{
  pigmentProviderCoordinator = self->_pigmentProviderCoordinator;
  id v5 = a3;
  unsigned int v9 = objc_msgSend_unsignedIntValue(v5, v6, v7, v8);
  id v11 = objc_msgSend_providerForSlot_style_(pigmentProviderCoordinator, v10, @"style-color", v9);
  uint64_t v14 = objc_msgSend_defaultColorOptionForSlot_(v11, v12, 0, v13);
  id v18 = objc_msgSend_JSONObjectRepresentation(v14, v15, v16, v17);
  long long v22 = objc_msgSend_stringValue(v5, v19, v20, v21);

  objc_msgSend_setCustomData_forKey_(self, v23, (uint64_t)v18, (uint64_t)v22);

  return v14;
}

- (BOOL)applyConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend__selectedStyleOption(self, v5, v6, v7);
  objc_msgSend_setSelectedStyle_(self->_pigmentProviderCoordinator, v9, v8, v10);
  v12.receiver = self;
  v12.super_class = (Class)NTKParmesanFace;
  LOBYTE(self) = [(NTKFace *)&v12 applyConfiguration:v4];

  return (char)self;
}

- (BOOL)isValidConfigurationToAddToLibrary
{
  uint64_t v6 = objc_msgSend__storedPlaceholderName(self, a2, v2, v3);
  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v8 = objc_msgSend_selectedOptionForCustomEditMode_slot_(self, v5, 12, 0);
    BOOL v7 = objc_msgSend_content(v8, v9, v10, v11) != 2;
  }
  return v7;
}

- (id)_storedPlaceholderName
{
  id v5 = objc_msgSend_placeholderCustomDataKey(NTKParmesanGalleryPlaceholderDataSource, a2, v2, v3);
  uint64_t v8 = objc_msgSend_customDataForKey_(self, v6, (uint64_t)v5, v7);
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

+ (id)upgradeManagerWithFace:(id)a3 forDevice:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [NTKParmesanUpgradeManager alloc];
  id v9 = objc_msgSend_initWithFace_forDevice_(v7, v8, (uint64_t)v6, (uint64_t)v5);

  return v9;
}

- (void)prepareForSharing
{
  id v5 = objc_msgSend_currentDevice(MEMORY[0x263EFD180], a2, v2, v3);
  objc_msgSend_optionWithContent_device_(NTKParmesanContentEditOption, v6, 1, (uint64_t)v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_selectOption_forCustomEditMode_slot_(self, v7, (uint64_t)v8, 12, 0);
}

- (BOOL)_createResourceDirectorySuitableForSharingAtPath:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_resourceDirectory(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_resourceDirectory(self, v11, v12, v13);
  uint64_t v17 = objc_msgSend_readerForResourceDirectory_(NTKParmesanAssetReader, v15, (uint64_t)v14, v16);

  uint64_t v21 = objc_msgSend_uuidString(v17, v18, v19, v20);

  if (v21
    && (objc_msgSend__createDynamicContentDirectoryFromReader_(self, v22, (uint64_t)v17, v23),
        uint64_t v24 = objc_claimAutoreleasedReturnValue(),
        v10,
        (uint64_t v10 = (void *)v24) == 0))
  {
    char v36 = 0;
  }
  else
  {
    uint64_t v25 = objc_opt_new();
    v40[0] = v25;
    uint64_t v27 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v26, (uint64_t)v40, 1);

    id v28 = objc_alloc(MEMORY[0x263F57A60]);
    uint64_t v31 = objc_msgSend_initWithOperations_(v28, v29, (uint64_t)v27, v30);
    char v36 = objc_msgSend_scrubDirectoryAtPath_toDestinationPath_error_(v31, v32, (uint64_t)v10, (uint64_t)v6, a4);
    if (v21)
    {
      v37 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v33, v34, v35);
      objc_msgSend_removeItemAtPath_error_(v37, v38, (uint64_t)v10, 0);
    }
  }

  return v36;
}

- (BOOL)_shouldSanitizeFaceConfigurationWhenAddingSharedFace
{
  return 1;
}

- (id)_createDynamicContentDirectoryFromReader:(id)a3
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v46 = a3;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v43 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.NanoTimeKit.parmesanGreenfield", v43);
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x2020000000;
  char v78 = 0;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  char v76 = 1;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  int v72 = 0;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = sub_246B7D680;
  v69[4] = sub_246B7D690;
  objc_msgSend_array(MEMORY[0x263EFF980], v6, v7, v8);
  id v70 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = NTKNewUniqueTeporaryResourceDirectory();
  uint64_t v13 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v10, v11, v12);
  objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v13, v14, (uint64_t)v9, 1, 0, 0);

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_246B7D7D8;
  aBlock[3] = &unk_2651FC640;
  uint64_t v15 = v5;
  v60 = v15;
  v45 = &v67;
  objc_copyWeak(&v67, &location);
  v63 = v77;
  v64 = &v73;
  v65 = v71;
  id v16 = v9;
  id v61 = v16;
  id v62 = &unk_26FB1C2E0;
  v66 = v69;
  uint64_t v17 = _Block_copy(aBlock);
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = sub_246B7DF48;
  v50[3] = &unk_2651FC690;
  id v18 = v15;
  uint64_t v51 = v18;
  objc_copyWeak(&v58, &location);
  v54 = v77;
  v55 = &v73;
  uint64_t v56 = v69;
  id v19 = v16;
  id v52 = v19;
  uint64_t v20 = v4;
  uint64_t v53 = v20;
  v57 = v71;
  uint64_t v21 = _Block_copy(v50);
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = sub_246B7E2D0;
  v47[3] = &unk_2651FC6B8;
  long long v22 = v18;
  uint64_t v48 = v22;
  v49 = v77;
  uint64_t v23 = (void (**)(void))_Block_copy(v47);
  objc_msgSend__startStreamingAssetsFromReader_updateBlock_completionBlock_(self, v24, (uint64_t)v46, (uint64_t)v17, v21);
  id v28 = objc_msgSend_logObject(NTKParmesanFaceBundle, v25, v26, v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v80 = "-[NTKParmesanFace _createDynamicContentDirectoryFromReader:]";
    _os_log_impl(&dword_246B51000, v28, OS_LOG_TYPE_DEFAULT, "%s: Start waiting....", buf, 0xCu);
  }

  dispatch_time_t v29 = dispatch_time(0, 4000000000);
  intptr_t v33 = dispatch_semaphore_wait(v20, v29);
  if (v33)
  {
    uint64_t v34 = objc_msgSend_logObject(NTKParmesanFaceBundle, v30, v31, v32, v43, &v67);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v80 = "-[NTKParmesanFace _createDynamicContentDirectoryFromReader:]";
      _os_log_impl(&dword_246B51000, v34, OS_LOG_TYPE_DEFAULT, "%s: Timed out; cancelling further streaming", buf, 0xCu);
    }

    v23[2](v23);
  }
  uint64_t v35 = objc_msgSend_logObject(NTKParmesanFaceBundle, v30, v31, v32, v43);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v80 = "-[NTKParmesanFace _createDynamicContentDirectoryFromReader:]";
    _os_log_impl(&dword_246B51000, v35, OS_LOG_TYPE_DEFAULT, "%s: And proceed!", buf, 0xCu);
  }

  if (v33 || !*((unsigned char *)v74 + 24))
  {
    uint64_t v39 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v36, v37, v38);
    objc_msgSend_removeItemAtPath_error_(v39, v40, (uint64_t)v19, 0);

    id v41 = 0;
  }
  else
  {
    id v41 = v19;
  }

  objc_destroyWeak(&v58);
  objc_destroyWeak(v45);

  objc_destroyWeak(&location);
  _Block_object_dispose(v69, 8);

  _Block_object_dispose(v71, 8);
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(v77, 8);

  return v41;
}

- (void)_startStreamingAssetsFromReader:(id)a3 updateBlock:(id)a4 completionBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  if (objc_msgSend_isShuffle(v9, v10, v11, v12))
  {
    uint64_t v13 = [_TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID alloc];
    uint64_t v14 = (void *)MEMORY[0x263EFFA08];
    id v18 = objc_msgSend_peopleIdentifiers(v9, v15, v16, v17);
    uint64_t v21 = objc_msgSend_setWithArray_(v14, v19, (uint64_t)v18, v20);
    uint64_t hasPets = objc_msgSend_hasPets(v9, v22, v23, v24);
    uint64_t hasNature = objc_msgSend_hasNature(v9, v26, v27, v28);
    uint64_t hasCityscapes = objc_msgSend_hasCityscapes(v9, v30, v31, v32);
    uint64_t v37 = objc_msgSend_uuidString(v9, v34, v35, v36);

    id v51 = (id)objc_msgSend_initWithPeople_pets_nature_cityscape_uuidString_(v13, v38, (uint64_t)v21, hasPets, hasNature, hasCityscapes, v37);
    objc_msgSend_streamAssetsInShuffle_updateBlock_completionBlock_(NTKParmesanPhotoProcessor, v39, (uint64_t)v51, (uint64_t)v8, v7);
  }
  else
  {
    uint64_t v40 = [_TtC30NTKParmesanFaceBundleCompanion10NTKAlbumID alloc];
    uint64_t v44 = objc_msgSend_assetCollectionIdentifier(v9, v41, v42, v43);
    uint64_t v48 = objc_msgSend_uuidString(v9, v45, v46, v47);

    id v51 = (id)objc_msgSend_initWithAlbum_uuidString_(v40, v49, (uint64_t)v44, (uint64_t)v48);
    objc_msgSend_streamAssetsInAlbum_updateBlock_completionBlock_(NTKParmesanPhotoProcessor, v50, (uint64_t)v51, (uint64_t)v8, v7);
  }
}

- (BOOL)_sanitizeFaceConfiguration:(id *)a3
{
  id v6 = objc_msgSend_resourceDirectory(self, a2, (uint64_t)a3, v3);
  id v9 = objc_msgSend_manifestForResourceDirectory_(NTKParmesanResourcesManifest, v7, (uint64_t)v6, v8);

  if (!v9)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v10, *MEMORY[0x263F57AD8], 1006, 0);
      BOOL v31 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    BOOL v31 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend_validateManifestWithError_(v9, v10, (uint64_t)a3, v11)) {
    goto LABEL_9;
  }
  uint64_t v15 = objc_msgSend_resourceDirectory(self, v12, v13, v14);
  id v18 = objc_msgSend_readerForResourceDirectory_(NTKParmesanAssetReader, v16, (uint64_t)v15, v17);

  uint64_t v22 = objc_msgSend_count(v18, v19, v20, v21);
  uint64_t v26 = objc_msgSend_imageList(v9, v23, v24, v25);
  uint64_t v30 = objc_msgSend_count(v26, v27, v28, v29);
  BOOL v31 = v22 == v30;

  if (a3 && v22 != v30)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v32, *MEMORY[0x263F57AE0], 2003, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v31;
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (NTKParmesanPigmentProviderCoordinator)pigmentProviderCoordinator
{
  return self->_pigmentProviderCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pigmentProviderCoordinator, 0);
  objc_storeStrong((id *)&self->_cachedResourceDirectorySnapshotKey, 0);

  objc_storeStrong((id *)&self->_cachedGalleryName, 0);
}

@end