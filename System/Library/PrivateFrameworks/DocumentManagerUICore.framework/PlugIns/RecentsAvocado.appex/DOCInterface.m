@interface DOCInterface
+ (_TtP14RecentsAvocado28DOCInterfaceSystemAppearance_)general;
+ (_TtP14RecentsAvocado31DOCSourceListInterfaceProviding_)sidebar;
+ (void)setGeneral:(id)a3;
- (_TtC14RecentsAvocado12DOCInterface)init;
@end

@implementation DOCInterface

+ (_TtP14RecentsAvocado31DOCSourceListInterfaceProviding_)sidebar
{
  type metadata accessor for DOCSourceListInterface_Default();
  inited = (void *)swift_initStaticObject();
  return (_TtP14RecentsAvocado31DOCSourceListInterfaceProviding_ *)inited;
}

+ (_TtP14RecentsAvocado28DOCInterfaceSystemAppearance_)general
{
  if (qword_100626A20 != -1) {
    swift_once();
  }
  v2 = (void *)swift_unknownObjectRetain();
  return (_TtP14RecentsAvocado28DOCInterfaceSystemAppearance_ *)v2;
}

+ (void)setGeneral:(id)a3
{
  uint64_t v4 = qword_100626A20;
  swift_unknownObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  qword_100650808 = (uint64_t)a3;
  swift_unknownObjectRelease();
}

- (_TtC14RecentsAvocado12DOCInterface)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCInterface();
  return [(DOCInterface *)&v3 init];
}

@end