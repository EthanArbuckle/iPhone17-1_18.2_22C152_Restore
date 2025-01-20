@interface SetSoundDetectorIntentHandler
- (SetSoundDetectorIntentHandler)init;
- (void)handleSetSoundDetector:(id)a3 completion:(id)a4;
- (void)provideParameterOptionsCollectionForSetSoundDetector:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForSetSoundDetector:(id)a3 withCompletion:(id)a4;
- (void)resolveParameterForSetSoundDetector:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForSetSoundDetector:(id)a3 withCompletion:(id)a4;
@end

@implementation SetSoundDetectorIntentHandler

- (SetSoundDetectorIntentHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)SetSoundDetectorIntentHandler;
  v2 = [(SetSoundDetectorIntentHandler *)&v5 init];
  if (v2)
  {
    v3 = +[AXSDDetectorStore sharedInstance];
    [v3 loadDetectors];
  }
  return v2;
}

- (void)resolveOperationForSetSoundDetector:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveParameterForSetSoundDetector:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v8 = [a3 parameter];
  id v7 = +[AXSoundResolutionResult successWithResolvedSound:v8];
  (*((void (**)(id, void *))a4 + 2))(v6, v7);
}

- (void)resolveStateForSetSoundDetector:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)provideParameterOptionsCollectionForSetSoundDetector:(id)a3 withCompletion:(id)a4
{
  v4 = (void (**)(id, void, void *))a4;
  objc_super v5 = +[AXSDSettings sharedInstance];
  id v6 = [v5 soundDetectionState];

  if (!v6)
  {
    id v7 = +[NSError ax_errorWithDomain:@"SiriShortcutsSoundRecognition" description:@"Sound Recognition is currently not enabled. Enable the feature in Accessibility Settings."];
    v4[2](v4, 0, v7);
  }
  v43 = (void (**)(void, void, void))v4;
  id v8 = &AXDeviceSupportsWatchRemoteScreen_ptr;
  v9 = +[AXSDDetectorStore sharedInstance];
  v10 = [v9 localizedNamesByIdentifier];
  id v11 = [v10 mutableCopy];

  v46 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  AXSDSoundDetectionCategories();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v47 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v47)
  {
    int v12 = 0;
    uint64_t v45 = *(void *)v61;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v61 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v60 + 1) + 8 * v13);
        v50 = objc_opt_new();
        uint64_t v51 = v14;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        v15 = AXSDSoundDetectionTypesForCategory();
        id v16 = [v15 countByEnumeratingWithState:&v56 objects:v65 count:16];
        uint64_t v48 = v13;
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v57;
          do
          {
            v19 = 0;
            do
            {
              if (*(void *)v57 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v56 + 1) + 8 * (void)v19);
              int IsAppliance = AXSDSoundDetectionTypeIsAppliance();
              if (IsAppliance & v12)
              {
                int v12 = 1;
              }
              else
              {
                v12 |= IsAppliance;
                v22 = [v11 objectForKey:v20];
                v23 = [[AXSound alloc] initWithIdentifier:v20 displayString:v22];
                [(AXSound *)v23 setCategory:v51];
                [(AXSound *)v23 setIsCustom:&__kCFBooleanFalse];
                [v50 addObject:v23];
                [v11 removeObjectForKey:v20];
              }
              v19 = (char *)v19 + 1;
            }
            while (v17 != v19);
            id v17 = [v15 countByEnumeratingWithState:&v56 objects:v65 count:16];
          }
          while (v17);
        }

        v24 = [v11 allKeys];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v49 = v24;
        id v25 = [v24 countByEnumeratingWithState:&v52 objects:v64 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v53;
          do
          {
            v28 = 0;
            do
            {
              if (*(void *)v53 != v27) {
                objc_enumerationMutation(v49);
              }
              uint64_t v29 = *(void *)(*((void *)&v52 + 1) + 8 * (void)v28);
              v30 = [v8[100] sharedInstance];
              v31 = [v30 detectorWithIdentifier:v29];

              if (v31)
              {
                if ([v31 isCustom])
                {
                  v32 = [v31 category];
                  unsigned int v33 = [v32 isEqualToString:v51];

                  if (v33)
                  {
                    if ([v31 isTrainingComplete])
                    {
                      v34 = [AXSound alloc];
                      v35 = [v31 identifier];
                      [v31 name];
                      v37 = id v36 = v11;
                      v38 = [(AXSound *)v34 initWithIdentifier:v35 displayString:v37];

                      id v11 = v36;
                      id v8 = &AXDeviceSupportsWatchRemoteScreen_ptr;

                      v39 = [v31 category];
                      [(AXSound *)v38 setCategory:v39];

                      [(AXSound *)v38 setIsCustom:&__kCFBooleanTrue];
                      [v50 addObject:v38];
                      [v11 removeObjectForKey:v29];
                    }
                  }
                }
              }

              v28 = (char *)v28 + 1;
            }
            while (v26 != v28);
            id v26 = [v49 countByEnumeratingWithState:&v52 objects:v64 count:16];
          }
          while (v26);
        }
        v40 = AXSDSoundDetectionLocalizedStringForCategory();
        id v41 = [objc_alloc((Class)INObjectSection) initWithTitle:v40 items:v50];
        [v46 addObject:v41];

        uint64_t v13 = v48 + 1;
      }
      while ((id)(v48 + 1) != v47);
      id v47 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
    }
    while (v47);
  }

  id v42 = [objc_alloc((Class)INObjectCollection) initWithSections:v46];
  ((void (**)(void, id, void))v43)[2](v43, v42, 0);
}

