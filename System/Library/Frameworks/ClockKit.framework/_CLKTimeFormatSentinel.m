@interface _CLKTimeFormatSentinel
+ (void)_handleLocaleChange;
+ (void)listenForLocaleChangesIfNecessary;
@end

@implementation _CLKTimeFormatSentinel

+ (void)listenForLocaleChangesIfNecessary
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59___CLKTimeFormatSentinel_listenForLocaleChangesIfNecessary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (listenForLocaleChangesIfNecessary_onceToken != -1) {
    dispatch_once(&listenForLocaleChangesIfNecessary_onceToken, block);
  }
}

+ (void)_handleLocaleChange
{
  +[_CLKTimeFormatData resetTimeFormatData];
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"CLKFormatTimeIntervalCacheInvalidateNotification" object:0];
}

@end