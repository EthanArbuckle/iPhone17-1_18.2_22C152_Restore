@interface GEOPlaceRequestTicket
@end

@implementation GEOPlaceRequestTicket

void __104___GEOPlaceRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_3(uint64_t a1, void *a2)
{
  id v11 = a2;
  if ([v11 resultType] == 2)
  {
    v3 = [v11 collection];

    if (v3)
    {
      v4 = [GEOCollectionResult alloc];
      v5 = [v11 collection];
      v6 = [(GEOCollectionResult *)v4 initWithCollectionResult:v5];

      if (v6)
      {
        v7 = (id *)(a1 + 32);
LABEL_9:
        [*v7 addObject:v6];
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  if ([v11 resultType] == 3)
  {
    v8 = [v11 publisher];

    if (v8)
    {
      v9 = [GEOPublisherResult alloc];
      v10 = [v11 publisher];
      v6 = [(GEOPublisherResult *)v9 initWithPublisherResult:v10];

      if (v6)
      {
        v7 = (id *)(a1 + 40);
        goto LABEL_9;
      }
LABEL_10:
    }
  }
}

void __104___GEOPlaceRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (a3)
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if ([*(id *)(a1 + 32) status] != 30 || (uint64_t v6 = *(void *)(a1 + 56)) == 0) {
      uint64_t v6 = *(void *)(a1 + 48);
    }
    v5 = *(void (**)(void))(v6 + 16);
  }
  v5();
}

void __79___GEOPlaceRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = +[GEONotificationPreferenceManager sharedManager];
  int v7 = [v6 isEnabledForSubTestWithName:@"GEOPPTTest_PlaceRequest"];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"GEOPPTTest_PlaceRequestEND" object:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __104___GEOPlaceRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v350[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  v8 = +[GEONotificationPreferenceManager sharedManager];
  int v9 = [v8 isEnabledForSubTestWithName:@"GEOPPTTest_PlaceRequestTicket_PlaceDataRequest"];

  if (v9)
  {
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"GEOPPTTest_PlaceRequestTicket_PlaceDataRequestEND" object:v6];
  }
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (!v6 || v7)
    {
      uint64_t v27 = *(void *)(v11 + 320);
      if (v27)
      {
        v350[0] = v27;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v350 count:1];
      }
      else
      {
        v12 = 0;
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_244:

      goto LABEL_245;
    }
    objc_storeStrong((id *)(v11 + 312), a2);
    v12 = [v6 resultsWithResultType:1];
    if ([v12 count] == 1)
    {
      uint64_t v13 = *(void *)(a1 + 40);
      v14 = [v12 firstObject];
      [v14 setRequestData:v13];
    }
    unint64_t v15 = 0x1E4F1C000uLL;
    if ([v6 dotPlacesCount])
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "dotPlacesCount"));
      v17 = [v6 dotPlaces];
      v341[0] = MEMORY[0x1E4F143A8];
      v341[1] = 3221225472;
      v341[2] = __104___GEOPlaceRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_2;
      v341[3] = &unk_1E53DE618;
      id v18 = v16;
      id v342 = v18;
      [v17 enumerateObjectsUsingBlock:v341];

      uint64_t v19 = [v18 copy];
      uint64_t v20 = *(void *)(a1 + 32);
      v21 = *(void **)(v20 + 200);
      *(void *)(v20 + 200) = v19;
    }
    if ([v6 hasGlobalResult])
    {
      uint64_t v22 = [v6 globalResult];
      if (v22)
      {
        v23 = (void *)v22;
        -[GEOPDPlaceGlobalResult _readCategorySearchResult](v22);
        uint64_t v24 = v23[17];

        if (v24)
        {
          v25 = [v6 globalResult];
          -[GEOPDPlaceGlobalResult categorySearchResult](v25);
          v26 = (id *)objc_claimAutoreleasedReturnValue();
          v300 = -[GEOPDCategorySearchResult resultDetourInfos](v26);
LABEL_19:

          goto LABEL_24;
        }
      }
    }
    if ([v6 hasGlobalResult])
    {
      v28 = v12;
      v29 = [v6 globalResult];
      -[GEOPDPlaceGlobalResult searchResult](v29);
      v30 = (id *)objc_claimAutoreleasedReturnValue();
      v31 = -[GEOPDSearchResult resultDetourInfos](v30);
      uint64_t v32 = [v31 count];

      if (v32)
      {
        v25 = [v6 globalResult];
        -[GEOPDPlaceGlobalResult searchResult](v25);
        v26 = (id *)objc_claimAutoreleasedReturnValue();
        v300 = -[GEOPDSearchResult resultDetourInfos](v26);
        id v7 = 0;
        v12 = v28;
        goto LABEL_19;
      }
      v300 = 0;
      id v7 = 0;
      v12 = v28;
    }
    else
    {
      v300 = 0;
    }
