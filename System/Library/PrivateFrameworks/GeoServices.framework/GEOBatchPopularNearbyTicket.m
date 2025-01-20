@interface GEOBatchPopularNearbyTicket
@end

@implementation GEOBatchPopularNearbyTicket

void __77___GEOBatchPopularNearbyTicket_submitWithHandler_auditToken_networkActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = [v5 globalResult];
    -[GEOPDPlaceGlobalResult batchPopularNearbySearchResult](v7);
    v8 = (id *)objc_claimAutoreleasedReturnValue();

    if (v8) {
      uint64_t v9 = [v8[2] count];
    }
    else {
      uint64_t v9 = 0;
    }
    if (v9 == [*(id *)(*(void *)(a1 + 32) + 64) count])
    {
      uint64_t v10 = [v6 requestType];
      v11 = [v6 resultsWithResultType:1];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __77___GEOBatchPopularNearbyTicket_submitWithHandler_auditToken_networkActivity___block_invoke_2;
      v16[3] = &unk_1E53DE550;
      id v12 = *(id *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 32);
      id v18 = v12;
      v16[4] = v13;
      v17 = v8;
      _attributedGeoMapItemsForPlaceDatasWithHandler(v10, v11, 0, 0, 0, 0, v16);
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 40);
      v15 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Should get back the same number of batch results as we had input categories"];
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
    }
  }
}

void __77___GEOBatchPopularNearbyTicket_submitWithHandler_auditToken_networkActivity___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v27 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v23 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
    if ([*(id *)(*(void *)(a1 + 32) + 64) count])
    {
      uint64_t v6 = 0;
      uint64_t v22 = a1;
      do
      {
        v7 = -[GEOPDBatchPopularNearbySearchResult popularNearbyResultAtIndex:](*(id **)(a1 + 40), v6);
        v24 = [*(id *)(*(void *)(a1 + 32) + 64) objectAtIndexedSubscript:v6];
        uint64_t v25 = v6;
        v8 = (void *)MEMORY[0x1E4F1CA48];
        if (v7)
        {
          -[GEOPDPopularNearbyResult _readLitePlaceResults]((uint64_t)v7);
          uint64_t v9 = v7[4];
        }
        else
        {
          uint64_t v9 = 0;
        }
        v26 = [v8 arrayWithCapacity:v9];
        unint64_t v10 = 0;
        if (v7)
        {
LABEL_8:
          -[GEOPDPopularNearbyResult _readLitePlaceResults]((uint64_t)v7);
          unint64_t v11 = v7[4];
          goto LABEL_9;
        }
        while (1)
        {
          unint64_t v11 = 0;
LABEL_9:
          if (v10 >= v11) {
            break;
          }
          uint64_t v12 = -[GEOPDPopularNearbyResult litePlaceResultAtIndex:]((uint64_t)v7, v10);
          if ((~v13 & 0x300000000) == 0)
          {
            uint64_t v14 = v12;
            int v15 = v13;
            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            id v16 = v27;
            uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v29;
              while (2)
              {
                for (uint64_t i = 0; i != v18; ++i)
                {
                  if (*(void *)v29 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
                  if ([v21 _muid] == v14 && objc_msgSend(v21, "_resultProviderID") == v15)
                  {
                    [v26 addObject:v21];
                    goto LABEL_22;
                  }
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
                if (v18) {
                  continue;
                }
                break;
              }
            }
LABEL_22:
          }
          ++v10;
          if (v7) {
            goto LABEL_8;
          }
        }
        [v23 setObject:v26 forKey:v24];

        uint64_t v6 = v25 + 1;
        a1 = v22;
      }
      while (v25 + 1 < (unint64_t)[*(id *)(*(void *)(v22 + 32) + 64) count]);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    id v5 = 0;
  }
}

@end