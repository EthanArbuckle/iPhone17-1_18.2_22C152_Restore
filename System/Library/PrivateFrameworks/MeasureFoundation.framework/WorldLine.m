@interface WorldLine
- (NSArray)identifiersOfObjectsComposedInto;
- (_TtC17MeasureFoundation9WorldLine)init;
- (void)setIdentifiersOfObjectsComposedInto:(id)a3;
@end

@implementation WorldLine

- (NSArray)identifiersOfObjectsComposedInto
{
  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_identifiersOfObjectsComposedInto);
  swift_beginAccess();
  if (*v2)
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_22F223CA8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (void)setIdentifiersOfObjectsComposedInto:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_22F223CB8();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_identifiersOfObjectsComposedInto);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC17MeasureFoundation9WorldLine)init
{
  result = (_TtC17MeasureFoundation9WorldLine *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end