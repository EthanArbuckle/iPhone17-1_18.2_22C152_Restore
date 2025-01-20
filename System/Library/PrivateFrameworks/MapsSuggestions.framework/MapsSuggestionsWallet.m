@interface MapsSuggestionsWallet
+ (BOOL)isAvailable;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (MapsSuggestionsWallet)initWithConnector:(id)a3 network:(id)a4;
- (NSString)uniqueName;
- (char)entriesFromPassesBefore:(id)a3 handler:(id)a4;
- (char)hasExpressPaymentCardWithHandler:(id)a3;
- (char)hasPaymentCardWithHandler:(id)a3;
- (char)hasTransitPassWithHandler:(id)a3;
- (id).cxx_construct;
- (id)connector;
- (id)initFromResourceDepot:(id)a3;
- (void)_q_readPassesWithHandler:(void *)a3 withEndDate:;
- (void)passKitDidChange:(id)a3;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation MapsSuggestionsWallet

void __57__MapsSuggestionsWallet_entriesFromPassesBefore_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  -[MapsSuggestionsWallet _q_readPassesWithHandler:withEndDate:](v3, *(void **)(a1 + 40), *(void **)(a1 + 32));
  GEOFindOrCreateLog();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = [(dispatch_queue_t *)v3 uniqueName];
    int v7 = 138412546;
    v8 = v5;
    __int16 v9 = 2080;
    v10 = "entriesFromPassesBefore:handler:";
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v7, 0x16u);
  }
  v6 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v6))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "entriesFromPassesBefore:handler:", "", (uint8_t *)&v7, 2u);
  }
}

void __58__MapsSuggestionsWallet_hasExpressPaymentCardWithHandler___block_invoke(uint64_t a1, id *a2)
{
  v3 = -[MapsSuggestionsWallet connector](a2);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v6 = v3;
    v5 = [v3 defaultPass];
    (*(void (**)(uint64_t, uint64_t, void))(v4 + 16))(v4, [v6 expressSupportedByPass:v5], 0);

    v3 = v6;
  }
}

void __51__MapsSuggestionsWallet_hasPaymentCardWithHandler___block_invoke(uint64_t a1, id *a2)
{
  v3 = -[MapsSuggestionsWallet connector](a2);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v6 = v3;
    v5 = [v3 defaultPass];
    (*(void (**)(uint64_t, BOOL, void))(v4 + 16))(v4, v5 != 0, 0);

    v3 = v6;
  }
}

- (id)connector
{
  if (a1)
  {
    a1 = (id *)a1[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

void __51__MapsSuggestionsWallet_hasTransitPassWithHandler___block_invoke(uint64_t a1, id *a2)
{
  v3 = -[MapsSuggestionsWallet connector](a2);
  uint64_t v4 = [v3 passesOfType:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___ZL19_passesWithCardType17PKPaymentCardTypeP34MapsSuggestionsRealWalletConnector_block_invoke;
  v7[3] = &__block_descriptor_40_e8_B16__0_8l;
  v7[4] = 2;
  v5 = objc_msgSend(v4, "MSg_copyIf:", v7);

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, BOOL, void))(v6 + 16))(v6, [v5 count] != 0, 0);
  }
}

