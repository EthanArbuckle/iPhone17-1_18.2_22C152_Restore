@interface _PlaceableAsJUPlaceable
- (JUMeasurements)measureToFit:(CGSize)a3 withTraitCollection:(id)a4;
- (NSString)description;
- (_TtC5JetUI23_PlaceableAsJUPlaceable)init;
- (void)placeAtRect:(CGRect)a3 withTraitCollection:(id)a4;
@end

@implementation _PlaceableAsJUPlaceable

- (JUMeasurements)measureToFit:(CGSize)a3 withTraitCollection:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base);
  uint64_t v9 = v8[3];
  uint64_t v10 = v8[4];
  __swift_project_boxed_opaque_existential_1(v8, v9);
  v11 = *(double (**)(id, uint64_t, uint64_t, double, double))(v10 + 8);
  id v12 = a4;
  v13 = self;
  double v14 = v11(v12, v9, v10, width, height);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.var3 = v24;
  result.var2 = v23;
  result.var1 = v22;
  result.var0 = v21;
  return result;
}

- (void)placeAtRect:(CGRect)a3 withTraitCollection:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v10 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base);
  uint64_t v11 = v10[3];
  uint64_t v12 = v10[4];
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v13 = *(void (**)(id, uint64_t, uint64_t, double, double, double, double))(v12 + 16);
  id v14 = a4;
  double v15 = self;
  v13(v14, v11, v12, x, y, width, height);
}

- (NSString)description
{
  sub_1B07BBD78((uint64_t)self + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base, (uint64_t)v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595770);
  sub_1B0869DE8();
  v2 = (void *)sub_1B0869D68();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC5JetUI23_PlaceableAsJUPlaceable)init
{
  JUMeasurements result = (_TtC5JetUI23_PlaceableAsJUPlaceable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end