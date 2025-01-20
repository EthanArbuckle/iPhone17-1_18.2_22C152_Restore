@interface AXUIAvatarUtilities
+ (BOOL)_shouldSkipPresetCategory:(int64_t)a3;
+ (BOOL)avatarFrameworksArePresent;
+ (id)_axStringForPresetCategory:(int64_t)a3;
+ (id)customContentForAvatarWithRecord:(id)a3;
+ (id)customContentForMemoji:(id)a3;
+ (id)descriptionForAnimoji:(id)a3;
+ (id)descriptionForAvatarWithRecord:(id)a3 includeVideoPrefix:(BOOL)a4;
+ (id)descriptionForMemoji:(id)a3;
+ (void)performValidations;
@end

@implementation AXUIAvatarUtilities

+ (BOOL)avatarFrameworksArePresent
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];
  char v4 = [v3 hasPrefix:*MEMORY[0x1E4F482D8]];

  if (v4)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    uint64_t v5 = AvatarKitLibraryCore();
    if (v5) {
      LOBYTE(v5) = AvatarUILibraryCore() != 0;
    }
  }
  return v5;
}

+ (void)performValidations
{
  if (AXPerformValidationChecks() && [a1 avatarFrameworksArePresent])
  {
    getAVTAnimojiClass();
    objc_opt_class();
    getAVTPresetClass();
    objc_opt_class();
    getAVTColorPresetClass();
    objc_opt_class();
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2050000000;
    v3 = (void *)getAVTAvatarPuppetRecordClass_softClass;
    uint64_t v11 = getAVTAvatarPuppetRecordClass_softClass;
    if (!getAVTAvatarPuppetRecordClass_softClass)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __getAVTAvatarPuppetRecordClass_block_invoke;
      v7[3] = &unk_1E649BF00;
      v7[4] = &v8;
      __getAVTAvatarPuppetRecordClass_block_invoke((uint64_t)v7);
      v3 = (void *)v9[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v8, 8);
    objc_opt_class();
  }
  uint64_t v5 = [MEMORY[0x1E4F483A8] sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__AXUIAvatarUtilities_performValidations__block_invoke;
  v6[3] = &__block_descriptor_40_e29_B16__0__AXValidationManager_8l;
  v6[4] = a1;
  [v5 performValidations:v6 withPreValidationHandler:&__block_literal_global_5 postValidationHandler:0];
}

uint64_t __41__AXUIAvatarUtilities_performValidations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) avatarFrameworksArePresent])
  {
    [v3 validateClass:@"AVTAnimoji"];
    [v3 validateClass:@"AVTPreset"];
    [v3 validateClass:@"AVTColorPreset"];
    [v3 validateClass:@"AVTAvatarPuppetRecord"];
    [v3 validateClass:@"AVTAvatarPuppetRecord" conformsToProtocol:@"AVTAvatarRecord"];
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarPuppetRecord", @"puppetName", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarRecord", @"avatarData", "@", 0);
    [v3 validateProtocol:@"AVTAvatarRecord" hasRequiredInstanceMethod:@"isEditable"];
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTStickerConfiguration", @"localizedName", "@", 0);
  }

  return 1;
}

uint64_t __41__AXUIAvatarUtilities_performValidations__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AXUIAvatarUtilities"];
  [v2 setOverrideProcessName:@"AXUIAvatarUtilities"];
  [v2 setDebugBuild:0];

  return AXPerformValidationChecks();
}

+ (id)descriptionForAvatarWithRecord:(id)a3 includeVideoPrefix:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![a1 avatarFrameworksArePresent])
  {
    uint64_t v10 = 0;
    goto LABEL_18;
  }
  if ([v6 safeBoolForKey:@"isEditable"])
  {
    v7 = [v6 safeValueForKey:@"avatarData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = 0;
      uint64_t v8 = [getAVTMemojiClass() avatarWithDataRepresentation:v7 error:&v18];
      id v9 = v18;
      if (v9)
      {
        _AXLogWithFacility();
      }
      else
      {
        getAVTMemojiClass();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v14 = [a1 descriptionForMemoji:v8];
          if (v4) {
            v15 = @"memoji.video.description";
          }
          else {
            v15 = @"starfish.avatar";
          }
          v17 = AXUILocalizedStringForKey(v15);
          uint64_t v10 = __AXStringForVariables();

          goto LABEL_16;
        }
      }
      uint64_t v10 = 0;
LABEL_16:

      goto LABEL_17;
    }
  }
  else
  {
    v7 = [v6 safeStringForKey:@"puppetName"];
    if (v7)
    {
      uint64_t v11 = [getAVTAnimojiClass() animojiNamed:v7];
      uint64_t v10 = [a1 descriptionForAnimoji:v11];
      if (v4)
      {
        v12 = AXUILocalizedStringForKey(@"animoji.video.description");
        uint64_t v13 = __AXStringForVariables();

        uint64_t v10 = (void *)v13;
      }

      goto LABEL_17;
    }
  }
  uint64_t v10 = 0;
LABEL_17:

LABEL_18:
  return v10;
}

+ (id)descriptionForAnimoji:(id)a3
{
  id v3 = a3;
  if (getAVTAnimojiClass())
  {
    BOOL v4 = NSString;
    uint64_t v5 = [v3 name];
    id v6 = [v4 stringWithFormat:@"animoji.name.%@", v5];
    v7 = AXUILocalizedStringForKey(v6);
  }
  else
  {
    _AXLogWithFacility();
    v7 = 0;
  }

  return v7;
}

