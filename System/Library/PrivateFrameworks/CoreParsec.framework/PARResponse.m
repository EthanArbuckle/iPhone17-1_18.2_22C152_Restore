@interface PARResponse
+ (id)responseFromData:(id)a3 session:(id)a4 request:(id)a5;
+ (id)responseFromJSON:(id)a3 session:(id)a4;
+ (id)responseFromReply:(id)a3;
- (BOOL)suggestionsAreBlended;
- (GEOUserSessionEntity)geoUserSessionEntity;
- (NSArray)alternativeResults;
- (NSArray)corrections;
- (NSArray)rawResponse;
- (NSArray)results;
- (NSArray)sections;
- (NSArray)suggestions;
- (NSData)legacyJSON;
- (NSDictionary)rawSqf;
- (NSDictionary)serverFeatures;
- (NSString)prefix;
- (NSString)query;
- (PARReply)reply;
- (PARResponse)initWithReply:(id)a3;
- (PARResponse)initWithReply:(id)a3 factory:(id)a4 responseData:(id)a5;
- (SFEngagementSignal)engagementSignal;
- (void)setCorrections:(id)a3;
- (void)setGeoUserSessionEntity:(id)a3;
- (void)setLegacyJSON:(id)a3;
- (void)setPrefix:(id)a3;
- (void)setQuery:(id)a3;
- (void)setRawSqf:(id)a3;
- (void)setResults:(id)a3;
- (void)setSections:(id)a3;
- (void)setServerFeatures:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)setSuggestionsAreBlended:(BOOL)a3;
@end

@implementation PARResponse

- (PARResponse)initWithReply:(id)a3 factory:(id)a4 responseData:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = a5;
  uint64_t v9 = sub_19C898E40();
  unint64_t v11 = v10;

  return (PARResponse *)PARResponse.init(reply:factory:responseData:)(v7, a4, v9, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyJSON, 0);
  objc_storeStrong((id *)&self->_engagementSignal, 0);
  objc_storeStrong((id *)&self->_geoUserSessionEntity, 0);
  objc_storeStrong((id *)&self->_corrections, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_serverFeatures, 0);
  objc_storeStrong((id *)&self->_rawSqf, 0);
  objc_storeStrong((id *)&self->_alternativeResults, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_rawResponse, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_prefix, 0);

  objc_storeStrong((id *)&self->_reply, 0);
}

- (void)setLegacyJSON:(id)a3
{
}

- (NSData)legacyJSON
{
  return self->_legacyJSON;
}

- (SFEngagementSignal)engagementSignal
{
  return self->_engagementSignal;
}

- (void)setSuggestionsAreBlended:(BOOL)a3
{
  self->_suggestionsAreBlended = a3;
}

- (BOOL)suggestionsAreBlended
{
  return self->_suggestionsAreBlended;
}

- (void)setGeoUserSessionEntity:(id)a3
{
}

- (GEOUserSessionEntity)geoUserSessionEntity
{
  return self->_geoUserSessionEntity;
}

- (void)setCorrections:(id)a3
{
}

- (NSArray)corrections
{
  return self->_corrections;
}

- (void)setSuggestions:(id)a3
{
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)setServerFeatures:(id)a3
{
}

- (NSDictionary)serverFeatures
{
  return self->_serverFeatures;
}

- (void)setRawSqf:(id)a3
{
}

- (NSDictionary)rawSqf
{
  return self->_rawSqf;
}

- (NSArray)alternativeResults
{
  return self->_alternativeResults;
}

- (void)setResults:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (void)setSections:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (NSArray)rawResponse
{
  return self->_rawResponse;
}

- (void)setQuery:(id)a3
{
}

- (NSString)query
{
  return self->_query;
}

- (void)setPrefix:(id)a3
{
}

- (NSString)prefix
{
  return self->_prefix;
}

- (PARReply)reply
{
  return self->_reply;
}

- (PARResponse)initWithReply:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PARResponse;
  v6 = [(PARResponse *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reply, a3);
    uint64_t v8 = [v5 rawResponse];
    rawResponse = v7->_rawResponse;
    v7->_rawResponse = (NSArray *)v8;
  }
  return v7;
}

