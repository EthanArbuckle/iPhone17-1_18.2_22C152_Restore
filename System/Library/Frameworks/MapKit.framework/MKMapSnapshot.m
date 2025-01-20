@interface MKMapSnapshot
+ (id)createSnapshotWithOptions:(id)a3 timeoutInSeconds:(int64_t)a4;
- (BOOL)_hasNoDataPlaceholders;
- (CGPoint)pointForCoordinate:(CLLocationCoordinate2D)coordinate;
- (CLLocationCoordinate2D)_coordinateForPoint:(CGPoint)a3;
- (MKMapSnapshot)snapshotWithAnnotationView:(id)a3 atCoordinate:(CLLocationCoordinate2D)a4;
- (MKMapSnapshot)snapshotWithAnnotationView:(id)a3 atPoint:(CGPoint)a4;
- (UIImage)image;
- (UITraitCollection)traitCollection;
- (id)_initWithSnapshot:(id)a3 traitCollection:(id)a4;
- (id)_statsMemoryUsage;
- (void)_compositeOnImages:(id)a3 drawQueue:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (void)_displayAppleLogoForMapType:(unint64_t)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)_prepareForRenderWithAnnotationViews:(id)a3 workQueue:(id)a4 completionHandler:(id)a5;
@end

@implementation MKMapSnapshot

- (MKMapSnapshot)snapshotWithAnnotationView:(id)a3 atCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v7 = a3;
  -[MKMapSnapshot pointForCoordinate:](self, "pointForCoordinate:", latitude, longitude);
  v8 = -[MKMapSnapshot snapshotWithAnnotationView:atPoint:](self, "snapshotWithAnnotationView:atPoint:", v7);

  return (MKMapSnapshot *)v8;
}

- (MKMapSnapshot)snapshotWithAnnotationView:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = objc_opt_new();
    [v8 addSubview:v7];
  }
  v9 = [(MKMapSnapshot *)self image];
  [v9 size];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  v14 = [(MKMapSnapshot *)self image];
  [v14 scale];
  CGFloat v16 = v15;
  v29.width = v11;
  v29.height = v13;
  UIGraphicsBeginImageContextWithOptions(v29, 0, v16);

  v17 = [(MKMapSnapshot *)self image];
  objc_msgSend(v17, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  CurrentContext = UIGraphicsGetCurrentContext();
  UIGraphicsPushContext(CurrentContext);
  [v7 centerOffset];
  double v20 = v19;
  double v22 = v21;
  [v7 bounds];
  CGFloat v23 = v20 + x - CGRectGetWidth(v30) * 0.5;
  [v7 bounds];
  CGFloat Height = CGRectGetHeight(v31);
  CGContextTranslateCTM(CurrentContext, v23, v22 + y - Height * 0.5);
  v25 = [v7 layer];
  [v25 renderInContext:CurrentContext];

  UIGraphicsPopContext();
  v26 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return (MKMapSnapshot *)v26;
}

+ (id)createSnapshotWithOptions:(id)a3 timeoutInSeconds:(int64_t)a4
{
  id v5 = a3;
  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x3032000000;
  double v22 = __Block_byref_object_copy__20;
  CGFloat v23 = __Block_byref_object_dispose__20;
  id v24 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = [[MKMapSnapshotter alloc] initWithOptions:v5];
  v8 = dispatch_get_global_queue(25, 0);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  double v15 = __81__MKMapSnapshot_MKMapSnapshotExtras__createSnapshotWithOptions_timeoutInSeconds___block_invoke;
  CGFloat v16 = &unk_1E54BCEB0;
  v18 = &v19;
  v9 = v6;
  v17 = v9;
  [(MKMapSnapshotter *)v7 startWithQueue:v8 completionHandler:&v13];

  dispatch_time_t v10 = dispatch_time(0, 1000000000 * a4);
  if (dispatch_semaphore_wait(v9, v10)) {
    [(MKMapSnapshotter *)v7 cancel];
  }
  id v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);

  return v11;
}