+ (id)descriptionForMemoji:(id)a3
{
  id v3 = a3;
  if (getAVTColorPresetClass() && getAVTPresetClass() && getAVTMemojiClass() && getAVTAnimojiClass())
  {
    v39 = [v3 colorPresetForCategory:0];
    uint64_t v4 = [v39 localizedName];
    v38 = [v3 colorPresetForCategory:1];
    uint64_t v5 = [v38 localizedName];
    uint64_t v6 = [v3 presetForCategory:1];
    v7 = [(id)v6 localizedName];
    v36 = (void *)v6;
    uint64_t v8 = [(id)v6 identifier];
    LOBYTE(v6) = [v8 isEqualToString:@"none"];

    v35 = [v3 colorPresetForCategory:7];
    id v9 = [v35 localizedName];
    v34 = [v3 colorPresetForCategory:2];
    v46 = [v34 localizedName];
    v45 = [v3 presetForCategory:2];
    v43 = [v45 localizedName];
    v33 = [v3 colorPresetForCategory:4];
    v42 = [v33 localizedName];
    v44 = [v3 presetForCategory:4];
    v41 = [v44 localizedName];
    uint64_t v10 = [v3 presetForCategory:32];
    uint64_t v40 = [v10 localizedName];
    v32 = [v3 colorPresetForCategory:32];
    uint64_t v11 = [v32 localizedName];
    v12 = NSString;
    if (v6)
    {
      uint64_t v13 = AXUILocalizedStringForKey(@"memoji.description.no.hair");
      objc_msgSend(v12, "stringWithFormat:", v13, v4, v7, v5, v9);
    }
    else
    {
      uint64_t v13 = AXUILocalizedStringForKey(@"memoji.description.basic");
      objc_msgSend(v12, "stringWithFormat:", v13, v4, v5, v7, v9);
    v14 = };
    v37 = (void *)v5;

    v16 = (void *)v4;
    if ([v45 hasComponent])
    {
      v17 = NSString;
      id v18 = AXUILocalizedStringForKey(@"memoji.description.facialhair");
      v27 = objc_msgSend(v17, "stringWithFormat:", v18, v46, v43);
      v30 = @"__AXStringForVariablesSentinel";
      uint64_t v19 = __AXStringForVariables();

      v14 = (void *)v19;
    }
    if (objc_msgSend(v44, "hasComponent", v27, v30))
    {
      v20 = NSString;
      v21 = AXUILocalizedStringForKey(@"memoji.description.headwear");
      v28 = objc_msgSend(v20, "stringWithFormat:", v21, v42, v41);
      v31 = @"__AXStringForVariablesSentinel";
      uint64_t v22 = __AXStringForVariables();

      v14 = (void *)v22;
    }
    v23 = (void *)v40;
    if (objc_msgSend(v10, "hasComponent", v28, v31))
    {
      v24 = NSString;
      v25 = AXUILocalizedStringForKey(@"memoji.description.facewear");
      v29 = objc_msgSend(v24, "stringWithFormat:", v25, v11, v40);
      uint64_t v26 = __AXStringForVariables();

      v14 = (void *)v26;
      v23 = (void *)v40;
    }
  }
  else
  {
    _AXLogWithFacility();
    v14 = 0;
  }

  return v14;
}

+ (id)customContentForAvatarWithRecord:(id)a3
{
  id v4 = a3;
  if (![a1 avatarFrameworksArePresent]
    || ![v4 safeBoolForKey:@"isEditable"])
  {
    uint64_t v8 = 0;
    goto LABEL_13;
  }
  uint64_t v5 = [v4 safeValueForKey:@"avatarData"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = 0;
    uint64_t v6 = [getAVTMemojiClass() avatarWithDataRepresentation:v5 error:&v10];
    id v7 = v10;
    if (v7)
    {
      _AXLogWithFacility();
    }
    else
    {
      getAVTMemojiClass();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [a1 customContentForMemoji:v6];
LABEL_11:

        goto LABEL_12;
      }
    }
    uint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v8 = 0;
LABEL_12:

LABEL_13:
  return v8;
}

+ (id)customContentForMemoji:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (getAVTColorPresetClass() && getAVTPresetClass() && getAVTMemojiClass() && getAVTAnimojiClass())
  {
    for (uint64_t i = 0; i != 40; ++i)
    {
      if ((objc_msgSend(a1, "_shouldSkipPresetCategory:", i, v17, v18) & 1) == 0)
      {
        id v7 = [v4 presetForCategory:i];
        if ([v7 hasComponent])
        {
          uint64_t v8 = [a1 _axStringForPresetCategory:i];
          id v9 = [v7 localizedName];
          id v10 = [v4 colorPresetForCategory:i];
          uint64_t v11 = [v10 localizedName];

          if (v11)
          {
            v17 = v11;
            id v18 = @"__AXStringForVariablesSentinel";
            uint64_t v12 = __AXStringForVariables();

            id v9 = (void *)v12;
          }
          if (v8 && v9)
          {
            uint64_t v13 = (void *)MEMORY[0x1E4F17480];
            v14 = AXUILocalizedStringForKey(v8);
            v15 = [v13 customContentWithLabel:v14 value:v9];

            [v5 addObject:v15];
          }
        }
      }
    }
  }
  else
  {
    _AXLogWithFacility();
  }

  return v5;
}

+ (BOOL)_shouldSkipPresetCategory:(int64_t)a3
{
  return a3 == 40;
}

+ (id)_axStringForPresetCategory:(int64_t)a3
{
  char v4 = objc_msgSend(a1, "_shouldSkipPresetCategory:");
  id result = 0;
  if ((unint64_t)a3 <= 0x23 && (v4 & 1) == 0) {
    return off_1E649C4E0[a3];
  }
  return result;
}

@end