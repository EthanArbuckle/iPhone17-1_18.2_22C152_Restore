@interface BLTSectionInfoOverrideApplier
- (id)applyOverrides:(id)a3 toSectionInfo:(id)a4;
@end

@implementation BLTSectionInfoOverrideApplier

- (id)applyOverrides:(id)a3 toSectionInfo:(id)a4
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!a4)
  {
    v6 = 0;
    goto LABEL_50;
  }
  v6 = (void *)[a4 copy];
  v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2BB58]];
  char v8 = [v7 BOOLValue];

  if (v8)
  {
    uint64_t v9 = *MEMORY[0x263F2BB68];
    v10 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2BB68]];

    if (v10)
    {
      v11 = [v5 objectForKeyedSubscript:v9];
      int v12 = [v11 BOOLValue];

      uint64_t v13 = [v6 pushSettings];
      if (!v12)
      {
        unint64_t v14 = v13 & 0xFFFFFFFFFFFFFFEFLL;
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v13 = [v6 pushSettings];
    }
    unint64_t v14 = v13 | 0x10;
LABEL_17:
    [v6 setPushSettings:v14];
    uint64_t v21 = *MEMORY[0x263F2BB38];
    v22 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2BB38]];

    if (v22)
    {
      v23 = [v5 objectForKeyedSubscript:v21];
      int v24 = [v23 BOOLValue];

      if (v24) {
        uint64_t v25 = 2;
      }
      else {
        uint64_t v25 = 1;
      }
    }
    else
    {
      uint64_t v25 = 0;
    }
    [v6 setCriticalAlertSetting:v25];
    v26 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2BB30]];
    v15 = v26;
    if (v26)
    {
      uint64_t v27 = [v26 unsignedIntegerValue];
      if (v27) {
        uint64_t v28 = v27 == 2;
      }
      else {
        uint64_t v28 = 2;
      }
      [v6 setBulletinGroupingSetting:v28];
    }
    uint64_t v55 = *MEMORY[0x263F2BB50];
    v29 = objc_msgSend(v5, "objectForKeyedSubscript:");
    unsigned int v30 = [v29 BOOLValue];

    unsigned int v56 = v30;
    if (v30)
    {
      uint64_t v31 = 1;
    }
    else
    {
      v32 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2BB48]];
      uint64_t v31 = [v32 BOOLValue];
    }
    [v6 updateAlertingStatusForGizmoWithAlertsEnabled:v30 NCEnabled:v31];
    [v6 setNotificationCenterLimit:20];
    v33 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2BB60]];
    objc_msgSend(v6, "setShowsMessagePreview:", objc_msgSend(v33, "BOOLValue"));

    uint64_t v34 = *MEMORY[0x263F2BB78];
    v35 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2BB78]];

    if (v35)
    {
      v51 = v15;
      id v52 = v5;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      obuint64_t j = [v5 objectForKeyedSubscript:v34];
      uint64_t v59 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
      if (v59)
      {
        uint64_t v57 = *(void *)v66;
        uint64_t v36 = *MEMORY[0x263F2BB70];
        int v54 = v56 | v31;
        v58 = v6;
        do
        {
          uint64_t v37 = 0;
          do
          {
            if (*(void *)v66 != v57) {
              objc_enumerationMutation(obj);
            }
            uint64_t v60 = v37;
            v38 = *(void **)(*((void *)&v65 + 1) + 8 * v37);
            long long v61 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            v39 = [v6 subsections];
            uint64_t v40 = [v39 countByEnumeratingWithState:&v61 objects:v73 count:16];
            if (v40)
            {
              uint64_t v41 = v40;
              uint64_t v42 = *(void *)v62;
              while (2)
              {
                for (uint64_t i = 0; i != v41; ++i)
                {
                  if (*(void *)v62 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  v44 = *(void **)(*((void *)&v61 + 1) + 8 * i);
                  v45 = [v38 objectForKeyedSubscript:v36];
                  v46 = [v44 subsectionID];
                  int v47 = [v45 isEqualToString:v46];

                  if (v47)
                  {
                    v48 = [v38 objectForKeyedSubscript:v55];
                    unsigned int v49 = [v48 BOOLValue];

                    [v44 updateAlertingStatusForGizmoWithAlertsEnabled:v56 & v49 NCEnabled:v54 & v49];
                    [v44 setNotificationCenterLimit:20];
                    goto LABEL_46;
                  }
                }
                uint64_t v41 = [v39 countByEnumeratingWithState:&v61 objects:v73 count:16];
                if (v41) {
                  continue;
                }
                break;
              }
            }
LABEL_46:

            uint64_t v37 = v60 + 1;
            v6 = v58;
          }
          while (v60 + 1 != v59);
          uint64_t v59 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
        }
        while (v59);
      }

      v15 = v51;
      id v5 = v52;
    }
    goto LABEL_49;
  }
  [v6 enableAlertsForGizmo:BLTBBSectionInfoEnabled(v6)];
  [v6 setNotificationCenterLimit:20];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v15 = [v6 subsections];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v70;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v70 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v69 + 1) + 8 * j);
        [v20 enableAlertsForGizmo:BLTBBSectionInfoEnabled(v20)];
        [v20 setNotificationCenterLimit:20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v69 objects:v75 count:16];
    }
    while (v17);
  }
LABEL_49:

LABEL_50:
  return v6;
}

@end