@interface TransitConnectionsSectionView
- (BOOL)verticalCardContainerView:(id)a3 shouldHighlightRowAtIndex:(int64_t)a4;
- (_TtC6MapsUI29TransitConnectionsSectionView)initWithCoder:(id)a3;
- (_TtC6MapsUI29TransitConnectionsSectionView)initWithConfiguration:(id)a3;
- (_TtC6MapsUI29TransitConnectionsSectionView)initWithFrame:(CGRect)a3;
- (_TtC6MapsUI29TransitConnectionsSectionView)initWithShowsSeparators:(BOOL)a3;
- (void)verticalCardContainerView:(id)a3 didSelectRow:(id)a4 atIndex:(int64_t)a5;
@end

@implementation TransitConnectionsSectionView

- (_TtC6MapsUI29TransitConnectionsSectionView)initWithShowsSeparators:(BOOL)a3
{
  BOOL v3 = a3;
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI29TransitConnectionsSectionView_connectionsDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI29TransitConnectionsSectionView_connectionViewModels) = (Class)MEMORY[0x1E4FBC860];
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TransitConnectionsSectionView();
  v5 = [(MUPlaceVerticalCardContainerView *)&v7 initWithShowsSeparators:v3];
  [(MUPlaceVerticalCardContainerView *)v5 setDelegate:v5];
  return v5;
}

- (_TtC6MapsUI29TransitConnectionsSectionView)initWithConfiguration:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI29TransitConnectionsSectionView_connectionsDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI29TransitConnectionsSectionView_connectionViewModels) = (Class)MEMORY[0x1E4FBC860];
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TransitConnectionsSectionView();
  id v5 = a3;
  v6 = [(MUPlaceVerticalCardContainerView *)&v8 initWithConfiguration:v5];
  -[MUPlaceVerticalCardContainerView setDelegate:](v6, sel_setDelegate_, v6, v8.receiver, v8.super_class);

  return v6;
}

- (_TtC6MapsUI29TransitConnectionsSectionView)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI29TransitConnectionsSectionView_connectionsDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI29TransitConnectionsSectionView_connectionViewModels) = (Class)MEMORY[0x1E4FBC860];
  id v5 = a3;

  result = (_TtC6MapsUI29TransitConnectionsSectionView *)sub_1933417B0();
  __break(1u);
  return result;
}

- (_TtC6MapsUI29TransitConnectionsSectionView)initWithFrame:(CGRect)a3
{
  result = (_TtC6MapsUI29TransitConnectionsSectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1931F0EAC((uint64_t)self + OBJC_IVAR____TtC6MapsUI29TransitConnectionsSectionView_connectionsDelegate);
  swift_bridgeObjectRelease();
}

- (void)verticalCardContainerView:(id)a3 didSelectRow:(id)a4 atIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1931FE0B8(v8);
}

- (BOOL)verticalCardContainerView:(id)a3 shouldHighlightRowAtIndex:(int64_t)a4
{
  return 1;
}

@end