LABEL_24:
    if ([*(id *)(*(void *)(a1 + 32) + 296) requestType] == 21)
    {
      v33 = [*(id *)(*(void *)(a1 + 32) + 296) placeRequestParameters];
      -[GEOPDPlaceRequestParameters externalTransitLookupParameters](v33);
      v34 = (id *)objc_claimAutoreleasedReturnValue();
      v301 = -[GEOPDExternalTransitLookupParameters externalTransitStationCodes](v34);
    }
    else
    {
      v301 = 0;
    }
    if (![v6 hasGlobalResult]) {
      goto LABEL_224;
    }
    uint64_t v35 = [v6 globalResult];
    v36 = (void *)v35;
    if (!v35)
    {
LABEL_223:

LABEL_224:
      v269 = [v6 mapsResults];
      uint64_t v270 = [v269 count];

      if (v270)
      {
        v271 = v12;
        id v272 = v7;
        v273 = [*(id *)(v15 + 2632) array];
        v274 = [*(id *)(v15 + 2632) array];
        v275 = [v6 mapsResults];
        v310[0] = MEMORY[0x1E4F143A8];
        v310[1] = 3221225472;
        v310[2] = __104___GEOPlaceRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_3;
        v310[3] = &unk_1E53DE640;
        id v276 = v273;
        id v311 = v276;
        id v277 = v274;
        id v312 = v277;
        [v275 enumerateObjectsUsingBlock:v310];

        uint64_t v278 = [v276 count];
        if (v278) {
          v279 = (void *)[v276 copy];
        }
        else {
          v279 = 0;
        }
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), v279);
        if (v278) {

        }
        uint64_t v280 = [v277 count];
        if (v280) {
          v281 = (void *)[v277 copy];
        }
        else {
          v281 = 0;
        }
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), v281);
        if (v280) {

        }
        id v7 = v272;
        v12 = v271;
      }
      if (![v12 count] && ((v287 = *(void **)(a1 + 32), v287[15]) || v287[16] || v287[20] || v287[7]))
      {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        v285 = v300;
        v286 = v301;
      }
      else
      {
        uint64_t v282 = [*(id *)(a1 + 48) requestType];
        v283 = [v6 _disambiguationLabels];
        v284 = [v6 mapsResults];
        v305[0] = MEMORY[0x1E4F143A8];
        v305[1] = 3221225472;
        v305[2] = __104___GEOPlaceRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_4;
        v305[3] = &unk_1E53DE668;
        id v308 = *(id *)(a1 + 56);
        id v306 = v6;
        id v309 = *(id *)(a1 + 64);
        id v307 = 0;
        v285 = v300;
        v286 = v301;
        _attributedGeoMapItemsForPlaceDatasWithHandler(v282, v12, v283, v300, v301, v284, v305);
      }
      goto LABEL_244;
    }
    -[GEOPDPlaceGlobalResult _readSearchResult](v35);
    uint64_t v302 = a1;
    if (v36[46])
    {
      uint64_t v37 = -[GEOPDPlaceGlobalResult searchResult]((id *)v36);
      uint64_t v38 = v37;
      uint64_t v303 = v37;
      v298 = v36;
      if (v37)
      {
        -[GEOPDSearchResult _readDisplayMapRegion](v37);
        if (*(void *)(v38 + 72))
        {
          uint64_t v39 = -[GEOPDSearchResult displayMapRegion]((id *)v38);
          uint64_t v40 = *(void *)(a1 + 32);
          v41 = *(void **)(v40 + 40);
          *(void *)(v40 + 40) = v39;
        }
        if (*(unsigned char *)(v38 + 249)) {
          *(unsigned char *)(*(void *)(a1 + 32) + 48) = *(unsigned char *)(v38 + 243);
        }
        -[GEOPDSearchResult _readRelatedSearchSuggestions](v38);
        if ([*(id *)(v38 + 128) count])
        {
          v42 = [MEMORY[0x1E4F1CA48] array];
          long long v337 = 0u;
          long long v338 = 0u;
          long long v339 = 0u;
          long long v340 = 0u;
          v43 = -[GEOPDSearchResult relatedSearchSuggestions]((id *)v38);
          uint64_t v44 = [v43 countByEnumeratingWithState:&v337 objects:v349 count:16];
          if (v44)
          {
            uint64_t v45 = v44;
            uint64_t v46 = *(void *)v338;
            do
            {
              for (uint64_t i = 0; i != v45; ++i)
              {
                if (*(void *)v338 != v46) {
                  objc_enumerationMutation(v43);
                }
                v48 = [[GEORelatedSearchSuggestion alloc] initWithPDRelatedSearchSuggestion:*(void *)(*((void *)&v337 + 1) + 8 * i)];
                [v42 addObject:v48];
              }
              uint64_t v45 = [v43 countByEnumeratingWithState:&v337 objects:v349 count:16];
            }
            while (v45);
          }

          a1 = v302;
          objc_storeStrong((id *)(*(void *)(v302 + 32) + 56), v42);

          unint64_t v15 = 0x1E4F1C000uLL;
          uint64_t v38 = v303;
        }
        -[GEOPDSearchResult _readDefaultRelatedSearchSuggestion](v38);
        if (*(void *)(v38 + 40))
        {
          v49 = [GEORelatedSearchSuggestion alloc];
          v50 = -[GEOPDSearchResult defaultRelatedSearchSuggestion]((id *)v38);
          uint64_t v51 = [(GEORelatedSearchSuggestion *)v49 initWithPDRelatedSearchSuggestion:v50];
          uint64_t v52 = *(void *)(a1 + 32);
          v53 = *(void **)(v52 + 72);
          *(void *)(v52 + 72) = v51;
        }
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 112) = 0;
      -[GEOPDSearchResult searchClientBehavior]((id *)v38);
      v54 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      if (v54)
      {
        char v55 = v54[20];

        if ((v55 & 2) == 0) {
          goto LABEL_52;
        }
        -[GEOPDSearchResult searchClientBehavior]((id *)v38);
        v54 = (unsigned char *)objc_claimAutoreleasedReturnValue();
        if (v54) {
          BOOL v56 = v54[17] != 0;
        }
        else {
          BOOL v56 = 0;
        }
        *(unsigned char *)(*(void *)(v302 + 32) + 112) = v56;
      }

LABEL_52:
      *(unsigned char *)(*(void *)(v302 + 32) + 113) = 0;
      if (!GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1E9111EB8)) {
        goto LABEL_59;
      }
      -[GEOPDSearchResult searchClientBehavior]((id *)v38);
      v57 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      if (v57)
      {
        char v58 = v57[20];

        if ((v58 & 1) == 0) {
          goto LABEL_59;
        }
        -[GEOPDSearchResult searchClientBehavior]((id *)v38);
        v57 = (unsigned char *)objc_claimAutoreleasedReturnValue();
        if (v57) {
          BOOL v59 = v57[16] != 0;
        }
        else {
          BOOL v59 = 0;
        }
        *(unsigned char *)(*(void *)(v302 + 32) + 113) = v59;
      }

