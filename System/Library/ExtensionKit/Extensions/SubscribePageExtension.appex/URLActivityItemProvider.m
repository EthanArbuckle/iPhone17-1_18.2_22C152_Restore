@interface URLActivityItemProvider
- (_TtC22SubscribePageExtension23URLActivityItemProvider)initWithPlaceholderItem:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)activityViewControllerSubject:(id)a3;
- (id)item;
@end

@implementation URLActivityItemProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if (a4)
  {
    id v7 = a3;
    v8 = self;
    id v9 = a4;
    if (sub_1002BB864())
    {
      long long v20 = 0u;
      long long v21 = 0u;

      goto LABEL_6;
    }
  }
  else
  {
    id v10 = a3;
    v11 = self;
  }
  *((void *)&v21 + 1) = sub_100755EA0();
  sub_1000107A4((uint64_t *)&v20);
  sub_100759DA0();

LABEL_6:
  uint64_t v12 = *((void *)&v21 + 1);
  if (*((void *)&v21 + 1))
  {
    v13 = sub_10000FE94(&v20, *((uint64_t *)&v21 + 1));
    uint64_t v14 = *(void *)(v12 - 8);
    __n128 v15 = __chkstk_darwin(v13, v13);
    v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v14 + 16))(v17, v15);
    v18 = (void *)sub_100768B30();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v12);
    _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)&v20);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)item
{
  v2 = self;
  sub_10057C600(v5);

  sub_10000FE94(v5, v5[3]);
  v3 = (void *)sub_100768B30();
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v5);

  return v3;
}

- (_TtC22SubscribePageExtension23URLActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  swift_unknownObjectRetain();
  sub_100768710();
  swift_unknownObjectRelease();
  result = (_TtC22SubscribePageExtension23URLActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_10057CC58();

  return v6;
}

- (id)activityViewControllerSubject:(id)a3
{
  id v4 = self;
  id v5 = a3;
  sub_10057DB04();
  uint64_t v7 = v6;

  if (v7)
  {
    NSString v8 = sub_1007675C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

@end