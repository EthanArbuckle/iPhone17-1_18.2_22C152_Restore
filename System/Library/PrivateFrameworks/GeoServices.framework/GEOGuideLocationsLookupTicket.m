@interface GEOGuideLocationsLookupTicket
@end

@implementation GEOGuideLocationsLookupTicket

void __68___GEOGuideLocationsLookupTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__19;
    v27 = __Block_byref_object_dispose__19;
    id v28 = 0;
    v7 = [v5 mapsResults];
    uint64_t v8 = [v7 count];
    if (v8 == [*(id *)(*(void *)(a1 + 32) + 64) count])
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __68___GEOGuideLocationsLookupTicket_submitWithHandler_networkActivity___block_invoke_1151;
      v22[3] = &unk_1E53DECE0;
      v22[4] = &v23;
      [v7 enumerateObjectsUsingBlock:v22];
    }
    else
    {
      v9 = NSString;
      uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 64) count];
      v11 = [v5 mapsResults];
      v12 = objc_msgSend(v9, "stringWithFormat:", @"Batch Request for a City Selector view returned invalid data. guideLocationEntries count: %lu. MapResults count: %lu", v10, objc_msgSend(v11, "count"));

      v13 = GEOGetGEOCitySelectorViewLookupLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v12;
        _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
      }

      uint64_t v14 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:v12];
      v15 = (void *)v24[5];
      v24[5] = v14;
    }
    v16 = +[GEOGuideLocation guideLocationsForEntries:*(void *)(*(void *)(a1 + 32) + 64) mapsResults:v7];
    uint64_t v17 = [v16 count];
    if (v17 != [*(id *)(*(void *)(a1 + 32) + 64) count])
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Batch Request for a City Selector view could not initialize some guide locations. Expected Count: %lu. Actual Count: %lu", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "count"), objc_msgSend(v16, "count"));
      v19 = GEOGetGEOCitySelectorViewLookupLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v18;
        _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_ERROR, "Error : %@", buf, 0xCu);
      }

      uint64_t v20 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:v18];
      v21 = (void *)v24[5];
      v24[5] = v20;

      v16 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    _Block_object_dispose(&v23, 8);
  }
}

void __68___GEOGuideLocationsLookupTicket_submitWithHandler_networkActivity___block_invoke_1151(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if ([v6 resultType] != 1 || (objc_msgSend(v6, "hasPlace") & 1) == 0)
  {
    v7 = [NSString stringWithFormat:@"Batch Request for a City Selector view returned a maps result without a place or invalid type. MapResults: %@", v6];
    uint64_t v8 = GEOGetGEOCitySelectorViewLookupLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "Error : %@", buf, 0xCu);
    }

    uint64_t v9 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:v7];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

@end