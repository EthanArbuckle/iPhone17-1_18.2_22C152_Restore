@interface CSFEligibility
- (BOOL)deviceEligibile;
- (BOOL)isEqual:(id)a3;
- (BOOL)languageEligible;
- (BOOL)locationEligible;
- (BOOL)regionEligible;
- (BOOL)siriLanguageEligible;
- (CSFEligibility)init;
- (NSString)description;
@end

@implementation CSFEligibility

- (BOOL)regionEligible
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CSFEligibility_regionEligible);
}

- (BOOL)languageEligible
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CSFEligibility_languageEligible);
}

- (BOOL)siriLanguageEligible
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CSFEligibility_siriLanguageEligible);
}

- (BOOL)locationEligible
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CSFEligibility_locationEligible);
}

- (BOOL)deviceEligibile
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CSFEligibility_deviceEligibile);
}

- (NSString)description
{
  v2 = self;
  sub_1A8D42784();

  v3 = (void *)sub_1A8D59BC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A8D5A010();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1A8D42C9C((uint64_t)v8);

  sub_1A8CA2800((uint64_t)v8);
  return v6 & 1;
}

- (CSFEligibility)init
{
  result = (CSFEligibility *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end