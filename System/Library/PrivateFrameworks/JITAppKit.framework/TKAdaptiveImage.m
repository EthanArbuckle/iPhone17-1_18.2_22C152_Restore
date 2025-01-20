@interface TKAdaptiveImage
+ (id)zeroTrait;
- (BOOL)loading;
- (NSString)priority;
- (NSString)service;
- (NSURL)currentURL;
- (NSURL)url;
- (TKAdaptiveImage)init;
- (UIColor)backgroundColor;
- (UIImage)image;
- (double)quality;
- (id)imageTraitForMetrics;
- (id)traits;
- (id)url:(id)a3 withTrait:(id)a4;
- (unint64_t)state;
- (void)adaptiveMetricsDidChange;
- (void)dealloc;
- (void)didLoadImage:(id)a3 state:(unint64_t)a4;
- (void)loadWithTrait:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCurrentURL:(id)a3;
- (void)setPriority:(id)a3;
- (void)setQuality:(double)a3;
- (void)setService:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setUrl:(id)a3;
- (void)start;
- (void)stop;
- (void)tmlDispose;
- (void)tmlObjectCompleted;
@end

@implementation TKAdaptiveImage

- (TKAdaptiveImage)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)TKAdaptiveImage;
  v6 = [(TKAdaptiveResourceObject *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6)
  {
    v6->_quality = 0.850000024;
    v6->_supportsTraits = 1;
    v6->_state = 0;
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)dealloc
{
  objc_super v4 = self;
  SEL v3 = a2;
  [(TKAdaptiveImage *)self stop];
  v2.receiver = v4;
  v2.super_class = (Class)TKAdaptiveImage;
  [(TKAdaptiveResourceObject *)&v2 dealloc];
}

- (void)tmlDispose
{
  objc_super v4 = self;
  SEL v3 = a2;
  [(TKAdaptiveImage *)self stop];
  v2.receiver = v4;
  v2.super_class = (Class)TKAdaptiveImage;
  [(TKAdaptiveResourceObject *)&v2 tmlDispose];
}

- (void)setUrl:(id)a3
{
  objc_super v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_url != location[0] && ([(NSURL *)v4->_url isEqual:location[0]] & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_url, location[0]);
    if (v4->_state)
    {
      [(TKAdaptiveImage *)v4 stop];
      [(TKAdaptiveImage *)v4 start];
    }
  }
  objc_storeStrong(location, 0);
}

- (void)setQuality:(double)a3
{
  double v3 = a3;
  if (a3 > 1.0 || a3 <= 0.0) {
    double v3 = 0.850000024;
  }
  self->_quality = v3;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
  BOOL v3 = a3 == 1;
  if ((a3 == 1) != self->_loading)
  {
    -[TKAdaptiveImage willChangeValueForKey:](self, "willChangeValueForKey:");
    self->_loading = v3;
    [(TKAdaptiveImage *)self didChangeValueForKey:@"loading"];
  }
}

- (void)start
{
  v8 = self;
  v7[1] = (id)a2;
  if (self->_state != 1 && v8->_state != 2)
  {
    if (v8->_image)
    {
      -[TKAdaptiveImage willChangeValueForKey:](v8, "willChangeValueForKey:");
      objc_storeStrong((id *)&v8->_image, 0);
      [(TKAdaptiveImage *)v8 didChangeValueForKey:@"image"];
    }
    BOOL v3 = [(NSURL *)v8->_url scheme];
    BOOL v4 = [(NSString *)v3 length] != 0;

    if (v4)
    {
      v8->_supportsTraits = 1;
      [(TKAdaptiveImage *)v8 setState:1];
      id v2 = [(TKAdaptiveImage *)v8 imageTraitForMetrics];
      -[TKAdaptiveImage loadWithTrait:](v8, "loadWithTrait:");
    }
    else
    {
      v8->_supportsTraits = 0;
      v7[0] = [(NSURL *)v8->_url path];
      if (![v7[0] length]
        || ((id location = (id)[MEMORY[0x263F827E8] imageNamed:v7[0]]) == 0
          ? (int v5 = 0)
          : ([(TKAdaptiveImage *)v8 didLoadImage:location state:2], int v5 = 1),
            objc_storeStrong(&location, 0),
            !v5))
      {
        [(TKAdaptiveImage *)v8 didLoadImage:0 state:3];
      }
      objc_storeStrong(v7, 0);
    }
  }
}

