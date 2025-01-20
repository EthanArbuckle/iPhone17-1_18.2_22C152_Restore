@interface SFSpeechAnalyzer
+ (void)configurationForClientIdentifier:(id)a3 queue:(id)a4 transcriberOptions:(id)a5 languageDetectorOptions:(id)a6 transcriberResultDelegate:(id)a7 endpointingResultDelegate:(id)a8 languageDetectorResultDelegate:(id)a9 considering:(id)a10 completion:(id)aBlock;
+ (void)speechAnalyzerWithConfiguration:(id)a3 inputAudioFile:(id)a4 options:(id)a5 restrictedLogging:(BOOL)a6 geoLMRegionID:(id)a7 contextualNamedEntities:(id)a8 didChangeVolatileRange:(id)a9 completion:(id)a10;
- (SFSpeechAnalyzer)init;
- (SFSpeechAnalyzer)initWithClientIdentifier:(id)a3 audioFormat:(id)a4 transcriberResultDelegate:(id)a5 endpointingResultDelegate:(id)a6 languageDetectorResultDelegate:(id)a7 queue:(id)a8 transcriberOptions:(id)a9 options:(id)a10 languageDetectorOptions:(id)a11 restrictedLogging:(BOOL)a12 geoLMRegionID:(id)a13 contextualNamedEntities:(id)a14 didChangeVolatileRange:(id)aBlock;
- (SFSpeechAnalyzer)initWithClientIdentifier:(id)a3 audioFormat:(id)a4 transcriberResultDelegate:(id)a5 endpointingResultDelegate:(id)a6 queue:(id)a7 transcriberOptions:(id)a8 options:(id)a9 restrictedLogging:(BOOL)a10 didChangeVolatileRange:(id)aBlock;
- (SFSpeechAnalyzer)initWithClientIdentifier:(id)a3 audioFormat:(id)a4 transcriberResultDelegate:(id)a5 endpointingResultDelegate:(id)a6 queue:(id)a7 transcriberOptions:(id)a8 options:(id)a9 restrictedLogging:(BOOL)a10 geoLMRegionID:(id)a11 contextualNamedEntities:(id)a12 didChangeVolatileRange:(id)aBlock;
- (SFSpeechAnalyzer)initWithConfiguration:(id)a3 options:(id)a4 restrictedLogging:(BOOL)a5 didChangeVolatileRange:(id)a6;
- (SFSpeechAnalyzer)initWithConfiguration:(id)a3 options:(id)a4 restrictedLogging:(BOOL)a5 geoLMRegionID:(id)a6 contextualNamedEntities:(id)a7 didChangeVolatileRange:(id)a8;
- (id)initForAudioFileWithConfiguration:(id)a3 options:(id)a4 restrictedLogging:(BOOL)a5 didChangeVolatileRange:(id)a6;
- (void)addAudio:(id)a3;
- (void)cancelPendingResultsAndPauseWithCompletion:(id)a3;
- (void)finalizeAndFinishThroughEndOfInputWithCompletion:(id)a3;
- (void)finalizeThrough:(id *)a3 completion:(id)a4;
- (void)finalizeWithCompletion:(id)a3;
- (void)finishAudio;
- (void)getModelInfoLanguageWithCompletion:(id)a3;
- (void)getModelInfoLanguageWithCompletionWithError:(id)a3;
- (void)getModelInfoTasksWithCompletion:(id)a3;
- (void)getModelInfoTasksWithCompletionWithError:(id)a3;
- (void)getNextBufferStartTimeWithCompletion:(id)a3;
- (void)getRecognitionStatisticsWithCompletion:(id)a3;
- (void)getRecognitionStatisticsWithCompletionWithError:(id)a3;
- (void)getRecognitionUtteranceStatisticsWithCompletionWithError:(id)a3;
- (void)getRecognitionUtterenceStatisticsWithCompletion:(id)a3;
- (void)prepareToAnalyzeReportingInto:(NSProgress *)a3 completion:(id)a4;
- (void)requestResultAtEndpointTimes:(id)a3;
- (void)resumeWithCompletion:(id)a3;
- (void)setDidChangeVolatileRange:(id)a3 completion:;
@end