void __81__MKMapSnapshot_MKMapSnapshotExtras__createSnapshotWithOptions_timeoutInSeconds___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (!a3) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_compositeOnImages:(id)a3 drawQueue:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v53 = a3;
  dispatch_time_t v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (![(NSArray *)self->_allTraitCollections count])
  {
LABEL_23:
    dispatch_async(v11, v12);
    goto LABEL_20;
  }
  NSUInteger v13 = [(NSArray *)self->_allTraitCollections count];
  if (v13 != [(NSArray *)self->_allImages count])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _allTraitCollections.count == _allImages.count", buf, 2u);
    }
    goto LABEL_23;
  }
  v52 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_allImages, "count"));
  if ([(NSArray *)self->_allImages count] < 2) {
    id v51 = 0;
  }
  else {
    id v51 = objc_alloc_init(MEMORY[0x1E4F42A88]);
  }
  uint64_t v14 = dispatch_group_create();
  double v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  CGFloat v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_DEFAULT, 0);

  if (v10 && [(NSArray *)self->_allTraitCollections count] > 1) {
    dispatch_queue_t v17 = dispatch_queue_create_with_target_V2(0, v16, v10);
  }
  else {
    dispatch_queue_t v17 = v10;
  }
  v18 = v17;
  queue = v11;
  v49 = v10;
  v46 = v16;
  v47 = v12;
  if ([(NSArray *)self->_allTraitCollections count] <= 1) {
    dispatch_queue_t v19 = v11;
  }
  else {
    dispatch_queue_t v19 = dispatch_queue_create_with_target_V2(0, v16, v11);
  }
  dispatch_queue_t v50 = v19;
  if ([(NSArray *)self->_allTraitCollections count])
  {
    unint64_t v20 = 0;
    do
    {
      dispatch_group_enter(v14);
      uint64_t v21 = [(NSArray *)self->_allTraitCollections objectAtIndexedSubscript:v20];
      double v22 = [(NSArray *)self->_allImages objectAtIndexedSubscript:v20];
      [v22 size];
      double v24 = v23;
      [v22 size];
      double v26 = v25;
      [v21 displayScale];
      CGFloat v28 = v27;
      double v29 = v24 * v27;
      size_t v30 = (unint64_t)(v24 * v27);
      double v31 = v26 * v27;
      size_t v32 = (unint64_t)(v26 * v27);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
      v35 = CGBitmapContextCreate(0, v30, v32, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2006u);
      CGFloat v36 = (double)(unint64_t)v29;
      CGFloat v37 = (double)(unint64_t)v31;
      v79.origin.double x = 0.0;
      v79.origin.double y = 0.0;
      v79.size.width = v36;
      v79.size.height = v37;
      CGContextClearRect(v35, v79);
      id v38 = v22;
      v39 = (CGImage *)[v38 CGImage];
      v80.origin.double x = 0.0;
      v80.origin.double y = 0.0;
      v80.size.width = v36;
      v80.size.height = v37;
      CGContextDrawImage(v35, v80, v39);
      CGContextTranslateCTM(v35, 0.0, v37);
      CGContextScaleCTM(v35, v28, -v28);
      CGContextGetCTM(&v77, v35);
      CGContextSetBaseCTM();
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke;
      v69[3] = &unk_1E54BF160;
      v72 = v35;
      id v40 = v21;
      id v70 = v40;
      id v71 = v53;
      uint64_t v73 = 0;
      uint64_t v74 = 0;
      double v75 = v24;
      double v76 = v26;
      v41 = (void (**)(void))MEMORY[0x18C139AE0](v69);
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_3;
      v62[3] = &unk_1E54BF188;
      v67 = v35;
      id v42 = v40;
      id v63 = v42;
      v68 = DeviceRGB;
      id v64 = v51;
      id v65 = v52;
      v66 = v14;
      v43 = (void (**)(void))MEMORY[0x18C139AE0](v62);
      if (v18)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_4;
        block[3] = &unk_1E54BF1B0;
        v60 = v41;
        v59 = v50;
        v61 = v43;
        dispatch_async(v18, block);
      }
      else
      {
        v41[2](v41);
        v43[2](v43);
      }

      ++v20;
    }
    while (v20 < [(NSArray *)self->_allTraitCollections count]);
  }
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_6;
  v54[3] = &unk_1E54BC110;
  v54[4] = self;
  id v55 = v52;
  id v56 = v51;
  id v12 = v47;
  id v57 = v47;
  id v44 = v51;
  id v45 = v52;
  id v11 = queue;
  dispatch_group_notify(v14, queue, v54);

  dispatch_time_t v10 = v49;
LABEL_20:
}

void __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  UIGraphicsPushContext(*(CGContextRef *)(a1 + 48));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_2;
  v4[3] = &unk_1E54BF138;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 72);
  long long v6 = *(_OWORD *)(a1 + 56);
  long long v7 = v3;
  [v2 performAsCurrentTraitCollection:v4];
  UIGraphicsPopContext();
}

