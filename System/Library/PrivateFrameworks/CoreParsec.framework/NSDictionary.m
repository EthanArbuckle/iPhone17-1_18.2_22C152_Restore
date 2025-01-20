@interface NSDictionary
@end

@implementation NSDictionary

id __54__NSDictionary_SFExtras__sf_asTextColumnsCardSection___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F9A4C8];
  id v3 = a2;
  id v4 = objc_alloc_init(v2);
  v5 = objc_msgSend(v3, "parsec_mapAndFilterObjectsUsingBlock:", &__block_literal_global_912);

  [v4 setSections:v5];

  return v4;
}

id __54__NSDictionary_SFExtras__sf_asTextColumnsCardSection___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F9A4D0];
  id v3 = a2;
  id v4 = objc_alloc_init(v2);
  v5 = objc_msgSend(v3, "parsec_arrayForKey:", @"text_lines");
  [v4 setTextLines:v5];

  objc_msgSend(v4, "setTextNoWrap:", objc_msgSend(v3, "parsec_BOOLForKey:", @"text_nowrap"));
  v6 = objc_msgSend(v3, "parsec_numberForKey:", @"text_weight");

  if (v6) {
    uint64_t v7 = [v6 integerValue];
  }
  else {
    uint64_t v7 = -1;
  }
  [v4 setTextWeight:v7];

  return v4;
}

uint64_t __54__NSDictionary_SFExtras__sf_asDetailedRowCardSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asRichText:", *(void *)(a1 + 32));
}

uint64_t __51__NSDictionary_SFExtras__sf_asTableRowCardSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asFormattedText:", *(void *)(a1 + 32));
}

id __51__NSDictionary_SFExtras__sf_asTableAlignmentSchema__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)MEMORY[0x1E4F9A4A8];
  id v6 = a2;
  id v7 = objc_alloc_init(v5);
  v8 = [NSString stringWithString:v6];

  if ([v8 isEqualToString:@"right"])
  {
    v9 = v7;
    uint64_t v10 = 2;
LABEL_7:
    [v9 setColumnAlignment:v10];
    goto LABEL_8;
  }
  if ([v8 isEqualToString:@"left"])
  {
    v9 = v7;
    uint64_t v10 = 0;
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"center"])
  {
    v9 = v7;
    uint64_t v10 = 1;
    goto LABEL_7;
  }
  [v7 setColumnAlignment:0];
  if (PARLogHandleForCategory_onceToken_364 != -1) {
    dispatch_once(&PARLogHandleForCategory_onceToken_364, &__block_literal_global_1085);
  }
  v15 = PARLogHandleForCategory_logHandles_1_365;
  if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_365, OS_LOG_TYPE_ERROR))
  {
    int v21 = 138412290;
    unint64_t v22 = (unint64_t)v8;
    _os_log_error_impl(&dword_19C7E7000, v15, OS_LOG_TYPE_ERROR, "unknown table alignment schema column_align: %@", (uint8_t *)&v21, 0xCu);
  }
LABEL_8:
  if ([*(id *)(a1 + 32) count] > a3)
  {
    v11 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    if ([v11 isEqualToString:@"center"])
    {
      v12 = v7;
      uint64_t v13 = 1;
    }
    else if ([v11 isEqualToString:@"right"])
    {
      v12 = v7;
      uint64_t v13 = 2;
    }
    else
    {
      if (![v11 isEqualToString:@"left"])
      {
        [v7 setColumnAlignment:0];
        if (PARLogHandleForCategory_onceToken_364 != -1) {
          dispatch_once(&PARLogHandleForCategory_onceToken_364, &__block_literal_global_1085);
        }
        v20 = PARLogHandleForCategory_logHandles_1_365;
        if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_365, OS_LOG_TYPE_ERROR))
        {
          int v21 = 138412290;
          unint64_t v22 = (unint64_t)v11;
          _os_log_error_impl(&dword_19C7E7000, v20, OS_LOG_TYPE_ERROR, "unknown table alignment schema within_column_align: %@", (uint8_t *)&v21, 0xCu);
        }
        goto LABEL_24;
      }
      v12 = v7;
      uint64_t v13 = 0;
    }
    [v12 setDataAlignment:v13];
