@interface MUPlaceEnrichmentActionManager
- (MKMapItem)mapItem;
- (MUAMSResultProvider)amsResultProvider;
- (MUExternalActionHandling)externalActionHandler;
- (MUPlaceActionManager)placeActionManager;
- (MUPlaceCallToActionSectionControllerDelegate)callToActionDelegate;
- (MUPlaceDataAvailability)dataAvailability;
- (MUPlaceEnrichmentActionManager)initWithPlaceActionManager:(id)a3 mapItem:(id)a4 dataAvailability:(id)a5 amsResultProvider:(id)a6 callToActionDelegate:(id)a7 contextMenuDelegate:(id)a8 externalActionHandler:(id)a9 analyticsDelegate:(id)a10 onActionUpdate:(id)a11;
- (MUPlaceEnrichmentDataProvider)enrichmentDataProvider;
- (MUPlaceEnrichmentSectionAnalyticsDelegate)analyticsDelegate;
- (MUPlaceEnrichmentSectionContextMenuDelegate)contextMenuDelegate;
- (MUPresentationOptions)presentationOptions;
- (NSMutableArray)externalActionsControllers;
- (NSMutableDictionary)externalActionsPairs;
- (NSMutableSet)supportedActions;
- (UIView)sourceView;
- (id)adamIDForAppCategory:(id)a3;
- (id)dictionaryForAction:(id)a3;
- (id)onActionUpdate;
- (id)supportedPlaceEnrichmentActions;
- (void)addExternalActionsAsSupportedActions:(id)a3;
- (void)addPhotoAction:(id)a3;
- (void)configureWithEnrichmentDataProvider:(id)a3 presentationOptions:(id)a4;
- (void)contextMenuAction:(id)a3;
- (void)directionsAction:(id)a3;
- (void)getAppAction:(id)a3;
- (void)layoutActionsUsingArguments:(id)a3 completion:(id)a4;
- (void)performActionUsingArguments:(id)a3 contextMenu:(id)a4 completion:(id)a5;
- (void)ratePlaceAction:(id)a3;
- (void)setAmsResultProvider:(id)a3;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setCallToActionDelegate:(id)a3;
- (void)setContextMenuDelegate:(id)a3;
- (void)setDataAvailability:(id)a3;
- (void)setEnrichmentDataProvider:(id)a3;
- (void)setExternalActionHandler:(id)a3;
- (void)setExternalActionsControllers:(id)a3;
- (void)setExternalActionsPairs:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setOnActionUpdate:(id)a3;
- (void)setPlaceActionManager:(id)a3;
- (void)setPresentationOptions:(id)a3;
- (void)setSourceView:(id)a3;
- (void)setSupportedActions:(id)a3;
@end

@implementation MUPlaceEnrichmentActionManager

- (MUPlaceEnrichmentActionManager)initWithPlaceActionManager:(id)a3 mapItem:(id)a4 dataAvailability:(id)a5 amsResultProvider:(id)a6 callToActionDelegate:(id)a7 contextMenuDelegate:(id)a8 externalActionHandler:(id)a9 analyticsDelegate:(id)a10 onActionUpdate:(id)a11
{
  id v35 = a3;
  id v34 = a4;
  id v33 = a5;
  id v32 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  v36.receiver = self;
  v36.super_class = (Class)MUPlaceEnrichmentActionManager;
  v23 = [(MUPlaceEnrichmentActionManager *)&v36 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_placeActionManager, a3);
    objc_storeStrong((id *)&v24->_mapItem, a4);
    objc_storeStrong((id *)&v24->_dataAvailability, a5);
    objc_storeStrong((id *)&v24->_amsResultProvider, a6);
    objc_storeWeak((id *)&v24->_callToActionDelegate, v18);
    objc_storeWeak((id *)&v24->_contextMenuDelegate, v19);
    objc_storeWeak((id *)&v24->_externalActionHandler, v20);
    objc_storeWeak((id *)&v24->_analyticsDelegate, v21);
    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    externalActionsPairs = v24->_externalActionsPairs;
    v24->_externalActionsPairs = v25;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    externalActionsControllers = v24->_externalActionsControllers;
    v24->_externalActionsControllers = v27;

    v29 = _Block_copy(v22);
    id onActionUpdate = v24->_onActionUpdate;
    v24->_id onActionUpdate = v29;
  }
  return v24;
}

- (id)supportedPlaceEnrichmentActions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [(MUPlaceEnrichmentActionManager *)self setSupportedActions:v3];

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [(MUPlaceEnrichmentActionManager *)self placeActionManager];
  v6 = [v5 createRowActionsWithStyle:0];
  [v4 addObjectsFromArray:v6];

  v7 = [(MUPlaceEnrichmentActionManager *)self placeActionManager];
  v8 = [v7 createFooterActions];
  [v4 addObjectsFromArray:v8];

  v9 = [(MUPlaceEnrichmentActionManager *)self placeActionManager];
  v10 = [v9 createContactActions];
  [v4 addObjectsFromArray:v10];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __65__MUPlaceEnrichmentActionManager_supportedPlaceEnrichmentActions__block_invoke;
  v20[3] = &unk_1E5750950;
  v20[4] = self;
  [v4 enumerateObjectsUsingBlock:v20];
  v11 = [(MUPlaceEnrichmentActionManager *)self supportedActions];
  [(MUPlaceEnrichmentActionManager *)self directionsAction:v11];

  v12 = [(MUPlaceEnrichmentActionManager *)self supportedActions];
  [(MUPlaceEnrichmentActionManager *)self ratePlaceAction:v12];

  v13 = [(MUPlaceEnrichmentActionManager *)self supportedActions];
  [(MUPlaceEnrichmentActionManager *)self addPhotoAction:v13];

  v14 = [(MUPlaceEnrichmentActionManager *)self supportedActions];
  [(MUPlaceEnrichmentActionManager *)self getAppAction:v14];

  v15 = [(MUPlaceEnrichmentActionManager *)self supportedActions];
  [(MUPlaceEnrichmentActionManager *)self contextMenuAction:v15];

  v16 = [(MUPlaceEnrichmentActionManager *)self supportedActions];
  [(MUPlaceEnrichmentActionManager *)self addExternalActionsAsSupportedActions:v16];

  v17 = [(MUPlaceEnrichmentActionManager *)self supportedActions];
  id v18 = (void *)[v17 copy];

  return v18;
}

