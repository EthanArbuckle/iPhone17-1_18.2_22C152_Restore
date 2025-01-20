@interface DUStructuredEntity
- (NSArray)labels;
- (NSDictionary)addressComponents;
- (NSString)email;
- (NSString)homeAutomationID;
- (NSString)phoneNumber;
- (NSString)title;
- (NSString)type;
- (NSString)url;
- (_TtC21DocumentUnderstanding11DUDebugInfo)responseDebugInfo;
- (_TtC21DocumentUnderstanding13DUDisplayInfo)displayInfo;
- (_TtC21DocumentUnderstanding15DUCalendarEvent)calendarEvent;
- (_TtC21DocumentUnderstanding18DUStructuredEntity)init;
- (_TtC21DocumentUnderstanding18DUStructuredEntity)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAddressComponents:(id)a3;
- (void)setCalendarEvent:(id)a3;
- (void)setDisplayInfo:(id)a3;
- (void)setEmail:(id)a3;
- (void)setHomeAutomationID:(id)a3;
- (void)setLabels:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setResponseDebugInfo:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation DUStructuredEntity

- (NSString)title
{
  return (NSString *)sub_2368CB164((uint64_t)self, (uint64_t)a2, (void (*)(void))DUStructuredEntity.title.getter);
}

- (void)setTitle:(id)a3
{
}

- (NSString)type
{
  return (NSString *)sub_2368CB164((uint64_t)self, (uint64_t)a2, (void (*)(void))DUStructuredEntity.type.getter);
}

- (void)setType:(id)a3
{
}

- (NSArray)labels
{
  DUStructuredEntity.labels.getter();
  type metadata accessor for DUStructuredExtractionLabel();
  v2 = (void *)sub_23697B1CC();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setLabels:(id)a3
{
  type metadata accessor for DUStructuredExtractionLabel();
  uint64_t v4 = sub_23697B1DC();
  v5 = self;
  DUStructuredEntity.labels.setter(v4);
}

- (NSString)phoneNumber
{
  return (NSString *)sub_2368CB4D8((uint64_t)self, (uint64_t)a2, (void (*)(void))DUStructuredEntity.phoneNumber.getter);
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)email
{
  return (NSString *)sub_2368CB4D8((uint64_t)self, (uint64_t)a2, (void (*)(void))DUStructuredEntity.email.getter);
}

- (void)setEmail:(id)a3
{
}

- (NSString)url
{
  return (NSString *)sub_2368CB4D8((uint64_t)self, (uint64_t)a2, (void (*)(void))DUStructuredEntity.url.getter);
}

- (void)setUrl:(id)a3
{
}

- (NSDictionary)addressComponents
{
  if (DUStructuredEntity.addressComponents.getter())
  {
    type metadata accessor for NSTextCheckingKey(0);
    sub_2368D122C((unint64_t *)&qword_2688981A0, 255, type metadata accessor for NSTextCheckingKey);
    v2 = (void *)sub_23697AE5C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (void)setAddressComponents:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    type metadata accessor for NSTextCheckingKey(0);
    sub_2368D122C((unint64_t *)&qword_2688981A0, 255, type metadata accessor for NSTextCheckingKey);
    uint64_t v3 = sub_23697AE7C();
  }
  v5 = self;
  DUStructuredEntity.addressComponents.setter(v3);
}

- (_TtC21DocumentUnderstanding15DUCalendarEvent)calendarEvent
{
  v2 = DUStructuredEntity.calendarEvent.getter();
  return (_TtC21DocumentUnderstanding15DUCalendarEvent *)v2;
}

- (void)setCalendarEvent:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUStructuredEntity.calendarEvent.setter((uint64_t)a3);
}

- (NSString)homeAutomationID
{
  return (NSString *)sub_2368CB4D8((uint64_t)self, (uint64_t)a2, (void (*)(void))DUStructuredEntity.homeAutomationID.getter);
}

- (void)setHomeAutomationID:(id)a3
{
}

- (_TtC21DocumentUnderstanding13DUDisplayInfo)displayInfo
{
  v2 = DUStructuredEntity.displayInfo.getter();
  return (_TtC21DocumentUnderstanding13DUDisplayInfo *)v2;
}

- (void)setDisplayInfo:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUStructuredEntity.displayInfo.setter((uint64_t)a3);
}

- (_TtC21DocumentUnderstanding11DUDebugInfo)responseDebugInfo
{
  v2 = DUStructuredEntity.responseDebugInfo.getter();
  return (_TtC21DocumentUnderstanding11DUDebugInfo *)v2;
}

- (void)setResponseDebugInfo:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUStructuredEntity.responseDebugInfo.setter((uint64_t)a3);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_2368CEC58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))DUStructuredEntity.copy(with:));
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DUStructuredEntity.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding18DUStructuredEntity)initWithCoder:(id)a3
{
  id v3 = a3;
  DUStructuredEntity.init(coder:)();
  return result;
}

- (_TtC21DocumentUnderstanding18DUStructuredEntity)init
{
  return (_TtC21DocumentUnderstanding18DUStructuredEntity *)DUStructuredEntity.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_2368D17A8();
  swift_bridgeObjectRelease();
  sub_2368D17A8();
  sub_2368D17A8();
  sub_2368D17A8();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_calendarEvent));
  sub_2368D17A8();

  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_responseDebugInfo);
}

@end