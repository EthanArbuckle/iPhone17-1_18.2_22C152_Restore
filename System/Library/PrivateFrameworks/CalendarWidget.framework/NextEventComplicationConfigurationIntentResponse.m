@interface NextEventComplicationConfigurationIntentResponse
- (NextEventComplicationConfigurationIntentResponse)init;
- (NextEventComplicationConfigurationIntentResponse)initWithBackingStore:(id)a3;
- (NextEventComplicationConfigurationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (NextEventComplicationConfigurationIntentResponse)initWithCoder:(id)a3;
- (NextEventComplicationConfigurationIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation NextEventComplicationConfigurationIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (NextEventComplicationConfigurationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(NextEventComplicationConfigurationIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(NextEventComplicationConfigurationIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (NextEventComplicationConfigurationIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntentResponse();
  return [(NextEventComplicationConfigurationIntentResponse *)&v3 init];
}

- (NextEventComplicationConfigurationIntentResponse)initWithCoder:(id)a3
{
  return (NextEventComplicationConfigurationIntentResponse *)sub_1DAF95D6C((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (NextEventComplicationConfigurationIntentResponse)initWithBackingStore:(id)a3
{
  return (NextEventComplicationConfigurationIntentResponse *)sub_1DAF95D6C((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (NextEventComplicationConfigurationIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_1DAF996B0();
  }
  else {
    uint64_t v3 = 0;
  }
  return (NextEventComplicationConfigurationIntentResponse *)NextEventComplicationConfigurationIntentResponse.init(propertiesByName:)(v3);
}

@end