uint64_t __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, double, double, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  Image = CGBitmapContextCreateImage(*(CGContextRef *)(a1 + 64));
  long long v3 = (void *)MEMORY[0x1E4F42A80];
  [*(id *)(a1 + 32) displayScale];
  objc_msgSend(v3, "imageWithCGImage:scale:orientation:", Image, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);
  CGColorSpaceRelease(*(CGColorSpaceRef *)(a1 + 72));
  CGContextRelease(*(CGContextRef *)(a1 + 64));
  [*(id *)(a1 + 40) registerImage:v4 withTraitCollection:*(void *)(a1 + 32)];
  [*(id *)(a1 + 48) addObject:v4];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_5;
  block[3] = &unk_1E54B82E8;
  id v4 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

uint64_t __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_6(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 40) count] < 2)
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 40) firstObject];
    uint64_t v8 = *(void *)(a1 + 32);
    long long v3 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = v7;
  }
  else
  {
    v2 = *(void **)(a1 + 48);
    long long v3 = [*(id *)(*(void *)(a1 + 32) + 32) firstObject];
    uint64_t v4 = [v2 imageWithTraitCollection:v3];
    uint64_t v5 = *(void *)(a1 + 32);
    long long v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;
  }
  v9 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v9();
}

- (void)_prepareForRenderWithAnnotationViews:(id)a3 workQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_time_t v10 = (void (**)(void))a5;
  if ([v8 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82__MKMapSnapshot__prepareForRenderWithAnnotationViews_workQueue_completionHandler___block_invoke;
    v11[3] = &unk_1E54BF1D8;
    id v12 = (void (**)(void))v8;
    NSUInteger v13 = self;
    [(MKMapSnapshot *)self _compositeOnImages:v11 drawQueue:MEMORY[0x1E4F14428] callbackQueue:v9 completionHandler:v10];

    dispatch_time_t v10 = v12;
  }
  else
  {
    v10[2](v10);
  }
}

void __82__MKMapSnapshot__prepareForRenderWithAnnotationViews_workQueue_completionHandler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", a2, a3, a4, a5);
  id v11 = [MEMORY[0x1E4F428B8] clearColor];
  [v10 setBackgroundColor:v11];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        dispatch_queue_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "addSubview:", v17, (void)v19);
        v18 = *(void **)(a1 + 40);
        [v17 coordinate];
        objc_msgSend(v18, "pointForCoordinate:");
        objc_msgSend(v17, "_updateAnchorPosition:alignToPixels:", 1);
        [v17 _updateFromMap];
        [v17 _didUpdatePosition];
        [v17 setNeedsLayout];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  [v10 layoutBelowIfNeeded];
  objc_msgSend(v10, "drawViewHierarchyInRect:afterScreenUpdates:", 1, a2, a3, a4, a5);
}

- (void)_displayAppleLogoForMapType:(unint64_t)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__MKMapSnapshot__displayAppleLogoForMapType_callbackQueue_completionHandler___block_invoke;
  v5[3] = &__block_descriptor_40_e39_v40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  v5[4] = a3;
  [(MKMapSnapshot *)self _compositeOnImages:v5 drawQueue:0 callbackQueue:a4 completionHandler:a5];
}

void __77__MKMapSnapshot__displayAppleLogoForMapType_callbackQueue_completionHandler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v7 = [MEMORY[0x1E4F42F80] currentTraitCollection];
  BOOL v8 = [v7 userInterfaceStyle] == 2;

  id v14 = +[MKAppleLogoImageView logoForMapType:*(void *)(a1 + 32) forDarkMode:v8];
  [v14 size];
  double v10 = a5 - (v9 + 10.0);
  [v14 size];
  double v12 = v11;
  [v14 size];
  objc_msgSend(v14, "drawInRect:", 14.0, v10, v12, v13);
}

