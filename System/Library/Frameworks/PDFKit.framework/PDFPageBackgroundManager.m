@interface PDFPageBackgroundManager
- (BOOL)_expectedQualityIndexForPageIndex:(unint64_t)a3 forQuality:(int *)a4;
- (BOOL)_findPageIndexNeedingUpdate:(unint64_t *)a3 forQuality:(int *)a4;
- (BOOL)drawProgressCallback;
- (PDFPageBackgroundManager)initWithDelegate:(id)a3 andRenderingProperties:(id)a4;
- (id)backgroundImageForPageIndex:(unint64_t)a3 withFoundQuality:(int *)a4;
- (void)_cleanup;
- (void)_drawPageImage:(unint64_t)a3 forQuality:(int)a4;
- (void)_shiftImagesAtIndex:(unint64_t)a3 downwards:(BOOL)a4;
- (void)_update;
- (void)cancel;
- (void)dealloc;
- (void)didInsertPageAtIndex:(unint64_t)a3;
- (void)didRemovePageAtIndex:(unint64_t)a3;
- (void)didSwapPageAtIndex:(unint64_t)a3 withIndex:(unint64_t)a4;
- (void)forceSetBackgroundImage:(id)a3 forPageIndex:(unint64_t)a4;
- (void)forceUpdateActivePageIndex:(unint64_t)a3 withMaxDuration:(double)a4;
- (void)updateActivePageIndex:(unint64_t)a3;
- (void)willForceUpdate;
@end

@implementation PDFPageBackgroundManager

- (PDFPageBackgroundManager)initWithDelegate:(id)a3 andRenderingProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PDFPageBackgroundManager;
  v8 = [(PDFPageBackgroundManager *)&v24 init];
  if (v8)
  {
    v9 = objc_alloc_init(PDFPageBackgroundManagerPrivate);
    v10 = v8->_private;
    v8->_private = v9;

    objc_storeWeak((id *)&v8->_private->documentDelegate, v6);
    objc_storeWeak((id *)&v8->_private->renderingProperties, v7);
    v8->_private->activePageIndex = -1;
    for (uint64_t i = 32; i != 56; i += 8)
    {
      v12 = (objc_class *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v13 = v8->_private;
      v14 = *(Class *)((char *)&v13->super.isa + i);
      *(Class *)((char *)&v13->super.isa + i) = v12;
    }
    v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v16 = dispatch_queue_create("PDFKit.PDFPageBackgroundManager", v15);
    v17 = v8->_private;
    workQueue = v17->workQueue;
    v17->workQueue = (OS_dispatch_queue *)v16;

    v8->_private->isCancled = 0;
    v8->_private->isWorking = 0;
    v8->_private->willForceUpdate = 0;
    v19 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v20 = [v19 persistentDomainForName:@"com.apple.universalaccess"];

    v21 = [v20 objectForKey:@"reduceTransparency"];
    v22 = v21;
    if (v21 && ([v21 BOOLValue] & 1) != 0 || (objc_msgSend(v7, "enableBackgroundImages") & 1) == 0) {
      v8->_private->isCancled = 1;
    }
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  self->_private->isCancled = 1;
  v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = 0;
  self->_private->isWorking = 1;
  do
  {
    v5 = self->_private->backgroundImageCache[v4];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v5;
    uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
          id WeakRetained = objc_loadWeakRetained((id *)&self->_private->documentDelegate);
          v12 = [WeakRetained document];
          v13 = objc_msgSend(v12, "pageAtIndex:", objc_msgSend(v10, "unsignedIntegerValue"));

          [WeakRetained recieveBackgroundImage:0 atBackgroundQuality:v4 forPage:v13];
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    ++v4;
  }
  while (v4 != 3);
  objc_sync_exit(v3);

  v14.receiver = v3;
  v14.super_class = (Class)PDFPageBackgroundManager;
  [(PDFPageBackgroundManager *)&v14 dealloc];
}

- (void)updateActivePageIndex:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v4 = obj->_private;
  if (v4->activePageIndex != a3)
  {
    v4->activePageIndex = a3;
    [(PDFPageBackgroundManager *)obj _update];
  }
  objc_sync_exit(obj);
}

