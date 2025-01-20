@interface NTKFoghornFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_depthInitialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4;
+ (id)_elevationInitialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4;
+ (id)_harmoniaInitialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)_secondsInitialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4;
+ (id)pigmentFaceDomain;
+ (int64_t)_complicationFontStyleForSlot:(id)a3;
+ (void)_applyInitialDefaultComplicationsForBezelStyle:(int64_t)a3 toFace:(id)a4 forDevice:(id)a5;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (id)nightModeConfiguration;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKFoghornFace

- (id)faceSharingName
{
  return (id)objc_msgSend_localizedStringForKey_comment_(NTKFoghornFaceBundle, a2, @"FOGHORN_FACE_NAME_IN_TITLE_CASE", (uint64_t)&stru_26FB0CCF0);
}

- (int64_t)timeStyle
{
  return 1;
}

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl() && objc_msgSend_deviceCategory(v3, v4, v5, v6) == 4)
  {
    id v7 = objc_alloc(MEMORY[0x263F08C38]);
    v10 = objc_msgSend_initWithUUIDString_(v7, v8, @"E7B1CD81-445C-4840-9F24-3A32B510B6A1", v9);
    int v13 = objc_msgSend_supportsCapability_(v3, v11, (uint64_t)v10, v12) ^ 1;
  }
  else
  {
    LOBYTE(v13) = 1;
  }

  return v13;
}

+ (id)_complicationSlotDescriptors
{
  v20[7] = *MEMORY[0x263EF8340];
  v19[0] = *MEMORY[0x263F57858];
  v18 = NTKAllSignatureCircularTypes();
  v17 = NTKComplicationSlotDescriptor();
  v20[0] = v17;
  v19[1] = *MEMORY[0x263F57850];
  v16 = NTKAllSignatureCircularTypes();
  v15 = NTKComplicationSlotDescriptor();
  v20[1] = v15;
  v19[2] = *MEMORY[0x263F57860];
  v14 = NTKAllSignatureCircularTypes();
  v2 = NTKComplicationSlotDescriptor();
  v20[2] = v2;
  v19[3] = *MEMORY[0x263F57840];
  id v3 = NTKAllSignatureRectangularTypes();
  v4 = NTKComplicationSlotDescriptor();
  v20[3] = v4;
  v19[4] = *MEMORY[0x263F57830];
  uint64_t v5 = NTKAllSignatureCircularTypes();
  uint64_t v6 = NTKComplicationSlotDescriptor();
  v20[4] = v6;
  v19[5] = *MEMORY[0x263F57828];
  id v7 = NTKAllSignatureCircularTypes();
  v8 = NTKComplicationSlotDescriptor();
  v20[5] = v8;
  v19[6] = *MEMORY[0x263F57838];
  uint64_t v9 = NTKAllSignatureCircularTypes();
  v10 = NTKComplicationSlotDescriptor();
  v20[6] = v10;
  uint64_t v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)v20, (uint64_t)v19, 7);

  return v12;
}

+ (id)_depthInitialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_isEqualToString_(v5, v7, *MEMORY[0x263F57858], v8))
  {
    objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v9, 43, v10);
    uint64_t v11 = LABEL_3:;
LABEL_4:
    id v12 = (id)v11;
    goto LABEL_16;
  }
  if (objc_msgSend_isEqualToString_(v5, v9, *MEMORY[0x263F57850], v10))
  {
    objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v13, *MEMORY[0x263F57800], *MEMORY[0x263F577D0], 0);
    goto LABEL_9;
  }
  if (objc_msgSend_isEqualToString_(v5, v13, *MEMORY[0x263F57860], v14))
  {
    objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v15, @"com.apple.weather.conditions", @"com.apple.weather.watchapp", 0);
    v17 = LABEL_9:;
    id v12 = 0;
    if (objc_msgSend_supportsComplicationFamily_forDevice_(v17, v18, 10, (uint64_t)v6)) {
      id v12 = v17;
    }
