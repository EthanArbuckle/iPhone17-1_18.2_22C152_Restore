@interface TKAdaptiveResourceManager
+ (CGSize)readableContentSize;
+ (CGSize)size;
+ (id)traitCollection;
+ (void)adaptiveMetricsDidChange;
+ (void)addObject:(id)a3;
+ (void)removeObject:(id)a3;
+ (void)setOverrideTrackingAdaptiveView:(id)a3;
+ (void)setup;
+ (void)windowSizeDidChange:(id)a3;
@end

@implementation TKAdaptiveResourceManager

+ (void)addObject:(id)a3
{
  id v6 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [v6 setup];
  v3 = (void *)_references;
  id v4 = (id)[MEMORY[0x263F80CE0] weakReferenceWithObject:location[0]];
  objc_msgSend(v3, "addObject:");

  objc_storeStrong(location, 0);
}

+ (void)removeObject:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void *)_references;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __42__TKAdaptiveResourceManager_removeObject___block_invoke;
  v8 = &unk_26485AD98;
  id v9 = location[0];
  objc_msgSend(v3, "enumerateObjectsUsingBlock:");
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __42__TKAdaptiveResourceManager_removeObject___block_invoke(id *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v4 = (id)[location[0] object];
  BOOL v8 = v4 != a1[4];

  if (!v8)
  {
    [(id)_references removeObjectAtIndex:a3];
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
}

+ (void)setOverrideTrackingAdaptiveView:(id)a3
{
  id v7 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!location[0])
  {
    id v5 = (id)[MEMORY[0x263F82438] sharedApplication];
    id v3 = (id)[v5 keyWindow];
    id v4 = location[0];
    location[0] = v3;
  }
  objc_storeStrong((id *)&_trackingAdaptiveView, location[0]);
  [v7 adaptiveMetricsDidChange];
  objc_storeStrong(location, 0);
}

+ (id)traitCollection
{
  return (id)_traitCollection;
}

+ (CGSize)readableContentSize
{
  double v3 = *((double *)&_readableContentSize + 1);
  double v2 = *(double *)&_readableContentSize;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)size
{
  double v3 = *((double *)&_size + 1);
  double v2 = *(double *)&_size;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (void)setup
{
  id v9 = a1;
  SEL v8 = a2;
  uint64_t obj = MEMORY[0x263EF8330];
  int v3 = -1073741824;
  int v4 = 0;
  id v5 = __34__TKAdaptiveResourceManager_setup__block_invoke;
  int v6 = &__block_descriptor_40_e5_v8__0l;
  id v7 = a1;
  v11 = (dispatch_once_t *)&setup_onceToken_0;
  id location = 0;
  objc_storeStrong(&location, &obj);
  if (*v11 != -1) {
    dispatch_once(v11, location);
  }
  objc_storeStrong(&location, 0);
}

void __34__TKAdaptiveResourceManager_setup__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:64];
  double v2 = (void *)_references;
  _references = v1;

  _readableContentSize = *MEMORY[0x263F001B0];
  _size = *MEMORY[0x263F001B0];
  if (!_trackingAdaptiveView)
  {
    id v5 = (id)[MEMORY[0x263F82438] sharedApplication];
    id v3 = (id)[v5 keyWindow];
    int v4 = (void *)_trackingAdaptiveView;
    _trackingAdaptiveView = (uint64_t)v3;

    if (_trackingAdaptiveView) {
      [*(id *)(a1 + 32) adaptiveMetricsDidChange];
    }
  }
}

+ (void)windowSizeDidChange:(id)a3
{
  id v14 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)_trackingAdaptiveView;
  id v3 = (id)[location[0] object];
  BOOL v6 = v5 != v3;

  if (!v6)
  {
    int v4 = MEMORY[0x263EF83A0];
    uint64_t block = MEMORY[0x263EF8330];
    int v8 = -1073741824;
    int v9 = 0;
    v10 = __49__TKAdaptiveResourceManager_windowSizeDidChange___block_invoke;
    v11 = &__block_descriptor_40_e5_v8__0l;
    id v12 = v14;
    dispatch_async(v4, &block);
  }
  objc_storeStrong(location, 0);
}

uint64_t __49__TKAdaptiveResourceManager_windowSizeDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "adaptiveMetricsDidChange", a1, a1);
}

+ (void)adaptiveMetricsDidChange
{
  id v19 = a1;
  SEL v18 = a2;
  if (_trackingAdaptiveView)
  {
    [(id)_trackingAdaptiveView frame];
    uint64_t v14 = v2;
    uint64_t v15 = v3;
    *(void *)&long long v16 = v4;
    *((void *)&v16 + 1) = v5;
    long long v17 = v16;
    id v10 = (id)[(id)_trackingAdaptiveView readableContentGuide];
    [v10 layoutFrame];
    obj[1] = v6;
    obj[2] = v7;
    *(void *)&long long v12 = v8;
    *((void *)&v12 + 1) = v9;
    long long v13 = v12;

    obj[0] = (id)[(id)_trackingAdaptiveView traitCollection];
    if (!__CGSizeEqualToSize(*(double *)&_size, *((double *)&_size + 1), *(double *)&v16, *((double *)&v16 + 1))
      || !__CGSizeEqualToSize(*(double *)&_readableContentSize, *((double *)&_readableContentSize + 1), *(double *)&v13, *((double *)&v13 + 1))|| (id)_traitCollection != obj[0])
    {
      _size = v17;
      _readableContentSize = v13;
      objc_storeStrong((id *)&_traitCollection, obj[0]);
      [(id)_references enumerateObjectsWithOptions:2 usingBlock:&__block_literal_global_7];
    }
    objc_storeStrong(obj, 0);
  }
}

void __53__TKAdaptiveResourceManager_adaptiveMetricsDidChange__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v2 = (id)[location[0] object];
  [v2 adaptiveMetricsDidChange];

  objc_storeStrong(location, 0);
}

@end