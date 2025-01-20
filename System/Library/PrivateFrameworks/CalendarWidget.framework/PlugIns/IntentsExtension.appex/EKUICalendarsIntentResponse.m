@interface EKUICalendarsIntentResponse
- (EKUICalendarsIntentResponse)init;
- (EKUICalendarsIntentResponse)initWithBackingStore:(id)a3;
- (EKUICalendarsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (EKUICalendarsIntentResponse)initWithCoder:(id)a3;
- (EKUICalendarsIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation EKUICalendarsIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___EKUICalendarsIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___EKUICalendarsIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (EKUICalendarsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(EKUICalendarsIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___EKUICalendarsIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(EKUICalendarsIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (EKUICalendarsIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___EKUICalendarsIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EKUICalendarsIntentResponse();
  return [(EKUICalendarsIntentResponse *)&v3 init];
}

- (EKUICalendarsIntentResponse)initWithCoder:(id)a3
{
  return (EKUICalendarsIntentResponse *)sub_1000073E8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (EKUICalendarsIntentResponse)initWithBackingStore:(id)a3
{
  return (EKUICalendarsIntentResponse *)sub_1000073E8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (EKUICalendarsIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_1000098C0();
  }
  else {
    uint64_t v3 = 0;
  }
  return (EKUICalendarsIntentResponse *)EKUICalendarsIntentResponse.init(propertiesByName:)(v3);
}

@end