@interface GEOGuideHomeViewTicket
@end

@implementation GEOGuideHomeViewTicket

void __61___GEOGuideHomeViewTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v7 = [v5 globalResult];
    if (v7)
    {
      v8 = (void *)v7;
      -[GEOPDPlaceGlobalResult _readGuidesHomeResult](v7);
      uint64_t v9 = v8[25];

      if (v9)
      {
        uint64_t v10 = [v5 globalResult];
        v11 = (void *)v10;
        if (v10 && (-[GEOPDPlaceGlobalResult _readGuidesHomeResult](v10), v11[25]))
        {
          v12 = [v5 mapsResults];
          uint64_t v13 = [v12 count];

          if (v13)
          {
            v14 = [GEOGuidesHomeResult alloc];
            v15 = [v5 globalResult];
            v16 = -[GEOPDPlaceGlobalResult guidesHomeResult](v15);
            v17 = [v5 mapsResults];
            v18 = [(GEOGuidesHomeResult *)v14 initWithGuidesHomeFixedSection:v16 mapsResults:v17];

            v19 = 0;
LABEL_15:
            (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

            goto LABEL_16;
          }
        }
        else
        {
        }
        if (qword_1E9117EE8 != -1) {
          dispatch_once(&qword_1E9117EE8, &__block_literal_global_11_0);
        }
        v20 = (id)qword_1E9117EE0;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "Request for a Guide Home contained invalid response.", v21, 2u);
        }

        v19 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Either guidesHomeResult or mapsResult are missing in the response."];
        v18 = 0;
        goto LABEL_15;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_16:
}

@end