- (void)stop
{
  if (self->_state == 1)
  {
    [(TKAdaptiveImage *)self setState:4];
    if (self->_task)
    {
      [(TKNetworkTask *)self->_task cancel];
      objc_storeStrong((id *)&self->_task, 0);
    }
  }
  else
  {
    [(TKAdaptiveImage *)self setState:4];
  }
}

- (void)loadWithTrait:(id)a3
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v20->_supportsTraits && v20->_url)
  {
    if (location[0])
    {
      id v17 = [(TKAdaptiveImage *)v20 url:v20->_url withTrait:location[0]];
      if (([v17 isEqual:v20->_currentURL] & 1) != 0 && v20->_image)
      {
        int v18 = 1;
      }
      else
      {
        [(TKAdaptiveImage *)v20 setState:1];
        objc_storeStrong((id *)&v20->_currentURL, v17);
        if (v20->_image
          && v20->_currentTrait
          && ![(TKAdaptiveImage_Trait *)v20->_currentTrait compatibleWithTrait:location[0]])
        {
          -[TKAdaptiveImage willChangeValueForKey:](v20, "willChangeValueForKey:");
          objc_storeStrong((id *)&v20->_image, 0);
          [(TKAdaptiveImage *)v20 didChangeValueForKey:@"image"];
        }
        objc_storeStrong((id *)&v20->_currentTrait, location[0]);
        uint64_t v16 = 0;
        if ([(NSString *)v20->_priority isEqualToString:@"high"])
        {
          uint64_t v16 = 1;
        }
        else if ([(NSString *)v20->_priority isEqualToString:@"low"])
        {
          uint64_t v16 = -1;
        }
        objc_initWeak(&from, v20);
        id v7 = +[TKNetwork shared];
        id v5 = (id)[MEMORY[0x263F08BD8] requestWithURL:v17];
        uint64_t v6 = v16;
        uint64_t v8 = MEMORY[0x263EF8330];
        int v9 = -1073741824;
        int v10 = 0;
        v11 = __33__TKAdaptiveImage_loadWithTrait___block_invoke;
        v12 = &unk_26485AEB0;
        id v13 = v17;
        objc_copyWeak(v14, &from);
        BOOL v3 = (TKNetworkTask *)(id)[v7 downloadImage:v5 priority:v6 completion:&v8];
        task = v20->_task;
        v20->_task = v3;

        objc_destroyWeak(v14);
        objc_storeStrong(&v13, 0);
        objc_destroyWeak(&from);
        int v18 = 0;
      }
      objc_storeStrong(&v17, 0);
    }
    else
    {
      objc_storeStrong((id *)&v20->_currentURL, 0);
      int v18 = 1;
    }
  }
  else
  {
    int v18 = 1;
  }
  objc_storeStrong(location, 0);
}

void __33__TKAdaptiveImage_loadWithTrait___block_invoke(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v12 = 0;
  objc_storeStrong(&v12, a3);
  uint64_t v8 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = (id)[WeakRetained currentURL];
  char v11 = objc_msgSend(v8, "isEqual:");

  if (v11)
  {
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = v3;
    if (v12) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = 2;
    }
    [v3 didLoadImage:location[0] state:v4];
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)didLoadImage:(id)a3 state:(unint64_t)a4
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_task, 0);
  if (location[0])
  {
    -[TKAdaptiveImage willChangeValueForKey:](v6, "willChangeValueForKey:");
    objc_storeStrong((id *)&v6->_image, location[0]);
    [(TKAdaptiveImage *)v6 didChangeValueForKey:@"image"];
  }
  [(TKAdaptiveImage *)v6 setState:a4];
  if (a4 == 3) {
    [(TKAdaptiveImage *)v6 emitTMLSignal:@"error" withArguments:0];
  }
  objc_storeStrong(location, 0);
}

- (void)tmlObjectCompleted
{
}

- (void)adaptiveMetricsDidChange
{
  id v3 = self;
  v2[1] = (id)a2;
  if (self->_supportsTraits)
  {
    v2[0] = [(TKAdaptiveImage *)v3 imageTraitForMetrics];
    [(TKAdaptiveImage *)v3 loadWithTrait:v2[0]];
    objc_storeStrong(v2, 0);
  }
}

+ (id)zeroTrait
{
  id v5 = (dispatch_once_t *)&zeroTrait_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_9);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  id v2 = (void *)zeroTrait_zeroTrait;
  return v2;
}