- (void)_q_readPassesWithHandler:(void *)a3 withEndDate:
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v101 = a2;
  id v5 = a3;
  if (a1)
  {
    id v103 = v5;
    dispatch_assert_queue_V2(a1[1]);
    val = a1;
    GEOFindOrCreateLog();
    uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = [(dispatch_queue_t *)a1 uniqueName];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "_q_readPassesWithHandler";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    v8 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_q_readPassesWithHandler", "", buf, 2u);
    }

    objc_initWeak(&location, val);
    group = dispatch_group_create();
    id v104 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    __int16 v9 = v103;
    if (v103)
    {
      v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v103;
        _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "endDate for the request is non-nil: %@", buf, 0xCu);
      }

      __int16 v9 = v103;
    }
    GEOConfigGetDouble();
    v100 = MapsSuggestionsNowWithOffset((double)-(uint64_t)(v11 * 1000000000.0) / 1000000000.0);
    if (v9)
    {
      id v12 = v9;
    }
    else
    {
      GEOConfigGetDouble();
      MapsSuggestionsNowWithOffset((double)(uint64_t)(v13 * 1000000000.0) / 1000000000.0);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v12;
    id v15 = v100;
    id v99 = v14;
    v111 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v15 endDate:v99];
    v102 = v15;

    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v111;
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "Looking for passes in window %@", buf, 0xCu);
    }

    v98 = (void *)MEMORY[0x1AD0C8E80]();
    [val[3] passesOfType:0];
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [obj countByEnumeratingWithState:&v125 objects:v130 count:16];
    if (v17)
    {
      uint64_t v116 = *(void *)v126;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v126 != v116) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(id *)(*((void *)&v125 + 1) + 8 * i);
          v20 = v19;
          if (!v19)
          {
            v24 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWallet.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 322;
              *(_WORD *)&buf[18] = 2082;
              *(void *)&buf[20] = "BOOL _isSupportedPassStyle(PKPass *__strong)";
              *(_WORD *)&buf[28] = 2082;
              *(void *)&buf[30] = "nil == (pass)";
              _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a pass", buf, 0x26u);
            }
            goto LABEL_85;
          }
          BOOL v21 = (([v19 style] - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;

          if (!v21) {
            continue;
          }
          v22 = [v20 relevantDates];
          v23 = [v22 firstObject];
          v24 = [v23 date];

          if (!v24 || ([v111 containsDate:v24] & 1) == 0)
          {
            GEOFindOrCreateLog();
            v45 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              v46 = [v20 localizedDescription];
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v46;
              _os_log_impl(&dword_1A70DF000, v45, OS_LOG_TYPE_DEBUG, "Skipping %@", buf, 0xCu);
            }
            goto LABEL_85;
          }
          GEOFindOrCreateLog();
          v25 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            v26 = [v20 localizedDescription];
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v26;
            _os_log_impl(&dword_1A70DF000, v25, OS_LOG_TYPE_DEBUG, "✅ Processing pass: %@", buf, 0xCu);
          }
          context = (void *)MEMORY[0x1AD0C8E80]();
          v27 = v20;
          dispatch_assert_queue_V2(val[1]);
          if ([v27 style] != 4)
          {
            v47 = 0;
LABEL_83:

            goto LABEL_84;
          }
          v28 = v27;
          dispatch_assert_queue_V2(val[1]);
          GEOFindOrCreateLog();
          v29 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            v30 = [(dispatch_queue_t *)val uniqueName];
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v30;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "_entryFromFlightPass";
            _os_log_impl(&dword_1A70DF000, v29, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
          }
          v31 = GEOFindOrCreateLog();
          if (os_signpost_enabled(v31))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A70DF000, v31, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_entryFromFlightPass", "", buf, 2u);
          }

          GEOFindOrCreateLog();
          v32 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            v33 = [v28 localizedDescription];
            v34 = [v28 flightCode];
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v33;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v34;
            _os_log_impl(&dword_1A70DF000, v32, OS_LOG_TYPE_DEBUG, "Trying %@ (%@)", buf, 0x16u);
          }
          v35 = [val[3] fieldReader];
          [v35 loadPass:v28];

          v36 = [val[3] fieldReader];
          id v37 = [v36 combinedFlightCode];

          v38 = [val[3] fieldReader];
          v113 = [v38 departureAirportCode];

          v39 = [val[3] fieldReader];
          v109 = [v39 arrivalAirportCode];

          v40 = [val[3] fieldReader];
          v108 = [v40 departureTerminal];

          v41 = [val[3] fieldReader];
          v107 = [v41 departureGate];

          v42 = [val[3] fieldReader];
          v43 = [v42 departureTime];
          v44 = v43;
          if (v43)
          {
            id v112 = v43;
          }
          else
          {
            v48 = [v28 relevantDates];
            v49 = [v48 firstObject];
            id v112 = [v49 date];
          }
          v50 = [val[3] fieldReader];
          v106 = [v50 arrivalTime];

          v51 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v113;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v37;
            *(_WORD *)&buf[22] = 2112;
            *(void *)&buf[24] = v112;
            _os_log_impl(&dword_1A70DF000, v51, OS_LOG_TYPE_DEBUG, "departureAirportCode=%@, fullFlightNumber=%@, departureTime=%@", buf, 0x20u);
          }

          if (!v113 || !v37 || !v112)
          {
            GEOFindOrCreateLog();
            v67 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            {
              v68 = [v28 uniqueID];
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v68;
              _os_log_impl(&dword_1A70DF000, v67, OS_LOG_TYPE_DEBUG, "Cannot do anything with %@", buf, 0xCu);
            }
            GEOFindOrCreateLog();
            v69 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
            {
              v70 = [(dispatch_queue_t *)val uniqueName];
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v70;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "_entryFromFlightPass";
              _os_log_impl(&dword_1A70DF000, v69, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
            }
            v66 = GEOFindOrCreateLog();
            if (os_signpost_enabled(v66))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1A70DF000, v66, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_entryFromFlightPass", "", buf, 2u);
            }
            goto LABEL_62;
          }
          id v52 = v37;
          v53 = [MEMORY[0x1E4F28B88] letterCharacterSet];
          BOOL v54 = [v52 rangeOfCharacterFromSet:v53] == 0x7FFFFFFFFFFFFFFFLL;

          if (v54)
          {
            v55 = [v28 organizationName];
            int v56 = [@"JetBlue" isEqualToString:v55];

            if (v56)
            {
              uint64_t v57 = [[NSString alloc] initWithFormat:@"B6%@", v52];

              id v52 = (id)v57;
            }
          }
          id v58 = v52;
          v59 = [MEMORY[0x1E4F28B88] letterCharacterSet];
          BOOL v60 = [v58 rangeOfCharacterFromSet:v59] == 0x7FFFFFFFFFFFFFFFLL;

          if (v60)
          {
            v61 = [v28 organizationName];
            int v62 = [@"Spirit Airlines Inc" isEqualToString:v61];

            if (v62)
            {
              uint64_t v63 = [[NSString alloc] initWithFormat:@"NK%@", v58];

              id v58 = (id)v63;
            }
          }
          id v37 = v58;
          v64 = [MEMORY[0x1E4F28B88] letterCharacterSet];
          BOOL v65 = [v37 rangeOfCharacterFromSet:v64] == 0x7FFFFFFFFFFFFFFFLL;

          if (v65)
          {
            v66 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136447490;
              *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWallet.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 268;
              *(_WORD *)&buf[18] = 2082;
              *(void *)&buf[20] = "-[MapsSuggestionsWallet _q_entryFromFlightPass:]";
              *(_WORD *)&buf[28] = 2082;
              *(void *)&buf[30] = "_isAllNumeric(fullFlightNumber)";
              *(_WORD *)&buf[38] = 2112;
              id v141 = v37;
              LOWORD(v142[0]) = 2112;
              *(id *)((char *)v142 + 2) = v113;
              _os_log_impl(&dword_1A70DF000, v66, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Full Flight number should not be all numeric: '%@' from %@", buf, 0x3Au);
            }
LABEL_62:
            v71 = 0;
            goto LABEL_70;
          }
          v72 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v37;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v113;
            *(_WORD *)&buf[22] = 2112;
            *(void *)&buf[24] = v112;
            _os_log_impl(&dword_1A70DF000, v72, OS_LOG_TYPE_DEBUG, "Creating Entry for Flight %@ (%@ %@)", buf, 0x20u);
          }

          v73 = [MapsSuggestionsEntry alloc];
          GEOConfigGetDouble();
          double v75 = v74;
          GEOConfigGetDouble();
          v76 = objc_msgSend(v112, "dateByAddingTimeInterval:");
          v132 = @"MapsSuggestionsWalletPK";
          *(void *)from = @"MapsSuggestionsPrimaryKey";
          *(void *)&from[8] = @"MapsSuggestionsWalletPK";
          v77 = [v28 uniqueID];
          uint64_t v133 = (uint64_t)v77;
          v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v132 forKeys:from count:2];
          v71 = [(MapsSuggestionsEntry *)v73 initWithType:15 title:v113 subtitle:0 weight:v76 expires:0 geoMapItem:v78 sourceSpecificInfo:v75];

          [(MapsSuggestionsEntry *)v71 setString:v37 forKey:@"MapsSuggestionsFullFlightNumberKey"];
          [(MapsSuggestionsEntry *)v71 setString:v107 forKey:@"MapsSuggestionsFlightDepartureGateKey"];
          [(MapsSuggestionsEntry *)v71 setString:v108 forKey:@"MapsSuggestionsFlightDepartureTerminalKey"];
          [(MapsSuggestionsEntry *)v71 setString:v113 forKey:@"MapsSuggestionsFlightDepartureAirportCodeKey"];
          [(MapsSuggestionsEntry *)v71 setString:v109 forKey:@"MapsSuggestionsFlightArrivalAirportCodeKey"];
          [(MapsSuggestionsEntry *)v71 setString:v113 forKey:@"MapsSuggestionsFlightFullTargetAirportKey"];
          [(MapsSuggestionsEntry *)v71 setDate:v112 forKey:@"MapsSuggestionsFlightDepartureTimeKey"];
          [(MapsSuggestionsEntry *)v71 setString:v113 forKey:@"MapsSuggestionsEntryTitleNameKey"];
          [(MapsSuggestionsEntry *)v71 setDate:v112 forKey:@"MapsSuggestionsScheduledTimeKey"];
          [(MapsSuggestionsEntry *)v71 setDate:v106 forKey:@"MapsSuggestionsScheduledEndTimeKey"];
          id v79 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          v131 = MapsSuggestionsWalletAppBundleID;
          v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v131 count:1];
          v66 = [v79 initWithArray:v80];

          [(MapsSuggestionsEntry *)v71 setSet:v66 forKey:@"MapsSuggestionsAssociatedBundleIDsKey"];
          GEOFindOrCreateLog();
          v81 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
          {
            v82 = [(dispatch_queue_t *)val uniqueName];
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v82;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "_entryFromFlightPass";
            _os_log_impl(&dword_1A70DF000, v81, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
          }
          v83 = GEOFindOrCreateLog();
          if (os_signpost_enabled(v83))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A70DF000, v83, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_entryFromFlightPass", "", buf, 2u);
          }

