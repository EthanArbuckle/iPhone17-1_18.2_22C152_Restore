@interface IconListLayoutProvider
- (_TtC15ControlCenterUI22IconListLayoutProvider)init;
- (_TtC15ControlCenterUI22IconListLayoutProvider)initWithListLayouts:(id)a3 defaultLayout:(id)a4;
@end

@implementation IconListLayoutProvider

- (_TtC15ControlCenterUI22IconListLayoutProvider)init
{
  return (_TtC15ControlCenterUI22IconListLayoutProvider *)sub_1D7BA923C();
}

- (_TtC15ControlCenterUI22IconListLayoutProvider)initWithListLayouts:(id)a3 defaultLayout:(id)a4
{
  type metadata accessor for SBIconLocation(0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDFF928);
  sub_1D7BA9F8C(&qword_1EBDFF910, type metadata accessor for SBIconLocation);
  sub_1D7BB71F8();
  swift_unknownObjectRetain();
  v6 = (void *)sub_1D7BB71E8();
  swift_bridgeObjectRelease();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for IconListLayoutProvider();
  v7 = [(SBHCustomIconListLayoutProvider *)&v9 initWithListLayouts:v6 defaultLayout:a4];

  swift_unknownObjectRelease();
  return v7;
}

@end