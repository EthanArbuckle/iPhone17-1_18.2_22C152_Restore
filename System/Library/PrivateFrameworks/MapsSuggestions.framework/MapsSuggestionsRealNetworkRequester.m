@interface MapsSuggestionsRealNetworkRequester
- (BOOL)ETAFromWaypoint:(id)a3 toWaypoint:(id)a4 transportType:(int)a5 automobileOptions:(id)a6 completion:(id)a7;
- (BOOL)canonicalLocalSearchPostalAddress:(id)a3 completion:(id)a4;
- (BOOL)composedWaypointForAddressString:(id)a3 completion:(id)a4;
- (BOOL)composedWaypointForCurrentLocation:(id)a3 completion:(id)a4;
- (BOOL)composedWaypointForLocation:(id)a3 completion:(id)a4;
- (BOOL)composedWaypointForLocation:(id)a3 mapItem:(id)a4 completion:(id)a5;
- (BOOL)composedWaypointForMapItem:(id)a3 completion:(id)a4;
- (BOOL)forwardGeocodeAddressString:(id)a3 completion:(id)a4;
- (BOOL)forwardGeocodePostalAddress:(id)a3 completion:(id)a4;
- (BOOL)placeForMuid:(id)a3 completion:(id)a4;
- (BOOL)placeRefinementForAddress:(id)a3 completion:(id)a4;
- (BOOL)placeRefinementForCoordinate:(id)a3 address:(id)a4 completion:(id)a5;
- (BOOL)resolveMapItemHandleData:(id)a3 completion:(id)a4;
- (BOOL)reverseGeocodeCoordinate:(id)a3 completion:(id)a4;
- (BOOL)reverseGeocodeCoordinate:(id)a3 shiftIfNeeded:(BOOL)a4 completion:(id)a5;
- (BOOL)routeForWaypoints:(id)a3 currentLocation:(id)a4 routeAttributes:(id)a5 feedback:(id)a6 completion:(id)a7;
- (BOOL)searchPOIWithName:(id)a3 ofPOICategory:(id)a4 withinVenue:(id)a5 maxResults:(unint64_t)a6 completion:(id)a7;
- (BOOL)searchString:(id)a3 maxResults:(unsigned int)a4 completion:(id)a5;
- (BOOL)searchWithAirportCode:(id)a3 terminal:(id)a4 gate:(id)a5 completion:(id)a6;
- (NSString)uniqueName;
- (id)initFromResourceDepot:(id)a3;
@end

@implementation MapsSuggestionsRealNetworkRequester

- (id)initFromResourceDepot:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsRealNetworkRequester;
  return [(MapsSuggestionsRealNetworkRequester *)&v4 init];
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (BOOL)forwardGeocodePostalAddress:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = (char *)a3;
  id v6 = a4;
  if (!v6)
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v18 = 1024;
      int v19 = 64;
      __int16 v20 = 2082;
      v21 = "-[MapsSuggestionsRealNetworkRequester forwardGeocodePostalAddress:completion:]";
      __int16 v22 = 2082;
      v23 = "nil == (completion)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    }
LABEL_11:
    BOOL v13 = 0;
    goto LABEL_12;
  }
  v7 = GEOFindOrCreateLog();
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v18 = 1024;
      int v19 = 65;
      __int16 v20 = 2082;
      v21 = "-[MapsSuggestionsRealNetworkRequester forwardGeocodePostalAddress:completion:]";
      __int16 v22 = 2082;
      v23 = "nil == (postalAddress)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an address";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Making request: fwd-geo for '%@'", (uint8_t *)&v16, 0xCu);
  }

  v9 = [MEMORY[0x1E4F64710] sharedService];
  v10 = [MEMORY[0x1E4F64710] sharedService];
  v11 = [v10 defaultTraits];

  v12 = GEOConfigGetString();
  [v11 setAppIdentifier:v12];

  BOOL v13 = 1;
  v8 = [v9 ticketForForwardGeocodePostalAddress:v5 maxResults:1 traits:v11];

  [v8 submitWithHandler:v6 networkActivity:0];
LABEL_12:

  return v13;
}

- (BOOL)forwardGeocodeAddressString:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = (char *)a3;
  id v6 = a4;
  if (!v6)
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v18 = 1024;
      int v19 = 80;
      __int16 v20 = 2082;
      v21 = "-[MapsSuggestionsRealNetworkRequester forwardGeocodeAddressString:completion:]";
      __int16 v22 = 2082;
      v23 = "nil == (completion)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    }
