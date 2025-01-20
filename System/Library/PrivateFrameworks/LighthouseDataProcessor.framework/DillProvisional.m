@interface DillProvisional
- (BOOL)isProvisional;
- (NSData)data;
- (_TtC23LighthouseDataProcessor15DillProvisional)init;
- (_TtC23LighthouseDataProcessor15DillProvisional)initWithCoder:(id)a3;
- (_TtC23LighthouseDataProcessor15DillProvisional)initWithData:(id)a3;
- (id)getVersion;
- (id)qualifiedMessageName;
- (int)getAnyEventType;
@end

@implementation DillProvisional

- (_TtC23LighthouseDataProcessor15DillProvisional)init
{
  result = (_TtC23LighthouseDataProcessor15DillProvisional *)sub_254E15C48();
  __break(1u);
  return result;
}

- (_TtC23LighthouseDataProcessor15DillProvisional)initWithCoder:(id)a3
{
  result = (_TtC23LighthouseDataProcessor15DillProvisional *)sub_254E15C48();
  __break(1u);
  return result;
}

- (_TtC23LighthouseDataProcessor15DillProvisional)initWithData:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    id v4 = a3;
    uint64_t v3 = sub_254E14C88();
    unint64_t v6 = v5;
  }
  else
  {
    unint64_t v6 = 0xF000000000000000;
  }
  return (_TtC23LighthouseDataProcessor15DillProvisional *)sub_254DE8510(v3, v6);
}

- (NSData)data
{
  return (NSData *)sub_254DE864C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23LighthouseDataProcessor15DillProvisional_dillData);
}

- (BOOL)isProvisional
{
  return 1;
}

- (id)qualifiedMessageName
{
  swift_bridgeObjectRetain();
  v0 = (void *)sub_254E157E8();
  swift_bridgeObjectRelease();

  return v0;
}

- (int)getAnyEventType
{
  return 7;
}

- (id)getVersion
{
  id v2 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, *(Class *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23LighthouseDataProcessor15DillProvisional_version));

  return v2;
}

- (void).cxx_destruct
{
  sub_2545DDDFC(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23LighthouseDataProcessor15DillProvisional_dillData), *(void *)&self->dillData[OBJC_IVAR____TtC23LighthouseDataProcessor15DillProvisional_dillData]);

  swift_bridgeObjectRelease();
}

@end