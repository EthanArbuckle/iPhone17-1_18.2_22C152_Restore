@interface StickerPickerServiceAppDelegate
- (_TtC20StickerPickerService31StickerPickerServiceAppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation StickerPickerServiceAppDelegate

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = [v9 role];
  id v13 = [objc_allocWithZone((Class)UISceneConfiguration) initWithName:0 sessionRole:v12];

  type metadata accessor for StickerPickerServiceSceneDelegate();
  [v13 setDelegateClass:swift_getObjCClassFromMetadata()];

  return v13;
}

- (_TtC20StickerPickerService31StickerPickerServiceAppDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StickerPickerServiceAppDelegate();
  return [(StickerPickerServiceAppDelegate *)&v3 init];
}

@end