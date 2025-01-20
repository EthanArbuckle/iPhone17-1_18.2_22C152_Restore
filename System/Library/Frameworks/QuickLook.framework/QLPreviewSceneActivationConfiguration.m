@interface QLPreviewSceneActivationConfiguration
- (QLPreviewSceneActivationConfiguration)initWithItemsAtURLs:(NSArray *)urls options:(QLPreviewSceneOptions *)options;
- (void)setOptions:(id)a3;
@end

@implementation QLPreviewSceneActivationConfiguration

- (QLPreviewSceneActivationConfiguration)initWithItemsAtURLs:(NSArray *)urls options:(QLPreviewSceneOptions *)options
{
  v18[2] = *MEMORY[0x263EF8340];
  v6 = urls;
  v7 = options;
  v8 = (void *)[objc_alloc(MEMORY[0x263F018D0]) initWithActivityType:@"com.apple.quicklook.private.scene.detachedActivityType"];
  v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.quicklook.private.activity.URLsKey", @"com.apple.quicklook.private.activity.IndexKey", 0);
  [v8 setRequiredUserInfoKeys:v9];
  if (v7) {
    uint64_t v10 = [(QLPreviewSceneOptions *)v7 initialPreviewIndex];
  }
  else {
    uint64_t v10 = 0;
  }
  v17[1] = @"com.apple.quicklook.private.activity.IndexKey";
  v18[0] = v6;
  v17[0] = @"com.apple.quicklook.private.activity.URLsKey";
  v11 = [NSNumber numberWithUnsignedInteger:v10];
  v18[1] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  [v8 addUserInfoEntriesFromDictionary:v12];
  v16.receiver = self;
  v16.super_class = (Class)QLPreviewSceneActivationConfiguration;
  v13 = [(UIWindowSceneActivationConfiguration *)&v16 initWithUserActivity:v8];
  v14 = v13;
  if (v13) {
    [(QLPreviewSceneActivationConfiguration *)v13 setOptions:0];
  }

  return v14;
}

- (void)setOptions:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x263F82EA0]);
  }
  v7 = v6;
  v8 = [MEMORY[0x263F82B48] configurationWithName:@"com.apple.quicklook.private.scene.detachedActivityType" sessionRole:*MEMORY[0x263F83938]];
  [v8 setDelegateClass:objc_opt_class()];
  [v7 _setQuickLookSceneConfiguration:v8];
  v9.receiver = self;
  v9.super_class = (Class)QLPreviewSceneActivationConfiguration;
  [(UIWindowSceneActivationConfiguration *)&v9 setOptions:v7];
}

@end