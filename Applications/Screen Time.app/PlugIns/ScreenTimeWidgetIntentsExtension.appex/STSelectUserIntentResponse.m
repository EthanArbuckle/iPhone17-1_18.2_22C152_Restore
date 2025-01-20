@interface STSelectUserIntentResponse
- (STSelectUserIntentResponse)init;
- (STSelectUserIntentResponse)initWithBackingStore:(id)a3;
- (STSelectUserIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (STSelectUserIntentResponse)initWithCoder:(id)a3;
- (STSelectUserIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation STSelectUserIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___STSelectUserIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___STSelectUserIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (STSelectUserIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(STSelectUserIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___STSelectUserIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(STSelectUserIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (STSelectUserIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___STSelectUserIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for STSelectUserIntentResponse();
  return [(STSelectUserIntentResponse *)&v3 init];
}

- (STSelectUserIntentResponse)initWithCoder:(id)a3
{
  return (STSelectUserIntentResponse *)sub_100008198((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (STSelectUserIntentResponse)initWithBackingStore:(id)a3
{
  return (STSelectUserIntentResponse *)sub_100008198((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (STSelectUserIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_100009070();
  }
  else {
    uint64_t v3 = 0;
  }
  return (STSelectUserIntentResponse *)STSelectUserIntentResponse.init(propertiesByName:)(v3);
}

@end