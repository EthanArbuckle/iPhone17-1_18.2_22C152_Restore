@interface GEOPublisherViewTicket
@end

@implementation GEOPublisherViewTicket

void __61___GEOPublisherViewTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v7 = [v5 globalResult];
    if (v7)
    {
      v8 = (void *)v7;
      -[GEOPDPlaceGlobalResult _readPublisherViewResult](v7);
      uint64_t v9 = v8[41];

      if (v9)
      {
        uint64_t v10 = [v5 globalResult];
        v11 = (void *)v10;
        if (v10 && (-[GEOPDPlaceGlobalResult _readPublisherViewResult](v10), v11[41]))
        {
          v12 = [v5 globalResult];
          -[GEOPDPlaceGlobalResult publisherViewResult](v12);
          v13 = (id *)objc_claimAutoreleasedReturnValue();
          v14 = -[GEOPDPublisherViewResult resultFilters](v13);

          if (v14)
          {
            id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v16 = [v5 mapsResults];
            v48[0] = MEMORY[0x1E4F143A8];
            v48[1] = 3221225472;
            v48[2] = __61___GEOPublisherViewTicket_submitWithHandler_networkActivity___block_invoke_2;
            v48[3] = &unk_1E53D78A8;
            id v49 = v15;
            id v17 = v15;
            [v16 enumerateObjectsUsingBlock:v48];

            v18 = [GEOPublisherViewResult alloc];
            v19 = [v5 globalResult];
            v20 = -[GEOPDPlaceGlobalResult publisherViewResult](v19);
            v21 = [(GEOPublisherViewResult *)v18 initWithPublisherViewResult:v20 withPlaces:v17];

            goto LABEL_16;
          }
        }
        else
        {
        }
        uint64_t v22 = [v5 globalResult];
        v23 = (void *)v22;
        if (v22 && (-[GEOPDPlaceGlobalResult _readPublisherViewResult](v22), v23[41]))
        {
          v24 = [v5 globalResult];
          -[GEOPDPlaceGlobalResult publisherViewResult](v24);
          v25 = (id *)objc_claimAutoreleasedReturnValue();
          v26 = -[GEOPDPublisherViewResult collectionIds](v25);
          uint64_t v27 = [v26 count];

          if (v27)
          {
            v28 = [GEOPublisherViewResult alloc];
            v29 = [v5 globalResult];
            v30 = -[GEOPDPlaceGlobalResult publisherViewResult](v29);
            v21 = [(GEOPublisherViewResult *)v28 initWithPublisherViewResult:v30];

            goto LABEL_16;
          }
        }
        else
        {
        }
        v21 = 0;
LABEL_16:
        v31 = +[GEOCollectionResult collectionResultsFromResponse:v5];
        v32 = [v5 mapsResults];
        v33 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1082];
        v34 = [v32 filteredArrayUsingPredicate:v33];

        if ([v34 count])
        {
          if ((unint64_t)[v34 count] < 2)
          {
            v41 = [v34 firstObject];
            v42 = [GEOPublisherResult alloc];
            v43 = [v41 publisher];
            v44 = [(GEOPublisherResult *)v42 initWithPublisherResult:v43];

            if (v44)
            {
              uint64_t v45 = *(void *)(a1 + 32);
              v46 = (void *)[v31 copy];
              (*(void (**)(uint64_t, GEOPublisherViewResult *, void *, GEOPublisherResult *, void))(v45 + 16))(v45, v21, v46, v44, 0);
            }
            else
            {
              v47 = GEOGetGEOPublisherViewLookupLog();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_188D96000, v47, OS_LOG_TYPE_ERROR, "Request for a publisher view returned nil publisher", buf, 2u);
              }

              v46 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"No publisher result in response."];
              (*(void (**)(void, void, void, void, void *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, 0, 0, v46);
            }

            goto LABEL_31;
          }
          v35 = GEOGetGEOPublisherViewLookupLog();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            uint64_t v36 = [v34 count];
            *(_DWORD *)buf = 134218240;
            uint64_t v51 = v36;
            __int16 v52 = 1024;
            int v53 = 1;
            _os_log_impl(&dword_188D96000, v35, OS_LOG_TYPE_ERROR, "Request for a publisher view contained more than one publishers in response: %lu expected: %d", buf, 0x12u);
          }

          v37 = (void *)MEMORY[0x1E4F28C58];
          v38 = @"Multiple publishers in response.";
        }
        else
        {
          v39 = GEOGetGEOPublisherViewLookupLog();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            uint64_t v40 = [v34 count];
            *(_DWORD *)buf = 134218240;
            uint64_t v51 = v40;
            __int16 v52 = 1024;
            int v53 = 1;
            _os_log_impl(&dword_188D96000, v39, OS_LOG_TYPE_ERROR, "Request for a publisher view contained no publishers in response: %lu expected: %d", buf, 0x12u);
          }

          v37 = (void *)MEMORY[0x1E4F28C58];
          v38 = @"No publishers in response.";
        }
        v41 = [v37 GEOErrorWithCode:-11 reason:v38];
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_31:

        goto LABEL_32;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_32:
}

void __61___GEOPublisherViewTicket_submitWithHandler_networkActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 resultType] == 1)
  {
    if ([v7 hasPlace])
    {
      v3 = [v7 place];
      int v4 = [v3 status];

      if (!v4)
      {
        id v5 = *(void **)(a1 + 32);
        id v6 = [v7 place];
        [v5 addObject:v6];
      }
    }
  }
}

BOOL __61___GEOPublisherViewTicket_submitWithHandler_networkActivity___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 resultType] == 3;
}

@end