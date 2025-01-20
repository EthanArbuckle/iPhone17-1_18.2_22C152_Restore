@interface SearchCardView.Coordinator
- (BOOL)canPerformCommand:(id)a3;
- (_TtCV6Tamale14SearchCardView11Coordinator)init;
- (void)cardViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4 animated:(BOOL)a5;
- (void)performCommand:(id)a3;
- (void)presentViewController:(id)a3;
@end

@implementation SearchCardView.Coordinator

- (void)cardViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4 animated:(BOOL)a5
{
  id v7 = a3;
  v8 = self;
  sub_10001F8E0(a3);
}

- (void)presentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10001DC88(a3);
}

- (BOOL)canPerformCommand:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_10001FA10(v3);

  return v3 & 1;
}

- (void)performCommand:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10001DF38(a3);
}

- (_TtCV6Tamale14SearchCardView11Coordinator)init
{
  result = (_TtCV6Tamale14SearchCardView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001F634((uint64_t)self + OBJC_IVAR____TtCV6Tamale14SearchCardView11Coordinator_parent, type metadata accessor for SearchCardView);

  swift_unknownObjectWeakDestroy();
}

@end