LABEL_59:
      if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1E9111EB8))
      {
        a1 = v302;
        if (v38)
        {
          -[GEOPDSearchResult _readSearchSessionData](v38);
          if (*(void *)(v38 + 184))
          {
            v60 = [GEOSearchSessionData alloc];
            v61 = -[GEOPDSearchResult searchSessionData]((id *)v38);
            uint64_t v62 = [(GEOSearchSessionData *)v60 initWithSearchSessionData:v61];
            uint64_t v63 = *(void *)(v302 + 32);
            v64 = *(void **)(v63 + 280);
            *(void *)(v63 + 280) = v62;
          }
LABEL_98:
          if ((*(unsigned char *)(v38 + 248) & 8) != 0)
          {
            unsigned int v92 = -[GEOPDSearchResult searchResultType](v38);
            if (v92 <= 4) {
              *(_DWORD *)(*(void *)(a1 + 32) + 88) = v92;
            }
          }
          -[GEOPDSearchResult _readResultDisplayHeader](v38);
          if (*(void *)(v38 + 144))
          {
            uint64_t v93 = -[GEOPDSearchResult resultDisplayHeader]((id *)v38);
            uint64_t v94 = *(void *)(a1 + 32);
            v95 = *(void **)(v94 + 96);
            *(void *)(v94 + 96) = v93;
          }
          -[GEOPDSearchResult _readClientResolvedResult](v38);
          if (*(void *)(v38 + 32))
          {
            v96 = [GEOResolvedItem alloc];
            v97 = -[GEOPDSearchResult clientResolvedResult]((id *)v38);
            uint64_t v98 = [(GEOResolvedItem *)v96 initWithResolvedItem:v97];
            uint64_t v99 = *(void *)(a1 + 32);
            v100 = *(void **)(v99 + 120);
            *(void *)(v99 + 120) = v98;
          }
          -[GEOPDSearchResult _readDirectionIntent](v38);
          if (*(void *)(v38 + 48))
          {
            v101 = [GEODirectionIntent alloc];
            v102 = -[GEOPDSearchResult directionIntent]((id *)v38);
            uint64_t v103 = [(GEODirectionIntent *)v101 initWithDirectionIntent:v102];
            uint64_t v104 = *(void *)(a1 + 32);
            v105 = *(void **)(v104 + 128);
            *(void *)(v104 + 128) = v103;
          }
          -[GEOPDSearchResult _readRetainSearchs](v38);
          if ([*(id *)(v38 + 160) count])
          {
            v106 = [MEMORY[0x1E4F1CA48] array];
            unint64_t v107 = 0;
LABEL_109:
            -[GEOPDSearchResult _readRetainSearchs](v38);
            for (unint64_t j = [*(id *)(v38 + 160) count]; v107 < j; unint64_t j = 0)
            {
              v109 = [GEORetainedSearchMetadata alloc];
              v110 = -[GEOPDSearchResult retainSearchAtIndex:]((id *)v38, v107);
              v111 = [(GEORetainedSearchMetadata *)v109 initWithRetainedSearchMetadata:v110];
              [v106 addObject:v111];

              uint64_t v38 = v303;
              ++v107;
              if (v303) {
                goto LABEL_109;
              }
            }
            uint64_t v112 = [v106 copy];
            uint64_t v113 = *(void *)(a1 + 32);
            v114 = *(void **)(v113 + 136);
            *(void *)(v113 + 136) = v112;

            unint64_t v15 = 0x1E4F1C000uLL;
          }
        }
      }
      else
      {
        a1 = v302;
        if (v38) {
          goto LABEL_98;
        }
      }
      v115 = -[GEOPDSearchResult displayHeaderSubstitutes]((id *)v38);
      uint64_t v116 = [v115 count];

      if (v116)
      {
        v117 = [MEMORY[0x1E4F1CA48] array];
        long long v333 = 0u;
        long long v334 = 0u;
        long long v335 = 0u;
        long long v336 = 0u;
        v118 = -[GEOPDSearchResult displayHeaderSubstitutes]((id *)v38);
        uint64_t v119 = [v118 countByEnumeratingWithState:&v333 objects:v348 count:16];
        if (v119)
        {
          uint64_t v120 = v119;
          uint64_t v121 = *(void *)v334;
          do
          {
            for (uint64_t k = 0; k != v120; ++k)
            {
              if (*(void *)v334 != v121) {
                objc_enumerationMutation(v118);
              }
              v123 = [[GEODisplayHeaderSubstitute alloc] initWithPDDisplayHeaderSubstitute:*(void *)(*((void *)&v333 + 1) + 8 * k)];
              [v117 addObject:v123];
            }
            uint64_t v120 = [v118 countByEnumeratingWithState:&v333 objects:v348 count:16];
          }
          while (v120);
        }

        a1 = v302;
        objc_storeStrong((id *)(*(void *)(v302 + 32) + 104), v117);

        unint64_t v15 = 0x1E4F1C000uLL;
        uint64_t v38 = v303;
      }
      if (v38)
      {
        uint64_t v124 = *(void *)(v38 + 248);
        if (v124)
        {
          *(_DWORD *)(*(void *)(a1 + 32) + 152) = -[GEOPDSearchResult dymSuggestionVisibleTime](v38);
          uint64_t v124 = *(void *)(v38 + 248);
        }
        if ((v124 & 0x200) != 0) {
          *(unsigned char *)(*(void *)(a1 + 32) + 156) = -[GEOPDSearchResult showDymSuggestionCloseButton](v38);
        }
      }
      v125 = -[GEOPDSearchResult searchResultSections]((id *)v38);
      uint64_t v126 = [v125 count];

      if (v126)
      {
        v127 = (void *)MEMORY[0x1E4F1CA48];
        v128 = -[GEOPDSearchResult searchResultSections]((id *)v38);
        v129 = objc_msgSend(v127, "arrayWithCapacity:", objc_msgSend(v128, "count"));

        long long v331 = 0u;
        long long v332 = 0u;
        long long v329 = 0u;
        long long v330 = 0u;
        v130 = -[GEOPDSearchResult searchResultSections]((id *)v38);
        uint64_t v131 = [v130 countByEnumeratingWithState:&v329 objects:v347 count:16];
        if (v131)
        {
          uint64_t v132 = v131;
          uint64_t v133 = *(void *)v330;
          do
          {
            for (uint64_t m = 0; m != v132; ++m)
            {
              if (*(void *)v330 != v133) {
                objc_enumerationMutation(v130);
              }
              v135 = [[GEOSearchResultSection alloc] initWithSearchResultSection:*(void *)(*((void *)&v329 + 1) + 8 * m)];
              [v129 addObject:v135];
            }
            uint64_t v132 = [v130 countByEnumeratingWithState:&v329 objects:v347 count:16];
          }
          while (v132);
        }

        uint64_t v136 = [v129 copy];
        a1 = v302;
        uint64_t v137 = *(void *)(v302 + 32);
        v138 = *(void **)(v137 + 144);
        *(void *)(v137 + 144) = v136;

        unint64_t v15 = 0x1E4F1C000uLL;
        uint64_t v38 = v303;
      }
      v139 = -[GEOPDSearchResult relatedEntitySections]((id *)v38);
      uint64_t v140 = [v139 count];

      if (v140)
      {
        id v294 = v7;
        v297 = v12;
        v141 = (void *)MEMORY[0x1E4F1CA48];
        v142 = -[GEOPDSearchResult relatedEntitySections]((id *)v38);
        v143 = objc_msgSend(v141, "arrayWithCapacity:", objc_msgSend(v142, "count"));

        long long v327 = 0u;
        long long v328 = 0u;
        long long v325 = 0u;
        long long v326 = 0u;
        v144 = -[GEOPDSearchResult relatedEntitySections]((id *)v38);
        uint64_t v145 = [v144 countByEnumeratingWithState:&v325 objects:v346 count:16];
        if (v145)
        {
          uint64_t v146 = v145;
          uint64_t v147 = *(void *)v326;
          do
          {
            for (uint64_t n = 0; n != v146; ++n)
            {
              if (*(void *)v326 != v147) {
                objc_enumerationMutation(v144);
              }
              uint64_t v149 = *(void *)(*((void *)&v325 + 1) + 8 * n);
              v150 = [GEORelatedEntitySection alloc];
              v151 = [v6 mapsResults];
              v152 = [(GEORelatedEntitySection *)v150 initWithRelatedEntitySection:v149 mapsResults:v151];
              [v143 addObject:v152];
            }
            uint64_t v146 = [v144 countByEnumeratingWithState:&v325 objects:v346 count:16];
          }
          while (v146);
        }

        uint64_t v153 = [v143 copy];
        a1 = v302;
        uint64_t v154 = *(void *)(v302 + 32);
        v155 = *(void **)(v154 + 176);
        *(void *)(v154 + 176) = v153;

        id v7 = v294;
        v12 = v297;
        unint64_t v15 = 0x1E4F1C000;
        uint64_t v38 = v303;
      }
      if (v38)
      {
        -[GEOPDSearchResult _readAutoRedoSearchThreshold](v38);
        if (*(void *)(v38 + 24))
        {
          v156 = [GEOSearchAutoRedoThreshold alloc];
          v157 = -[GEOPDSearchResult autoRedoSearchThreshold]((id *)v38);
          uint64_t v158 = [(GEOSearchAutoRedoThreshold *)v156 initWithSearchAutoRedoThreshold:v157];
          uint64_t v159 = *(void *)(a1 + 32);
          v160 = *(void **)(v159 + 208);
          *(void *)(v159 + 208) = v158;
        }
        uint64_t v161 = *(void *)(a1 + 32);
        v162 = *(void **)(v161 + 216);
        *(void *)(v161 + 216) = 0;

        -[GEOPDSearchResult _readRedoButtonThreshold](v38);
        if (*(void *)(v38 + 112)
          && GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1E9111EB8))
        {
          v163 = [GEOSearchRedoButtonThreshold alloc];
          v164 = -[GEOPDSearchResult redoButtonThreshold]((id *)v38);
          uint64_t v165 = [(GEOSearchRedoButtonThreshold *)v163 initWithSearchRedoButtonThreshold:v164];
          uint64_t v166 = *(void *)(a1 + 32);
          v167 = *(void **)(v166 + 216);
          *(void *)(v166 + 216) = v165;
        }
        -[GEOPDSearchResult _readPlaceSummaryLayoutMetadata](v38);
        if (*(void *)(v38 + 104))
        {
          uint64_t v168 = -[GEOPDSearchResult placeSummaryLayoutMetadata]((id *)v38);
          uint64_t v169 = *(void *)(a1 + 32);
          v170 = *(void **)(v169 + 224);
          *(void *)(v169 + 224) = v168;
        }
        -[GEOPDSearchResult _readGuideSummaryLayoutMetadata](v38);
        v36 = v298;
        if (*(void *)(v38 + 80))
        {
          v171 = [GEOGuideSummaryLayoutMetadata alloc];
          v172 = -[GEOPDSearchResult guideSummaryLayoutMetadata]((id *)v38);
          uint64_t v173 = [(GEOGuideSummaryLayoutMetadata *)v171 initWithGuideSummaryLayoutMetadata:v172];
          uint64_t v174 = *(void *)(a1 + 32);
          v175 = *(void **)(v174 + 232);
          *(void *)(v174 + 232) = v173;
        }
        -[GEOPDSearchResult _readResultRefinementGroup](v38);
        if (*(void *)(v38 + 152))
        {
          v176 = [GEOResultRefinementGroup alloc];
          v177 = -[GEOPDSearchResult resultRefinementGroup]((id *)v38);
          uint64_t v178 = [(GEOResultRefinementGroup *)v176 initWithResultRefinementGroup:v177];
          uint64_t v179 = *(void *)(a1 + 32);
          v180 = *(void **)(v179 + 240);
          *(void *)(v179 + 240) = v178;
        }
        -[GEOPDSearchResult _readSectionList](v38);
        if (*(void *)(v38 + 200))
        {
          v181 = [GEOSearchSectionList alloc];
          v182 = -[GEOPDSearchResult sectionList]((id *)v38);
          v183 = [v6 mapsResults];
          uint64_t v184 = [(GEOSearchSectionList *)v181 initWithSearchSectionList:v182 mapsResults:v183];
          uint64_t v185 = *(void *)(a1 + 32);
          v186 = *(void **)(v185 + 248);
          *(void *)(v185 + 248) = v184;
        }
        if ((*(unsigned char *)(v38 + 248) & 0x20) != 0) {
          *(unsigned char *)(*(void *)(a1 + 32) + 256) = *(unsigned char *)(v38 + 240);
        }
      }
      else
      {
        uint64_t v290 = *(void *)(a1 + 32);
        v291 = *(void **)(v290 + 216);
        *(void *)(v290 + 216) = 0;

        v36 = v298;
      }
      int v187 = -[GEOPDSearchResult searchResultViewType](v38);
      int v188 = v187 == 1;
      if (v187 == 2) {
        int v188 = 2;
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 260) = v188;
      if (v38)
      {
        *(unsigned char *)(*(void *)(a1 + 32) + 264) = *(unsigned char *)(v38 + 242);
        -[GEOPDSearchResult _readOpenPlaceCardForResultWithId](v38);
        if (*(void *)(v38 + 88))
        {
          v189 = *(void **)(a1 + 32);
          v190 = -[GEOPDSearchResult openPlaceCardForResultWithId]((id *)v38);
          uint64_t v191 = [v189 geoMapItemIdentifier:v190];
          uint64_t v192 = *(void *)(a1 + 32);
          v193 = *(void **)(v192 + 272);
          *(void *)(v192 + 272) = v191;
        }
        if ((*(unsigned char *)(v38 + 248) & 2) != 0) {
          *(_DWORD *)(*(void *)(a1 + 32) + 288) = -[GEOPDSearchResult mapDisplayType](v38);
        }
      }
      else
      {
        *(unsigned char *)(*(void *)(a1 + 32) + 264) = 0;
      }
      goto LABEL_222;
    }
    -[GEOPDPlaceGlobalResult _readCategorySearchResult]((uint64_t)v36);
    if (!v36[17])
    {
      -[GEOPDPlaceGlobalResult _readPopularNearbySearchResult]((uint64_t)v36);
      if (!v36[40])
      {
        -[GEOPDPlaceGlobalResult _readMerchantLookupResult]((uint64_t)v36);
        if (!v36[31]) {
          goto LABEL_223;
        }
        uint64_t v288 = -[GEOPDPlaceGlobalResult merchantLookupResult]((id *)v36);
        uint64_t v289 = *(void *)(a1 + 32);
        uint64_t v38 = *(void *)(v289 + 160);
        *(void *)(v289 + 160) = v288;
        goto LABEL_222;
      }
      uint64_t v194 = -[GEOPDPlaceGlobalResult popularNearbySearchResult]((id *)v36);
      uint64_t v38 = v194;
      if (!v194) {
        goto LABEL_222;
      }
      -[GEOPDPopularNearbySearchResult _readDisplayMapRegion](v194);
      if (*(void *)(v38 + 24))
      {
        uint64_t v195 = -[GEOPDPopularNearbySearchResult displayMapRegion]((id *)v38);
        uint64_t v196 = *(void *)(a1 + 32);
        v197 = *(void **)(v196 + 40);
        *(void *)(v196 + 40) = v195;
      }
      if ((*(unsigned char *)(v38 + 56) & 1) == 0)
      {
LABEL_222:

        goto LABEL_223;
      }
      char v198 = *(unsigned char *)(v38 + 52);
      uint64_t v199 = *(void *)(a1 + 32);
      uint64_t v200 = 48;
LABEL_221:
      *(unsigned char *)(v199 + v200) = v198;
      goto LABEL_222;
    }
    uint64_t v65 = -[GEOPDPlaceGlobalResult categorySearchResult]((id *)v36);
    uint64_t v38 = v65;
    uint64_t v304 = v65;
    v299 = v36;
    if (v65)
    {
      -[GEOPDCategorySearchResult _readDisplayMapRegion](v65);
      if (*(void *)(v38 + 56))
      {
        uint64_t v66 = -[GEOPDCategorySearchResult displayMapRegion]((id *)v38);
        uint64_t v67 = *(void *)(a1 + 32);
        v68 = *(void **)(v67 + 40);
        *(void *)(v67 + 40) = v66;
      }
      if ((*(unsigned char *)(v38 + 184) & 0x20) != 0) {
        *(unsigned char *)(*(void *)(a1 + 32) + 48) = *(unsigned char *)(v38 + 183);
      }
      -[GEOPDCategorySearchResult _readRelatedSearchSuggestions](v38);
      if ([*(id *)(v38 + 104) count])
      {
        v69 = [MEMORY[0x1E4F1CA48] array];
        long long v321 = 0u;
        long long v322 = 0u;
        long long v323 = 0u;
        long long v324 = 0u;
        v70 = -[GEOPDCategorySearchResult relatedSearchSuggestions]((id *)v38);
        uint64_t v71 = [v70 countByEnumeratingWithState:&v321 objects:v345 count:16];
        if (v71)
        {
          uint64_t v72 = v71;
          uint64_t v73 = *(void *)v322;
          do
          {
            for (iuint64_t i = 0; ii != v72; ++ii)
            {
              if (*(void *)v322 != v73) {
                objc_enumerationMutation(v70);
              }
              v75 = [[GEORelatedSearchSuggestion alloc] initWithPDRelatedSearchSuggestion:*(void *)(*((void *)&v321 + 1) + 8 * ii)];
              [v69 addObject:v75];
            }
            uint64_t v72 = [v70 countByEnumeratingWithState:&v321 objects:v345 count:16];
          }
          while (v72);
        }

        objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), v69);
        unint64_t v15 = 0x1E4F1C000uLL;
        uint64_t v38 = v304;
      }
      -[GEOPDCategorySearchResult _readDefaultRelatedSearchSuggestion](v38);
      if (*(void *)(v38 + 48))
      {
        v76 = [GEORelatedSearchSuggestion alloc];
        v77 = -[GEOPDCategorySearchResult defaultRelatedSearchSuggestion]((id *)v38);
        uint64_t v78 = [(GEORelatedSearchSuggestion *)v76 initWithPDRelatedSearchSuggestion:v77];
        uint64_t v79 = *(void *)(a1 + 32);
        v80 = *(void **)(v79 + 72);
        *(void *)(v79 + 72) = v78;
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 112) = 0;
    -[GEOPDCategorySearchResult searchClientBehavior]((id *)v38);
    v81 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    if (v81)
    {
      char v82 = v81[20];

      if ((v82 & 2) == 0) {
        goto LABEL_86;
      }
      -[GEOPDCategorySearchResult searchClientBehavior]((id *)v38);
      v81 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      if (v81) {
        BOOL v83 = v81[17] != 0;
      }
      else {
        BOOL v83 = 0;
      }
      *(unsigned char *)(*(void *)(v302 + 32) + 112) = v83;
    }

