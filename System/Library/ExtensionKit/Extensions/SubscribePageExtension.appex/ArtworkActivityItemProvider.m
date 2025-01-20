@interface ArtworkActivityItemProvider
- (_TtC22SubscribePageExtension27ArtworkActivityItemProvider)initWithPlaceholderItem:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)item;
@end

@implementation ArtworkActivityItemProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100720EEC(a4, &v17);

  uint64_t v9 = v18;
  if (v18)
  {
    v10 = sub_10000FE94(&v17, v18);
    uint64_t v11 = *(void *)(v9 - 8);
    __n128 v12 = __chkstk_darwin(v10, v10);
    v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v11 + 16))(v14, v12);
    v15 = (void *)sub_100768B30();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v9);
    _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)&v17);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)item
{
  v2 = self;
  sub_1007211B0(v5);

  sub_10000FE94(v5, v5[3]);
  v3 = (void *)sub_100768B30();
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v5);

  return v3;
}

- (_TtC22SubscribePageExtension27ArtworkActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  swift_unknownObjectRetain();
  sub_100768710();
  swift_unknownObjectRelease();
  result = (_TtC22SubscribePageExtension27ArtworkActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

@end