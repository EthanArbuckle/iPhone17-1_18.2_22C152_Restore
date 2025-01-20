@interface UIActivity(RPExtensions)
+ (void)streamActivitiesWithCompletion:()RPExtensions;
@end

@implementation UIActivity(RPExtensions)

+ (void)streamActivitiesWithCompletion:()RPExtensions
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = (void *)MEMORY[0x263F08800];
  uint64_t v9 = *MEMORY[0x263F07FF8];
  v10[0] = @"com.apple.share-services";
  v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__UIActivity_RPExtensions__streamActivitiesWithCompletion___block_invoke;
  v7[3] = &unk_26451D730;
  id v8 = v3;
  id v6 = v3;
  [v4 extensionsWithMatchingAttributes:v5 completion:v7];
}

@end