void __65__MUPlaceEnrichmentActionManager_supportedPlaceEnrichmentActions__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [v11 type];
  switch(v3)
  {
    case 1:
      goto LABEL_4;
    case 2:
    case 3:
    case 6:
    case 7:
    case 8:
    case 9:
    case 12:
    case 14:
    case 15:
    case 17:
    case 18:
    case 19:
    case 20:
      goto LABEL_15;
    case 4:
      id v4 = [MUPlaceEnrichmentAction alloc];
      uint64_t v5 = 10;
      uint64_t v6 = 4;
      goto LABEL_13;
    case 5:
    case 22:
      id v4 = [MUPlaceEnrichmentAction alloc];
      uint64_t v5 = 9;
      uint64_t v6 = 22;
      goto LABEL_13;
    case 10:
      if (![v11 enabled]) {
        goto LABEL_15;
      }
      id v4 = [MUPlaceEnrichmentAction alloc];
      uint64_t v5 = 2;
      uint64_t v6 = 10;
      goto LABEL_13;
    case 11:
      id v4 = [MUPlaceEnrichmentAction alloc];
      uint64_t v5 = 4;
      uint64_t v6 = 11;
      goto LABEL_13;
    case 13:
      id v4 = [MUPlaceEnrichmentAction alloc];
      uint64_t v5 = 3;
      uint64_t v6 = 13;
      goto LABEL_13;
    case 16:
      id v4 = [MUPlaceEnrichmentAction alloc];
      uint64_t v5 = 6;
      uint64_t v6 = 16;
      goto LABEL_13;
    case 21:
      id v4 = [MUPlaceEnrichmentAction alloc];
      uint64_t v5 = 5;
      uint64_t v6 = 21;
      goto LABEL_13;
    default:
      if (v3 != 32) {
        goto LABEL_15;
      }
LABEL_4:
      v7 = [*(id *)(a1 + 32) dataAvailability];
      int v8 = [v7 supportsReportAnIssue];

      if (!v8) {
        goto LABEL_15;
      }
      id v4 = [MUPlaceEnrichmentAction alloc];
      uint64_t v5 = 11;
      uint64_t v6 = 32;
LABEL_13:
      v9 = [(MUPlaceEnrichmentAction *)v4 initWithActionType:v5 isValidated:1 mkActionType:v6];
      if (v9)
      {
        v10 = [*(id *)(a1 + 32) supportedActions];
        [v10 addObject:v9];
      }
LABEL_15:

      return;
  }
}

- (id)dictionaryForAction:(id)a3
{
  return (id)[a3 enrichmentAction];
}

- (void)configureWithEnrichmentDataProvider:(id)a3 presentationOptions:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = MUGetMUPlaceEnrichmentActionManagerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1931EA000, v8, OS_LOG_TYPE_DEBUG, "Configuring enrichmentDataProvider: %@ and presentationOptions: %@", (uint8_t *)&v11, 0x16u);
  }

  [(MUPlaceEnrichmentActionManager *)self setEnrichmentDataProvider:v6];
  [(MUPlaceEnrichmentActionManager *)self setPresentationOptions:v7];
  v9 = [(MUPlaceEnrichmentActionManager *)self presentationOptions];
  v10 = [v9 sourceView];
  [(MUPlaceEnrichmentActionManager *)self setSourceView:v10];
}

