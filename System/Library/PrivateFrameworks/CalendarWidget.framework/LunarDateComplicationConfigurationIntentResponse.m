@interface LunarDateComplicationConfigurationIntentResponse
- (LunarDateComplicationConfigurationIntentResponse)init;
- (LunarDateComplicationConfigurationIntentResponse)initWithBackingStore:(id)a3;
- (LunarDateComplicationConfigurationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (LunarDateComplicationConfigurationIntentResponse)initWithCoder:(id)a3;
- (LunarDateComplicationConfigurationIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation LunarDateComplicationConfigurationIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (LunarDateComplicationConfigurationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(LunarDateComplicationConfigurationIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(LunarDateComplicationConfigurationIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (LunarDateComplicationConfigurationIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntentResponse();
  return [(LunarDateComplicationConfigurationIntentResponse *)&v3 init];
}

- (LunarDateComplicationConfigurationIntentResponse)initWithCoder:(id)a3
{
  return (LunarDateComplicationConfigurationIntentResponse *)sub_1DAF96D48((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (LunarDateComplicationConfigurationIntentResponse)initWithBackingStore:(id)a3
{
  return (LunarDateComplicationConfigurationIntentResponse *)sub_1DAF96D48((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (LunarDateComplicationConfigurationIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_1DAF996B0();
  }
  else {
    uint64_t v3 = 0;
  }
  return (LunarDateComplicationConfigurationIntentResponse *)LunarDateComplicationConfigurationIntentResponse.init(propertiesByName:)(v3);
}

@end