LABEL_70:
          if (v71)
          {
            [v104 addObject:v71];
            dispatch_group_enter(group);
            dispatch_group_enter(group);
            v123[0] = MEMORY[0x1E4F143A8];
            v123[1] = 3221225472;
            v123[2] = __62__MapsSuggestionsWallet__q_readPassesWithHandler_withEndDate___block_invoke;
            v123[3] = &unk_1E5CB98C0;
            v84 = group;
            v124 = v84;
            v47 = v71;
            v85 = v123;
            dispatch_assert_queue_V2(val[1]);
            if ([(MapsSuggestionsEntry *)v47 containsKey:@"MapsSuggestionsFlightFullTargetAirportKey"])
            {
              objc_initWeak((id *)from, val);
              v86 = [(MapsSuggestionsEntry *)v47 stringForKey:@"MapsSuggestionsFlightFullTargetAirportKey"];
              v87 = [val[6] objectForKeyedSubscript:v86];
              if (v87)
              {
                *(void *)buf = MEMORY[0x1E4F143A8];
                *(void *)&buf[8] = 3221225472;
                *(void *)&buf[16] = __62__MapsSuggestionsWallet__q_addLocationInfoToEntry_completion___block_invoke;
                *(void *)&buf[24] = &unk_1E5CB8798;
                objc_copyWeak(&v142[1], (id *)from);
                *(void *)&buf[32] = v47;
                id v141 = v87;
                v142[0] = v85;
                v88 = val[1];
                id v89 = v87;
                dispatch_async(v88, buf);

                objc_destroyWeak(&v142[1]);
                int v90 = 1;
              }
              else
              {
                dispatch_queue_t v92 = val[4];
                v132 = (__CFString *)MEMORY[0x1E4F143A8];
                uint64_t v133 = 3221225472;
                v134 = __62__MapsSuggestionsWallet__q_addLocationInfoToEntry_completion___block_invoke_196;
                v135 = &unk_1E5CB9898;
                v138 = v85;
                objc_copyWeak(&v139, (id *)from);
                v136 = v47;
                id v137 = v86;
                int v90 = MapsSuggestionsSearchAirport(v137, v92, &v132);

                objc_destroyWeak(&v139);
              }

              objc_destroyWeak((id *)from);
            }
            else
            {
              v91 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)from = 136446978;
                *(void *)&from[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWallet.mm";
                *(_WORD *)&from[12] = 1024;
                *(_DWORD *)&from[14] = 181;
                __int16 v144 = 2082;
                v145 = "-[MapsSuggestionsWallet _q_addLocationInfoToEntry:completion:]";
                __int16 v146 = 2082;
                v147 = "NO == [entry containsKey:MapsSuggestionsFlightFullTargetAirportKey]";
                _os_log_impl(&dword_1A70DF000, v91, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires airport code", from, 0x26u);
              }

              int v90 = 0;
            }

            dispatch_queue_t v93 = val[4];
            v121[0] = MEMORY[0x1E4F143A8];
            v121[1] = 3221225472;
            v121[2] = __62__MapsSuggestionsWallet__q_readPassesWithHandler_withEndDate___block_invoke_2;
            v121[3] = &unk_1E5CB98C0;
            v94 = v84;
            v122 = v94;
            MapsSuggestionsSetArrivalAirportFieldsForEntry(v47, v93, v121);
            if (!v90) {
              dispatch_group_leave(v94);
            }

            v27 = v124;
            goto LABEL_83;
          }
          v47 = 0;
