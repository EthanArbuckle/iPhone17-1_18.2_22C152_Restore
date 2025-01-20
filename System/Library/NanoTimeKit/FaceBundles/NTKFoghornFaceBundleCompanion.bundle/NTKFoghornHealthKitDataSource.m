@interface NTKFoghornHealthKitDataSource
- (NSNumber)maxDepth;
- (NTKFoghornHealthKitDataSource)init;
- (NTKFoghornHealthKitDataSourceDelegate)delegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setMaxDepth:(id)a3;
@end

@implementation NTKFoghornHealthKitDataSource

- (NTKFoghornHealthKitDataSourceDelegate)delegate
{
  v2 = (void *)MEMORY[0x24C542400]((char *)self + OBJC_IVAR___NTKFoghornHealthKitDataSource_delegate, a2);

  return (NTKFoghornHealthKitDataSourceDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_246B1F8C0();

  swift_unknownObjectRelease();
}

- (NSNumber)maxDepth
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___NTKFoghornHealthKitDataSource_maxDepth));
}

- (void)setMaxDepth:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_246B1F970(a3);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___NTKFoghornHealthKitDataSource_subscriptions);
  swift_beginAccess();
  void *v4 = MEMORY[0x263F8EE88];
  v5 = self;
  swift_bridgeObjectRelease();
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___NTKFoghornHealthKitDataSource_healthKitProvider) = 0;
  swift_release();
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(NTKFoghornHealthKitDataSource *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_246B1FBC0((uint64_t)self + OBJC_IVAR___NTKFoghornHealthKitDataSource_delegate);

  swift_release();

  swift_bridgeObjectRelease();
}

- (NTKFoghornHealthKitDataSource)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKFoghornHealthKitDataSource_maxDepth) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKFoghornHealthKitDataSource_healthKitProvider) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKFoghornHealthKitDataSource_subscriptions) = (Class)MEMORY[0x263F8EE88];
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(NTKFoghornHealthKitDataSource *)&v5 init];
}

@end