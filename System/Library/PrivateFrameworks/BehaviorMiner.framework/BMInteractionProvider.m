@interface BMInteractionProvider
- (BMInteractionProvider)init;
- (BMInteractionProvider)initWithBMMiningTaskConfig:(id)a3;
- (BMInteractionProvider)initWithInteractionStore:(id)a3;
- (BMInteractionProvider)initWithInteractionStore:(id)a3 bmMiningTaskConfig:(id)a4;
- (BMMiningTaskConfig)bmMiningTaskConfig;
- (_CDInteractionStore)interactionStore;
- (id)batchFetchedPhotoSuggestionsForInteractions:(id)a3;
- (id)contextKitClient;
- (id)getResultsForRequest:(id)a3;
- (id)interactionEventsForTypes:(id)a3 error:(id *)a4;
- (void)setBmMiningTaskConfig:(id)a3;
- (void)setContextKitClient:(id)a3;
@end

@implementation BMInteractionProvider

- (BMInteractionProvider)initWithInteractionStore:(id)a3
{
  return [(BMInteractionProvider *)self initWithInteractionStore:a3 bmMiningTaskConfig:0];
}

- (BMInteractionProvider)initWithInteractionStore:(id)a3 bmMiningTaskConfig:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)BMInteractionProvider;
  v9 = [(BMInteractionProvider *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_interactionStore, a3);
    id contextKitClient = v10->_contextKitClient;
    v10->_id contextKitClient = 0;

    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    v12 = (void *)getCKContextClientClass_softClass;
    uint64_t v22 = getCKContextClientClass_softClass;
    if (!getCKContextClientClass_softClass)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __getCKContextClientClass_block_invoke;
      v18[3] = &unk_264546958;
      v18[4] = &v19;
      __getCKContextClientClass_block_invoke((uint64_t)v18);
      v12 = (void *)v20[3];
    }
    id v13 = v12;
    _Block_object_dispose(&v19, 8);
    uint64_t v14 = [v13 clientWithDefaultRequestType:9];
    id v15 = v10->_contextKitClient;
    v10->_id contextKitClient = (id)v14;

    objc_storeStrong((id *)&v10->_bmMiningTaskConfig, a4);
  }

  return v10;
}

- (BMInteractionProvider)init
{
  v3 = [MEMORY[0x263F34FB0] defaultDatabaseDirectory];
  v4 = [MEMORY[0x263F34FB0] storeWithDirectory:v3 readOnly:1];
  v5 = [(BMInteractionProvider *)self initWithInteractionStore:v4];

  return v5;
}

- (BMInteractionProvider)initWithBMMiningTaskConfig:(id)a3
{
  v4 = (void *)MEMORY[0x263F34FB0];
  id v5 = a3;
  v6 = [v4 defaultDatabaseDirectory];
  id v7 = [MEMORY[0x263F34FB0] storeWithDirectory:v6 readOnly:1];
  id v8 = [(BMInteractionProvider *)self initWithInteractionStore:v7 bmMiningTaskConfig:v5];

  return v8;
}

- (id)batchFetchedPhotoSuggestionsForInteractions:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        v10 = [v9 attachments];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v25 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v24 + 1) + 8 * j);
              v16 = [v15 identifier];

              if (v16)
              {
                objc_super v17 = [v15 identifier];
                v18 = [v17 UUIDString];
                [v4 addObject:v18];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v6);
  }

  uint64_t v19 = [MEMORY[0x263F14D18] fetchAssetsWithLocalIdentifiers:v4 options:0];
  v20 = objc_opt_new();
  [v20 setSharingStream:3];
  uint64_t v21 = [MEMORY[0x263F14E88] batchFetchSuggestedRecipientsForAssets:v19 options:v20];

  return v21;
}

