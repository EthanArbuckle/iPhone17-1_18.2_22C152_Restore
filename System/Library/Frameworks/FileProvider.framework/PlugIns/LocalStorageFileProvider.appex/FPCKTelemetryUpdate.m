@interface FPCKTelemetryUpdate
+ (BOOL)supportsSecureCoding;
- (FPCKTelemetryUpdate)init;
- (FPCKTelemetryUpdate)initWithCoder:(id)a3;
- (FPCKTelemetryUpdate)initWithStatus:(double)a3;
- (NSString)description;
- (double)status;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FPCKTelemetryUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double v4 = *(double *)((char *)&self->super.isa + OBJC_IVAR___FPCKTelemetryUpdate_status);
  id v5 = a3;
  v6 = self;
  id v7 = sub_10096BC00();
  [v5 encodeDouble:v7 forKey:v4];
}

- (FPCKTelemetryUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  NSString v6 = sub_10096BC00();
  [v4 decodeDoubleForKey:v6];
  v8 = v7;

  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___FPCKTelemetryUpdate_status) = v8;
  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for FPCKTelemetryUpdate();
  v9 = [(FPCKTelemetryUpdate *)&v11 init];

  return v9;
}

- (double)status
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___FPCKTelemetryUpdate_status);
}

- (FPCKTelemetryUpdate)initWithStatus:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR___FPCKTelemetryUpdate_status) = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FPCKTelemetryUpdate();
  return [(FPCKTelemetryUpdate *)&v4 init];
}

- (id)toDictionary
{
  sub_10002B7CC(&qword_100ACE1E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100973BB0;
  *(void *)(inited + 32) = 0x737574617473;
  *(void *)(inited + 40) = 0xE600000000000000;
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___FPCKTelemetryUpdate_status);
  *(void *)(inited + 72) = &type metadata for Double;
  *(void *)(inited + 48) = v4;
  sub_10004621C(inited);
  v5.super.isa = sub_10096B9A0().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (NSString)description
{
  sub_10096C2D0();
  NSString v2 = sub_10096BC00();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (FPCKTelemetryUpdate)init
{
  result = (FPCKTelemetryUpdate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end