- (id)_initWithSnapshot:(id)a3 traitCollection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v55.receiver = self;
  v55.super_class = (Class)MKMapSnapshot;
  double v9 = [(MKMapSnapshot *)&v55 init];
  p_isa = (id *)&v9->super.isa;
  double v11 = 0;
  if (v7 && v9)
  {
    objc_storeStrong((id *)&v9->_snapshot, a3);
    double v12 = [MEMORY[0x1E4F1CA48] array];
    double v13 = [MEMORY[0x1E4F1CA48] array];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __51__MKMapSnapshot__initWithSnapshot_traitCollection___block_invoke;
    v51[3] = &unk_1E54BF248;
    id v52 = v7;
    id v14 = v12;
    id v53 = v14;
    id v15 = v13;
    id v54 = v15;
    [v52 enumerateImagesWithBlock:v51];
    CGFloat v16 = p_isa + 4;
    objc_storeStrong(p_isa + 4, v12);
    dispatch_queue_t v17 = p_isa + 5;
    objc_storeStrong(p_isa + 5, v13);
    if ((unint64_t)[p_isa[5] count] >= 2
      && (uint64_t v18 = [*v17 count], v18 == objc_msgSend(*v16, "count")))
    {
      id v49 = v15;
      id v50 = v14;
      id v19 = objc_alloc_init(MEMORY[0x1E4F42A88]);
      if ([*v17 count])
      {
        unint64_t v20 = 0;
        do
        {
          long long v21 = [*v17 objectAtIndexedSubscript:v20];
          long long v22 = [*v16 objectAtIndexedSubscript:v20];
          [v19 registerImage:v21 withTraitCollection:v22];

          ++v20;
        }
        while (v20 < [*v17 count]);
      }
      double v23 = [v19 imageWithTraitCollection:v8];
      uint64_t v24 = v23;
      if (v23)
      {
        id v25 = v23;
        id v26 = p_isa[2];
        p_isa[2] = v25;
      }
      else
      {
        id v26 = [p_isa[4] firstObject];
        uint64_t v28 = [v19 imageWithTraitCollection:v26];
        id v29 = p_isa[2];
        p_isa[2] = (id)v28;
      }
      id v15 = v49;
      id v14 = v50;
    }
    else
    {
      uint64_t v27 = [p_isa[5] firstObject];
      id v19 = p_isa[2];
      p_isa[2] = (id)v27;
    }

    id v30 = p_isa[2];
    if (v30)
    {
      [v30 scale];
      double v32 = v31;
      [v8 displayScale];
      if (vabdd_f64(v32, v33) >= 0.000001)
      {
        [p_isa[2] size];
        CGFloat v35 = v34;
        CGFloat v37 = v36;
        [v8 displayScale];
        CGFloat v39 = v38;
        v56.width = v35;
        v56.height = v37;
        UIGraphicsBeginImageContextWithOptions(v56, 1, v39);
        id v40 = v15;
        id v41 = p_isa[2];
        [v41 size];
        double v43 = v42;
        [p_isa[2] size];
        id v44 = v41;
        id v15 = v40;
        objc_msgSend(v44, "drawInRect:", 0.0, 0.0, v43, v45);
        uint64_t v46 = UIGraphicsGetImageFromCurrentImageContext();
        id v47 = p_isa[2];
        p_isa[2] = (id)v46;

        UIGraphicsEndImageContext();
      }
      objc_storeStrong(p_isa + 3, a4);
      double v11 = p_isa;
    }
    else
    {
      double v11 = 0;
    }
  }
  return v11;
}

void __51__MKMapSnapshot__initWithSnapshot_traitCollection___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_alloc(MEMORY[0x1E4F42A80]);
  [a1[4] scale];
  id v7 = objc_msgSend(v6, "initWithCGImage:scale:orientation:", a3, 0);
  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4F42F80];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    double v12 = __51__MKMapSnapshot__initWithSnapshot_traitCollection___block_invoke_2;
    double v13 = &unk_1E54BF220;
    id v14 = a1[4];
    __int16 v16 = WORD2(a2);
    int v15 = a2;
    double v9 = [v8 traitCollectionWithTraits:&v10];
    objc_msgSend(a1[5], "addObject:", v9, v10, v11, v12, v13);
    [a1[6] addObject:v7];
  }
}

void __51__MKMapSnapshot__initWithSnapshot_traitCollection___block_invoke_2(uint64_t a1, void *a2)
{
  long long v3 = *(void **)(a1 + 32);
  id v5 = a2;
  [v3 scale];
  objc_msgSend(v5, "setDisplayScale:");
  if (*(unsigned char *)(a1 + 40) == 1) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  [v5 setUserInterfaceStyle:v4];
}

- (CGPoint)pointForCoordinate:(CLLocationCoordinate2D)coordinate
{
  -[VKMapSnapshot pointForCoordinate:](self->_snapshot, "pointForCoordinate:", coordinate.latitude, coordinate.longitude);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CLLocationCoordinate2D)_coordinateForPoint:(CGPoint)a3
{
  -[VKMapSnapshot coordinateForPoint:](self->_snapshot, "coordinateForPoint:", a3.x, a3.y);
  result.double longitude = v4;
  result.double latitude = v3;
  return result;
}

- (BOOL)_hasNoDataPlaceholders
{
  return 0;
}

- (id)_statsMemoryUsage
{
  return (id)[(VKMapSnapshot *)self->_snapshot memoryStats];
}

- (UIImage)image
{
  return self->_image;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allImages, 0);
  objc_storeStrong((id *)&self->_allTraitCollections, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end