LABEL_84:

LABEL_85:
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v125 objects:v130 count:16];
      }
      while (v17);
    }

    dispatch_queue_t v95 = val[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__MapsSuggestionsWallet__q_readPassesWithHandler_withEndDate___block_invoke_3;
    block[3] = &unk_1E5CB8720;
    v96 = v95;
    objc_copyWeak(&v120, &location);
    id v118 = v104;
    id v119 = v101;
    id v97 = v104;
    dispatch_group_notify(group, v96, block);

    objc_destroyWeak(&v120);
    objc_destroyWeak(&location);
    id v5 = v103;
  }
}

- (char)hasExpressPaymentCardWithHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__MapsSuggestionsWallet_hasExpressPaymentCardWithHandler___block_invoke;
    v9[3] = &unk_1E5CB98E8;
    v10 = v4;
    MSg::Queue::async<MapsSuggestionsWallet>((NSObject **)&self->_queue, self, v9);
    char v6 = 1;
    int v7 = v10;
  }
  else
  {
    int v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWallet.mm";
      __int16 v13 = 1024;
      int v14 = 464;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsWallet hasExpressPaymentCardWithHandler:]";
      __int16 v17 = 2082;
      v18 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    char v6 = 0;
  }

  return v6;
}

- (char)hasTransitPassWithHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__MapsSuggestionsWallet_hasTransitPassWithHandler___block_invoke;
    v9[3] = &unk_1E5CB98E8;
    v10 = v4;
    MSg::Queue::async<MapsSuggestionsWallet>((NSObject **)&self->_queue, self, v9);
    char v6 = 1;
    int v7 = v10;
  }
  else
  {
    int v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWallet.mm";
      __int16 v13 = 1024;
      int v14 = 439;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsWallet hasTransitPassWithHandler:]";
      __int16 v17 = 2082;
      v18 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    char v6 = 0;
  }

  return v6;
}

