@interface ActionSetContainerSummaryGridViewController
- (BOOL)_hasTapActionForItem:(id)a3;
- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5;
- (_TtC6HomeUI43ActionSetContainerSummaryGridViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4;
- (id)initUsingCompositionalLayoutWithItemManager:(id)a3;
@end

@implementation ActionSetContainerSummaryGridViewController

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1BE588764(v4);

  return v6;
}

- (BOOL)_hasTapActionForItem:(id)a3
{
  return 0;
}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  return *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_moduleController) != 0;
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_1BE5888C4((uint64_t)v6, v7);

  return v9;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = a5;
  v11 = self;
  unsigned __int8 v12 = sub_1BE588AD8((uint64_t)v9, (uint64_t)v10, x, y);

  return v12 & 1;
}

- (_TtC6HomeUI43ActionSetContainerSummaryGridViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC6HomeUI43ActionSetContainerSummaryGridViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)initUsingCompositionalLayoutWithItemManager:(id)a3
{
  id v3 = a3;
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_module));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_moduleController);
}

@end