- (id)getResultsForRequest:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  objc_super v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__BMInteractionProvider_getResultsForRequest___block_invoke;
  v10[3] = &unk_2645469C8;
  uint64_t v12 = &v13;
  uint64_t v5 = v4;
  uint64_t v11 = v5;
  [v3 executeWithReply:v10];
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    uint64_t v7 = BMLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = &unk_26D1C7E50;
      _os_log_impl(&dword_21FF33000, v7, OS_LOG_TYPE_INFO, "Timeout after %@ msec waiting for an answer from ContextKit", buf, 0xCu);
    }

    id v8 = 0;
  }
  else
  {
    id v8 = (id)v14[5];
  }

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __46__BMInteractionProvider_getResultsForRequest___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)interactionEventsForTypes:(id)a3 error:(id *)a4
{
  v376[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_time_t v6 = (void *)MEMORY[0x223C621B0]();
  unint64_t v7 = 0x264546000uLL;
  id v8 = +[BMItemType interactionItemTypes];
  char v9 = [v5 intersectsSet:v8];

  if ((v9 & 1) == 0)
  {
    id v261 = (id)MEMORY[0x263EFFA68];
    goto LABEL_207;
  }
  v284 = v6;
  v10 = [MEMORY[0x263F5D3A0] defaultConfiguration];
  v273 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.PeopleSuggester"];
  [v273 BOOLForKey:@"_PSAllowNonSupportedBundleIDs"];
  uint64_t v11 = _PSShareSheetSuggestionBundleIDs();
  uint64_t v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.mobilemail", @"com.apple.UIKit.activity.Mail", 0);
  v282 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.MobileSMS", @"com.apple.UIKit.activity.Message", 0);
  v272 = v11;
  uint64_t v13 = (void *)[v11 mutableCopy];
  v287 = (void *)v12;
  [v13 minusSet:v12];
  v281 = _PSShareSheetExtensionBundleIDToAppBundleIDMapping();
  v271 = v13;
  uint64_t v14 = BMInteractionPredicate(4, v13, v10);
  uint64_t v15 = (void *)MEMORY[0x263EFFA08];
  v361 = @"com.apple.UIKit.activity.Mail";
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v361 count:1];
  objc_super v17 = [v15 setWithArray:v16];
  uint64_t v18 = BMInteractionPredicate(1, v17, v10);

  uint64_t v19 = (void *)MEMORY[0x263F08730];
  v269 = (void *)v18;
  v270 = (void *)v14;
  v360[0] = v14;
  v360[1] = v18;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v360 count:2];
  uint64_t v21 = [v19 orPredicateWithSubpredicates:v20];

  uint64_t v22 = (void *)MEMORY[0x263F08A98];
  v23 = (void *)MEMORY[0x263EFFA08];
  v274 = v10;
  long long v24 = [v10 suggestionModel];
  long long v25 = [v24 messageDirections];
  long long v26 = [v23 setWithArray:v25];
  uint64_t v27 = [v22 predicateWithFormat:@"(direction IN %@)", v26];

  long long v28 = (void *)MEMORY[0x263F08730];
  v266 = (void *)v27;
  v359[0] = v27;
  v268 = (void *)v21;
  v359[1] = v21;
  long long v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v359 count:2];
  uint64_t v30 = [v28 andPredicateWithSubpredicates:v29];

  long long v31 = [(BMInteractionProvider *)self interactionStore];
  id v342 = 0;
  v265 = (void *)v30;
  v32 = [v31 queryInteractionsUsingPredicate:v30 sortDescriptors:0 limit:0 error:&v342];
  id v33 = v342;

  id v267 = v33;
  v264 = v32;
  if (!v32)
  {
    v262 = 0;
    uint64_t v34 = v284;
    goto LABEL_204;
  }
  v280 = [(BMInteractionProvider *)self batchFetchedPhotoSuggestionsForInteractions:v32];
  v309 = [MEMORY[0x263EFF980] array];
  long long v338 = 0u;
  long long v339 = 0u;
  long long v340 = 0u;
  long long v341 = 0u;
  obuint64_t j = v32;
  uint64_t v286 = [obj countByEnumeratingWithState:&v338 objects:v358 count:16];
  if (!v286)
  {
    v306 = 0;
    uint64_t v34 = v284;
    goto LABEL_203;
  }
  v306 = 0;
  uint64_t v285 = *(void *)v339;
  uint64_t v276 = *MEMORY[0x263F15028];
  v293 = self;
  id v294 = v5;
  uint64_t v34 = v284;
  do
  {
    for (uint64_t i = 0; i != v286; ++i)
    {
      if (*(void *)v339 != v285) {
        objc_enumerationMutation(obj);
      }
      v36 = *(void **)(*((void *)&v338 + 1) + 8 * i);
      v37 = (void *)MEMORY[0x223C621B0]();
      if ([v36 mechanism] == 13) {
        [v36 targetBundleId];
      }
      else {
      id v38 = [v36 bundleId];
      }

      v292 = v38;
      if ([v287 containsObject:v38])
      {
        v39 = [v36 recipients];
        unint64_t v40 = [v39 count];

        if (v40 > 1) {
          goto LABEL_197;
        }
      }
      v288 = v37;
      uint64_t v289 = i;
      v310 = [v36 startDate];
      v41 = [v36 endDate];
      v42 = v41;
      if (v41)
      {
        id v43 = v41;
      }
      else
      {
        id v43 = [v36 startDate];
      }
      v44 = [*(id *)(v7 + 1496) interactionMechanism];
      int v45 = [v5 containsObject:v44];

      if (v45)
      {
        v46 = [*(id *)(v7 + 1496) interactionMechanism];
        v47 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v36, "mechanism"));
        v48 = +[BMItem itemWithType:v46 numberValue:v47];

        v49 = [[BMEvent alloc] initWithStartDate:v310 endDate:v43 item:v48];
        [v309 addObject:v49];
      }
      v50 = [*(id *)(v7 + 1496) interactionDirection];
      int v51 = [v5 containsObject:v50];

      if (v51)
      {
        v52 = [*(id *)(v7 + 1496) interactionDirection];
        v53 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v36, "direction"));
        v54 = +[BMItem itemWithType:v52 numberValue:v53];

        v55 = [BMEvent alloc];
        v56 = [v36 endDate];
        v57 = [(BMEvent *)v55 initWithStartDate:v310 endDate:v56 item:v54];

        [v309 addObject:v57];
      }
      v58 = [*(id *)(v7 + 1496) interactionSharingSourceBundleID];
      int v59 = [v5 containsObject:v58];

      if (v59)
      {
        if ([v36 mechanism] == 13)
        {
          v60 = [v36 bundleId];

          if (v60)
          {
            v61 = [*(id *)(v7 + 1496) interactionSharingSourceBundleID];
            v62 = [v36 bundleId];
            v63 = +[BMItem itemWithType:v61 stringValue:v62];

            v64 = [BMEvent alloc];
            v65 = [v36 endDate];
            v66 = [(BMEvent *)v64 initWithStartDate:v310 endDate:v65 item:v63];

            [v309 addObject:v66];
          }
        }
      }
      v67 = [*(id *)(v7 + 1496) interactionTargetBundleID];
      int v68 = [v5 containsObject:v67];

      if (v68)
      {
        uint64_t v69 = [v281 objectForKeyedSubscript:v292];
        v70 = (void *)v69;
        if (v69) {
          v71 = (void *)v69;
        }
        else {
          v71 = v292;
        }
        id v72 = v71;

        if (v72)
        {
          v73 = [*(id *)(v7 + 1496) interactionTargetBundleID];
          v74 = +[BMItem itemWithType:v73 stringValue:v72];

          v75 = [[BMEvent alloc] initWithStartDate:v310 endDate:v43 item:v74];
          [v309 addObject:v75];
        }
      }
      v290 = v36;
      v76 = [v36 sender];
      uint64_t v77 = [v76 identifier];
      if (v77)
      {
        v78 = (void *)v77;
        v79 = [*(id *)(v7 + 1496) interactionSender];
        int v80 = [v5 containsObject:v79];

        if (!v80) {
          goto LABEL_35;
        }
        v81 = [*(id *)(v7 + 1496) interactionSender];
        v82 = [v290 sender];
        v83 = [v82 identifier];
        v76 = +[BMItem itemWithType:v81 stringValue:v83];

        v84 = [[BMEvent alloc] initWithStartDate:v310 endDate:v43 item:v76];
        [v309 addObject:v84];
      }
