@interface SFFormAutoFillMultipleLoginsAlertController
+ (id)alertControllerWithMatchesFromFormProtectionSpace:(id)a3 matchesFromOtherProtectionSpaces:(id)a4 externalCredentials:(id)a5 preferredStyle:(int64_t)a6 formURL:(id)a7 completionHandler:(id)a8;
- (BOOL)cancelsWhenAppEntersBackground;
- (void)_sceneDidEnterBackground:(id)a3;
- (void)setCancelsWhenAppEntersBackground:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SFFormAutoFillMultipleLoginsAlertController

+ (id)alertControllerWithMatchesFromFormProtectionSpace:(id)a3 matchesFromOtherProtectionSpaces:(id)a4 externalCredentials:(id)a5 preferredStyle:(int64_t)a6 formURL:(id)a7 completionHandler:(id)a8
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v64 = a7;
  id v65 = a8;
  v17 = [a1 alertControllerWithTitle:0 message:0 preferredStyle:a6];
  [v17 setImageIfNecessaryWithName:@"alert-passwords"];
  v61 = v14;
  if ([v14 count] || objc_msgSend(v15, "count") || objc_msgSend(v16, "count"))
  {
    v18 = _WBSLocalizedString();
    [v17 setTitle:v18];
  }
  v66 = v17;
  v59 = v15;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  obuint64_t j = v16;
  uint64_t v19 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v82 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        v24 = objc_msgSend(MEMORY[0x1E4F98250], "titleForCredentialIdentity:formURL:", v23, v64, v59);
        v25 = [v23 user];
        v26 = +[SFCredentialDisplayData descriptionForPasswordWithUser:v25 creationDate:0];

        v79[0] = MEMORY[0x1E4F143A8];
        v79[1] = 3221225472;
        v79[2] = __191__SFFormAutoFillMultipleLoginsAlertController_alertControllerWithMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_externalCredentials_preferredStyle_formURL_completionHandler___block_invoke;
        v79[3] = &unk_1E5C750C8;
        id v27 = v65;
        v79[4] = v23;
        id v80 = v27;
        v28 = +[SFMultipleLineAlertAction actionWithTitle:v26 detail:v24 handler:v79];
        [v66 addAction:v28];
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
    }
    while (v20);
  }

  uint64_t v29 = [v59 count];
  v30 = [MEMORY[0x1E4F98230] sharedManager];
  v31 = [v30 enabledExtensions];
  unint64_t v32 = [v31 count];

  char v33 = 1;
  if (!v29 && v32 <= 1)
  {
    if (v32)
    {
      v34 = [MEMORY[0x1E4F98208] sharedFeatureManager];
      char v33 = [v34 shouldAutoFillPasswordsFromKeychain];
    }
    else
    {
      char v33 = 0;
    }
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  objc_msgSend(v61, "arrayByAddingObjectsFromArray:", v59, v59);
  id v62 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = [v62 countByEnumeratingWithState:&v75 objects:v85 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v76;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v76 != v37) {
          objc_enumerationMutation(v62);
        }
        v39 = *(void **)(*((void *)&v75 + 1) + 8 * j);
        v40 = [v39 match];
        v41 = [v40 user];
        v42 = [v39 creationDate];
        v43 = +[SFCredentialDisplayData descriptionForPasswordWithUser:v41 creationDate:v42];

        if (v33)
        {
          v44 = [v39 detail];
          v72[0] = MEMORY[0x1E4F143A8];
          v72[1] = 3221225472;
          v72[2] = __191__SFFormAutoFillMultipleLoginsAlertController_alertControllerWithMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_externalCredentials_preferredStyle_formURL_completionHandler___block_invoke_2;
          v72[3] = &unk_1E5C750C8;
          id v45 = v65;
          v73 = v40;
          id v74 = v45;
          id v46 = v40;
          v47 = +[SFMultipleLineAlertAction actionWithTitle:v43 detail:v44 handler:v72];
          [v66 addAction:v47];

          v49 = &v73;
          v48 = &v74;
        }
        else
        {
          v50 = (void *)MEMORY[0x1E4FB1410];
          v69[0] = MEMORY[0x1E4F143A8];
          v69[1] = 3221225472;
          v69[2] = __191__SFFormAutoFillMultipleLoginsAlertController_alertControllerWithMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_externalCredentials_preferredStyle_formURL_completionHandler___block_invoke_3;
          v69[3] = &unk_1E5C750C8;
          id v51 = v65;
          v70 = v40;
          id v71 = v51;
          id v52 = v40;
          v44 = [v50 actionWithTitle:v43 style:0 handler:v69];
          [v66 addAction:v44];
          v49 = &v70;
          v48 = &v71;
        }
      }
      uint64_t v36 = [v62 countByEnumeratingWithState:&v75 objects:v85 count:16];
    }
    while (v36);
  }

  v53 = (void *)MEMORY[0x1E4FB1410];
  v54 = _WBSLocalizedString();
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __191__SFFormAutoFillMultipleLoginsAlertController_alertControllerWithMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_externalCredentials_preferredStyle_formURL_completionHandler___block_invoke_4;
  v67[3] = &unk_1E5C74688;
  id v68 = v65;
  id v55 = v65;
  uint64_t v56 = [v53 actionWithTitle:v54 style:1 handler:v67];

  [v66 addAction:v56];
  v57 = (void *)v66[164];
  v66[164] = v56;

  return v66;
}

uint64_t __191__SFFormAutoFillMultipleLoginsAlertController_alertControllerWithMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_externalCredentials_preferredStyle_formURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __191__SFFormAutoFillMultipleLoginsAlertController_alertControllerWithMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_externalCredentials_preferredStyle_formURL_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __191__SFFormAutoFillMultipleLoginsAlertController_alertControllerWithMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_externalCredentials_preferredStyle_formURL_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __191__SFFormAutoFillMultipleLoginsAlertController_alertControllerWithMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_externalCredentials_preferredStyle_formURL_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setCancelsWhenAppEntersBackground:(BOOL)a3
{
  if (self->_cancelsWhenAppEntersBackground != a3)
  {
    self->_cancelsWhenAppEntersBackground = a3;
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v6 = v5;
    if (a3) {
      [v5 addObserver:self selector:sel__sceneDidEnterBackground_ name:*MEMORY[0x1E4FB2E90] object:0];
    }
    else {
      [v5 removeObserver:self name:*MEMORY[0x1E4FB2E90] object:0];
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFFormAutoFillMultipleLoginsAlertController;
  [(SFFormAutoFillMultipleLoginsAlertController *)&v5 viewWillDisappear:a3];
  if (self->_cancelsWhenAppEntersBackground
    || ([(SFFormAutoFillMultipleLoginsAlertController *)self isBeingDismissed] & 1) != 0
    || [(SFFormAutoFillMultipleLoginsAlertController *)self isMovingFromParentViewController])
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x1E4FB2E90] object:0];
  }
}

- (void)_sceneDidEnterBackground:(id)a3
{
  id v8 = a3;
  v4 = [(SFFormAutoFillMultipleLoginsAlertController *)self viewIfLoaded];
  objc_super v5 = [v4 window];
  id v6 = [v5 windowScene];

  if (v6)
  {
    v7 = [v8 object];

    if (v6 == v7) {
      [(SFFormAutoFillMultipleLoginsAlertController *)self _dismissWithAction:self->_cancelAction];
    }
  }
}

- (BOOL)cancelsWhenAppEntersBackground
{
  return self->_cancelsWhenAppEntersBackground;
}

- (void).cxx_destruct
{
}

@end