@implementation SFSpeechAnalyzer

+ (void)configurationForClientIdentifier:(id)a3 queue:(id)a4 transcriberOptions:(id)a5 languageDetectorOptions:(id)a6 transcriberResultDelegate:(id)a7 endpointingResultDelegate:(id)a8 languageDetectorResultDelegate:(id)a9 considering:(id)a10 completion:(id)aBlock
{
  v16 = _Block_copy(aBlock);
  uint64_t v17 = sub_1B7237188();
  uint64_t v24 = v18;
  uint64_t v25 = v17;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v16;
  id v20 = a4;
  id v23 = a5;
  id v21 = a6;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v22 = a10;
  sub_1B70E4080(v25, v24, (uint64_t)v20, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, (uint64_t)a9, (uint64_t)a10, (uint64_t)sub_1B70EA698, v19);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  swift_release();
}

+ (void)speechAnalyzerWithConfiguration:(id)a3 inputAudioFile:(id)a4 options:(id)a5 restrictedLogging:(BOOL)a6 geoLMRegionID:(id)a7 contextualNamedEntities:(id)a8 didChangeVolatileRange:(id)a9 completion:(id)a10
{
  BOOL v29 = a6;
  id v28 = a3;
  uint64_t v30 = sub_1B7236B08();
  uint64_t v13 = *(void *)(v30 - 8);
  MEMORY[0x1F4188790](v30);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (uint64_t (*)())_Block_copy(a9);
  uint64_t v17 = _Block_copy(a10);
  sub_1B7236AC8();
  if (a7)
  {
    uint64_t v18 = sub_1B7237188();
    uint64_t v20 = v19;
    if (!a8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v18 = 0;
  uint64_t v20 = 0;
  if (a8)
  {
LABEL_3:
    type metadata accessor for SFContextualNamedEntity();
    a8 = (id)sub_1B7237428();
  }
LABEL_4:
  if (v16)
  {
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v16;
    v16 = sub_1B70EA774;
  }
  else
  {
    uint64_t v21 = 0;
  }
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v17;
  id v23 = v28;
  id v24 = a5;
  id v25 = a5;
  id v26 = v24;
  sub_1B70E433C(v23, (uint64_t)v15, v25, v29, v18, v20, (uint64_t)a8, (uint64_t)v16, v21, (uint64_t)sub_1B70EA33C, v22);
  swift_release();
  sub_1B70EA214((uint64_t)v16);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v30);
}

- (void).cxx_destruct
{
}

- (SFSpeechAnalyzer)initWithClientIdentifier:(id)a3 audioFormat:(id)a4 transcriberResultDelegate:(id)a5 endpointingResultDelegate:(id)a6 languageDetectorResultDelegate:(id)a7 queue:(id)a8 transcriberOptions:(id)a9 options:(id)a10 languageDetectorOptions:(id)a11 restrictedLogging:(BOOL)a12 geoLMRegionID:(id)a13 contextualNamedEntities:(id)a14 didChangeVolatileRange:(id)aBlock
{
  uint64_t v17 = (uint64_t (*)())_Block_copy(aBlock);
  uint64_t v18 = sub_1B7237188();
  uint64_t v33 = v19;
  uint64_t v34 = v18;
  if (a13)
  {
    uint64_t v20 = sub_1B7237188();
    uint64_t v30 = v21;
    v31 = (void *)v20;
  }
  else
  {
    uint64_t v30 = 0;
    v31 = 0;
  }
  if (a14)
  {
    type metadata accessor for SFContextualNamedEntity();
    uint64_t v29 = sub_1B7237428();
  }
  else
  {
    uint64_t v29 = 0;
  }
  if (v17)
  {
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = v17;
    uint64_t v17 = sub_1B70EA774;
  }
  else
  {
    uint64_t v22 = 0;
  }
  id v23 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v24 = a8;
  id v25 = a9;
  id v26 = a10;
  id v27 = a11;
  return (SFSpeechAnalyzer *)sub_1B70E5150(v34, v33, (uint64_t)v23, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)v24, a9, (uint64_t)a10, (uint64_t)a11, a12, v31, v30, v29, (uint64_t)v17, v22);
}