LABEL_86:
    *(unsigned char *)(*(void *)(v302 + 32) + 113) = 0;
    if (!GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1E9111EB8)) {
      goto LABEL_93;
    }
    -[GEOPDCategorySearchResult searchClientBehavior]((id *)v38);
    v84 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    if (v84)
    {
      char v85 = v84[20];

      if ((v85 & 1) == 0) {
        goto LABEL_93;
      }
      -[GEOPDCategorySearchResult searchClientBehavior]((id *)v38);
      v84 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      if (v84) {
        BOOL v86 = v84[16] != 0;
      }
      else {
        BOOL v86 = 0;
      }
      *(unsigned char *)(*(void *)(v302 + 32) + 113) = v86;
    }

LABEL_93:
    v296 = v12;
    if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1E9111EB8))
    {
      a1 = v302;
      if (v38)
      {
        -[GEOPDCategorySearchResult _readSearchSessionData](v38);
        if (*(void *)(v38 + 136))
        {
          v87 = [GEOSearchSessionData alloc];
          v88 = -[GEOPDCategorySearchResult searchSessionData]((id *)v38);
          uint64_t v89 = [(GEOSearchSessionData *)v87 initWithSearchSessionData:v88];
          uint64_t v90 = *(void *)(v302 + 32);
          v91 = *(void **)(v90 + 280);
          *(void *)(v90 + 280) = v89;
        }
        goto LABEL_176;
      }
    }
    else
    {
      a1 = v302;
      if (v38)
      {
LABEL_176:
        -[GEOPDCategorySearchResult _readBrowseCategorys](v38);
        uint64_t v201 = [*(id *)(v38 + 32) count];
        if (v201)
        {
          v202 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v201];
          long long v317 = 0u;
          long long v318 = 0u;
          long long v319 = 0u;
          long long v320 = 0u;
          v203 = -[GEOPDCategorySearchResult browseCategorys]((id *)v38);
          uint64_t v204 = [v203 countByEnumeratingWithState:&v317 objects:v344 count:16];
          if (v204)
          {
            uint64_t v205 = v204;
            uint64_t v206 = *(void *)v318;
            do
            {
              for (junint64_t j = 0; jj != v205; ++jj)
              {
                if (*(void *)v318 != v206) {
                  objc_enumerationMutation(v203);
                }
                v208 = [[GEOSearchCategory alloc] initWithBrowseCategory:*(void *)(*((void *)&v317 + 1) + 8 * jj)];
                if (v208) {
                  [v202 addObject:v208];
                }
              }
              uint64_t v205 = [v203 countByEnumeratingWithState:&v317 objects:v344 count:16];
            }
            while (v205);
          }

          uint64_t v209 = [v202 copy];
          a1 = v302;
          uint64_t v210 = *(void *)(v302 + 32);
          v211 = *(void **)(v210 + 64);
          *(void *)(v210 + 64) = v209;

          v12 = v296;
          unint64_t v15 = 0x1E4F1C000uLL;
          uint64_t v38 = v304;
        }
      }
    }
    v212 = -[GEOPDCategorySearchResult categorySearchResultSection]((id *)v38);

    if (v212)
    {
      v213 = [GEOCategorySearchResultSection alloc];
      v214 = -[GEOPDCategorySearchResult categorySearchResultSection]((id *)v38);
      uint64_t v215 = [(GEOCategorySearchResultSection *)v213 initWithCategorySearchResultSection:v214];
      uint64_t v216 = *(void *)(a1 + 32);
      v217 = *(void **)(v216 + 168);
      *(void *)(v216 + 168) = v215;
    }
    v218 = -[GEOPDCategorySearchResult relatedEntitySections]((id *)v38);
    uint64_t v219 = [v218 count];

    if (v219)
    {
      id v295 = v7;
      v220 = (void *)MEMORY[0x1E4F1CA48];
      v221 = -[GEOPDCategorySearchResult relatedEntitySections]((id *)v38);
      v222 = objc_msgSend(v220, "arrayWithCapacity:", objc_msgSend(v221, "count"));

      long long v315 = 0u;
      long long v316 = 0u;
      long long v313 = 0u;
      long long v314 = 0u;
      v223 = -[GEOPDCategorySearchResult relatedEntitySections]((id *)v38);
      uint64_t v224 = [v223 countByEnumeratingWithState:&v313 objects:v343 count:16];
      if (v224)
      {
        uint64_t v225 = v224;
        uint64_t v226 = *(void *)v314;
        do
        {
          for (kuint64_t k = 0; kk != v225; ++kk)
          {
            if (*(void *)v314 != v226) {
              objc_enumerationMutation(v223);
            }
            uint64_t v228 = *(void *)(*((void *)&v313 + 1) + 8 * kk);
            v229 = [GEORelatedEntitySection alloc];
            v230 = [v6 mapsResults];
            v231 = [(GEORelatedEntitySection *)v229 initWithRelatedEntitySection:v228 mapsResults:v230];
            [v222 addObject:v231];
          }
          uint64_t v225 = [v223 countByEnumeratingWithState:&v313 objects:v343 count:16];
        }
        while (v225);
      }

      uint64_t v232 = [v222 copy];
      a1 = v302;
      uint64_t v233 = *(void *)(v302 + 32);
      v234 = *(void **)(v233 + 176);
      *(void *)(v233 + 176) = v232;

      id v7 = v295;
      v12 = v296;
      unint64_t v15 = 0x1E4F1C000uLL;
      uint64_t v38 = v304;
    }
    if (v38)
    {
      -[GEOPDCategorySearchResult _readAutoRedoSearchThreshold](v38);
      if (*(void *)(v38 + 24))
      {
        v235 = [GEOSearchAutoRedoThreshold alloc];
        v236 = -[GEOPDCategorySearchResult autoRedoSearchThreshold]((id *)v38);
        uint64_t v237 = [(GEOSearchAutoRedoThreshold *)v235 initWithSearchAutoRedoThreshold:v236];
        uint64_t v238 = *(void *)(a1 + 32);
        v239 = *(void **)(v238 + 208);
        *(void *)(v238 + 208) = v237;
      }
      uint64_t v240 = *(void *)(a1 + 32);
      v241 = *(void **)(v240 + 216);
      *(void *)(v240 + 216) = 0;

      -[GEOPDCategorySearchResult _readRedoButtonThreshold](v38);
      if (*(void *)(v38 + 88)
        && GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1E9111EB8))
      {
        v242 = [GEOSearchRedoButtonThreshold alloc];
        v243 = -[GEOPDCategorySearchResult redoButtonThreshold]((id *)v38);
        uint64_t v244 = [(GEOSearchRedoButtonThreshold *)v242 initWithSearchRedoButtonThreshold:v243];
        uint64_t v245 = *(void *)(a1 + 32);
        v246 = *(void **)(v245 + 216);
        *(void *)(v245 + 216) = v244;
      }
      -[GEOPDCategorySearchResult _readPlaceSummaryLayoutMetadata](v38);
      if (*(void *)(v38 + 80))
      {
        uint64_t v247 = -[GEOPDCategorySearchResult placeSummaryLayoutMetadata]((id *)v38);
        uint64_t v248 = *(void *)(a1 + 32);
        v249 = *(void **)(v248 + 224);
        *(void *)(v248 + 224) = v247;
      }
      -[GEOPDCategorySearchResult _readGuideSummaryLayoutMetadata](v38);
      v36 = v299;
      if (*(void *)(v38 + 64))
      {
        v250 = [GEOGuideSummaryLayoutMetadata alloc];
        v251 = -[GEOPDCategorySearchResult guideSummaryLayoutMetadata]((id *)v38);
        uint64_t v252 = [(GEOGuideSummaryLayoutMetadata *)v250 initWithGuideSummaryLayoutMetadata:v251];
        uint64_t v253 = *(void *)(a1 + 32);
        v254 = *(void **)(v253 + 232);
        *(void *)(v253 + 232) = v252;
      }
      -[GEOPDCategorySearchResult _readResultRefinementGroup](v38);
      if (*(void *)(v38 + 120))
      {
        v255 = [GEOResultRefinementGroup alloc];
        v256 = -[GEOPDCategorySearchResult resultRefinementGroup]((id *)v38);
        uint64_t v257 = [(GEOResultRefinementGroup *)v255 initWithResultRefinementGroup:v256];
        uint64_t v258 = *(void *)(a1 + 32);
        v259 = *(void **)(v258 + 240);
        *(void *)(v258 + 240) = v257;
      }
      -[GEOPDCategorySearchResult _readSectionList](v38);
      if (*(void *)(v38 + 152))
      {
        v260 = [GEOSearchSectionList alloc];
        v261 = -[GEOPDCategorySearchResult sectionList]((id *)v38);
        v262 = [v6 mapsResults];
        uint64_t v263 = [(GEOSearchSectionList *)v260 initWithSearchSectionList:v261 mapsResults:v262];
        uint64_t v264 = *(void *)(a1 + 32);
        v265 = *(void **)(v264 + 248);
        *(void *)(v264 + 248) = v263;
      }
      int v266 = *(_DWORD *)(v38 + 184);
      if ((v266 & 4) != 0)
      {
        *(unsigned char *)(*(void *)(a1 + 32) + 256) = *(unsigned char *)(v38 + 180);
        int v266 = *(_DWORD *)(v38 + 184);
      }
      if (v266) {
        *(_DWORD *)(*(void *)(a1 + 32) + 288) = -[GEOPDCategorySearchResult mapDisplayType]((os_unfair_lock_s *)v38);
      }
    }
    else
    {
      uint64_t v292 = *(void *)(a1 + 32);
      v293 = *(void **)(v292 + 216);
      *(void *)(v292 + 216) = 0;

      v36 = v299;
    }
    unsigned int v267 = -[GEOPDCategorySearchResult searchResultViewType]((os_unfair_lock_s *)v38);
    int v268 = v267 == 1;
    if (v267 == 2) {
      int v268 = 2;
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 260) = v268;
    if (v38) {
      char v198 = *(unsigned char *)(v38 + 182) != 0;
    }
    else {
      char v198 = 0;
    }
    uint64_t v199 = *(void *)(a1 + 32);
    uint64_t v200 = 264;
    goto LABEL_221;
  }