void __28__TKAdaptiveImage_zeroTrait__block_invoke()
{
  v0 = objc_alloc_init(TKAdaptiveImage_Trait);
  v1 = (void *)zeroTrait_zeroTrait;
  zeroTrait_zeroTrait = (uint64_t)v0;
}

- (id)traits
{
  id v7 = self;
  v6[1] = (id)a2;
  v6[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = (id)[(TKAdaptiveImage *)v7 tmlChildren];
  id v5 = v6[0];
  objc_msgSend(v3, "enumerateObjectsUsingBlock:");

  id v4 = v6[0];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);
  return v4;
}

void __25__TKAdaptiveImage_traits__block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a1[4] addObject:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (id)imageTraitForMetrics
{
  id v17 = &v35;
  v35 = self;
  SEL v34 = a2;
  uint64_t v27 = 0;
  v28 = &v27;
  int v29 = 838860800;
  int v30 = 48;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  id v33 = (id)[(id)objc_opt_class() zeroTrait];
  id v18 = +[TKAdaptiveResourceManager traitCollection];
  id v26 = v18;
  id v16 = [(TKAdaptiveImage *)v35 traits];
  id v15 = v16;
  v14 = &v20;
  uint64_t v20 = MEMORY[0x263EF8330];
  int v21 = -1073741824;
  int v22 = 0;
  v23 = __39__TKAdaptiveImage_imageTraitForMetrics__block_invoke;
  v24 = &unk_26485AF00;
  id location = (id *)v25;
  v25[0] = v26;
  v25[1] = &v27;
  [v15 enumerateObjectsUsingBlock:&v20];

  id v11 = (id)v28[5];
  id v12 = (id)objc_opt_class();
  id v10 = (id)[v12 zeroTrait];
  id v2 = v10;
  BOOL v9 = v11 != v2;

  if (v9)
  {
    v17[1] = (TKAdaptiveImage *)(id)v28[5];
    int v19 = 1;
  }
  else
  {
    if ((*v17)->_url)
    {
      id v8 = [(NSURL *)(*v17)->_url absoluteString];
      id v7 = v8;
      NSLog(&cfstr_AdaptiveimageN.isa, v7);
    }
    v17[1] = 0;
    int v19 = 1;
  }
  id obj = 0;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v26, obj);
  id v5 = (id *)&v27;
  _Block_object_dispose(&v27, 8);
  objc_storeStrong(v5 + 5, obj);
  id v3 = v17[1];
  return v3;
}

void __39__TKAdaptiveImage_imageTraitForMetrics__block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v4 = [location[0] horizontalSizeClass];
  if (v4 == [*(id *)(a1 + 32) horizontalSizeClass] || !objc_msgSend(location[0], "horizontalSizeClass"))
  {
    uint64_t v2 = [location[0] verticalSizeClass];
    if ((v2 == [*(id *)(a1 + 32) verticalSizeClass] || !objc_msgSend(location[0], "verticalSizeClass"))
      && (![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) horizontalSizeClass]
       || ![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) verticalSizeClass]))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), location[0]);
    }
  }
  objc_storeStrong(location, 0);
}

