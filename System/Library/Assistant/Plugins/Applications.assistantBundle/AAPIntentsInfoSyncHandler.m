@interface AAPIntentsInfoSyncHandler
- (id)_pbLocalizedProjectsForVocabularyInfoDictionary:(id)a3;
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7;
- (void)dealloc;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)syncDidEnd;
@end

@implementation AAPIntentsInfoSyncHandler

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AAPIntentsInfoSyncHandler;
  [(AAPIntentsInfoSyncHandler *)&v3 dealloc];
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7
{
  if (([a4 isEqualToString:@"IntentsInfo"] & 1) == 0) {
    [a7 resetWithValidity:@"IntentsInfo"];
  }
  if (self->_extensions) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"AAPIntentsInfoSyncHandler.m", 59, @"%@ trying to start a sync for a new key before the previous one ends!! %@", self, a7 object file lineNumber description];
  }
  v10 = (NSString *)objc_msgSend(objc_msgSend(objc_msgSend(a7, "appMetadata"), "appIdentifyingInfo"), "bundleId");
  self->_appBundleId = v10;
  if (v10)
  {
    self->_extensions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v11 = +[LSApplicationProxy applicationProxyForIdentifier:self->_appBundleId];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = [v11 plugInKitPlugins];
    id v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v24;
      uint64_t v16 = INIntentsServiceExtensionPointName;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (objc_msgSend(objc_msgSend(v18, "protocol"), "isEqualToString:", v16)) {
            [(NSMutableArray *)self->_extensions addObject:v18];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v14);
    }
    v19 = +[INAppInfo appInfoWithAppProxy:v11];
    self->_appInfo = v19;
    if (!objc_msgSend(-[INAppInfo supportedIntents](v19, "supportedIntents"), "count"))
    {
      v20 = AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
      {
        appBundleId = self->_appBundleId;
        *(_DWORD *)buf = 136315394;
        v28 = "-[AAPIntentsInfoSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:]";
        __int16 v29 = 2112;
        v30 = appBundleId;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: The app %@ no longer supports any intents", buf, 0x16u);
      }
      [a7 resetWithValidity:@"IntentsInfo"];
    }
  }
  else
  {
    v22 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_15350(v22);
    }
  }
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  if (objc_msgSend(-[INAppInfo supportedIntents](self->_appInfo, "supportedIntents"), "count"))
  {
    id v7 = [(INAppInfo *)self->_appInfo supportedIntents];
    if (![v7 count])
    {
      v8 = AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_153D4((uint64_t)self, v8);
      }
    }
    id v9 = [(INAppInfo *)self->_appInfo actionsRestrictedWhileLocked];
    id v10 = [(INAppInfo *)self->_appInfo supportedMediaCategories];
    id v11 = objc_msgSend(-[NSMutableArray firstObject](self->_extensions, "firstObject"), "containingBundle");
    if (!v11 || (id v12 = v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      id v12 = +[LSApplicationProxy applicationProxyForIdentifier:self->_appBundleId];
    }
    id v50 = a4;
    v51 = v9;
    id v53 = a3;
    v54 = self;
    v52 = v10;
    if ([v12 bundleURL]) {
      id v13 = +[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", [v12 bundleURL]);
    }
    else {
      id v13 = 0;
    }
    id v14 = [(NSBundle *)v13 localizations];
    id v55 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](v14, "count"));
    obj = v14;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v73 objects:v81 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v74;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v74 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v73 + 1) + 8 * i);
          v20 = [(NSBundle *)v13 URLForResource:@"AppIntentVocabulary" withExtension:@"plist" subdirectory:0 localization:v19];
          if (v20)
          {
            id v21 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v20];
            if (v21) {
              [v55 setObject:v21 forKey:v19];
            }
          }
        }
        id v16 = [(NSArray *)obj countByEnumeratingWithState:&v73 objects:v81 count:16];
      }
      while (v16);
    }
    id v22 = objc_alloc_init((Class)_INPBAppBundleInfo);
    id v23 = objc_alloc_init((Class)_INPBIntentSupport);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v24 = [v7 countByEnumeratingWithState:&v69 objects:v80 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v70;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v70 != v26) {
            objc_enumerationMutation(v7);
          }
          uint64_t v28 = *(void *)(*((void *)&v69 + 1) + 8 * (void)j);
          id v29 = objc_alloc_init((Class)_INPBIntentType);
          [v29 setType:v28];
          [v23 addIntentsSupported:v29];
        }
        id v25 = [v7 countByEnumeratingWithState:&v69 objects:v80 count:16];
      }
      while (v25);
    }
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v30 = [v51 countByEnumeratingWithState:&v65 objects:v79 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v66;
      do
      {
        for (k = 0; k != v31; k = (char *)k + 1)
        {
          if (*(void *)v66 != v32) {
            objc_enumerationMutation(v51);
          }
          uint64_t v34 = *(void *)(*((void *)&v65 + 1) + 8 * (void)k);
          id v35 = objc_alloc_init((Class)_INPBIntentType);
          [v35 setType:v34];
          [v23 addIntentsRestrictedWhileLocked:v35];
        }
        id v31 = [v51 countByEnumeratingWithState:&v65 objects:v79 count:16];
      }
      while (v31);
    }
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v36 = [v52 countByEnumeratingWithState:&v61 objects:v78 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v62;
      do
      {
        for (m = 0; m != v37; m = (char *)m + 1)
        {
          if (*(void *)v62 != v38) {
            objc_enumerationMutation(v52);
          }
          [v23 addSupportedMediaCategories:*(void *)(*((void *)&v61 + 1) + 8 * (void)m)];
        }
        id v37 = [v52 countByEnumeratingWithState:&v61 objects:v78 count:16];
      }
      while (v37);
    }
    [v22 addIntentSupport:v23];
    id v40 = [(AAPIntentsInfoSyncHandler *)v54 _pbLocalizedProjectsForVocabularyInfoDictionary:INVocabulariesByLocaleByAddingInvocationPhrases()];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v41 = [v40 countByEnumeratingWithState:&v57 objects:v77 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v58;
      do
      {
        for (n = 0; n != v42; n = (char *)n + 1)
        {
          if (*(void *)v58 != v43) {
            objc_enumerationMutation(v40);
          }
          [v22 addLocalizedProjects:*(void *)(*((void *)&v57 + 1) + 8 * (void)n)];
        }
        id v42 = [v40 countByEnumeratingWithState:&v57 objects:v77 count:16];
      }
      while (v42);
    }
    id v45 = [v22 data];
    CC_SHA1([v45 bytes], (CC_LONG)objc_msgSend(v45, "length"), md);
    v46 = +[NSMutableString stringWithCapacity:40];
    for (uint64_t ii = 0; ii != 20; ++ii)
      [(NSMutableString *)v46 appendFormat:@"%02x", md[ii]];
    if ([(NSMutableString *)v46 isEqualToString:v53])
    {
      id v48 = 0;
    }
    else
    {
      id v49 = objc_alloc_init((Class)SAIntentGroupProtobufMessage);
      [v49 setData:v45];
      [v49 setTypeName:@"sirikit.apps.AppBundleInfo"];
      id v48 = objc_alloc_init((Class)SAIntentGroupAceAppIntentPolicyAndVocab);
      [v48 setAceAppBundleInfo:v49];
      objc_msgSend(v48, "setIdentifier:", +[NSURL URLWithString:](NSURL, "URLWithString:", v54->_appBundleId));
    }
    [v50 setObject:v48];
    [v50 setPostAnchor:v46];
    [v50 setIsDelete:0];
  }
  else
  {
    [a4 setObject:0];
    [a4 setIsDelete:0];
    [a4 setPostAnchor:0];
  }
}