- (char)hasPaymentCardWithHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__MapsSuggestionsWallet_hasPaymentCardWithHandler___block_invoke;
    v9[3] = &unk_1E5CB98E8;
    v10 = v4;
    MSg::Queue::async<MapsSuggestionsWallet>((NSObject **)&self->_queue, self, v9);
    char v6 = 1;
    int v7 = v10;
  }
  else
  {
    int v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWallet.mm";
      __int16 v13 = 1024;
      int v14 = 451;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsWallet hasPaymentCardWithHandler:]";
      __int16 v17 = 2082;
      v18 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    char v6 = 0;
  }

  return v6;
}

- (char)entriesFromPassesBefore:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  GEOFindOrCreateLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    __int16 v9 = [(MapsSuggestionsWallet *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v18 = v9;
    __int16 v19 = 2080;
    v20 = "entriesFromPassesBefore:handler:";
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  v10 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "entriesFromPassesBefore:handler:", "", buf, 2u);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__MapsSuggestionsWallet_entriesFromPassesBefore_handler___block_invoke;
  v14[3] = &unk_1E5CB9848;
  id v11 = v7;
  id v16 = v11;
  id v12 = v6;
  id v15 = v12;
  MSg::Queue::async<MapsSuggestionsWallet>((NSObject **)&self->_queue, self, v14);

  return 1;
}

