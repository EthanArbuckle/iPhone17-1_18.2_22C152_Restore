@interface CESRRawSpeechProfileTools
+ (id)convertRawSpeechProfile:(id)a3 deviceId:(id)a4 userId:(id)a5 omitItemTypes:(id)a6 error:(id *)a7;
+ (id)itemWithType:(int64_t)a3 itemId:(id)a4 fieldType:(int64_t)a5 value:(id)a6;
+ (id)localeFromRawSpeechProfile:(id)a3 error:(id *)a4;
+ (id)mergeMultiUserPrimaryProfile:(id)a3 withCompanionProfiles:(id)a4 error:(id *)a5;
+ (id)placeholderItemIdWithCategoryName:(id)a3;
+ (id)vocabularyItemsOfType:(int64_t)a3 fromRawSpeechProfile:(id)a4 error:(id *)a5;
@end

@implementation CESRRawSpeechProfileTools

+ (id)itemWithType:(int64_t)a3 itemId:(id)a4 fieldType:(int64_t)a5 value:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = objc_alloc_init(MEMORY[0x1E4F71FF8]);
  id v12 = (id)[v11 setItemType:a3 itemId:v9 error:0];
  id v13 = (id)[v11 addFieldWithType:a5 value:v10 error:0];
  v14 = [v11 buildItemWithError:0];

  return v14;
}

+ (id)placeholderItemIdWithCategoryName:(id)a3
{
  v3 = (__CFString *)a3;
  if (placeholderItemIdWithCategoryName__onceToken != -1) {
    dispatch_once(&placeholderItemIdWithCategoryName__onceToken, &__block_literal_global_2119);
  }
  if (!v3) {
    v3 = @"unspecified";
  }
  uint64_t v4 = [(id)placeholderItemIdWithCategoryName__categoryCounts objectForKey:v3];
  if (v4) {
    v5 = (void *)v4;
  }
  else {
    v5 = &unk_1F129E848;
  }
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "integerValue") + 1);

  [(id)placeholderItemIdWithCategoryName__categoryCounts setObject:v6 forKey:v3];
  v7 = [NSString stringWithFormat:@"%@-%@-%@", @"speechprofile", v3, v6];

  return v7;
}