- (SFSpeechAnalyzer)initWithClientIdentifier:(id)a3 audioFormat:(id)a4 transcriberResultDelegate:(id)a5 endpointingResultDelegate:(id)a6 queue:(id)a7 transcriberOptions:(id)a8 options:(id)a9 restrictedLogging:(BOOL)a10 geoLMRegionID:(id)a11 contextualNamedEntities:(id)a12 didChangeVolatileRange:(id)aBlock
{
  uint64_t v17 = (uint64_t)a12;
  uint64_t v18 = (uint64_t (*)())_Block_copy(aBlock);
  uint64_t v19 = sub_1B7237188();
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  if (a11)
  {
    uint64_t v21 = sub_1B7237188();
    uint64_t v29 = v22;
    uint64_t v30 = v21;
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v30 = 0;
  }
  if (a12)
  {
    type metadata accessor for SFContextualNamedEntity();
    uint64_t v17 = sub_1B7237428();
  }
  if (v18)
  {
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v18;
    uint64_t v18 = sub_1B70EA774;
  }
  else
  {
    uint64_t v23 = 0;
  }
  id v24 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v25 = a7;
  id v26 = a8;
  id v27 = a9;
  return (SFSpeechAnalyzer *)sub_1B70E53EC(v32, v31, v24, (uint64_t)a5, (uint64_t)a6, v25, v26, a9, a10, v30, v29, v17, (uint64_t)v18, v23);
}

- (SFSpeechAnalyzer)initWithClientIdentifier:(id)a3 audioFormat:(id)a4 transcriberResultDelegate:(id)a5 endpointingResultDelegate:(id)a6 queue:(id)a7 transcriberOptions:(id)a8 options:(id)a9 restrictedLogging:(BOOL)a10 didChangeVolatileRange:(id)aBlock
{
  v16 = (uint64_t (*)())_Block_copy(aBlock);
  uint64_t v17 = sub_1B7237188();
  uint64_t v19 = v18;
  if (v16)
  {
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v16;
    v16 = sub_1B70EA774;
  }
  else
  {
    uint64_t v20 = 0;
  }
  id v21 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  return (SFSpeechAnalyzer *)sub_1B70E5808(v17, v19, v21, (uint64_t)a5, (uint64_t)a6, v22, v23, a9, a10, (uint64_t)v16, v20);
}