LABEL_15:

    goto LABEL_16;
  }
  if (objc_msgSend_isEqualToString_(v5, v15, *MEMORY[0x263F57840], v16))
  {
    id v21 = objc_alloc(MEMORY[0x263EFD238]);
    v17 = objc_msgSend_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_(v21, v22, @"com.apple.weather.watchapp.widgets", @"com.apple.weather.watchapp", @"com.apple.weather.widget.humidity", 0);
    v25 = objc_msgSend_complicationWithDescriptor_(MEMORY[0x263F57AD0], v23, (uint64_t)v17, v24);
    id v12 = 0;
    if (objc_msgSend_supportsComplicationFamily_forDevice_(v25, v26, 11, (uint64_t)v6)) {
      id v12 = v25;
    }

    goto LABEL_15;
  }
  if (objc_msgSend_isEqualToString_(v5, v19, *MEMORY[0x263F57830], v20))
  {
    uint64_t v11 = objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v28, @"com.apple.Depth.temperature", @"com.apple.Depth", 0);
    goto LABEL_4;
  }
  if (objc_msgSend_isEqualToString_(v5, v28, *MEMORY[0x263F57828], v29))
  {
    objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v30, 44, v31);
    goto LABEL_3;
  }
  if (objc_msgSend_isEqualToString_(v5, v30, *MEMORY[0x263F57838], v31))
  {
    objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v32, 10, v33);
    goto LABEL_3;
  }
  id v12 = 0;
LABEL_16:

  return v12;
}

+ (id)_elevationInitialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_isEqualToString_(v5, v7, *MEMORY[0x263F57858], v8))
  {
    objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v9, 10, v10);
LABEL_3:
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (objc_msgSend_isEqualToString_(v5, v9, *MEMORY[0x263F57850], v10))
  {
    objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v12, *MEMORY[0x263F577E8], *MEMORY[0x263F577D0], 0);
    uint64_t v16 = LABEL_8:;
    int v18 = objc_msgSend_supportsComplicationFamily_forDevice_(v16, v17, 10, (uint64_t)v6);
LABEL_9:
    id v11 = 0;
    if (v18) {
      id v11 = v16;
    }

    goto LABEL_12;
  }
  if (objc_msgSend_isEqualToString_(v5, v12, *MEMORY[0x263F57860], v13))
  {
    objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v14, *MEMORY[0x263F57800], *MEMORY[0x263F577D0], 0);
    goto LABEL_8;
  }
  if (objc_msgSend_isEqualToString_(v5, v14, *MEMORY[0x263F57840], v15))
  {
    uint64_t v16 = objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v20, *MEMORY[0x263F577D8], *MEMORY[0x263F577D0], 0);
    int v18 = objc_msgSend_supportsComplicationFamily_forDevice_(v16, v22, 11, (uint64_t)v6);
    goto LABEL_9;
  }
  if (objc_msgSend_isEqualToString_(v5, v20, *MEMORY[0x263F57830], v21))
  {
    objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v23, 7, v24);
    goto LABEL_3;
  }
  if (objc_msgSend_isEqualToString_(v5, v23, *MEMORY[0x263F57828], v24))
  {
    objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v25, 12, v26);
    goto LABEL_3;
  }
  if (objc_msgSend_isEqualToString_(v5, v25, *MEMORY[0x263F57838], v26))
  {
    objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v27, 43, v28);
    goto LABEL_3;
  }
  id v11 = 0;
LABEL_12:

  return v11;
}

+ (id)_harmoniaInitialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_isEqualToString_(v5, v7, *MEMORY[0x263F57858], v8))
  {
    objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v9, 46, v10);
LABEL_16:
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend_isEqualToString_(v5, v9, *MEMORY[0x263F57850], v10))
  {
    objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v11, @"com.apple.NanoCompass.complications.altitude", *MEMORY[0x263F577D0], 0);
  }
  else
  {
    if (objc_msgSend_isEqualToString_(v5, v11, *MEMORY[0x263F57860], v12))
    {
      objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v16, 7, v17);
      goto LABEL_16;
    }
    if (objc_msgSend_isEqualToString_(v5, v16, *MEMORY[0x263F57840], v17))
    {
      objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v18, 43, v19);
      goto LABEL_16;
    }
    if (objc_msgSend_isEqualToString_(v5, v18, *MEMORY[0x263F57830], v19))
    {
      objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v20, @"com.apple.NanoCompass.complications.compass", *MEMORY[0x263F577D0], 0);
    }
    else
    {
      if (objc_msgSend_isEqualToString_(v5, v20, *MEMORY[0x263F57828], v21))
      {
        objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v22, 15, v23);
        goto LABEL_16;
      }
      if (!objc_msgSend_isEqualToString_(v5, v22, *MEMORY[0x263F57838], v23))
      {
        id v15 = 0;
        goto LABEL_17;
      }
      objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v25, *MEMORY[0x263F57800], *MEMORY[0x263F577D0], 0);
    }
  uint64_t v13 = };
  id v15 = 0;
  if (objc_msgSend_supportsComplicationFamily_forDevice_(v13, v14, 10, (uint64_t)v6)) {
    id v15 = v13;
  }