- (id)adamIDForAppCategory:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MUPlaceEnrichmentActionManager *)self externalActionsPairs];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = [v6 viewModels];
    int v8 = [v7 firstObject];
    v9 = [v8 appAdamId];
  }
  else
  {
    v10 = MUGetMUPlaceEnrichmentActionManagerLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_1931EA000, v10, OS_LOG_TYPE_DEBUG, "No app adamID found for appCategory: %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (void)performActionUsingArguments:(id)a3 contextMenu:(id)a4 completion:(id)a5
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v88 = a4;
  id v9 = a5;
  v10 = MUGetMUPlaceEnrichmentActionManagerLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1931EA000, v10, OS_LOG_TYPE_DEBUG, "Performing action using arguments : %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v127 = 0x3032000000;
  v128 = __Block_byref_object_copy__7;
  v129 = __Block_byref_object_dispose__7;
  id v130 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke;
  aBlock[3] = &unk_1E5750978;
  id v11 = v9;
  id v116 = v11;
  p_long long buf = &buf;
  int v12 = (void (**)(void *, void))_Block_copy(aBlock);
  uint64_t v109 = 0;
  v110 = &v109;
  uint64_t v111 = 0x3032000000;
  v112 = __Block_byref_object_copy__7;
  v113 = __Block_byref_object_dispose__7;
  id v114 = 0;
  id v13 = [(MUPlaceEnrichmentActionManager *)self sourceView];
  uint64_t v14 = [v13 traitCollection];
  BOOL v15 = [v14 userInterfaceIdiom] == 0;

  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_9;
  v103[3] = &unk_1E57509A0;
  BOOL v108 = v15;
  id v16 = v8;
  v106 = &v109;
  uint64_t v107 = 13;
  id v104 = v16;
  v105 = self;
  v17 = (void (**)(void))_Block_copy(v103);
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_14;
  v101[3] = &unk_1E57509F0;
  BOOL v102 = v15;
  v101[5] = &v109;
  v101[6] = 13;
  v101[4] = self;
  id v18 = (void (**)(void))_Block_copy(v101);
  id v19 = [(MUPlaceEnrichmentActionManager *)self supportedActions];
  BOOL v20 = [v19 count] == 0;

  if (v20)
  {
    v30 = MUGetMUPlaceEnrichmentActionManagerLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v121) = 0;
      _os_log_impl(&dword_1931EA000, v30, OS_LOG_TYPE_ERROR, "ERROR: Performing action as no supported actions.", (uint8_t *)&v121, 2u);
    }

    v12[2](v12, 0);
  }
  else
  {
    id v21 = [v16 objectForKeyedSubscript:0x1EE3CE4E0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v23 = [v16 objectForKeyedSubscript:0x1EE3CE4E0];
      v24 = [(MUPlaceEnrichmentActionManager *)self supportedActions];
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_17;
      v98[3] = &unk_1E5750A18;
      id v87 = v23;
      id v99 = v87;
      v100 = &buf;
      id v25 = (id)[v24 objectsPassingTest:v98];

      v26 = *(void **)(*((void *)&buf + 1) + 40);
      if (v26)
      {
        switch([v26 actionType])
        {
          case 0:
            v31 = MUGetMUPlaceEnrichmentActionManagerLog();
            if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              goto LABEL_15;
            }
            LODWORD(v121) = 138412290;
            *(void *)((char *)&v121 + 4) = v16;
            id v32 = "MUPlaceEnrichmentActionManagerUnknown action invoked from Showcase %@";
            goto LABEL_14;
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 9:
          case 10:
          case 11:
            v18[2](v18);
            v17[2](v17);
            v27 = [MEMORY[0x1E4F643A8] moduleFromModuleType:40];
            v28 = (void *)v110[5];
            if (v28)
            {
              id v29 = v28;
            }
            else
            {
              id v34 = [(MUPlaceEnrichmentActionManager *)self presentationOptions];
              id v29 = [v34 sourceView];
            }
            if (v88)
            {
              id v35 = v88;

              id v29 = v35;
            }
            uint64_t v36 = *MEMORY[0x1E4F30DC8];
            v124[0] = *MEMORY[0x1E4F30DC0];
            v124[1] = v36;
            v125[0] = v27;
            v125[1] = v29;
            v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v125 forKeys:v124 count:2];
            v38 = objc_msgSend(MEMORY[0x1E4F30F98], "actionItemWithType:", objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "mkActionType"));
            v39 = [(MUPlaceEnrichmentActionManager *)self placeActionManager];
            v96[0] = MEMORY[0x1E4F143A8];
            v96[1] = 3221225472;
            v96[2] = __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_21;
            v96[3] = &unk_1E574EEA8;
            v97 = v12;
            [v39 performAction:v38 options:v37 completion:v96];

            break;
          case 7:
            v42 = [(MUPlaceEnrichmentActionManager *)self callToActionDelegate];
            v43 = [(MUPlaceEnrichmentActionManager *)self presentationOptions];
            [v42 presentPOIEnrichmentWithPresentationOptions:v43];

            v31 = [(MUPlaceEnrichmentActionManager *)self analyticsDelegate];
            [v31 didTapRatePlace];
            goto LABEL_50;
          case 8:
            v18[2](v18);
            v17[2](v17);
            uint64_t v40 = v110[5];
            if (v40)
            {
              v41 = (void *)v110[5];
            }
            else
            {
              v23 = [(MUPlaceEnrichmentActionManager *)self presentationOptions];
              v41 = [v23 sourceView];
            }
            v64 = [(MUPlaceEnrichmentActionManager *)self presentationOptions];
            [v64 setSourceView:v41];

            if (!v40)
            {
            }
            v65 = [(MUPlaceEnrichmentActionManager *)self callToActionDelegate];
            v66 = [(MUPlaceEnrichmentActionManager *)self presentationOptions];
            [v65 presentAddPhotosWithPresentationOptions:v66 entryPoint:0 originTarget:0];

            v31 = [(MUPlaceEnrichmentActionManager *)self analyticsDelegate];
            [v31 didTapAddPhoto];
LABEL_50:
            uint64_t v33 = 1;
            goto LABEL_16;
          case 12:
            *(void *)&long long v121 = 0;
            *((void *)&v121 + 1) = &v121;
            uint64_t v122 = 0x2020000000;
            char v123 = 0;
            v44 = [v16 objectForKeyedSubscript:0x1EE3CE520];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v45 = [v16 objectForKeyedSubscript:0x1EE3CE520];
              BOOL v85 = v45 != 0;
            }
            else
            {
              BOOL v85 = 0;
            }

            v46 = [v16 objectForKeyedSubscript:0x1EE3CE500];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v47 = [v16 objectForKeyedSubscript:0x1EE3CE500];
              BOOL v48 = v47 != 0;

              if (v85 && v48)
              {
                v49 = [v16 objectForKeyedSubscript:0x1EE3CE520];
                v50 = [v16 objectForKeyedSubscript:0x1EE3CE500];
                int v51 = NSBOOLFromString();

                if (v49) {
                  int v52 = v51;
                }
                else {
                  int v52 = 0;
                }
                if (v52 != 1)
                {
                  v54 = MUGetMUPlaceEnrichmentActionManagerLog();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v119 = 138412290;
                    id v120 = v16;
                    _os_log_impl(&dword_1931EA000, v54, OS_LOG_TYPE_ERROR, "Action arguments not valid for External Action: %@", v119, 0xCu);
                  }
                  goto LABEL_80;
                }
                v53 = [(MUPlaceEnrichmentActionManager *)self externalActionsPairs];
                v54 = [v53 objectForKey:v49];

                v55 = MUGetMUPlaceEnrichmentActionManagerLog();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
                {
                  v56 = *(void **)(*((void *)&buf + 1) + 40);
                  *(_DWORD *)v119 = 138412290;
                  id v120 = v56;
                  _os_log_impl(&dword_1931EA000, v55, OS_LOG_TYPE_DEBUG, "Opening external action for showcase: %@", v119, 0xCu);
                }

                id obja = [(MUPlaceEnrichmentActionManager *)self enrichmentDataProvider];
                v57 = [obja placeEnrichmentData];
                v58 = [v57 enrichmentEntities];
                v59 = [v58 firstObject];
                v86 = [v59 appAdamIds];

                uint64_t v60 = [v86 count];
                v61 = MUGetMUPlaceEnrichmentActionManagerLog();
                BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG);
                if (v60)
                {
                  if (v62)
                  {
                    *(_DWORD *)v119 = 138412290;
                    id v120 = v86;
                    _os_log_impl(&dword_1931EA000, v61, OS_LOG_TYPE_DEBUG, "AdamId's found were %@", v119, 0xCu);
                  }

                  v93[0] = MEMORY[0x1E4F143A8];
                  v93[1] = 3221225472;
                  v93[2] = __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_22;
                  v93[3] = &unk_1E5750A68;
                  v94 = v54;
                  v95 = &v121;
                  [v86 enumerateObjectsUsingBlock:v93];
                  v63 = v94;
                  goto LABEL_67;
                }
                if (v62)
                {
                  *(_WORD *)v119 = 0;
                  _os_log_impl(&dword_1931EA000, v61, OS_LOG_TYPE_DEBUG, "No AdamIds were found which means that we need to execute a flexible action link.", v119, 2u);
                }

                long long v91 = 0u;
                long long v92 = 0u;
                long long v89 = 0u;
                long long v90 = 0u;
                v63 = [v54 viewModels];
                uint64_t v67 = [v63 countByEnumeratingWithState:&v89 objects:v118 count:16];
                if (v67)
                {
                  v82 = v54;
                  id obj = v63;
                  uint64_t v68 = *(void *)v90;
                  while (1)
                  {
                    for (uint64_t i = 0; i != v67; ++i)
                    {
                      if (*(void *)v90 != v68) {
                        objc_enumerationMutation(obj);
                      }
                      v70 = *(void **)(*((void *)&v89 + 1) + 8 * i);
                      if ([v70 linkType] == 4)
                      {
                        v71 = MUGetMUPlaceEnrichmentActionManagerLog();
                        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)v119 = 138412290;
                          id v120 = v70;
                          _os_log_impl(&dword_1931EA000, v71, OS_LOG_TYPE_DEBUG, "Found a web link with view model %@", v119, 0xCu);
                        }

                        v54 = v82;
                        v63 = obj;
                        v72 = [v82 actionController];
                        [v72 openPartnerActionUsingViewModel:v70];

                        *(unsigned char *)(*((void *)&v121 + 1) + 24) = 1;
                        goto LABEL_67;
                      }
                    }
                    uint64_t v67 = [obj countByEnumeratingWithState:&v89 objects:v118 count:16];
                    if (!v67)
                    {
                      v54 = v82;
                      v63 = obj;
                      break;
                    }
                  }
                }
