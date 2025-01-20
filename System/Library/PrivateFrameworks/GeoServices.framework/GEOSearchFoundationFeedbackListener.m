@interface GEOSearchFoundationFeedbackListener
+ (id)_identifiersFromCardSections:(id)a3;
+ (id)_mapsResultIdentifiersFromSections:(id)a3;
+ (id)feedbackListenerForParsec;
- (GEOSearchFoundationFeedbackListener)init;
- (GEOSearchFoundationFeedbackListener)initWithClientType:(unint64_t)a3;
- (id)traits;
- (void)cardViewDidAppear:(id)a3;
- (void)didEngageCardSection:(id)a3;
- (void)didEngageResult:(id)a3;
- (void)didEngageSection:(id)a3;
- (void)didPerformCommand:(id)a3;
- (void)didRankSections:(id)a3;
- (void)resultsDidBecomeVisible:(id)a3;
@end

@implementation GEOSearchFoundationFeedbackListener

- (GEOSearchFoundationFeedbackListener)initWithClientType:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GEOSearchFoundationFeedbackListener;
  v4 = [(GEOSearchFoundationFeedbackListener *)&v8 init];
  if (v4)
  {
    int v5 = 0;
    int v6 = 702;
    switch(a3)
    {
      case 0uLL:
        goto LABEL_6;
      case 1uLL:
        goto LABEL_5;
      case 2uLL:
        int v6 = 701;
        goto LABEL_5;
      case 3uLL:
        int v6 = 803;
LABEL_5:
        +[GEOUserSession setInitialShareSessionWithMaps:1];
        int v5 = v6;
LABEL_6:
        v4->_uiTarget = v5;
        break;
      default:
        break;
    }
    SearchFoundationLibrary();
  }
  return v4;
}

- (GEOSearchFoundationFeedbackListener)init
{
}

+ (id)feedbackListenerForParsec
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__GEOSearchFoundationFeedbackListener_feedbackListenerForParsec__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB2A08B8 != -1) {
    dispatch_once(&qword_1EB2A08B8, block);
  }
  v2 = (void *)_MergedGlobals_347;

  return v2;
}

void __64__GEOSearchFoundationFeedbackListener_feedbackListenerForParsec__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v2 bundleIdentifier];

  if ([v6 isEqualToString:@"com.apple.Spotlight"])
  {
    uint64_t v3 = 1;
  }
  else if ([v6 isEqualToString:@"com.apple.mobilesafari"])
  {
    uint64_t v3 = 2;
  }
  else if ([v6 isEqualToString:@"com.apple.siri"])
  {
    uint64_t v3 = 3;
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithClientType:v3];
  int v5 = (void *)_MergedGlobals_347;
  _MergedGlobals_347 = v4;
}

- (id)traits
{
  v2 = +[GEOMapService sharedService];
  uint64_t v3 = [v2 defaultTraits];

  return v3;
}

- (void)didRankSections:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_class();
  id v8 = [v4 sections];

  id v6 = [v5 _mapsResultIdentifiersFromSections:v8];
  mapsResultsIdentifiers = self->_mapsResultsIdentifiers;
  self->_mapsResultsIdentifiers = v6;
}

