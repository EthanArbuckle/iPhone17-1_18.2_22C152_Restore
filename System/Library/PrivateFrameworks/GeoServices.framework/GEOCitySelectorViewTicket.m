@interface GEOCitySelectorViewTicket
@end

@implementation GEOCitySelectorViewTicket

void __64___GEOCitySelectorViewTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v7 = [v5 globalResult];
    if (v7)
    {
      v8 = (void *)v7;
      -[GEOPDPlaceGlobalResult _readAllGuidesLocationsViewresult](v7);
      uint64_t v9 = v8[7];

      if (v9)
      {
        uint64_t v10 = [v5 globalResult];
        v11 = (void *)v10;
        if (v10 && (-[GEOPDPlaceGlobalResult _readAllGuidesLocationsViewresult](v10), v11[7]))
        {
          v12 = [v5 mapsResults];

          if (v12)
          {
            v13 = [GEOAllGuidesLocationsViewResult alloc];
            v14 = [v5 globalResult];
            v15 = -[GEOPDPlaceGlobalResult allGuidesLocationsViewresult](v14);
            v16 = [v5 mapsResults];
            v17 = [(GEOAllGuidesLocationsViewResult *)v13 initWithAllGuidesLocationsViewResult:v15 mapsResults:v16];

            if (v17)
            {
              v18 = 0;
LABEL_15:
              (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

              goto LABEL_16;
            }
            v19 = GEOGetGEOCitySelectorViewLookupLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v24) = 0;
              _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_ERROR, "Request for a City Selector view returned invalid data.", (uint8_t *)&v24, 2u);
            }
            v23 = @"Couldn't initialize view result.";
LABEL_14:

            v18 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:v23];
            v17 = 0;
            goto LABEL_15;
          }
        }
        else
        {
        }
        v19 = GEOGetGEOCitySelectorViewLookupLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = [v5 globalResult];
          v21 = -[GEOPDPlaceGlobalResult allGuidesLocationsViewresult](v20);
          v22 = [v5 mapsResults];
          int v24 = 138412546;
          v25 = v21;
          __int16 v26 = 2048;
          uint64_t v27 = [v22 count];
          _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_ERROR, "Request for a City Selector view returned invalid data. hasAllGuidesLocationsViewresult: %@. MapResults count: %lu", (uint8_t *)&v24, 0x16u);
        }
        v23 = @"No publisher result in response.";
        goto LABEL_14;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_16:
}

@end