uint64_t __63__CESRRawSpeechProfileTools_placeholderItemIdWithCategoryName___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = placeholderItemIdWithCategoryName__categoryCounts;
  placeholderItemIdWithCategoryName__categoryCounts = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)mergeMultiUserPrimaryProfile:(id)a3 withCompanionProfiles:(id)a4 error:(id *)a5
{
  v122[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  v78 = v6;
  v79 = v7;
  if (!v6 || ![v7 count])
  {
    v48 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v121 = *MEMORY[0x1E4F28568];
    v49 = [NSString stringWithFormat:@"Missing required primary/companion profile data (primary: %@ companion: %@)", v6, v8];
    v122[0] = v49;
    v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v122 forKeys:&v121 count:1];
    v51 = [v48 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:9 userInfo:v50];
    v52 = v51;
    if (a5 && v51) {
      *a5 = v51;
    }

    v47 = 0;
    goto LABEL_70;
  }
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x3032000000;
  v106 = __Block_byref_object_copy__2138;
  v107 = __Block_byref_object_dispose__2139;
  id v108 = 0;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = (id *)(v104 + 5);
  id obj = (id)v104[5];
  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  v100[2] = __86__CESRRawSpeechProfileTools_mergeMultiUserPrimaryProfile_withCompanionProfiles_error___block_invoke;
  v100[3] = &unk_1E61C3228;
  id v11 = v9;
  id v101 = v11;
  char v12 = [v6 enumerateDatasetsWithError:&obj usingBlock:v100];
  objc_storeStrong(v10, obj);
  if ((v12 & 1) == 0)
  {
    if (a5)
    {
      v53 = (void *)v104[5];
      if (v53) {
        *a5 = v53;
      }
    }
    v47 = 0;
    id v13 = v101;
    goto LABEL_69;
  }

  unint64_t v77 = [v11 count];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v13 = v79;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v96 objects:v120 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v97 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v96 + 1) + 8 * i);
        v18 = (id *)(v104 + 5);
        id v95 = (id)v104[5];
        v93[0] = MEMORY[0x1E4F143A8];
        v93[1] = 3221225472;
        v93[2] = __86__CESRRawSpeechProfileTools_mergeMultiUserPrimaryProfile_withCompanionProfiles_error___block_invoke_2;
        v93[3] = &unk_1E61C3228;
        id v94 = v11;
        LOBYTE(v17) = [v17 enumerateDatasetsWithError:&v95 usingBlock:v93];
        objc_storeStrong(v18, v95);
        if ((v17 & 1) == 0)
        {
          if (a5)
          {
            v54 = (void *)v104[5];
            if (v54) {
              *a5 = v54;
            }
          }

          v47 = 0;
          goto LABEL_69;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v96 objects:v120 count:16];
    }
    while (v14);
  }

  v19 = (void *)MEMORY[0x1E4F72018];
  uint64_t v20 = [v11 count];
  v21 = (id *)(v104 + 5);
  id v92 = (id)v104[5];
  id v13 = [v19 syntheticWithDatasetCount:v20 error:&v92];
  objc_storeStrong(v21, v92);
  if (!v13)
  {
    if (a5)
    {
      v55 = (void *)v104[5];
      v47 = 0;
      if (v55)
      {
        id v13 = 0;
        v47 = 0;
        *a5 = v55;
      }
    }
    else
    {
      v47 = 0;
    }
    goto LABEL_69;
  }
  v22 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v117 = "+[CESRRawSpeechProfileTools mergeMultiUserPrimaryProfile:withCompanionProfiles:error:]";
    __int16 v118 = 2112;
    id v119 = v13;
    _os_log_impl(&dword_1B8CCB000, v22, OS_LOG_TYPE_INFO, "%s Preparing to merge with profileInfo: %@", buf, 0x16u);
  }
  v23 = (id *)(v104 + 5);
  id v91 = (id)v104[5];
  v76 = [MEMORY[0x1E4F72010] builderWithProfileInfo:v13 format:1 error:&v91];
  objc_storeStrong(v23, v91);
  if (!v76)
  {
    v47 = 0;
    if (a5)
    {
      v56 = (void *)v104[5];
      if (v56)
      {
        v47 = 0;
        *a5 = v56;
      }
    }
    goto LABEL_68;
  }
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v73 = v11;
  uint64_t v24 = [v73 countByEnumeratingWithState:&v87 objects:v115 count:16];
  if (!v24) {
    goto LABEL_32;
  }
  uint64_t v25 = 0;
  uint64_t v74 = *(void *)v88;
  while (2)
  {
    uint64_t v26 = 0;
    uint64_t v75 = v25 + 1;
    uint64_t v71 = v25 + v24;
    do
    {
      if (*(void *)v88 != v74) {
        objc_enumerationMutation(v73);
      }
      v27 = *(void **)(*((void *)&v87 + 1) + 8 * v26);
      v28 = [v27 datasetInfo];
      v29 = v28;
      if (v75 + v26 <= v77) {
        goto LABEL_28;
      }
      v30 = [v28 deviceId];
      BOOL v31 = [v30 length] == 0;

      if (v31)
      {
        v58 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v113 = *MEMORY[0x1E4F28568];
        v59 = NSString;
        v60 = [v29 deviceId];
        v61 = [v59 stringWithFormat:@"Companion profile has invalid deviceId: %@ in dataset: %@", v60, v29];
        v114 = v61;
        id v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
        id v63 = [v58 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:7 userInfo:v62];
        goto LABEL_61;
      }
      v32 = [v29 userId];
      BOOL v33 = [v32 length] == 0;

      if (v33)
      {
        v64 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v111 = *MEMORY[0x1E4F28568];
        v65 = NSString;
        v60 = [v29 userId];
        v61 = [v65 stringWithFormat:@"Companion profile has invalid userId: %@ in dataset: %@", v60, v29];
        v112 = v61;
        id v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
        id v63 = [v64 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:8 userInfo:v62];
LABEL_61:
        if (a5 && v63)
        {
          id v63 = v63;
          *a5 = v63;
        }

        goto LABEL_65;
      }
      unint64_t v34 = [v29 itemType];
      if (v34 > 0x15) {
        goto LABEL_76;
      }
      if (((1 << v34) & 0x20000E) != 0) {
        goto LABEL_28;
      }
      if (((1 << v34) & 0x10020) == 0)
      {
LABEL_76:
        v68 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v109 = *MEMORY[0x1E4F28568];
        v60 = [NSString stringWithFormat:@"Dataset: %@ not applicable from companion profile", v29];
        v110 = v60;
        v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
        v69 = [v68 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:9 userInfo:v61];
        id v62 = v69;
        if (a5 && v69)
        {
          id v62 = v69;
          *a5 = v62;
        }
LABEL_65:

LABEL_66:
LABEL_67:

        v47 = 0;
        goto LABEL_68;
      }
      id v72 = objc_alloc(MEMORY[0x1E4F71FC8]);
      uint64_t v35 = [v29 itemType];
      v36 = [v29 originAppId];
      v37 = [v29 userId];
      int v38 = [v29 itemCount];
      v39 = (id *)(v104 + 5);
      id v86 = (id)v104[5];
      LODWORD(v70) = v38;
      uint64_t v40 = [v72 initWithItemType:v35 originAppId:v36 deviceId:0 userId:v37 lastModifiedTime:0 capturedTime:0 itemCount:v70 error:&v86];
      objc_storeStrong(v39, v86);

      v29 = (void *)v40;
      if (!v40)
      {
        if (a5)
        {
          v67 = (void *)v104[5];
          if (v67) {
            *a5 = v67;
          }
        }
        goto LABEL_67;
      }
LABEL_28:
      v41 = (id *)(v104 + 5);
      id v85 = (id)v104[5];
      v42 = [v76 addDataset:v29 error:&v85];
      objc_storeStrong(v41, v85);
      v44 = (id *)(v104 + 5);
      v43 = (void *)v104[5];
      if (!v42)
      {
        if (a5 && v43) {
          *a5 = v43;
        }
        goto LABEL_66;
      }
      id v84 = (id)v104[5];
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __86__CESRRawSpeechProfileTools_mergeMultiUserPrimaryProfile_withCompanionProfiles_error___block_invoke_35;
      v81[3] = &unk_1E61C3250;
      id v45 = v42;
      id v82 = v45;
      v83 = &v103;
      char v46 = [v27 enumerateItemsWithError:&v84 usingBlock:v81];
      objc_storeStrong(v44, v84);
      if ((v46 & 1) == 0)
      {
        if (a5)
        {
          v57 = (void *)v104[5];
          if (v57) {
            *a5 = v57;
          }
        }

        goto LABEL_66;
      }

      ++v26;
    }
    while (v24 != v26);
    uint64_t v24 = [v73 countByEnumeratingWithState:&v87 objects:v115 count:16];
    uint64_t v25 = v71;
    if (v24) {
      continue;
    }
    break;
  }
