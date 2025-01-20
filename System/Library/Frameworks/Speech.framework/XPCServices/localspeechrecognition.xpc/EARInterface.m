@interface EARInterface
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC22localspeechrecognition12EARInterface)init;
- (void)getJitProfileData:(id)a3 contextualStrings:(id)a4 clientID:(id)a5 reply:(id)a6;
- (void)makeEARLanguageDetectorWithDetectorOptions:(id)a3 clientInfo:(id)a4 analysisOptions:(id)a5 reply:(id)a6;
- (void)makeEARSpeechRecognizerWithSupportedFeatures:(id)a3 clientInfo:(id)a4 analysisContext:(id)a5 analysisOptions:(id)a6 sandboxExtensions:(id)a7 reply:(id)a8;
- (void)makeEuclidInstanceWithLocale:(id)a3 clientID:(id)a4 encoderType:(int64_t)a5 initFlag:(int64_t)a6 reply:(id)a7;
- (void)makeLSRAssetsForLocale:(id)a3 taskName:(id)a4 clientID:(id)a5 modelOverrideURL:(id)a6 isSpelling:(BOOL)a7 reply:(id)a8;
- (void)processStartTimeOnceWithReply:(id)a3;
@end

@implementation EARInterface

- (void)makeEARSpeechRecognizerWithSupportedFeatures:(id)a3 clientInfo:(id)a4 analysisContext:(id)a5 analysisOptions:(id)a6 sandboxExtensions:(id)a7 reply:(id)a8
{
  v13 = _Block_copy(a8);
  uint64_t v14 = sub_100041270();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  v20 = self;
  sub_1000124E8(v16, v17, v18, a6, v14, (uint64_t)sub_1000150C0, v15);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)makeLSRAssetsForLocale:(id)a3 taskName:(id)a4 clientID:(id)a5 modelOverrideURL:(id)a6 isSpelling:(BOOL)a7 reply:(id)a8
{
  BOOL v28 = a7;
  uint64_t v11 = sub_100007A58(&qword_1000641E0);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100040FF0();
  uint64_t v14 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  id v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = _Block_copy(a8);
  sub_100040F60();
  uint64_t v18 = sub_1000411F0();
  uint64_t v20 = v19;
  uint64_t v21 = sub_1000411F0();
  v23 = v22;
  if (a6)
  {
    sub_100040E30();
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = 1;
  }
  uint64_t v25 = sub_100040E80();
  sub_10000A374((uint64_t)v13, v24, 1, v25);
  _Block_copy(v17);
  v26 = self;
  sub_100012C88((uint64_t)v16, v18, v20, v21, v23, (uint64_t)v13, v28, (uint64_t)v26, (void (**)(void, id, void))v17);
  _Block_release(v17);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100008834((uint64_t)v13, &qword_1000641E0);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v27);
}

- (void)makeEuclidInstanceWithLocale:(id)a3 clientID:(id)a4 encoderType:(int64_t)a5 initFlag:(int64_t)a6 reply:(id)a7
{
  uint64_t v11 = sub_100040FF0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a7);
  sub_100040F60();
  uint64_t v16 = sub_1000411F0();
  uint64_t v18 = v17;
  _Block_copy(v15);
  uint64_t v19 = self;
  sub_1000132B0((uint64_t)v14, v16, v18, a5, a6, (uint64_t)v19, (void (**)(void, void, void))v15);
  _Block_release(v15);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)makeEARLanguageDetectorWithDetectorOptions:(id)a3 clientInfo:(id)a4 analysisOptions:(id)a5 reply:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = self;
  sub_10001379C(v12, v13, a5, (uint64_t)sub_100015054, v11);

  swift_release();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10001403C((uint64_t)v6, v7);

  return v9 & 1;
}

- (void)getJitProfileData:(id)a3 contextualStrings:(id)a4 clientID:(id)a5 reply:(id)a6
{
  id v7 = _Block_copy(a6);
  uint64_t v8 = sub_1000411F0();
  uint64_t v10 = v9;
  uint64_t v11 = sub_100041270();
  uint64_t v12 = sub_1000411F0();
  uint64_t v14 = v13;
  _Block_copy(v7);
  uint64_t v15 = self;
  sub_10001431C(v8, v10, v11, v12, v14, (uint64_t)v15, (void (**)(void, void, void))v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)processStartTimeOnceWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10001478C((uint64_t)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
}

- (_TtC22localspeechrecognition12EARInterface)init
{
  return (_TtC22localspeechrecognition12EARInterface *)sub_100014864();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end