- (void)handleSetSoundDetector:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, AXSetSoundDetectorIntentResponse *))a4;
  id v7 = [v5 parameter];
  id v8 = [v7 identifier];
  if (!v8)
  {
    uint64_t v18 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "SetSoundDetectorIntentHandler: Received a parameter with a nil identifier.", v32, 2u);
    }
    goto LABEL_26;
  }
  if ([v5 operation] == (id)1 && !objc_msgSend(v5, "state"))
  {
    uint64_t v18 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10000C1B8((uint64_t)v5, v18);
    }
LABEL_26:

    v30 = [AXSetSoundDetectorIntentResponse alloc];
    uint64_t v31 = 5;
LABEL_27:
    v28 = [(AXSetSoundDetectorIntentResponse *)v30 initWithCode:v31 userActivity:0];
    v6[2](v6, v28);
    goto LABEL_28;
  }
  v9 = +[AXSDSettings sharedInstance];
  v10 = [v9 enabledSoundDetectionTypes];
  id v11 = [v7 identifier];
  unsigned int v12 = [v10 containsObject:v11];

  uint64_t v13 = [v7 isCustom];
  LODWORD(v10) = [v13 BOOLValue];

  if (v10)
  {
    uint64_t v14 = +[AXSDSettings sharedInstance];
    v15 = [v14 enabledKShotDetectorIdentifiers];
    id v16 = [v7 identifier];
    unsigned int v12 = [v15 containsObject:v16];
  }
  if ([v5 operation] == (id)2) {
    int v17 = v12 ^ 1;
  }
  else {
    int v17 = [v5 state] == (id)1;
  }
  v19 = [v7 isCustom];
  unsigned __int8 v20 = [v19 BOOLValue];

  if ((v20 & 1) == 0)
  {
    char v26 = v17 ^ 1 | v12;
    v23 = +[AXSDSettings sharedInstance];
    id v25 = [v7 identifier];
    if (v26) {
      [v23 removeSoundDetectionType:v25];
    }
    else {
      [v23 addSoundDetectionType:v25];
    }
    goto LABEL_21;
  }
  v21 = +[AXSDDetectorStore sharedInstance];
  v22 = [v7 identifier];
  v23 = [v21 detectorWithIdentifier:v22];

  if (v23 && [v23 isCustom])
  {
    uint64_t v24 = v17 & (v12 ^ 1);
    id v25 = +[AXSDSettings sharedInstance];
    [v25 setKShotDetectorIsEnabled:v23 isEnabled:v24];
LABEL_21:

    if (v17)
    {
      uint64_t v29 = +[AXSDSettings sharedInstance];
      [v29 setSoundDetectionState:2];
    }
    v30 = [AXSetSoundDetectorIntentResponse alloc];
    uint64_t v31 = 4;
    goto LABEL_27;
  }
  uint64_t v27 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    sub_10000C310(v7, v27);
  }

  v28 = [[AXSetSoundDetectorIntentResponse alloc] initWithCode:5 userActivity:0];
  v6[2](v6, v28);

LABEL_28:
}

@end