LABEL_35:
      v85 = [*(id *)(v7 + 1496) interactionRecipients];
      int v86 = [v5 containsObject:v85];

      v87 = v290;
      if (v86)
      {
        if ([v287 containsObject:v292])
        {
          v88 = [v290 recipients];
          uint64_t v89 = [v88 count];

          if (v89 == 1)
          {
            v90 = [*(id *)(v7 + 1496) interactionRecipients];
            v91 = (void *)MEMORY[0x263F34F98];
            v92 = [v290 recipients];
            v93 = [v91 generateConversationIdFromInteractionRecipients:v92];
            v94 = +[BMItem itemWithType:v90 stringValue:v93];

            v87 = v290;
            goto LABEL_49;
          }
        }
        if ([v282 containsObject:v292]
          && ([v290 domainIdentifier],
              v95 = objc_claimAutoreleasedReturnValue(),
              v95,
              v95))
        {
          v96 = [v290 domainIdentifier];
          if ([v96 containsString:@"SMS"])
          {

LABEL_47:
            v90 = [*(id *)(v7 + 1496) interactionRecipients];
            uint64_t v100 = [v290 domainIdentifier];
            goto LABEL_48;
          }
          v101 = [v290 domainIdentifier];
          int v102 = [v101 containsString:@"iMessage"];

          if (v102) {
            goto LABEL_47;
          }
        }
        else
        {
          uint64_t v97 = [v290 derivedIntentIdentifier];
          if (v97)
          {
            v98 = (void *)v97;
            char v99 = [v282 containsObject:v292];

            if ((v99 & 1) == 0)
            {
              v90 = [*(id *)(v7 + 1496) interactionRecipients];
              uint64_t v100 = [v290 derivedIntentIdentifier];
LABEL_48:
              v92 = (void *)v100;
              v94 = +[BMItem itemWithType:v90 stringValue:v100];
LABEL_49:

              if (v94)
              {
                v103 = [[BMEvent alloc] initWithStartDate:v310 endDate:v43 item:v94];
                [v309 addObject:v103];
              }
            }
          }
        }
      }
      long long v336 = 0u;
      long long v337 = 0u;
      long long v334 = 0u;
      long long v335 = 0u;
      v104 = [v87 attachments];
      context = (void *)[v104 countByEnumeratingWithState:&v334 objects:v357 count:16];
      if (!context) {
        goto LABEL_99;
      }
      uint64_t v301 = *(void *)v335;
      id v295 = v104;
      do
      {
        uint64_t v105 = 0;
        do
        {
          if (*(void *)v335 != v301) {
            objc_enumerationMutation(v104);
          }
          uint64_t v307 = v105;
          v106 = *(void **)(*((void *)&v334 + 1) + 8 * v105);
          uint64_t v107 = [v106 contentURL];
          if (v107)
          {
            v108 = (void *)v107;
            v109 = [v106 contentURL];
            uint64_t v110 = [v109 host];
            if (v110)
            {
              v111 = (void *)v110;
              v112 = +[BMItemType interactionContentURL];
              int v113 = [v5 containsObject:v112];

              if (v113)
              {
                unint64_t v7 = 0x264546000uLL;
                v114 = +[BMItemType interactionContentURL];
                v115 = [v106 contentURL];
                v116 = [v115 host];
                v117 = +[BMItem itemWithType:v114 stringValue:v116];

                goto LABEL_68;
              }
            }
            else
            {
            }
          }
          uint64_t v118 = [v106 uti];
          unint64_t v7 = 0x264546000uLL;
          if (v118)
          {
            v119 = (void *)v118;
            v120 = +[BMItemType interactionUTIType];
            int v121 = [v5 containsObject:v120];

            if (v121)
            {
              v114 = +[BMItemType interactionUTIType];
              uint64_t v122 = [v106 uti];
              goto LABEL_67;
            }
          }
          uint64_t v123 = [v106 personInPhoto];
          if (v123)
          {
            v124 = (void *)v123;
            v125 = +[BMItemType interactionPhotoContact];
            int v126 = [v5 containsObject:v125];

            if (v126)
            {
              v114 = +[BMItemType interactionPhotoContact];
              uint64_t v122 = [v106 personInPhoto];
LABEL_67:
              v115 = (void *)v122;
              v117 = +[BMItem itemWithType:v114 stringValue:v122];
LABEL_68:

              v127 = [[BMEvent alloc] initWithStartDate:v310 endDate:v43 item:v117];
              [v309 addObject:v127];
            }
          }
          uint64_t v128 = [(BMInteractionProvider *)self contextKitClient];
          if (v128)
          {
            v129 = (void *)v128;
            uint64_t v130 = [(BMInteractionProvider *)self bmMiningTaskConfig];
            if (v130)
            {
              v131 = (void *)v130;
              v132 = [(BMInteractionProvider *)self bmMiningTaskConfig];
              int v133 = [v132 interactionExtractedTopicFromAttachmentFactorInUse];

              if (v133)
              {
                v134 = BMLog();
                if (os_log_type_enabled(v134, OS_LOG_TYPE_DEBUG)) {
                  -[BMInteractionProvider interactionEventsForTypes:error:].cold.4(&v332, v333);
                }

                uint64_t v135 = [v106 contentText];
                if (v135)
                {
                  v136 = (void *)v135;
                  v137 = +[BMItemType interactionExtractedTopicFromAttachment];
                  int v138 = [v5 containsObject:v137];

                  if (v138)
                  {
                    v139 = [(BMInteractionProvider *)self contextKitClient];
                    v140 = [v139 newRequest];

                    v141 = [v106 contentURL];
                    v142 = [v141 absoluteString];
                    [v140 setUrl:v142];

                    [v140 setIncludeHigherLevelTopics:1];
                    v299 = v140;
                    v143 = [(BMInteractionProvider *)self getResultsForRequest:v140];
                    v144 = [v143 error];

                    if (v144)
                    {
                      v145 = BMLog();
                      if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR)) {
                        [(BMInteractionProvider *)v355 interactionEventsForTypes:&v356 error:v145];
                      }
                    }
                    long long v330 = 0u;
                    long long v331 = 0u;
                    long long v328 = 0u;
                    long long v329 = 0u;
                    v297 = v143;
                    v146 = [v143 level1Topics];
                    uint64_t v147 = [v146 countByEnumeratingWithState:&v328 objects:v354 count:16];
                    if (v147)
                    {
                      uint64_t v148 = v147;
                      uint64_t v149 = *(void *)v329;
                      do
                      {
                        for (uint64_t j = 0; j != v148; ++j)
                        {
                          if (*(void *)v329 != v149) {
                            objc_enumerationMutation(v146);
                          }
                          v151 = *(void **)(*((void *)&v328 + 1) + 8 * j);
                          v152 = [*(id *)(v7 + 1496) interactionExtractedTopicFromAttachment];
                          v153 = [v151 topicId];
                          v154 = +[BMItem itemWithType:v152 stringValue:v153];

                          v155 = [[BMEvent alloc] initWithStartDate:v310 endDate:v43 item:v154];
                          v156 = BMLog();
                          if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
                          {
                            v157 = [v151 title];
                            v158 = [v151 topicId];
                            *(_DWORD *)buf = 138412546;
                            v373 = v157;
                            __int16 v374 = 2112;
                            id v375 = v158;
                            _os_log_impl(&dword_21FF33000, v156, OS_LOG_TYPE_INFO, "Topic extracted from content URL via contextKit: %@, %@", buf, 0x16u);

                            unint64_t v7 = 0x264546000;
                          }

                          [v309 addObject:v155];
                        }
                        uint64_t v148 = [v146 countByEnumeratingWithState:&v328 objects:v354 count:16];
                      }
                      while (v148);
                    }

                    self = v293;
                    id v5 = v294;
                    v104 = v295;
                    v159 = v299;
LABEL_96:

                    goto LABEL_97;
                  }
                }
                goto LABEL_97;
              }
            }
            else
            {
            }
          }
          v160 = BMLog();
          if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG)) {
            -[BMInteractionProvider interactionEventsForTypes:error:](&v326, v327);
          }

          v161 = [(BMInteractionProvider *)self bmMiningTaskConfig];

          if (!v161)
          {
            v159 = BMLog();
            if (os_log_type_enabled(v159, OS_LOG_TYPE_DEBUG)) {
              -[BMInteractionProvider interactionEventsForTypes:error:](&v324, v325);
            }
            goto LABEL_96;
          }
