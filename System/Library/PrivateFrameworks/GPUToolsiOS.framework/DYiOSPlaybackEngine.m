@interface DYiOSPlaybackEngine
+ (CATransform3D)_convertToCATransform3D:(SEL)a3;
+ (CGPoint)_convertToCGPoint:(const Argument *)a3;
- (BOOL)layerHasSameProperties:(id)a3 layer:(id)a4;
- (CATransform3D)_applyInterfaceOrientationToTransform:(SEL)a3;
- (CGRect)boundsForCurrentInterfaceOrientation;
- (DYiOSPlaybackEngine)initWithCaptureStore:(id)a3;
- (DYiOSPlaybackEngine)initWithCaptureStore:(id)a3 shouldCreateViewController:(BOOL)a4;
- (UIViewController)viewController;
- (double)defaultContentsScale;
- (id).cxx_construct;
- (id)createLayerWithID:(unint64_t)a3 contentRect:(CGRect)a4 contentsScale:(double)a5 properties:(id)a6 isCoreAnimationSurface:(BOOL)a7;
- (id)currentTopLayer;
- (id)layerForID:(unint64_t)a3;
- (id)newLayer;
- (void)_setupLayer:(id)a3 contentRect:(CGRect)a4 contentsScale:(double)a5 properties:(id)a6 isCoreAnimationSurface:(BOOL)a7;
- (void)applyLayersVisibility;
- (void)deleteLayer:(unint64_t)a3;
- (void)prepareLayerForPresent:(id)a3;
- (void)resetLayersVisibility;
- (void)setAnchorPoint:(const Argument *)a3 forLayerID:(unint64_t)a4;
- (void)setInterfaceOrientation:(int)a3;
- (void)setPosition:(const Argument *)a3 forLayerID:(unint64_t)a4;
- (void)setTransform:(const Argument *)a3 forLayerID:(unint64_t)a4 withScreenToLayerScale:(const void *)a5;
- (void)updateLayer:(id)a3 contentRect:(CGRect)a4 contentsScale:(double)a5 properties:(id)a6;
@end

@implementation DYiOSPlaybackEngine

+ (CATransform3D)_convertToCATransform3D:(SEL)a3
{
  for (unint64_t i = 0; i != 16; ++i)
    *((__n64 *)&retstr->m11 + i) = GPUTools::FD::Argument::ViewAsScalarArray<double>((uint64_t)a4, i);
  return result;
}

+ (CGPoint)_convertToCGPoint:(const Argument *)a3
{
  unint64_t v4 = GPUTools::FD::Argument::ViewAsScalarArray<double>((uint64_t)a3, 0).n64_u64[0];
  v5.n64_u64[0] = GPUTools::FD::Argument::ViewAsScalarArray<double>((uint64_t)a3, 1uLL).n64_u64[0];
  double v6 = *(double *)&v4;
  result.y = v5.n64_f64[0];
  result.x = v6;
  return result;
}

- (DYiOSPlaybackEngine)initWithCaptureStore:(id)a3
{
  return [(DYiOSPlaybackEngine *)self initWithCaptureStore:a3 shouldCreateViewController:1];
}

- (DYiOSPlaybackEngine)initWithCaptureStore:(id)a3 shouldCreateViewController:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!pthread_main_np()) {
    __assert_rtn("-[DYiOSPlaybackEngine initWithCaptureStore:shouldCreateViewController:]", (const char *)&unk_24F762241, 0, "pthread_main_np()");
  }
  v33.receiver = self;
  v33.super_class = (Class)DYiOSPlaybackEngine;
  v7 = [(DYPlaybackEngine *)&v33 initWithCaptureStore:v6];
  if (v7)
  {
    if (v4)
    {
      v8 = [[DYPlaybackViewController alloc] initWithNibName:0 bundle:0];
      viewController = v7->_viewController;
      v7->_viewController = &v8->super;

      *(_OWORD *)components = xmmword_24F761E00;
      long long v35 = unk_24F761E10;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v11 = CGColorCreate(DeviceRGB, components);
      v12 = [(UIViewController *)v7->_viewController view];
      v13 = [v12 layer];
      [v13 setBackgroundColor:v11];

      CGColorRelease(v11);
      CGColorSpaceRelease(DeviceRGB);
      v14 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
      hostLayer = v7->_hostLayer;
      v7->_hostLayer = v14;

      [(CALayer *)v7->_hostLayer setOpaque:1];
      v16 = [MEMORY[0x263F1C918] mainScreen];
      [v16 bounds];
      -[CALayer setFrame:](v7->_hostLayer, "setFrame:");

      v17 = [MEMORY[0x263F1C918] mainScreen];
      [v17 scale];
      -[CALayer setContentsScale:](v7->_hostLayer, "setContentsScale:");

      v18 = [(UIViewController *)v7->_viewController view];
      v19 = [v18 layer];
      [v19 addSublayer:v7->_hostLayer];

      v20 = [MEMORY[0x263F1C918] mainScreen];
      [v20 bounds];
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;

      v37.origin.x = v22;
      v37.origin.y = v24;
      v37.size.width = v26;
      v37.size.height = v28;
      v7->_screenCenter.x = CGRectGetWidth(v37) * 0.5;
      v38.origin.x = v22;
      v38.origin.y = v24;
      v38.size.width = v26;
      v38.size.height = v28;
      v7->_screenCenter.y = CGRectGetHeight(v38) * 0.5;
      v7->_interfaceOrientation = 1;
    }
    else
    {
      v29 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
      v30 = v7->_hostLayer;
      v7->_hostLayer = v29;

      [(CALayer *)v7->_hostLayer setOpaque:1];
    }
    v31 = v7;
  }

  return v7;
}

