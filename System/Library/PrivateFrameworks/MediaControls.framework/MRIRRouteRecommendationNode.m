@interface MRIRRouteRecommendationNode
- (BOOL)isLocal;
- (MRIRRouteRecommendationNode)init;
- (NSString)avOutpuDeviceIdentifier;
- (NSString)avOutputDeviceIdentifier;
- (NSString)idsIdentifier;
- (NSString)rapportIdentifier;
- (void)setAvOutpuDeviceIdentifier:(id)a3;
- (void)setAvOutputDeviceIdentifier:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setIsLocal:(BOOL)a3;
- (void)setRapportIdentifier:(id)a3;
@end

@implementation MRIRRouteRecommendationNode

- (NSString)avOutputDeviceIdentifier
{
  return (NSString *)sub_1AE8DC50C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MRIRRouteRecommendationNode_avOutputDeviceIdentifier);
}

- (void)setAvOutputDeviceIdentifier:(id)a3
{
}

- (NSString)rapportIdentifier
{
  return (NSString *)sub_1AE8DC50C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MRIRRouteRecommendationNode_rapportIdentifier);
}

- (void)setRapportIdentifier:(id)a3
{
}

- (NSString)idsIdentifier
{
  return (NSString *)sub_1AE8DC50C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MRIRRouteRecommendationNode_idsIdentifier);
}

- (void)setIdsIdentifier:(id)a3
{
}

- (BOOL)isLocal
{
  v2 = (BOOL *)self + OBJC_IVAR___MRIRRouteRecommendationNode_isLocal;
  swift_beginAccess();
  return *v2;
}

- (void)setIsLocal:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MRIRRouteRecommendationNode_isLocal;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (NSString)avOutpuDeviceIdentifier
{
  v2 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x70);
  v3 = self;
  v2();
  uint64_t v5 = v4;

  if (v5)
  {
    v6 = (void *)sub_1AE947128();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setAvOutpuDeviceIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1AE947158();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x78);
  v8 = self;
  v7(v4, v6);
}

- (MRIRRouteRecommendationNode)init
{
  result = (MRIRRouteRecommendationNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end