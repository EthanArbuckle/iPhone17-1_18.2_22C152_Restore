@interface MapsSuggestionsUser
- (MapsSuggestionsUser)initWithMeCardReader:(id)a3 routine:(id)a4;
- (NSString)uniqueName;
- (char)hasVisitedMapItem:(id)a3 handler:(id)a4;
- (char)meCardForProminentPlacesAroundCoordinate:(CLLocationCoordinate2D)a3 maxDistance:(double)a4 maxAge:(double)a5 minVisits:(int64_t)a6 handler:(id)a7;
- (char)mostRecentVisitWithinDistance:(double)a3 ofMapItem:(id)a4 handler:(id)a5;
- (id).cxx_construct;
@end

@implementation MapsSuggestionsUser

- (MapsSuggestionsUser)initWithMeCardReader:(id)a3 routine:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUser.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 36;
      __int16 v22 = 2082;
      v23 = "-[MapsSuggestionsUser initWithMeCardReader:routine:]";
      __int16 v24 = 2082;
      v25 = "nil == (meCardReader)";
      _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a MeCardReader", buf, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v8)
  {
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUser.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 37;
      __int16 v22 = 2082;
      v23 = "-[MapsSuggestionsUser initWithMeCardReader:routine:]";
      __int16 v24 = 2082;
      v25 = "nil == (routine)";
      _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a Routine", buf, 0x26u);
    }
LABEL_11:

    v17 = 0;
    goto LABEL_12;
  }
  v20.receiver = self;
  v20.super_class = (Class)MapsSuggestionsUser;
  v10 = [(MapsSuggestionsUser *)&v20 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_meCardReader, a3);
    objc_storeStrong((id *)&v11->_routine, a4);
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    MSg::Queue::Queue((dispatch_queue_t *)buf, @"MapsSuggestionsUserQueue", v12);
    v13 = *(OS_dispatch_queue **)buf;
    *(void *)buf = 0;
    innerQueue = v11->_queue._innerQueue;
    v11->_queue._innerQueue = v13;

    v15 = *(NSString **)&buf[8];
    *(void *)&buf[8] = 0;
    name = v11->_queue._name;
    v11->_queue._name = v15;
  }
  self = v11;
  v17 = self;
LABEL_12:

  return v17;
}

- (char)meCardForProminentPlacesAroundCoordinate:(CLLocationCoordinate2D)a3 maxDistance:(double)a4 maxAge:(double)a5 minVisits:(int64_t)a6 handler:(id)a7
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v13 = a7;
  if (v13)
  {
    v14 = dispatch_group_create();
    *(void *)v49 = 0;
    *(void *)&v49[8] = v49;
    *(void *)&v49[16] = 0x3032000000;
    *(void *)&v49[24] = __Block_byref_object_copy__19;
    *(void *)&v49[32] = __Block_byref_object_dispose__19;
    id v50 = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = __Block_byref_object_copy__19;
    v43[4] = __Block_byref_object_dispose__19;
    id v44 = 0;
    dispatch_group_enter(v14);
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      CLLocationDegrees v46 = latitude;
      __int16 v47 = 2048;
      CLLocationDegrees v48 = longitude;
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "Getting MeCard from Favorites for <%+.6f,%+.6f>", buf, 0x16u);
    }

    meCardReader = self->_meCardReader;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __101__MapsSuggestionsUser_meCardForProminentPlacesAroundCoordinate_maxDistance_maxAge_minVisits_handler___block_invoke;
    v37[3] = &unk_1E5CBA710;
    v17 = v14;
    CLLocationDegrees v40 = latitude;
    CLLocationDegrees v41 = longitude;
    v38 = v17;
    v39 = v49;
    double v42 = a4;
    int v18 = [(MapsSuggestionsMeCardReader *)meCardReader readMeCardWithHandler:v37];
    dispatch_group_enter(v17);
    v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      CLLocationDegrees v46 = latitude;
      __int16 v47 = 2048;
      CLLocationDegrees v48 = longitude;
      _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_DEBUG, "Getting MeCard from Routine for <%+.6f,%+.6f>", buf, 0x16u);
    }

    routine = self->_routine;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __101__MapsSuggestionsUser_meCardForProminentPlacesAroundCoordinate_maxDistance_maxAge_minVisits_handler___block_invoke_157;
    v31[3] = &unk_1E5CBA710;
    v21 = v17;
    CLLocationDegrees v34 = latitude;
    CLLocationDegrees v35 = longitude;
    v32 = v21;
    v33 = v43;
    double v36 = a4;
    int v22 = [(MapsSuggestionsRoutine *)routine readMeCardWithMinVisits:a6 maxAge:v31 handler:a5];
    int v23 = v22;
    if (v18)
    {
      if (v22)
      {
LABEL_8:
        innerQueue = self->_queue._innerQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __101__MapsSuggestionsUser_meCardForProminentPlacesAroundCoordinate_maxDistance_maxAge_minVisits_handler___block_invoke_158;
        block[3] = &unk_1E5CBA738;
        v29 = v49;
        v30 = v43;
        id v28 = v13;
        dispatch_group_notify(v21, innerQueue, block);

        _Block_object_dispose(v43, 8);
        _Block_object_dispose(v49, 8);

        char v25 = 1;
        goto LABEL_12;
      }
    }
    else
    {
      dispatch_group_leave(v21);
      if (v23) {
        goto LABEL_8;
      }
    }
    dispatch_group_leave(v21);
    goto LABEL_8;
  }
  v21 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v49 = 136446978;
    *(void *)&v49[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUser.mm";
    *(_WORD *)&v49[12] = 1024;
    *(_DWORD *)&v49[14] = 54;
    *(_WORD *)&v49[18] = 2082;
    *(void *)&v49[20] = "-[MapsSuggestionsUser meCardForProminentPlacesAroundCoordinate:maxDistance:maxAge:minVisits:handler:]";
    *(_WORD *)&v49[28] = 2082;
    *(void *)&v49[30] = "nil == (handler)";
    _os_log_impl(&dword_1A70DF000, v21, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", v49, 0x26u);
  }
  char v25 = 0;
LABEL_12:

  return v25;
}