LABEL_11:
    BOOL v13 = 0;
    goto LABEL_12;
  }
  v7 = GEOFindOrCreateLog();
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v18 = 1024;
      int v19 = 81;
      __int16 v20 = 2082;
      v21 = "-[MapsSuggestionsRealNetworkRequester forwardGeocodeAddressString:completion:]";
      __int16 v22 = 2082;
      v23 = "nil == (addressString)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an address string";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Making request: fwd-geo for '%@'", (uint8_t *)&v16, 0xCu);
  }

  v9 = [MEMORY[0x1E4F64710] sharedService];
  v10 = [MEMORY[0x1E4F64710] sharedService];
  v11 = [v10 defaultTraits];

  v12 = GEOConfigGetString();
  [v11 setAppIdentifier:v12];

  BOOL v13 = 1;
  v8 = [v9 ticketForForwardGeocodeString:v5 maxResults:1 traits:v11];

  [v8 submitWithHandler:v6 networkActivity:0];
LABEL_12:

  return v13;
}

- (BOOL)canonicalLocalSearchPostalAddress:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136446978;
      uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v25 = 1024;
      int v26 = 96;
      __int16 v27 = 2082;
      v28 = "-[MapsSuggestionsRealNetworkRequester canonicalLocalSearchPostalAddress:completion:]";
      __int16 v29 = 2082;
      v30 = "nil == (completion)";
      v21 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v23, 0x26u);
    }
LABEL_11:
    BOOL v20 = 0;
    goto LABEL_12;
  }
  if (!v5)
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136446978;
      uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v25 = 1024;
      int v26 = 97;
      __int16 v27 = 2082;
      v28 = "-[MapsSuggestionsRealNetworkRequester canonicalLocalSearchPostalAddress:completion:]";
      __int16 v29 = 2082;
      v30 = "nil == (postalAddress)";
      v21 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an address";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v7 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  id v8 = objc_alloc(MEMORY[0x1E4F643C0]);
  v9 = [v7 languageCode];
  v10 = [v7 regionCode];
  v11 = [v7 languageCode];
  v12 = (void *)[v8 initWithCNPostalAddress:v5 language:v9 country:v10 phoneticLocale:v11];

  BOOL v13 = [v12 fullAddressWithMultiline:0];
  v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 138412290;
    uint64_t v24 = v13;
    _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "Making request: canonical for '%@'", (uint8_t *)&v23, 0xCu);
  }

  v15 = [MEMORY[0x1E4F64710] sharedService];
  int v16 = [MEMORY[0x1E4F64710] sharedService];
  v17 = [v16 defaultTraits];

  __int16 v18 = GEOConfigGetString();
  [v17 setAppIdentifier:v18];

  int v19 = [v15 ticketForCanonicalLocationSearchQueryString:v13 traits:v17];

  [v19 submitWithHandler:v6 networkActivity:0];
  BOOL v20 = 1;
LABEL_12:

  return v20;
}

- (BOOL)reverseGeocodeCoordinate:(id)a3 shiftIfNeeded:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (!v8)
  {
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446978;
      int v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v20 = 1024;
      *(_DWORD *)v21 = 119;
      *(_WORD *)&v21[4] = 2082;
      *(void *)&v21[6] = "-[MapsSuggestionsRealNetworkRequester reverseGeocodeCoordinate:shiftIfNeeded:completion:]";
      __int16 v22 = 2082;
      int v23 = "nil == (completion)";
      int v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_13:
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v18, 0x26u);
    }
LABEL_14:
    BOOL v15 = 0;
    goto LABEL_15;
  }
  v9 = GEOFindOrCreateLog();
  v10 = v9;
  if (var1 < -180.0 || var1 > 180.0 || var0 < -90.0 || var0 > 90.0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446978;
      int v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v20 = 1024;
      *(_DWORD *)v21 = 120;
      *(_WORD *)&v21[4] = 2082;
      *(void *)&v21[6] = "-[MapsSuggestionsRealNetworkRequester reverseGeocodeCoordinate:shiftIfNeeded:completion:]";
      __int16 v22 = 2082;
      int v23 = "!GEOCoordinate2DIsValid(coordinate)";
      int v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a valid coordinate";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 134218240;
    int v19 = *(const char **)&var0;
    __int16 v20 = 2048;
    *(double *)v21 = var1;
    _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "Making request: rev-geo for <%.6f,%.6f>", (uint8_t *)&v18, 0x16u);
  }

  v11 = [MEMORY[0x1E4F64710] sharedService];
  v12 = [MEMORY[0x1E4F64710] sharedService];
  BOOL v13 = [v12 defaultTraits];

  v14 = GEOConfigGetString();
  [v13 setAppIdentifier:v14];

  v10 = objc_msgSend(v11, "ticketForReverseGeocodeCoordinate:shiftLocationsIfNeeded:traits:", v5, v13, var0, var1);

  [v10 submitWithHandler:v8 networkActivity:0];
  BOOL v15 = 1;
