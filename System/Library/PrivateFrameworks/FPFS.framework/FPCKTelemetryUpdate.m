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
  id v7 = (id)sub_24DCC97B8();
  objc_msgSend(v5, sel_encodeDouble_forKey_, v7, v4);
}

- (FPCKTelemetryUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  v6 = (void *)sub_24DCC97B8();
  objc_msgSend(v4, sel_decodeDoubleForKey_, v6);
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B197EF0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24DCCECE0;
  *(void *)(inited + 32) = 0x737574617473;
  *(void *)(inited + 40) = 0xE600000000000000;
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___FPCKTelemetryUpdate_status);
  *(void *)(inited + 72) = MEMORY[0x263F8D538];
  *(void *)(inited + 48) = v4;
  sub_24D428D08(inited);
  id v5 = (void *)sub_24DCC9558();
  swift_bridgeObjectRelease();

  return v5;
}

- (NSString)description
{
  sub_24DCC9E58();
  v2 = (void *)sub_24DCC97B8();
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