@interface DockKitFocusObservation
- (BOOL)userFocusStrong;
- (_TtC11DockKitCore23DockKitFocusObservation)init;
- (_TtC11DockKitCore23DockKitFocusObservation)initWithCoder:(id)a3;
- (_TtC11DockKitCore23DockKitFocusObservation)initWithIdentifier:(int)a3 x:(double)a4 y:(double)a5 width:(double)a6 height:(double)a7 userFocusStrong:(BOOL)a8 type:(int64_t)a9;
- (double)height;
- (double)width;
- (double)x;
- (double)y;
- (int)identifier;
- (int64_t)type;
- (void)encodeWith:(id)a3;
- (void)setHeight:(double)a3;
- (void)setIdentifier:(int)a3;
- (void)setType:(int64_t)a3;
- (void)setUserFocusStrong:(BOOL)a3;
- (void)setWidth:(double)a3;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
@end

@implementation DockKitFocusObservation

- (int)identifier
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_identifier);
}

- (void)setIdentifier:(int)a3
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_identifier) = a3;
}

- (double)x
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_x);
}

- (void)setX:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_x) = a3;
}

- (double)y
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_y);
}

- (void)setY:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_y) = a3;
}

- (double)width
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_width);
}

- (void)setWidth:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_width) = a3;
}

- (double)height
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_height);
}

- (void)setHeight:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_height) = a3;
}

- (BOOL)userFocusStrong
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_userFocusStrong);
}

- (void)setUserFocusStrong:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_userFocusStrong) = a3;
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_type);
}

- (void)setType:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_type) = (Class)a3;
}

- (_TtC11DockKitCore23DockKitFocusObservation)initWithIdentifier:(int)a3 x:(double)a4 y:(double)a5 width:(double)a6 height:(double)a7 userFocusStrong:(BOOL)a8 type:(int64_t)a9
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_identifier) = a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_x) = a4;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_y) = a5;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_width) = a6;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_height) = a7;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_userFocusStrong) = a8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore23DockKitFocusObservation_type) = (Class)a9;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DockKitFocusObservation();
  return [(DockKitFocusObservation *)&v10 init];
}

- (_TtC11DockKitCore23DockKitFocusObservation)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC11DockKitCore23DockKitFocusObservation *)sub_24CF316F8(v3);

  return v4;
}

- (void)encodeWith:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24CF2DD20(v4);
}

- (_TtC11DockKitCore23DockKitFocusObservation)init
{
  result = (_TtC11DockKitCore23DockKitFocusObservation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end