LABEL_15:

  return v15;
}

- (BOOL)reverseGeocodeCoordinate:(id)a3 completion:(id)a4
{
  return -[MapsSuggestionsRealNetworkRequester reverseGeocodeCoordinate:shiftIfNeeded:completion:](self, "reverseGeocodeCoordinate:shiftIfNeeded:completion:", 1, a4, a3.var0, a3.var1);
}

- (BOOL)placeRefinementForCoordinate:(id)a3 address:(id)a4 completion:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  $F24F406B2B787EFB06265DBA3D28CBD5 v17 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = GEOFindOrCreateLog();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      int v19 = *(const char **)&var0;
      __int16 v20 = 2048;
      *(double *)v21 = var1;
      *(_WORD *)&v21[8] = 2112;
      *(void *)&v21[10] = v8;
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "Making place refinement: <%.6f,%.6f>, %@", buf, 0x20u);
    }

    v12 = objc_msgSend(MEMORY[0x1E4F64710], "sharedService", *(void *)&v17.var0, *(void *)&v17.var1);
    BOOL v13 = [MEMORY[0x1E4F64710] sharedService];
    v14 = [v13 defaultTraits];

    BOOL v15 = GEOConfigGetString();
    [v14 setAppIdentifier:v15];

    v11 = [v12 ticketForPlaceRefinementRequestWithCoordinate:&v17 addressLine:v8 placeName:0 traits:v14];

    [v11 submitWithHandler:v9 networkActivity:0];
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    int v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
    __int16 v20 = 1024;
    *(_DWORD *)v21 = 142;
    *(_WORD *)&v21[4] = 2082;
    *(void *)&v21[6] = "-[MapsSuggestionsRealNetworkRequester placeRefinementForCoordinate:address:completion:]";
    *(_WORD *)&unsigned char v21[14] = 2082;
    *(void *)&v21[16] = "nil == (completion)";
    _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
  }

  return v9 != 0;
}

- (BOOL)placeRefinementForAddress:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (char *)a3;
  id v6 = a4;
  v7 = GEOFindOrCreateLog();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412290;
      BOOL v15 = v5;
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Making place refinement with address: %@", (uint8_t *)&v14, 0xCu);
    }

    id v9 = [MEMORY[0x1E4F64710] sharedService];
    v10 = [MEMORY[0x1E4F64710] sharedService];
    v11 = [v10 defaultTraits];

    v12 = GEOConfigGetString();
    [v11 setAppIdentifier:v12];

    id v8 = [v9 ticketForPlaceRefinementRequestWithCoordinate:0 addressLine:v5 placeName:0 traits:v11];

    [v8 submitWithHandler:v6 networkActivity:0];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v14 = 136446978;
    BOOL v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
    __int16 v16 = 1024;
    int v17 = 154;
    __int16 v18 = 2082;
    int v19 = "-[MapsSuggestionsRealNetworkRequester placeRefinementForAddress:completion:]";
    __int16 v20 = 2082;
    v21 = "nil == (completion)";
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", (uint8_t *)&v14, 0x26u);
  }

  return v6 != 0;
}

- (BOOL)placeForMuid:(id)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)MEMORY[0x1E4F64710];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedService];
  v15[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v10 = [MEMORY[0x1E4F64710] sharedService];

  v11 = [v10 defaultTraits];

  v12 = GEOConfigGetString();
  [v11 setAppIdentifier:v12];

  BOOL v13 = [v8 ticketForIdentifiers:v9 traits:v11];

  [v13 submitWithHandler:v6 networkActivity:0];
  return 1;
}