- (void)syncDidEnd
{
  self->_extensions = 0;
  self->_appBundleId = 0;

  self->_appInfo = 0;
}

- (id)_pbLocalizedProjectsForVocabularyInfoDictionary:(id)a3
{
  id v53 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(a3, "count"));
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id obj = [a3 allKeys];
  id v54 = [obj countByEnumeratingWithState:&v107 objects:v118 count:16];
  if (v54)
  {
    uint64_t v51 = *(void *)v108;
    uint64_t v50 = _INIntentTypePhrasesKey;
    uint64_t v62 = _INIntentTypeKey;
    uint64_t v61 = _INIntentVocabularyExamplesKey;
    uint64_t v49 = _INIntentSlotVocabularyPoliciesKey;
    uint64_t v59 = _INIntentSlotVocabularyValuesKey;
    uint64_t v60 = _INIntentSlotNamesKey;
    uint64_t v69 = _INIntentSlotVocabularyRequiresUserIdentificationKey;
    uint64_t v70 = _INIntentSlotVocabularyIdentifierKey;
    uint64_t v68 = _INIntentSlotVocabularySynonymsKey;
    uint64_t v78 = _INIntentSlotVocabularyPhraseKey;
    uint64_t v77 = _INIntentSlotVocabularyPronunciationKey;
    uint64_t v76 = _INIntentSlotVocabularyExamplesKey;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v108 != v51) {
          objc_enumerationMutation(obj);
        }
        uint64_t v57 = v3;
        uint64_t v4 = *(void *)(*((void *)&v107 + 1) + 8 * v3);
        id v5 = [a3 objectForKey:v4];
        id v6 = objc_alloc_init((Class)_INPBLocalizedProject);
        id v7 = objc_alloc_init((Class)_INPBLanguageTag);
        [v7 setTag:v4];
        id v55 = v6;
        [v6 setLanguage:v7];
        id v8 = objc_alloc_init((Class)_INPBIntentVocabulary);
        long long v74 = v5;
        id v9 = objc_msgSend(v5, "aap_arrayValueForKey:expectedContainingObjectsType:", v50, objc_opt_class());
        long long v103 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        id v10 = [v9 countByEnumeratingWithState:&v103 objects:v117 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v104;
          do
          {
            id v13 = 0;
            do
            {
              if (*(void *)v104 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v103 + 1) + 8 * (void)v13);
              id v15 = objc_alloc_init((Class)_INPBIntentTypePhrases);
              id v16 = objc_alloc_init((Class)_INPBIntentType);
              objc_msgSend(v16, "setType:", objc_msgSend(v14, "aap_stringValueForKey:", v62));
              [v15 setIntentType:v16];
              id v17 = objc_msgSend(v14, "aap_arrayValueForKey:expectedContainingObjectsType:", v61, objc_opt_class());
              long long v99 = 0u;
              long long v100 = 0u;
              long long v101 = 0u;
              long long v102 = 0u;
              id v18 = [v17 countByEnumeratingWithState:&v99 objects:v116 count:16];
              if (v18)
              {
                id v19 = v18;
                uint64_t v20 = *(void *)v100;
                do
                {
                  id v21 = 0;
                  do
                  {
                    if (*(void *)v100 != v20) {
                      objc_enumerationMutation(v17);
                    }
                    [v15 addIntentVocabularyExamples:*(void *)(*((void *)&v99 + 1) + 8 * (void)v21)];
                    id v21 = (char *)v21 + 1;
                  }
                  while (v19 != v21);
                  id v19 = [v17 countByEnumeratingWithState:&v99 objects:v116 count:16];
                }
                while (v19);
              }
              [v8 addIntentTypePhrases:v15];
              id v13 = (char *)v13 + 1;
            }
            while (v13 != v11);
            id v11 = [v9 countByEnumeratingWithState:&v103 objects:v117 count:16];
          }
          while (v11);
        }
        id v22 = objc_msgSend(v74, "aap_arrayValueForKey:expectedContainingObjectsType:", v49, objc_opt_class());
        long long v95 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        id v58 = v22;
        id v65 = [v22 countByEnumeratingWithState:&v95 objects:v115 count:16];
        if (v65)
        {
          uint64_t v63 = *(void *)v96;
          long long v64 = v8;
          do
          {
            uint64_t v23 = 0;
            do
            {
              if (*(void *)v96 != v63) {
                objc_enumerationMutation(v58);
              }
              uint64_t v66 = v23;
              id v24 = *(void **)(*((void *)&v95 + 1) + 8 * v23);
              id v25 = objc_alloc_init((Class)_INPBIntentSlotVocabularyPolicy);
              id v26 = objc_msgSend(v24, "aap_arrayValueForKey:expectedContainingObjectsType:", v60, objc_opt_class());
              long long v91 = 0u;
              long long v92 = 0u;
              long long v93 = 0u;
              long long v94 = 0u;
              id v27 = [v26 countByEnumeratingWithState:&v91 objects:v114 count:16];
              if (v27)
              {
                id v28 = v27;
                uint64_t v29 = *(void *)v92;
                do
                {
                  id v30 = 0;
                  do
                  {
                    if (*(void *)v92 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    [v25 addIntentSlotNames:*(void *)(*((void *)&v91 + 1) + 8 * (void)v30)];
                    id v30 = (char *)v30 + 1;
                  }
                  while (v28 != v30);
                  id v28 = [v26 countByEnumeratingWithState:&v91 objects:v114 count:16];
                }
                while (v28);
              }
              id v31 = objc_msgSend(v24, "aap_arrayValueForKey:expectedContainingObjectsType:", v59, objc_opt_class());
              long long v87 = 0u;
              long long v88 = 0u;
              long long v89 = 0u;
              long long v90 = 0u;
              id v67 = v31;
              id v73 = [v31 countByEnumeratingWithState:&v87 objects:v113 count:16];
              if (v73)
              {
                uint64_t v71 = *(void *)v88;
                long long v72 = v25;
                do
                {
                  uint64_t v32 = 0;
                  do
                  {
                    if (*(void *)v88 != v71) {
                      objc_enumerationMutation(v67);
                    }
                    uint64_t v75 = v32;
                    v33 = *(void **)(*((void *)&v87 + 1) + 8 * v32);
                    id v34 = objc_alloc_init((Class)_INPBIntentSlotVocabularyConcept);
                    objc_msgSend(v34, "setIdentifier:", objc_msgSend(v33, "aap_stringValueForKey:", v70));
                    objc_msgSend(v34, "setRequiresUserIdentification:", objc_msgSend(v33, "aap_BOOLValueForKey:", v69));
                    id v35 = objc_msgSend(v33, "aap_arrayValueForKey:expectedContainingObjectsType:", v68, objc_opt_class());
                    long long v83 = 0u;
                    long long v84 = 0u;
                    long long v85 = 0u;
                    long long v86 = 0u;
                    id v36 = [v35 countByEnumeratingWithState:&v83 objects:v112 count:16];
                    if (v36)
                    {
                      id v37 = v36;
                      uint64_t v38 = *(void *)v84;
                      do
                      {
                        v39 = 0;
                        do
                        {
                          if (*(void *)v84 != v38) {
                            objc_enumerationMutation(v35);
                          }
                          id v40 = *(void **)(*((void *)&v83 + 1) + 8 * (void)v39);
                          id v41 = objc_alloc_init((Class)_INPBIntentSlotVocabularyValue);
                          objc_msgSend(v41, "setPhrase:", objc_msgSend(v40, "aap_stringValueForKey:", v78));
                          objc_msgSend(v41, "setPronunciation:", objc_msgSend(v40, "aap_stringValueForKey:", v77));
                          id v42 = objc_msgSend(v40, "aap_arrayValueForKey:expectedContainingObjectsType:", v76, objc_opt_class());
                          long long v79 = 0u;
                          long long v80 = 0u;
                          long long v81 = 0u;
                          long long v82 = 0u;
                          id v43 = [v42 countByEnumeratingWithState:&v79 objects:v111 count:16];
                          if (v43)
                          {
                            id v44 = v43;
                            uint64_t v45 = *(void *)v80;
                            do
                            {
                              v46 = 0;
                              do
                              {
                                if (*(void *)v80 != v45) {
                                  objc_enumerationMutation(v42);
                                }
                                [v41 addExamples:*(void *)(*((void *)&v79 + 1) + 8 * (void)v46)];
                                v46 = (char *)v46 + 1;
                              }
                              while (v44 != v46);
                              id v44 = [v42 countByEnumeratingWithState:&v79 objects:v111 count:16];
                            }
                            while (v44);
                          }
                          [v34 addSynonyms:v41];
                          v39 = (char *)v39 + 1;
                        }
                        while (v39 != v37);
                        id v37 = [v35 countByEnumeratingWithState:&v83 objects:v112 count:16];
                      }
                      while (v37);
                    }
                    id v25 = v72;
                    [v72 addIntentSlotVocabularyConcepts:v34];
                    uint64_t v32 = v75 + 1;
                  }
                  while ((id)(v75 + 1) != v73);
                  id v73 = [v67 countByEnumeratingWithState:&v87 objects:v113 count:16];
                }
                while (v73);
              }
              id v8 = v64;
              [v64 addIntentSlotVocabularyPolicies:v25];
              uint64_t v23 = v66 + 1;
            }
            while ((id)(v66 + 1) != v65);
            id v65 = [v58 countByEnumeratingWithState:&v95 objects:v115 count:16];
          }
          while (v65);
        }
        [v55 setIntentVocabulary:v8];
        [v53 addObject:v55];
        uint64_t v3 = v57 + 1;
      }
      while ((id)(v57 + 1) != v54);
      id v54 = [obj countByEnumeratingWithState:&v107 objects:v118 count:16];
    }
    while (v54);
  }
  return v53;
}

@end