@interface INVocabularyValidator
@end

@implementation INVocabularyValidator

id __85___INVocabularyValidator_validatedItemsFromVocabularyStrings_ofType_loggingWarnings___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [[_INVocabularyItem alloc] _initWithUncheckedString:v2 vocabularyIdentifier:0 requiresUserIdentification:0];

  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

void __93___INVocabularyValidator__determineIfBundleID_appPath_canProvideVocabularyOfType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  v7 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v8 = &stru_1EDA6DB28;
    if (v6) {
      v8 = v6;
    }
    *(_DWORD *)buf = 136315394;
    v20 = "-[_INVocabularyValidator _determineIfBundleID:appPath:canProvideVocabularyOfType:completion:]_block_invoke";
    __int16 v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_INFO, "%s Finished matching on-device extensions %@", buf, 0x16u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93___INVocabularyValidator__determineIfBundleID_appPath_canProvideVocabularyOfType_completion___block_invoke_111;
  block[3] = &unk_1E551DC58;
  id v14 = v5;
  id v18 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  v11 = *(void **)(a1 + 48);
  id v15 = v9;
  uint64_t v16 = v10;
  id v17 = v11;
  id v12 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __93___INVocabularyValidator__determineIfBundleID_appPath_canProvideVocabularyOfType_completion___block_invoke_111(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) count])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
    uint64_t v4 = *(void *)(a1 + 40);
    id v32 = 0;
    id v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v32];
    id v6 = v32;
    if (v6)
    {
      v7 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "-[_INVocabularyValidator _determineIfBundleID:appPath:canProvideVocabularyOfType:completion:]_block_invoke";
        __int16 v37 = 2112;
        id v38 = v6;
        _os_log_error_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_ERROR, "%s Unable to get app record %@", buf, 0x16u);
        v7 = INSiriLogContextIntents;
      }
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 136315138;
      v36 = "-[_INVocabularyValidator _determineIfBundleID:appPath:canProvideVocabularyOfType:completion:]_block_invoke";
    }
    else
    {
      v8 = [v5 supportedIntents];
      uint64_t v9 = [v8 count];

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id obj = *(id *)(a1 + 56);
      uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v29;
        uint64_t v22 = v9;
        while (1)
        {
          uint64_t v13 = 0;
LABEL_13:
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * v13);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v15 = v5;
          uint64_t v16 = [v5 supportedIntents];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v33 count:16];
          if (!v17) {
            break;
          }
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v25;
LABEL_17:
          uint64_t v20 = 0;
          while (1)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v16);
            }
            if ([*(id *)(*((void *)&v24 + 1) + 8 * v20) isEqualToString:v14]) {
              break;
            }
            if (v18 == ++v20)
            {
              uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v33 count:16];
              if (v18) {
                goto LABEL_17;
              }
              goto LABEL_30;
            }
          }

          ++v13;
          id v5 = v15;
          if (v13 != v11) {
            goto LABEL_13;
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
          uint64_t v9 = v22;
          id v6 = 0;
          if (!v11) {
            goto LABEL_26;
          }
        }
LABEL_30:

        id v5 = v15;
        id v6 = 0;
      }
      else
      {
LABEL_26:

        if (v9)
        {
          __int16 v21 = INSiriLogContextIntents;
          if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v36 = "-[_INVocabularyValidator _determineIfBundleID:appPath:canProvideVocabularyOfType:completion:]_block_invoke";
            _os_log_impl(&dword_18CB2F000, v21, OS_LOG_TYPE_INFO, "%s Can provide vocabulary per on-device-app support because app supports this", buf, 0xCu);
          }
          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          goto LABEL_35;
        }
      }
      v7 = INSiriLogContextIntents;
      if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
LABEL_34:
        [*(id *)(a1 + 48) _confirmExistenceOfWatchAppForCompanionBundleID:*(void *)(a1 + 40) handlingIntents:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
LABEL_35:

        return;
      }
      *(_DWORD *)buf = 136315138;
      v36 = "-[_INVocabularyValidator _determineIfBundleID:appPath:canProvideVocabularyOfType:completion:]_block_invoke";
    }
    _os_log_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_INFO, "%s No on-device-app support found, searching for eligible watch apps", buf, 0xCu);
    goto LABEL_34;
  }
  id v2 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[_INVocabularyValidator _determineIfBundleID:appPath:canProvideVocabularyOfType:completion:]_block_invoke";
    _os_log_impl(&dword_18CB2F000, v2, OS_LOG_TYPE_INFO, "%s Can provide vocabulary per on-device-app support", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __101___INVocabularyValidator__confirmExistenceOfWatchAppForCompanionBundleID_handlingIntents_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[_INVocabularyValidator _confirmExistenceOfWatchAppForCompanionBundleID:handlingIntents:completion:]_block_invoke";
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_error_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_ERROR, "%s Error retrieving installed watch applications: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __101___INVocabularyValidator__confirmExistenceOfWatchAppForCompanionBundleID_handlingIntents_completion___block_invoke_101;
    v9[3] = &unk_1E551A940;
    id v11 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    [v8 fetchApplicationOnPairedDevice:0 withBundleID:v5 completion:v9];
  }
}