- (void)willForceUpdate
{
  obj = self;
  objc_sync_enter(obj);
  obj->_private->willForceUpdate = 1;
  objc_sync_exit(obj);
}

- (void)forceUpdateActivePageIndex:(unint64_t)a3 withMaxDuration:(double)a4
{
  id v6 = self;
  objc_sync_enter(v6);
  v6->_private->isWorking = 1;
  objc_sync_exit(v6);

  v6->_private->activePageIndex = a3;
  uint64_t v7 = dispatch_group_create();
  objc_initWeak(&location, v6);
  workQueue = v6->_private->workQueue;
  uint64_t block = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __71__PDFPageBackgroundManager_forceUpdateActivePageIndex_withMaxDuration___block_invoke;
  objc_super v14 = &unk_264204550;
  objc_copyWeak(v16, &location);
  long long v15 = v6;
  v16[1] = (id)a3;
  dispatch_group_async(v7, workQueue, &block);
  if (a4 > 0.0)
  {
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    if (dispatch_group_wait(v7, v9))
    {
      float v10 = a4;
      NSLog(&cfstr_WarningUnableT.isa, a3, v10, block, v12, v13, v14);
    }
  }
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __71__PDFPageBackgroundManager_forceUpdateActivePageIndex_withMaxDuration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) _drawPageImage:*(void *)(a1 + 48) forQuality:0];
    *(unsigned char *)(WeakRetained[1] + 65) = 0;
    *(unsigned char *)(WeakRetained[1] + 66) = 0;
    [WeakRetained _update];
  }
}

- (id)backgroundImageForPageIndex:(unint64_t)a3 withFoundQuality:(int *)a4
{
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = v6->_private->backgroundImageCache[v7];
    dispatch_time_t v9 = [NSNumber numberWithUnsignedInteger:a3];
    float v10 = [(NSMutableDictionary *)v8 objectForKey:v9];

    if (v10) {
      break;
    }
    if (++v7 == 3) {
      goto LABEL_6;
    }
  }
  *a4 = v7;
LABEL_6:
  objc_sync_exit(v6);

  return v10;
}

- (void)didInsertPageAtIndex:(unint64_t)a3
{
  [(PDFPageBackgroundManager *)self _shiftImagesAtIndex:a3 downwards:1];

  [(PDFPageBackgroundManager *)self _update];
}

- (void)didRemovePageAtIndex:(unint64_t)a3
{
  [(PDFPageBackgroundManager *)self _shiftImagesAtIndex:a3 + 1 downwards:0];

  [(PDFPageBackgroundManager *)self _update];
}

- (void)didSwapPageAtIndex:(unint64_t)a3 withIndex:(unint64_t)a4
{
  id v6 = self;
  objc_sync_enter(v6);
  for (uint64_t i = 32; i != 56; i += 8)
  {
    id v8 = *(id *)((char *)&v6->_private->super.isa + i);
    dispatch_time_t v9 = [NSNumber numberWithUnsignedInteger:a3];
    float v10 = [v8 objectForKey:v9];

    v11 = [NSNumber numberWithUnsignedInteger:a4];
    uint64_t v12 = [v8 objectForKey:v11];

    v13 = [NSNumber numberWithUnsignedInteger:a4];
    if (v10) {
      [v8 setObject:v10 forKey:v13];
    }
    else {
      [v8 removeObjectForKey:v13];
    }

    objc_super v14 = [NSNumber numberWithUnsignedInteger:a3];
    if (v12) {
      [v8 setObject:v12 forKey:v14];
    }
    else {
      [v8 removeObjectForKey:v14];
    }
  }
  objc_sync_exit(v6);

  [(PDFPageBackgroundManager *)v6 _update];
}

- (void)cancel
{
  self->_private->isCancled = 1;
}

