@interface AVInfoTabCoordinator
- (AVInfoTabCoordinator)init;
- (AVInfoTabCoordinator)initWithPlayerItem:(id)a3 actions:(id)a4;
- (AVPlayerItem)playerItem;
- (NSArray)actions;
- (UIViewController)infoTabViewController;
- (void)setActions:(id)a3;
- (void)setInfoTabViewController:(id)a3;
- (void)setPlayerItem:(id)a3;
@end

@implementation AVInfoTabCoordinator

- (UIViewController)infoTabViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___AVInfoTabCoordinator_infoTabViewController));
}

- (void)setInfoTabViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AVInfoTabCoordinator_infoTabViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AVInfoTabCoordinator_infoTabViewController) = (Class)a3;
  id v3 = a3;
}

- (AVPlayerItem)playerItem
{
  return (AVPlayerItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR___AVInfoTabCoordinator_playerItem));
}

- (void)setPlayerItem:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1B05CC06C(a3);
}

- (NSArray)actions
{
  sub_1B05CC02C();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B0706070();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setActions:(id)a3
{
  sub_1B05CC02C();
  uint64_t v4 = sub_1B0706080();
  v5 = self;
  sub_1B05CBD10(v4);
}

- (AVInfoTabCoordinator)initWithPlayerItem:(id)a3 actions:(id)a4
{
  sub_1B05CC02C();
  uint64_t v5 = sub_1B0706080();
  return (AVInfoTabCoordinator *)sub_1B05CBDFC(a3, v5);
}

- (AVInfoTabCoordinator)init
{
  result = (AVInfoTabCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end