void __101___INVocabularyValidator__confirmExistenceOfWatchAppForCompanionBundleID_handlingIntents_completion___block_invoke_101(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    v8 = [v5 intentsSupported];
    if (v8)
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:*(void *)(a1 + 32)];
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v8];
      if ([v9 intersectsSet:v10])
      {
        id v11 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
        {
          int v13 = 136315138;
          __int16 v14 = "-[_INVocabularyValidator _confirmExistenceOfWatchAppForCompanionBundleID:handlingIntents:completion:]_block_invoke";
          _os_log_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_INFO, "%s Watch app that handles the required intents found.", (uint8_t *)&v13, 0xCu);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_14:
        goto LABEL_15;
      }
    }
    uint64_t v12 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      __int16 v14 = "-[_INVocabularyValidator _confirmExistenceOfWatchAppForCompanionBundleID:handlingIntents:completion:]_block_invoke";
      _os_log_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_INFO, "%s No Watch app that handles the required intents was found.", (uint8_t *)&v13, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_14;
  }
  v7 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136315394;
    __int16 v14 = "-[_INVocabularyValidator _confirmExistenceOfWatchAppForCompanionBundleID:handlingIntents:completion:]_block_invoke";
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_error_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_ERROR, "%s Error retrieving installed watch applications: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_15:
}

id __88___INVocabularyValidator_validatedItemsFromVocabularySpeakables_ofType_loggingWarnings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    objc_msgSend(v2, "spokenPhrases", 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          id v10 = [_INVocabularyItem alloc];
          id v11 = [v2 vocabularyIdentifier];
          id v12 = [(_INVocabularyItem *)v10 _initWithUncheckedString:v9 vocabularyIdentifier:v11 requiresUserIdentification:0];
          [v3 addObject:v12];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v4 = [[_INVocabularyItem alloc] _initWithUncheckedSpeakable:v2];
    id v18 = v4;
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  }

  return v3;
}