- (void)_setupLayer:(id)a3 contentRect:(CGRect)a4 contentsScale:(double)a5 properties:(id)a6 isCoreAnimationSurface:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v16 = a3;
  id v15 = a6;
  if (v7) {
    objc_msgSend(v16, "setFrame:", x, y, width, height);
  }
  else {
    objc_msgSend(v16, "setPosition:", 0.0, 0.0);
  }
  objc_msgSend(v16, "setBounds:", x, y, width, height);
  [v16 setContentsScale:a5];
  [(DYiOSPlaybackEngine *)self setProperties:v15 forLayer:v16];
}

- (id)createLayerWithID:(unint64_t)a3 contentRect:(CGRect)a4 contentsScale:(double)a5 properties:(id)a6 isCoreAnimationSurface:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v37[5] = *(uint64_t **)MEMORY[0x263EF8340];
  unint64_t v35 = a3;
  id v15 = a6;
  if (a5 == 0.0) {
    __assert_rtn("-[DYiOSPlaybackEngine createLayerWithID:contentRect:contentsScale:properties:isCoreAnimationSurface:]", (const char *)&unk_24F762241, 0, "contentsScale != 0.0");
  }
  if (a3) {
    goto LABEL_3;
  }
  left = (DYiOSPlaybackEngine *)self->_layerMap.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_3;
  }
  do
  {
    v18 = left;
    left = (DYiOSPlaybackEngine *)left->super.super.isa;
  }
  while (left);
  if (v18 == (DYiOSPlaybackEngine *)&self->_layerMap.__tree_.__pair1_ || v18->super._playbackQueue)
  {
LABEL_3:
    [(DYiOSPlaybackEngine *)self deleteLayer:a3];
    GPUTools::AutoCATransaction::AutoCATransaction((GPUTools::AutoCATransaction *)v37, 1, 1);
    id v16 = [(DYiOSPlaybackEngine *)self newLayer];
    id v34 = v16;
    [v16 setOpaque:1];
    if (v35)
    {
      -[DYiOSPlaybackEngine _setupLayer:contentRect:contentsScale:properties:isCoreAnimationSurface:](self, "_setupLayer:contentRect:contentsScale:properties:isCoreAnimationSurface:", v16, v15, v7, x, y, width, height, a5);
    }
    else
    {
      v20 = [MEMORY[0x263F1C918] mainScreen];
      objc_msgSend(v16, "setPosition:", self->_screenCenter.x, self->_screenCenter.y);
      [v20 scale];
      objc_msgSend(v16, "setContentsScale:");
      long long v21 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
      v33[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
      v33[5] = v21;
      long long v22 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
      v33[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
      v33[7] = v22;
      long long v23 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
      v33[0] = *MEMORY[0x263F15740];
      v33[1] = v23;
      long long v24 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
      v33[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
      v33[3] = v24;
      [(DYiOSPlaybackEngine *)self _applyInterfaceOrientationToTransform:v33];
      v32[4] = v33[12];
      v32[5] = v33[13];
      v32[6] = v33[14];
      v32[7] = v33[15];
      v32[0] = v33[8];
      v32[1] = v33[9];
      v32[2] = v33[10];
      v32[3] = v33[11];
      [v16 setTransform:v32];
      if ((unint64_t)(self->_interfaceOrientation - 3) > 1)
      {
        [v20 bounds];
        objc_msgSend(v16, "setBounds:");
      }
      else
      {
        [v20 bounds];
        double v26 = v25;
        [v20 bounds];
        objc_msgSend(v16, "setBounds:", 0.0, 0.0, v26, v27);
      }
    }
    uint64_t v36 = &v35;
    CGFloat v28 = std::__tree<std::__value_type<unsigned long long,CALayer * {__strong}>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,CALayer * {__strong}>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,CALayer * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t **)&self->_layerMap, &v35, (uint64_t)&std::piecewise_construct, (uint64_t **)&v36);
    objc_storeStrong((id *)v28 + 5, v16);
    uint64_t v36 = (unint64_t *)&v34;
    *((unsigned char *)std::__tree<std::__value_type<CALayer * {__strong},BOOL>,std::__map_value_compare<CALayer * {__strong},std::__value_type<CALayer * {__strong},BOOL>,std::less<CALayer * {__strong}>,true>,std::allocator<std::__value_type<CALayer * {__strong},BOOL>>>::__emplace_unique_key_args<CALayer * {__strong},std::piecewise_construct_t const&,std::tuple<CALayer * const {__strong}&>,std::tuple<>>((uint64_t **)&self->_coreAnimationLayerMap, (unint64_t *)&v34, (uint64_t)&std::piecewise_construct, (id **)&v36)+ 40) = v7;
    [(CALayer *)self->_hostLayer addSublayer:v34];
    uint64_t v36 = (unint64_t *)&v34;
    *((unsigned char *)std::__tree<std::__value_type<CALayer *,BOOL>,std::__map_value_compare<std::__value_type<CALayer *,BOOL>,std::__map_value_compare,std::less<std::__value_type<CALayer *,BOOL>>,true>,std::allocator<std::__map_value_compare>>::__emplace_unique_key_args<std::__value_type<CALayer *,BOOL>,std::piecewise_construct_t const&,std::tuple<CALayer * const&>,CALayer * const<>>((uint64_t **)&self->_hostLayerSublayersVisibilityMap, (unint64_t *)&v34, (uint64_t)&std::piecewise_construct, &v36)+ 40) = 0;
    v29 = [(CALayer *)self->_hostLayer sublayers];
    BOOL v30 = [v29 count] == 1;

    if (v30) {
      objc_storeWeak((id *)&self->_topLayer, v34);
    }
    id v19 = v34;

    GPUTools::AutoCATransaction::~AutoCATransaction((GPUTools::AutoCATransaction *)v37);
  }
  else
  {
    v37[0] = (uint64_t *)&v35;
    id v19 = (id)std::__tree<std::__value_type<unsigned long long,CALayer * {__strong}>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,CALayer * {__strong}>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,CALayer * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t **)&self->_layerMap, &v35, (uint64_t)&std::piecewise_construct, v37)[5];
  }

  return v19;
}

