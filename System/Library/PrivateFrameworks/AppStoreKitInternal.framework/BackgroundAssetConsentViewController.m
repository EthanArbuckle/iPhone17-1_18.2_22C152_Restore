@interface BackgroundAssetConsentViewController
- (_TtC19AppStoreKitInternal36BackgroundAssetConsentViewController)init;
- (_TtC19AppStoreKitInternal36BackgroundAssetConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC19AppStoreKitInternal36BackgroundAssetConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
@end

@implementation BackgroundAssetConsentViewController

- (_TtC19AppStoreKitInternal36BackgroundAssetConsentViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BackgroundAssetConsentViewController();
  return [(SKBackgroundAssetConsentViewController *)&v3 init];
}

- (_TtC19AppStoreKitInternal36BackgroundAssetConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9 = sub_1E1D5BE58();
  uint64_t v11 = v10;
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    return (_TtC19AppStoreKitInternal36BackgroundAssetConsentViewController *)sub_1E18A8CD4(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)sub_1E1D5BE58();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = sub_1E1D5BE58();
  uint64_t v16 = v15;
  return (_TtC19AppStoreKitInternal36BackgroundAssetConsentViewController *)sub_1E18A8CD4(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC19AppStoreKitInternal36BackgroundAssetConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  sub_1E1D5BE58();
  if (a4)
  {
    sub_1E1D5BE58();
    a4 = v10;
  }
  id v11 = a5;
  uint64_t v12 = (void *)sub_1E1D5BE18();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v13 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for BackgroundAssetConsentViewController();
  uint64_t v14 = [(BackgroundAssetConsentViewController *)&v16 initWithTitle:v12 detailText:v13 icon:v11 contentLayout:a6];

  return v14;
}

@end