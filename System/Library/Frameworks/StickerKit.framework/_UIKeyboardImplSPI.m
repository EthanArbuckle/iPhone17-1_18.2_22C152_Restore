@interface _UIKeyboardImplSPI
+ (void)insertEmojiImageTextAttachment:(id)a3;
+ (void)insertSticker:(id)a3;
+ (void)playInputClick;
+ (void)postEmojiSearchViewButtonConfigurationWillChangeNotification:(int64_t)a3;
@end

@implementation _UIKeyboardImplSPI

+ (void)playInputClick
{
  id v2 = [MEMORY[0x263F828B0] activeInstance];
  if (objc_opt_respondsToSelector()) {
    [v2 playInputClick];
  }
}

+ (void)insertSticker:(id)a3
{
  v3 = (void *)MEMORY[0x263F828B0];
  id v4 = a3;
  id v5 = [v3 activeInstance];
  [v5 insertSticker:v4];
}

+ (void)insertEmojiImageTextAttachment:(id)a3
{
  v3 = (void *)MEMORY[0x263F828B0];
  id v4 = a3;
  id v5 = [v3 activeInstance];
  [v5 insertEmojiImageTextAttachment:v4];
}

+ (void)postEmojiSearchViewButtonConfigurationWillChangeNotification:(int64_t)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = @"ButtonConfiguration";
  v3 = [NSNumber numberWithInteger:a3];
  v7[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"TUIEmojiSearchViewButtonConfigurationWillChangeNotification" object:0 userInfo:v4];
}

@end