- (void)resetLayersVisibility
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(CALayer *)self->_hostLayer sublayers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        unint64_t v11 = *(void *)(*((void *)&v7 + 1) + 8 * v6);
        v12 = &v11;
        *((unsigned char *)std::__tree<std::__value_type<CALayer *,BOOL>,std::__map_value_compare<std::__value_type<CALayer *,BOOL>,std::__map_value_compare,std::less<std::__value_type<CALayer *,BOOL>>,true>,std::allocator<std::__map_value_compare>>::__emplace_unique_key_args<std::__value_type<CALayer *,BOOL>,std::piecewise_construct_t const&,std::tuple<CALayer * const&>,CALayer * const<>>((uint64_t **)&self->_hostLayerSublayersVisibilityMap, &v11, (uint64_t)&std::piecewise_construct, &v12)+ 40) = 0;
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)prepareLayerForPresent:(id)a3
{
  id obj = a3;
  if (!obj) {
    __assert_rtn("-[DYiOSPlaybackEngine prepareLayerForPresent:]", (const char *)&unk_24F762241, 0, "layer");
  }
  p_id obj = &obj;
  *((unsigned char *)std::__tree<std::__value_type<CALayer *,BOOL>,std::__map_value_compare<std::__value_type<CALayer *,BOOL>,std::__map_value_compare,std::less<std::__value_type<CALayer *,BOOL>>,true>,std::allocator<std::__map_value_compare>>::__emplace_unique_key_args<std::__value_type<CALayer *,BOOL>,std::piecewise_construct_t const&,std::tuple<CALayer * const&>,CALayer * const<>>((uint64_t **)&self->_hostLayerSublayersVisibilityMap, (unint64_t *)&obj, (uint64_t)&std::piecewise_construct, &p_obj)+ 40) = 1;
  objc_storeWeak((id *)&self->_topLayer, obj);
}

- (void)applyLayersVisibility
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  GPUTools::AutoCATransaction::AutoCATransaction((GPUTools::AutoCATransaction *)v15, 0, 1);
  [MEMORY[0x263F158F8] setDisableActions:0];
  [MEMORY[0x263F158F8] setAnimationDuration:0.15];
  [(CALayer *)self->_hostLayer setHidden:0];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(CALayer *)self->_hostLayer sublayers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        id v12 = *(id *)(*((void *)&v8 + 1) + 8 * v6);
        v13 = &v12;
        BOOL v7 = *((unsigned char *)std::__tree<std::__value_type<CALayer *,BOOL>,std::__map_value_compare<std::__value_type<CALayer *,BOOL>,std::__map_value_compare,std::less<std::__value_type<CALayer *,BOOL>>,true>,std::allocator<std::__map_value_compare>>::__emplace_unique_key_args<std::__value_type<CALayer *,BOOL>,std::piecewise_construct_t const&,std::tuple<CALayer * const&>,CALayer * const<>>((uint64_t **)&self->_hostLayerSublayersVisibilityMap, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, &v13)+ 40) == 0;
        [v12 setHidden:v7];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v14 count:16];
    }
    while (v4);
  }

  GPUTools::AutoCATransaction::~AutoCATransaction((GPUTools::AutoCATransaction *)v15);
}

