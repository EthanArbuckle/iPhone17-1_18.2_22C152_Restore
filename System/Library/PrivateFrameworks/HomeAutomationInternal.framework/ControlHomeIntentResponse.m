@interface ControlHomeIntentResponse
- (ControlHomeIntentResponse)init;
- (ControlHomeIntentResponse)initWithBackingStore:(id)a3;
- (ControlHomeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (ControlHomeIntentResponse)initWithCoder:(id)a3;
- (ControlHomeIntentResponse)initWithPropertiesByName:(id)a3;
- (NSString)description;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation ControlHomeIntentResponse

- (NSString)description
{
  return (NSString *)sub_22E3E75F0(self, (uint64_t)a2, (void (*)(void))ControlHomeIntentResponse.description.getter);
}

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___ControlHomeIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___ControlHomeIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (ControlHomeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(ControlHomeIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___ControlHomeIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(ControlHomeIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (ControlHomeIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___ControlHomeIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ControlHomeIntentResponse();
  return [(ControlHomeIntentResponse *)&v3 init];
}

- (ControlHomeIntentResponse)initWithCoder:(id)a3
{
  return (ControlHomeIntentResponse *)sub_22E6BD174((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (ControlHomeIntentResponse)initWithBackingStore:(id)a3
{
  return (ControlHomeIntentResponse *)sub_22E6BD174((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (ControlHomeIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_22E6D0050();
  }
  else {
    uint64_t v3 = 0;
  }
  return (ControlHomeIntentResponse *)ControlHomeIntentResponse.init(propertiesByName:)(v3);
}

@end