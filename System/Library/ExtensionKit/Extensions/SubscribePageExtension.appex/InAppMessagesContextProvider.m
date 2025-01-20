@interface InAppMessagesContextProvider
- (_TtC22SubscribePageExtension28InAppMessagesContextProvider)init;
- (id)contextPropertyWithName:(id)a3;
- (id)viewControllerForModalPresentation;
- (void)familyInfoDidChange;
@end

@implementation InAppMessagesContextProvider

- (id)contextPropertyWithName:(id)a3
{
  uint64_t v4 = sub_1007675F0();
  uint64_t v6 = v5;
  v7 = self;
  sub_10010E18C(v4, v6, (uint64_t)v16);

  swift_bridgeObjectRelease();
  uint64_t v8 = v17;
  if (v17)
  {
    v9 = sub_10000FE94(v16, v17);
    uint64_t v10 = *(void *)(v8 - 8);
    __n128 v11 = __chkstk_darwin(v9, v9);
    v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v10 + 16))(v13, v11);
    v14 = (void *)sub_100768B30();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v16);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)viewControllerForModalPresentation
{
  id v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension28InAppMessagesContextProvider_rootViewController);
  if (v2) {
    id v2 = [v2 frontmostViewController];
  }

  return v2;
}

- (void)familyInfoDidChange
{
  id v2 = self;
  sub_10010EB30();
}

- (_TtC22SubscribePageExtension28InAppMessagesContextProvider)init
{
  result = (_TtC22SubscribePageExtension28InAppMessagesContextProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28InAppMessagesContextProvider_arcadeSubscriptionManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28InAppMessagesContextProvider_accountStore));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension28InAppMessagesContextProvider_rootViewController);
}

@end