LABEL_245:
}

void __79___GEOPlaceRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = v2[37];
  double v5 = (double)*(uint64_t *)(a1 + 64);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79___GEOPlaceRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_3;
  v8[3] = &unk_1E53DA278;
  id v9 = *(id *)(a1 + 48);
  [v2 _processRequest:v4 auditToken:v3 timeout:v8 withHandler:0 refinedHandler:*(void *)(a1 + 56) networkActivity:v5];
  id v6 = +[GEONotificationPreferenceManager sharedManager];
  LODWORD(v2) = [v6 isEnabledForSubTestWithName:@"GEOPPTTest_PlaceRequest_RequestPreparing"];

  if (v2)
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"GEOPPTTest_PlaceRequest_RequestPreparingEND" object:0];
  }
}

void __104___GEOPlaceRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [[GEODotPlace alloc] initWithDotPlace:v3];

  [v2 addObject:v4];
}

void __79___GEOPlaceRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5 && (*(unsigned int (**)(void))(*(void *)(*(void *)(a1 + 32) + 336) + 16))())
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 336);
    *(void *)(v6 + 336) = 0;

    [*(id *)(a1 + 32) submitWithHandler:*(void *)(a1 + 48) auditToken:*(void *)(a1 + 40) timeout:*(void *)(a1 + 64) networkActivity:*(void *)(a1 + 56)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __79___GEOPlaceRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 328);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __79___GEOPlaceRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_5;
  v2[3] = &unk_1E53DA028;
  id v3 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

uint64_t __79___GEOPlaceRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8 && (*(unsigned int (**)(void))(*(void *)(*(void *)(a1 + 32) + 336) + 16))())
  {
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(void **)(v9 + 336);
    *(void *)(v9 + 336) = 0;

    [*(id *)(a1 + 32) submitWithRefinedHandler:*(void *)(a1 + 48) auditToken:*(void *)(a1 + 40) timeout:*(void *)(a1 + 64) networkActivity:*(void *)(a1 + 56)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = v2[37];
  double v5 = (double)*(uint64_t *)(a1 + 64);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke_3;
  v8[3] = &unk_1E53DA278;
  id v9 = *(id *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke_4;
  v6[3] = &unk_1E53DA278;
  id v7 = *(id *)(a1 + 48);
  [v2 _processRequest:v4 auditToken:v3 timeout:v8 withHandler:v6 refinedHandler:*(void *)(a1 + 56) networkActivity:v5];
}

uint64_t __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 328);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke_6;
  v2[3] = &unk_1E53DA028;
  id v3 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

uint64_t __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end