- (void)updateLayer:(id)a3 contentRect:(CGRect)a4 contentsScale:(double)a5 properties:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v17 = v13;
  id v14 = a6;
  if (!v13) {
    __assert_rtn("-[DYiOSPlaybackEngine updateLayer:contentRect:contentsScale:properties:]", (const char *)&unk_24F762241, 0, "layer");
  }
  [v13 bounds];
  v22.origin.double x = x;
  v22.origin.double y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  if (!CGRectEqualToRect(v21, v22)
    || ([v13 contentsScale], v15 != a5)
    || ![(DYiOSPlaybackEngine *)self layerHasSameProperties:v14 layer:v13])
  {
    GPUTools::AutoCATransaction::AutoCATransaction((GPUTools::AutoCATransaction *)v19, 1, 1);
    if (a5 == 0.0) {
      __assert_rtn("-[DYiOSPlaybackEngine updateLayer:contentRect:contentsScale:properties:]", (const char *)&unk_24F762241, 0, "contentsScale != 0.0");
    }
    v18 = &v17;
    uint64_t v16 = std::__tree<std::__value_type<CALayer * {__strong},BOOL>,std::__map_value_compare<CALayer * {__strong},std::__value_type<CALayer * {__strong},BOOL>,std::less<CALayer * {__strong}>,true>,std::allocator<std::__value_type<CALayer * {__strong},BOOL>>>::__emplace_unique_key_args<CALayer * {__strong},std::piecewise_construct_t const&,std::tuple<CALayer * const {__strong}&>,std::tuple<>>((uint64_t **)&self->_coreAnimationLayerMap, (unint64_t *)&v17, (uint64_t)&std::piecewise_construct, &v18);
    -[DYiOSPlaybackEngine _setupLayer:contentRect:contentsScale:properties:isCoreAnimationSurface:](self, "_setupLayer:contentRect:contentsScale:properties:isCoreAnimationSurface:", v17, v14, *((unsigned __int8 *)v16 + 40), x, y, width, height, a5);
    GPUTools::AutoCATransaction::~AutoCATransaction((GPUTools::AutoCATransaction *)v19);
  }
}

- (id)layerForID:(unint64_t)a3
{
  left = (char *)self->_layerMap.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    return 0;
  }
  p_pair1 = &self->_layerMap.__tree_.__pair1_;
  do
  {
    unint64_t v5 = *((void *)left + 4);
    BOOL v6 = v5 >= a3;
    if (v5 >= a3) {
      BOOL v7 = (char **)left;
    }
    else {
      BOOL v7 = (char **)(left + 8);
    }
    if (v6) {
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, CALayer *>, void *>>> *)left;
    }
    left = *v7;
  }
  while (*v7);
  if (p_pair1 != &self->_layerMap.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= (void *)a3) {
    return p_pair1[5].__value_.__left_;
  }
  else {
    return 0;
  }
}

- (id)currentTopLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topLayer);
  return WeakRetained;
}

- (void)deleteLayer:(unint64_t)a3
{
  p_layerMap = (uint64_t **)&self->_layerMap;
  left = (char *)self->_layerMap.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = &self->_layerMap.__tree_.__pair1_;
    do
    {
      unint64_t v7 = *((void *)left + 4);
      BOOL v8 = v7 >= a3;
      if (v7 >= a3) {
        long long v9 = (char **)left;
      }
      else {
        long long v9 = (char **)(left + 8);
      }
      if (v8) {
        p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, CALayer *>, void *>>> *)left;
      }
      left = *v9;
    }
    while (*v9);
    if (p_pair1 != &self->_layerMap.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= (void *)a3)
    {
      [p_pair1[5].__value_.__left_ removeFromSuperlayer];
      std::__tree<std::__value_type<CALayer * {__strong},BOOL>,std::__map_value_compare<CALayer * {__strong},std::__value_type<CALayer * {__strong},BOOL>,std::less<CALayer * {__strong}>,true>,std::allocator<std::__value_type<CALayer * {__strong},BOOL>>>::__erase_unique<CALayer * {__strong}>((uint64_t)&self->_coreAnimationLayerMap, (unint64_t *)&p_pair1[5]);
      std::__tree<std::__value_type<unsigned long long,CALayer * {__strong}>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,CALayer * {__strong}>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,CALayer * {__strong}>>>::erase(p_layerMap, (uint64_t)p_pair1);
    }
  }
}