- (BOOL)searchString:(id)a3 maxResults:(unsigned int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = (char *)a3;
  id v8 = a5;
  if (!v8)
  {
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446978;
      int v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v20 = 1024;
      int v21 = 176;
      __int16 v22 = 2082;
      int v23 = "-[MapsSuggestionsRealNetworkRequester searchString:maxResults:completion:]";
      __int16 v24 = 2082;
      __int16 v25 = "nil == (completion)";
      __int16 v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v18, 0x26u);
    }
LABEL_11:
    BOOL v15 = 0;
    goto LABEL_12;
  }
  id v9 = GEOFindOrCreateLog();
  v10 = v9;
  if (!v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446978;
      int v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v20 = 1024;
      int v21 = 177;
      __int16 v22 = 2082;
      int v23 = "-[MapsSuggestionsRealNetworkRequester searchString:maxResults:completion:]";
      __int16 v24 = 2082;
      __int16 v25 = "nil == (searchString)";
      __int16 v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an address string";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 138412290;
    int v19 = v7;
    _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "Making request: search for '%@'", (uint8_t *)&v18, 0xCu);
  }

  v11 = [MEMORY[0x1E4F64710] sharedService];
  v12 = [MEMORY[0x1E4F64710] sharedService];
  BOOL v13 = [v12 defaultTraits];

  int v14 = GEOConfigGetString();
  [v13 setAppIdentifier:v14];

  v10 = [v11 ticketForSearchQuery:v7 completionItem:0 maxResults:v6 traits:v13 searchSessionData:0];

  [v10 submitWithHandler:v8 networkActivity:0];
  BOOL v15 = 1;
LABEL_12:

  return v15;
}

- (BOOL)searchPOIWithName:(id)a3 ofPOICategory:(id)a4 withinVenue:(id)a5 maxResults:(unint64_t)a6 completion:(id)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v11 = (char *)a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (!v14)
  {
    __int16 v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v33 = 1024;
      *(_DWORD *)v34 = 199;
      *(_WORD *)&v34[4] = 2082;
      *(void *)&v34[6] = "-[MapsSuggestionsRealNetworkRequester searchPOIWithName:ofPOICategory:withinVenue:maxResults:completion:]";
      *(_WORD *)&v34[14] = 2082;
      *(void *)&v34[16] = "nil == (completion)";
      v28 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_15:
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, v28, buf, 0x26u);
    }
LABEL_16:
    BOOL v27 = 0;
    goto LABEL_17;
  }
  BOOL v15 = GEOFindOrCreateLog();
  __int16 v16 = v15;
  if (!v11)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v33 = 1024;
      *(_DWORD *)v34 = 200;
      *(_WORD *)&v34[4] = 2082;
      *(void *)&v34[6] = "-[MapsSuggestionsRealNetworkRequester searchPOIWithName:ofPOICategory:withinVenue:maxResults:completion:]";
      *(_WORD *)&v34[14] = 2082;
      *(void *)&v34[16] = "nil == (searchString)";
      v28 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an address string";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v32 = v11;
    __int16 v33 = 2112;
    *(void *)v34 = v12;
    *(_WORD *)&v34[8] = 2048;
    *(void *)&v34[10] = [v13 venueID];
    _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "Making request: search POI for '%@' (category=%@ venue=%llu)", buf, 0x20u);
  }

  __int16 v16 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  int v17 = (void *)[objc_alloc(MEMORY[0x1E4F64938]) initWithResultTypes:2];
  [v16 addObject:v17];
  if (v12)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F647F0]);
    id v30 = v12;
    int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    __int16 v20 = (void *)[v18 initWithCategoriesToInclude:v19 categoriesToExclude:0];

    [v16 addObject:v20];
  }
  if (v13 && [v13 _hasFeatureID])
  {
    int v21 = (void *)[objc_alloc(MEMORY[0x1E4F64BD8]) initWithIdentifier:v13];
    [v16 addObject:v21];
  }
  __int16 v22 = [MEMORY[0x1E4F64710] sharedService];
  int v23 = [MEMORY[0x1E4F64710] sharedService];
  __int16 v24 = [v23 defaultTraits];

  __int16 v25 = GEOConfigGetString();
  [v24 setAppIdentifier:v25];

  uint64_t v26 = [v22 ticketForSearchQuery:v11 filters:v16 maxResults:a6 traits:v24 searchSessionData:0];

  [v26 submitWithHandler:v14 networkActivity:0];
  BOOL v27 = 1;
