@interface HFAnalytics(HUAdditions)
+ (id)_overrideBannerItemClassName:()HUAdditions withOverrideClassName:;
+ (void)logAndSendTileInteractionEventOfType:()HUAdditions withPresentationContext:presentationCoordinator:;
+ (void)sendBannerInteractionforItem:()HUAdditions tappedBannerItemOverrideClassName:hiddenBannerEvents:;
+ (void)sendGeneralButtonTapEventWithButtonTitle:()HUAdditions sourceViewController:;
+ (void)sendSwitchCellToggleEventForItem:()HUAdditions isOn:title:fromSourceViewController:;
@end

@implementation HFAnalytics(HUAdditions)

+ (void)logAndSendTileInteractionEventOfType:()HUAdditions withPresentationContext:presentationCoordinator:
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v72 = a4;
  id v71 = a5;
  switch(a3)
  {
    case 3:
      v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [v71 delegate];
        v11 = [v72 item];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v11;
        _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@: User long-pressed item: %@", buf, 0x16u);
      }
      goto LABEL_12;
    case 2:
      v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [v71 delegate];
        v13 = [v72 item];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@: User double-tapped item: %@", buf, 0x16u);
      }
      goto LABEL_12;
    case 1:
      v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = [v71 delegate];
        v9 = [v72 item];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@: User tapped item: %@", buf, 0x16u);
      }
LABEL_12:

      goto LABEL_14;
  }
  v14 = [NSNumber numberWithUnsignedInteger:a3];
  NSLog(&cfstr_InvalidInterac.isa, v14);

LABEL_14:
  v15 = [MEMORY[0x1E4F1CA60] dictionary];
  v16 = [NSNumber numberWithUnsignedInteger:a3];
  [v15 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F681A8]];

  v17 = [v72 item];
  [v15 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F681B8]];
  v18 = [v72 sourceViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v19 = [v18 topViewController];
    v20 = (void *)v19;
    if (v19) {
      v21 = (void *)v19;
    }
    else {
      v21 = v18;
    }
    id v22 = v21;

    v18 = v22;
  }
  [v15 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F681E8]];
  objc_opt_class();
  id v23 = v18;
  if (objc_opt_isKindOfClass()) {
    v24 = v23;
  }
  else {
    v24 = 0;
  }
  id v70 = v24;

  objc_opt_class();
  id v25 = v23;
  if (objc_opt_isKindOfClass()) {
    v26 = v25;
  }
  else {
    v26 = 0;
  }
  id v68 = v26;

  if (v70)
  {
    v27 = [v70 context];
    v28 = [v27 typeDescriptionForAnalytics];
    [v15 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F68178]];
  }
  else
  {
    if (!v68) {
      goto LABEL_30;
    }
    v27 = [v68 contextTypeDescriptionForAnalytics];
    [v15 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F68178]];
  }

LABEL_30:
  v29 = [v72 tappedArea];
  [v15 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F68220]];

  v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v71, "isEditing"));
  [v15 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F681B0]];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v78 = __Block_byref_object_copy__21;
  v79 = __Block_byref_object_dispose__21;
  v31 = [v17 latestResults];
  id v80 = [v31 objectForKeyedSubscript:*MEMORY[0x1E4F68BB0]];

  objc_opt_class();
  id v32 = v17;
  if (objc_opt_isKindOfClass()) {
    v33 = v32;
  }
  else {
    v33 = 0;
  }
  id v69 = v33;

  if (v69)
  {
    v34 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v35 = [v34 allHomesFuture];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __113__HFAnalytics_HUAdditions__logAndSendTileInteractionEventOfType_withPresentationContext_presentationCoordinator___block_invoke;
    v73[3] = &unk_1E638D0A8;
    v76 = buf;
    id v74 = v32;
    id v75 = v15;
    id v36 = (id)[v35 addCompletionBlock:v73];

    id v37 = v74;
  }
  else
  {
    objc_opt_class();
    id v38 = v32;
    if (objc_opt_isKindOfClass()) {
      v39 = v38;
    }
    else {
      v39 = 0;
    }
    id v37 = v39;

    if (v37)
    {
      objc_opt_class();
      id v40 = [v37 accessoryRepresentableObject];
      if (objc_opt_isKindOfClass()) {
        v41 = v40;
      }
      else {
        v41 = 0;
      }
      id v42 = v41;

      v43 = (void *)MEMORY[0x1E4F2E4F8];
      v44 = objc_msgSend(v42, "hf_categoryOrPrimaryServiceType");
      v45 = objc_msgSend(v43, "hf_getUserFriendlyDescriptionKey:", v44);

      if ([v45 length])
      {
        v46 = NSString;
        v47 = (objc_class *)objc_opt_class();
        v48 = NSStringFromClass(v47);
        uint64_t v49 = [v46 stringWithFormat:@"%@-%@", v48, v45];
        v50 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v49;
      }
    }
    objc_opt_class();
    id v51 = v38;
    if (objc_opt_isKindOfClass()) {
      v52 = v51;
    }
    else {
      v52 = 0;
    }
    id v67 = v52;

    if (v67)
    {
      v53 = (void *)MEMORY[0x1E4F2EA88];
      v54 = [v67 serviceGroup];
      v55 = [v54 services];
      v56 = [v55 firstObject];
      v57 = [v56 serviceType];
      v58 = objc_msgSend(v53, "hf_getUserFriendlyDescriptionKey:", v57);

      if ([v58 length])
      {
        v59 = NSString;
        v60 = (objc_class *)objc_opt_class();
        v61 = NSStringFromClass(v60);
        uint64_t v62 = [v59 stringWithFormat:@"%@-%@", v61, v58];
        v63 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v62;
      }
    }
    objc_msgSend(v15, "na_safeSetObject:forKey:", *(void *)(*(void *)&buf[8] + 40), *MEMORY[0x1E4F681C0]);
    [MEMORY[0x1E4F68EE0] sendEvent:13 withData:v15];
    v64 = [v72 tappedArea];
    int v65 = [v64 isEqual:@"HUTileCellTappableAreaStateToggleButton"];

    if (v65)
    {
      v66 = +[HUTipsManager_Swift sharedManager];
      [v66 toggleDidInteract];
    }
  }

  _Block_object_dispose(buf, 8);
}