LABEL_67:

                if (*(unsigned char *)(*((void *)&v121 + 1) + 24))
                {
LABEL_79:

LABEL_80:
                  goto LABEL_81;
                }
                uint64_t v73 = [v86 count];
                v74 = MUGetMUPlaceEnrichmentActionManagerLog();
                BOOL v75 = os_log_type_enabled(v74, OS_LOG_TYPE_ERROR);
                if (v73)
                {
                  if (v75)
                  {
                    v76 = *(void **)(*((void *)&buf + 1) + 40);
                    *(_DWORD *)v119 = 138412290;
                    id v120 = v76;
                    v77 = "Failed to invoke action: %@ as there are no view models with appAdamIDs that match the showcas"
                          "e specific appAdamIDs";
LABEL_73:
                    _os_log_impl(&dword_1931EA000, v74, OS_LOG_TYPE_ERROR, v77, v119, 0xCu);
                  }
                }
                else if (v75)
                {
                  v78 = *(void **)(*((void *)&buf + 1) + 40);
                  *(_DWORD *)v119 = 138412290;
                  id v120 = v78;
                  v77 = "Failed to invoke action: %@ as there are no view models with flexible action links";
                  goto LABEL_73;
                }

                v79 = MUGetMUPlaceEnrichmentActionManagerLog();
                if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                {
                  v80 = [v54 viewModels];
                  *(_DWORD *)v119 = 138412290;
                  id v120 = v80;
                  _os_log_impl(&dword_1931EA000, v79, OS_LOG_TYPE_ERROR, "--> MapItem external action view models : %@", v119, 0xCu);
                }
                v81 = MUGetMUPlaceEnrichmentActionManagerLog();
                if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v119 = 138412290;
                  id v120 = v86;
                  _os_log_impl(&dword_1931EA000, v81, OS_LOG_TYPE_ERROR, "--> Showcase ordered appAdamIds: %@", v119, 0xCu);
                }

                goto LABEL_79;
              }
            }
            else
            {
            }
            v49 = MUGetMUPlaceEnrichmentActionManagerLog();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v119 = 138412290;
              id v120 = v16;
              _os_log_impl(&dword_1931EA000, v49, OS_LOG_TYPE_ERROR, "Action arguments missing arguments needed to invoke external action: %@", v119, 0xCu);
            }