- (void)forceSetBackgroundImage:(id)a3 forPageIndex:(unint64_t)a4
{
  id v12 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = v6->_private->backgroundImageCache[0];
  id v8 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)v7 setObject:v12 forKey:v8];

  objc_sync_exit(v6);
  id WeakRetained = objc_loadWeakRetained((id *)&v6->_private->documentDelegate);
  float v10 = [WeakRetained document];
  v11 = [v10 pageAtIndex:a4];
  [WeakRetained recieveBackgroundImage:v12 atBackgroundQuality:0 forPage:v11];
}

- (void)_update
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_private;
  if (!*(_WORD *)&v3->isCancled && !v3->willForceUpdate)
  {
    v3->isWorking = 1;
    v11 = 0;
    int v10 = 0;
    if ([(PDFPageBackgroundManager *)v2 _findPageIndexNeedingUpdate:&v11 forQuality:&v10])
    {
      objc_initWeak(&location, v2);
      workQueue = v2->_private->workQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __35__PDFPageBackgroundManager__update__block_invoke;
      block[3] = &unk_264204578;
      objc_copyWeak(v7, &location);
      int v8 = v10;
      v7[1] = v11;
      block[4] = v2;
      dispatch_async(workQueue, block);
      objc_destroyWeak(v7);
      objc_destroyWeak(&location);
    }
    else
    {
      [(PDFPageBackgroundManager *)v2 _cleanup];
      v5 = v2;
      objc_sync_enter(v5);
      v2->_private->isWorking = 0;
      objc_sync_exit(v5);
    }
  }
  objc_sync_exit(v2);
}

void __35__PDFPageBackgroundManager__update__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    [WeakRetained _drawPageImage:*(void *)(a1 + 48) forQuality:*(unsigned int *)(a1 + 56)];
    [v4 _cleanup];
    id v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    *(unsigned char *)(v4[1] + 65) = 0;
    objc_sync_exit(v3);

    [*(id *)(a1 + 32) _update];
    id WeakRetained = v4;
  }
}

- (BOOL)_findPageIndexNeedingUpdate:(unint64_t *)a3 forQuality:(int *)a4
{
  uint64_t v4 = self->_private;
  if (v4->activePageIndex == -1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v4->documentDelegate);
  dispatch_time_t v9 = [WeakRetained document];

  int activePageIndex = self->_private->activePageIndex;
  if (activePageIndex <= 1) {
    int activePageIndex = 1;
  }
  unint64_t v11 = (activePageIndex - 1);
  uint64_t v12 = [v9 pageCount];
  if (v12 - 1 >= (unint64_t)(LODWORD(self->_private->activePageIndex) + 1)) {
    unint64_t v13 = LODWORD(self->_private->activePageIndex) + 1;
  }
  else {
    unint64_t v13 = v12 - 1;
  }
  for (id i = objc_alloc_init(MEMORY[0x263EFF980]); v11 <= v13; ++v11)
  {
    int v24 = 0;
    if ([(PDFPageBackgroundManager *)self _expectedQualityIndexForPageIndex:v11 forQuality:&v24])
    {
      long long v15 = self->_private->backgroundImageCache[v24];
      long long v16 = [NSNumber numberWithUnsignedInteger:v11];
      long long v17 = [(NSMutableDictionary *)v15 objectForKey:v16];

      if (!v17)
      {
        long long v18 = [NSNumber numberWithUnsignedInteger:v11];
        [i addObject:v18];
      }
    }
  }
  uint64_t v19 = [i count];
  BOOL v20 = v19 != 0;
  if (v19)
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __67__PDFPageBackgroundManager__findPageIndexNeedingUpdate_forQuality___block_invoke;
    v23[3] = &unk_2642045A0;
    v23[4] = self;
    [i sortUsingComparator:v23];
    v21 = [i firstObject];
    *a3 = [v21 unsignedIntegerValue];

    [(PDFPageBackgroundManager *)self _expectedQualityIndexForPageIndex:*a3 forQuality:a4];
  }

  return v20;
}

