@interface DillSiriInstrumentationWrapper
- (BOOL)isProvisional;
- (NSData)data;
- (_TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper)init;
- (_TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper)initWithCoder:(id)a3;
- (_TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper)initWithData:(id)a3;
- (id)qualifiedMessageName;
- (int)getAnyEventType;
@end

@implementation DillSiriInstrumentationWrapper

- (_TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper)init
{
  result = (_TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper *)sub_254E15C48();
  __break(1u);
  return result;
}

- (_TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper)initWithCoder:(id)a3
{
  result = (_TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper *)sub_254E15C48();
  __break(1u);
  return result;
}

- (_TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper)initWithData:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = sub_254E14C88();
    unint64_t v6 = v5;

    sub_2545DDDFC(v4, v6);
  }
  result = (_TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper *)sub_254E15C48();
  __break(1u);
  return result;
}

- (NSData)data
{
  return (NSData *)sub_254DE864C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper_dillData);
}

- (id)qualifiedMessageName
{
  v2 = (void *)sub_254E157E8();

  return v2;
}

- (BOOL)isProvisional
{
  return 0;
}

- (int)getAnyEventType
{
  return *(_DWORD *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper_anyEventType);
}

- (void).cxx_destruct
{
}

@end