- (void)resultsDidBecomeVisible:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 results];
  uint64_t v5 = [v4 count];

  if (!v5) {
    goto LABEL_33;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v6 = [v3 results];
  uint64_t v56 = [v6 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (!v56)
  {

    id v8 = 0;
    v7 = 0;
    goto LABEL_32;
  }
  v7 = 0;
  id v8 = 0;
  uint64_t v55 = *(void *)v60;
  v9 = off_1E53D5000;
  id v49 = v3;
  id obj = v6;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v60 != v55) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v59 + 1) + 8 * v10);
      v12 = objc_msgSend(v11, "mapsData", v49);

      if (v12)
      {
        if (self->_uiTarget == 701)
        {
          v13 = [v11 mapsData];
          uint64_t v14 = +[GEOMapItemStorage mapItemStorageForSerializedPlaceData:v13];

          if (v14) {
            goto LABEL_17;
          }
          id v15 = objc_alloc(v9[126]);
          v16 = [v11 mapsData];
          v17 = (void *)[v15 initWithData:v16];

          if (!v17) {
            goto LABEL_22;
          }
        }
        else
        {
          id v18 = objc_alloc(v9[126]);
          v19 = [v11 mapsData];
          v17 = (void *)[v18 initWithData:v19];

          if (!v17)
          {
            v31 = [v11 mapsData];
            uint64_t v14 = +[GEOMapItemStorage mapItemStorageForSerializedPlaceData:v31];

            if (!v14) {
              goto LABEL_22;
            }
LABEL_17:
            v58 = v7;
            v32 = v9[126];
            double v33 = (double)(unint64_t)[v3 timestamp];
            v34 = [v3 results];
            v53 = (void *)v14;
            v35 = -[__objc2_class actionDetailsWithMapItem:timestamp:resultIndex:targetID:](v32, "actionDetailsWithMapItem:timestamp:resultIndex:targetID:", v14, [v34 indexOfObject:v11], 0, v33);

            v57 = v11;
            v36 = [v11 card];
            v37 = [v36 cardSections];
            v38 = [v37 firstObject];
            v39 = [v38 punchoutOptions];
            v40 = [v39 firstObject];
            [v40 preferredOpenableURL];
            v42 = v41 = v8;
            v43 = [v42 absoluteString];
            v54 = v35;
            [v35 setActionUrl:v43];

            id v8 = v41;
            int v30 = 1;
            if (!v41) {
              goto LABEL_18;
            }
            goto LABEL_19;
          }
        }
        v58 = v7;
        v51 = v8;
        v20 = -[__objc2_class actionDetailsWithDetails:timestamp:](v9[126], "actionDetailsWithDetails:timestamp:", v17, (double)(unint64_t)[v3 timestamp]);

        v21 = [v3 results];
        objc_msgSend(v20, "setResultIndex:", objc_msgSend(v21, "indexOfObject:", v11));

        v57 = v11;
        v22 = [v11 card];
        v23 = [v22 cardSections];
        v24 = [v23 firstObject];
        v25 = [v24 punchoutOptions];
        v26 = [v25 firstObject];
        v27 = [v26 preferredOpenableURL];
        [v27 absoluteString];
        v29 = id v28 = v3;
        [v20 setActionUrl:v29];

        v54 = v20;
        if (v20)
        {
          int v30 = 0;
          v53 = 0;
          id v8 = v51;
          if (!v51) {
LABEL_18:
          }
            id v8 = objc_alloc_init(GEOMapsServerMetadata);
LABEL_19:
          v44 = objc_alloc_init(GEOMapsSearchResult);
          v9 = off_1E53D5000;
          if (v30)
          {
            -[GEOMapsSearchResult setMuid:](v44, "setMuid:", [v53 _muid]);
            v45 = [v53 geoAddress];
            [(GEOMapsSearchResult *)v44 setAddress:v45];

            v46 = [v53 _identifier];
            v47 = [v46 mapsIdentifier];
            [(GEOMapsSearchResult *)v44 setMapsId:v47];
          }
          [(GEOMapsSearchResult *)v44 setPlaceActionDetails:v54];
          [(GEOMapsServerMetadata *)v8 addMapsSearchResult:v44];

          id v3 = v49;
          v11 = v57;
          v7 = v58;
LABEL_22:
          if (v7) {
            goto LABEL_24;
          }
LABEL_23:
          v7 = [v11 userInput];
          goto LABEL_24;
        }
        id v8 = v51;
        v11 = v57;
        v7 = v58;
        v9 = off_1E53D5000;
        id v3 = v28;
        if (!v58) {
          goto LABEL_23;
        }
      }
LABEL_24:
      ++v10;
    }
    while (v56 != v10);
    uint64_t v48 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
    uint64_t v56 = v48;
  }
  while (v48);

  if (v8) {
    [getGEOAPPortalClass() captureUserAction:2015 target:self->_uiTarget value:v7 mapsServerMetadata:v8];
  }
LABEL_32:

LABEL_33:
}

