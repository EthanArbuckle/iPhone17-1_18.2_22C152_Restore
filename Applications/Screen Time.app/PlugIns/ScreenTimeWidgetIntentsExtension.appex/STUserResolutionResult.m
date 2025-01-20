@interface STUserResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithUserToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithUsersToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedUser:(id)a3;
- (STUserResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation STUserResolutionResult

+ (id)successWithResolvedUser:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static STUserResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithUsersToDisambiguate:(id)a3
{
  type metadata accessor for STUser();
  unint64_t v3 = sub_1000090C0();
  swift_getObjCClassMetadata();
  id v4 = static STUserResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)confirmationRequiredWithUserToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static STUserResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result = (id)sub_100009200();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result = (id)sub_100009200();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result = (id)sub_100009200();
  __break(1u);
  return result;
}

- (STUserResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_100009070();
  id v6 = a4;
  Class isa = sub_100009060().super.isa;
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for STUserResolutionResult();
  v8 = [(STUserResolutionResult *)&v11 initWithJSONDictionary:isa forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end