+ (id)responseFromReply:(id)a3
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v97 = a3;
  v3 = [v97 task];
  v96 = [v3 request];

  [v96 scale];
  if (v4 > 0.0)
  {
    [v97 scale];
    if (v5 == 0.0)
    {
      [v96 scale];
      objc_msgSend(v97, "setScale:");
    }
  }
  [v97 scale];
  uint64_t v7 = v6;
  uint64_t v89 = [v96 queryId];
  uint64_t v8 = [v97 task];
  v95 = [v8 session];

  context = (void *)MEMORY[0x19F39C3D0]();
  uint64_t v9 = [v95 configuration];
  unint64_t v10 = [v9 factory];
  objc_super v11 = v10;
  if (v10) {
    v12 = v10;
  }
  else {
    v12 = objc_alloc_init(PARDefaultFactory);
  }
  v93 = v12;

  v13 = [[PARResponse alloc] initWithReply:v97];
  v94 = [(PARResponse *)v13 rawResponse];
  v14 = [v94 firstObject];
  id v99 = v14;
  if (v14)
  {
    uint64_t v15 = objc_msgSend(v14, "parsec_stringForKey:", @"prefix");
    prefix = v13->_prefix;
    v13->_prefix = (NSString *)v15;

    uint64_t v17 = objc_msgSend(v99, "parsec_stringForKey:", @"query");
    query = v13->_query;
    v13->_query = (NSString *)v17;

    v98 = objc_msgSend(v99, "parsec_dictionaryForKey:", @"engagement_scores");
    v86 = objc_msgSend(v98, "parsec_numberForKey:", @"version");
    v83 = objc_msgSend(v98, "parsec_numberForKey:", @"serverScore");
    v85 = objc_msgSend(v98, "parsec_numberForKey:", @"serverScoreConfidence");
    v82 = objc_msgSend(v98, "parsec_numberForKey:", @"localScore");
    v84 = objc_msgSend(v98, "parsec_numberForKey:", @"localScoreConfidence");
    v88 = objc_msgSend(v98, "parsec_arrayForKey:", @"domainEngagementScores");
    v87 = objc_msgSend(v88, "parsec_mapObjectsUsingBlock:", &__block_literal_global_2210);
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F9A090]) initWithVersion:v86 serverScore:v83 severScoreConfidence:v85 localScore:v82 localScoreConfidence:v84 domainScores:v87];
    engagementSignal = v13->_engagementSignal;
    v13->_engagementSignal = (SFEngagementSignal *)v19;

    v21 = objc_msgSend(v99, "parsec_stringForKey:", @"sqf");
    v79 = objc_msgSend(v21, "parsec_base64DecodedData");

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v77 = 0;
LABEL_32:
      uint64_t v38 = objc_msgSend(v99, "parsec_dictionaryForKey:", @"l3b");
      serverFeatures = v13->_serverFeatures;
      v13->_serverFeatures = (NSDictionary *)v38;

      v81 = objc_msgSend(v99, "parsec_arrayForKey:", @"suggestions");
      v115[0] = MEMORY[0x1E4F143A8];
      v115[1] = 3221225472;
      v115[2] = __33__PARResponse_responseFromReply___block_invoke_2;
      v115[3] = &unk_1E5900AD0;
      id v40 = v97;
      id v116 = v40;
      v41 = objc_msgSend(v81, "parsec_mapObjectsUsingBlock:", v115);
      v42 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      id v43 = v41;
      uint64_t v44 = [v43 countByEnumeratingWithState:&v111 objects:v122 count:16];
      if (v44)
      {
        uint64_t v45 = *(void *)v112;
        do
        {
          for (uint64_t i = 0; i != v44; ++i)
          {
            if (*(void *)v112 != v45) {
              objc_enumerationMutation(v43);
            }
            v47 = *(void **)(*((void *)&v111 + 1) + 8 * i);
            v48 = [v47 detailText];
            v49 = [v47 suggestion];
            [v42 setObject:v48 forKeyedSubscript:v49];
          }
          uint64_t v44 = [v43 countByEnumeratingWithState:&v111 objects:v122 count:16];
        }
        while (v44);
      }

      id obj = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([v43 count])
      {
        v50 = [v43 firstObject];
        [obj insertObject:v50 atIndex:0];

        if ((unint64_t)[v43 count] >= 2)
        {
          v51 = objc_msgSend(v43, "subarrayWithRange:", 1, objc_msgSend(v43, "count") - 1);
          [obj addObjectsFromArray:v51];
        }
      }
      objc_storeStrong((id *)&v13->_suggestions, obj);
      v13->_suggestionsAreBlended = objc_msgSend(v99, "parsec_BOOLForKey:", @"suggestions_are_blended");
      v80 = objc_msgSend(v99, "parsec_arrayForKey:", @"corrections");
      uint64_t v52 = objc_msgSend(v80, "parsec_mapObjectsUsingBlock:", &__block_literal_global_61);
      corrections = v13->_corrections;
      v13->_corrections = (NSArray *)v52;

      v54 = [MEMORY[0x1E4F1CA60] dictionary];
      v55 = [MEMORY[0x1E4F1CA48] array];
      v92 = objc_msgSend(v99, "parsec_arrayForKey:", @"results");
      v56 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v92, "count"));
      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      v100[2] = __33__PARResponse_responseFromReply___block_invoke_4;
      v100[3] = &unk_1E5900AF8;
      id v101 = v40;
      v102 = v93;
      uint64_t v109 = v89;
      id v75 = v77;
      id v103 = v75;
      v104 = v95;
      uint64_t v110 = v7;
      id v78 = v56;
      id v105 = v78;
      id v76 = v54;
      id v106 = v76;
      v57 = v55;
      v107 = v57;
      v58 = v13;
      v108 = v58;
      uint64_t v59 = objc_msgSend(v92, "parsec_mapObjectsUsingBlock:", v100);
      results = v58->_results;
      v58->_results = (NSArray *)v59;

      objc_storeStrong((id *)&v58->_alternativeResults, v56);
      if (PARLogHandleForCategory_onceToken_2212 != -1) {
        dispatch_once(&PARLogHandleForCategory_onceToken_2212, &__block_literal_global_323);
      }
      v61 = (void *)PARLogHandleForCategory_logHandles_2_2213;
      if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_2213, OS_LOG_TYPE_INFO))
      {
        v73 = v13->_prefix;
        v62 = v61;
        v74 = [(PARResponse *)v58 suggestions];
        uint64_t v63 = [v74 count];
        v64 = [(PARResponse *)v58 results];
        uint64_t v65 = [v64 count];
        v66 = [(PARResponse *)v58 alternativeResults];
        uint64_t v67 = [v66 count];
        *(_DWORD *)buf = 134219011;
        *(void *)&buf[4] = v89;
        *(_WORD *)&buf[12] = 2117;
        *(void *)&buf[14] = v73;
        *(_WORD *)&buf[22] = 2048;
        v120 = (uint64_t (*)(uint64_t, uint64_t))v63;
        *(_WORD *)v121 = 2048;
        *(void *)&v121[2] = v65;
        *(_WORD *)&v121[10] = 2048;
        *(void *)&v121[12] = v67;
        _os_log_impl(&dword_19C7E7000, v62, OS_LOG_TYPE_INFO, "Response for qid:%llu[%{sensitive}@] processed with %lu suggestions, %lu results and %lu alternative results", buf, 0x34u);
      }
      sections = v58->_sections;
      v58->_sections = v57;
      v69 = v57;

      v70 = v108;
      v71 = v58;

      v14 = v99;
      goto LABEL_47;
    }
    id v22 = v96;
    v23 = [v22 queryString];
    id v24 = v79;
    id v25 = v23;
    v26 = v25;
    if (v24)
    {
      if (v25)
      {
        id v27 = v25;
        id v118 = 0;
        v28 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v24 options:0 error:&v118];
        id v29 = v118;
        if (v29)
        {
          if (PARLogHandleForCategory_onceToken_2212 != -1) {
            dispatch_once(&PARLogHandleForCategory_onceToken_2212, &__block_literal_global_323);
          }
          uint64_t v30 = PARLogHandleForCategory_logHandles_2_2213;
          if (!os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_2213, OS_LOG_TYPE_ERROR)) {
            goto LABEL_29;
          }
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v29;
          v31 = "error decoding sqf: %@";
          v32 = v30;
          uint32_t v33 = 12;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v120 = __Block_byref_object_copy_;
            *(void *)v121 = __Block_byref_object_dispose_;
            *(void *)&v121[8] = 0;
            v117[0] = MEMORY[0x1E4F143A8];
            v117[1] = 3221225472;
            v117[2] = __decodeSqf_block_invoke;
            v117[3] = &unk_1E5900B40;
            v117[4] = v27;
            v117[5] = buf;
            [v28 enumerateObjectsUsingBlock:v117];
            v35 = (NSDictionary *)*(id *)(*(void *)&buf[8] + 40);
            _Block_object_dispose(buf, 8);

LABEL_30:
            v26 = v27;
            goto LABEL_31;
          }
          if (PARLogHandleForCategory_onceToken_2212 != -1) {
            dispatch_once(&PARLogHandleForCategory_onceToken_2212, &__block_literal_global_323);
          }
          uint64_t v36 = PARLogHandleForCategory_logHandles_2_2213;
          if (!os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_2213, OS_LOG_TYPE_ERROR))
          {
LABEL_29:
            v35 = 0;
            goto LABEL_30;
          }
          *(_WORD *)buf = 0;
          v31 = "sqf not an array";
          v32 = v36;
          uint32_t v33 = 2;
        }
        _os_log_error_impl(&dword_19C7E7000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
        goto LABEL_29;
      }
    }
    else
    {
      if (PARLogHandleForCategory_onceToken_2212 != -1) {
        dispatch_once(&PARLogHandleForCategory_onceToken_2212, &__block_literal_global_323);
      }
      v34 = PARLogHandleForCategory_logHandles_2_2213;
      if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_2213, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_19C7E7000, v34, OS_LOG_TYPE_DEBUG, "no sqf", buf, 2u);
      }
    }
    v35 = 0;