LABEL_17:

  return v27;
}

- (BOOL)searchWithAirportCode:(id)a3 terminal:(id)a4 gate:(id)a5 completion:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = (char *)a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v12)
  {
    id v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136446978;
      int v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v24 = 1024;
      *(_DWORD *)__int16 v25 = 242;
      *(_WORD *)&v25[4] = 2082;
      *(void *)&v25[6] = "-[MapsSuggestionsRealNetworkRequester searchWithAirportCode:terminal:gate:completion:]";
      *(_WORD *)&v25[14] = 2082;
      *(void *)&v25[16] = "nil == (completion)";
      __int16 v20 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v22, 0x26u);
    }
LABEL_11:
    BOOL v19 = 0;
    goto LABEL_12;
  }
  id v13 = GEOFindOrCreateLog();
  id v14 = v13;
  if (!v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136446978;
      int v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v24 = 1024;
      *(_DWORD *)__int16 v25 = 243;
      *(_WORD *)&v25[4] = 2082;
      *(void *)&v25[6] = "-[MapsSuggestionsRealNetworkRequester searchWithAirportCode:terminal:gate:completion:]";
      *(_WORD *)&v25[14] = 2082;
      *(void *)&v25[16] = "nil == (airportCode)";
      __int16 v20 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires at least an airportCode";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v22 = 138412802;
    int v23 = v9;
    __int16 v24 = 2112;
    *(void *)__int16 v25 = v10;
    *(_WORD *)&v25[8] = 2112;
    *(void *)&v25[10] = v11;
    _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "Making request: airport for {'%@', '%@', '%@'}", (uint8_t *)&v22, 0x20u);
  }

  BOOL v15 = [MEMORY[0x1E4F64710] sharedService];
  __int16 v16 = [MEMORY[0x1E4F64710] sharedService];
  int v17 = [v16 defaultTraits];

  id v18 = GEOConfigGetString();
  [v17 setAppIdentifier:v18];

  id v14 = [v15 ticketForAirportCode:v9 terminalCode:v10 gateCode:v11 traits:v17];

  [v14 submitWithHandler:v12 networkActivity:0];
  BOOL v19 = 1;
LABEL_12:

  return v19;
}

- (BOOL)resolveMapItemHandleData:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (char *)a3;
  id v6 = a4;
  if (!v6)
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      BOOL v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v20 = 1024;
      int v21 = 258;
      __int16 v22 = 2082;
      int v23 = "-[MapsSuggestionsRealNetworkRequester resolveMapItemHandleData:completion:]";
      __int16 v24 = 2082;
      __int16 v25 = "nil == (completion)";
      id v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, v14, buf, 0x26u);
    }
LABEL_11:
    BOOL v13 = 0;
    goto LABEL_12;
  }
  id v7 = GEOFindOrCreateLog();
  id v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      BOOL v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v20 = 1024;
      int v21 = 259;
      __int16 v22 = 2082;
      int v23 = "-[MapsSuggestionsRealNetworkRequester resolveMapItemHandleData:completion:]";
      __int16 v24 = 2082;
      __int16 v25 = "nil == (mapItemHandleData)";
      id v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a MapItemHandle data";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v19 = v5;
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Making request: place-refinement for %@", buf, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F64710] sharedService];
  id v10 = [MEMORY[0x1E4F64710] sharedService];
  id v11 = [v10 defaultTraits];

  id v12 = GEOConfigGetString();
  [v11 setAppIdentifier:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__MapsSuggestionsRealNetworkRequester_resolveMapItemHandleData_completion___block_invoke;
  v16[3] = &unk_1E5CB9050;
  int v17 = v6;
  [v9 resolveMapItemFromHandle:v5 traits:v11 completionHandler:v16];

  BOOL v13 = 1;
  id v8 = v17;
LABEL_12:

  return v13;
}

void __75__MapsSuggestionsRealNetworkRequester_resolveMapItemHandleData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v8[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    id v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)composedWaypointForMapItem:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v23 = 1024;
      int v24 = 281;
      __int16 v25 = 2082;
      uint64_t v26 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForMapItem:completion:]";
      __int16 v27 = 2082;
      v28 = "nil == (completion)";
      __int16 v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, v16, buf, 0x26u);
    }