- (void)setTransform:(const Argument *)a3 forLayerID:(unint64_t)a4 withScreenToLayerScale:(const void *)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v7 = [(DYiOSPlaybackEngine *)self layerForID:a4];
  if (v7)
  {
    GPUTools::AutoCATransaction::AutoCATransaction((GPUTools::AutoCATransaction *)v19, 1, 1);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    BOOL v8 = objc_opt_class();
    if (v8)
    {
      [v8 _convertToCATransform3D:a3];
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
    }
    v10[4] = v15;
    v10[5] = v16;
    v10[6] = v17;
    v10[7] = v18;
    v10[0] = v11;
    v10[1] = v12;
    v10[2] = v13;
    v10[3] = v14;
    [(DYiOSPlaybackEngine *)self _applyInterfaceOrientationToTransform:v10];
    v9[4] = v10[12];
    v9[5] = v10[13];
    v9[6] = v10[14];
    v9[7] = v10[15];
    v9[0] = v10[8];
    v9[1] = v10[9];
    v9[2] = v10[10];
    v9[3] = v10[11];
    [v7 setTransform:v9];
    GPUTools::AutoCATransaction::~AutoCATransaction((GPUTools::AutoCATransaction *)v19);
  }
}

- (void)setPosition:(const Argument *)a3 forLayerID:(unint64_t)a4
{
  v6[5] = *MEMORY[0x263EF8340];
  unint64_t v5 = [(DYiOSPlaybackEngine *)self layerForID:a4];
  if (v5)
  {
    GPUTools::AutoCATransaction::AutoCATransaction((GPUTools::AutoCATransaction *)v6, 1, 1);
    [(id)objc_opt_class() _convertToCGPoint:a3];
    objc_msgSend(v5, "setPosition:");
    GPUTools::AutoCATransaction::~AutoCATransaction((GPUTools::AutoCATransaction *)v6);
  }
}

- (void)setAnchorPoint:(const Argument *)a3 forLayerID:(unint64_t)a4
{
  v6[5] = *MEMORY[0x263EF8340];
  unint64_t v5 = [(DYiOSPlaybackEngine *)self layerForID:a4];
  if (v5)
  {
    GPUTools::AutoCATransaction::AutoCATransaction((GPUTools::AutoCATransaction *)v6, 1, 1);
    [(id)objc_opt_class() _convertToCGPoint:a3];
    objc_msgSend(v5, "setAnchorPoint:");
    GPUTools::AutoCATransaction::~AutoCATransaction((GPUTools::AutoCATransaction *)v6);
  }
}

- (id)newLayer
{
  return 0;
}

- (BOOL)layerHasSameProperties:(id)a3 layer:(id)a4
{
  return 1;
}

- (void)setInterfaceOrientation:(int)a3
{
  self->_interfaceOrientation = a3;
}

