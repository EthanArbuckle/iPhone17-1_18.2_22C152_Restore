@interface AISChildAccountCutOffAgeResponse
- (AISChildAccountCutOffAgeResponse)init;
- (NSString)childCutOffAgeLocalized;
- (int64_t)childCutOffAge;
@end

@implementation AISChildAccountCutOffAgeResponse

- (NSString)childCutOffAgeLocalized
{
  v2 = self;
  sub_2481749A0();

  v3 = (void *)sub_248175130();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (int64_t)childCutOffAge
{
  v2 = self;
  int64_t v3 = sub_248174990();

  return v3;
}

- (AISChildAccountCutOffAgeResponse)init
{
  result = (AISChildAccountCutOffAgeResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end