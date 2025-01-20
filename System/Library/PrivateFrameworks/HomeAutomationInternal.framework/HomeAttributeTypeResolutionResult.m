@interface HomeAttributeTypeResolutionResult
+ (id)confirmationRequiredWithHomeAttributeTypeToConfirm:(int64_t)a3;
+ (id)successWithResolvedHomeAttributeType:(int64_t)a3;
- (HomeAttributeTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation HomeAttributeTypeResolutionResult

+ (id)successWithResolvedHomeAttributeType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_22E6BDB90(a3);

  return v4;
}

+ (id)confirmationRequiredWithHomeAttributeTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_22E6BDBDC(a3);

  return v4;
}

- (HomeAttributeTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_22E6D0050();
  id v6 = a4;
  v7 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for HomeAttributeTypeResolutionResult();
  v8 = [(HomeAttributeTypeResolutionResult *)&v11 initWithJSONDictionary:v7 forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end