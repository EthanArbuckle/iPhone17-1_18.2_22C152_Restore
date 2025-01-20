@interface HullPointHierarchy
- (_TtC8RoomPlan18HullPointHierarchy)init;
@end

@implementation HullPointHierarchy

- (_TtC8RoomPlan18HullPointHierarchy)init
{
  result = (_TtC8RoomPlan18HullPointHierarchy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan18HullPointHierarchy_parent);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan18HullPointHierarchy_parent) = 0;
  if (v3)
  {
    while (1)
    {
      v6 = v3;
      if (!swift_isUniquelyReferenced()) {
        break;
      }
      v4 = *(char **)&v6[OBJC_IVAR____TtC8RoomPlan18HullPointHierarchy_parent];
      v5 = v4;

      v3 = v4;
      if (!v4) {
        goto LABEL_6;
      }
    }
    v3 = v6;
  }
LABEL_6:
}

@end