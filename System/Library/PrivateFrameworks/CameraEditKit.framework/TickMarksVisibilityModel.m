@interface TickMarksVisibilityModel
- (BOOL)shouldHideTickMarkAtIndex:(unint64_t)a3;
- (_TtC13CameraEditKit24TickMarksVisibilityModel)init;
- (_TtC13CameraEditKit24TickMarksVisibilityModel)initWithModel:(id)a3;
- (void)setNeedsRebuild;
@end

@implementation TickMarksVisibilityModel

- (_TtC13CameraEditKit24TickMarksVisibilityModel)initWithModel:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_overlappingSections) = (Class)MEMORY[0x1E4FBC870];
  uint64_t v6 = OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_visibleSectionIndices;
  *(Class *)((char *)&self->super.isa + v6) = (Class)sub_1BEE6E7C8(MEMORY[0x1E4FBC860]);
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_needsRebuild) = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_model) = (Class)a3;
  v9.receiver = self;
  v9.super_class = ObjectType;
  id v7 = a3;
  return [(TickMarksVisibilityModel *)&v9 init];
}

- (void)setNeedsRebuild
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_needsRebuild) = 1;
}

- (BOOL)shouldHideTickMarkAtIndex:(unint64_t)a3
{
  v4 = self;
  LOBYTE(a3) = sub_1BEE6BB84(a3);

  return a3 & 1;
}

- (_TtC13CameraEditKit24TickMarksVisibilityModel)init
{
  result = (_TtC13CameraEditKit24TickMarksVisibilityModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end