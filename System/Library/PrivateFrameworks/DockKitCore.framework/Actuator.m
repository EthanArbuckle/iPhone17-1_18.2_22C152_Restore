@interface Actuator
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC11DockKitCore8Actuator)initWithCoder:(id)a3;
- (_TtC11DockKitCore8Actuator)initWithId:(int64_t)a3 name:(id)a4 type:(int64_t)a5;
- (_TtC11DockKitCore8Actuator)initWithId:(int64_t)a3 type:(int64_t)a4 name:(id)a5 minPosition:(double)a6 maxPosition:(double)a7 maxSpeed:(double)a8 maxAcceleration:(double)a9 homePosition:(double)a10 controlParams:(id)a11 cameraLimits:(id)a12;
- (void)encodeWithCoder:(id)a3;
@end

@implementation Actuator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)sub_24CE324A0(self, (uint64_t)a2, (void (*)(void))Actuator.description.getter);
}

- (_TtC11DockKitCore8Actuator)initWithId:(int64_t)a3 name:(id)a4 type:(int64_t)a5
{
  uint64_t v7 = sub_24CF3B320();
  return (_TtC11DockKitCore8Actuator *)Actuator.init(id:name:type:)(a3, v7, v8, a5);
}

- (_TtC11DockKitCore8Actuator)initWithId:(int64_t)a3 type:(int64_t)a4 name:(id)a5 minPosition:(double)a6 maxPosition:(double)a7 maxSpeed:(double)a8 maxAcceleration:(double)a9 homePosition:(double)a10 controlParams:(id)a11 cameraLimits:(id)a12
{
  uint64_t v19 = sub_24CF3B320();
  uint64_t v21 = v20;
  uint64_t v22 = sub_24CF3B2A0();
  type metadata accessor for CameraLimit();
  uint64_t v23 = sub_24CF3B470();
  return (_TtC11DockKitCore8Actuator *)Actuator.init(id:type:name:minPosition:maxPosition:maxSpeed:maxAcceleration:homePosition:controlParams:cameraLimits:)(a3, a4, v19, v21, v22, v23, a6, a7, a8, a9, a10);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  Actuator.encode(with:)((NSCoder)v4);
}

- (_TtC11DockKitCore8Actuator)initWithCoder:(id)a3
{
  return (_TtC11DockKitCore8Actuator *)Actuator.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end