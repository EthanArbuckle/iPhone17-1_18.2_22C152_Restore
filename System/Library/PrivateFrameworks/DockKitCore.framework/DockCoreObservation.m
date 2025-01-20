@interface DockCoreObservation
+ (BOOL)supportsSecureCoding;
- (BOOL)newTrack;
- (_TtC11DockKitCore19DockCoreObservation)init;
- (_TtC11DockKitCore19DockCoreObservation)initWithCoder:(id)a3;
- (double)X;
- (double)Y;
- (double)confidence;
- (double)height;
- (double)width;
- (int64_t)identifier;
- (int64_t)trackerID;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DockCoreObservation

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore19DockCoreObservation_type);
}

- (int64_t)identifier
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore19DockCoreObservation_identifier);
}

- (double)X
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore19DockCoreObservation_X);
}

- (double)Y
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore19DockCoreObservation_Y);
}

- (double)width
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore19DockCoreObservation_width);
}

- (double)height
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore19DockCoreObservation_height);
}

- (int64_t)trackerID
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore19DockCoreObservation_trackerID);
}

- (double)confidence
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore19DockCoreObservation_confidence);
}

- (BOOL)newTrack
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore19DockCoreObservation_newTrack);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24CF2C4CC(v4);
}

- (_TtC11DockKitCore19DockCoreObservation)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC11DockKitCore19DockCoreObservation *)sub_24CF30D8C(v3);

  return v4;
}

- (_TtC11DockKitCore19DockCoreObservation)init
{
  result = (_TtC11DockKitCore19DockCoreObservation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end