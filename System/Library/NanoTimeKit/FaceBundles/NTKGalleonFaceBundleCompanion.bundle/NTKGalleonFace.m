@interface NTKGalleonFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)_richComplicationSlotsForDevice:(id)a3;
+ (id)pigmentFaceDomain;
+ (int64_t)_complicationFontStyleForSlot:(id)a3;
- (BOOL)compassDefault;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_complicationSlotDescriptors;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (id)nightModeConfiguration;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)setCompassDefault:(BOOL)a3;
@end

@implementation NTKGalleonFace

- (id)faceSharingName
{
  return (id)objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, a2, @"FACE_STYLE_GALLEON_IN_TITLE_CASE", @"Galleon");
}

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_deviceCategory(v3, v4, v5, v6) == 4)
  {
    id v7 = objc_alloc(MEMORY[0x263F08C38]);
    v10 = objc_msgSend_initWithUUIDString_(v7, v8, @"157666B2-886F-4DBB-BFEE-669DE191D8BB", v9);
    int v13 = objc_msgSend_supportsCapability_(v3, v11, (uint64_t)v10, v12) ^ 1;
  }
  else
  {
    LOBYTE(v13) = 1;
  }

  return v13;
}

- (id)_complicationSlotDescriptors
{
  v43[1] = *MEMORY[0x263EF8340];
  v37 = NTKAllSimpleTextComplicationTypes();
  uint64_t v6 = objc_msgSend_indexSet(MEMORY[0x263F089C8], v3, v4, v5);
  id v7 = NTKAllSignatureCircularTypes();
  objc_msgSend_addIndexes_(v6, v8, (uint64_t)v7, v9);

  v10 = NTKAllSignatureCornerTypes();
  v14 = objc_msgSend_device(self, v11, v12, v13);
  int isTinker = objc_msgSend_isTinker(v14, v15, v16, v17);
  v20 = &unk_26FB19380;
  if (isTinker) {
    v20 = &unk_26FB19368;
  }
  v43[0] = v20;
  v40 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v19, (uint64_t)v43, 1);

  v39 = NTKComplicationTypeRankedListWithDefaultTypes();
  v38 = NTKComplicationTypeRankedListWithDefaultTypes();
  v36 = NTKComplicationTypeRankedListWithDefaultTypes();
  v34 = NTKComplicationTypeRankedListWithDefaultTypes();
  v31 = NTKComplicationTypeRankedListWithDefaultTypes();
  v32 = NTKComplicationTypeRankedListWithDefaultTypes();
  v33 = NTKComplicationTypeRankedListWithDefaultTypes();
  v41[0] = *MEMORY[0x263F57808];
  v35 = NTKComplicationSlotDescriptor();
  v42[0] = v35;
  v41[1] = *MEMORY[0x263F57810];
  v21 = NTKComplicationSlotDescriptor();
  v42[1] = v21;
  v41[2] = *MEMORY[0x263F57818];
  v22 = NTKComplicationSlotDescriptor();
  v42[2] = v22;
  v41[3] = *MEMORY[0x263F57848];
  v23 = NTKComplicationSlotDescriptor();
  v42[3] = v23;
  v41[4] = *MEMORY[0x263F57858];
  v24 = NTKComplicationSlotDescriptor();
  v42[4] = v24;
  v41[5] = *MEMORY[0x263F57860];
  v25 = NTKComplicationSlotDescriptor();
  v42[5] = v25;
  v41[6] = *MEMORY[0x263F57830];
  v26 = NTKComplicationSlotDescriptor();
  v42[6] = v26;
  v41[7] = *MEMORY[0x263F57838];
  v27 = NTKComplicationSlotDescriptor();
  v42[7] = v27;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)v42, (uint64_t)v41, 8);
  id v30 = (id)objc_claimAutoreleasedReturnValue();

  return v30;
}

