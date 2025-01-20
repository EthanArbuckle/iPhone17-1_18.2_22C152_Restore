@interface HomeDeviceTypeResolutionResult
+ (id)confirmationRequiredWithHomeDeviceTypeToConfirm:(int64_t)a3;
+ (id)successWithResolvedHomeDeviceType:(int64_t)a3;
- (HomeDeviceTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation HomeDeviceTypeResolutionResult

+ (id)successWithResolvedHomeDeviceType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_22E6BDB90(a3);

  return v4;
}

+ (id)confirmationRequiredWithHomeDeviceTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_22E6BDBDC(a3);

  return v4;
}

- (HomeDeviceTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_22E6D0050();
  id v6 = a4;
  v7 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for HomeDeviceTypeResolutionResult();
  v8 = [(HomeDeviceTypeResolutionResult *)&v11 initWithJSONDictionary:v7 forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end