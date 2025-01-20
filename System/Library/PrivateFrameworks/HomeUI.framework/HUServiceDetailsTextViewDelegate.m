@interface HUServiceDetailsTextViewDelegate
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (HUServiceDetailsItemManager)itemManager;
- (UIViewController)viewController;
- (id)privacyIdentifierForSectionIdentifier:(id)a3;
- (id)unifiedIdentifiersForSectionIdentifier:(id)a3;
- (void)dismissTextViewController;
- (void)displayPrivacyInformationWithIdentifier:(id)a3;
- (void)displayUnifiedPrivacyInformationWithIdentifiers:(id)a3;
- (void)setItemManager:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation HUServiceDetailsTextViewDelegate

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v68 = self;
    __int16 v69 = 2112;
    id v70 = v10;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", buf, 0x16u);
  }

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F696F8]) initWithURL:v10];
  if ([v12 destination] == 17)
  {
    v13 = [(HUServiceDetailsTextViewDelegate *)self itemManager];
    v14 = [v13 sourceItem];
    v15 = [v14 latestResults];
    v16 = [v15 objectForKey:*MEMORY[0x1E4F68740]];

    v17 = [MEMORY[0x1E4F69608] sharedManager];
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v10 resolvingAgainstBaseURL:0];
    v19 = [v18 queryItems];
    v20 = objc_msgSend(v19, "na_firstObjectPassingTest:", &__block_literal_global_135);

    v21 = [v20 value];

    if (v21)
    {
      id v63 = v9;
      v22 = [v20 value];
      uint64_t v23 = NSStringToHMSymptomType();

      v24 = [objc_alloc(MEMORY[0x1E4F2EB68]) initWithType:v23];
      if (v16)
      {
        v25 = [(HUServiceDetailsTextViewDelegate *)self viewController];
        [v17 fixSymptom:v24 forFixableObject:v16 presentingViewController:v25];
      }
      else
      {
        v62 = v12;
        v31 = [(HUServiceDetailsTextViewDelegate *)self itemManager];
        v32 = [v31 sourceItem];
        v33 = [v32 accessories];
        uint64_t v34 = [v33 count];

        if (v34 != 1) {
          NSLog(&cfstr_AttemptingToFi.isa);
        }
        v35 = [(HUServiceDetailsTextViewDelegate *)self itemManager];
        v36 = [v35 sourceItem];
        if ([v36 conformsToProtocol:&unk_1F1A3D558]) {
          v37 = v36;
        }
        else {
          v37 = 0;
        }
        id v38 = v37;

        v25 = [v38 accessories];

        v39 = [v25 anyObject];
        v40 = [(HUServiceDetailsTextViewDelegate *)self viewController];
        [v17 fixSymptom:v24 forFixableObject:v39 presentingViewController:v40];

        v16 = 0;
        v12 = v62;
      }

      id v9 = v63;
    }
    else
    {
      v24 = HFLogForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE345000, v24, OS_LOG_TYPE_ERROR, "Unable to initiate fix for symptom. Couldn't find a symptom type.", buf, 2u);
      }
    }

    BOOL v26 = 0;
    goto LABEL_37;
  }
  if (!a6)
  {
    v27 = v12;
    v28 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_locationDeviceSettingsURL");
    int v29 = [v10 isEqual:v28];

    if (v29)
    {
      v16 = [MEMORY[0x1E4F69378] sharedInstance];
      id v30 = (id)[v16 openURL:v10];
      BOOL v26 = 1;
    }
    else
    {
      if (objc_msgSend(v10, "hf_isHomeKnowledgeBasedArticleURL"))
      {
        BOOL v26 = 1;
        v12 = v27;
        goto LABEL_38;
      }
      v41 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_cameraRecordingURL");
      int v42 = [v10 isEqual:v41];

      if (v42)
      {
        v43 = [(HUServiceDetailsTextViewDelegate *)self viewController];
        v44 = [v43 navigationController];
        v45 = v44;
        if (v44)
        {
          id v46 = v44;
        }
        else
        {
          id v46 = [(HUServiceDetailsTextViewDelegate *)self viewController];
        }
        v51 = v46;

        id v52 = objc_alloc(MEMORY[0x1E4F83AE8]);
        v53 = _HULocalizedStringWithDefaultValue(@"HUCameraAndRecordingLearnMoreTitle", @"HUCameraAndRecordingLearnMoreTitle", 1);
        v54 = _HULocalizedStringWithDefaultValue(@"HUCameraAndRecordingLearnMoreBody", @"HUCameraAndRecordingLearnMoreBody", 1);
        v55 = (void *)[v52 initWithTitle:v53 detailText:v54 symbolName:0 contentLayout:2];

        v16 = [MEMORY[0x1E4F83A80] boldButton];
        v56 = _HULocalizedStringWithDefaultValue(@"HUDoneTitle", @"HUDoneTitle", 1);
        [v16 setTitle:v56 forState:0];

        [v16 addTarget:self action:sel_dismissTextViewController forControlEvents:64];
        v57 = [v55 buttonTray];
        [v57 addButton:v16];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __87__HUServiceDetailsTextViewDelegate_textView_shouldInteractWithURL_inRange_interaction___block_invoke_92;
        block[3] = &unk_1E63850E0;
        id v65 = v51;
        id v66 = v55;
        id v58 = v51;
        id v59 = v55;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      else
      {
        objc_opt_class();
        id v47 = v9;
        if (objc_opt_isKindOfClass()) {
          v48 = v47;
        }
        else {
          v48 = 0;
        }
        id v49 = v48;

        v16 = [v49 identifier];

        v50 = [(HUServiceDetailsTextViewDelegate *)self unifiedIdentifiersForSectionIdentifier:v16];
        if (v50)
        {
          [(HUServiceDetailsTextViewDelegate *)self displayUnifiedPrivacyInformationWithIdentifiers:v50];
        }
        else
        {
          v60 = [(HUServiceDetailsTextViewDelegate *)self privacyIdentifierForSectionIdentifier:v16];
          [(HUServiceDetailsTextViewDelegate *)self displayPrivacyInformationWithIdentifier:v60];
        }
      }
      BOOL v26 = 0;
    }
    v12 = v27;
LABEL_37:

    goto LABEL_38;
  }
  BOOL v26 = 0;
LABEL_38:

  return v26;
}

