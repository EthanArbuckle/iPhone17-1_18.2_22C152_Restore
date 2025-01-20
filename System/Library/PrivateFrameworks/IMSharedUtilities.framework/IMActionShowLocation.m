@interface IMActionShowLocation
- (IMActionShowLocation)init;
- (IMActionShowLocation)initWithDictionary:(id)a3;
- (IMActionShowLocation)initWithLatitude:(id)a3 longitude:(id)a4 query:(id)a5 label:(id)a6 fallbackUrl:(id)a7;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSString)fallbackUrl;
- (NSString)label;
- (NSString)query;
- (id)dictionaryRepresentation;
@end

@implementation IMActionShowLocation

- (NSNumber)latitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___IMActionShowLocation_latitude));
}

- (NSNumber)longitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___IMActionShowLocation_longitude));
}

- (NSString)query
{
  return (NSString *)sub_1A08A2C50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMActionShowLocation_query);
}

- (NSString)label
{
  return (NSString *)sub_1A08A2C50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMActionShowLocation_label);
}

- (NSString)fallbackUrl
{
  return (NSString *)sub_1A08A2C50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMActionShowLocation_fallbackUrl);
}

- (IMActionShowLocation)initWithLatitude:(id)a3 longitude:(id)a4 query:(id)a5 label:(id)a6 fallbackUrl:(id)a7
{
  uint64_t v8 = (uint64_t)a6;
  if (a5)
  {
    uint64_t v12 = sub_1A09F3E18();
    uint64_t v14 = v13;
    if (v8) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v16 = 0;
    if (a7) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    goto LABEL_8;
  }
  uint64_t v12 = 0;
  uint64_t v14 = 0;
  if (!a6) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v8 = sub_1A09F3E18();
  uint64_t v16 = v15;
  if (!a7) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v17 = sub_1A09F3E18();
LABEL_8:
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMActionShowLocation_latitude) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMActionShowLocation_longitude) = (Class)a4;
  v19 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionShowLocation_query);
  uint64_t *v19 = v12;
  v19[1] = v14;
  v20 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionShowLocation_label);
  uint64_t *v20 = v8;
  v20[1] = v16;
  v21 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionShowLocation_fallbackUrl);
  uint64_t *v21 = v17;
  v21[1] = v18;
  v25.receiver = self;
  v25.super_class = (Class)IMActionShowLocation;
  id v22 = a3;
  id v23 = a4;
  return [(IMActionShowLocation *)&v25 init];
}

- (IMActionShowLocation)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMActionShowLocation *)IMActionShowLocation.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  sub_1A08B23D8();

  uint64_t v3 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v3;
}

- (IMActionShowLocation)init
{
  result = (IMActionShowLocation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end