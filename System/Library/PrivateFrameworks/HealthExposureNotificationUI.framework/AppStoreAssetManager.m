@interface AppStoreAssetManager
+ (void)accessAppFor:(id)a3 presentingViewController:(id)a4 completion:(id)a5;
+ (void)fetchAssetForAppBundleId:(id)a3 completion:(id)a4;
+ (void)fetchAssetNameForAppBundleId:(id)a3 completion:(id)a4;
+ (void)openAppStoreFromViewController:(id)a3;
+ (void)presentAppStoreProductPage:(id)a3 from:(id)a4;
- (_TtC28HealthExposureNotificationUI20AppStoreAssetManager)init;
@end

@implementation AppStoreAssetManager

+ (void)fetchAssetNameForAppBundleId:(id)a3 completion:(id)a4
{
}

+ (void)fetchAssetForAppBundleId:(id)a3 completion:(id)a4
{
}

+ (void)accessAppFor:(id)a3 presentingViewController:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v7);
  id v9 = a3;
  id v10 = a4;
  sub_2293D2B58((uint64_t)v9, v10, ObjCClassMetadata, (void (**)(void, void))v7);
  _Block_release(v7);
  _Block_release(v7);
}

+ (void)presentAppStoreProductPage:(id)a3 from:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_2293D2E10(v5, v6);
}

+ (void)openAppStoreFromViewController:(id)a3
{
  v4 = self;
  id v5 = a3;
  id v6 = objc_msgSend(v4, sel_defaultWorkspace);
  if (v6)
  {
    v7 = v6;
    id v8 = (id)sub_229419178();
    objc_msgSend(v7, sel_openApplicationWithBundleID_, v8);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC28HealthExposureNotificationUI20AppStoreAssetManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppStoreAssetManager();
  return [(AppStoreAssetManager *)&v3 init];
}

@end