LABEL_17:

  return v15;
}

+ (id)_secondsInitialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_isEqualToString_(v5, v7, *MEMORY[0x263F57858], v8))
  {
    objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v9, 10, v10);
    uint64_t v20 = LABEL_18:;
    goto LABEL_19;
  }
  if (objc_msgSend_isEqualToString_(v5, v9, *MEMORY[0x263F57850], v10))
  {
    objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v11, @"com.apple.NanoWorldClock.WorldClockWidgetExtension", @"com.apple.NanoWorldClock", 0);
    uint64_t v13 = LABEL_5:;
    id v15 = 0;
    if (objc_msgSend_supportsComplicationFamily_forDevice_(v13, v14, 10, (uint64_t)v6)) {
      id v15 = v13;
    }

    goto LABEL_20;
  }
  if (objc_msgSend_isEqualToString_(v5, v11, *MEMORY[0x263F57860], v12))
  {
    objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v16, 7, v17);
    goto LABEL_18;
  }
  if (objc_msgSend_isEqualToString_(v5, v16, *MEMORY[0x263F57840], v17))
  {
    uint64_t v20 = objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v18, @"com.apple.HeartRate.HeartRateWidgetExtension", @"com.apple.HeartRate", 0);
LABEL_19:
    id v15 = (id)v20;
    goto LABEL_20;
  }
  if (objc_msgSend_isEqualToString_(v5, v18, *MEMORY[0x263F57830], v19))
  {
    objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v21, 18, v22);
    goto LABEL_18;
  }
  if (objc_msgSend_isEqualToString_(v5, v21, *MEMORY[0x263F57828], v22))
  {
    objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v23, *MEMORY[0x263F57800], *MEMORY[0x263F577D0], 0);
    goto LABEL_5;
  }
  if (objc_msgSend_isEqualToString_(v5, v23, *MEMORY[0x263F57838], v24))
  {
    objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v25, 17, v26);
    goto LABEL_18;
  }
  id v15 = 0;
LABEL_20:

  return v15;
}

+ (void)_applyInitialDefaultComplicationsForBezelStyle:(int64_t)a3 toFace:(id)a4 forDevice:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v13 = objc_msgSend__orderedComplicationSlots(a1, v10, v11, v12, 0);
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v13);
        }
        uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * v19);
        if (a3 == 4)
        {
          uint64_t v21 = objc_msgSend__harmoniaInitialDefaultComplicationForSlot_forDevice_(NTKFoghornFace, v16, *(void *)(*((void *)&v25 + 1) + 8 * v19), (uint64_t)v9);
        }
        else if (a3 == 3)
        {
          uint64_t v21 = objc_msgSend__elevationInitialDefaultComplicationForSlot_forDevice_(NTKFoghornFace, v16, *(void *)(*((void *)&v25 + 1) + 8 * v19), (uint64_t)v9);
        }
        else
        {
          if (a3 == 2) {
            objc_msgSend__depthInitialDefaultComplicationForSlot_forDevice_(NTKFoghornFace, v16, *(void *)(*((void *)&v25 + 1) + 8 * v19), (uint64_t)v9);
          }
          else {
          uint64_t v21 = objc_msgSend__secondsInitialDefaultComplicationForSlot_forDevice_(NTKFoghornFace, v16, *(void *)(*((void *)&v25 + 1) + 8 * v19), (uint64_t)v9);
          }
        }
        uint64_t v24 = (void *)v21;
        if (!v21)
        {
          uint64_t v24 = objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v22, 22, v23);
        }
        objc_msgSend_setComplication_forSlot_(v8, v22, (uint64_t)v24, v20);

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v17);
  }
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return (id)*MEMORY[0x263F57858];
}