+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_isEqualToString_(v5, v7, *MEMORY[0x263F57858], v8))
  {
    v11 = (uint64_t *)MEMORY[0x263F577C8];
LABEL_8:
    v15 = objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v9, *v11, *MEMORY[0x263F577D0], 0);
    goto LABEL_10;
  }
  if (objc_msgSend_isEqualToString_(v5, v9, *MEMORY[0x263F57808], v10))
  {
    if ((objc_msgSend_isTinker(v6, v12, v13, v14) & 1) == 0)
    {
      v11 = (uint64_t *)MEMORY[0x263F577F0];
      goto LABEL_8;
    }
  }
  else if (objc_msgSend_isEqualToString_(v5, v12, *MEMORY[0x263F57818], v14))
  {
    v11 = (uint64_t *)MEMORY[0x263F577E8];
    goto LABEL_8;
  }
  v15 = 0;
LABEL_10:

  return v15;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return (id)*MEMORY[0x263F57858];
}

+ (id)_orderedComplicationSlots
{
  v8[8] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F57860];
  v8[0] = *MEMORY[0x263F57858];
  v8[1] = v2;
  uint64_t v3 = *MEMORY[0x263F57838];
  v8[2] = *MEMORY[0x263F57830];
  v8[3] = v3;
  uint64_t v4 = *MEMORY[0x263F57808];
  v8[4] = *MEMORY[0x263F57848];
  v8[5] = v4;
  uint64_t v5 = *MEMORY[0x263F57818];
  v8[6] = *MEMORY[0x263F57810];
  v8[7] = v5;
  id v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v8, 8);

  return v6;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  v9[8] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F57860];
  v9[0] = *MEMORY[0x263F57858];
  v9[1] = v3;
  uint64_t v4 = *MEMORY[0x263F57838];
  v9[2] = *MEMORY[0x263F57830];
  v9[3] = v4;
  uint64_t v5 = *MEMORY[0x263F57808];
  v9[4] = *MEMORY[0x263F57848];
  v9[5] = v5;
  uint64_t v6 = *MEMORY[0x263F57818];
  v9[6] = *MEMORY[0x263F57810];
  v9[7] = v6;
  id v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v9, 8);

  return v7;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isEqualToString_(v4, v5, *MEMORY[0x263F57848], v6))
  {
    objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v7, @"GALLEON_SLOT_LABEL_SUBDIAL_TOP", @"Sub-dial Top");
    uint64_t v14 = LABEL_9:;
    goto LABEL_10;
  }
  if (objc_msgSend_isEqualToString_(v4, v7, *MEMORY[0x263F57808], v8))
  {
    objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v9, @"GALLEON_SLOT_LABEL_1", @"Slot 1");
    goto LABEL_9;
  }
  if (objc_msgSend_isEqualToString_(v4, v9, *MEMORY[0x263F57810], v10))
  {
    objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v11, @"GALLEON_SLOT_LABEL_2", @"Slot 2");
    goto LABEL_9;
  }
  if (objc_msgSend_isEqualToString_(v4, v11, *MEMORY[0x263F57818], v12))
  {
    objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v13, @"GALLEON_SLOT_LABEL_3", @"Slot 3");
    goto LABEL_9;
  }
  v17.receiver = self;
  v17.super_class = (Class)NTKGalleonFace;
  uint64_t v14 = [(NTKFace *)&v17 _localizedNameForComplicationSlot:v4];
LABEL_10:
  v15 = (void *)v14;

  return v15;
}

+ (int64_t)_complicationFontStyleForSlot:(id)a3
{
  return 2;
}