- (void)didEngageSection:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 section];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [v5 results];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) mapsData];

        if (v11)
        {
          LODWORD(v12) = 0;
          objc_msgSend(getGEOAPPortalClass(), "capturePlaceCardUserAction:target:value:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:commingledRichProviderIds:", 16001, self->_uiTarget, 0, 0, 0, 0, (double)(unint64_t)objc_msgSend(v4, "timestamp"), 0, 0, 0, 0, v12, 0, 0, 0, 0);
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)didEngageResult:(id)a3
{
  id v34 = a3;
  id v4 = [v34 result];
  uint64_t v5 = [v4 identifier];

  uint64_t uiTarget = self->_uiTarget;
  NSUInteger v7 = [(NSArray *)self->_mapsResultsIdentifiers indexOfObject:v5];
  uint64_t v8 = [v34 result];
  uint64_t v9 = [v8 card];
  uint64_t v10 = [v9 cardSections];
  v11 = [v10 firstObject];
  uint64_t v12 = [v11 punchoutOptions];
  long long v13 = [v12 firstObject];
  long long v14 = [v13 preferredOpenableURL];

  long long v15 = [v34 result];
  long long v16 = [v15 mapsData];

  if (v16)
  {
    if ([v34 actionEngaged])
    {
      if ([v34 actionTarget] == 1)
      {
        uint64_t v17 = 6003;
      }
      else if ([v34 actionTarget] == 2)
      {
        uint64_t v17 = 6009;
      }
      else if ([v34 actionTarget] == 3)
      {
        uint64_t v17 = 6045;
      }
      else
      {
        uint64_t v17 = 0;
      }
    }
    else
    {
      uint64_t v17 = 2007;
    }
    v23 = [GEOPlaceActionDetails alloc];
    v24 = [v34 result];
    v25 = [v24 mapsData];
    v26 = [(GEOPlaceActionDetails *)v23 initWithData:v25];

    if (v26)
    {
      v22 = +[GEOPlaceActionDetails actionDetailsWithDetails:timestamp:](GEOPlaceActionDetails, "actionDetailsWithDetails:timestamp:", v26, (double)(unint64_t)[v34 timestamp]);

      [v22 setResultIndex:v7];
      v27 = [v14 absoluteString];
      [v22 setActionUrl:v27];

      [getGEOAPPortalClass() captureUserAction:v17 target:uiTarget value:0 placeActionDetails:v22];
    }
    else
    {
      id v28 = [v34 result];
      v29 = [v28 mapsData];
      v22 = +[GEOMapItemStorage mapItemStorageForSerializedPlaceData:v29];

      id GEOAPPortalClass = getGEOAPPortalClass();
      double v31 = (double)(unint64_t)[v34 timestamp];
      v32 = [v14 absoluteString];
      LODWORD(v33) = 0;
      [GEOAPPortalClass capturePlaceCardUserAction:v17 target:uiTarget value:0 mapItem:v22 timestamp:v7 resultIndex:0 targetID:v31 providerID:0 animationID:0 actionURL:v32 photoID:0 placeCardType:v33 localizedMapItemCategory:0 availableActions:0 unactionableUIElements:0 commingledRichProviderIds:0];
    }
  }
  else
  {
    uint64_t v18 = [v14 host];
    int v19 = [v18 isEqualToString:@"maps.apple.com"];

    if (!v19) {
      goto LABEL_17;
    }
    id v20 = getGEOAPPortalClass();
    double v21 = (double)(unint64_t)[v34 timestamp];
    v22 = [v14 absoluteString];
    LODWORD(v33) = 0;
    [v20 capturePlaceCardUserAction:16001 target:uiTarget value:0 mapItem:0 timestamp:v7 resultIndex:0 targetID:v21 providerID:0 animationID:0 actionURL:v22 photoID:0 placeCardType:v33 localizedMapItemCategory:0 availableActions:0 unactionableUIElements:0 commingledRichProviderIds:0];
  }

LABEL_17:
}

- (void)didEngageCardSection:(id)a3
{
  id v25 = a3;
  id v4 = [v25 cardSection];
  uint64_t v5 = [v4 nextCard];

  id v6 = [v5 cardSections];
  NSUInteger v7 = [v6 firstObject];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [v7 mapsData];

    if (v8)
    {
      uint64_t v9 = [v7 punchoutOptions];
      uint64_t v10 = [v9 firstObject];
      v11 = [v10 preferredOpenableURL];

      uint64_t uiTarget = self->_uiTarget;
      long long v13 = [v5 cardId];
      if ([v25 actionTarget] == 1)
      {
        long long v14 = [v25 cardSection];
        uint64_t v15 = 6003;
        if (objc_opt_respondsToSelector())
        {
          long long v16 = [v14 action];
          int v17 = [v16 shouldSearchDirectionsAlongCurrentRoute];

          if (v17) {
            uint64_t v15 = 3001;
          }
          else {
            uint64_t v15 = 6003;
          }
        }
      }
      else if ([v25 actionTarget] == 2)
      {
        uint64_t v15 = 6009;
      }
      else if ([v25 actionTarget] == 3)
      {
        uint64_t v15 = 6045;
      }
      else
      {
        uint64_t v15 = 2007;
      }
      if ([v13 length]) {
        NSUInteger v18 = [(NSArray *)self->_resultCardIdentifiers indexOfObject:v13];
      }
      else {
        NSUInteger v18 = 0xFFFFFFFFLL;
      }
      int v19 = [v7 mapsData];
      id v20 = +[GEOMapItemStorage mapItemStorageForSerializedPlaceData:v19];

      id GEOAPPortalClass = getGEOAPPortalClass();
      double v22 = (double)(unint64_t)[v25 timestamp];
      v23 = [v11 absoluteString];
      LODWORD(v24) = 0;
      [GEOAPPortalClass capturePlaceCardUserAction:v15 target:uiTarget value:0 mapItem:v20 timestamp:v18 resultIndex:0 targetID:v22 providerID:0 animationID:0 actionURL:v23 photoID:0 placeCardType:v24 localizedMapItemCategory:0 availableActions:0 unactionableUIElements:0 commingledRichProviderIds:0];
    }
  }
}

