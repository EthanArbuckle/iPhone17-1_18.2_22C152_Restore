@interface STKStickerPickerSceneSpecification
- (id)userActivity;
@end

@implementation STKStickerPickerSceneSpecification

- (id)userActivity
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08D38]) initWithActivityType:@"STKStickerPickerActivityTypeDefaultBrowser"];

  return v2;
}

@end