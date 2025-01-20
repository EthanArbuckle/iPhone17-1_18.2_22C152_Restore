@interface ObjCSpeechAnalyzer
+ (id)modelDownloadRequestForClientIdentifier:(id)a3 transcriberOptions:(id)a4;
- (_TtC6Speech18ObjCSpeechAnalyzer)init;
- (_TtC6Speech18ObjCSpeechAnalyzer)initWithObjCSpeechAnalyzer:(id)a3 clientIdentifier:(id)a4 audioFormat:(id)a5 transcriberResultDelegate:(id)a6 endpointingResultDelegate:(id)a7 languageDetectorResultDelegate:(id)a8 queue:(id)a9 transcriberOptions:(id)a10 options:(id)a11 languageDetectorOptions:(id)a12 restrictedLogging:(BOOL)a13 geoLMRegionID:(id)a14 contextualNamedEntities:(id)a15 didChangeVolatileRange:(id)aBlock;
- (void)requestResultAtEndpointTimes:(id)a3;
- (void)setAnalysisContextWithGeoLMRegionID:(NSString *)a3 contextualNamedEntities:(NSArray *)a4 completionHandler:(id)a5;
- (void)setInputAudioFile:(NSURL *)a3 withAudioFormat:(AVAudioFormat *)a4 completionHandler:(id)a5;
@end

@implementation ObjCSpeechAnalyzer

- (_TtC6Speech18ObjCSpeechAnalyzer)initWithObjCSpeechAnalyzer:(id)a3 clientIdentifier:(id)a4 audioFormat:(id)a5 transcriberResultDelegate:(id)a6 endpointingResultDelegate:(id)a7 languageDetectorResultDelegate:(id)a8 queue:(id)a9 transcriberOptions:(id)a10 options:(id)a11 languageDetectorOptions:(id)a12 restrictedLogging:(BOOL)a13 geoLMRegionID:(id)a14 contextualNamedEntities:(id)a15 didChangeVolatileRange:(id)aBlock
{
  *(void *)&long long v42 = a8;
  v19 = _Block_copy(aBlock);
  uint64_t v20 = sub_1B7237188();
  v38 = v21;
  uint64_t v39 = v20;
  if (a14)
  {
    uint64_t v22 = sub_1B7237188();
    v36 = v23;
    v37 = (void *)v22;
  }
  else
  {
    v36 = 0;
    v37 = 0;
  }
  if (a15)
  {
    type metadata accessor for SFContextualNamedEntity();
    uint64_t v35 = sub_1B7237428();
  }
  else
  {
    uint64_t v35 = 0;
  }
  HIDWORD(v34) = a13;
  if (v19)
  {
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = v19;
    v33 = sub_1B70EA25C;
  }
  else
  {
    v33 = 0;
    uint64_t v24 = 0;
  }
  id v25 = a3;
  id v26 = a5;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v27 = a9;
  id v28 = a10;
  id v29 = a11;
  id v30 = a12;
  LOBYTE(v32) = BYTE4(v34);
  sub_1B71F139C((uint64_t)v25, v39, (uint64_t)v38, (uint64_t)v26, (uint64_t)a6, (uint64_t)a7, v42, (uint64_t)v27, (uint64_t)a10, (uint64_t)a11, (uint64_t)a12, v32, (uint64_t)v37, (uint64_t)v36, v35, (uint64_t)v33, v24, (uint64_t)v33, v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    (uint64_t)self,
    (uint64_t)a7,
    v42,
    v43);
  return result;
}

+ (id)modelDownloadRequestForClientIdentifier:(id)a3 transcriberOptions:(id)a4
{
  uint64_t v5 = sub_1B7237188();
  uint64_t v7 = v6;
  id v8 = a4;
  v9 = (void *)sub_1B71F36C4(v5, v7, v8);

  swift_bridgeObjectRelease();

  return v9;
}

- (void)requestResultAtEndpointTimes:(id)a3
{
  sub_1B70C9A4C(0, &qword_1E9E4B908);
  unint64_t v4 = sub_1B7237428();
  uint64_t v5 = self;
  sub_1B71F6480(v4);
  swift_bridgeObjectRelease();
}

- (void)setInputAudioFile:(NSURL *)a3 withAudioFormat:(AVAudioFormat *)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;

  sub_1B71EED44((uint64_t)&unk_1E9E4E1F0, (uint64_t)v9);
}

- (void)setAnalysisContextWithGeoLMRegionID:(NSString *)a3 contextualNamedEntities:(NSArray *)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;

  sub_1B71EED44((uint64_t)&unk_1E9E4E1B0, (uint64_t)v9);
}

- (_TtC6Speech18ObjCSpeechAnalyzer)init
{
}

- (void).cxx_destruct
{
  sub_1B70C9B9C((uint64_t)self + OBJC_IVAR____TtC6Speech18ObjCSpeechAnalyzer_inputStreamBuilder, &qword_1E9E4B9B8);
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end