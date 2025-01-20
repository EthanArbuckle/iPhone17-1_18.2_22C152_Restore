@interface SCVideoStreamAnalyzer
- (SCSensitivityAnalysis)analysis;
- (SCVideoStreamAnalyzer)init;
- (SCVideoStreamAnalyzer)initWithOptions:(int64_t)a3 error:(id *)a4;
- (id)analysisChanged;
- (void)analyzePixelBuffer:(__CVBuffer *)a3;
- (void)setAnalysisChanged:(id)a3;
@end

@implementation SCVideoStreamAnalyzer

- (SCSensitivityAnalysis)analysis
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SCVideoStreamAnalyzer__analysis);
  v3 = (void **)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 28);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_2451D4204(v3, &v8);
  os_unfair_lock_unlock(v4);
  v6 = v8;

  return (SCSensitivityAnalysis *)v6;
}

- (id)analysisChanged
{
  uint64_t v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SCVideoStreamAnalyzer_analysisChanged);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2451D4358;
    aBlock[3] = &block_descriptor_1;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setAnalysisChanged:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_2451D637C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___SCVideoStreamAnalyzer_analysisChanged);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_2451D44F8(v7);
}

- (SCVideoStreamAnalyzer)initWithOptions:(int64_t)a3 error:(id *)a4
{
  return (SCVideoStreamAnalyzer *)sub_2451D4508(a3);
}

- (void)analyzePixelBuffer:(__CVBuffer *)a3
{
  v4 = a3;
  uint64_t v5 = self;
  sub_2451D4ABC(v4);
}

- (SCVideoStreamAnalyzer)init
{
  result = (SCVideoStreamAnalyzer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
  sub_2451D44F8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SCVideoStreamAnalyzer_analysisChanged));
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SCVideoStreamAnalyzer_transferSession);
  VTPixelTransferSessionInvalidate(v3);

  swift_release();
}

@end