LABEL_81:

            v12[2](v12, *(unsigned __int8 *)(*((void *)&v121 + 1) + 24));
            _Block_object_dispose(&v121, 8);
            break;
          default:
            break;
        }
      }
      else
      {
        v31 = MUGetMUPlaceEnrichmentActionManagerLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v121) = 138412290;
          *(void *)((char *)&v121 + 4) = v16;
          id v32 = "ERROR: Unsupported action invoked from Showcase %@";
LABEL_14:
          _os_log_impl(&dword_1931EA000, v31, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v121, 0xCu);
        }
LABEL_15:
        uint64_t v33 = 0;
LABEL_16:

        v12[2](v12, v33);
      }
    }
  }

  _Block_object_dispose(&v109, 8);
  _Block_object_dispose(&buf, 8);
}

uint64_t __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke(uint64_t result)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    v2 = MUGetMUPlaceEnrichmentActionManagerLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 40);
      id v4 = NSStringFromBOOL();
      int v5 = 138412546;
      uint64_t v6 = v3;
      __int16 v7 = 2112;
      id v8 = v4;
      _os_log_impl(&dword_1931EA000, v2, OS_LOG_TYPE_DEBUG, "Invoking completion handler for action: %@. Performed Action: (%@)", (uint8_t *)&v5, 0x16u);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

void __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 64))
  {
    id v25 = [*(id *)(a1 + 32) objectForKeyedSubscript:0x1EE3CE560];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:0x1EE3CE560];

      if (v2)
      {
        uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:0x1EE3CE560];
        id v4 = [v3 objectForKeyedSubscript:0x1EE3CE5C0];
        [v4 doubleValue];
        double v6 = v5;
        __int16 v7 = [v3 objectForKeyedSubscript:0x1EE3CE5E0];
        [v7 doubleValue];
        double v9 = v8;
        v10 = [v3 objectForKeyedSubscript:0x1EE3CE5A0];
        [v10 doubleValue];
        double v12 = v11;
        id v13 = [v3 objectForKeyedSubscript:0x1EE3CE580];
        [v13 doubleValue];
        double v15 = v14;

        uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v9, v12, v15);
        uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
        id v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = v16;

        if (GEOConfigGetBOOL())
        {
          id v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          BOOL v20 = [MEMORY[0x1E4FB1618] redColor];
          [v19 setBackgroundColor:v20];

          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setAlpha:0.1];
        }
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setUserInteractionEnabled:0];
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setTag:*(void *)(a1 + 56)];
        id v21 = [*(id *)(a1 + 40) sourceView];
        [v21 addSubview:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

        id v22 = MUGetMUPlaceEnrichmentActionManagerLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v32.origin.x = v6;
          v32.origin.y = v9;
          v32.size.width = v12;
          v32.size.height = v15;
          v23 = NSStringFromCGRect(v32);
          uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          *(_DWORD *)long long buf = 138412546;
          v27 = v23;
          __int16 v28 = 2112;
          uint64_t v29 = v24;
          _os_log_impl(&dword_1931EA000, v22, OS_LOG_TYPE_DEBUG, "Added a dummy view at: %@. View: %@", buf, 0x16u);
        }
      }
    }
    else
    {
    }
  }
}

void __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_14(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 56))
  {
    v2 = [*(id *)(a1 + 32) sourceView];
    uint64_t v3 = [v2 subviews];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_2;
    v8[3] = &unk_1E57509C8;
    uint64_t v4 = *(void *)(a1 + 48);
    v8[4] = *(void *)(a1 + 40);
    v8[5] = v4;
    [v3 enumerateObjectsUsingBlock:v8];

    double v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v5)
    {
      [v5 removeFromSuperview];
      double v6 = MUGetMUPlaceEnrichmentActionManagerLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v10 = v7;
        _os_log_impl(&dword_1931EA000, v6, OS_LOG_TYPE_DEBUG, "Removed a dummy view at: %@", buf, 0xCu);
      }
    }
  }
}

void __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 tag] == *(void *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_17(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  unint64_t v8 = [v6 actionType] - 1;
  if (v8 > 0xD) {
    double v9 = @"Unknown";
  }
  else {
    double v9 = off_1E5750B20[v8];
  }
  uint64_t v10 = [v7 isEqualToString:v9];
  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

  return v10;
}

uint64_t __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_22(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = [*(id *)(a1 + 32) viewModels];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_2_23;
  v11[3] = &unk_1E5750A40;
  id v12 = v6;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v13 = v8;
  uint64_t v14 = v9;
  uint64_t v15 = a4;
  id v10 = v6;
  [v7 enumerateObjectsUsingBlock:v11];
}

void __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_2_23(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = [v6 appAdamId];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    uint64_t v9 = MUGetMUPlaceEnrichmentActionManagerLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1931EA000, v9, OS_LOG_TYPE_DEBUG, "Showcase action will be executed using app adam ID: %@. View Model: %@", (uint8_t *)&v12, 0x16u);
    }

    uint64_t v11 = [*(id *)(a1 + 40) actionController];
    [v11 openPartnerActionUsingViewModel:v6];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
    **(unsigned char **)(a1 + 56) = 1;
  }
}