- (CGRect)boundsForCurrentInterfaceOrientation
{
  [(CALayer *)self->_hostLayer bounds];
  unint64_t v7 = self->_interfaceOrientation - 3;
  if (v7 >= 2) {
    double v8 = v5;
  }
  else {
    double v8 = v6;
  }
  if (v7 < 2) {
    double v6 = v5;
  }
  double v9 = v8;
  result.size.double height = v6;
  result.size.double width = v9;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (double)defaultContentsScale
{
  [(CALayer *)self->_hostLayer contentsScale];
  return result;
}

- (CATransform3D)_applyInterfaceOrientationToTransform:(SEL)a3
{
  CGFloat m32 = self[1].m32;
  switch(*(void *)&m32)
  {
    case 2:
      memset(&v110, 0, sizeof(v110));
      CATransform3DMakeRotation(&v110, 3.14159265, 0.0, 0.0, 1.0);
      memset(&v109, 0, sizeof(v109));
      CATransform3DMakeTranslation(&v109, -a4->m41, -a4->m42, 0.0);
      memset(&v108, 0, sizeof(v108));
      CATransform3DMakeTranslation(&v108, a4->m41, a4->m42, 0.0);
      long long v33 = *(_OWORD *)&a4->m33;
      *(_OWORD *)&v94.m31 = *(_OWORD *)&a4->m31;
      *(_OWORD *)&v94.m33 = v33;
      long long v34 = *(_OWORD *)&a4->m43;
      *(_OWORD *)&v94.m41 = *(_OWORD *)&a4->m41;
      *(_OWORD *)&v94.m43 = v34;
      long long v35 = *(_OWORD *)&a4->m13;
      *(_OWORD *)&v94.m11 = *(_OWORD *)&a4->m11;
      *(_OWORD *)&v94.m13 = v35;
      long long v36 = *(_OWORD *)&a4->m23;
      *(_OWORD *)&v94.m21 = *(_OWORD *)&a4->m21;
      *(_OWORD *)&v94.m23 = v36;
      CATransform3D v93 = v109;
      CATransform3DConcat(&v107, &v94, &v93);
      long long v37 = *(_OWORD *)&v107.m33;
      *(_OWORD *)&a4->m31 = *(_OWORD *)&v107.m31;
      *(_OWORD *)&a4->m33 = v37;
      long long v38 = *(_OWORD *)&v107.m43;
      *(_OWORD *)&a4->m41 = *(_OWORD *)&v107.m41;
      *(_OWORD *)&a4->m43 = v38;
      long long v39 = *(_OWORD *)&v107.m13;
      *(_OWORD *)&a4->m11 = *(_OWORD *)&v107.m11;
      *(_OWORD *)&a4->m13 = v39;
      long long v40 = *(_OWORD *)&v107.m23;
      *(_OWORD *)&a4->m21 = *(_OWORD *)&v107.m21;
      *(_OWORD *)&a4->m23 = v40;
      long long v41 = *(_OWORD *)&a4->m11;
      long long v42 = *(_OWORD *)&a4->m13;
      long long v43 = *(_OWORD *)&a4->m23;
      *(_OWORD *)&v92.m21 = *(_OWORD *)&a4->m21;
      *(_OWORD *)&v92.m23 = v43;
      *(_OWORD *)&v92.m11 = v41;
      *(_OWORD *)&v92.m13 = v42;
      long long v44 = *(_OWORD *)&a4->m31;
      long long v45 = *(_OWORD *)&a4->m33;
      long long v46 = *(_OWORD *)&a4->m43;
      *(_OWORD *)&v92.m41 = *(_OWORD *)&a4->m41;
      *(_OWORD *)&v92.m43 = v46;
      *(_OWORD *)&v92.m31 = v44;
      *(_OWORD *)&v92.m33 = v45;
      CATransform3D v91 = v110;
      CATransform3DConcat(&v107, &v92, &v91);
      long long v47 = *(_OWORD *)&v107.m33;
      *(_OWORD *)&a4->m31 = *(_OWORD *)&v107.m31;
      *(_OWORD *)&a4->m33 = v47;
      long long v48 = *(_OWORD *)&v107.m43;
      *(_OWORD *)&a4->m41 = *(_OWORD *)&v107.m41;
      *(_OWORD *)&a4->m43 = v48;
      long long v49 = *(_OWORD *)&v107.m13;
      *(_OWORD *)&a4->m11 = *(_OWORD *)&v107.m11;
      *(_OWORD *)&a4->m13 = v49;
      long long v50 = *(_OWORD *)&v107.m23;
      *(_OWORD *)&a4->m21 = *(_OWORD *)&v107.m21;
      *(_OWORD *)&a4->m23 = v50;
      long long v51 = *(_OWORD *)&a4->m11;
      long long v52 = *(_OWORD *)&a4->m13;
      long long v53 = *(_OWORD *)&a4->m23;
      v90[2] = *(_OWORD *)&a4->m21;
      v90[3] = v53;
      v90[0] = v51;
      v90[1] = v52;
      long long v54 = *(_OWORD *)&a4->m31;
      long long v55 = *(_OWORD *)&a4->m33;
      long long v56 = *(_OWORD *)&a4->m43;
      v90[6] = *(_OWORD *)&a4->m41;
      v90[7] = v56;
      v90[4] = v54;
      v90[5] = v55;
      CATransform3D v89 = v108;
      v31 = (CATransform3D *)v90;
      v32 = &v89;
      goto LABEL_7;
    case 3:
      memset(&v110, 0, sizeof(v110));
      CATransform3DMakeRotation(&v110, 1.57079633, 0.0, 0.0, 1.0);
      memset(&v109, 0, sizeof(v109));
      CATransform3DMakeTranslation(&v109, -a4->m41, -a4->m42, 0.0);
      memset(&v108, 0, sizeof(v108));
      CATransform3DMakeTranslation(&v108, a4->m42, a4->m41, 0.0);
      long long v57 = *(_OWORD *)&a4->m33;
      *(_OWORD *)&v100.m31 = *(_OWORD *)&a4->m31;
      *(_OWORD *)&v100.m33 = v57;
      long long v58 = *(_OWORD *)&a4->m43;
      *(_OWORD *)&v100.m41 = *(_OWORD *)&a4->m41;
      *(_OWORD *)&v100.m43 = v58;
      long long v59 = *(_OWORD *)&a4->m13;
      *(_OWORD *)&v100.m11 = *(_OWORD *)&a4->m11;
      *(_OWORD *)&v100.m13 = v59;
      long long v60 = *(_OWORD *)&a4->m23;
      *(_OWORD *)&v100.m21 = *(_OWORD *)&a4->m21;
      *(_OWORD *)&v100.m23 = v60;
      CATransform3D v99 = v109;
      CATransform3DConcat(&v107, &v100, &v99);
      long long v61 = *(_OWORD *)&v107.m33;
      *(_OWORD *)&a4->m31 = *(_OWORD *)&v107.m31;
      *(_OWORD *)&a4->m33 = v61;
      long long v62 = *(_OWORD *)&v107.m43;
      *(_OWORD *)&a4->m41 = *(_OWORD *)&v107.m41;
      *(_OWORD *)&a4->m43 = v62;
      long long v63 = *(_OWORD *)&v107.m13;
      *(_OWORD *)&a4->m11 = *(_OWORD *)&v107.m11;
      *(_OWORD *)&a4->m13 = v63;
      long long v64 = *(_OWORD *)&v107.m23;
      *(_OWORD *)&a4->m21 = *(_OWORD *)&v107.m21;
      *(_OWORD *)&a4->m23 = v64;
      long long v65 = *(_OWORD *)&a4->m11;
      long long v66 = *(_OWORD *)&a4->m13;
      long long v67 = *(_OWORD *)&a4->m21;
      *(_OWORD *)&v98.m23 = *(_OWORD *)&a4->m23;
      *(_OWORD *)&v98.m21 = v67;
      *(_OWORD *)&v98.m13 = v66;
      *(_OWORD *)&v98.m11 = v65;
      long long v68 = *(_OWORD *)&a4->m31;
      long long v69 = *(_OWORD *)&a4->m33;
      long long v70 = *(_OWORD *)&a4->m41;
      *(_OWORD *)&v98.m43 = *(_OWORD *)&a4->m43;
      *(_OWORD *)&v98.m41 = v70;
      *(_OWORD *)&v98.m33 = v69;
      *(_OWORD *)&v98.m31 = v68;
      CATransform3D v97 = v110;
      CATransform3DConcat(&v107, &v98, &v97);
      long long v71 = *(_OWORD *)&v107.m33;
      *(_OWORD *)&a4->m31 = *(_OWORD *)&v107.m31;
      *(_OWORD *)&a4->m33 = v71;
      long long v72 = *(_OWORD *)&v107.m43;
      *(_OWORD *)&a4->m41 = *(_OWORD *)&v107.m41;
      *(_OWORD *)&a4->m43 = v72;
      long long v73 = *(_OWORD *)&v107.m13;
      *(_OWORD *)&a4->m11 = *(_OWORD *)&v107.m11;
      *(_OWORD *)&a4->m13 = v73;
      long long v74 = *(_OWORD *)&v107.m23;
      *(_OWORD *)&a4->m21 = *(_OWORD *)&v107.m21;
      *(_OWORD *)&a4->m23 = v74;
      long long v75 = *(_OWORD *)&a4->m11;
      long long v76 = *(_OWORD *)&a4->m13;
      long long v77 = *(_OWORD *)&a4->m23;
      *(_OWORD *)&v96.m21 = *(_OWORD *)&a4->m21;
      *(_OWORD *)&v96.m23 = v77;
      *(_OWORD *)&v96.m11 = v75;
      *(_OWORD *)&v96.m13 = v76;
      long long v78 = *(_OWORD *)&a4->m31;
      long long v79 = *(_OWORD *)&a4->m33;
      long long v80 = *(_OWORD *)&a4->m43;
      *(_OWORD *)&v96.m41 = *(_OWORD *)&a4->m41;
      *(_OWORD *)&v96.m43 = v80;
      *(_OWORD *)&v96.m31 = v78;
      *(_OWORD *)&v96.m33 = v79;
      CATransform3D v95 = v108;
      v31 = &v96;
      v32 = &v95;
      goto LABEL_7;
    case 4:
      memset(&v110, 0, sizeof(v110));
      CATransform3DMakeRotation(&v110, -1.57079633, 0.0, 0.0, 1.0);
      memset(&v109, 0, sizeof(v109));
      CATransform3DMakeTranslation(&v109, -a4->m41, -a4->m42, 0.0);
      memset(&v108, 0, sizeof(v108));
      CATransform3DMakeTranslation(&v108, a4->m42, a4->m41, 0.0);
      long long v7 = *(_OWORD *)&a4->m33;
      *(_OWORD *)&a.m31 = *(_OWORD *)&a4->m31;
      *(_OWORD *)&a.m33 = v7;
      long long v8 = *(_OWORD *)&a4->m43;
      *(_OWORD *)&a.m41 = *(_OWORD *)&a4->m41;
      *(_OWORD *)&a.m43 = v8;
      long long v9 = *(_OWORD *)&a4->m13;
      *(_OWORD *)&a.m11 = *(_OWORD *)&a4->m11;
      *(_OWORD *)&a.m13 = v9;
      long long v10 = *(_OWORD *)&a4->m23;
      *(_OWORD *)&a.m21 = *(_OWORD *)&a4->m21;
      *(_OWORD *)&a.m23 = v10;
      CATransform3D b = v109;
      CATransform3DConcat(&v107, &a, &b);
      long long v11 = *(_OWORD *)&v107.m33;
      *(_OWORD *)&a4->m31 = *(_OWORD *)&v107.m31;
      *(_OWORD *)&a4->m33 = v11;
      long long v12 = *(_OWORD *)&v107.m43;
      *(_OWORD *)&a4->m41 = *(_OWORD *)&v107.m41;
      *(_OWORD *)&a4->m43 = v12;
      long long v13 = *(_OWORD *)&v107.m13;
      *(_OWORD *)&a4->m11 = *(_OWORD *)&v107.m11;
      *(_OWORD *)&a4->m13 = v13;
      long long v14 = *(_OWORD *)&v107.m23;
      *(_OWORD *)&a4->m21 = *(_OWORD *)&v107.m21;
      *(_OWORD *)&a4->m23 = v14;
      long long v15 = *(_OWORD *)&a4->m11;
      long long v16 = *(_OWORD *)&a4->m13;
      long long v17 = *(_OWORD *)&a4->m21;
      *(_OWORD *)&v104.m23 = *(_OWORD *)&a4->m23;
      *(_OWORD *)&v104.m21 = v17;
      *(_OWORD *)&v104.m13 = v16;
      *(_OWORD *)&v104.m11 = v15;
      long long v18 = *(_OWORD *)&a4->m31;
      long long v19 = *(_OWORD *)&a4->m33;
      long long v20 = *(_OWORD *)&a4->m41;
      *(_OWORD *)&v104.m43 = *(_OWORD *)&a4->m43;
      *(_OWORD *)&v104.m41 = v20;
      *(_OWORD *)&v104.m33 = v19;
      *(_OWORD *)&v104.m31 = v18;
      CATransform3D v103 = v110;
      CATransform3DConcat(&v107, &v104, &v103);
      long long v21 = *(_OWORD *)&v107.m33;
      *(_OWORD *)&a4->m31 = *(_OWORD *)&v107.m31;
      *(_OWORD *)&a4->m33 = v21;
      long long v22 = *(_OWORD *)&v107.m43;
      *(_OWORD *)&a4->m41 = *(_OWORD *)&v107.m41;
      *(_OWORD *)&a4->m43 = v22;
      long long v23 = *(_OWORD *)&v107.m13;
      *(_OWORD *)&a4->m11 = *(_OWORD *)&v107.m11;
      *(_OWORD *)&a4->m13 = v23;
      long long v24 = *(_OWORD *)&v107.m23;
      *(_OWORD *)&a4->m21 = *(_OWORD *)&v107.m21;
      *(_OWORD *)&a4->m23 = v24;
      long long v25 = *(_OWORD *)&a4->m11;
      long long v26 = *(_OWORD *)&a4->m13;
      long long v27 = *(_OWORD *)&a4->m21;
      v102[3] = *(_OWORD *)&a4->m23;
      v102[2] = v27;
      v102[1] = v26;
      v102[0] = v25;
      long long v28 = *(_OWORD *)&a4->m31;
      long long v29 = *(_OWORD *)&a4->m33;
      long long v30 = *(_OWORD *)&a4->m41;
      v102[7] = *(_OWORD *)&a4->m43;
      v102[6] = v30;
      v102[5] = v29;
      v102[4] = v28;
      CATransform3D v101 = v108;
      v31 = (CATransform3D *)v102;
      v32 = &v101;
LABEL_7:
      self = CATransform3DConcat(&v107, v31, v32);
      long long v81 = *(_OWORD *)&v107.m33;
      *(_OWORD *)&a4->m31 = *(_OWORD *)&v107.m31;
      *(_OWORD *)&a4->m33 = v81;
      long long v82 = *(_OWORD *)&v107.m43;
      *(_OWORD *)&a4->m41 = *(_OWORD *)&v107.m41;
      *(_OWORD *)&a4->m43 = v82;
      long long v83 = *(_OWORD *)&v107.m13;
      *(_OWORD *)&a4->m11 = *(_OWORD *)&v107.m11;
      *(_OWORD *)&a4->m13 = v83;
      long long v84 = *(_OWORD *)&v107.m23;
      *(_OWORD *)&a4->m21 = *(_OWORD *)&v107.m21;
      *(_OWORD *)&a4->m23 = v84;
      break;
  }
  long long v85 = *(_OWORD *)&a4->m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&a4->m31;
  *(_OWORD *)&retstr->m33 = v85;
  long long v86 = *(_OWORD *)&a4->m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&a4->m41;
  *(_OWORD *)&retstr->m43 = v86;
  long long v87 = *(_OWORD *)&a4->m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&a4->m11;
  *(_OWORD *)&retstr->m13 = v87;
  long long v88 = *(_OWORD *)&a4->m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&a4->m21;
  *(_OWORD *)&retstr->m23 = v88;
  return self;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_topLayer);
  std::__tree<std::__value_type<CALayer * {__strong},BOOL>,std::__map_value_compare<CALayer * {__strong},std::__value_type<CALayer * {__strong},BOOL>,std::less<CALayer * {__strong}>,true>,std::allocator<std::__value_type<CALayer * {__strong},BOOL>>>::destroy((uint64_t)&self->_coreAnimationLayerMap, (void *)self->_coreAnimationLayerMap.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<unsigned long long,CALayer * {__strong}>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,CALayer * {__strong}>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,CALayer * {__strong}>>>::destroy((uint64_t)&self->_layerMap, (void *)self->_layerMap.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<CALayer *,BOOL>,std::__map_value_compare<std::__value_type<CALayer *,BOOL>,std::__map_value_compare,std::less<std::__value_type<CALayer *,BOOL>>,true>,std::allocator<std::__map_value_compare>>::destroy((uint64_t)&self->_hostLayerSublayersVisibilityMap, (void *)self->_hostLayerSublayersVisibilityMap.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_hostLayer, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 13) = (char *)self + 112;
  *((void *)self + 18) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 16) = (char *)self + 136;
  *((void *)self + 21) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 19) = (char *)self + 160;
  return self;
}

@end