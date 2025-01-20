@interface TKAdaptiveImageAPI
+ (id)defaultImageService;
+ (id)getService:(id)a3;
+ (void)registerService:(id)a3 handler:(id)a4;
+ (void)setDefaultImageService:(id)a3;
@end

@implementation TKAdaptiveImageAPI

+ (void)registerService:(id)a3 handler:(id)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id aBlock = 0;
  objc_storeStrong(&aBlock, a4);
  v9 = (dispatch_once_t *)&registerService_handler__onceToken;
  id v8 = 0;
  objc_storeStrong(&v8, &__block_literal_global_10);
  if (*v9 != -1) {
    dispatch_once(v9, v8);
  }
  objc_storeStrong(&v8, 0);
  id v4 = _Block_copy(aBlock);
  objc_msgSend((id)_handlers, "setObject:forKeyedSubscript:");

  if (!_defaultImageService) {
    objc_storeStrong((id *)&_defaultImageService, location[0]);
  }
  objc_storeStrong(&aBlock, 0);
  objc_storeStrong(location, 0);
}

void __46__TKAdaptiveImageAPI_registerService_handler___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v1 = (void *)_handlers;
  _handlers = (uint64_t)v0;
}

+ (id)getService:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!location[0]) {
    objc_storeStrong(location, (id)_defaultImageService);
  }
  id v4 = (id)[(id)_handlers objectForKeyedSubscript:location[0]];
  objc_storeStrong(location, 0);
  return v4;
}

+ (id)defaultImageService
{
  return (id)_defaultImageService;
}

+ (void)setDefaultImageService:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = [location[0] copy];
  id v4 = (void *)_defaultImageService;
  _defaultImageService = v3;

  objc_storeStrong(location, 0);
}

@end