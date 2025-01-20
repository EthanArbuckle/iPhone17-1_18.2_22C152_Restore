@interface MPUPlaybackAlertController
+ (id)contentRestrictedPlaybackAlertControllerForContentType:(int64_t)a3 dismissalBlock:(id)a4;
+ (id)genericAlertControllerForItem:(id)a3 error:(id)a4 dismissalBlock:(id)a5;
+ (id)playbackAlertControllerForItem:(id)a3 contentType:(int64_t)a4 error:(id)a5 dismissalBlock:(id)a6;
+ (id)userRemovedAlertControllerForItem:(id)a3 dismissalBlock:(id)a4;
+ (int64_t)playbackAlertTypeForError:(id)a3;
- (MPAVItem)item;
- (NSError)error;
- (int64_t)playbackAlertType;
@end

@implementation MPUPlaybackAlertController

+ (id)contentRestrictedPlaybackAlertControllerForContentType:(int64_t)a3 dismissalBlock:(id)a4
{
  id v5 = a4;
  v6 = [MEMORY[0x263F121E8] sharedRestrictionsMonitor];
  int v7 = [v6 hasRestrictionsPasscode];

  v8 = MPULocalizedString();
  v9 = MPULocalizedString();
  v10 = [a1 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

  v11 = (void *)MEMORY[0x263F1C3F0];
  v12 = MPULocalizedString();
  if (v7)
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __100__MPUPlaybackAlertController_contentRestrictedPlaybackAlertControllerForContentType_dismissalBlock___block_invoke;
    v25[3] = &unk_2647C2378;
    v13 = &v26;
    id v26 = v5;
    v14 = v25;
  }
  else
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __100__MPUPlaybackAlertController_contentRestrictedPlaybackAlertControllerForContentType_dismissalBlock___block_invoke_2;
    v23[3] = &unk_2647C2378;
    v13 = &v24;
    id v24 = v5;
    v14 = v23;
  }
  v15 = [v11 actionWithTitle:v12 style:0 handler:v14];
  [v10 addAction:v15];

  v16 = (void *)MEMORY[0x263F1C3F0];
  v17 = MPULocalizedString();
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __100__MPUPlaybackAlertController_contentRestrictedPlaybackAlertControllerForContentType_dismissalBlock___block_invoke_3;
  v21[3] = &unk_2647C2378;
  id v22 = v5;
  id v18 = v5;
  v19 = [v16 actionWithTitle:v17 style:0 handler:v21];
  [v10 addAction:v19];

  return v10;
}

uint64_t __100__MPUPlaybackAlertController_contentRestrictedPlaybackAlertControllerForContentType_dismissalBlock___block_invoke(uint64_t a1)
{
  v2 = [getLSApplicationWorkspaceClass() defaultWorkspace];
  v3 = [NSURL URLWithString:@"prefs:root=General&path=RESTRICTIONS"];
  [v2 openSensitiveURL:v3 withOptions:0];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __100__MPUPlaybackAlertController_contentRestrictedPlaybackAlertControllerForContentType_dismissalBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v4 = (void *)getMCProfileConnectionClass_softClass;
  uint64_t v19 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __getMCProfileConnectionClass_block_invoke;
    v14 = &unk_2647C2468;
    v15 = &v16;
    __getMCProfileConnectionClass_block_invoke((uint64_t)&v11);
    v4 = (void *)v17[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v16, 8);
  v6 = [v5 sharedConnection];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v7 = (void *)getMCFeatureExplicitContentAllowedSymbolLoc_ptr;
  uint64_t v19 = getMCFeatureExplicitContentAllowedSymbolLoc_ptr;
  if (!getMCFeatureExplicitContentAllowedSymbolLoc_ptr)
  {
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __getMCFeatureExplicitContentAllowedSymbolLoc_block_invoke;
    v14 = &unk_2647C2468;
    v15 = &v16;
    v8 = (void *)ManagedConfigurationLibrary();
    v9 = dlsym(v8, "MCFeatureExplicitContentAllowed");
    *(void *)(v15[1] + 24) = v9;
    getMCFeatureExplicitContentAllowedSymbolLoc_ptr = *(void *)(v15[1] + 24);
    int v7 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v7) {
    __100__MPUPlaybackAlertController_contentRestrictedPlaybackAlertControllerForContentType_dismissalBlock___block_invoke_2_cold_1();
  }
  [v6 setBoolValue:1 forSetting:*v7];

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

uint64_t __100__MPUPlaybackAlertController_contentRestrictedPlaybackAlertControllerForContentType_dismissalBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)playbackAlertControllerForItem:(id)a3 contentType:(int64_t)a4 error:(id)a5 dismissalBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [a1 playbackAlertTypeForError:v11];
  uint64_t v14 = v13;
  if (v13 == 1)
  {
LABEL_4:
    uint64_t v15 = [a1 genericAlertControllerForItem:v10 error:v11 dismissalBlock:v12];
    goto LABEL_6;
  }
  if (v13 != 4)
  {
    if (v13 != 3)
    {
      uint64_t v16 = 0;
      goto LABEL_9;
    }
    goto LABEL_4;
  }
  uint64_t v15 = [a1 userRemovedAlertControllerForItem:v10 dismissalBlock:v12];
