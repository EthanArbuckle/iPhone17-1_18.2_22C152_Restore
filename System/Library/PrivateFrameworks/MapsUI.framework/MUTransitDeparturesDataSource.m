@interface MUTransitDeparturesDataSource
- (BOOL)isActive;
- (MUTransitDeparturesDataSource)init;
- (MUTransitDeparturesDataSource)initWithMapItem:(id)a3;
- (MUTransitDeparturesDataSourceDelegate)delegate;
- (id)traitsForTransitDeparturesDataProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)transitDeparturesDataProviderDidReload:(id)a3;
@end

@implementation MUTransitDeparturesDataSource

- (MUTransitDeparturesDataSourceDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___MUTransitDeparturesDataSource_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1996FC540](v2);
  return (MUTransitDeparturesDataSourceDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isActive
{
  v2 = (BOOL *)self + OBJC_IVAR___MUTransitDeparturesDataSource_isActive;
  swift_beginAccess();
  return *v2;
}

- (void)setIsActive:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (char *)self + OBJC_IVAR___MUTransitDeparturesDataSource_isActive;
  swift_beginAccess();
  unsigned char *v5 = v3;
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___MUTransitDeparturesDataSource_dataProvider), sel_setActive_, v3);
}

- (MUTransitDeparturesDataSource)initWithMapItem:(id)a3
{
  return (MUTransitDeparturesDataSource *)TransitDeparturesDataSource.init(mapItem:)(a3);
}

- (MUTransitDeparturesDataSource)init
{
  result = (MUTransitDeparturesDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1931F0EAC((uint64_t)self + OBJC_IVAR___MUTransitDeparturesDataSource_delegate);

  BOOL v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MUTransitDeparturesDataSource_dataProvider);
}

- (id)traitsForTransitDeparturesDataProvider:(id)a3
{
  v5 = (char *)self + OBJC_IVAR___MUTransitDeparturesDataSource_delegate;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1996FC540](v5);
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = a3;
    v9 = self;
    id v10 = objc_msgSend(v7, sel_traitsForDeparturesDataSource_, v9);

    swift_unknownObjectRelease();
  }
  else
  {
    id v11 = objc_allocWithZone(MEMORY[0x1E4F64718]);
    id v12 = a3;
    v13 = self;
    id result = objc_msgSend(v11, sel_init);
    if (!result)
    {
      __break(1u);
      return result;
    }
    id v10 = result;
  }
  return v10;
}

- (void)transitDeparturesDataProviderDidReload:(id)a3
{
  v5 = (char *)self + OBJC_IVAR___MUTransitDeparturesDataSource_delegate;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1996FC540](v5);
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = a3;
    v9 = self;
    objc_msgSend(v7, sel_transitDeparturesDataSourceWantsReload_, v9);

    swift_unknownObjectRelease();
  }
}

@end