void __54___INVocabularyValidator__intentsUsingVocabularyType___block_invoke()
{
  v117[2] = *MEMORY[0x1E4F143B8];
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  v117[0] = v1;
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  v117[1] = v3;
  v105 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:2];

  id v4 = (objc_class *)objc_opt_class();
  v102 = NSStringFromClass(v4);
  v116[0] = v102;
  uint64_t v5 = (objc_class *)objc_opt_class();
  v100 = NSStringFromClass(v5);
  v116[1] = v100;
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  v116[2] = v7;
  v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  v116[3] = v9;
  id v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  v116[4] = v11;
  id v12 = (objc_class *)objc_opt_class();
  int v13 = NSStringFromClass(v12);
  v116[5] = v13;
  long long v14 = (objc_class *)objc_opt_class();
  long long v15 = NSStringFromClass(v14);
  v116[6] = v15;
  long long v16 = (objc_class *)objc_opt_class();
  long long v17 = NSStringFromClass(v16);
  v116[7] = v17;
  id v18 = (objc_class *)objc_opt_class();
  uint64_t v19 = NSStringFromClass(v18);
  v116[8] = v19;
  uint64_t v20 = (objc_class *)objc_opt_class();
  __int16 v21 = NSStringFromClass(v20);
  v116[9] = v21;
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  v116[10] = v23;
  long long v24 = (objc_class *)objc_opt_class();
  long long v25 = NSStringFromClass(v24);
  v116[11] = v25;
  v104 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:12];

  long long v26 = (objc_class *)objc_opt_class();
  long long v27 = NSStringFromClass(v26);
  v115[0] = v27;
  long long v28 = (objc_class *)objc_opt_class();
  long long v29 = NSStringFromClass(v28);
  v115[1] = v29;
  long long v30 = (objc_class *)objc_opt_class();
  long long v31 = NSStringFromClass(v30);
  v115[2] = v31;
  id v32 = (objc_class *)objc_opt_class();
  v33 = NSStringFromClass(v32);
  v115[3] = v33;
  v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:4];

  v34 = (objc_class *)objc_opt_class();
  v35 = NSStringFromClass(v34);
  v114[0] = v35;
  v36 = (objc_class *)objc_opt_class();
  __int16 v37 = NSStringFromClass(v36);
  v114[1] = v37;
  v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:2];

  id v38 = (objc_class *)objc_opt_class();
  uint64_t v39 = NSStringFromClass(v38);
  v113[0] = v39;
  v40 = (objc_class *)objc_opt_class();
  v41 = NSStringFromClass(v40);
  v113[1] = v41;
  v42 = (objc_class *)objc_opt_class();
  v43 = NSStringFromClass(v42);
  v113[2] = v43;
  v44 = (objc_class *)objc_opt_class();
  v45 = NSStringFromClass(v44);
  v113[3] = v45;
  v46 = (objc_class *)objc_opt_class();
  v47 = NSStringFromClass(v46);
  v113[4] = v47;
  v48 = (objc_class *)objc_opt_class();
  v49 = NSStringFromClass(v48);
  v113[5] = v49;
  v50 = (objc_class *)objc_opt_class();
  v51 = NSStringFromClass(v50);
  v113[6] = v51;
  v52 = (objc_class *)objc_opt_class();
  v53 = NSStringFromClass(v52);
  v113[7] = v53;
  v54 = (objc_class *)objc_opt_class();
  v55 = NSStringFromClass(v54);
  v113[8] = v55;
  v56 = (objc_class *)objc_opt_class();
  v57 = NSStringFromClass(v56);
  v113[9] = v57;
  v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:10];

  v58 = (objc_class *)objc_opt_class();
  v59 = NSStringFromClass(v58);
  v112[0] = v59;
  v60 = (objc_class *)objc_opt_class();
  v61 = NSStringFromClass(v60);
  v112[1] = v61;
  v62 = (objc_class *)objc_opt_class();
  v63 = NSStringFromClass(v62);
  v112[2] = v63;
  v64 = (objc_class *)objc_opt_class();
  v65 = NSStringFromClass(v64);
  v112[3] = v65;
  v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:4];

  v67 = (objc_class *)objc_opt_class();
  v68 = NSStringFromClass(v67);
  v111[0] = v68;
  v69 = (objc_class *)objc_opt_class();
  v70 = NSStringFromClass(v69);
  v111[1] = v70;
  v71 = (objc_class *)objc_opt_class();
  v72 = NSStringFromClass(v71);
  v111[2] = v72;
  v73 = (objc_class *)objc_opt_class();
  v74 = NSStringFromClass(v73);
  v111[3] = v74;
  v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:4];

  v76 = (objc_class *)objc_opt_class();
  v77 = NSStringFromClass(v76);
  v110[0] = v77;
  v78 = (objc_class *)objc_opt_class();
  v79 = NSStringFromClass(v78);
  v110[1] = v79;
  v80 = (objc_class *)objc_opt_class();
  v81 = NSStringFromClass(v80);
  v110[2] = v81;
  v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:3];

  v83 = (objc_class *)objc_opt_class();
  v84 = NSStringFromClass(v83);
  v109[0] = v84;
  v85 = (objc_class *)objc_opt_class();
  v86 = NSStringFromClass(v85);
  v109[1] = v86;
  v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:2];

  v88 = (objc_class *)objc_opt_class();
  v89 = NSStringFromClass(v88);
  v108[0] = v89;
  v90 = (objc_class *)objc_opt_class();
  v91 = NSStringFromClass(v90);
  v108[1] = v91;
  v92 = (objc_class *)objc_opt_class();
  v93 = NSStringFromClass(v92);
  v108[2] = v93;
  v94 = (objc_class *)objc_opt_class();
  v95 = NSStringFromClass(v94);
  v108[3] = v95;
  v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:4];

  v106[0] = &unk_1EDBA7588;
  v106[1] = &unk_1EDBA75A0;
  v107[0] = v105;
  v107[1] = v105;
  v106[2] = &unk_1EDBA75B8;
  v106[3] = &unk_1EDBA75D0;
  v107[2] = v105;
  v107[3] = v104;
  v106[4] = &unk_1EDBA75E8;
  v106[5] = &unk_1EDBA7600;
  v107[4] = v104;
  v107[5] = v103;
  v106[6] = &unk_1EDBA7618;
  v106[7] = &unk_1EDBA7630;
  v107[6] = v101;
  v107[7] = v99;
  v106[8] = &unk_1EDBA7648;
  v106[9] = &unk_1EDBA7660;
  v107[8] = v66;
  v107[9] = v75;
  v106[10] = &unk_1EDBA7678;
  v106[11] = &unk_1EDBA7690;
  v107[10] = v82;
  v107[11] = v87;
  v106[12] = &unk_1EDBA76A8;
  v106[13] = &unk_1EDBA76C0;
  v107[12] = v96;
  v107[13] = v96;
  v106[14] = &unk_1EDBA76D8;
  v106[15] = &unk_1EDBA76F0;
  v107[14] = v96;
  v107[15] = v96;
  v106[16] = &unk_1EDBA7708;
  v106[17] = &unk_1EDBA7720;
  v107[16] = v96;
  v107[17] = v96;
  uint64_t v97 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v106 count:18];
  v98 = (void *)_intentsUsingVocabularyType__sIntentsUsingSyncSlot;
  _intentsUsingVocabularyType__sIntentsUsingSyncSlot = v97;
}

@end