void __62__MapsSuggestionsWallet__q_readPassesWithHandler_withEndDate___block_invoke_3(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    id v4 = MapsSuggestionsCurrentBestLocation();

    if (v4)
    {
      GEOConfigGetDouble();
      double v6 = v5;
      double v26 = 0.0;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v7 = *(id *)(a1 + 32);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v23 != v9) {
              objc_enumerationMutation(v7);
            }
            id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            id v12 = objc_msgSend(v11, "geoMapItem", (void)v22);
            BOOL v13 = v12 == 0;

            if (!v13)
            {
              MapsSuggestionsDistanceFromHereToEntry(v11, &v26);
              objc_msgSend(v11, "setBoolean:forKey:", v26 < v6, @"MapsSuggestionsAlreadyThereKey", v26);
              [v3 addObject:v11];
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v8);
      }

      uint64_t v14 = *(void *)(a1 + 40);
      if (v14)
      {
        id v15 = [v3 copy];
        (*(void (**)(uint64_t, id, void))(v14 + 16))(v14, v15, 0);
      }
      GEOFindOrCreateLog();
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        __int16 v17 = [WeakRetained uniqueName];
        *(_DWORD *)buf = 138412546;
        v29 = v17;
        __int16 v30 = 2080;
        *(void *)v31 = "_q_readPassesWithHandler";
        _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
      }
      v18 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_readPassesWithHandler", "", buf, 2u);
      }
    }
    else
    {
      __int16 v19 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_DEBUG, "No current location, keeping what we had", buf, 2u);
      }

      uint64_t v20 = *(void *)(a1 + 40);
      if (v20)
      {
        uint64_t v21 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"No current location"];
        (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v21);
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v29 = "MapsSuggestionsWallet.mm";
      __int16 v30 = 1026;
      *(_DWORD *)v31 = 401;
      *(_WORD *)&v31[4] = 2082;
      *(void *)&v31[6] = "-[MapsSuggestionsWallet _q_readPassesWithHandler:withEndDate:]_block_invoke_3";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

+ (BOOL)isAvailable
{
  return +[MapsSuggestionsRealWalletConnector isAvailable];
}

- (void)passKitDidChange:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  GEOFindOrCreateLog();
  double v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    double v6 = [v4 uniqueName];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "Received passKitDidChange from:%@. CanKicking the notification.", (uint8_t *)&v7, 0xCu);
  }
  [(MapsSuggestionsCanKicker *)self->_changedNotificationCanKicker kickCanBySameTime];
}