- (id)url:(id)a3 withTrait:(id)a4
{
  v105 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v103 = 0;
  objc_storeStrong(&v103, a4);
  [v103 size];
  *(double *)&long long v102 = v4;
  *((double *)&v102 + 1) = v5;
  if (__CGSizeEqualToSize_0(v4, v5, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8)))
  {
    uint64_t v101 = 0;
    if ([v103 useReadableWidth])
    {
      +[TKAdaptiveResourceManager readableContentSize];
      uint64_t v99 = v6;
      uint64_t v100 = v7;
    }
    else
    {
      +[TKAdaptiveResourceManager size];
      uint64_t v97 = v6;
      uint64_t v98 = v8;
    }
    uint64_t v101 = v6;
    [v103 relativeSize];
    uint64_t v94 = v9;
    uint64_t v95 = v10;
    [v103 relativeSize];
    uint64_t v92 = v11;
    uint64_t v93 = v12;
    CGSizeMake_0();
    *(void *)&long long v96 = v13;
    *((void *)&v96 + 1) = v14;
    long long v102 = v96;
  }
  uint64_t v109 = *((void *)&v102 + 1);
  uint64_t v110 = v102;
  CGSizeMake_0();
  *(void *)&long long v91 = v15;
  *((void *)&v91 + 1) = v16;
  long long v102 = v91;
  [v103 maxSize];
  double v89 = v17;
  double v90 = v18;
  if (!__CGSizeEqualToSize_0(v17, v18, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8)))
  {
    [v103 maxSize];
    double v86 = v19;
    uint64_t v87 = v20;
    if (*(double *)&v102 >= v19)
    {
      objc_msgSend(v103, "maxSize", *(double *)&v102);
      uint64_t v84 = v21;
      uint64_t v85 = v22;
    }
    [v103 maxSize];
    uint64_t v82 = v23;
    double v83 = v24;
    if (*((double *)&v102 + 1) >= v24)
    {
      objc_msgSend(v103, "maxSize", *((double *)&v102 + 1));
      uint64_t v80 = v25;
      uint64_t v81 = v26;
    }
    CGSizeMake_0();
    *(void *)&long long v88 = v27;
    *((void *)&v88 + 1) = v28;
    long long v102 = v88;
  }
  [v103 minSize];
  double v78 = v29;
  double v79 = v30;
  if (!__CGSizeEqualToSize_0(v29, v30, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8)))
  {
    [v103 minSize];
    double v75 = v31;
    uint64_t v76 = v32;
    if (*(double *)&v102 <= v31)
    {
      objc_msgSend(v103, "minSize", *(double *)&v102);
      uint64_t v73 = v33;
      uint64_t v74 = v34;
    }
    [v103 minSize];
    uint64_t v71 = v35;
    double v72 = v36;
    if (*((double *)&v102 + 1) <= v36)
    {
      objc_msgSend(v103, "minSize", *((double *)&v102 + 1));
      uint64_t v69 = v37;
      uint64_t v70 = v38;
    }
    CGSizeMake_0();
    *(void *)&long long v77 = v39;
    *((void *)&v77 + 1) = v40;
    long long v102 = v77;
  }
  id v57 = +[TKAdaptiveResourceManager traitCollection];
  [v57 displayScale];
  double v58 = v41;

  double v68 = v58;
  if (v58 == 0.0)
  {
    id v56 = (id)objc_msgSend(MEMORY[0x263F82B60], "mainScreen", v58);
    [v56 scale];
    double v68 = v42;
  }
  double v108 = *(double *)&v102 * v68;
  double v107 = *((double *)&v102 + 1) * v68;
  CGSizeMake_0();
  *(void *)&long long v67 = v43;
  *((void *)&v67 + 1) = v44;
  long long v102 = v67;
  id v66 = v105->_backgroundColor;
  if (v66)
  {
    double v65 = 0.0;
    [v66 getRed:0 green:0 blue:0 alpha:&v65];
    double v45 = v65;
    if (v65 == 0.0) {
      objc_storeStrong(&v66, 0);
    }
  }
  else
  {
    id v66 = (id)[MEMORY[0x263F825C8] whiteColor];
  }
  id v64 = (id)objc_msgSend(v103, "url", v45);
  if (!v64) {
    objc_storeStrong(&v64, location[0]);
  }
  double v63 = 0.0;
  [v103 quality];
  if (v46 == 0.0)
  {
    double quality = v105->_quality;
  }
  else
  {
    [v103 quality];
    double quality = v47;
  }
  double v63 = quality;
  id v62 = +[TKAdaptiveImageAPI getService:v105->_service];
  if (!v62
    || ((id v54 = v64,
         [v103 crop],
         (id v61 = objc_retainAutoreleasedReturnValue((id)(*((uint64_t (**)(id, id, id, double, double, double, double, double, double, double))v62
                                                        + 2))(v62, v54, v66, *(double *)&v102, *((double *)&v102 + 1), v48, v49, v50, v51, v63))) == 0)? (int v60 = 0): (v106 = v61, int v60 = 1), objc_storeStrong(&v61, 0), !v60))
  {
    id v106 = v64;
  }
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(&v66, 0);
  objc_storeStrong(&v103, 0);
  objc_storeStrong(location, 0);
  v52 = v106;
  return v52;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)priority
{
  return self->_priority;
}

- (void)setPriority:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (double)quality
{
  return self->_quality;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)loading
{
  return self->_loading;
}

- (NSURL)currentURL
{
  return self->_currentURL;
}

- (void)setCurrentURL:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
}

@end