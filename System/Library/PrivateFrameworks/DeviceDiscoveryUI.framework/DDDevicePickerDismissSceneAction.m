@interface DDDevicePickerDismissSceneAction
+ (id)actionWithResult:(int64_t)a3;
- (int64_t)dismissSceneActionContext;
@end

@implementation DDDevicePickerDismissSceneAction

+ (id)actionWithResult:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F29C78]);
  v6 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v6 forSetting:1];

  v7 = (void *)[objc_alloc((Class)a1) initWithInfo:v5 responder:0];
  return v7;
}

- (int64_t)dismissSceneActionContext
{
  v2 = [(DDDevicePickerDismissSceneAction *)self info];
  v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

@end