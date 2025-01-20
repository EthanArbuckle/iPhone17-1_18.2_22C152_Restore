@interface MapsSuggestionsRealFlightRequester
- (BOOL)requestFlightsWithFullFlightNumber:(id)a3 departureDate:(id)a4 handler:(id)a5;
- (NSString)uniqueName;
@end

@implementation MapsSuggestionsRealFlightRequester

void __45__MapsSuggestionsRealFlightRequester_session__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v0 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D020]];

  if (![(__CFString *)v5 length])
  {

    v5 = @"1.0";
  }
  v1 = (void *)[[NSString alloc] initWithFormat:@"FlightUtilities/%@", v5];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F5CBE0]) initWithId:@"com.apple.flightutilities" userAgent:v1];
  uint64_t v3 = [MEMORY[0x1E4F5CBD8] sharedPARSessionWithConfiguration:v2];
  v4 = (void *)_MergedGlobals_34;
  _MergedGlobals_34 = v3;
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (BOOL)requestFlightsWithFullFlightNumber:(id)a3 departureDate:(id)a4 handler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    v23 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealFlightRequester.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 52;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsRealFlightRequester requestFlightsWithFullFlightNumber:departureDate:handler:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v23, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    goto LABEL_19;
  }
  if (![v8 length])
  {
    v23 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealFlightRequester.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 53;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsRealFlightRequester requestFlightsWithFullFlightNumber:departureDate:handler:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "0u == fullFlightNumber.length";
      _os_log_impl(&dword_1A70DF000, v23, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a non-zero flight number", buf, 0x26u);
    }
LABEL_19:

LABEL_26:
    BOOL v22 = 0;
    goto LABEL_27;
  }
  v11 = GEOFindOrCreateLog();
  v12 = v11;
  if (!v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealFlightRequester.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 54;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsRealFlightRequester requestFlightsWithFullFlightNumber:departureDate:handler:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (departureDate)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a departure date", buf, 0x26u);
    }

    goto LABEL_26;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "requestFlightsFor(%@ %@)", buf, 0x16u);
  }

  v13 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = [(MapsSuggestionsRealFlightRequester *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "requestFlightsFor";
    _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  v15 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "requestFlightsFor", "", buf, 2u);
  }

  objc_initWeak(&location, self);
  v16 = (void *)MEMORY[0x1E4F5CBB0];
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = ___MapsSuggestionsBundle_block_invoke_4;
  *(void *)&buf[24] = &__block_descriptor_40_e5_v8__0l;
  *(void *)&buf[32] = "RealFlightRequester";
  if (qword_1EB6F01C0 != -1) {
    dispatch_once(&qword_1EB6F01C0, buf);
  }
  id v17 = (id)qword_1EB6F01B8;
  v18 = [v17 bundleIdentifier];
  v19 = [v16 flightRequestForQuery:v8 date:v9 appBundleId:v18];

  if (self)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __45__MapsSuggestionsRealFlightRequester_session__block_invoke;
    *(void *)&buf[24] = &unk_1E5CB8D10;
    *(void *)&buf[32] = self;
    if (qword_1EB6F01B0 != -1) {
      dispatch_once(&qword_1EB6F01B0, buf);
    }
    id v20 = (id)_MergedGlobals_34;
  }
  else
  {
    id v20 = 0;
  }
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __95__MapsSuggestionsRealFlightRequester_requestFlightsWithFullFlightNumber_departureDate_handler___block_invoke;
  v28 = &unk_1E5CB8D38;
  objc_copyWeak(&v31, &location);
  id v30 = v10;
  id v29 = v8;
  v21 = [v20 taskWithRequest:v19 completion:&v25];

  objc_msgSend(v21, "resume", v25, v26, v27, v28);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&location);
  BOOL v22 = 1;
LABEL_27:

  return v22;
}

void __95__MapsSuggestionsRealFlightRequester_requestFlightsWithFullFlightNumber_departureDate_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  *(void *)&v27[13] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v9)
    {
      v11 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v24 = 138412290;
        uint64_t v25 = v9;
        _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "Error requesting flights: %@", (uint8_t *)&v24, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = [WeakRetained uniqueName];
        int v24 = 138412546;
        uint64_t v25 = v13;
        __int16 v26 = 2080;
        *(void *)v27 = "requestFlightsFor";
        _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v24, 0x16u);
      }
      v14 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v14))
      {
        LOWORD(v24) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "requestFlightsFor", "", (uint8_t *)&v24, 2u);
      }
      goto LABEL_25;
    }
    v14 = [v8 flightResults];
    if (v14)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      v15 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = [WeakRetained uniqueName];
        int v24 = 138412546;
        uint64_t v25 = v16;
        __int16 v26 = 2080;
        *(void *)v27 = "requestFlightsFor";
        _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v24, 0x16u);
      }
      id v17 = GEOFindOrCreateLog();
      if (!os_signpost_enabled(v17)) {
        goto LABEL_24;
      }
      LOWORD(v24) = 0;
    }
    else
    {
      v18 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = *(char **)(a1 + 32);
        int v24 = 138412290;
        uint64_t v25 = v19;
        _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, "No results for Flight %@", (uint8_t *)&v24, 0xCu);
      }

      uint64_t v20 = *(void *)(a1 + 40);
      v21 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:@"No flight results were found"];
      (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v21);

      BOOL v22 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = [WeakRetained uniqueName];
        int v24 = 138412546;
        uint64_t v25 = v23;
        __int16 v26 = 2080;
        *(void *)v27 = "requestFlightsFor";
        _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v24, 0x16u);
      }
      id v17 = GEOFindOrCreateLog();
      if (!os_signpost_enabled(v17)) {
        goto LABEL_24;
      }
      LOWORD(v24) = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "requestFlightsFor", "", (uint8_t *)&v24, 2u);
LABEL_24:

    goto LABEL_25;
  }
  GEOFindOrCreateLog();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v24 = 136446722;
    uint64_t v25 = "MapsSuggestionsRealFlightRequester.m";
    __int16 v26 = 1026;
    *(_DWORD *)v27 = 67;
    v27[2] = 2082;
    *(void *)&v27[3] = "-[MapsSuggestionsRealFlightRequester requestFlightsWithFullFlightNumber:departureDate:handler:]_block_invoke";
    _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v24, 0x1Cu);
  }

LABEL_25:
}

@end