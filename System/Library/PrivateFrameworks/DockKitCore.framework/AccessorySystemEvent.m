@interface AccessorySystemEvent
+ (BOOL)supportsSecureCoding;
+ (unsigned)kHeaderCameraFlip;
+ (unsigned)kHeaderCameraShutter;
+ (unsigned)kHeaderCameraZoom;
+ (unsigned)kHeaderEventPress;
+ (unsigned)kHeaderEventRelease;
- (_TtC11DockKitCore20AccessorySystemEvent)init;
- (_TtC11DockKitCore20AccessorySystemEvent)initWithCoder:(id)a3;
- (unsigned)header;
- (unsigned)payload;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AccessorySystemEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unsigned)kHeaderCameraShutter
{
  return 32;
}

+ (unsigned)kHeaderCameraFlip
{
  return 64;
}

+ (unsigned)kHeaderCameraZoom
{
  return 0x80;
}

+ (unsigned)kHeaderEventPress
{
  return 0;
}

+ (unsigned)kHeaderEventRelease
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  AccessorySystemEvent.encode(with:)((NSCoder)v4);
}

- (_TtC11DockKitCore20AccessorySystemEvent)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC11DockKitCore20AccessorySystemEvent *)sub_24CE3E588();

  return v4;
}

- (unsigned)header
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore20AccessorySystemEvent__header + 1)) {
    return 0;
  }
  else {
    return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore20AccessorySystemEvent__header);
  }
}

- (unsigned)payload
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore20AccessorySystemEvent__payload + 4)) {
    return 0;
  }
  else {
    return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore20AccessorySystemEvent__payload);
  }
}

- (_TtC11DockKitCore20AccessorySystemEvent)init
{
  result = (_TtC11DockKitCore20AccessorySystemEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end