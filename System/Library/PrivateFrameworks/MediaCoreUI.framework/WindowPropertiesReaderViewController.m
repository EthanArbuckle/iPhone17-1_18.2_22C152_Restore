@interface WindowPropertiesReaderViewController
- (_TtC11MediaCoreUIP33_E92D59AEB5FF02FAFDF5606CD409BD2A36WindowPropertiesReaderViewController)initWithCoder:(id)a3;
- (_TtC11MediaCoreUIP33_E92D59AEB5FF02FAFDF5606CD409BD2A36WindowPropertiesReaderViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation WindowPropertiesReaderViewController

- (_TtC11MediaCoreUIP33_E92D59AEB5FF02FAFDF5606CD409BD2A36WindowPropertiesReaderViewController)initWithCoder:(id)a3
{
  result = (_TtC11MediaCoreUIP33_E92D59AEB5FF02FAFDF5606CD409BD2A36WindowPropertiesReaderViewController *)sub_255C81248();
  __break(1u);
  return result;
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_255B100C0(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_255B10320((uint64_t)a4, width, height);
  swift_unknownObjectRelease();
}

- (_TtC11MediaCoreUIP33_E92D59AEB5FF02FAFDF5606CD409BD2A36WindowPropertiesReaderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11MediaCoreUIP33_E92D59AEB5FF02FAFDF5606CD409BD2A36WindowPropertiesReaderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end