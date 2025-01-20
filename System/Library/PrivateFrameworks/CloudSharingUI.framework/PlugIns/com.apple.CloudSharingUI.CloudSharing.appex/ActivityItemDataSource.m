@interface ActivityItemDataSource
- (_TtC37com_apple_CloudSharingUI_CloudSharing22ActivityItemDataSource)init;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerOperation:(id)a3;
- (id)activityViewControllerPlaceholderItem:(void *)a3;
@end

@implementation ActivityItemDataSource

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return sub_1000BDE94(self, (uint64_t)a2, a3, a4, (void (*)(void *__return_ptr))sub_1000BD478);
}

- (_TtC37com_apple_CloudSharingUI_CloudSharing22ActivityItemDataSource)init
{
  result = (_TtC37com_apple_CloudSharingUI_CloudSharing22ActivityItemDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing22ActivityItemDataSource_share));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing22ActivityItemDataSource_delegate;

  sub_100074350((uint64_t)v3);
}

- (id)activityViewControllerOperation:(id)a3
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_1000C43F8(a3);

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(void *)a3
{
  uint64_t v5 = sub_100012854((uint64_t *)&unk_10010BDD0);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000C6530();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v19 - v13;
  id v15 = a3;
  id v16 = a1;
  sub_1000C6520();
  id result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v7, v8);

    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    v18 = (void *)sub_1000C7A70();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    return v18;
  }
  return result;
}

@end