- (MapsSuggestionsWallet)initWithConnector:(id)a3 network:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)MapsSuggestionsWallet;
  uint64_t v9 = [(MapsSuggestionsWallet *)&v32 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    MSg::Queue::Queue((dispatch_queue_t *)&location, @"MapsSuggestionsWalletQueue", v10);
    id v11 = (OS_dispatch_queue *)location;
    id location = 0;
    innerQueue = v9->_queue._innerQueue;
    v9->_queue._innerQueue = v11;

    BOOL v13 = v31;
    v31 = 0;
    name = v9->_queue._name;
    v9->_queue._name = v13;

    objc_storeStrong((id *)&v9->_connector, a3);
    [(MapsSuggestionsWalletConnector *)v9->_connector setDelegate:v9];
    objc_storeStrong((id *)&v9->_network, a4);
    id v15 = [[MapsSuggestionsLimitedDictionary alloc] initWithMaximumCapacity:GEOConfigGetInteger()];
    airportCache = v9->_airportCache;
    v9->_airportCache = v15;

    __int16 v17 = [MapsSuggestionsObservers alloc];
    v18 = v9->_queue._innerQueue;
    uint64_t v19 = [(MapsSuggestionsObservers *)v17 initWithCallbackQueue:v18 name:@"MapsSuggestionsWalletObservers"];
    observers = v9->_observers;
    v9->_observers = (MapsSuggestionsObservers *)v19;

    objc_initWeak(&location, v9);
    uint64_t v21 = [MapsSuggestionsCanKicker alloc];
    GEOConfigGetDouble();
    double v23 = v22;
    long long v24 = v9->_queue._innerQueue;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __51__MapsSuggestionsWallet_initWithConnector_network___block_invoke;
    v28[3] = &unk_1E5CB7E78;
    objc_copyWeak(&v29, &location);
    uint64_t v25 = [(MapsSuggestionsCanKicker *)v21 initWithName:@"MapsSuggestionsPassKitChangedNotificationCanKicker" time:v24 queue:v28 block:v23];
    changedNotificationCanKicker = v9->_changedNotificationCanKicker;
    v9->_changedNotificationCanKicker = (MapsSuggestionsCanKicker *)v25;

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __51__MapsSuggestionsWallet_initWithConnector_network___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "Acting on one or more change notifications from PassKit", buf, 2u);
    }

    id v4 = (void *)WeakRetained[5];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__MapsSuggestionsWallet_initWithConnector_network___block_invoke_186;
    v6[3] = &unk_1E5CB9820;
    objc_copyWeak(&v7, v1);
    [v4 callBlock:v6];
    objc_destroyWeak(&v7);
  }
  else
  {
    GEOFindOrCreateLog();
    double v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v9 = "MapsSuggestionsWallet.mm";
      __int16 v10 = 1026;
      int v11 = 95;
      __int16 v12 = 2082;
      BOOL v13 = "-[MapsSuggestionsWallet initWithConnector:network:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __51__MapsSuggestionsWallet_initWithConnector_network___block_invoke_186(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [v3 passKitDidChange:WeakRetained];
  }
  else
  {
    GEOFindOrCreateLog();
    double v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsWallet.mm";
      __int16 v8 = 1026;
      int v9 = 98;
      __int16 v10 = 2082;
      int v11 = "-[MapsSuggestionsWallet initWithConnector:network:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfCall went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (id)initFromResourceDepot:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = v4;
  if (!v4)
  {
    __int16 v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      BOOL v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWallet.mm";
      __int16 v14 = 1024;
      int v15 = 109;
      __int16 v16 = 2082;
      __int16 v17 = "-[MapsSuggestionsWallet initFromResourceDepot:]";
      __int16 v18 = 2082;
      uint64_t v19 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!", (uint8_t *)&v12, 0x26u);
    }
    goto LABEL_9;
  }
  int v6 = [v4 oneNetworkRequester];

  if (!v6)
  {
    __int16 v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      BOOL v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWallet.mm";
      __int16 v14 = 1024;
      int v15 = 110;
      __int16 v16 = 2082;
      __int16 v17 = "-[MapsSuggestionsWallet initFromResourceDepot:]";
      __int16 v18 = 2082;
      uint64_t v19 = "nil == (resourceDepot.oneNetworkRequester)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One Network!", (uint8_t *)&v12, 0x26u);
    }
LABEL_9:

    int v9 = 0;
    goto LABEL_10;
  }
  id v7 = objc_alloc_init(MapsSuggestionsRealWalletConnector);
  __int16 v8 = [v5 oneNetworkRequester];
  self = [(MapsSuggestionsWallet *)self initWithConnector:v7 network:v8];

  int v9 = self;
LABEL_10:

  return v9;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  observers = self->_observers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__MapsSuggestionsWallet_registerObserver___block_invoke;
  v6[3] = &unk_1E5CB8238;
  objc_copyWeak(&v7, &location);
  [(MapsSuggestionsObservers *)observers registerObserver:v4 handler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __42__MapsSuggestionsWallet_registerObserver___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    id v3 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained[3] startListeningForChanges];
    }
    else
    {
      GEOFindOrCreateLog();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136446722;
        int v6 = "MapsSuggestionsWallet.mm";
        __int16 v7 = 1026;
        int v8 = 134;
        __int16 v9 = 2082;
        __int16 v10 = "-[MapsSuggestionsWallet registerObserver:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }
    }
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  observers = self->_observers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__MapsSuggestionsWallet_unregisterObserver___block_invoke;
  v6[3] = &unk_1E5CB8238;
  objc_copyWeak(&v7, &location);
  [(MapsSuggestionsObservers *)observers unregisterObserver:v4 handler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __44__MapsSuggestionsWallet_unregisterObserver___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    id v3 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained[3] stopListeningForChanges];
    }
    else
    {
      GEOFindOrCreateLog();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136446722;
        int v6 = "MapsSuggestionsWallet.mm";
        __int16 v7 = 1026;
        int v8 = 146;
        __int16 v9 = 2082;
        __int16 v10 = "-[MapsSuggestionsWallet unregisterObserver:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }
    }
  }
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return a3 == 15;
}

