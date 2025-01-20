@interface UNNotificationContentValueTransformer
+ (NSArray)allowedTopLevelClasses;
- (UNNotificationContentValueTransformer)init;
@end

@implementation UNNotificationContentValueTransformer

+ (NSArray)allowedTopLevelClasses
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C8E40);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_24395EAE0;
  *(void *)(v2 + 32) = sub_2439075F8();
  __swift_instantiateConcreteTypeFromMangledName(qword_26B0C9150);
  v3 = (void *)sub_243958630();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (UNNotificationContentValueTransformer)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(UNNotificationContentValueTransformer *)&v3 init];
}

@end