+ (id)_orderedComplicationSlots
{
  v7[7] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F57850];
  v7[0] = *MEMORY[0x263F57858];
  v7[1] = v2;
  uint64_t v3 = *MEMORY[0x263F57840];
  v7[2] = *MEMORY[0x263F57860];
  v7[3] = v3;
  uint64_t v4 = *MEMORY[0x263F57828];
  v7[4] = *MEMORY[0x263F57830];
  v7[5] = v4;
  v7[6] = *MEMORY[0x263F57838];
  id v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v7, 7);

  return v5;
}

+ (int64_t)_complicationFontStyleForSlot:(id)a3
{
  return 3;
}

- (id)_customEditModes
{
  return &unk_26FB121B0;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v9 = a4;
  switch(a3)
  {
    case 12:
      uint64_t v10 = objc_msgSend_device(self, v6, v7, v8);
      uint64_t v12 = objc_msgSend_optionWithBezelStyle_forDevice_(NTKFoghornFaceBezelStyleEditOption, v13, 1, (uint64_t)v10);
      goto LABEL_7;
    case 18:
      uint64_t v10 = objc_msgSend_device(self, v6, v7, v8);
      uint64_t v12 = objc_msgSend_optionWithFoghornNightMode_forDevice_(NTKFoghornNightModeEditOption, v14, 2, (uint64_t)v10);
      goto LABEL_7;
    case 15:
      uint64_t v10 = objc_msgSend_device(self, v6, v7, v8);
      uint64_t v12 = objc_msgSend_optionWithLayoutStyle_forDevice_(NTKFoghornFaceLayoutStyleEditOption, v11, 0, (uint64_t)v10);
LABEL_7:
      uint64_t v15 = (void *)v12;

      goto LABEL_9;
  }
  uint64_t v15 = 0;
LABEL_9:

  return v15;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v5 = objc_msgSend__optionClassForCustomEditMode_(self, a2, a3, (uint64_t)a4);
  id v9 = objc_msgSend_device(self, v6, v7, v8);
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
  if (a3 == 18 || a3 == 15 || a3 == 12)
  {
    uint64_t v4 = objc_opt_class();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (Class)v4;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  id v8 = a4;
  switch(a3)
  {
    case 12:
      objc_msgSend_stringByAppendingString_(@"EDIT_MODE_LABEL_FOGHORN_BEZEL", v6, @"_COMPANION", v7);
      goto LABEL_6;
    case 18:
      uint64_t v9 = objc_msgSend_stringByAppendingString_(@"EDIT_MODE_LABEL_NIGHT", v6, @"_COMPANION", v7);
      uint64_t v11 = NTKCompanionClockFaceLocalizedString();
      goto LABEL_8;
    case 15:
      objc_msgSend_stringByAppendingString_(@"EDIT_MODE_LABEL_FOGHORN_STYLE", v6, @"_COMPANION", v7);
      uint64_t v9 = LABEL_6:;
      uint64_t v11 = objc_msgSend_localizedStringForKey_comment_(NTKFoghornFaceBundle, v10, (uint64_t)v9, (uint64_t)&stru_26FB0CCF0);
LABEL_8:
      uint64_t v12 = (void *)v11;

      goto LABEL_10;
  }
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___NTKFoghornFace;
  uint64_t v12 = objc_msgSendSuper2(&v14, sel__localizedNameOverrideForCustomEditMode_forDevice_, a3, v8);
LABEL_10:

  return v12;
}

- (id)nightModeConfiguration
{
  v11.receiver = self;
  v11.super_class = (Class)NTKFoghornFace;
  uint64_t v3 = [(NTKFace *)&v11 nightModeConfiguration];
  id v5 = objc_msgSend_selectedOptionForCustomEditMode_slot_(self, v4, 18, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_msgSend_analyticsKey(v5, v6, v7, v8);

    uint64_t v3 = (void *)v9;
  }

  return v3;
}

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_FOGHORN_DESCRIPTION";
}

- (id)_faceDescription
{
  uint64_t v4 = objc_msgSend__faceDescriptionKey(self, a2, v2, v3);
  id v6 = objc_msgSend_localizedStringForKey_comment_(NTKFoghornFaceBundle, v5, (uint64_t)v4, (uint64_t)&stru_26FB0CCF0);

  return v6;
}

+ (id)pigmentFaceDomain
{
  return @"foghorn";
}

@end