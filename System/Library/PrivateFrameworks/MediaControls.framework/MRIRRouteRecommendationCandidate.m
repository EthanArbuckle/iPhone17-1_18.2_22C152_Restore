@interface MRIRRouteRecommendationCandidate
- (MRIRRouteRecommendationCandidate)init;
- (NSSet)nodes;
- (NSString)candidateIdentifier;
- (void)setCandidateIdentifier:(id)a3;
- (void)setNodes:(id)a3;
@end

@implementation MRIRRouteRecommendationCandidate

- (NSString)candidateIdentifier
{
  return (NSString *)sub_1AE8DB58C();
}

- (void)setCandidateIdentifier:(id)a3
{
}

- (NSSet)nodes
{
  return (NSSet *)sub_1AE8DB7DC((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___MRIRRouteRecommendationCandidate_nodes, (void (*)(uint64_t))type metadata accessor for RouteRecommendationNode, &qword_1E9A89D68, (void (*)(void))type metadata accessor for RouteRecommendationNode);
}

- (void)setNodes:(id)a3
{
}

- (MRIRRouteRecommendationCandidate)init
{
  result = (MRIRRouteRecommendationCandidate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end