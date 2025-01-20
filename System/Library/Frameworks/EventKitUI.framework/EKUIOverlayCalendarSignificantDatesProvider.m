@interface EKUIOverlayCalendarSignificantDatesProvider
- (EKUIOverlayCalendarSignificantDatesProvider)init;
- (id)firstOfOverlayMonthsForCalendarMonth:(id)a3;
- (id)firstOfOverlayYearsForCalendarMonth:(id)a3;
- (id)significantDatesChangedHandler;
- (void)_invalidateCaches;
- (void)_load;
- (void)_requestDate:(id)a3;
- (void)dealloc;
- (void)setSignificantDatesChangedHandler:(id)a3;
@end

@implementation EKUIOverlayCalendarSignificantDatesProvider

- (void)setSignificantDatesChangedHandler:(id)a3
{
}

- (EKUIOverlayCalendarSignificantDatesProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)EKUIOverlayCalendarSignificantDatesProvider;
  v2 = [(EKUIOverlayCalendarSignificantDatesProvider *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("EKUIOverlayCalendarSignificantDatesProvider", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__invalidateCaches name:*MEMORY[0x1E4F57AB0] object:0];
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F57AB0] object:0];

  v4.receiver = self;
  v4.super_class = (Class)EKUIOverlayCalendarSignificantDatesProvider;
  [(EKUIOverlayCalendarSignificantDatesProvider *)&v4 dealloc];
}

- (void)_invalidateCaches
{
  currentRequest = self->_currentRequest;
  if (currentRequest)
  {
    objc_super v4 = currentRequest;
  }
  else
  {
    objc_super v4 = [(CalDateRange *)self->_cachedDateRange midpoint];
  }
  v11 = v4;
  cachedDateRange = self->_cachedDateRange;
  self->_cachedDateRange = 0;

  cachedCentralYear = self->_cachedCentralYear;
  self->_cachedCentralYear = 0;

  cachedFirstsOfMonths = self->_cachedFirstsOfMonths;
  self->_cachedFirstsOfMonths = 0;

  cachedFirstsOfYears = self->_cachedFirstsOfYears;
  self->_cachedFirstsOfYears = 0;

  ++self->_currentGeneration;
  v9 = CUIKGetOverlayCalendar();

  if (v9)
  {
    [(EKUIOverlayCalendarSignificantDatesProvider *)self _requestDate:v11];
  }
  else
  {
    significantDatesChangedHandler = (void (**)(id, void))self->_significantDatesChangedHandler;
    if (significantDatesChangedHandler) {
      significantDatesChangedHandler[2](significantDatesChangedHandler, 0);
    }
  }
}

- (id)firstOfOverlayMonthsForCalendarMonth:(id)a3
{
  id v4 = a3;
  [(EKUIOverlayCalendarSignificantDatesProvider *)self _requestDate:v4];
  v5 = [(NSDictionary *)self->_cachedFirstsOfMonths objectForKeyedSubscript:v4];

  return v5;
}

- (id)firstOfOverlayYearsForCalendarMonth:(id)a3
{
  id v4 = a3;
  [(EKUIOverlayCalendarSignificantDatesProvider *)self _requestDate:v4];
  v5 = [(NSDictionary *)self->_cachedFirstsOfYears objectForKeyedSubscript:v4];

  return v5;
}

- (void)_requestDate:(id)a3
{
  id v7 = a3;
  v5 = CUIKGetOverlayCalendar();

  if (v5)
  {
    if ([(CalDateRange *)self->_cachedCentralYear containsDate:v7])
    {
      currentRequest = self->_currentRequest;
      ++self->_currentGeneration;
      self->_currentRequest = 0;
    }
    else
    {
      objc_storeStrong((id *)&self->_currentRequest, a3);
      if (!self->_loadPending)
      {
        self->_loadPending = 1;
        [(EKUIOverlayCalendarSignificantDatesProvider *)self _load];
      }
    }
  }
}

- (void)_load
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = self;
  dispatch_async(queue, block);
}

