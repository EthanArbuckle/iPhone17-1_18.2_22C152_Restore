@interface STKStickerPickerSceneClientToHostAction
+ (id)actionForStickerPickerSceneDidRequestDismissal;
- (void)performActionForSceneController:(id)a3;
@end

@implementation STKStickerPickerSceneClientToHostAction

+ (id)actionForStickerPickerSceneDidRequestDismissal
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v3 setObject:&unk_26FA2CAF8 forSetting:0];
  v4 = (void *)[objc_alloc((Class)a1) initWithInfo:v3 responder:0];

  return v4;
}

- (void)performActionForSceneController:(id)a3
{
  id v4 = a3;
  v5 = [(STKStickerPickerSceneClientToHostAction *)self info];
  v6 = [v5 objectForSetting:0];
  uint64_t v7 = [v6 integerValue];

  id v8 = [v4 delegate];

  if (!v7) {
    [v8 stickerPickerSceneDidRequestDismissal];
  }
}

@end