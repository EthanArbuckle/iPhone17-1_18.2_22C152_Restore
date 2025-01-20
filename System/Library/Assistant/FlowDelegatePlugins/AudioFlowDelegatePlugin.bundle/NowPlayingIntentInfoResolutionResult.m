@interface NowPlayingIntentInfoResolutionResult
+ (id)confirmationRequiredWithNowPlayingIntentInfoToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithNowPlayingIntentInfosToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedNowPlayingIntentInfo:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (NowPlayingIntentInfoResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation NowPlayingIntentInfoResolutionResult

+ (id)successWithResolvedNowPlayingIntentInfo:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static NowPlayingIntentInfoResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithNowPlayingIntentInfosToDisambiguate:(id)a3
{
  type metadata accessor for NowPlayingIntentInfo();
  unint64_t v3 = sub_298B50();
  swift_getObjCClassMetadata();
  id v4 = static NowPlayingIntentInfoResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)confirmationRequiredWithNowPlayingIntentInfoToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static NowPlayingIntentInfoResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result = (id)sub_2994A0();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result = (id)sub_2994A0();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result = (id)sub_2994A0();
  __break(1u);
  return result;
}

- (NowPlayingIntentInfoResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_298960();
  id v6 = a4;
  Class isa = sub_298950().super.isa;
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for NowPlayingIntentInfoResolutionResult();
  v8 = [(NowPlayingIntentInfoResolutionResult *)&v11 initWithJSONDictionary:isa forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end