@interface DetermineNowPlayingIntentInfoResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (DetermineNowPlayingIntentInfoResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation DetermineNowPlayingIntentInfoResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static DetermineNowPlayingIntentInfoResolutionResult.unsupported(forReason:)(a3);

  return v4;
}

- (DetermineNowPlayingIntentInfoResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_298960();
  id v6 = a4;
  Class isa = sub_298950().super.isa;
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DetermineNowPlayingIntentInfoResolutionResult();
  v8 = [(NowPlayingIntentInfoResolutionResult *)&v11 initWithJSONDictionary:isa forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end