void __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke(uint64_t a1)
{
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  v79[3] = 0;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__13;
  v77 = __Block_byref_object_dispose__13;
  id v78 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__13;
  v71 = __Block_byref_object_dispose__13;
  id v72 = 0;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__13;
  v65 = __Block_byref_object_dispose__13;
  id v66 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__13;
  v59 = __Block_byref_object_dispose__13;
  id v60 = 0;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_5;
  block[3] = &unk_1E6089E70;
  block[4] = *(void *)(a1 + 32);
  void block[5] = &v51;
  block[6] = v79;
  block[7] = &v73;
  block[8] = &v67;
  block[9] = &v61;
  block[10] = &v55;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  if (!*((unsigned char *)v52 + 24))
  {
    v2 = CUIKCalendar();
    dispatch_queue_t v3 = CUIKGetOverlayCalendar();
    if (v3)
    {
      if (!v62[5] || !v56[5])
      {
        uint64_t v4 = objc_opt_new();
        v5 = (void *)v62[5];
        v62[5] = v4;

        uint64_t v6 = objc_opt_new();
        id v7 = (void *)v56[5];
        v56[5] = v6;
      }
      v8 = [v2 components:6 fromDate:v74[5]];
      uint64_t v9 = [v2 dateFromComponents:v8];

      id v10 = objc_alloc(MEMORY[0x1E4F576D0]);
      v11 = [v2 dateByAddingUnit:4 value:1 toDate:v9 options:1024];
      v12 = (void *)[v10 initWithStartDate:v9 endDate:v11];

      uint64_t v13 = [v2 dateByAddingUnit:4 value:-2 toDate:v9 options:1024];
      v14 = [v12 endDate];
      uint64_t v15 = [v2 dateByAddingUnit:4 value:2 toDate:v14 options:1024];
      v33 = (void *)v9;

      v16 = (void *)[objc_alloc(MEMORY[0x1E4F576D0]) initWithStartDate:v13 endDate:v15];
      v31 = (void *)v15;
      v32 = (void *)v13;
      v17 = objc_opt_new();
      v18 = (void *)v62[5];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_2;
      v47[3] = &unk_1E6089E98;
      id v19 = v16;
      id v48 = v19;
      id v20 = v17;
      id v49 = v20;
      [v18 enumerateKeysAndObjectsUsingBlock:v47];
      [(id)v62[5] removeObjectsForKeys:v20];
      [(id)v56[5] removeObjectsForKeys:v20];
      v34 = v3;
      v21 = [v19 subtractRange:v68[5]];
      v22 = objc_opt_new();
      v23 = objc_opt_new();
      v24 = [v21 distinctRanges];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_3;
      v42[3] = &unk_1E6089EE8;
      id v43 = v34;
      id v44 = v2;
      id v25 = v22;
      id v45 = v25;
      id v26 = v23;
      id v46 = v26;
      [v24 enumerateObjectsUsingBlock:v42];

      [(id)v62[5] setValuesForKeysWithDictionary:v25];
      [(id)v56[5] setValuesForKeysWithDictionary:v26];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_5;
      v35[3] = &unk_1E6089F10;
      v35[4] = *(void *)(a1 + 32);
      id v36 = v19;
      v39 = v79;
      v40 = &v61;
      v41 = &v55;
      id v37 = v12;
      id v38 = v21;
      id v27 = v21;
      id v28 = v12;
      id v29 = v19;
      v30 = (void *)MEMORY[0x1E4F14428];
      dispatch_sync(MEMORY[0x1E4F14428], v35);

      dispatch_queue_t v3 = v34;
    }
  }
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(v79, 8);
}

void __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_5(void *a1)
{
  uint64_t v2 = a1[4];
  if (!*(void *)(v2 + 56) || objc_msgSend(*(id *)(v2 + 16), "containsDate:")) {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 48);
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), *(id *)(a1[4] + 56));
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), *(id *)(a1[4] + 8));
    uint64_t v3 = [*(id *)(a1[4] + 24) mutableCopy];
    uint64_t v4 = *(void *)(a1[9] + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v6 = [*(id *)(a1[4] + 32) mutableCopy];
    uint64_t v7 = *(void *)(a1[10] + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  uint64_t v9 = a1[4];
  id v10 = *(void **)(v9 + 56);
  *(void *)(v9 + 56) = 0;

  *(unsigned char *)(a1[4] + 64) = 0;
}

void __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsDate:") & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  [v4 setDay:1];
  id v5 = a1[4];
  uint64_t v6 = [v3 startDate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_4;
  v8[3] = &unk_1E6089EC0;
  id v9 = v3;
  id v10 = a1[5];
  id v11 = a1[6];
  id v12 = a1[4];
  id v13 = a1[7];
  id v7 = v3;
  [v5 enumerateDatesStartingAfterDate:v6 matchingComponents:v4 options:1024 usingBlock:v8];
}

void __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_4(id *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  if (objc_msgSend(a1[4], "containsDate:"))
  {
    uint64_t v6 = [a1[5] components:30 fromDate:v14];
    uint64_t v7 = [v6 day];
    [v6 setDay:1];
    v8 = [a1[5] dateFromComponents:v6];
    id v9 = [a1[6] objectForKeyedSubscript:v8];
    if (!v9)
    {
      id v9 = objc_opt_new();
      [a1[6] setObject:v9 forKeyedSubscript:v8];
    }
    id v10 = [NSNumber numberWithInteger:v7];
    [v9 addObject:v10];

    id v11 = [a1[7] components:8 fromDate:v14];
    if ([v11 month] == 1 && (objc_msgSend(v11, "isLeapMonth") & 1) == 0)
    {
      id v12 = [a1[8] objectForKeyedSubscript:v8];
      if (!v12)
      {
        id v12 = objc_opt_new();
        [a1[8] setObject:v12 forKeyedSubscript:v8];
      }
      id v13 = [NSNumber numberWithInteger:v7];
      [v12 addObject:v13];
    }
  }
  else
  {
    *a4 = 1;
  }
}

uint64_t __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_5(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(*(void *)(*(void *)(result + 64) + 8) + 24) == *(void *)(v1 + 48))
  {
    uint64_t v2 = result;
    objc_storeStrong((id *)(v1 + 8), *(id *)(result + 40));
    objc_storeStrong((id *)(*(void *)(v2 + 32) + 16), *(id *)(v2 + 48));
    objc_storeStrong((id *)(*(void *)(v2 + 32) + 24), *(id *)(*(void *)(*(void *)(v2 + 72) + 8) + 40));
    objc_storeStrong((id *)(*(void *)(v2 + 32) + 32), *(id *)(*(void *)(*(void *)(v2 + 80) + 8) + 40));
    result = *(void *)(*(void *)(v2 + 32) + 72);
    if (result)
    {
      id v3 = *(uint64_t (**)(void))(result + 16);
      return v3();
    }
  }
  return result;
}

- (id)significantDatesChangedHandler
{
  return self->_significantDatesChangedHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_significantDatesChangedHandler, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedFirstsOfYears, 0);
  objc_storeStrong((id *)&self->_cachedFirstsOfMonths, 0);
  objc_storeStrong((id *)&self->_cachedCentralYear, 0);

  objc_storeStrong((id *)&self->_cachedDateRange, 0);
}

@end