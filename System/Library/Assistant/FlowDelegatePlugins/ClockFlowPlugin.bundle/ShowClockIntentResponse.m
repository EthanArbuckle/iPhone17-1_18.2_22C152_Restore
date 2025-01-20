@interface ShowClockIntentResponse
- (ShowClockIntentResponse)init;
- (ShowClockIntentResponse)initWithBackingStore:(id)a3;
- (ShowClockIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (ShowClockIntentResponse)initWithCoder:(id)a3;
- (ShowClockIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation ShowClockIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___ShowClockIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___ShowClockIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (ShowClockIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(ShowClockIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___ShowClockIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(ShowClockIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (ShowClockIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___ShowClockIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShowClockIntentResponse();
  return [(ShowClockIntentResponse *)&v3 init];
}

- (ShowClockIntentResponse)initWithCoder:(id)a3
{
  return (ShowClockIntentResponse *)sub_17738((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (ShowClockIntentResponse)initWithBackingStore:(id)a3
{
  return (ShowClockIntentResponse *)sub_17738((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (ShowClockIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_18420();
  }
  else {
    uint64_t v3 = 0;
  }
  return (ShowClockIntentResponse *)ShowClockIntentResponse.init(propertiesByName:)(v3);
}

@end