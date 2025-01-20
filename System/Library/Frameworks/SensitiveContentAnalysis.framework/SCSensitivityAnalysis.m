@interface SCSensitivityAnalysis
+ (BOOL)supportsSecureCoding;
+ (void)prefetchSensitiveContentPolicy:(id)a3;
- (BOOL)isContentPreviewable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSensitive;
- (BOOL)shouldObscureVideo;
- (BOOL)shouldStore;
- (NSData)dataRepresentation;
- (SCSensitivityAnalysis)init;
- (SCSensitivityAnalysis)initWithAnalysisResult:(id)a3 error:(id *)a4;
- (SCSensitivityAnalysis)initWithCoder:(id)a3;
- (SCSensitivityAnalysis)initWithDataRepresentation:(id)a3 error:(id *)a4;
- (SCSensitivityAnalysis)initWithNudityDetectionValue:(BOOL)a3;
- (SCSensitivityAnalysis)initWithPixelBufferClassificationDictionary:(id)a3 error:(id *)a4;
- (id)initMigratingFromNudityDetectionValue:(BOOL)a3;
- (id)transferringStateFromAnalysis:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCSensitivityAnalysis

- (BOOL)shouldObscureVideo
{
  v2 = self;
  SCSensitivityAnalysis.analysis.getter(&v5);
  sub_2451D6274();
  sub_2451DB7D0();
  sub_2451D62C8();
  char v3 = sub_2451DB620();

  return (v3 & 1) == 0;
}

- (BOOL)isSensitive
{
  return *(_WORD *)((char *)&self->super.isa + OBJC_IVAR___SCSensitivityAnalysis__analysis) != 0;
}

- (SCSensitivityAnalysis)initWithNudityDetectionValue:(BOOL)a3
{
  char v3 = (_WORD *)((char *)self + OBJC_IVAR___SCSensitivityAnalysis__analysis);
  *char v3 = a3;
  v3[1] = 0;
  v5.receiver = self;
  v5.super_class = (Class)SCSensitivityAnalysis;
  return [(SCSensitivityAnalysis *)&v5 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  SCSensitivityAnalysis.encode(with:)((NSCoder)v4);
}

- (SCSensitivityAnalysis)initWithCoder:(id)a3
{
  return (SCSensitivityAnalysis *)SCSensitivityAnalysis.init(coder:)(a3);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_2451DB7B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    objc_super v5 = self;
  }
  BOOL v6 = SCSensitivityAnalysis.isEqual(_:)((uint64_t)v8);

  sub_2451DA89C((uint64_t)v8, &qword_268ECC9B8);
  return v6;
}

- (SCSensitivityAnalysis)init
{
  result = (SCSensitivityAnalysis *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)shouldStore
{
  return *(_WORD *)((char *)&self->super.isa + OBJC_IVAR___SCSensitivityAnalysis__analysis) != 0;
}

+ (void)prefetchSensitiveContentPolicy:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECCB60);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = sub_2451DB6E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_268ECCB70;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_268ECCB80;
  v12[5] = v11;
  sub_2451D9958((uint64_t)v7, (uint64_t)&unk_268ECCB90, (uint64_t)v12);
  swift_release();
}

- (NSData)dataRepresentation
{
  int v2 = *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___SCSensitivityAnalysis__analysis);
  char v3 = self;
  uint64_t v4 = swift_slowAlloc();
  *(unsigned char *)uint64_t v4 = 1;
  *(_DWORD *)(v4 + 2) = v2;
  uint64_t v5 = sub_2451D9BC8((unsigned char *)v4, 6);
  unint64_t v7 = v6;
  MEMORY[0x24569A9F0](v4, -1, -1);

  v8 = (void *)sub_2451DB520();
  sub_2451D9C7C(v5, v7);

  return (NSData *)v8;
}

- (SCSensitivityAnalysis)initWithDataRepresentation:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = sub_2451DB530();
  unint64_t v7 = v6;

  return (SCSensitivityAnalysis *)SCSensitivityAnalysis.init(dataRepresentation:)(v5, v7);
}

- (id)transferringStateFromAnalysis:(id)a3
{
  __int16 v5 = *(_WORD *)((char *)&self->super.isa + OBJC_IVAR___SCSensitivityAnalysis__analysis);
  __int16 v6 = *(_WORD *)((char *)a3 + OBJC_IVAR___SCSensitivityAnalysis__analysis + 2) | *(_WORD *)((char *)&self->super.isa
                                                                                           + OBJC_IVAR___SCSensitivityAnalysis__analysis
                                                                                           + 2);
  id v7 = objc_allocWithZone((Class)SCSensitivityAnalysis);
  id v8 = a3;
  uint64_t v9 = self;
  uint64_t v10 = (char *)objc_msgSend(v7, sel_initWithNudityDetectionValue_, 0);
  v11 = &v10[OBJC_IVAR___SCSensitivityAnalysis__analysis];
  *(_WORD *)v11 = v5;
  *((_WORD *)v11 + 1) = v6;

  return v10;
}

- (BOOL)isContentPreviewable
{
  int v2 = self;
  BOOL v3 = sub_2451D9404();

  return v3;
}

- (id)initMigratingFromNudityDetectionValue:(BOOL)a3
{
  return [(SCSensitivityAnalysis *)self initWithNudityDetectionValue:a3];
}

- (SCSensitivityAnalysis)initWithAnalysisResult:(id)a3 error:(id *)a4
{
  id v5 = a3;
  __int16 v6 = -[SCSensitivityAnalysis initWithNudityDetectionValue:](self, sel_initWithNudityDetectionValue_, objc_msgSend(v5, sel_sensitive));

  return v6;
}

- (SCSensitivityAnalysis)initWithPixelBufferClassificationDictionary:(id)a3 error:(id *)a4
{
  uint64_t v4 = sub_2451DB600();
  return (SCSensitivityAnalysis *)sub_2451D9550(v4);
}

@end