- (SFSpeechAnalyzer)initWithConfiguration:(id)a3 options:(id)a4 restrictedLogging:(BOOL)a5 geoLMRegionID:(id)a6 contextualNamedEntities:(id)a7 didChangeVolatileRange:(id)a8
{
  uint64_t v13 = (uint64_t (*)())_Block_copy(a8);
  if (a6)
  {
    LOBYTE(a6) = sub_1B7237188();
    uint64_t v15 = v14;
    if (!a7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v15 = 0;
  if (a7)
  {
LABEL_3:
    type metadata accessor for SFContextualNamedEntity();
    a7 = (id)sub_1B7237428();
  }
LABEL_4:
  if (v13)
  {
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v13;
    uint64_t v13 = sub_1B70EA774;
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint64_t v17 = (char *)a3;
  id v18 = a4;
  return (SFSpeechAnalyzer *)sub_1B70E5AF0(v17, a4, a5, (char)a6, v15, (unint64_t)a7, (uint64_t)v13, v16);
}

- (SFSpeechAnalyzer)initWithConfiguration:(id)a3 options:(id)a4 restrictedLogging:(BOOL)a5 didChangeVolatileRange:(id)a6
{
  v9 = (uint64_t (*)())_Block_copy(a6);
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    v9 = sub_1B70EA774;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = a3;
  id v12 = a4;
  return (SFSpeechAnalyzer *)sub_1B70E5F98(v11, a4, a5, (uint64_t)v9, v10);
}

- (id)initForAudioFileWithConfiguration:(id)a3 options:(id)a4 restrictedLogging:(BOOL)a5 didChangeVolatileRange:(id)a6
{
  v9 = (uint64_t (*)())_Block_copy(a6);
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    v9 = sub_1B70EA774;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = (char *)a3;
  id v12 = a4;
  return sub_1B70E6150(v11, a4, a5, (uint64_t)v9, v10);
}

- (void)addAudio:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B70E7AB4((uint64_t)v4, &OBJC_IVAR___SFSpeechAnalyzer__implementation, (void (*)(uint64_t))sub_1B71F3380);
}

- (void)finishAudio
{
  v2 = self;
  sub_1B70E645C();
}

- (void)getNextBufferStartTimeWithCompletion:(id)a3
{
}

- (void)setDidChangeVolatileRange:(id)a3 completion:
{
  id v4 = v3;
  v6 = _Block_copy(a3);
  v7 = _Block_copy(v4);
  v8 = (void *)swift_allocObject();
  v8[2] = v6;
  v8[3] = v7;
  v8[4] = self;
  v9 = self;

  sub_1B71EED44((uint64_t)&unk_1E9E4B990, (uint64_t)v8);
}

- (void)cancelPendingResultsAndPauseWithCompletion:(id)a3
{
}

- (void)resumeWithCompletion:(id)a3
{
}

- (void)finalizeWithCompletion:(id)a3
{
}

- (void)finalizeThrough:(id *)a3 completion:(id)a4
{
  int64_t var0 = a3->var0;
  int64_t var3 = a3->var3;
  uint64_t v7 = *(void *)&a3->var1;
  v8 = _Block_copy(a4);
  v9 = (void *)swift_allocObject();
  v9[2] = var0;
  v9[3] = v7;
  v9[4] = var3;
  v9[5] = v8;
  v9[6] = self;
  uint64_t v10 = self;

  sub_1B71EED44((uint64_t)&unk_1E9E4B930, (uint64_t)v9);
}

- (void)finalizeAndFinishThroughEndOfInputWithCompletion:(id)a3
{
}

- (void)requestResultAtEndpointTimes:(id)a3
{
  sub_1B70C9A4C(0, &qword_1E9E4B908);
  uint64_t v4 = sub_1B7237428();
  v5 = self;
  sub_1B70E7AB4(v4, &OBJC_IVAR___SFSpeechAnalyzer__implementation, (void (*)(uint64_t))sub_1B71F6480);

  swift_bridgeObjectRelease();
}

- (void)getModelInfoTasksWithCompletion:(id)a3
{
}

- (void)getModelInfoLanguageWithCompletion:(id)a3
{
}

- (void)getRecognitionStatisticsWithCompletion:(id)a3
{
}

- (void)getRecognitionUtterenceStatisticsWithCompletion:(id)a3
{
}

- (void)getModelInfoTasksWithCompletionWithError:(id)a3
{
}

- (void)getModelInfoLanguageWithCompletionWithError:(id)a3
{
}

- (void)getRecognitionStatisticsWithCompletionWithError:(id)a3
{
}

- (void)getRecognitionUtteranceStatisticsWithCompletionWithError:(id)a3
{
}

- (void)prepareToAnalyzeReportingInto:(NSProgress *)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;

  sub_1B71EED44((uint64_t)&unk_1E9E4B898, (uint64_t)v7);
}

- (SFSpeechAnalyzer)init
{
}

@end