LABEL_97:
          uint64_t v105 = v307 + 1;
        }
        while ((void *)(v307 + 1) != context);
        context = (void *)[v104 countByEnumeratingWithState:&v334 objects:v357 count:16];
      }
      while (context);
LABEL_99:

      v162 = [*(id *)(v7 + 1496) interactionPhotoScene];
      int v163 = [v5 containsObject:v162];

      if (v163)
      {
        v164 = (void *)MEMORY[0x263EFF980];
        v165 = [v290 attachments];
        v308 = objc_msgSend(v164, "arrayWithCapacity:", objc_msgSend(v165, "count"));

        long long v322 = 0u;
        long long v323 = 0u;
        long long v320 = 0u;
        long long v321 = 0u;
        v166 = [v290 attachments];
        uint64_t v167 = [v166 countByEnumeratingWithState:&v320 objects:v353 count:16];
        if (v167)
        {
          uint64_t v168 = v167;
          uint64_t v169 = *(void *)v321;
          do
          {
            for (uint64_t k = 0; k != v168; ++k)
            {
              if (*(void *)v321 != v169) {
                objc_enumerationMutation(v166);
              }
              v171 = *(void **)(*((void *)&v320 + 1) + 8 * k);
              v172 = [v171 identifier];

              if (v172)
              {
                v173 = [v171 identifier];
                v174 = [v173 UUIDString];
                [v308 addObject:v174];
              }
            }
            uint64_t v168 = [v166 countByEnumeratingWithState:&v320 objects:v353 count:16];
          }
          while (v168);
        }

        v175 = v308;
        if ([v308 count])
        {
          id v176 = v308;
          id v177 = v280;
          v178 = (void *)MEMORY[0x223C621B0]();
          if (v176 && [v176 count])
          {
            contexta = v178;
            v179 = [MEMORY[0x263EFF980] array];
            long long v362 = 0u;
            long long v363 = 0u;
            long long v364 = 0u;
            long long v365 = 0u;
            id v180 = v176;
            uint64_t v181 = [v180 countByEnumeratingWithState:&v362 objects:buf count:16];
            if (v181)
            {
              uint64_t v182 = v181;
              uint64_t v183 = *(void *)v363;
              do
              {
                for (uint64_t m = 0; m != v182; ++m)
                {
                  if (*(void *)v363 != v183) {
                    objc_enumerationMutation(v180);
                  }
                  v185 = [MEMORY[0x263F14D18] localIdentifierWithUUID:*(void *)(*((void *)&v362 + 1) + 8 * m)];
                  v186 = [v177 objectForKeyedSubscript:v185];

                  [v179 addObjectsFromArray:v186];
                }
                uint64_t v182 = [v180 countByEnumeratingWithState:&v362 objects:buf count:16];
              }
              while (v182);
            }

            v187 = [MEMORY[0x263EFF980] array];
            long long v347 = 0u;
            long long v348 = 0u;
            long long v349 = 0u;
            long long v350 = 0u;
            id v188 = v179;
            uint64_t v189 = [v188 countByEnumeratingWithState:&v347 objects:v368 count:16];
            if (v189)
            {
              uint64_t v190 = v189;
              uint64_t v191 = *(void *)v348;
LABEL_121:
              uint64_t v192 = 0;
              while (1)
              {
                if (*(void *)v348 != v191) {
                  objc_enumerationMutation(v188);
                }
                v193 = [*(id *)(*((void *)&v347 + 1) + 8 * v192) objectForKeyedSubscript:@"localIdentifier"];
                v194 = v193;
                if (v193 && [v193 length]) {
                  [v187 addObject:v194];
                }
                uint64_t v195 = [v187 count];

                if (v195 == 4) {
                  break;
                }
                if (v190 == ++v192)
                {
                  uint64_t v190 = [v188 countByEnumeratingWithState:&v347 objects:v368 count:16];
                  if (v190) {
                    goto LABEL_121;
                  }
                  break;
                }
              }
            }

            v196 = BMLog();
            id v5 = v294;
            if (os_log_type_enabled(v196, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v260 = [v187 count];
              *(_DWORD *)v369 = 138412546;
              *(void *)&v369[4] = v187;
              *(_WORD *)&v369[12] = 2048;
              *(void *)&v369[14] = v260;
              _os_log_debug_impl(&dword_21FF33000, v196, OS_LOG_TYPE_DEBUG, "People Array = %@,%lu", v369, 0x16u);
            }

            v197 = (void *)[v187 copy];
            self = v293;
            v178 = contexta;
          }
          else
          {
            v197 = (void *)MEMORY[0x263EFFA68];
          }

          long long v316 = 0u;
          long long v317 = 0u;
          long long v318 = 0u;
          long long v319 = 0u;
          id contextb = v197;
          uint64_t v198 = [contextb countByEnumeratingWithState:&v316 objects:v352 count:16];
          if (v198)
          {
            uint64_t v199 = v198;
            uint64_t v200 = *(void *)v317;
            do
            {
              for (uint64_t n = 0; n != v199; ++n)
              {
                if (*(void *)v317 != v200) {
                  objc_enumerationMutation(contextb);
                }
                uint64_t v202 = *(void *)(*((void *)&v316 + 1) + 8 * n);
                v203 = +[BMItemType interactionPhotoContact];
                v204 = +[BMItem itemWithType:v203 stringValue:v202];

                v205 = [[BMEvent alloc] initWithStartDate:v310 endDate:v43 item:v204];
                [v309 addObject:v205];
              }
              uint64_t v199 = [contextb countByEnumeratingWithState:&v316 objects:v352 count:16];
            }
            while (v199);
          }

          if (![contextb count])
          {
            v206 = v306;
            if (!v306)
            {
              v207 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              v208 = [v207 URLForResource:@"blacklistedPhotoScenes" withExtension:@"plist"];

              id v315 = 0;
              v206 = [MEMORY[0x263EFF8C0] arrayWithContentsOfURL:v208 error:&v315];
              id v209 = v315;
              if (v209)
              {
                v210 = BMLog();
                if (os_log_type_enabled(v210, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v373 = v208;
                  __int16 v374 = 2112;
                  id v375 = v209;
                  _os_log_error_impl(&dword_21FF33000, v210, OS_LOG_TYPE_ERROR, "Error loading photo scene blacklist from URL %@, %@", buf, 0x16u);
                }
              }
            }
            id v211 = v176;
            id v212 = v206;
            v213 = (void *)MEMORY[0x223C621B0]();
            v306 = v212;
            if (v176 && (uint64_t v214 = [v211 count], v212))
            {
              v215 = (void *)MEMORY[0x263EFFA68];
              if (v214)
              {
                v279 = v213;
                v216 = (void *)MEMORY[0x263F14E18];
                v217 = [MEMORY[0x263F14E98] sharedPhotoLibrary];
                v218 = [v216 fetchOptionsWithInclusiveDefaultsForPhotoLibrary:v217];

                v376[0] = v276;
                v219 = [MEMORY[0x263EFF8C0] arrayWithObjects:v376 count:1];
                [v218 setFetchPropertySets:v219];

                id v291 = v211;
                v278 = v218;
                v220 = [MEMORY[0x263F14D18] fetchAssetsWithLocalIdentifiers:v211 options:v218];
                v221 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
                long long v347 = 0u;
                long long v348 = 0u;
                long long v349 = 0u;
                long long v350 = 0u;
                v277 = v220;
                id v296 = [v220 fetchedObjects];
                v222 = v306;
                uint64_t v300 = [v296 countByEnumeratingWithState:&v347 objects:buf count:16];
                if (v300)
                {
                  uint64_t v298 = *(void *)v348;
                  do
                  {
                    uint64_t v223 = 0;
                    do
                    {
                      if (*(void *)v348 != v298) {
                        objc_enumerationMutation(v296);
                      }
                      uint64_t v302 = v223;
                      v224 = *(void **)(*((void *)&v347 + 1) + 8 * v223);
                      memset(v369, 0, sizeof(v369));
                      long long v370 = 0u;
                      long long v371 = 0u;
                      v225 = [v224 sceneClassifications];
                      uint64_t v226 = [v225 countByEnumeratingWithState:v369 objects:v368 count:16];
                      if (v226)
                      {
                        uint64_t v227 = v226;
                        uint64_t v228 = **(void **)&v369[16];
                        do
                        {
                          for (iuint64_t i = 0; ii != v227; ++ii)
                          {
                            if (**(void **)&v369[16] != v228) {
                              objc_enumerationMutation(v225);
                            }
                            v230 = *(void **)(*(void *)&v369[8] + 8 * ii);
                            [v230 confidence];
                            double v232 = v231;
                            uint64_t v233 = [v230 sceneIdentifier];
                            v234 = [MEMORY[0x263F5DF68] sharedTaxonomy];
                            v235 = [v234 nodeForSceneClassId:v233];

                            uint64_t v236 = [v235 name];
                            v237 = (void *)v236;
                            if (v235) {
                              BOOL v238 = v236 == 0;
                            }
                            else {
                              BOOL v238 = 1;
                            }
                            if (!v238 && ([v222 containsObject:v236] & 1) == 0)
                            {
                              [v235 highPrecisionThreshold];
                              if (v232 >= v239)
                              {
                                [v235 highRecallThreshold];
                                if (v232 >= v240)
                                {
                                  v367[0] = v237;
                                  v366[0] = @"name";
                                  v366[1] = @"confidence";
                                  v241 = [NSNumber numberWithDouble:v232];
                                  v367[1] = v241;
                                  v242 = [NSDictionary dictionaryWithObjects:v367 forKeys:v366 count:2];

                                  uint64_t v243 = objc_msgSend(v221, "indexOfObject:inSortedRange:options:usingComparator:", v242, 0, objc_msgSend(v221, "count"), 1024, &__block_literal_global_12);
                                  if (v243 != 0x7FFFFFFFFFFFFFFFLL) {
                                    [v221 insertObject:v242 atIndex:v243];
                                  }
                                  if ((unint64_t)[v221 count] >= 5) {
                                    [v221 removeLastObject];
                                  }

                                  v222 = v306;
                                }
                              }
                            }
                          }
                          uint64_t v227 = [v225 countByEnumeratingWithState:v369 objects:v368 count:16];
                        }
                        while (v227);
                      }

                      uint64_t v223 = v302 + 1;
                    }
                    while (v302 + 1 != v300);
                    uint64_t v300 = [v296 countByEnumeratingWithState:&v347 objects:buf count:16];
                  }
                  while (v300);
                }

                v244 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v221, "count"));
                long long v343 = 0u;
                long long v344 = 0u;
                long long v345 = 0u;
                long long v346 = 0u;
                id v245 = v221;
                uint64_t v246 = [v245 countByEnumeratingWithState:&v343 objects:&v362 count:16];
                self = v293;
                id v5 = v294;
                if (v246)
                {
                  uint64_t v247 = v246;
                  uint64_t v248 = *(void *)v344;
                  do
                  {
                    for (juint64_t j = 0; jj != v247; ++jj)
                    {
                      if (*(void *)v344 != v248) {
                        objc_enumerationMutation(v245);
                      }
                      v250 = [*(id *)(*((void *)&v343 + 1) + 8 * jj) objectForKeyedSubscript:@"name"];
                      [v244 addObject:v250];
                    }
                    uint64_t v247 = [v245 countByEnumeratingWithState:&v343 objects:&v362 count:16];
                  }
                  while (v247);
                }

                v215 = (void *)[v244 copy];
                id v211 = v291;
                v213 = v279;
              }
            }
            else
            {
              v215 = (void *)MEMORY[0x263EFFA68];
            }

            long long v311 = 0u;
            long long v312 = 0u;
            long long v313 = 0u;
            long long v314 = 0u;
            id v251 = v215;
            uint64_t v252 = [v251 countByEnumeratingWithState:&v311 objects:v351 count:16];
            if (v252)
            {
              uint64_t v253 = v252;
              uint64_t v254 = *(void *)v312;
              do
              {
                for (kuint64_t k = 0; kk != v253; ++kk)
                {
                  if (*(void *)v312 != v254) {
                    objc_enumerationMutation(v251);
                  }
                  uint64_t v256 = *(void *)(*((void *)&v311 + 1) + 8 * kk);
                  v257 = +[BMItemType interactionPhotoScene];
                  v258 = +[BMItem itemWithType:v257 stringValue:v256];

                  v259 = [[BMEvent alloc] initWithStartDate:v310 endDate:v43 item:v258];
                  [v309 addObject:v259];
                }
                uint64_t v253 = [v251 countByEnumeratingWithState:&v311 objects:v351 count:16];
              }
              while (v253);
            }
          }
          unint64_t v7 = 0x264546000;

          v175 = v308;
        }
      }
      uint64_t v34 = v284;
      v37 = v288;
      uint64_t i = v289;
