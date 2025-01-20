@interface DOCInterface
+ (_TtP18DocumentAppIntents28DOCInterfaceSystemAppearance_)general;
+ (_TtP18DocumentAppIntents31DOCSourceListInterfaceProviding_)sidebar;
+ (void)setGeneral:(id)a3;
- (_TtC18DocumentAppIntents12DOCInterface)init;
@end

@implementation DOCInterface

+ (_TtP18DocumentAppIntents31DOCSourceListInterfaceProviding_)sidebar
{
  type metadata accessor for DOCSourceListInterface_Default();
  inited = (void *)swift_initStaticObject();

  return (_TtP18DocumentAppIntents31DOCSourceListInterfaceProviding_ *)inited;
}

+ (_TtP18DocumentAppIntents28DOCInterfaceSystemAppearance_)general
{
  if (qword_100655D98 != -1) {
    swift_once();
  }
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP18DocumentAppIntents28DOCInterfaceSystemAppearance_ *)v2;
}

+ (void)setGeneral:(id)a3
{
  uint64_t v4 = qword_100655D98;
  swift_unknownObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  qword_100684B38 = (uint64_t)a3;

  swift_unknownObjectRelease();
}

- (_TtC18DocumentAppIntents12DOCInterface)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCInterface();
  return [(DOCInterface *)&v3 init];
}

@end