LABEL_11:
    BOOL v15 = 0;
    goto LABEL_12;
  }
  id v7 = GEOFindOrCreateLog();
  id v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v23 = 1024;
      int v24 = 282;
      __int16 v25 = 2082;
      uint64_t v26 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForMapItem:completion:]";
      __int16 v27 = 2082;
      v28 = "nil == (mapItem)";
      __int16 v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Making request: waypoint for mapitem", buf, 2u);
  }

  id v9 = MapsSuggestionsNow();
  id v10 = (void *)MEMORY[0x1E4F644F0];
  id v11 = [MEMORY[0x1E4F64710] sharedService];
  id v12 = [v11 defaultTraits];

  BOOL v13 = GEOConfigGetString();
  [v12 setAppIdentifier:v13];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__MapsSuggestionsRealNetworkRequester_composedWaypointForMapItem_completion___block_invoke;
  v18[3] = &unk_1E5CB9000;
  id v19 = v9;
  id v20 = v6;
  id v8 = v9;
  id v14 = (id)[v10 composedWaypointForMapItem:v5 traits:v12 clientAttributes:0 completionHandler:v18 networkActivityHandler:0];

  BOOL v15 = 1;
LABEL_12:

  return v15;
}

void __77__MapsSuggestionsRealNetworkRequester_composedWaypointForMapItem_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = MapsSuggestionsNow();
  [v7 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v9 = v8;
  id v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134217984;
    uint64_t v12 = v9;
    _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "Took %.2f seconds", (uint8_t *)&v11, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)composedWaypointForLocation:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = (char *)a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446978;
      int v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v18 = 1024;
      int v19 = 303;
      __int16 v20 = 2082;
      int v21 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForLocation:completion:]";
      __int16 v22 = 2082;
      __int16 v23 = "nil == (completion)";
      id v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    }
LABEL_11:
    BOOL v13 = 0;
    goto LABEL_12;
  }
  id v7 = GEOFindOrCreateLog();
  uint64_t v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446978;
      int v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v18 = 1024;
      int v19 = 304;
      __int16 v20 = 2082;
      int v21 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForLocation:completion:]";
      __int16 v22 = 2082;
      __int16 v23 = "nil == (location)";
      id v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412290;
    int v17 = v5;
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Making request: waypoint for location %@", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v9 = (void *)MEMORY[0x1E4F644F0];
  id v10 = [MEMORY[0x1E4F64710] sharedService];
  uint64_t v8 = [v10 defaultTraits];

  int v11 = GEOConfigGetString();
  [v8 setAppIdentifier:v11];

  id v12 = (id)[v9 composedWaypointForLocation:v5 mapItem:0 traits:v8 completionHandler:v6 networkActivityHandler:0];
  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)composedWaypointForLocation:(id)a3 mapItem:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = (char *)a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    int v11 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    int v19 = 136446978;
    __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
    __int16 v21 = 1024;
    int v22 = 321;
    __int16 v23 = 2082;
    uint64_t v24 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForLocation:mapItem:completion:]";
    __int16 v25 = 2082;
    uint64_t v26 = "nil == (completion)";
    int v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_13:
    _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v19, 0x26u);
    goto LABEL_14;
  }
  if (!v7)
  {
    int v11 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    int v19 = 136446978;
    __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
    __int16 v21 = 1024;
    int v22 = 322;
    __int16 v23 = 2082;
    uint64_t v24 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForLocation:mapItem:completion:]";
    __int16 v25 = 2082;
    uint64_t v26 = "nil == (location)";
    int v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location";
    goto LABEL_13;
  }
  id v10 = GEOFindOrCreateLog();
  int v11 = v10;
  if (!v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136446978;
      __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v21 = 1024;
      int v22 = 323;
      __int16 v23 = 2082;
      uint64_t v24 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForLocation:mapItem:completion:]";
      __int16 v25 = 2082;
      uint64_t v26 = "nil == (mapItem)";
      int v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a map item";
      goto LABEL_13;
    }
LABEL_14:
    BOOL v16 = 0;
    goto LABEL_15;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138412290;
    __int16 v20 = v7;
    _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "Making request: waypoint for location %@", (uint8_t *)&v19, 0xCu);
  }

  id v12 = (void *)MEMORY[0x1E4F644F0];
  BOOL v13 = [MEMORY[0x1E4F64710] sharedService];
  int v11 = [v13 defaultTraits];

  id v14 = GEOConfigGetString();
  [v11 setAppIdentifier:v14];

  id v15 = (id)[v12 composedWaypointForLocation:v7 mapItem:v8 traits:v11 completionHandler:v9 networkActivityHandler:0];
  BOOL v16 = 1;
