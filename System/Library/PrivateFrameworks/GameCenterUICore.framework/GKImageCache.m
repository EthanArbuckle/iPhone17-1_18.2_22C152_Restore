@interface GKImageCache
- (GKImageCache)initWithName:(id)a3 maxCount:(unint64_t)a4;
- (void)applicationDidEnterBackground:(id)a3;
- (void)greatestScreenScaleDidChange:(double)a3;
@end

@implementation GKImageCache

- (GKImageCache)initWithName:(id)a3 maxCount:(unint64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKImageCache;
  v7 = [(GKImageCache *)&v13 init];
  v8 = v7;
  if (v7)
  {
    [(GKImageCache *)v7 setName:v6];
    [(GKImageCache *)v8 setCountLimit:a4];
    v9 = +[GKScreenConfigurationController sharedController];
    [v9 registerListener:v8];

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    v11 = [MEMORY[0x263F40198] didEnterBackground];
    [v10 addObserver:v8 selector:sel_applicationDidEnterBackground_ name:v11 object:0];
  }
  return v8;
}

- (void)greatestScreenScaleDidChange:(double)a3
{
}

- (void)applicationDidEnterBackground:(id)a3
{
}

@end