uint64_t __87__HUServiceDetailsTextViewDelegate_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F68D88]];

  return v3;
}

uint64_t __87__HUServiceDetailsTextViewDelegate_textView_shouldInteractWithURL_inRange_interaction___block_invoke_92(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)dismissTextViewController
{
  uint64_t v3 = [(HUServiceDetailsTextViewDelegate *)self viewController];
  v4 = [v3 navigationController];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(HUServiceDetailsTextViewDelegate *)self viewController];
  }
  id v7 = v6;

  [v7 dismissViewControllerAnimated:1 completion:0];
}

- (void)displayUnifiedPrivacyInformationWithIdentifiers:(id)a3
{
  id v12 = a3;
  if (!v12)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HUServiceDetailsTextViewDelegate.m", 103, @"Invalid parameter not satisfying: %@", @"unifiedIdentifiers" object file lineNumber description];
  }
  v5 = [(HUServiceDetailsTextViewDelegate *)self viewController];
  id v6 = [v5 navigationController];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(HUServiceDetailsTextViewDelegate *)self viewController];
  }
  id v9 = v8;

  id v10 = [MEMORY[0x1E4F83AD8] presenterForPrivacyUnifiedAboutWithIdentifiers:v12];
  [v10 setPresentingViewController:v9];
  [v10 present];
}

- (void)displayPrivacyInformationWithIdentifier:(id)a3
{
  id v13 = a3;
  if (!v13)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HUServiceDetailsTextViewDelegate.m", 112, @"Invalid parameter not satisfying: %@", @"privacyIdentifier" object file lineNumber description];
  }
  v5 = [(HUServiceDetailsTextViewDelegate *)self viewController];
  id v6 = [v5 navigationController];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(HUServiceDetailsTextViewDelegate *)self viewController];
  }
  id v9 = v8;

  id v10 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:v13];
  v11 = [v10 splashController];
  [v11 setDisplayDeviceType:6];

  [v10 setPresentingViewController:v9];
  [v10 present];
}

- (id)privacyIdentifierForSectionIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:*MEMORY[0x1E4F685A0]])
  {
    v4 = (id *)MEMORY[0x1E4F83B48];
LABEL_9:
    id v5 = *v4;
    goto LABEL_10;
  }
  if ([v3 isEqual:*MEMORY[0x1E4F68580]])
  {
    v4 = (id *)MEMORY[0x1E4F83B38];
    goto LABEL_9;
  }
  if ([v3 isEqual:*MEMORY[0x1E4F68548]])
  {
    v4 = (id *)MEMORY[0x1E4F83B10];
    goto LABEL_9;
  }
  if ([v3 isEqual:*MEMORY[0x1E4F68528]])
  {
    v4 = (id *)MEMORY[0x1E4F83B30];
    goto LABEL_9;
  }
  id v5 = 0;
LABEL_10:

  return v5;
}

- (id)unifiedIdentifiersForSectionIdentifier:(id)a3
{
  v6[2] = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:*MEMORY[0x1E4F68548]])
  {
    uint64_t v3 = *MEMORY[0x1E4F83B40];
    v6[0] = *MEMORY[0x1E4F83B10];
    v6[1] = v3;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (HUServiceDetailsItemManager)itemManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemManager);

  return (HUServiceDetailsItemManager *)WeakRetained;
}

- (void)setItemManager:(id)a3
{
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (UIViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);

  objc_destroyWeak((id *)&self->_itemManager);
}

@end