BOOL __67__PDFPageBackgroundManager__findPageIndexNeedingUpdate_forQuality___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v5 = a3;
  int v6 = v4 - [a2 intValue];
  if (v6 >= 0) {
    unsigned int v7 = v6;
  }
  else {
    unsigned int v7 = -v6;
  }
  int v8 = [v5 intValue];

  unsigned int v9 = v4 - v8;
  if (v4 - v8 < 0) {
    unsigned int v9 = v8 - v4;
  }
  return v7 > v9;
}

- (void)_drawPageImage:(unint64_t)a3 forQuality:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v68[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->documentDelegate);
  int v8 = [WeakRetained document];
  unsigned int v9 = [v8 pageAtIndex:a3];
  if (v9)
  {
    int v64 = 0;
    int v10 = [WeakRetained backgroundImageForPage:v9 withQuality:&v64];
    int v11 = v64;
    uint64_t v12 = self;
    objc_sync_enter(v12);
    unint64_t v13 = self->_private->backgroundImageCache[v4];
    if (v10) {
      BOOL v14 = v11 == v4;
    }
    else {
      BOOL v14 = 0;
    }
    if (v14)
    {
      long long v17 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)v13 setObject:v10 forKey:v17];

      objc_sync_exit(v12);
    }
    else
    {
      long long v15 = [NSNumber numberWithUnsignedInteger:a3];
      uint64_t v16 = [(NSMutableDictionary *)v13 objectForKey:v15];

      objc_sync_exit(v12);
      if (v16)
      {
        [WeakRetained recieveBackgroundImage:v16 atBackgroundQuality:v4 forPage:v9];
        int v10 = (void *)v16;
      }
      else
      {
        id v62 = objc_loadWeakRetained((id *)&self->_private->renderingProperties);
        uint64_t v18 = [v62 displayBox];
        [v9 boundsForBox:v18];
        double v20 = v19;
        double v22 = v21;
        double v23 = kPDFPageBackgroundQualityFactors[v4];
        if ((PDFKitDeviceIsN61() & 1) != 0 || PDFKitDeviceIsN56()) {
          double v26 = 400.0;
        }
        else {
          double v26 = 800.0;
        }
        double v27 = v26;
        double v28 = v23 * v20;
        double v29 = v23 * v22;
        if (v23 * v20 > v26 || v29 > v26)
        {
          v24.n128_u64[0] = 0;
          v25.n128_u64[0] = 0;
          double v30 = PDFRectMake(v24, v25, v23 * v20, v29);
          double v32 = v31;
          double v34 = v33;
          double v36 = v35;
          v37.n128_u64[0] = 0;
          v38.n128_u64[0] = 0;
          double v39 = PDFRectMake(v37, v38, v27, v27);
          double v43 = PDFScaleRectToRect(v30, v32, v34, v36, v39, v40, v41, v42);
          double v28 = v28 * v43;
          double v29 = v29 * v43;
        }
        double MachSeconds = GetMachSeconds();
        v67 = @"PDFPageImageProperty_WithRotation";
        v68[0] = MEMORY[0x263EFFA80];
        v45 = [NSDictionary dictionaryWithObjects:v68 forKeys:&v67 count:1];
        int v10 = objc_msgSend(v9, "imageOfSize:forBox:withOptions:", v18, v45, ceil(v28), ceil(v29));

        if (v10 && !self->_private->isCancled)
        {
          if (GetDefaultsWriteLogPerfTimes())
          {
            v46 = [MEMORY[0x263EFF910] date];
            [v46 timeIntervalSince1970];
            double v48 = v47;

            [v10 size];
            double v50 = v49;
            [v10 size];
            double v52 = v51;
            double v53 = GetMachSeconds();
            NSLog(&cfstr_Pdfkit2Logperf_3.isa, a3, (int)v50, (int)v52, (unint64_t)(v48 * 1000.0), v53 - MachSeconds);
          }
          v54 = v12;
          objc_sync_enter(v54);
          v55 = self->_private->backgroundImageCache[v4];
          v56 = [NSNumber numberWithUnsignedInteger:a3];
          [(NSMutableDictionary *)v55 setObject:v10 forKey:v56];

          objc_sync_exit(v54);
          int v63 = 0;
          BOOL v57 = [(PDFPageBackgroundManager *)v54 _expectedQualityIndexForPageIndex:a3 forQuality:&v63];
          if (v63 == v4 && v57) {
            [WeakRetained recieveBackgroundImage:v10 atBackgroundQuality:v4 forPage:v9];
          }
          v59 = [MEMORY[0x263F08A00] defaultCenter];
          v65[0] = @"page";
          v65[1] = @"quality";
          v66[0] = v9;
          v60 = [NSNumber numberWithUnsignedInt:v4];
          v66[1] = v60;
          v61 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:2];
          [v59 postNotificationName:@"PDFPageBackgroundComplete" object:v54 userInfo:v61];
        }
      }
    }
  }
}