void __101__MapsSuggestionsUser_meCardForProminentPlacesAroundCoordinate_maxDistance_maxAge_minVisits_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  if (!v5 || v6)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "Could not read MeCard from Favorites: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(void **)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      int v14 = 134218240;
      id v15 = v9;
      __int16 v16 = 2048;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Getting MeCard from Favorites for <%+.6f,%+.6f>", (uint8_t *)&v14, 0x16u);
    }

    uint64_t v11 = MapsSuggestionsMeCardWithinDistance(v5, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v13 = *(NSObject **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }

  dispatch_group_leave(v7);
}

void __101__MapsSuggestionsUser_meCardForProminentPlacesAroundCoordinate_maxDistance_maxAge_minVisits_handler___block_invoke_157(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  if (!v5 || v6)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "Could not read MeCard from Routine: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(void **)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      int v14 = 134218240;
      id v15 = v9;
      __int16 v16 = 2048;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Getting MeCard from Routine for <%+.6f,%+.6f>", (uint8_t *)&v14, 0x16u);
    }

    uint64_t v11 = MapsSuggestionsMeCardWithinDistance(v5, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v13 = *(NSObject **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }

  dispatch_group_leave(v7);
}

void __101__MapsSuggestionsUser_meCardForProminentPlacesAroundCoordinate_maxDistance_maxAge_minVisits_handler___block_invoke_158(void *a1)
{
  MapsSuggestionsMeCardUnion(*(void **)(*(void *)(a1[5] + 8) + 40), *(void **)(*(void *)(a1[6] + 8) + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[4] + 16))();
}

- (char)hasVisitedMapItem:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446978;
      id v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUser.mm";
      __int16 v16 = 1024;
      int v17 = 116;
      __int16 v18 = 2082;
      v19 = "-[MapsSuggestionsUser hasVisitedMapItem:handler:]";
      __int16 v20 = 2082;
      v21 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", (uint8_t *)&v14, 0x26u);
    }
    goto LABEL_9;
  }
  if (!v6)
  {
    uint64_t v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446978;
      id v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUser.mm";
      __int16 v16 = 1024;
      int v17 = 117;
      __int16 v18 = 2082;
      v19 = "-[MapsSuggestionsUser hasVisitedMapItem:handler:]";
      __int16 v20 = 2082;
      v21 = "nil == (mapItem)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem", (uint8_t *)&v14, 0x26u);
    }
LABEL_9:

    char v11 = 0;
    goto LABEL_10;
  }
  [v6 coordinate];
  uint64_t v10 = CLLocationFromGEOLocationCoordinate2D(v8, v9);
  char v11 = [(MapsSuggestionsRoutine *)self->_routine fetchLastVisitAtLocation:v10 handler:v7];

LABEL_10:
  return v11;
}

- (char)mostRecentVisitWithinDistance:(double)a3 ofMapItem:(id)a4 handler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    char v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446978;
      id v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUser.mm";
      __int16 v16 = 1024;
      int v17 = 130;
      __int16 v18 = 2082;
      v19 = "-[MapsSuggestionsUser mostRecentVisitWithinDistance:ofMapItem:handler:]";
      __int16 v20 = 2082;
      v21 = "nil == (handler)";
      uint64_t v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_8:
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 0x26u);
    }
LABEL_9:

    char v10 = 0;
    goto LABEL_10;
  }
  if (!v8)
  {
    char v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446978;
      id v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUser.mm";
      __int16 v16 = 1024;
      int v17 = 131;
      __int16 v18 = 2082;
      v19 = "-[MapsSuggestionsUser mostRecentVisitWithinDistance:ofMapItem:handler:]";
      __int16 v20 = 2082;
      v21 = "nil == ((MapsSuggestionsMapItem *)mapItem)";
      uint64_t v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  char v10 = [(MapsSuggestionsRoutine *)self->_routine fetchMostRecentVisitWithinDistance:v8 ofMapItem:v9 handler:a3];
LABEL_10:

  return v10;
}

- (NSString)uniqueName
{
  id v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routine, 0);
  objc_storeStrong((id *)&self->_meCardReader, 0);

  innerQueue = self->_queue._innerQueue;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end