LABEL_6:
  uint64_t v16 = (id *)v15;
  if (v15)
  {
    *(void *)(v15 + 1312) = v14;
    objc_storeStrong((id *)(v15 + 1320), a3);
    objc_storeStrong(v16 + 166, a5);
  }
LABEL_9:

  return v16;
}

+ (int64_t)playbackAlertTypeForError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  [v3 code];
  id v5 = v3;
  v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  int v7 = [v5 domain];
  int v8 = [v7 isEqualToString:*MEMORY[0x263EF98B0]];

  if (!v8) {
    goto LABEL_7;
  }
  v9 = [v6 userInfo];
  id v10 = [v9 objectForKey:*MEMORY[0x263F08608]];

  uint64_t v11 = [v10 code];
  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v12 = v11;
  uint64_t v13 = [v10 domain];
  int v14 = [v13 isEqualToString:*MEMORY[0x263F08410]];

  if (v14 && (unint64_t)(v12 + 42597) < 3)
  {

    int64_t v15 = 4;
  }
  else
  {
LABEL_7:
    int64_t v15 = v6 != 0;
  }
  return v15;
}

+ (id)genericAlertControllerForItem:(id)a3 error:(id)a4 dismissalBlock:(id)a5
{
  v104[1] = *MEMORY[0x263EF8340];
  id v79 = a3;
  id v7 = a4;
  id v80 = a5;
  v84 = v7;
  int v8 = [v7 domain];
  uint64_t v82 = *MEMORY[0x263EF98B0];
  if (objc_msgSend(v8, "isEqualToString:"))
  {
    uint64_t v9 = [v7 code];

    if (v9 == -11819)
    {
      id v10 = 0;
      goto LABEL_75;
    }
  }
  else
  {
  }
  id v11 = v84;
  uint64_t v12 = v11;
  if (!v11)
  {
    uint64_t v18 = 0;
    id v16 = 0;
    goto LABEL_22;
  }
  uint64_t v13 = 0;
  uint64_t v14 = *MEMORY[0x263F11180];
  uint64_t v15 = *MEMORY[0x263F08608];
  id v16 = v11;
  while (![v13 count])
  {
    v17 = [v16 userInfo];
    uint64_t v18 = [v17 objectForKey:v14];

    if ([v18 count])
    {

      if (v18) {
        goto LABEL_16;
      }
LABEL_22:
      id v76 = 0;
      goto LABEL_23;
    }
    uint64_t v19 = [v17 objectForKey:v15];

    id v16 = (id)v19;
    uint64_t v13 = v18;
    if (!v19) {
      goto LABEL_13;
    }
  }
  uint64_t v18 = v13;
LABEL_13:
  if (!v18) {
    goto LABEL_22;
  }
LABEL_16:
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x2050000000;
  v20 = (void *)getISDialogClass_softClass;
  uint64_t v103 = getISDialogClass_softClass;
  if (!getISDialogClass_softClass)
  {
    uint64_t v95 = MEMORY[0x263EF8330];
    uint64_t v96 = 3221225472;
    uint64_t v97 = (uint64_t)__getISDialogClass_block_invoke;
    v98 = &unk_2647C2468;
    v99 = &v100;
    __getISDialogClass_block_invoke((uint64_t)&v95);
    v20 = (void *)v101[3];
  }
  v21 = v20;
  _Block_object_dispose(&v100, 8);
  id v22 = (void *)[[v21 alloc] initWithDialogDictionary:v18];
  id v76 = v22;
  if (!v22) {
    goto LABEL_22;
  }
  if (![v22 isDisplayable] || objc_msgSend(v76, "kind"))
  {
LABEL_23:
    v30 = v16;
    id v16 = v12;

    if ([0 length])
    {
      v83 = 0;
      v31 = 0;
      id v28 = 0;
LABEL_68:
      if ([v31 length] || objc_msgSend(v28, "length"))
      {
        id v10 = [a1 alertControllerWithTitle:v28 message:v31 preferredStyle:1];
        v60 = (void *)MEMORY[0x263F1C3F0];
        v61 = MPULocalizedString();
        v87[0] = MEMORY[0x263EF8330];
        v87[1] = 3221225472;
        v87[2] = __81__MPUPlaybackAlertController_genericAlertControllerForItem_error_dismissalBlock___block_invoke_3;
        v87[3] = &unk_2647C2378;
        id v88 = v80;
        v62 = [v60 actionWithTitle:v61 style:1 handler:v87];
        [v10 addAction:v62];

        v63 = [v83 userInfo];
        v64 = [v63 objectForKey:*MEMORY[0x263F110D0]];
        if ([v64 length])
        {
          v65 = [v63 objectForKey:*MEMORY[0x263F110C8]];
          v66 = (void *)MEMORY[0x263F1C3F0];
          v85[0] = MEMORY[0x263EF8330];
          v85[1] = 3221225472;
          v85[2] = __81__MPUPlaybackAlertController_genericAlertControllerForItem_error_dismissalBlock___block_invoke_4;
          v85[3] = &unk_2647C23F0;
          id v86 = v65;
          id v67 = v65;
          v68 = [v66 actionWithTitle:v64 style:0 handler:v85];
          [v10 addAction:v68];
        }
      }
      else
      {
        id v10 = 0;
      }

      goto LABEL_74;
    }
    id v28 = 0;
    v31 = 0;
    v70 = &v97;
    uint64_t v81 = *MEMORY[0x263F08570];
    uint64_t v78 = *MEMORY[0x263F110E0];
    uint64_t v73 = *MEMORY[0x263F08320];
    uint64_t v77 = *MEMORY[0x263F110D8];
    uint64_t v72 = *MEMORY[0x263F08338];
    uint64_t v32 = *MEMORY[0x263F08608];
    uint64_t v74 = *MEMORY[0x263F08410];
    while (1)
    {
      if ([v31 length] || !v16)
      {
        v83 = 0;
        goto LABEL_68;
      }
      v33 = [v16 userInfo];
      v34 = [v16 domain];
      if ([v34 isEqualToString:v81])
      {
        BOOL v35 = [v16 code] == -1;

        if (v35) {
          goto LABEL_52;
        }
      }
      else
      {
      }
      v36 = [v33 objectForKey:v78];

      if (![v36 length])
      {
        uint64_t v37 = [v33 objectForKey:v73];

        v36 = (void *)v37;
      }
      v38 = [v33 objectForKey:v77];

      if (![v38 length])
      {
        uint64_t v39 = [v33 objectForKey:v72];

        v38 = (void *)v39;
      }
      v40 = [v16 domain];
      int v41 = [v40 isEqualToString:v82];

      if (v41) {
        break;
      }
      v31 = v38;
      id v28 = v36;
LABEL_50:
      if ([v31 length] || objc_msgSend(v28, "length"))
      {
        id v16 = v16;

        v83 = v16;
        goto LABEL_68;
      }
LABEL_52:
      uint64_t v55 = [v33 objectForKey:v32];

      id v16 = (id)v55;
      if ([v28 length])
      {
        v83 = 0;
        id v16 = (id)v55;
        goto LABEL_68;
      }
    }
    v42 = [v33 objectForKey:v32];
    v43 = [v42 domain];
    int v44 = [v43 isEqualToString:v74];

    if (v44)
    {
      uint64_t v45 = [v42 code];
      if ((unint64_t)(v45 + 42590) <= 6)
      {
        if ([v79 usesSubscriptionLease])
        {
          if (v45 == -42584)
          {
            MPULocalizedString();
            id v28 = (id)objc_claimAutoreleasedReturnValue();

            v46 = NSString;
            v47 = MPULocalizedString();
            v48 = [v79 mainTitle];
            v31 = objc_msgSend(v46, "localizedStringWithFormat:", v47, v48, v70);

            v71 = [v79 mediaItem];
            if (!v71)
            {
LABEL_61:

              goto LABEL_49;
            }
            v49 = [v79 mediaItem];
            v36 = [v49 mediaLibrary];

            v104[0] = v71;
            v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v104 count:1];
            [v36 removeItems:v50];

LABEL_43:
            goto LABEL_61;
          }
          uint64_t v100 = 0;
          v101 = &v100;
          uint64_t v102 = 0x2050000000;
          v51 = (void *)getICEnvironmentMonitorClass_softClass;
          uint64_t v103 = getICEnvironmentMonitorClass_softClass;
          if (!getICEnvironmentMonitorClass_softClass)
          {
            uint64_t v95 = MEMORY[0x263EF8330];
            uint64_t v96 = 3221225472;
            uint64_t v97 = (uint64_t)__getICEnvironmentMonitorClass_block_invoke;
            v98 = &unk_2647C2468;
            v99 = &v100;
            __getICEnvironmentMonitorClass_block_invoke((uint64_t)&v95);
            v51 = (void *)v101[3];
          }
          id v52 = v51;
          _Block_object_dispose(&v100, 8);
          v53 = [v52 sharedMonitor];
          BOOL v54 = [v53 networkType] == 0;

          if (v54)
          {
            if ([v79 isAssetLoaded])
            {
              v71 = [v79 asset];
            }
            else
            {
              v71 = 0;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || ([v71 URL],
                  v56 = objc_claimAutoreleasedReturnValue(),
                  int v57 = [v56 isFileURL],
                  v56,
                  !v57))
            {
              v31 = v38;
              id v28 = v36;
              goto LABEL_61;
            }
            MGGetBoolAnswer();
            MGGetBoolAnswer();
            [v79 type];
            v31 = MPULocalizedString();

            if (v45 == -42587)
            {
              MPULocalizedString();
              id v28 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              [v79 type];
              MPULocalizedString();
              id v28 = (id)objc_claimAutoreleasedReturnValue();

              v58 = [MEMORY[0x263F11D68] sharedController];
              int v59 = [v58 isCloudLibraryEnabled];

              if (!v59) {
                goto LABEL_61;
              }
              MPULocalizedString();
              v31 = v36 = v31;
            }
            goto LABEL_43;
          }
        }
      }
    }
    v31 = v38;
    id v28 = v36;
LABEL_49:

    goto LABEL_50;
  }
  v23 = [v76 title];
  id v24 = [v76 message];
  v25 = [a1 alertControllerWithTitle:v23 message:v24 preferredStyle:1];

  id v26 = [v76 buttons];
  uint64_t v95 = 0;
  uint64_t v96 = (uint64_t)&v95;
  uint64_t v97 = 0x2020000000;
  LOBYTE(v98) = 0;
  v89[0] = MEMORY[0x263EF8330];
  v89[1] = 3221225472;
  v89[2] = __81__MPUPlaybackAlertController_genericAlertControllerForItem_error_dismissalBlock___block_invoke;
  v89[3] = &unk_2647C23C8;
  v94 = &v95;
  id v76 = v76;
  id v90 = v76;
  id v93 = v80;
  id v27 = v25;
  id v91 = v27;
  id v28 = v26;
  id v92 = v28;
  [v28 enumerateObjectsUsingBlock:v89];
  v29 = v92;
  id v10 = v27;

  _Block_object_dispose(&v95, 8);
