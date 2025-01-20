@interface MRIRRouteRecommendationContext
+ (id)fromObject:(id)a3;
- (MRIRRouteRecommendationContext)init;
- (MRIRRouteRecommendationContext)initWithCandidateResults:(id)a3 contextIdentifier:(id)a4;
- (NSSet)candidateResults;
- (NSString)contextIdentifier;
- (NSString)description;
- (void)setCandidateResults:(id)a3;
- (void)setContextIdentifier:(id)a3;
@end

@implementation MRIRRouteRecommendationContext

- (NSSet)candidateResults
{
  return (NSSet *)sub_1AE8DB7DC((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___MRIRRouteRecommendationContext_candidateResults, (void (*)(uint64_t))type metadata accessor for RouteRecommendationCandidateResult, &qword_1E9A89D70, (void (*)(void))type metadata accessor for RouteRecommendationCandidateResult);
}

- (void)setCandidateResults:(id)a3
{
}

- (NSString)contextIdentifier
{
  return (NSString *)sub_1AE8DB58C();
}

- (void)setContextIdentifier:(id)a3
{
}

+ (id)fromObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)sub_1AE8DD690(v3);

  return v4;
}

- (MRIRRouteRecommendationContext)initWithCandidateResults:(id)a3 contextIdentifier:(id)a4
{
  type metadata accessor for RouteRecommendationCandidateResult();
  sub_1AE8DED3C(&qword_1E9A89D70, (void (*)(void))type metadata accessor for RouteRecommendationCandidateResult);
  v5 = (objc_class *)sub_1AE947428();
  uint64_t v6 = sub_1AE947158();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRIRRouteRecommendationContext_candidateResults) = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___MRIRRouteRecommendationContext_contextIdentifier);
  uint64_t *v7 = v6;
  v7[1] = v8;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for RouteRecommendationContext();
  return [(MRIRRouteRecommendationContext *)&v10 init];
}

- (NSString)description
{
  return (NSString *)sub_1AE8DAB94(self, (uint64_t)a2, type metadata accessor for RouteRecommendationContext, &qword_1E9A89C00, (void (*)(void))type metadata accessor for RouteRecommendationContext);
}

- (MRIRRouteRecommendationContext)init
{
  result = (MRIRRouteRecommendationContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end