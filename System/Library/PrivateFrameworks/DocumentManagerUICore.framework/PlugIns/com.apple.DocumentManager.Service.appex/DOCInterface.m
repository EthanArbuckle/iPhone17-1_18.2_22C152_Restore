@interface DOCInterface
+ (_TtP33com_apple_DocumentManager_Service28DOCInterfaceSystemAppearance_)general;
+ (_TtP33com_apple_DocumentManager_Service31DOCSourceListInterfaceProviding_)sidebar;
+ (void)setGeneral:(id)a3;
- (_TtC33com_apple_DocumentManager_Service12DOCInterface)init;
@end

@implementation DOCInterface

+ (_TtP33com_apple_DocumentManager_Service31DOCSourceListInterfaceProviding_)sidebar
{
  type metadata accessor for DOCSourceListInterface_Default();
  inited = (void *)swift_initStaticObject();
  return (_TtP33com_apple_DocumentManager_Service31DOCSourceListInterfaceProviding_ *)inited;
}

+ (_TtP33com_apple_DocumentManager_Service28DOCInterfaceSystemAppearance_)general
{
  if (qword_10062A600 != -1) {
    swift_once();
  }
  v2 = (void *)swift_unknownObjectRetain();
  return (_TtP33com_apple_DocumentManager_Service28DOCInterfaceSystemAppearance_ *)v2;
}

+ (void)setGeneral:(id)a3
{
  uint64_t v4 = qword_10062A600;
  swift_unknownObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  qword_1006543D8 = (uint64_t)a3;
  swift_unknownObjectRelease();
}

- (_TtC33com_apple_DocumentManager_Service12DOCInterface)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCInterface();
  return [(DOCInterface *)&v3 init];
}

@end