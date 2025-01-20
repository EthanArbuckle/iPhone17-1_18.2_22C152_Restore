@interface DiscoverHomeIntentResponse
- (DiscoverHomeIntentResponse)init;
- (DiscoverHomeIntentResponse)initWithBackingStore:(id)a3;
- (DiscoverHomeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (DiscoverHomeIntentResponse)initWithCoder:(id)a3;
- (DiscoverHomeIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation DiscoverHomeIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___DiscoverHomeIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___DiscoverHomeIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (DiscoverHomeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(DiscoverHomeIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___DiscoverHomeIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(DiscoverHomeIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (DiscoverHomeIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___DiscoverHomeIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DiscoverHomeIntentResponse();
  return [(DiscoverHomeIntentResponse *)&v3 init];
}

- (DiscoverHomeIntentResponse)initWithCoder:(id)a3
{
  return (DiscoverHomeIntentResponse *)sub_22E6BA908((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (DiscoverHomeIntentResponse)initWithBackingStore:(id)a3
{
  return (DiscoverHomeIntentResponse *)sub_22E6BA908((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (DiscoverHomeIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_22E6D0050();
  }
  else {
    uint64_t v3 = 0;
  }
  return (DiscoverHomeIntentResponse *)DiscoverHomeIntentResponse.init(propertiesByName:)(v3);
}

@end