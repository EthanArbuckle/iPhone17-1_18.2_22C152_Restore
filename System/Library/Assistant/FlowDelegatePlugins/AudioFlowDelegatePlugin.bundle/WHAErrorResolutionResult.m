@interface WHAErrorResolutionResult
+ (id)confirmationRequiredWithWHAErrorToConfirm:(int64_t)a3;
+ (id)successWithResolvedWHAError:(int64_t)a3;
- (WHAErrorResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation WHAErrorResolutionResult

+ (id)successWithResolvedWHAError:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static QueueLocationResolutionResult.success(with:)(a3);

  return v4;
}

+ (id)confirmationRequiredWithWHAErrorToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static QueueLocationResolutionResult.confirmationRequired(with:)(a3);

  return v4;
}

- (WHAErrorResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_298960();
  id v6 = a4;
  Class isa = sub_298950().super.isa;
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for WHAErrorResolutionResult();
  v8 = [(WHAErrorResolutionResult *)&v11 initWithJSONDictionary:isa forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end