- (id)_customEditModes
{
  return &unk_26FB198A8;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  uint64_t v6 = objc_msgSend_device(self, a2, a3, (uint64_t)a4);
  switch(a3)
  {
    case 11:
      uint64_t v9 = objc_msgSend_optionWithGalleonTimeMode_forDevice_(NTKGalleonTimeModeEditOption, v5, 1, (uint64_t)v6);
      goto LABEL_7;
    case 18:
      uint64_t v9 = objc_msgSend_optionWithGalleonNightMode_forDevice_(NTKGalleonNightModeEditOption, v5, 2, (uint64_t)v6);
      goto LABEL_7;
    case 12:
      unsigned int v7 = NTKHasRegionalGeoRestrictions();
      uint64_t v9 = objc_msgSend_optionWithGalleonBezelStyle_forDevice_(NTKGalleonBezelEditOption, v8, v7, (uint64_t)v6);
LABEL_7:
      uint64_t v10 = (void *)v9;
      goto LABEL_9;
  }
  uint64_t v10 = 0;
LABEL_9:

  return v10;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  uint64_t v5 = objc_msgSend__optionClassForCustomEditMode_(self, a2, a3, (uint64_t)a4);
  uint64_t v9 = objc_msgSend_device(self, v6, v7, v8);
  unint64_t v12 = objc_msgSend_numberOfOptionsForDevice_(v5, v10, (uint64_t)v9, v11);

  return v12;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  uint64_t v7 = objc_msgSend__optionClassForCustomEditMode_(self, a2, a4, a4, a5);
  uint64_t v11 = objc_msgSend_device(self, v8, v9, v10);
  uint64_t v13 = objc_msgSend_optionAtIndex_forDevice_(v7, v12, a3, (uint64_t)v11);

  return v13;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v10 = objc_msgSend__optionClassForCustomEditMode_(self, v8, a4, v9);
  uint64_t v14 = objc_msgSend_device(self, v11, v12, v13);
  unint64_t v16 = objc_msgSend_indexOfOption_forDevice_(v10, v15, (uint64_t)v7, (uint64_t)v14);

  return v16;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 18 || a3 == 12 || a3 == 11)
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
  id v8 = a4;
  switch(a3)
  {
    case 18:
      uint64_t v9 = objc_msgSend_stringByAppendingString_(@"EDIT_MODE_LABEL_NIGHT", v6, @"_COMPANION", v7);
      uint64_t v10 = NTKCompanionClockFaceLocalizedString();
LABEL_8:
      uint64_t v12 = (void *)v10;

      goto LABEL_10;
    case 12:
      objc_msgSend_stringByAppendingString_(@"EDIT_MODE_LABEL_GALLEON_CONTENT", v6, @"_COMPANION", v7);
      goto LABEL_7;
    case 11:
      objc_msgSend_stringByAppendingString_(@"EDIT_MODE_LABEL_GALLEON_DENSITY", v6, @"_COMPANION", v7);
      uint64_t v9 = LABEL_7:;
      uint64_t v10 = objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v11, (uint64_t)v9, @"Galleon custom edit mode name");
      goto LABEL_8;
  }
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___NTKGalleonFace;
  uint64_t v12 = objc_msgSendSuper2(&v14, sel__localizedNameOverrideForCustomEditMode_forDevice_, a3, v8);
LABEL_10:

  return v12;
}

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_GALLEON_DESCRIPTION";
}

- (id)_faceDescription
{
  id v4 = objc_msgSend__faceDescriptionKey(self, a2, v2, v3);
  uint64_t v6 = objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v5, (uint64_t)v4, (uint64_t)&stru_26FB12890);

  return v6;
}

- (id)nightModeConfiguration
{
  v11.receiver = self;
  v11.super_class = (Class)NTKGalleonFace;
  uint64_t v3 = [(NTKFace *)&v11 nightModeConfiguration];
  uint64_t v5 = objc_msgSend_selectedOptionForCustomEditMode_slot_(self, v4, 18, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_msgSend_analyticsKey(v5, v6, v7, v8);

    uint64_t v3 = (void *)v9;
  }

  return v3;
}

+ (id)pigmentFaceDomain
{
  return @"galleon";
}

- (BOOL)compassDefault
{
  return self->_compassDefault;
}

- (void)setCompassDefault:(BOOL)a3
{
  self->_compassDefault = a3;
}

@end