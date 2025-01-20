@interface IMActionCalendar
- (IMActionCalendar)init;
- (IMActionCalendar)initWithDictionary:(id)a3;
- (IMActionCalendar)initWithStartTime:(id)a3 endTime:(id)a4 title:(id)a5 calDescription:(id)a6 fallbackUrl:(id)a7;
- (NSString)calDescription;
- (NSString)endTime;
- (NSString)fallbackUrl;
- (NSString)startTime;
- (NSString)title;
- (id)dictionaryRepresentation;
@end

@implementation IMActionCalendar

- (NSString)startTime
{
  return (NSString *)sub_1A088C3D4();
}

- (NSString)endTime
{
  return (NSString *)sub_1A088C3D4();
}

- (NSString)title
{
  return (NSString *)sub_1A088C3D4();
}

- (NSString)calDescription
{
  return (NSString *)sub_1A08A2C50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMActionCalendar_calDescription);
}

- (NSString)fallbackUrl
{
  return (NSString *)sub_1A08A2C50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMActionCalendar_fallbackUrl);
}

- (IMActionCalendar)initWithStartTime:(id)a3 endTime:(id)a4 title:(id)a5 calDescription:(id)a6 fallbackUrl:(id)a7
{
  uint64_t v10 = sub_1A09F3E18();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1A09F3E18();
  uint64_t v15 = v14;
  uint64_t v16 = sub_1A09F3E18();
  uint64_t v18 = v17;
  if (!a6)
  {
    v20 = 0;
    if (a7) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    goto LABEL_6;
  }
  a6 = (id)sub_1A09F3E18();
  v20 = v19;
  if (!a7) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v21 = sub_1A09F3E18();
LABEL_6:
  v23 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionCalendar_startTime);
  uint64_t *v23 = v10;
  v23[1] = v12;
  v24 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionCalendar_endTime);
  uint64_t *v24 = v13;
  v24[1] = v15;
  v25 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionCalendar_title);
  uint64_t *v25 = v16;
  v25[1] = v18;
  v26 = (id *)((char *)&self->super.isa + OBJC_IVAR___IMActionCalendar_calDescription);
  id *v26 = a6;
  v26[1] = v20;
  v27 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionCalendar_fallbackUrl);
  uint64_t *v27 = v21;
  v27[1] = v22;
  v29.receiver = self;
  v29.super_class = (Class)IMActionCalendar;
  return [(IMActionCalendar *)&v29 init];
}

- (IMActionCalendar)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMActionCalendar *)IMActionCalendar.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  sub_1A08A3218();

  uint64_t v3 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v3;
}

- (IMActionCalendar)init
{
  result = (IMActionCalendar *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end