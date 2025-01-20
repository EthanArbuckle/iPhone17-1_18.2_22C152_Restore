@interface ShowHomeIntentResponse
- (ShowHomeIntentResponse)init;
- (ShowHomeIntentResponse)initWithBackingStore:(id)a3;
- (ShowHomeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (ShowHomeIntentResponse)initWithCoder:(id)a3;
- (ShowHomeIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation ShowHomeIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___ShowHomeIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___ShowHomeIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (ShowHomeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(ShowHomeIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___ShowHomeIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(ShowHomeIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (ShowHomeIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___ShowHomeIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShowHomeIntentResponse();
  return [(ShowHomeIntentResponse *)&v3 init];
}

- (ShowHomeIntentResponse)initWithCoder:(id)a3
{
  return (ShowHomeIntentResponse *)sub_22E6BBDF4((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (ShowHomeIntentResponse)initWithBackingStore:(id)a3
{
  return (ShowHomeIntentResponse *)sub_22E6BBDF4((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (ShowHomeIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_22E6D0050();
  }
  else {
    uint64_t v3 = 0;
  }
  return (ShowHomeIntentResponse *)ShowHomeIntentResponse.init(propertiesByName:)(v3);
}

@end