LABEL_31:
    v77 = v26;

    rawSqf = v13->_rawSqf;
    v13->_rawSqf = v35;

    goto LABEL_32;
  }
LABEL_47:

  return v13;
}

uint64_t __33__PARResponse_responseFromReply___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asSuggestion:", *(void *)(a1 + 32));
}

id __33__PARResponse_responseFromReply___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = objc_msgSend(v3, "sf_asSearchResult:factory:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  [v4 setQueryId:*(void *)(a1 + 96)];
  [v4 setUserInput:*(void *)(a1 + 48)];
  double v5 = objc_msgSend(v3, "parsec_stringForKey:", @"fbr");
  [v4 setFbr:v5];

  uint64_t v6 = objc_msgSend(v3, "parsec_stringForKey:", @"more_results_url");
  if ([v6 length])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
    if (v7)
    {
      uint64_t v8 = objc_msgSend(v3, "parsec_stringForKey:", @"more_results_label");
      uint64_t v9 = +[PARAsyncMoreResults moreResults:v7 label:v8 session:*(void *)(a1 + 56) scale:*(void *)(a1 + 96) queryId:*(void *)(a1 + 96) clientQueryId:*(double *)(a1 + 104)];
      [v4 setMoreResults:v9];
    }
  }
  if ([v4 type] == 26)
  {
    [*(id *)(a1 + 64) addObject:v4];
    id v10 = 0;
  }
  else
  {
    objc_super v11 = [v4 sectionHeader];

    if (v11)
    {
      v12 = *(void **)(a1 + 72);
      v13 = [v4 sectionHeader];
      id v14 = [v12 objectForKey:v13];

      if (!v14)
      {
        id v14 = objc_alloc_init(MEMORY[0x1E4F9A368]);
        uint64_t v15 = [v4 sectionHeader];
        [v14 setTitle:v15];

        v16 = [v4 sectionBundleIdentifier];
        [v14 setBundleIdentifier:v16];

        uint64_t v17 = *(void **)(a1 + 72);
        v18 = [v14 title];
        [v17 setObject:v14 forKey:v18];

        [*(id *)(a1 + 80) addObject:v14];
      }
      uint64_t v19 = [v14 moreText];

      if (!v19)
      {
        v20 = [v4 sectionHeaderMore];
        [v14 setMoreText:v20];
      }
      objc_msgSend(v14, "setIsInitiallyHidden:", objc_msgSend(v3, "parsec_BOOLForKey:", @"initially_hidden"));
      v21 = objc_msgSend(v3, "parsec_numberForKey:", @"maxInitiallyVisibleResults");
      id v22 = v21;
      if (v21) {
        objc_msgSend(v14, "setMaxInitiallyVisibleResults:", objc_msgSend(v21, "unsignedIntValue"));
      }
      v23 = [v14 results];
      id v24 = v23;
      if (v23)
      {
        id v25 = v23;
      }
      else
      {
        id v25 = [MEMORY[0x1E4F1CA48] array];
      }
      v26 = v25;

      [v26 addObject:v4];
      [v14 setResults:v26];
      id v27 = [v4 inlineCard];
      v28 = [v27 cardSections];
      id v29 = [v28 firstObject];

      if (v29)
      {
        uint64_t v30 = [v4 inlineCard];
        v31 = [v30 cardSections];
        v32 = [v31 firstObject];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint32_t v33 = [v32 titleButtonItem];
          [v14 setTitleButtonItem:v33];
        }
      }
      v34 = objc_msgSend(v3, "parsec_stringForKey:", @"more_results_button");
      v35 = objc_msgSend(v34, "parsec_base64DecodedData");

      if (v35)
      {
        uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F9A5A8]) initWithData:v35];
        if (v36)
        {
          v37 = (void *)[objc_alloc(MEMORY[0x1E4F99FB0]) initWithProtobuf:v36];
          [v14 setButton:v37];
          [v4 setMoreResultsButton:v37];
        }
      }
    }
    [v4 setIntendedQuery:*(void *)(*(void *)(a1 + 88) + 32)];
    uint64_t v38 = *(void **)(*(void *)(a1 + 88) + 96);
    if (v38 && [v38 count])
    {
      v39 = [*(id *)(*(void *)(a1 + 88) + 96) firstObject];
      id v40 = [v39 suggestion];
      [v4 setCorrectedQuery:v40];
    }
    v41 = [v4 card];

    if (!v41)
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      v42 = objc_msgSend(v4, "inlineCard", 0);
      id v43 = [v42 cardSections];

      uint64_t v44 = [v43 countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v57;
        while (2)
        {
          for (uint64_t i = 0; i != v45; ++i)
          {
            if (*(void *)v57 != v46) {
              objc_enumerationMutation(v43);
            }
            v48 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            v49 = [v48 nextCard];

            if (v49)
            {
              v50 = [v48 nextCard];
              [v4 setCard:v50];

              goto LABEL_40;
            }
          }
          uint64_t v45 = [v43 countByEnumeratingWithState:&v56 objects:v60 count:16];
          if (v45) {
            continue;
          }
          break;
        }
      }