LABEL_74:

LABEL_75:
  return v10;
}

void __81__MPUPlaybackAlertController_genericAlertControllerForItem_error_dismissalBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  int v6 = [v5 actionType];
  if (v6 || !*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v7 = (void *)MEMORY[0x263F1C3F0];
    int v8 = [v5 title];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __81__MPUPlaybackAlertController_genericAlertControllerForItem_error_dismissalBlock___block_invoke_2;
    v11[3] = &unk_2647C23A0;
    id v12 = v5;
    id v13 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 56);
    uint64_t v9 = [v7 actionWithTitle:v8 style:v6 == 0 handler:v11];

    [*(id *)(a1 + 40) addAction:v9];
    if (([*(id *)(a1 + 32) noDefaultButton] & 1) == 0)
    {
      uint64_t v10 = [*(id *)(a1 + 32) defaultButtonIndex];
      if ((~v10 & 0x7FFFFFFFFFFFFFFFLL) == 0) {
        uint64_t v10 = [*(id *)(a1 + 48) count] - 1;
      }
      if (v10 == a3) {
        [*(id *)(a1 + 40) setPreferredAction:v9];
      }
    }
    if (!v6) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
}

uint64_t __81__MPUPlaybackAlertController_genericAlertControllerForItem_error_dismissalBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) performDefaultActionForDialog:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) incrementDisplayCount];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __81__MPUPlaybackAlertController_genericAlertControllerForItem_error_dismissalBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __81__MPUPlaybackAlertController_genericAlertControllerForItem_error_dismissalBlock___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v1 = objc_msgSend(NSURL, "URLWithString:");
    if (v1)
    {
      id v3 = v1;
      v2 = [getLSApplicationWorkspaceClass() defaultWorkspace];
      [v2 openSensitiveURL:v3 withOptions:0];

      v1 = v3;
    }
  }
}

