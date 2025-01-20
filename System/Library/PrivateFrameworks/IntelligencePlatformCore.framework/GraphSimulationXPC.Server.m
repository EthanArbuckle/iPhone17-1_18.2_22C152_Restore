@interface GraphSimulationXPC.Server
- (_TtCC24IntelligencePlatformCore18GraphSimulationXPC6Server)init;
- (void)mockTripleEntityTaggingWithContactId:(NSString *)a3 inferredRelationshipLabel:(NSString *)a4 completion:(id)a5;
@end

@implementation GraphSimulationXPC.Server

- (void)mockTripleEntityTaggingWithContactId:(NSString *)a3 inferredRelationshipLabel:(NSString *)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1C77690E4((uint64_t)&unk_1EA471400, (uint64_t)v9);
}

- (_TtCC24IntelligencePlatformCore18GraphSimulationXPC6Server)init
{
  return (_TtCC24IntelligencePlatformCore18GraphSimulationXPC6Server *)GraphSimulationXPC.Server.init()();
}

@end