LABEL_32:

  v47 = [v76 buildWithError:a5];
LABEL_68:

LABEL_69:
  _Block_object_dispose(&v103, 8);

LABEL_70:

  return v47;
}

uint64_t __86__CESRRawSpeechProfileTools_mergeMultiUserPrimaryProfile_withCompanionProfiles_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 datasetInfo];
  uint64_t v5 = [v4 itemType];

  if (v5 == 4) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return 1;
}

uint64_t __86__CESRRawSpeechProfileTools_mergeMultiUserPrimaryProfile_withCompanionProfiles_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 datasetInfo];
  unint64_t v5 = [v4 itemType];

  if (v5 <= 0x15 && ((1 << v5) & 0x21002E) != 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return 1;
}

BOOL __86__CESRRawSpeechProfileTools_mergeMultiUserPrimaryProfile_withCompanionProfiles_error___block_invoke_35(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 addItem:a2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);

  return v4 != 0;
}

+ (id)convertRawSpeechProfile:(id)a3 deviceId:(id)a4 userId:(id)a5 omitItemTypes:(id)a6 error:(id *)a7
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v60 = a4;
  id v59 = a5;
  id v10 = a6;
  v66 = KVItemTypeToNumber();
  v84[0] = v66;
  id v11 = KVItemTypeToNumber();
  v84[1] = v11;
  char v12 = KVItemTypeToNumber();
  v84[2] = v12;
  id v13 = KVItemTypeToNumber();
  v84[3] = v13;
  uint64_t v14 = KVItemTypeToNumber();
  v84[4] = v14;
  uint64_t v15 = KVItemTypeToNumber();
  v84[5] = v15;
  v16 = KVItemTypeToNumber();
  v84[6] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:7];
  id v18 = v10;
  id v19 = v17;
  v57 = v18;
  if ([v18 count])
  {
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v19, "count"));
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ___applyItemTypeFilter_block_invoke;
    id v86 = &unk_1E61C3278;
    id v87 = v18;
    id v21 = v20;
    id v88 = v21;
    [v19 enumerateObjectsUsingBlock:buf];
    v22 = v88;
    id v23 = v21;

    id v18 = v57;
  }
  else
  {
    id v23 = v19;
  }

  uint64_t v24 = (void *)MEMORY[0x1E4F72010];
  uint64_t v25 = a7;
  uint64_t v26 = objc_msgSend(MEMORY[0x1E4F72018], "syntheticWithDatasetCount:error:", objc_msgSend(v23, "count"), a7);
  id v81 = 0;
  uint64_t v27 = [v24 builderWithProfileInfo:v26 format:1 error:&v81];
  id v28 = v81;

  v65 = (void *)v27;
  if (!v27)
  {
    v52 = 0;
    v30 = v60;
    v29 = v61;
    BOOL v31 = v59;
    if (a7 && v28)
    {
      id v28 = v28;
      v52 = 0;
      *a7 = v28;
    }
    goto LABEL_55;
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v56 = v23;
  id obj = v23;
  v30 = v60;
  v29 = v61;
  BOOL v31 = v59;
  uint64_t v63 = [obj countByEnumeratingWithState:&v77 objects:v83 count:16];
  if (!v63) {
    goto LABEL_35;
  }
  uint64_t v64 = *(void *)v78;
  while (2)
  {
    uint64_t v32 = 0;
    do
    {
      if (*(void *)v78 != v64) {
        objc_enumerationMutation(obj);
      }
      uint64_t v33 = KVItemTypeFromNumber();
      unint64_t v34 = (void *)*MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
      {
        v49 = v34;
        v50 = KVItemTypeDescription();
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "+[CESRRawSpeechProfileTools convertRawSpeechProfile:deviceId:userId:omitItemTypes:error:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v50;
        _os_log_debug_impl(&dword_1B8CCB000, v49, OS_LOG_TYPE_DEBUG, "%s Extracting and converting vocabulary items of type: %@ from rawSpeechProfile", buf, 0x16u);
      }
      id v76 = v28;
      uint64_t v35 = +[CESRRawSpeechProfileTools vocabularyItemsOfType:v33 fromRawSpeechProfile:v29 error:&v76];
      id v36 = v76;

      if (!v35)
      {
        if (v25)
        {
          id v23 = v56;
          if (v36)
          {
            id v40 = v36;
            *uint64_t v25 = v40;
          }
          else
          {
            id v40 = 0;
          }
          goto LABEL_54;
        }
        id v40 = v36;
LABEL_53:
        id v23 = v56;
LABEL_54:

        v52 = 0;
        id v28 = v40;
        goto LABEL_55;
      }
      uint64_t v67 = v32;
      id v37 = objc_alloc(MEMORY[0x1E4F71FC8]);
      int v38 = [v35 count];
      id v75 = v36;
      LODWORD(v55) = v38;
      v39 = (void *)[v37 initWithItemType:v33 originAppId:0 deviceId:v30 userId:v31 lastModifiedTime:0 capturedTime:0 itemCount:v55 error:&v75];
      id v40 = v75;

      if (!v39)
      {
        if (v25 && v40) {
          *uint64_t v25 = v40;
        }

        goto LABEL_53;
      }
      id v74 = v40;
      v41 = [v65 addDataset:v39 error:&v74];
      id v28 = v74;

      if (v41)
      {
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v42 = v35;
        uint64_t v43 = [v42 countByEnumeratingWithState:&v70 objects:v82 count:16];
        if (v43)
        {
          uint64_t v44 = *(void *)v71;
          while (2)
          {
            uint64_t v45 = 0;
            char v46 = v28;
            do
            {
              if (*(void *)v71 != v44) {
                objc_enumerationMutation(v42);
              }
              uint64_t v47 = *(void *)(*((void *)&v70 + 1) + 8 * v45);
              id v69 = v46;
              v48 = [v41 addItem:v47 error:&v69];
              id v28 = v69;

              if (!v48)
              {
                LODWORD(v43) = 1;
                uint64_t v25 = a7;
                if (a7)
                {
                  v30 = v60;
                  v29 = v61;
                  BOOL v31 = v59;
                  if (v28)
                  {
                    id v28 = v28;
                    *a7 = v28;
                  }
                }
                else
                {
                  v30 = v60;
                  v29 = v61;
                  BOOL v31 = v59;
                }
                goto LABEL_31;
              }
              ++v45;
              char v46 = v28;
            }
            while (v43 != v45);
            uint64_t v43 = [v42 countByEnumeratingWithState:&v70 objects:v82 count:16];
            if (v43) {
              continue;
            }
            break;
          }
          v30 = v60;
          v29 = v61;
          BOOL v31 = v59;
          uint64_t v25 = a7;
        }
LABEL_31:
      }
      else
      {
        LODWORD(v43) = 1;
        if (v25 && v28)
        {
          id v28 = v28;
          *uint64_t v25 = v28;
        }
      }

      if (v43)
      {
        id v40 = v28;
        goto LABEL_53;
      }
      uint64_t v32 = v67 + 1;
    }
    while (v67 + 1 != v63);
    uint64_t v63 = [obj countByEnumeratingWithState:&v77 objects:v83 count:16];
    if (v63) {
      continue;
    }
    break;
  }
LABEL_35:
  v51 = v28;

  id v68 = v28;
  v52 = [v65 buildWithError:&v68];
  id v28 = v68;

  if (v52)
  {
    id v53 = v52;
    id v23 = v56;
  }
  else
  {
    id v23 = v56;
    if (v25 && v28) {
      *uint64_t v25 = v28;
    }
  }

LABEL_55:

  return v52;
}

