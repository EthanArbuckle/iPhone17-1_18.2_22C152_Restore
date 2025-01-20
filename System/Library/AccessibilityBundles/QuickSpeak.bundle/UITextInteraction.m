@interface UITextInteraction
@end

@implementation UITextInteraction

void __74__UITextInteraction_QSExtras__updatedAccessibilityTextSpeechMenuWithMenu___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  v43 = a2;
  v55 = +[AXQuickSpeak sharedInstance];
  v47 = [v55 selectedContent];
  v44 = [v47 unpredictedAmbiguousLangMaps];
  v45 = [v47 predictedSecondaryLangMaps];
  v46 = [v47 unambiguousLangMaps];
  v3 = v46;
  if ((unint64_t)[v46 count] < 2)
  {
    if ([v46 count] != 1)
    {
      v57 = 0;
      goto LABEL_7;
    }
    v5 = NSString;
    v4 = accessibilityQuickSpeakLocalizedString(@"quickspeak.one.nonambiguous.language");
    v6 = [v46 firstObject];
    v7 = [v6 defaultDialect];
    v8 = [v7 languageNameInNativeLocale];
    v57 = objc_msgSend(v5, "stringWithFormat:", v4, v8);
  }
  else
  {
    v4 = accessibilityQuickSpeakLocalizedString(@"quickspeak.many.languages");
    v57 = objc_msgSend(NSString, "localizedStringWithFormat:", v4, objc_msgSend(v46, "count"));
  }

  v3 = v46;
LABEL_7:
  v9 = v45;
  if (v45 && [v3 intersectsOrderedSet:v45])
  {
    v10 = AXLogSpeakSelection();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v74 = v45;
      __int16 v75 = 2112;
      v76 = v46;
      _os_log_impl(&dword_240270000, v10, OS_LOG_TYPE_INFO, "Secondary maps contained langs in non ambiguous maps. Secondary Maps: %@ Non-ambiguous Maps: %@", buf, 0x16u);
    }

    v9 = v45;
  }
  BOOL v11 = v9 == 0;
  v54 = [MEMORY[0x263EFF980] array];
  v12 = [MEMORY[0x263EFF9B0] orderedSet];
  [v12 unionOrderedSet:v44];
  if (!v11)
  {
    v13 = [v47 primaryUnambiguousDialect];
    BOOL v14 = v13 == 0;

    if (v14)
    {
      v16 = [v47 primaryAmbiguousDialect];
      BOOL v17 = v16 == 0;

      if (v17)
      {
LABEL_18:
        [v12 unionOrderedSet:v45];
        goto LABEL_19;
      }
      v15 = [v47 primaryAmbiguousDialect];
    }
    else
    {
      v15 = [v47 primaryUnambiguousDialect];
    }
    v18 = v15;
    v19 = [v15 langMap];
    [v12 addObject:v19];

    goto LABEL_18;
  }
LABEL_19:
  long long v68 = 0u;
  long long v69 = 0u;
  long long v67 = 0u;
  long long v66 = 0u;
  obuint64_t j = v12;
  uint64_t v50 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (v50)
  {
    uint64_t v49 = *(void *)v67;
    from = (id *)(a1 + 32);
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v67 != v49) {
          objc_enumerationMutation(obj);
        }
        v56 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        v20 = [v56 associatedAmbiguousLanguages];
        v21 = [MEMORY[0x263F228D0] sharedInstance];
        v22 = [v21 systemLanguageID];
        char v23 = [v20 containsObject:v22];

        if ((v23 & 1) == 0)
        {
          v24 = [v56 defaultDialect];
          v71 = v24;
          v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v71 count:1];

          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v52 = v25;
          uint64_t v26 = [v52 countByEnumeratingWithState:&v62 objects:v70 count:16];
          if (!v26) {
            goto LABEL_40;
          }
          uint64_t v27 = *(void *)v63;
          while (1)
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v63 != v27) {
                objc_enumerationMutation(v52);
              }
              v29 = *(void **)(*((void *)&v62 + 1) + 8 * j);
              v30 = [MEMORY[0x263F228D0] sharedInstance];
              v31 = [v30 dialectForCurrentLocale];
              v32 = [v31 langMap];
              if ([v56 isEqual:v32])
              {
                v33 = [MEMORY[0x263F228D0] sharedInstance];
                v34 = [v33 dialectForCurrentLocale];
                int v35 = [v29 isEqual:v34];

                if (!v35) {
                  continue;
                }
              }
              else
              {
              }
              v36 = [v29 languageNameInNativeLocale];
              v37 = v36;
              if (v57)
              {
                v38 = NSString;
                v39 = accessibilityQuickSpeakLocalizedString(@"quickspeak.preferred.language");
                objc_msgSend(v38, "stringWithFormat:", v39, v37, v57);
                id v40 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                id v40 = v36;
              }
              v41 = (void *)MEMORY[0x263F1C3C0];
              v58[0] = MEMORY[0x263EF8330];
              v58[1] = 3221225472;
              v58[2] = __74__UITextInteraction_QSExtras__updatedAccessibilityTextSpeechMenuWithMenu___block_invoke_305;
              v58[3] = &unk_2650AA030;
              id v59 = v55;
              objc_copyWeak(&v61, from);
              v60 = v29;
              v42 = [v41 actionWithTitle:v40 image:0 identifier:0 handler:v58];
              [v54 addObject:v42];

              objc_destroyWeak(&v61);
            }
            uint64_t v26 = [v52 countByEnumeratingWithState:&v62 objects:v70 count:16];
            if (!v26)
            {
LABEL_40:

              break;
            }
          }
        }
      }
      uint64_t v50 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
    }
    while (v50);
  }

  v43[2](v43, v54);
}

void __74__UITextInteraction_QSExtras__updatedAccessibilityTextSpeechMenuWithMenu___block_invoke_305(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = [*(id *)(a1 + 40) specificLanguageID];
  [v2 speakAction:WeakRetained withPreferredLanguage:v3];
}

@end