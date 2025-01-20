@interface EntityResolutionXPC.Server
- (_TtCC24IntelligencePlatformCore19EntityResolutionXPC6Server)init;
- (void)generateMentionsForQuery:(NSString *)a3 withCompletion:(id)a4;
- (void)submitCollectionQuery:(GDEntityResolutionRequest *)a3 withCompletion:(id)a4;
- (void)submitQuery:(GDEntityResolutionRequest *)a3 withCompletion:(id)a4;
- (void)warmupForMode:(int64_t)a3 withCompletion:(id)a4;
@end

@implementation EntityResolutionXPC.Server

- (void)warmupForMode:(int64_t)a3 withCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = self;
  sub_1C77690E4((uint64_t)&unk_1EA46ED40, (uint64_t)v7);
}

- (void)submitQuery:(GDEntityResolutionRequest *)a3 withCompletion:(id)a4
{
}

- (void)submitCollectionQuery:(GDEntityResolutionRequest *)a3 withCompletion:(id)a4
{
}

- (void)generateMentionsForQuery:(NSString *)a3 withCompletion:(id)a4
{
}

- (_TtCC24IntelligencePlatformCore19EntityResolutionXPC6Server)init
{
  return (_TtCC24IntelligencePlatformCore19EntityResolutionXPC6Server *)EntityResolutionXPC.Server.init()();
}

@end