LABEL_197:
    }
    uint64_t v286 = [obj countByEnumeratingWithState:&v338 objects:v358 count:16];
  }
  while (v286);
LABEL_203:

  v262 = (void *)[v309 copy];
LABEL_204:

  if (a4) {
    *a4 = v267;
  }
  id v261 = v262;

LABEL_207:

  return v261;
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (id)contextKitClient
{
  return self->_contextKitClient;
}

- (void)setContextKitClient:(id)a3
{
}

- (BMMiningTaskConfig)bmMiningTaskConfig
{
  return (BMMiningTaskConfig *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBmMiningTaskConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bmMiningTaskConfig, 0);
  objc_storeStrong(&self->_contextKitClient, 0);

  objc_storeStrong((id *)&self->_interactionStore, 0);
}

- (void)interactionEventsForTypes:(unsigned char *)a1 error:(unsigned char *)a2 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_1(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_21FF33000, v2, v3, "ContextKit usage is blocked due to missing config file ", v4);
}

- (void)interactionEventsForTypes:(unsigned char *)a1 error:(unsigned char *)a2 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_1(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_21FF33000, v2, v3, "ContextKit is NOT being used to extract topic factor from interactions", v4);
}

- (void)interactionEventsForTypes:(void *)a3 error:(NSObject *)a4 .cold.3(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  unint64_t v7 = [a2 error];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_21FF33000, a4, OS_LOG_TYPE_ERROR, "ContextKit topic extraction failed with error %@", a1, 0xCu);
}

- (void)interactionEventsForTypes:(unsigned char *)a1 error:(unsigned char *)a2 .cold.4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_1(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_21FF33000, v2, v3, "ContextKit is being used to extract topic factor from interactions", v4);
}

@end