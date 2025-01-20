@interface DOCInterface
+ (_TtP17RecentsAppPopover28DOCInterfaceSystemAppearance_)general;
+ (_TtP17RecentsAppPopover31DOCSourceListInterfaceProviding_)sidebar;
+ (void)setGeneral:(id)a3;
- (_TtC17RecentsAppPopover12DOCInterface)init;
@end

@implementation DOCInterface

+ (_TtP17RecentsAppPopover31DOCSourceListInterfaceProviding_)sidebar
{
  type metadata accessor for DOCSourceListInterface_Default();
  inited = (void *)swift_initStaticObject();
  return (_TtP17RecentsAppPopover31DOCSourceListInterfaceProviding_ *)inited;
}

+ (_TtP17RecentsAppPopover28DOCInterfaceSystemAppearance_)general
{
  if (qword_100615D28 != -1) {
    swift_once();
  }
  v2 = (void *)swift_unknownObjectRetain();
  return (_TtP17RecentsAppPopover28DOCInterfaceSystemAppearance_ *)v2;
}

+ (void)setGeneral:(id)a3
{
  uint64_t v4 = qword_100615D28;
  swift_unknownObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  qword_10063F6D0 = (uint64_t)a3;
  swift_unknownObjectRelease();
}

- (_TtC17RecentsAppPopover12DOCInterface)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCInterface();
  return [(DOCInterface *)&v3 init];
}

@end