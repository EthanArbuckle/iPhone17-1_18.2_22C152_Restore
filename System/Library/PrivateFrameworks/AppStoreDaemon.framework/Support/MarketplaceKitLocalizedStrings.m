@interface MarketplaceKitLocalizedStrings
+ (void)showDialogForAlreadyInstalledApp:(id)a3 presenter:(id)a4;
- (_TtC9appstored30MarketplaceKitLocalizedStrings)init;
@end

@implementation MarketplaceKitLocalizedStrings

+ (void)showDialogForAlreadyInstalledApp:(id)a3 presenter:(id)a4
{
  uint64_t v6 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v6 - 8);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = a3;
  v10[5] = a4;
  id v11 = a3;
  swift_unknownObjectRetain_n();
  id v12 = v11;
  sub_100018FDC((uint64_t)v8, (uint64_t)&unk_1005A4CB8, (uint64_t)v10);

  swift_unknownObjectRelease();
  swift_release();
}

- (_TtC9appstored30MarketplaceKitLocalizedStrings)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(MarketplaceKitLocalizedStrings *)&v3 init];
}

@end