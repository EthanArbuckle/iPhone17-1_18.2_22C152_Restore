@interface AutomateHomeIntentResponse
- (AutomateHomeIntentResponse)init;
- (AutomateHomeIntentResponse)initWithBackingStore:(id)a3;
- (AutomateHomeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (AutomateHomeIntentResponse)initWithCoder:(id)a3;
- (AutomateHomeIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation AutomateHomeIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___AutomateHomeIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___AutomateHomeIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (AutomateHomeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(AutomateHomeIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___AutomateHomeIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(AutomateHomeIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (AutomateHomeIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___AutomateHomeIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AutomateHomeIntentResponse();
  return [(AutomateHomeIntentResponse *)&v3 init];
}

- (AutomateHomeIntentResponse)initWithCoder:(id)a3
{
  return (AutomateHomeIntentResponse *)sub_22E6B9308((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (AutomateHomeIntentResponse)initWithBackingStore:(id)a3
{
  return (AutomateHomeIntentResponse *)sub_22E6B9308((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (AutomateHomeIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_22E6D0050();
  }
  else {
    uint64_t v3 = 0;
  }
  return (AutomateHomeIntentResponse *)AutomateHomeIntentResponse.init(propertiesByName:)(v3);
}

@end