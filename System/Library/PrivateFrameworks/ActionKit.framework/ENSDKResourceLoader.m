@interface ENSDKResourceLoader
+ (id)pathToResourceNamed:(id)a3 extension:(id)a4;
@end

@implementation ENSDKResourceLoader

+ (id)pathToResourceNamed:(id)a3 extension:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x263F086E0];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 pathForResource:@"ENSDKResources" ofType:@"bundle"];
  v10 = [v7 bundleWithPath:v9];
  v11 = [v10 pathForResource:v5 ofType:v6];

  if (!v11)
  {
    v13 = +[ENSession sharedSession];
    v14 = [v13 logger];
    v15 = [NSString stringWithFormat:@"Failed to load resource from ENSDKResources.bundle. Is it included in your app?"];
    [v14 evernoteLogErrorString:v15];

    __assert_rtn("+[ENSDKResourceLoader pathToResourceNamed:extension:]", "ENSDKResourceLoader.m", 39, "path");
  }

  return v11;
}

@end