- (void)layoutActionsUsingArguments:(id)a3 completion:(id)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 firstObject];
    uint64_t v11 = [v10 objectForKeyedSubscript:0x1EE3CE4E0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v13 = MUGetMUPlaceEnrichmentActionManagerLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        v37 = v9;
        _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_ERROR, "ERROR: Arguments is missing actionKey. Arguments: %@", buf, 0xCu);
      }
      goto LABEL_28;
    }
    uint64_t v13 = [v10 objectForKeyedSubscript:0x1EE3CE4E0];
    if (![v13 isEqualToString:@"MUPlaceEnrichmentActionManagerContextMenu"])
    {
      uint64_t v16 = MUGetMUPlaceEnrichmentActionManagerLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        v37 = v9;
        _os_log_impl(&dword_1931EA000, v16, OS_LOG_TYPE_ERROR, "ERROR: Trying it layout action that is not supported. Arguments: %@", buf, 0xCu);
      }
      goto LABEL_27;
    }
    __int16 v14 = [v10 objectForKeyedSubscript:0x1EE3CE500];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = [v10 objectForKeyedSubscript:0x1EE3CE500];
      BOOL v33 = v15 != 0;
    }
    else
    {
      BOOL v33 = 0;
    }

    uint64_t v17 = [v10 objectForKeyedSubscript:0x1EE3CE560];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = [v10 objectForKeyedSubscript:0x1EE3CE560];
      BOOL v32 = v18 != 0;
    }
    else
    {
      BOOL v32 = 0;
    }

    id v19 = [v10 objectForKeyedSubscript:0x1EE3CE540];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v20 = [v10 objectForKeyedSubscript:0x1EE3CE540];

      if (v33 && v32 && v20)
      {
        uint64_t v16 = [v10 objectForKeyedSubscript:0x1EE3CE560];
        id v21 = [v10 objectForKeyedSubscript:0x1EE3CE540];
        id v22 = [(MUPlaceEnrichmentActionManager *)self contextMenuDelegate];
        [v22 addContextMenuUsingBoundingBox:v16 accessibilityLabel:v21];

        v23 = [v10 objectForKeyedSubscript:0x1EE3CE600];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v24 = [v10 objectForKeyedSubscript:0x1EE3CE600];

          if (!v24)
          {
LABEL_23:

LABEL_27:
LABEL_28:

            goto LABEL_29;
          }
          v23 = [v10 objectForKeyedSubscript:0x1EE3CE600];
          id v25 = [MUPlaceEnrichmentAction alloc];
          uint64_t v44 = 0x1EE3CE600;
          v45[0] = v23;
          v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
          v27 = [(MUPlaceEnrichmentAction *)v25 initWithActionType:13 isValidated:1 mkActionType:0 metadata:v26];

          __int16 v28 = [(MUPlaceEnrichmentActionManager *)self contextMenuDelegate];
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __73__MUPlaceEnrichmentActionManager_layoutActionsUsingArguments_completion___block_invoke;
          v34[3] = &unk_1E5750180;
          id v35 = v7;
          [v28 didLayoutContextMenu:v27 completion:v34];
        }
        goto LABEL_23;
      }
    }
    else
    {
    }
    uint64_t v16 = MUGetMUPlaceEnrichmentActionManagerLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = NSStringFromBOOL();
      uint64_t v30 = NSStringFromBOOL();
      v31 = NSStringFromBOOL();
      *(_DWORD *)long long buf = 138413058;
      v37 = v29;
      __int16 v38 = 2112;
      v39 = v30;
      __int16 v40 = 2112;
      v41 = v31;
      __int16 v42 = 2112;
      v43 = v9;
      _os_log_impl(&dword_1931EA000, v16, OS_LOG_TYPE_ERROR, "ERROR: layout action arguments are not correct. isValidated:%@, boundingBoxValid:%@, accessibilityLabelValid:%@, \nArguments: %@", buf, 0x2Au);
    }
    goto LABEL_27;
  }
  uint64_t v10 = MUGetMUPlaceEnrichmentActionManagerLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    v37 = 0;
    _os_log_impl(&dword_1931EA000, v10, OS_LOG_TYPE_ERROR, "ERROR: missing top level arguments for layoutActions callback: %@", buf, 0xCu);
  }
LABEL_29:
}

uint64_t __73__MUPlaceEnrichmentActionManager_layoutActionsUsingArguments_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)directionsAction:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(MUPlaceEnrichmentActionManager *)self dataAvailability];
  int v5 = [v4 canShowDirections];

  if (v5)
  {
    id v6 = [[MUPlaceEnrichmentAction alloc] initWithActionType:1 isValidated:1 mkActionType:30];
    [v7 addObject:v6];
  }
}

- (void)ratePlaceAction:(id)a3
{
  id v7 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F30F78];
  int v5 = [(MUPlaceEnrichmentActionManager *)self mapItem];
  LODWORD(v4) = [v4 shouldShowRatingsCallToActionForMapItem:v5];

  if (v4)
  {
    id v6 = [[MUPlaceEnrichmentAction alloc] initWithActionType:7 isValidated:1 mkActionType:0];
    [v7 addObject:v6];
  }
}

- (void)addPhotoAction:(id)a3
{
  id v7 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F30F78];
  int v5 = [(MUPlaceEnrichmentActionManager *)self mapItem];
  LODWORD(v4) = [v4 shouldShowPhotosCallToActionForMapItem:v5];

  if (v4)
  {
    id v6 = [[MUPlaceEnrichmentAction alloc] initWithActionType:8 isValidated:1 mkActionType:9];
    [v7 addObject:v6];
  }
}

- (void)getAppAction:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(MUPlaceEnrichmentActionManager *)self dataAvailability];
  int v5 = [v4 suportsOfficialApp];

  if (v5)
  {
    id v6 = [[MUPlaceEnrichmentAction alloc] initWithActionType:14 isValidated:1 mkActionType:26];
    [v7 addObject:v6];
  }
}

- (void)contextMenuAction:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[MUPlaceEnrichmentAction alloc] initWithActionType:13 isValidated:1 mkActionType:0];
  [v3 addObject:v4];
}

