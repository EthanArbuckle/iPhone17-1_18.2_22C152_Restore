@interface DetailsSearchControllerRepresentable.Coordinator
- (_TtCV7ChatKit36DetailsSearchControllerRepresentable11Coordinator)init;
- (void)batchDownloadNotificationFired:(id)a3;
- (void)detailsSearchController:(id)a3 requestsPushOfSearchController:(id)a4;
- (void)detailsSearchControllerContentDidChange:(id)a3;
@end

@implementation DetailsSearchControllerRepresentable.Coordinator

- (void)detailsSearchControllerContentDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F55EFEC(v4);
}

- (void)detailsSearchController:(id)a3 requestsPushOfSearchController:(id)a4
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV7ChatKit36DetailsSearchControllerRepresentable11Coordinator_navigationController);
  if (v4) {
    objc_msgSend(v4, sel_pushViewController_animated_, a4, 1);
  }
}

- (void)batchDownloadNotificationFired:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F55FA78();
}

- (_TtCV7ChatKit36DetailsSearchControllerRepresentable11Coordinator)init
{
  result = (_TtCV7ChatKit36DetailsSearchControllerRepresentable11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV7ChatKit36DetailsSearchControllerRepresentable11Coordinator_navigationController));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV7ChatKit36DetailsSearchControllerRepresentable11Coordinator_searchViewController);
}

@end