LABEL_40:
    }
    v51 = [v4 card];
    recursiveSetQueryId(v51, *(void *)(a1 + 96));

    uint64_t v52 = [v4 inlineCard];
    recursiveSetQueryId(v52, *(void *)(a1 + 96));

    v53 = [v4 compactCard];
    recursiveSetQueryId(v53, *(void *)(a1 + 96));

    v54 = [v4 tophitCard];
    recursiveSetQueryId(v54, *(void *)(a1 + 96));

    id v10 = v4;
  }

  return v10;
}

id __33__PARResponse_responseFromReply___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F9A3C8];
  id v3 = a2;
  id v4 = [v2 alloc];
  double v5 = objc_msgSend(v3, "parsec_stringForKey:", @"c");
  uint64_t v6 = objc_msgSend(v3, "parsec_stringForKey:", @"p");
  uint64_t v7 = objc_msgSend(v3, "parsec_numberForKey:", @"s");
  [v7 doubleValue];
  uint64_t v8 = objc_msgSend(v4, "initWithIdentifier:suggestion:query:score:type:", 0, v5, v6, 1);

  uint64_t v9 = objc_msgSend(v3, "parsec_stringForKey:", @"fbr");

  [v8 setFbr:v9];

  return v8;
}

id __33__PARResponse_responseFromReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(v2, "parsec_numberForKey:", @"domain");
  id v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 intValue];
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = objc_msgSend(v2, "parsec_numberForKey:", @"score");
  uint64_t v7 = objc_msgSend(v2, "parsec_numberForKey:", @"scoreConfidence");

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F9A058]) initWithDomain:v5 scoreConfidence:v7 score:v6];

  return v8;
}

+ (id)responseFromJSON:(id)a3 session:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    a3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:0 error:0];
  }
  uint64_t v7 = [a1 responseFromData:a3 session:v6 request:0];

  return v7;
}

+ (id)responseFromData:(id)a3 session:(id)a4 request:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(PARReply);
  [(PARReply *)v10 setData:v9];

  objc_super v11 = objc_alloc_init(PARTask);
  [(PARTask *)v11 setSession:v8];

  [(PARTask *)v11 setRequest:v7];
  [(PARReply *)v10 setTask:v11];
  v12 = +[PARResponse responseFromReply:v10];

  return v12;
}

@end