- (void)addExternalActionsAsSupportedActions:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(MUPlaceEnrichmentActionManager *)self mapItem];
  id v6 = [v5 _externalActionLinks];

  id v7 = [(MUPlaceEnrichmentActionManager *)self enrichmentDataProvider];
  id v8 = [v7 placeEnrichmentData];
  uint64_t v9 = [v8 enrichmentEntities];
  uint64_t v10 = [v9 firstObject];
  uint64_t v11 = [v10 appAdamIds];

  uint64_t v12 = [v11 count];
  uint64_t v13 = (void *)MEMORY[0x1E4F28F60];
  if (v12)
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __71__MUPlaceEnrichmentActionManager_addExternalActionsAsSupportedActions___block_invoke;
    v31[3] = &unk_1E5750A90;
    __int16 v14 = v11;
    BOOL v32 = v14;
    id v15 = [v13 predicateWithBlock:v31];
    uint64_t v16 = [v6 filteredArrayUsingPredicate:v15];

    uint64_t v17 = MUGetMUPlaceEnrichmentActionManagerLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v34 = v16;
      __int16 v35 = 2112;
      uint64_t v36 = v14;
      _os_log_impl(&dword_1931EA000, v17, OS_LOG_TYPE_INFO, "Filtered showcase external actions are: %@. Showcase app adamIDs: %@", buf, 0x16u);
    }

    id v18 = v32;
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_41];
    uint64_t v16 = [v6 filteredArrayUsingPredicate:v19];

    id v18 = MUGetMUPlaceEnrichmentActionManagerLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v34 = v16;
      _os_log_impl(&dword_1931EA000, v18, OS_LOG_TYPE_INFO, "Showcase external are: %@. These actions contain providers with no app adam id which is expected because these are not backed by an app store app.", buf, 0xCu);
    }
  }

  if ([v16 count]
    || ([(MUPlaceEnrichmentActionManager *)self onActionUpdate],
        v23 = objc_claimAutoreleasedReturnValue(),
        v23,
        !v23))
  {
    dispatch_group_t v20 = dispatch_group_create();
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __71__MUPlaceEnrichmentActionManager_addExternalActionsAsSupportedActions___block_invoke_32;
    v27[3] = &unk_1E5750B00;
    dispatch_group_t v28 = v20;
    id v29 = v4;
    uint64_t v30 = self;
    id v21 = v20;
    [v16 enumerateObjectsUsingBlock:v27];
    objc_initWeak((id *)buf, self);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __71__MUPlaceEnrichmentActionManager_addExternalActionsAsSupportedActions___block_invoke_37;
    v25[3] = &unk_1E574F110;
    objc_copyWeak(&v26, (id *)buf);
    v25[4] = self;
    dispatch_group_notify(v21, MEMORY[0x1E4F14428], v25);
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);

    id v22 = v28;
  }
  else
  {
    uint64_t v24 = MUGetMUPlaceEnrichmentActionManagerLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1931EA000, v24, OS_LOG_TYPE_INFO, "Showcase external actions are not applicable as no adam ids were found.", buf, 2u);
    }

    id v21 = [(MUPlaceEnrichmentActionManager *)self onActionUpdate];
    id v22 = [(MUPlaceEnrichmentActionManager *)self supportedActions];
    ((void (*)(NSObject *, void *))v21[2].isa)(v21, v22);
  }
}

uint64_t __71__MUPlaceEnrichmentActionManager_addExternalActionsAsSupportedActions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 appAdamIds];
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 32)];
  uint64_t v5 = [v3 intersectsSet:v4];

  return v5;
}

uint64_t __71__MUPlaceEnrichmentActionManager_addExternalActionsAsSupportedActions___block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(a2, "actionProviders", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) appAdamId];
        uint64_t v7 = [v6 length];

        if (!v7)
        {
          uint64_t v3 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

void __71__MUPlaceEnrichmentActionManager_addExternalActionsAsSupportedActions___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v6 = [v5 categoryId];

  if (v6)
  {
    uint64_t v7 = [MUPlaceEnrichmentAction alloc];
    uint64_t v26 = 0x1EE3CE520;
    id v8 = [v5 categoryId];
    v27[0] = v8;
    long long v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    long long v10 = [(MUPlaceEnrichmentAction *)v7 initWithActionType:12 isValidated:0 mkActionType:0 metadata:v9];

    [*(id *)(a1 + 40) addObject:v10];
    long long v11 = [MUGroupedExternalActionController alloc];
    long long v12 = [*(id *)(a1 + 48) amsResultProvider];
    uint64_t v13 = [*(id *)(a1 + 48) externalActionHandler];
    uint64_t v14 = [*(id *)(a1 + 48) analyticsDelegate];
    id v15 = [(MUGroupedExternalActionController *)v11 initWithGroupedExternalAction:v5 amsResultProvider:v12 supportsMultipleVendorSelection:0 actionHandler:v13 analyticsHandler:v14];

    [(MUGroupedExternalActionController *)v15 setSingleVendorAnalyticsTarget:201];
    [(MUGroupedExternalActionController *)v15 setMultipleVendorAnalyticsTarget:201];
    [(MUGroupedExternalActionController *)v15 setAnalyticsModuleType:5];
    [(MUGroupedExternalActionController *)v15 setSource:11];
    uint64_t v16 = [*(id *)(a1 + 48) externalActionsControllers];
    [v16 addObject:v15];

    objc_initWeak(&location, *(id *)(a1 + 48));
    uint64_t v17 = [*(id *)(a1 + 48) externalActionsControllers];
    id v18 = [v17 objectAtIndex:a3];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __71__MUPlaceEnrichmentActionManager_addExternalActionsAsSupportedActions___block_invoke_2;
    v20[3] = &unk_1E5750AD8;
    objc_copyWeak(v24, &location);
    v24[1] = a3;
    id v21 = v5;
    id v19 = v10;
    id v22 = v19;
    id v23 = *(id *)(a1 + 32);
    [v18 fetchProviderLockupsWithCompletion:v20];

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }
}