LABEL_15:

  return v16;
}

- (BOOL)composedWaypointForCurrentLocation:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = (char *)a3;
  id v6 = a4;
  if (!v6)
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446978;
      int v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v18 = 1024;
      int v19 = 339;
      __int16 v20 = 2082;
      __int16 v21 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForCurrentLocation:completion:]";
      __int16 v22 = 2082;
      __int16 v23 = "nil == (completion)";
      id v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    }
LABEL_11:
    BOOL v13 = 0;
    goto LABEL_12;
  }
  id v7 = GEOFindOrCreateLog();
  id v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446978;
      int v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v18 = 1024;
      int v19 = 340;
      __int16 v20 = 2082;
      __int16 v21 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForCurrentLocation:completion:]";
      __int16 v22 = 2082;
      __int16 v23 = "nil == (location)";
      id v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412290;
    int v17 = v5;
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Making request: waypoint for Currentlocation %@", (uint8_t *)&v16, 0xCu);
  }

  id v9 = (void *)MEMORY[0x1E4F644F0];
  id v10 = [MEMORY[0x1E4F64710] sharedService];
  id v8 = [v10 defaultTraits];

  int v11 = GEOConfigGetString();
  [v8 setAppIdentifier:v11];

  id v12 = (id)[v9 composedWaypointForCurrentLocation:v5 traits:v8 completionHandler:v6 networkActivityHandler:0];
  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)composedWaypointForAddressString:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = (char *)a3;
  id v6 = a4;
  if (!v6)
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446978;
      int v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v18 = 1024;
      int v19 = 355;
      __int16 v20 = 2082;
      __int16 v21 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForAddressString:completion:]";
      __int16 v22 = 2082;
      __int16 v23 = "nil == (completion)";
      id v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    }
LABEL_11:
    BOOL v13 = 0;
    goto LABEL_12;
  }
  id v7 = GEOFindOrCreateLog();
  id v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446978;
      int v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v18 = 1024;
      int v19 = 356;
      __int16 v20 = 2082;
      __int16 v21 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForAddressString:completion:]";
      __int16 v22 = 2082;
      __int16 v23 = "nil == (addressString)";
      id v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an address string";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412290;
    int v17 = v5;
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Making request: waypoint for address '%@'", (uint8_t *)&v16, 0xCu);
  }

  id v9 = (void *)MEMORY[0x1E4F644F0];
  id v10 = [MEMORY[0x1E4F64710] sharedService];
  id v8 = [v10 defaultTraits];

  int v11 = GEOConfigGetString();
  [v8 setAppIdentifier:v11];

  id v12 = (id)[v9 composedWaypointForAddressString:v5 traits:v8 clientAttributes:0 completionHandler:v6 networkActivityHandler:0];
  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)ETAFromWaypoint:(id)a3 toWaypoint:(id)a4 transportType:(int)a5 automobileOptions:(id)a6 completion:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if (!v14)
  {
    int v16 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136446978;
    id v30 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
    __int16 v31 = 1024;
    int v32 = 375;
    __int16 v33 = 2082;
    v34 = "-[MapsSuggestionsRealNetworkRequester ETAFromWaypoint:toWaypoint:transportType:automobileOptions:completion:]";
    __int16 v35 = 2082;
    v36 = "nil == (completion)";
    __int16 v21 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_17:
    _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, v21, buf, 0x26u);
    goto LABEL_18;
  }
  if (!v11)
  {
    int v16 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136446978;
    id v30 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
    __int16 v31 = 1024;
    int v32 = 376;
    __int16 v33 = 2082;
    v34 = "-[MapsSuggestionsRealNetworkRequester ETAFromWaypoint:toWaypoint:transportType:automobileOptions:completion:]";
    __int16 v35 = 2082;
    v36 = "nil == (hereWaypoint)";
    __int16 v21 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an origin waypoint";
    goto LABEL_17;
  }
  id v15 = GEOFindOrCreateLog();
  int v16 = v15;
  if (!v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v30 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v31 = 1024;
      int v32 = 377;
      __int16 v33 = 2082;
      v34 = "-[MapsSuggestionsRealNetworkRequester ETAFromWaypoint:toWaypoint:transportType:automobileOptions:completion:]";
      __int16 v35 = 2082;
      v36 = "nil == (thereWaypoint)";
      __int16 v21 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a destination waypoint";
      goto LABEL_17;
    }