void __62__MapsSuggestionsWallet__q_addLocationInfoToEntry_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = MapsSuggestionsSetLocationFromMapItem(*(void **)(a1 + 32), *(void **)(a1 + 40), 9);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      int v6 = "MapsSuggestionsWallet.mm";
      __int16 v7 = 1026;
      int v8 = 192;
      __int16 v9 = 2082;
      __int16 v10 = "-[MapsSuggestionsWallet _q_addLocationInfoToEntry:completion:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void __62__MapsSuggestionsWallet__q_addLocationInfoToEntry_completion___block_invoke_196(id *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 || [v5 count] != 1)
  {
    GEOFindOrCreateLog();
    int v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)__int16 v17 = [v5 count];
      *(_WORD *)&v17[4] = 2112;
      *(void *)&v17[6] = v6;
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "Could not get airport code in %u mapItems, error: %@", buf, 0x12u);
    }

    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(a1 + 7);
    if (WeakRetained)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__MapsSuggestionsWallet__q_addLocationInfoToEntry_completion___block_invoke_197;
      block[3] = &unk_1E5CB9870;
      objc_copyWeak(&v15, a1 + 7);
      id v11 = v5;
      id v14 = a1[6];
      id v12 = a1[4];
      id v13 = a1[5];
      dispatch_async(WeakRetained[1], block);

      objc_destroyWeak(&v15);
    }
    else
    {
      GEOFindOrCreateLog();
      __int16 v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(void *)__int16 v17 = "MapsSuggestionsWallet.mm";
        *(_WORD *)&v17[8] = 1026;
        *(_DWORD *)&v17[10] = 210;
        __int16 v18 = 2082;
        uint64_t v19 = "-[MapsSuggestionsWallet _q_addLocationInfoToEntry:completion:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
      }
    }
  }
}

void __62__MapsSuggestionsWallet__q_addLocationInfoToEntry_completion___block_invoke_197(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) firstObject];
    id v4 = MapsSuggestionsMapItemConvertIfNeeded(v3);

    if (MapsSuggestionsMapItemIsAirport(v4))
    {
      if (!MapsSuggestionsMapItemIsVenue(v4))
      {
        GEOFindOrCreateLog();
        id v5 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          id v6 = [v4 name];
          int v10 = 138412290;
          id v11 = v6;
          _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "Airport '%@' is not a Venue, but that's ok", (uint8_t *)&v10, 0xCu);
        }
      }
      id v7 = MapsSuggestionsSetLocationFromMapItem(*(void **)(a1 + 40), v4, 9);
      [WeakRetained[6] setObject:v4 forKeyedSubscript:*(void *)(a1 + 48)];
    }
    else
    {
      GEOFindOrCreateLog();
      int v8 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        __int16 v9 = [v4 name];
        int v10 = 138412290;
        id v11 = v9;
        _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "Airport '%@' is not actually an Airport", (uint8_t *)&v10, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446722;
      id v11 = "MapsSuggestionsWallet.mm";
      __int16 v12 = 1026;
      int v13 = 212;
      __int16 v14 = 2082;
      id v15 = "-[MapsSuggestionsWallet _q_addLocationInfoToEntry:completion:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

void __62__MapsSuggestionsWallet__q_readPassesWithHandler_withEndDate___block_invoke(uint64_t a1)
{
}

void __62__MapsSuggestionsWallet__q_readPassesWithHandler_withEndDate___block_invoke_2(uint64_t a1)
{
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedNotificationCanKicker, 0);
  objc_storeStrong((id *)&self->_airportCache, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_connector, 0);

  innerQueue = self->_queue._innerQueue;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end