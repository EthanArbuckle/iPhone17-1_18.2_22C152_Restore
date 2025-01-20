@interface CAUVariantsService
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)entitlement;
+ (NSString)identifier;
- (_TtC13CarAssetUtils18CAUVariantsService)init;
@end

@implementation CAUVariantsService

+ (NSString)entitlement
{
  v2 = (void *)sub_24982E4A8();

  return (NSString *)v2;
}

+ (NSString)identifier
{
  v2 = (void *)sub_24982E4A8();

  return (NSString *)v2;
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)sub_24981D340((uint64_t)a1, (uint64_t)a2, &qword_2696D0910, (void **)&qword_2696D0D20);
}

+ (BSServiceInterface)interface
{
  return (BSServiceInterface *)sub_24981D340((uint64_t)a1, (uint64_t)a2, &qword_2696D0918, (void **)&qword_2696D0D28);
}

- (_TtC13CarAssetUtils18CAUVariantsService)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CAUVariantsService();
  return [(CAUVariantsService *)&v3 init];
}

@end