+ (id)vocabularyItemsOfType:(int64_t)a3 fromRawSpeechProfile:(id)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = off_1E61C2540;
  switch(a3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      id v8 = off_1E61C2538;
      goto LABEL_10;
    case 3:
      id v8 = off_1E61C2530;
      goto LABEL_10;
    case 4:
      id v8 = off_1E61C2550;
      goto LABEL_10;
    case 5:
      id v8 = off_1E61C2558;
      goto LABEL_10;
    default:
      if (a3 == 16)
      {
        id v8 = off_1E61C2560;
      }
      else
      {
        if (a3 != 21) {
          goto LABEL_14;
        }
        id v8 = off_1E61C2548;
      }
LABEL_10:
      id v9 = objc_alloc_init(*v8);
      if (v9)
      {
        id v10 = v9;
        id v11 = (void *)*MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
        {
          uint64_t v20 = v11;
          id v21 = KVItemTypeDescription();
          *(_DWORD *)buf = 136315394;
          id v23 = "+[CESRRawSpeechProfileTools vocabularyItemsOfType:fromRawSpeechProfile:error:]";
          __int16 v24 = 2112;
          uint64_t v25 = v21;
          _os_log_debug_impl(&dword_1B8CCB000, v20, OS_LOG_TYPE_DEBUG, "%s Extracting vocabulary items of type: %@ from rawSpeechProfile.", buf, 0x16u);
        }
        char v12 = +[CESRRawSpeechProfileExtractor extractItemsFromRawSpeechProfile:v7 converter:v10 error:a5];
        goto LABEL_18;
      }
LABEL_14:
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      uint64_t v14 = NSString;
      id v10 = KVItemTypeDescription();
      uint64_t v15 = [v14 stringWithFormat:@"Target item type: %@ not supported.", v10];
      v27[0] = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      v17 = [v13 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:4 userInfo:v16];
      id v18 = v17;
      if (a5 && v17) {
        *a5 = v17;
      }

      char v12 = 0;
LABEL_18:

      return v12;
  }
}

+ (id)localeFromRawSpeechProfile:(id)a3 error:(id *)a4
{
  return +[CESRRawSpeechProfileExtractor extractLocaleFromRawSpeechProfile:a3 error:a4];
}

@end