- (void)didPerformCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 command];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  id v6 = (void *)qword_1EB2A08C0;
  uint64_t v29 = qword_1EB2A08C0;
  if (!qword_1EB2A08C0)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getSFRequestAppClipInstallCommandClass_block_invoke;
    uint64_t v24 = &unk_1E53DB3C8;
    id v25 = &v26;
    __getSFRequestAppClipInstallCommandClass_block_invoke((uint64_t)&v21);
    id v6 = (void *)v27[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v26, 8);
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v9 = [v4 command];
  uint64_t v10 = v9;
  if (isKindOfClass)
  {
    v11 = [v9 url];
    uint64_t v12 = [v11 absoluteString];

    uint64_t v13 = 116;
LABEL_13:
    [getGEOAPPortalClass() captureUserAction:v13 target:self->_uiTarget value:v12];

    goto LABEL_14;
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  long long v14 = (void *)qword_1EB2A08C8;
  uint64_t v29 = qword_1EB2A08C8;
  if (!qword_1EB2A08C8)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getSFCallCommandClass_block_invoke;
    uint64_t v24 = &unk_1E53DB3C8;
    id v25 = &v26;
    __getSFCallCommandClass_block_invoke((uint64_t)&v21);
    long long v14 = (void *)v27[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v26, 8);
  char v16 = objc_opt_isKindOfClass();

  if (v16)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 6009;
    goto LABEL_13;
  }
  int v17 = [v4 command];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  NSUInteger v18 = (void *)qword_1EB2A08D0;
  uint64_t v29 = qword_1EB2A08D0;
  if (!qword_1EB2A08D0)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getSFBeginMapsRoutingCommandClass_block_invoke;
    uint64_t v24 = &unk_1E53DB3C8;
    id v25 = &v26;
    __getSFBeginMapsRoutingCommandClass_block_invoke((uint64_t)&v21);
    NSUInteger v18 = (void *)v27[3];
  }
  id v19 = v18;
  _Block_object_dispose(&v26, 8);
  char v20 = objc_opt_isKindOfClass();

  if (v20)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 6003;
    goto LABEL_13;
  }
LABEL_14:
}

- (void)cardViewDidAppear:(id)a3
{
  id v14 = a3;
  id v4 = [v14 card];
  uint64_t v5 = [v4 cardSections];

  if ([v5 count])
  {
    id v6 = [v5 firstObject];
    id v7 = [v6 nextCard];

    uint64_t v8 = [v7 cardSections];
    uint64_t v9 = [v8 firstObject];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [v9 mapsData];

      if (v10)
      {
        v11 = [(id)objc_opt_class() _identifiersFromCardSections:v5];
        resultCardIdentifiers = self->_resultCardIdentifiers;
        self->_resultCardIdentifiers = v11;

        LODWORD(v13) = 0;
        objc_msgSend(getGEOAPPortalClass(), "capturePlaceCardUserAction:target:value:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:commingledRichProviderIds:", 2015, self->_uiTarget, 0, 0, 0xFFFFFFFFLL, 0, (double)(unint64_t)objc_msgSend(v14, "timestamp"), 0, 0, 0, 0, v13, 0, 0, 0, 0);
      }
    }
  }
}

+ (id)_identifiersFromCardSections:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "nextCard", (void)v15);
        uint64_t v11 = [v10 cardId];
        uint64_t v12 = (void *)v11;
        if (v11) {
          uint64_t v13 = (__CFString *)v11;
        }
        else {
          uint64_t v13 = &stru_1ED51F370;
        }
        [v4 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)_mapsResultIdentifiersFromSections:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v9 = [v8 results];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              long long v15 = [v14 result];
              long long v16 = [v15 mapsData];

              if (v16)
              {
                long long v17 = [v14 result];
                long long v18 = [v17 identifier];
                [v4 addObject:v18];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v11);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultCardIdentifiers, 0);

  objc_storeStrong((id *)&self->_mapsResultsIdentifiers, 0);
}

@end