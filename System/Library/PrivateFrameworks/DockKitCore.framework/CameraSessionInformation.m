@interface CameraSessionInformation
+ (BOOL)supportsSecureCoding;
- (_TtC11DockKitCore24CameraSessionInformation)init;
- (_TtC11DockKitCore24CameraSessionInformation)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CameraSessionInformation

- (id)copyWithZone:(void *)a3
{
  return (id)sub_24CF360C4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))CameraSessionInformation.copy(with:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11DockKitCore24CameraSessionInformation)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore24CameraSessionInformation_appId);
  void *v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore24CameraSessionInformation_startTime) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore24CameraSessionInformation_endTime) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore24CameraSessionInformation_cameraType) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore24CameraSessionInformation_azimuth) = (Class)0x400921FB54442D18;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(CameraSessionInformation *)&v6 init];
}

- (_TtC11DockKitCore24CameraSessionInformation)initWithCoder:(id)a3
{
  return (_TtC11DockKitCore24CameraSessionInformation *)CameraSessionInformation.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  CameraSessionInformation.encode(with:)((NSCoder)v4);
}

- (void).cxx_destruct
{
}

@end