+ (void)sendSwitchCellToggleEventForItem:()HUAdditions isOn:title:fromSourceViewController:
{
  id v9 = a6;
  v10 = (void *)MEMORY[0x1E4F1CA60];
  id v11 = a5;
  id v12 = a3;
  v13 = [v10 dictionary];
  objc_msgSend(v13, "na_safeSetObject:forKey:", v12, *MEMORY[0x1E4F681B8]);

  id v14 = v9;
  objc_opt_class();
  id v15 = v14;
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  v18 = v15;
  if (v17)
  {
    v18 = [v17 topViewController];
  }
  objc_msgSend(v13, "na_safeSetObject:forKey:", v18, *MEMORY[0x1E4F681E8]);
  objc_opt_class();
  id v28 = v15;
  if (objc_opt_isKindOfClass()) {
    uint64_t v19 = v28;
  }
  else {
    uint64_t v19 = 0;
  }
  id v20 = v19;

  if (v20)
  {
    v21 = NSString;
    id v22 = (objc_class *)objc_opt_class();
    id v23 = NSStringFromClass(v22);
    v24 = [v20 topic];
    id v25 = [v24 topicNameLocalizationKey];
    v26 = [v21 stringWithFormat:@"%@-%@", v23, v25];
  }
  else
  {
    v26 = 0;
  }
  objc_msgSend(v13, "na_safeSetObject:forKey:", v26, *MEMORY[0x1E4F681F0]);
  v27 = [NSNumber numberWithBool:a4];
  objc_msgSend(v13, "na_safeSetObject:forKey:", v27, *MEMORY[0x1E4F68200]);

  objc_msgSend(v13, "na_safeSetObject:forKey:", v11, *MEMORY[0x1E4F68208]);
  [MEMORY[0x1E4F68EE0] sendEvent:40 withData:v13];
}

+ (void)sendBannerInteractionforItem:()HUAdditions tappedBannerItemOverrideClassName:hiddenBannerEvents:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_opt_new();
  uint64_t v33 = *MEMORY[0x1E4F681B8];
  objc_msgSend(v11, "na_safeSetObject:forKey:", v8);
  v34 = a1;
  id v36 = v8;
  v29 = v9;
  v35 = [a1 _overrideBannerItemClassName:v8 withOverrideClassName:v9];
  uint64_t v32 = *MEMORY[0x1E4F681C0];
  objc_msgSend(v11, "na_safeSetObject:forKey:");
  id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  uint64_t v31 = *MEMORY[0x1E4F68198];
  objc_msgSend(v11, "na_safeSetObject:forKey:", v12);

  v13 = (void *)MEMORY[0x1E4F68EE0];
  id v28 = v11;
  id v14 = (void *)[v11 copy];
  [v13 sendEvent:41 withData:v14];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v15 = v10;
  id obj = [v10 allObjects];
  uint64_t v16 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v38;
    uint64_t v19 = *MEMORY[0x1E4F68210];
    uint64_t v20 = *MEMORY[0x1E4F68218];
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v37 + 1) + 8 * v21);
        id v23 = objc_opt_new();
        objc_msgSend(v23, "na_safeSetObject:forKey:", v22, v33);
        v24 = [v34 _overrideBannerItemClassName:v22 withOverrideClassName:0];
        objc_msgSend(v23, "na_safeSetObject:forKey:", v24, v32);
        objc_msgSend(v23, "na_safeSetObject:forKey:", v36, v19);
        objc_msgSend(v23, "na_safeSetObject:forKey:", v35, v20);
        id v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
        objc_msgSend(v23, "na_safeSetObject:forKey:", v25, v31);

        v26 = (void *)MEMORY[0x1E4F68EE0];
        v27 = (void *)[v23 copy];
        [v26 sendEvent:42 withData:v27];

        ++v21;
      }
      while (v17 != v21);
      uint64_t v17 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v17);
  }
}

+ (void)sendGeneralButtonTapEventWithButtonTitle:()HUAdditions sourceViewController:
{
  id v5 = a4;
  id v6 = a3;
  id v9 = (id)objc_opt_new();
  objc_msgSend(v9, "na_safeSetObject:forKey:", v6, *MEMORY[0x1E4F681B8]);

  objc_msgSend(v9, "na_safeSetObject:forKey:", v5, *MEMORY[0x1E4F681E8]);
  v7 = (void *)MEMORY[0x1E4F68EE0];
  id v8 = (void *)[v9 copy];
  [v7 sendEvent:43 withData:v8];
}

+ (id)_overrideBannerItemClassName:()HUAdditions withOverrideClassName:
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 latestResults];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AC0]];

  if ([v6 length])
  {
    id v9 = v6;
  }
  else if ([v8 length])
  {
    id v10 = NSString;
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v9 = [v10 stringWithFormat:@"%@-%@", v12, v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

@end