- (BOOL)_expectedQualityIndexForPageIndex:(unint64_t)a3 forQuality:(int *)a4
{
  id v5 = self;
  objc_sync_enter(v5);
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_private->documentDelegate);
  int v7 = 0;
  unint64_t v8 = 0;
  BOOL v9 = 1;
  while (1)
  {
    int activePageIndex = v5->_private->activePageIndex;
    int v11 = [WeakRetained document];
    int v12 = [v11 pageCount];

    if (((activePageIndex - v7) & ~((activePageIndex - v7) >> 31)) <= a3)
    {
      int v13 = v12 - 1;
      if (v12 - 1 >= v7 + LODWORD(v5->_private->activePageIndex)) {
        int v13 = v7 + LODWORD(v5->_private->activePageIndex);
      }
      if (v13 >= a3) {
        break;
      }
    }
    BOOL v9 = v8 < 2;
    int v7 = kPDFPageBackgroundQualtyRanges[++v8];
    if (v8 == 2)
    {
      BOOL v9 = 0;
      goto LABEL_9;
    }
  }
  *a4 = v8;
LABEL_9:

  objc_sync_exit(v5);
  return v9;
}

- (void)_cleanup
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  obj = v2;
  id v3 = v2->_private;
  if (v3->activePageIndex != -1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v3->documentDelegate);
    uint64_t v4 = [WeakRetained document];
    id v5 = v4;
    int v6 = v2;
    if (SLODWORD(v2->_private->activePageIndex) <= 1) {
      int activePageIndex = 1;
    }
    else {
      int activePageIndex = v2->_private->activePageIndex;
    }
    uint64_t v8 = 0;
    unint64_t v9 = (activePageIndex - 1);
    unint64_t v10 = objc_msgSend(v4, "pageCount", obj) - 1;
    if (v10 >= LODWORD(v6->_private->activePageIndex) + 1) {
      unint64_t v10 = LODWORD(v6->_private->activePageIndex) + 1;
    }
    unint64_t v38 = v10;
    do
    {
      int v11 = obj->_private->backgroundImageCache[v8];
      id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      int v13 = v11;
      uint64_t v14 = [(NSMutableDictionary *)v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v43 != v15) {
              objc_enumerationMutation(v13);
            }
            long long v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            if ([v17 intValue] < v9
              || v38 < (int)[v17 intValue])
            {
              uint64_t v18 = objc_msgSend(v5, "pageAtIndex:", (int)objc_msgSend(v17, "intValue"));
              [WeakRetained recieveBackgroundImage:0 atBackgroundQuality:v8 forPage:v18];
              [v12 addObject:v17];
            }
          }
          uint64_t v14 = [(NSMutableDictionary *)v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
        }
        while (v14);
      }

      [(NSMutableDictionary *)v13 removeObjectsForKeys:v12];
      ++v8;
    }
    while (v8 != 3);
    if (v38 >= v9)
    {
      while (1)
      {
        unsigned int v41 = 0;
        if ([(PDFPageBackgroundManager *)obj _expectedQualityIndexForPageIndex:v9 forQuality:&v41])
        {
          break;
        }
LABEL_36:
        if (++v9 > v38) {
          goto LABEL_37;
        }
      }
      double v19 = [v5 pageAtIndex:v9];
      int v40 = 0;
      uint64_t v20 = [WeakRetained backgroundImageForPage:v19 withQuality:&v40];
      double v21 = (void *)v20;
      if (v20)
      {
        if (v41 == v40)
        {
          double v22 = (void *)v20;
LABEL_35:

          goto LABEL_36;
        }
        double v23 = obj->_private->backgroundImageCache[v41];
        __n128 v24 = [NSNumber numberWithUnsignedInteger:v9];
        double v22 = [(NSMutableDictionary *)v23 objectForKey:v24];

        if (v22) {
          [WeakRetained recieveBackgroundImage:v22 atBackgroundQuality:v41 forPage:v19];
        }
        __n128 v25 = obj->_private->backgroundImageCache[v40];
        double v26 = [NSNumber numberWithUnsignedInteger:v9];
        [(NSMutableDictionary *)v25 removeObjectForKey:v26];

        if (v22) {
          goto LABEL_35;
        }
      }
      if (v41)
      {
        if (v41 == 1)
        {
          double v34 = obj->_private->backgroundImageCache[2];
          double v35 = [NSNumber numberWithUnsignedInteger:v9];
          [(NSMutableDictionary *)v34 removeObjectForKey:v35];

          double v36 = obj->_private->backgroundImageCache[0];
          double v30 = [NSNumber numberWithUnsignedInteger:v9];
          [(NSMutableDictionary *)v36 removeObjectForKey:v30];
        }
        else
        {
          if (v41 != 2)
          {
LABEL_34:
            double v22 = 0;
            goto LABEL_35;
          }
          double v27 = obj->_private->backgroundImageCache[1];
          double v28 = [NSNumber numberWithUnsignedInteger:v9];
          [(NSMutableDictionary *)v27 removeObjectForKey:v28];

          double v29 = obj->_private->backgroundImageCache[0];
          double v30 = [NSNumber numberWithUnsignedInteger:v9];
          [(NSMutableDictionary *)v29 removeObjectForKey:v30];
        }
      }
      else
      {
        double v31 = obj->_private->backgroundImageCache[2];
        double v32 = [NSNumber numberWithUnsignedInteger:v9];
        [(NSMutableDictionary *)v31 removeObjectForKey:v32];

        double v33 = obj->_private->backgroundImageCache[1];
        double v30 = [NSNumber numberWithUnsignedInteger:v9];
        [(NSMutableDictionary *)v33 removeObjectForKey:v30];
      }

      goto LABEL_34;
    }
LABEL_37:
  }
  objc_sync_exit(obj);
}

- (void)_shiftImagesAtIndex:(unint64_t)a3 downwards:(BOOL)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  obuint64_t j = self;
  objc_sync_enter(obj);
  for (uint64_t i = 0; i != 3; ++i)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    int v7 = obj->_private->backgroundImageCache[i];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v8 = v7;
    uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v21 + 1) + 8 * j);
          unsigned int v13 = [v12 intValue];
          uint64_t v14 = [(NSMutableDictionary *)v8 objectForKey:v12];
          if ((int)v13 < a3) {
            uint64_t v15 = v13;
          }
          else {
            uint64_t v15 = v13 + 1;
          }
          uint64_t v16 = [NSNumber numberWithInt:v15];
          [v6 setObject:v14 forKey:v16];
        }
        uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    uint64_t v17 = (uint64_t)obj->_private + 8 * i;
    uint64_t v18 = *(void **)(v17 + 32);
    *(void *)(v17 + 32) = v6;
    id v19 = v6;
  }
  objc_sync_exit(obj);
}

- (BOOL)drawProgressCallback
{
  return !self->_private->isCancled;
}

- (void).cxx_destruct
{
}

@end