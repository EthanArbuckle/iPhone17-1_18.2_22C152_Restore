@interface TransitIncidentsSectionView
- (_TtC6MapsUI27TransitIncidentsSectionView)initWithCoder:(id)a3;
- (_TtC6MapsUI27TransitIncidentsSectionView)initWithConfiguration:(id)a3;
- (_TtC6MapsUI27TransitIncidentsSectionView)initWithFrame:(CGRect)a3;
- (_TtC6MapsUI27TransitIncidentsSectionView)initWithShowsSeparators:(BOOL)a3;
@end

@implementation TransitIncidentsSectionView

- (_TtC6MapsUI27TransitIncidentsSectionView)initWithConfiguration:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI27TransitIncidentsSectionView_feedbackDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI27TransitIncidentsSectionView_incidentViewModels) = (Class)MEMORY[0x1E4FBC860];
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(MUPlaceVerticalCardContainerView *)&v7 initWithConfiguration:a3];
}

- (_TtC6MapsUI27TransitIncidentsSectionView)initWithShowsSeparators:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI27TransitIncidentsSectionView_feedbackDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI27TransitIncidentsSectionView_incidentViewModels) = (Class)MEMORY[0x1E4FBC860];
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(MUPlaceVerticalCardContainerView *)&v7 initWithShowsSeparators:v3];
}

- (_TtC6MapsUI27TransitIncidentsSectionView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI27TransitIncidentsSectionView_feedbackDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI27TransitIncidentsSectionView_incidentViewModels) = (Class)MEMORY[0x1E4FBC860];
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[MUStackView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC6MapsUI27TransitIncidentsSectionView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI27TransitIncidentsSectionView_feedbackDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI27TransitIncidentsSectionView_incidentViewModels) = (Class)MEMORY[0x1E4FBC860];
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(TransitIncidentsSectionView *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1931F0EAC((uint64_t)self + OBJC_IVAR____TtC6MapsUI27TransitIncidentsSectionView_feedbackDelegate);
  swift_bridgeObjectRelease();
}

@end