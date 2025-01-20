@interface DOCInterface
+ (_TtP11SaveToFiles28DOCInterfaceSystemAppearance_)general;
+ (_TtP11SaveToFiles31DOCSourceListInterfaceProviding_)sidebar;
+ (void)setGeneral:(id)a3;
- (_TtC11SaveToFiles12DOCInterface)init;
@end

@implementation DOCInterface

+ (_TtP11SaveToFiles31DOCSourceListInterfaceProviding_)sidebar
{
  type metadata accessor for DOCSourceListInterface_Default();
  inited = (void *)swift_initStaticObject();
  return (_TtP11SaveToFiles31DOCSourceListInterfaceProviding_ *)inited;
}

+ (_TtP11SaveToFiles28DOCInterfaceSystemAppearance_)general
{
  if (qword_10062AC48 != -1) {
    swift_once();
  }
  v2 = (void *)swift_unknownObjectRetain();
  return (_TtP11SaveToFiles28DOCInterfaceSystemAppearance_ *)v2;
}

+ (void)setGeneral:(id)a3
{
  uint64_t v4 = qword_10062AC48;
  swift_unknownObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  qword_100641650 = (uint64_t)a3;
  swift_unknownObjectRelease();
}

- (_TtC11SaveToFiles12DOCInterface)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCInterface();
  return [(DOCInterface *)&v3 init];
}

@end