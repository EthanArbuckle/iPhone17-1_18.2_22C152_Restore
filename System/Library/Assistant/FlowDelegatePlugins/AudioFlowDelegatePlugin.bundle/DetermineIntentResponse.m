@interface DetermineIntentResponse
- (DetermineIntentResponse)init;
- (DetermineIntentResponse)initWithBackingStore:(id)a3;
- (DetermineIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (DetermineIntentResponse)initWithCoder:(id)a3;
- (DetermineIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation DetermineIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___DetermineIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___DetermineIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (DetermineIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(DetermineIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___DetermineIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(DetermineIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (DetermineIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___DetermineIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DetermineIntentResponse();
  return [(DetermineIntentResponse *)&v3 init];
}

- (DetermineIntentResponse)initWithCoder:(id)a3
{
  return (DetermineIntentResponse *)sub_2910C8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (DetermineIntentResponse)initWithBackingStore:(id)a3
{
  return (DetermineIntentResponse *)sub_2910C8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (DetermineIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_298960();
  }
  else {
    uint64_t v3 = 0;
  }
  return (DetermineIntentResponse *)DetermineIntentResponse.init(propertiesByName:)(v3);
}

@end