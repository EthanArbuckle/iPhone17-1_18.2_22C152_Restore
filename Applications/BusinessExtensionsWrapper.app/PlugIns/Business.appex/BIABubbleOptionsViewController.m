@interface BIABubbleOptionsViewController
- (_TtC8Business30BIABubbleOptionsViewController)initWithCoder:(id)a3;
- (_TtC8Business30BIABubbleOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation BIABubbleOptionsViewController

- (_TtC8Business30BIABubbleOptionsViewController)initWithCoder:(id)a3
{
  uint64_t v5 = sub_100005D74(&qword_1000FEFF0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = &v15[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = (char *)self + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_viewModel;
  uint64_t v11 = type metadata accessor for BIABubbleViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  swift_unknownObjectWeakInit();
  v12 = (char *)self + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController__shouldBeVisible;
  v15[15] = 0;
  id v13 = a3;
  sub_1000BB668();
  (*(void (**)(char *, unsigned char *, uint64_t))(v6 + 32))(v12, v9, v5);

  result = (_TtC8Business30BIABubbleOptionsViewController *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (_TtC8Business30BIABubbleOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Business30BIABubbleOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000FE60((uint64_t)self + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_context);
  sub_10008802C((uint64_t)self + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_viewModel);
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController__shouldBeVisible;
  uint64_t v4 = sub_100005D74(&qword_1000FEFF0);
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end