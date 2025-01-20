@interface ControlsGalleryIconListLayoutProvider
- (_TtC23ControlCenterUIServices37ControlsGalleryIconListLayoutProvider)init;
- (_TtC23ControlCenterUIServices37ControlsGalleryIconListLayoutProvider)initWithListLayouts:(id)a3 defaultLayout:(id)a4;
@end

@implementation ControlsGalleryIconListLayoutProvider

- (_TtC23ControlCenterUIServices37ControlsGalleryIconListLayoutProvider)init
{
  return (_TtC23ControlCenterUIServices37ControlsGalleryIconListLayoutProvider *)sub_24A7CC590();
}

- (_TtC23ControlCenterUIServices37ControlsGalleryIconListLayoutProvider)initWithListLayouts:(id)a3 defaultLayout:(id)a4
{
  type metadata accessor for SBIconLocation(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDC68);
  sub_24A7CE2D0(&qword_2697BDC70, type metadata accessor for SBIconLocation);
  sub_24A7DC9C0();
  swift_unknownObjectRetain();
  v6 = (void *)sub_24A7DC9B0();
  swift_bridgeObjectRelease();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ControlsGalleryIconListLayoutProvider();
  v7 = [(SBHCustomIconListLayoutProvider *)&v9 initWithListLayouts:v6 defaultLayout:a4];

  swift_unknownObjectRelease();
  return v7;
}

@end