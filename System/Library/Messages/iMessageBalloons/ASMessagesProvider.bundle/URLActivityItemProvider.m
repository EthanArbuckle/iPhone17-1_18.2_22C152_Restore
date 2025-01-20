@interface URLActivityItemProvider
- (_TtC18ASMessagesProvider23URLActivityItemProvider)initWithPlaceholderItem:(id)a3;
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
    if (sub_67DC90())
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
  *((void *)&v21 + 1) = sub_76BC30();
  sub_FBE0((uint64_t *)&v20);
  sub_76FD90();

LABEL_6:
  uint64_t v12 = *((void *)&v21 + 1);
  if (*((void *)&v21 + 1))
  {
    v13 = sub_FB9C(&v20, *((uint64_t *)&v21 + 1));
    uint64_t v14 = *(void *)(v12 - 8);
    __n128 v15 = __chkstk_darwin(v13);
    v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v14 + 16))(v17, v15);
    v18 = (void *)sub_77EC10();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v12);
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&v20);
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
  sub_5E9A5C(v5);

  sub_FB9C(v5, v5[3]);
  v3 = (void *)sub_77EC10();
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v5);

  return v3;
}

- (_TtC18ASMessagesProvider23URLActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  swift_unknownObjectRetain();
  sub_77E7F0();
  swift_unknownObjectRelease();
  result = (_TtC18ASMessagesProvider23URLActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
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
  v6 = sub_5EA0B4();

  return v6;
}

- (id)activityViewControllerSubject:(id)a3
{
  id v4 = self;
  id v5 = a3;
  sub_5EAF60();
  uint64_t v7 = v6;

  if (v7)
  {
    NSString v8 = sub_77D640();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

@end