+ (id)userRemovedAlertControllerForItem:(id)a3 dismissalBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 mediaItem];
  uint64_t v9 = [v8 mediaLibrary];
  uint64_t v10 = [MEMORY[0x263F11E40] deviceMediaLibrary];

  if (v9 == v10)
  {
    if (v8)
    {
      __int16 v12 = [v8 mediaType];
    }
    else if ([v6 type] == 2)
    {
      __int16 v12 = -256;
    }
    else
    {
      __int16 v12 = 255;
    }
    id v13 = [v8 valueForProperty:*MEMORY[0x263F113D8]];
    uint64_t v14 = [v13 longLongValue];

    v60 = v7;
    if ((v12 & 0x800) != 0)
    {
      uint64_t v15 = @"MUSIC_VIDEO";
    }
    else if ((v12 & 0x402) != 0)
    {
      uint64_t v15 = @"PODCAST";
    }
    else if ((v12 & 0x200) != 0)
    {
      uint64_t v15 = @"EPISODE";
    }
    else if ((v12 & 0x100) != 0)
    {
      uint64_t v15 = @"MOVIE";
    }
    else if ((v12 & 4) != 0)
    {
      uint64_t v15 = @"AUDIOBOOK";
    }
    else if (v12)
    {
      uint64_t v15 = @"SONG";
    }
    else if ((v12 & 0xFF00) != 0)
    {
      uint64_t v15 = @"VIDEO";
    }
    else
    {
      uint64_t v15 = @"TRACK";
    }
    id v16 = @"REBUY";
    if (!v14) {
      id v16 = @"NOT_AVAILABLE";
    }
    v17 = NSString;
    uint64_t v18 = v16;
    uint64_t v19 = [v17 stringWithFormat:@"USER_REMOVED_ALERT_%@_TITLE_%@", v18, v15];
    uint64_t v20 = MPULocalizedString();

    v21 = [NSString stringWithFormat:@"USER_REMOVED_ALERT_%@_MESSAGE_%@", v18, v15];

    uint64_t v22 = MPULocalizedString();

    v23 = [NSString stringWithFormat:@"USER_REMOVED_ALERT_DELETE_BUTTON_%@", v15];
    id v24 = MPULocalizedString();

    int v57 = (void *)v22;
    v58 = (void *)v20;
    id v11 = [a1 alertControllerWithTitle:v20 message:v22 preferredStyle:1];
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke;
    v72[3] = &unk_2647C2418;
    id v73 = v8;
    id v25 = v60;
    id v74 = v25;
    id v26 = (void *)MEMORY[0x22A65FBA0](v72);
    id v27 = (void *)MEMORY[0x263F1C3F0];
    id v59 = v6;
    if (v14)
    {
      id v28 = MPULocalizedString();
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_2;
      v70[3] = &unk_2647C2378;
      id v55 = v25;
      id v71 = v55;
      v29 = [v27 actionWithTitle:v28 style:1 handler:v70];
      [v11 addAction:v29];

      v30 = (void *)MEMORY[0x263F1C3F0];
      v68[0] = MEMORY[0x263EF8330];
      v68[1] = 3221225472;
      v68[2] = __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_3;
      v68[3] = &unk_2647C2378;
      v56 = v26;
      id v69 = v26;
      v31 = [v30 actionWithTitle:v24 style:2 handler:v68];
      [v11 addAction:v31];

      uint64_t v32 = [v6 storeItemID];
      if (!v32
        || ([NSString stringWithFormat:@"itms://?action=lookup&ids=%@", v32, 0],
            (uint64_t v33 = objc_claimAutoreleasedReturnValue()) == 0)
        || (v34 = (void *)v33,
            [NSURL URLWithString:v33],
            BOOL v35 = objc_claimAutoreleasedReturnValue(),
            v34,
            !v35))
      {
        if ((v12 & 4) != 0)
        {
          v36 = @"audiobooks";
        }
        else if ((v12 & 0x1008) != 0)
        {
          v36 = @"itunes-u";
        }
        else
        {
          if ((v12 & 0x100) != 0) {
            v36 = @"movies";
          }
          else {
            v36 = @"music-videos";
          }
          if ((v12 & 0x900) == 0)
          {
            if ((v12 & 0x402) != 0)
            {
              v36 = @"podcasts";
            }
            else if ((v12 & 0x200) != 0)
            {
              v36 = @"tv-shows";
            }
            else if ((v12 & 0xFF00) != 0)
            {
              v36 = @"movie";
            }
            else
            {
              v36 = @"music";
            }
          }
        }
        uint64_t v45 = NSURL;
        v46 = NSString;
        v47 = [MEMORY[0x263F086E0] mainBundle];
        v48 = [v47 bundleIdentifier];
        v49 = [v46 stringWithFormat:@"itms://?action=%@&libraryid=%@", v36, v48];
        BOOL v35 = [v45 URLWithString:v49];
      }
      v50 = (void *)MEMORY[0x263F1C3F0];
      v51 = MPULocalizedString();
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_4;
      v65[3] = &unk_2647C2440;
      id v66 = v35;
      id v67 = v55;
      id v52 = v35;
      v53 = [v50 actionWithTitle:v51 style:0 handler:v65];
      [v11 addAction:v53];

      int v44 = v57;
      v43 = v58;
      id v7 = v60;
      uint64_t v39 = &v71;
      v38 = v56;
      v42 = &v69;
    }
    else
    {
      uint64_t v37 = MPULocalizedString();
      v63[0] = MEMORY[0x263EF8330];
      v63[1] = 3221225472;
      v38 = v26;
      v63[2] = __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_5;
      v63[3] = &unk_2647C2378;
      uint64_t v39 = &v64;
      id v64 = v25;
      v40 = [v27 actionWithTitle:v37 style:1 handler:v63];
      [v11 addAction:v40];

      int v41 = (void *)MEMORY[0x263F1C3F0];
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_6;
      v61[3] = &unk_2647C2378;
      id v7 = v60;
      v42 = &v62;
      id v62 = v38;
      uint64_t v32 = [v41 actionWithTitle:v24 style:2 handler:v61];
      [v11 addAction:v32];
      int v44 = v57;
      v43 = v58;
    }

    id v6 = v59;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

uint64_t __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 mediaLibrary];
    v6[0] = *(void *)(a1 + 32);
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    [v3 removeItems:v4];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_4(uint64_t a1)
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  [v2 openURL:*(void *)(a1 + 32) options:MEMORY[0x263EFFA78] completionHandler:0];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)playbackAlertType
{
  return self->_playbackAlertType;
}

- (MPAVItem)item
{
  return self->_item;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

void __100__MPUPlaybackAlertController_contentRestrictedPlaybackAlertControllerForContentType_dismissalBlock___block_invoke_2_cold_1()
{
}

@end