LABEL_18:
    BOOL v20 = 0;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "Making request: eta", buf, 2u);
  }

  int v16 = objc_alloc_init(MEMORY[0x1E4F649A0]);
  [v16 setMainTransportType:v9];
  if (!v9)
  {
    if (v13) {
      [v16 setAutomobileOptions:v13];
    }
    id v17 = objc_alloc(MEMORY[0x1E4F7A080]);
    v28[0] = v11;
    v28[1] = v12;
    __int16 v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    uint64_t v19 = [v17 initWithAttributes:v16 waypoints:v18];

    int v16 = v19;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __109__MapsSuggestionsRealNetworkRequester_ETAFromWaypoint_toWaypoint_transportType_automobileOptions_completion___block_invoke;
  v23[3] = &unk_1E5CB9078;
  id v24 = v11;
  id v25 = v12;
  int v27 = v9;
  id v26 = v14;
  [v16 buildRouteAttributes:MEMORY[0x1E4F14428] result:v23];

  BOOL v20 = 1;
LABEL_19:

  return v20;
}

void __109__MapsSuggestionsRealNetworkRequester_ETAFromWaypoint_toWaypoint_transportType_automobileOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F64890];
  uint64_t v4 = *(void *)(a1 + 32);
  v12[0] = *(void *)(a1 + 40);
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a2;
  id v7 = [v5 arrayWithObjects:v12 count:1];
  uint64_t v8 = *(unsigned int *)(a1 + 56);
  uint64_t v9 = [v6 automobileOptions];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __109__MapsSuggestionsRealNetworkRequester_ETAFromWaypoint_toWaypoint_transportType_automobileOptions_completion___block_invoke_2;
  v10[3] = &unk_1E5CB7EF0;
  id v11 = *(id *)(a1 + 48);
  [v3 requestTrafficAndETAFromWaypoint:v4 toWaypoints:v7 transportType:v8 automobileOptions:v9 handler:v10];
}

void __109__MapsSuggestionsRealNetworkRequester_ETAFromWaypoint_toWaypoint_transportType_automobileOptions_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v9 count])
  {
    id v6 = [MapsSuggestionsTrafficAndETAResult alloc];
    id v7 = [v9 firstObject];
    uint64_t v8 = [(MapsSuggestionsTrafficAndETAResult *)v6 initWithGEOTrafficAndETAResult:v7];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (BOOL)routeForWaypoints:(id)a3 currentLocation:(id)a4 routeAttributes:(id)a5 feedback:(id)a6 completion:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v11)
  {
    int v16 = objc_alloc_init(MEMORY[0x1E4F64548]);
    [v16 setRequestType:1];
    -[NSObject setTransportType:](v16, "setTransportType:", [v13 mainTransportType]);
    [v16 setWaypoints:v11];
    [v16 setMaxRouteCount:1];
    [v16 setCurrentLocation:v12];
    [v16 setRouteAttributes:v13];
    [v14 setRequestingAppId:@"com.apple.MapsSuggestions"];
    [v16 setFeedback:v14];
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4F643F0]) initWithProxiedApplicationBundleId:@"com.apple.Maps"];
    [v16 setAuditToken:v17];

    __int16 v18 = [MEMORY[0x1E4F64540] sharedService];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __109__MapsSuggestionsRealNetworkRequester_routeForWaypoints_currentLocation_routeAttributes_feedback_completion___block_invoke;
    v21[3] = &unk_1E5CB90A0;
    id v22 = v15;
    id v19 = (id)[v18 requestDirections:v16 handler:v21];
  }
  else
  {
    int v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      __int16 v25 = 1024;
      int v26 = 420;
      __int16 v27 = 2082;
      v28 = "-[MapsSuggestionsRealNetworkRequester routeForWaypoints:currentLocation:routeAttributes:feedback:completion:]";
      __int16 v29 = 2082;
      id v30 = "nil == (routeWaypoints)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Waypoints should not be nil!", buf, 0x26u);
    }
  }

  return v11 != 0;
}

uint64_t __109__MapsSuggestionsRealNetworkRequester_routeForWaypoints_currentLocation_routeAttributes_feedback_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a4, a5, a6);
  }
  return result;
}

@end