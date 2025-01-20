@interface AMSUIAssetLoader
+ (AMSUIAssetLoader)sharedLoader;
- (AMSUIAssetLoader)init;
- (id)fetchWithAssetURL:(id)a3;
@end

@implementation AMSUIAssetLoader

+ (AMSUIAssetLoader)sharedLoader
{
  id v2 = static AssetLoader.shared.getter();
  return (AMSUIAssetLoader *)v2;
}

- (id)fetchWithAssetURL:(id)a3
{
  uint64_t v4 = sub_21C2BD740();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2BD6F0();
  v8 = self;
  id v9 = sub_21C216678((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (AMSUIAssetLoader)init
{
  return (AMSUIAssetLoader *)AssetLoader.init()();
}

- (void).cxx_destruct
{
}

@end