LABEL_24:

    goto LABEL_25;
  }
  [v7 setColumnAlignment:0];
  if (PARLogHandleForCategory_onceToken_364 != -1) {
    dispatch_once(&PARLogHandleForCategory_onceToken_364, &__block_literal_global_1085);
  }
  v14 = PARLogHandleForCategory_logHandles_1_365;
  if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_365, OS_LOG_TYPE_ERROR))
  {
    int v21 = 134217984;
    unint64_t v22 = a3;
    _os_log_error_impl(&dword_19C7E7000, v14, OS_LOG_TYPE_ERROR, "missing table alignment schema within_column_align[%lu]", (uint8_t *)&v21, 0xCu);
  }
LABEL_25:
  [v7 setIsEqualWidth:0];
  v16 = *(void **)(a1 + 40);
  if (v16)
  {
    if ([v16 count] <= a3)
    {
      if (PARLogHandleForCategory_onceToken_364 != -1) {
        dispatch_once(&PARLogHandleForCategory_onceToken_364, &__block_literal_global_1085);
      }
      v18 = PARLogHandleForCategory_logHandles_1_365;
      if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_365, OS_LOG_TYPE_ERROR))
      {
        int v21 = 134217984;
        unint64_t v22 = a3;
        _os_log_error_impl(&dword_19C7E7000, v18, OS_LOG_TYPE_ERROR, "missing table alignment schema equal_width[%lu]", (uint8_t *)&v21, 0xCu);
      }
    }
    else
    {
      v17 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
      objc_msgSend(v7, "setIsEqualWidth:", objc_msgSend(v17, "BOOLValue"));
    }
  }

  return v7;
}

id __55__NSDictionary_SFExtras__sf_asKeyValueDataCardSection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = (objc_class *)MEMORY[0x1E4F9A178];
  id v6 = a2;
  id v7 = objc_alloc_init(v5);
  [v7 setKey:v6];

  v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v7 setValue:v8];

  return v7;
}

uint64_t __53__NSDictionary_SFExtras__sf_asNowPlayingCardSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asMediaItem:", *(void *)(a1 + 32));
}

id __53__NSDictionary_SFExtras__sf_asScoreboardCardSection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F9A440];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  id v6 = objc_msgSend(v4, "sf_imageForKey:reply:", @"image", *(void *)(a1 + 32));
  [v5 setLogo:v6];

  id v7 = objc_msgSend(v4, "parsec_stringForKey:", @"label");
  [v5 setRecord:v7];

  v8 = objc_msgSend(v4, "parsec_stringForKey:", @"readable_string");
  [v5 setAccessibilityDescription:v8];

  v9 = objc_msgSend(v4, "parsec_stringForKey:", @"name");

  [v5 setName:v9];

  return v5;
}

uint64_t __58__NSDictionary_SFExtras__sf_asSocialMediaPostCardSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asFormattedText:", *(void *)(a1 + 32));
}

uint64_t __54__NSDictionary_SFExtras__sf_asMediaPlayerCardSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asMediaItem:", *(void *)(a1 + 32));
}

uint64_t __52__NSDictionary_SFExtras__sf_asMediaInfoCardSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asMediaDetail:", *(void *)(a1 + 32));
}

uint64_t __52__NSDictionary_SFExtras__sf_asMediaInfoCardSection___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asMediaOffer:", *(void *)(a1 + 32));
}

uint64_t __41__NSDictionary_SFExtras__sf_asMediaItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "parsec_URLForKey:", a2);
}

uint64_t __41__NSDictionary_SFExtras__sf_asMediaItem___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asImage:", *(void *)(a1 + 32));
}

uint64_t __41__NSDictionary_SFExtras__sf_asMediaItem___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asMediaOffer:", *(void *)(a1 + 32));
}

uint64_t __52__NSDictionary_SFExtras__sf_asTrackListCardSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asTrack:", *(void *)(a1 + 32));
}

uint64_t __50__NSDictionary_SFExtras__sf_asAppLinkCardSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asAppLink:", *(void *)(a1 + 32));
}

uint64_t __52__NSDictionary_SFExtras__sf_asRichTitleCardSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asImage:", *(void *)(a1 + 32));
}

uint64_t __52__NSDictionary_SFExtras__sf_asRichTitleCardSection___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asMediaOffer:", *(void *)(a1 + 32));
}

id __51__NSDictionary_SFExtras__sf_baseCardSection_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "sf_asPunchout:", *(void *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "parsec_stringForKey:", @"action_target_id");
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v4 length]) {
    id v5 = v4;
  }
  else {
    id v5 = @"open";
  }
  [v3 setActionTarget:v5];

  return v3;
}

