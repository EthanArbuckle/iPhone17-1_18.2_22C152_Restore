@interface NASAppIntentsInfoSyncHandler
- (NASAppIntentsInfoSyncHandler)init;
- (id)_pbLocalizedProjectsForVocabularyInfoDictionary:(id)a3;
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)syncDidEnd;
@end

@implementation NASAppIntentsInfoSyncHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nanoAppInfo, 0);

  objc_storeStrong((id *)&self->_nanoAppBundleId, 0);
}

- (id)_pbLocalizedProjectsForVocabularyInfoDictionary:(id)a3
{
  id v3 = a3;
  id v56 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  v57 = v3;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id obj = [v3 allKeys];
  id v58 = [obj countByEnumeratingWithState:&v114 objects:v125 count:16];
  if (v58)
  {
    uint64_t v54 = _INIntentTypePhrasesKey;
    uint64_t v55 = *(void *)v115;
    uint64_t v68 = _INIntentVocabularyExamplesKey;
    uint64_t v69 = _INIntentTypeKey;
    uint64_t v53 = _INIntentSlotVocabularyPoliciesKey;
    uint64_t v67 = _INIntentSlotNamesKey;
    uint64_t v66 = _INIntentSlotVocabularyValuesKey;
    uint64_t v77 = _INIntentSlotVocabularyIdentifierKey;
    uint64_t v76 = _INIntentSlotVocabularySynonymsKey;
    uint64_t v85 = _INIntentSlotVocabularyPhraseKey;
    uint64_t v84 = _INIntentSlotVocabularyPronunciationKey;
    uint64_t v83 = _INIntentSlotVocabularyExamplesKey;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v115 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v62 = v4;
        uint64_t v5 = *(void *)(*((void *)&v114 + 1) + 8 * v4);
        v6 = [v57 objectForKey:v5];
        id v7 = objc_alloc_init((Class)_INPBLocalizedProject);
        id v8 = objc_alloc_init((Class)_INPBLanguageTag);
        [v8 setTag:v5];
        v59 = v8;
        v60 = v7;
        [v7 setLanguage:v8];
        id v9 = objc_alloc_init((Class)_INPBIntentVocabulary);
        v63 = v6;
        v10 = objc_msgSend(v6, "nas_arrayValueForKey:expectedContainingObjectsType:", v54, objc_opt_class());
        long long v110 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        id v65 = v10;
        id v11 = [v10 countByEnumeratingWithState:&v110 objects:v124 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v111;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v111 != v13) {
                objc_enumerationMutation(v65);
              }
              v15 = *(void **)(*((void *)&v110 + 1) + 8 * i);
              id v16 = objc_alloc_init((Class)_INPBIntentTypePhrases);
              id v17 = objc_alloc_init((Class)_INPBIntentType);
              v18 = objc_msgSend(v15, "nas_stringValueForKey:", v69);
              [v17 setType:v18];

              [v16 setIntentType:v17];
              v19 = objc_msgSend(v15, "nas_arrayValueForKey:expectedContainingObjectsType:", v68, objc_opt_class());
              long long v106 = 0u;
              long long v107 = 0u;
              long long v108 = 0u;
              long long v109 = 0u;
              id v20 = [v19 countByEnumeratingWithState:&v106 objects:v123 count:16];
              if (v20)
              {
                id v21 = v20;
                uint64_t v22 = *(void *)v107;
                do
                {
                  for (j = 0; j != v21; j = (char *)j + 1)
                  {
                    if (*(void *)v107 != v22) {
                      objc_enumerationMutation(v19);
                    }
                    [v16 addIntentVocabularyExamples:*(void *)(*((void *)&v106 + 1) + 8 * (void)j)];
                  }
                  id v21 = [v19 countByEnumeratingWithState:&v106 objects:v123 count:16];
                }
                while (v21);
              }
              [v9 addIntentTypePhrases:v16];
            }
            id v12 = [v65 countByEnumeratingWithState:&v110 objects:v124 count:16];
          }
          while (v12);
        }
        v24 = objc_msgSend(v63, "nas_arrayValueForKey:expectedContainingObjectsType:", v53, objc_opt_class());
        long long v102 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        id v64 = v24;
        id v72 = [v24 countByEnumeratingWithState:&v102 objects:v122 count:16];
        if (v72)
        {
          uint64_t v70 = *(void *)v103;
          v71 = v9;
          do
          {
            uint64_t v25 = 0;
            do
            {
              if (*(void *)v103 != v70) {
                objc_enumerationMutation(v64);
              }
              uint64_t v74 = v25;
              v26 = *(void **)(*((void *)&v102 + 1) + 8 * v25);
              id v27 = objc_alloc_init((Class)_INPBIntentSlotVocabularyPolicy);
              v28 = objc_msgSend(v26, "nas_arrayValueForKey:expectedContainingObjectsType:", v67, objc_opt_class());
              long long v98 = 0u;
              long long v99 = 0u;
              long long v100 = 0u;
              long long v101 = 0u;
              id v29 = [v28 countByEnumeratingWithState:&v98 objects:v121 count:16];
              if (v29)
              {
                id v30 = v29;
                uint64_t v31 = *(void *)v99;
                do
                {
                  for (k = 0; k != v30; k = (char *)k + 1)
                  {
                    if (*(void *)v99 != v31) {
                      objc_enumerationMutation(v28);
                    }
                    [v27 addIntentSlotNames:*(void *)(*((void *)&v98 + 1) + 8 * (void)k)];
                  }
                  id v30 = [v28 countByEnumeratingWithState:&v98 objects:v121 count:16];
                }
                while (v30);
              }
              v73 = v28;
              v33 = objc_msgSend(v26, "nas_arrayValueForKey:expectedContainingObjectsType:", v66, objc_opt_class());
              long long v94 = 0u;
              long long v95 = 0u;
              long long v96 = 0u;
              long long v97 = 0u;
              id v75 = v33;
              id v80 = [v33 countByEnumeratingWithState:&v94 objects:v120 count:16];
              if (v80)
              {
                uint64_t v78 = *(void *)v95;
                v79 = v27;
                do
                {
                  uint64_t v34 = 0;
                  do
                  {
                    if (*(void *)v95 != v78) {
                      objc_enumerationMutation(v75);
                    }
                    uint64_t v82 = v34;
                    v35 = *(void **)(*((void *)&v94 + 1) + 8 * v34);
                    id v36 = objc_alloc_init((Class)_INPBIntentSlotVocabularyConcept);
                    v81 = objc_msgSend(v35, "nas_stringValueForKey:", v77);
                    objc_msgSend(v36, "setIdentifier:");
                    v37 = objc_msgSend(v35, "nas_arrayValueForKey:expectedContainingObjectsType:", v76, objc_opt_class());
                    long long v90 = 0u;
                    long long v91 = 0u;
                    long long v92 = 0u;
                    long long v93 = 0u;
                    id v38 = [v37 countByEnumeratingWithState:&v90 objects:v119 count:16];
                    if (v38)
                    {
                      id v39 = v38;
                      uint64_t v40 = *(void *)v91;
                      do
                      {
                        for (m = 0; m != v39; m = (char *)m + 1)
                        {
                          if (*(void *)v91 != v40) {
                            objc_enumerationMutation(v37);
                          }
                          v42 = *(void **)(*((void *)&v90 + 1) + 8 * (void)m);
                          id v43 = objc_alloc_init((Class)_INPBIntentSlotVocabularyValue);
                          v44 = objc_msgSend(v42, "nas_stringValueForKey:", v85);
                          [v43 setPhrase:v44];

                          v45 = objc_msgSend(v42, "nas_stringValueForKey:", v84);
                          [v43 setPronunciation:v45];

                          v46 = objc_msgSend(v42, "nas_arrayValueForKey:expectedContainingObjectsType:", v83, objc_opt_class());
                          long long v86 = 0u;
                          long long v87 = 0u;
                          long long v88 = 0u;
                          long long v89 = 0u;
                          id v47 = [v46 countByEnumeratingWithState:&v86 objects:v118 count:16];
                          if (v47)
                          {
                            id v48 = v47;
                            uint64_t v49 = *(void *)v87;
                            do
                            {
                              for (n = 0; n != v48; n = (char *)n + 1)
                              {
                                if (*(void *)v87 != v49) {
                                  objc_enumerationMutation(v46);
                                }
                                [v43 addExamples:*(void *)(*((void *)&v86 + 1) + 8 * (void)n)];
                              }
                              id v48 = [v46 countByEnumeratingWithState:&v86 objects:v118 count:16];
                            }
                            while (v48);
                          }
                          [v36 addSynonyms:v43];
                        }
                        id v39 = [v37 countByEnumeratingWithState:&v90 objects:v119 count:16];
                      }
                      while (v39);
                    }
                    id v27 = v79;
                    [v79 addIntentSlotVocabularyConcepts:v36];

                    uint64_t v34 = v82 + 1;
                  }
                  while ((id)(v82 + 1) != v80);
                  id v80 = [v75 countByEnumeratingWithState:&v94 objects:v120 count:16];
                }
                while (v80);
              }
              id v9 = v71;
              [v71 addIntentSlotVocabularyPolicies:v27];

              uint64_t v25 = v74 + 1;
            }
            while ((id)(v74 + 1) != v72);
            id v72 = [v64 countByEnumeratingWithState:&v102 objects:v122 count:16];
          }
          while (v72);
        }
        [v60 setIntentVocabulary:v9];
        [v56 addObject:v60];

        uint64_t v4 = v62 + 1;
      }
      while ((id)(v62 + 1) != v58);
      id v58 = [obj countByEnumeratingWithState:&v114 objects:v125 count:16];
    }
    while (v58);
  }

  return v56;
}