void __71__MUPlaceEnrichmentActionManager_addExternalActionsAsSupportedActions___block_invoke_2(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if ([v3 count])
    {
      id v5 = [MUExternalActionPair alloc];
      id v6 = [WeakRetained externalActionsControllers];
      uint64_t v7 = [v6 objectAtIndex:*(void *)(a1 + 64)];
      id v8 = [(MUExternalActionPair *)v5 initWithAction:v3 actionController:v7];

      long long v9 = [WeakRetained externalActionsPairs];
      long long v10 = [*(id *)(a1 + 32) categoryId];
      [v9 setObject:v8 forKey:v10];

      long long v11 = [WeakRetained supportedActions];
      [v11 removeObject:*(void *)(a1 + 40)];

      long long v12 = [MUPlaceEnrichmentAction alloc];
      uint64_t v19 = 0x1EE3CE520;
      uint64_t v13 = [*(id *)(a1 + 32) categoryId];
      v20[0] = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      id v15 = [(MUPlaceEnrichmentAction *)v12 initWithActionType:12 isValidated:1 mkActionType:0 metadata:v14];

      uint64_t v16 = [WeakRetained supportedActions];
      [v16 addObject:v15];
    }
    else
    {
      id v8 = MUGetMUPlaceEnrichmentActionManagerLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_7:

        dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
        goto LABEL_8;
      }
      id v15 = [*(id *)(a1 + 32) actionName];
      int v17 = 138412290;
      id v18 = v15;
      _os_log_impl(&dword_1931EA000, v8, OS_LOG_TYPE_ERROR, "Unable to fetch lockups for action: %@", (uint8_t *)&v17, 0xCu);
    }

    goto LABEL_7;
  }
LABEL_8:
}

void __71__MUPlaceEnrichmentActionManager_addExternalActionsAsSupportedActions___block_invoke_37(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = MUGetMUPlaceEnrichmentActionManagerLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = [WeakRetained externalActionsPairs];
      int v9 = 138412290;
      long long v10 = v4;
      _os_log_impl(&dword_1931EA000, v3, OS_LOG_TYPE_DEBUG, "Fetched view models for all actions: %@", (uint8_t *)&v9, 0xCu);
    }
    id v5 = [*(id *)(a1 + 32) onActionUpdate];

    if (v5)
    {
      id v6 = MUGetMUPlaceEnrichmentActionManagerLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1931EA000, v6, OS_LOG_TYPE_INFO, "Informing Enrichment section controller about external extensions validation.", (uint8_t *)&v9, 2u);
      }

      uint64_t v7 = [*(id *)(a1 + 32) onActionUpdate];
      id v8 = [*(id *)(a1 + 32) supportedActions];
      ((void (**)(void, void *))v7)[2](v7, v8);
    }
  }
}

- (MUPlaceActionManager)placeActionManager
{
  return self->_placeActionManager;
}

- (void)setPlaceActionManager:(id)a3
{
}

- (MUPlaceEnrichmentDataProvider)enrichmentDataProvider
{
  return self->_enrichmentDataProvider;
}

- (void)setEnrichmentDataProvider:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (MUPlaceDataAvailability)dataAvailability
{
  return self->_dataAvailability;
}

- (void)setDataAvailability:(id)a3
{
}

- (NSMutableSet)supportedActions
{
  return self->_supportedActions;
}

- (void)setSupportedActions:(id)a3
{
}

- (MUPlaceCallToActionSectionControllerDelegate)callToActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_callToActionDelegate);
  return (MUPlaceCallToActionSectionControllerDelegate *)WeakRetained;
}

- (void)setCallToActionDelegate:(id)a3
{
}

- (MUPlaceEnrichmentSectionContextMenuDelegate)contextMenuDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextMenuDelegate);
  return (MUPlaceEnrichmentSectionContextMenuDelegate *)WeakRetained;
}

- (void)setContextMenuDelegate:(id)a3
{
}

- (MUExternalActionHandling)externalActionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_externalActionHandler);
  return (MUExternalActionHandling *)WeakRetained;
}

- (void)setExternalActionHandler:(id)a3
{
}

- (MUPlaceEnrichmentSectionAnalyticsDelegate)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
  return (MUPlaceEnrichmentSectionAnalyticsDelegate *)WeakRetained;
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (NSMutableDictionary)externalActionsPairs
{
  return self->_externalActionsPairs;
}

- (void)setExternalActionsPairs:(id)a3
{
}

- (NSMutableArray)externalActionsControllers
{
  return self->_externalActionsControllers;
}

- (void)setExternalActionsControllers:(id)a3
{
}

- (id)onActionUpdate
{
  return self->_onActionUpdate;
}

- (void)setOnActionUpdate:(id)a3
{
}

- (MUPresentationOptions)presentationOptions
{
  return self->_presentationOptions;
}

- (void)setPresentationOptions:(id)a3
{
}

- (MUAMSResultProvider)amsResultProvider
{
  return self->_amsResultProvider;
}

- (void)setAmsResultProvider:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_amsResultProvider, 0);
  objc_storeStrong((id *)&self->_presentationOptions, 0);
  objc_storeStrong(&self->_onActionUpdate, 0);
  objc_storeStrong((id *)&self->_externalActionsControllers, 0);
  objc_storeStrong((id *)&self->_externalActionsPairs, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_destroyWeak((id *)&self->_externalActionHandler);
  objc_destroyWeak((id *)&self->_contextMenuDelegate);
  objc_destroyWeak((id *)&self->_callToActionDelegate);
  objc_storeStrong((id *)&self->_supportedActions, 0);
  objc_storeStrong((id *)&self->_dataAvailability, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_enrichmentDataProvider, 0);
  objc_storeStrong((id *)&self->_placeActionManager, 0);
}

@end