id __37__NSDictionary_SFExtras__sf_asFlight__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F9A0D0]);
  id v4 = objc_msgSend(v2, "parsec_numberForKey:", @"status");
  objc_msgSend(v3, "setStatus:", objc_msgSend(v4, "integerValue"));

  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = objc_msgSend(v2, "parsec_numberForKey:", @"departure_published_time");
  id v7 = objc_msgSend(v5, "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v6, "intValue"));
  [v3 setDeparturePublishedTime:v7];

  v8 = (void *)MEMORY[0x1E4F1C9C8];
  v9 = objc_msgSend(v2, "parsec_numberForKey:", @"departure_actual_time");
  uint64_t v10 = objc_msgSend(v8, "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v9, "intValue"));
  [v3 setDepartureActualTime:v10];

  v11 = objc_msgSend(v2, "parsec_stringForKey:", @"departure_terminal");
  [v3 setDepartureTerminal:v11];

  v12 = objc_msgSend(v2, "parsec_stringForKey:", @"departure_gate");
  [v3 setDepartureGate:v12];

  uint64_t v13 = (void *)MEMORY[0x1E4F1C9C8];
  v14 = objc_msgSend(v2, "parsec_numberForKey:", @"departure_gate_closed");
  v15 = objc_msgSend(v13, "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v14, "intValue"));
  [v3 setDepartureGateClosedTime:v15];

  v16 = (void *)MEMORY[0x1E4F1C9C8];
  v17 = objc_msgSend(v2, "parsec_numberForKey:", @"departure_runway");
  v18 = objc_msgSend(v16, "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v17, "intValue"));
  [v3 setDepartureRunwayTime:v18];

  v19 = objc_msgSend(v2, "parsec_dictionaryForKey:", @"departure_airport");
  v20 = objc_msgSend(v19, "sf_asAirport");
  [v3 setDepartureAirport:v20];

  int v21 = (void *)MEMORY[0x1E4F1C9C8];
  unint64_t v22 = objc_msgSend(v2, "parsec_numberForKey:", @"arrival_published_time");
  uint64_t v23 = objc_msgSend(v21, "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v22, "intValue"));
  [v3 setArrivalPublishedTime:v23];

  v24 = (void *)MEMORY[0x1E4F1C9C8];
  v25 = objc_msgSend(v2, "parsec_numberForKey:", @"arrival_actual_time");
  v26 = objc_msgSend(v24, "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v25, "intValue"));
  [v3 setArrivalActualTime:v26];

  v27 = objc_msgSend(v2, "parsec_stringForKey:", @"arrival_terminal");
  [v3 setArrivalTerminal:v27];

  v28 = objc_msgSend(v2, "parsec_stringForKey:", @"arrival_gate");
  [v3 setArrivalGate:v28];

  v29 = objc_msgSend(v2, "parsec_stringForKey:", @"baggage_claim");
  [v3 setBaggageClaim:v29];

  v30 = (void *)MEMORY[0x1E4F1C9C8];
  v31 = objc_msgSend(v2, "parsec_numberForKey:", @"arrival_runway");
  v32 = objc_msgSend(v30, "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v31, "intValue"));
  [v3 setArrivalRunwayTime:v32];

  v33 = (void *)MEMORY[0x1E4F1C9C8];
  v34 = objc_msgSend(v2, "parsec_numberForKey:", @"gate_arrival");
  v35 = objc_msgSend(v33, "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v34, "intValue"));
  [v3 setArrivalGateTime:v35];

  v36 = objc_msgSend(v2, "parsec_dictionaryForKey:", @"arrival_airport");
  v37 = objc_msgSend(v36, "sf_asAirport");
  [v3 setArrivalAirport:v37];

  v38 = objc_msgSend(v2, "parsec_dictionaryForKey:", @"diverted_airport");
  v39 = v38;
  if (v38)
  {
    v40 = objc_msgSend(v38, "sf_asAirport");
    [v3 setDivertedAirport:v40];
  }
  v41 = objc_msgSend(v2, "parsec_stringForKey:", @"title");
  [v3 setTitle:v41];

  return v3;
}

uint64_t __40__NSDictionary_SFExtras__sf_asRichText___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asImage:", *(void *)(a1 + 32));
}

uint64_t __40__NSDictionary_SFExtras__sf_asRichText___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asFormattedText:", *(void *)(a1 + 32));
}

uint64_t __52__NSDictionary_SFExtras__sf_asSearchResult_factory___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asRichText:", *(void *)(a1 + 32));
}

uint64_t __52__NSDictionary_SFExtras__sf_asSearchResult_factory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F1CB10] URLWithString:a2];
}

@end