- (void)syncDidEnd
{
  nanoAppBundleId = self->_nanoAppBundleId;
  self->_nanoAppBundleId = 0;

  nanoAppInfo = self->_nanoAppInfo;
  self->_nanoAppInfo = 0;
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  group = self->_group;
  dispatch_time_t v9 = dispatch_time(0, 3000000000);
  dispatch_group_wait((dispatch_group_t)group, v9);
  nanoAppInfo = self->_nanoAppInfo;
  if (nanoAppInfo)
  {
    uint64_t v62 = v7;
    id v64 = v6;
    id v11 = [(NSDictionary *)nanoAppInfo objectForKey:ACXIntentsSupportedAggregateKey];
    id v12 = +[NSSet setWithArray:v11];

    uint64_t v13 = [(NSDictionary *)self->_nanoAppInfo objectForKey:ACXIntentsRestrictedWhileLockedAggregateKey];
    v14 = +[NSSet setWithArray:v13];

    v63 = self;
    v61 = [(NSDictionary *)self->_nanoAppInfo objectForKey:ACXContainerAppBundleIdKey];
    v15 = +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:");
    v59 = [v15 bundleURL];
    v60 = v15;
    if (v59)
    {
      id v56 = v12;
      v57 = v14;
      id v16 = objc_alloc((Class)NSBundle);
      id v17 = [v15 bundleURL];
      id v18 = [v16 initWithURL:v17];

      v19 = [v18 localizations];
      id v65 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v19, "count"));
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v20 = v19;
      id v21 = [v20 countByEnumeratingWithState:&v78 objects:v85 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v79;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v79 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v78 + 1) + 8 * i);
            v26 = [v18 URLForResource:@"IntentVocabulary" withExtension:@"plist" subdirectory:0 localization:v25];
            if (v26)
            {
              id v27 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v26];
              if (v27) {
                [v65 setObject:v27 forKey:v25];
              }
            }
          }
          id v22 = [v20 countByEnumeratingWithState:&v78 objects:v85 count:16];
        }
        while (v22);
      }

      id v12 = v56;
      v14 = v57;
    }
    else
    {
      id v65 = 0;
    }
    id v28 = objc_alloc_init((Class)_INPBAppBundleInfo);
    id v29 = objc_alloc_init((Class)_INPBIntentSupport);
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v30 = v12;
    id v31 = [v30 countByEnumeratingWithState:&v74 objects:v84 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v75;
      do
      {
        for (j = 0; j != v32; j = (char *)j + 1)
        {
          if (*(void *)v75 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void *)(*((void *)&v74 + 1) + 8 * (void)j);
          id v36 = objc_alloc_init((Class)_INPBIntentType);
          [v36 setType:v35];
          [v29 addIntentsSupported:v36];
        }
        id v32 = [v30 countByEnumeratingWithState:&v74 objects:v84 count:16];
      }
      while (v32);
    }

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v37 = v14;
    id v38 = [v37 countByEnumeratingWithState:&v70 objects:v83 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v71;
      do
      {
        for (k = 0; k != v39; k = (char *)k + 1)
        {
          if (*(void *)v71 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = *(void *)(*((void *)&v70 + 1) + 8 * (void)k);
          id v43 = objc_alloc_init((Class)_INPBIntentType);
          [v43 setType:v42];
          [v29 addIntentsRestrictedWhileLocked:v43];
        }
        id v39 = [v37 countByEnumeratingWithState:&v70 objects:v83 count:16];
      }
      while (v39);
    }

    [v28 addIntentSupport:v29];
    v44 = [(NASAppIntentsInfoSyncHandler *)v63 _pbLocalizedProjectsForVocabularyInfoDictionary:v65];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v45 = [v44 countByEnumeratingWithState:&v66 objects:v82 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v67;
      do
      {
        for (m = 0; m != v46; m = (char *)m + 1)
        {
          if (*(void *)v67 != v47) {
            objc_enumerationMutation(v44);
          }
          [v28 addLocalizedProjects:*(void *)(*((void *)&v66 + 1) + 8 * (void)m)];
        }
        id v46 = [v44 countByEnumeratingWithState:&v66 objects:v82 count:16];
      }
      while (v46);
    }
    id v49 = [v28 data];
    CC_SHA1([v49 bytes], (CC_LONG)objc_msgSend(v49, "length"), md);
    v50 = +[NSMutableString stringWithCapacity:40];
    for (uint64_t n = 0; n != 20; ++n)
      objc_msgSend(v50, "appendFormat:", @"%02x", md[n]);
    if ([v50 isEqualToString:v64])
    {
      id v7 = v62;
      [v62 setObject:0];
    }
    else
    {
      id v52 = objc_alloc_init((Class)SAIntentGroupProtobufMessage);
      [v52 setData:v49];
      id v58 = v52;
      [v52 setTypeName:@"sirikit.apps.AppBundleInfo"];
      id v53 = objc_alloc_init((Class)SAIntentGroupAceAppIntentPolicyAndVocab);
      [v53 setAceAppBundleInfo:v52];
      id v54 = [objc_alloc((Class)NSString) initWithFormat:@"x-apple-siri://nano/%@", v63->_nanoAppBundleId];
      uint64_t v55 = +[NSURL URLWithString:v54];
      [v53 setIdentifier:v55];

      id v7 = v62;
      [v62 setObject:v53];
    }
    [v7 setPostAnchor:v50];
    [v7 setIsDelete:0];

    id v6 = v64;
  }
  else
  {
    [v7 setObject:0];
    [v7 setIsDelete:0];
    [v7 setPostAnchor:0];
  }
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7
{
  id v10 = a4;
  id v11 = a7;
  dispatch_group_enter((dispatch_group_t)self->_group);
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_5CC0;
  v15[3] = &unk_8338;
  id v16 = v10;
  id v17 = v11;
  id v18 = self;
  SEL v19 = a2;
  id v13 = v11;
  id v14 = v10;
  dispatch_async((dispatch_queue_t)queue, v15);
}

- (NASAppIntentsInfoSyncHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)NASAppIntentsInfoSyncHandler;
  v2 = [(NASAppIntentsInfoSyncHandler *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Nano Intents Sync", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_group_t v5 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v5;
  }
  return v2;
}

@end