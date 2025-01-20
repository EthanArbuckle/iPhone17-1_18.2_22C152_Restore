@interface EARSpeechRecognizer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC22localspeechrecognition19EARSpeechRecognizer)init;
- (void)dealloc;
- (void)isSpeechProfileUsedWithReply:(id)a3;
- (void)modelInfoSamplingRatesWithReply:(id)a3;
- (void)modelInfoWithReply:(id)a3;
- (void)modelLoadTimeWithReply:(id)a3;
- (void)prepareForReuseWithNewSupportedFeatures:(id)a3 clientInfo:(id)a4 analysisContext:(id)a5 analysisOptions:(id)a6;
- (void)recognitionMetricsWithReply:(id)a3;
- (void)recognitionStatisticsWithReply:(id)a3;
- (void)recognitionUtterenceStatisticsWithReply:(id)a3;
- (void)requestEagerResult:(id)a3;
- (void)resumeRecognitionWithLeftContext:(id)a3 rightContext:(id)a4 selectedText:(id)a5;
- (void)rightContextWithReply:(id)a3;
- (void)runRecognitionWithResultStream:(id)a3 language:(id)a4 task:(id)a5 samplingRate:(unint64_t)a6 reply:(id)a7;
- (void)setExtraLmList:(id)a3 sandboxExtensions:(id)a4;
- (void)setLeftContextText:(id)a3;
- (void)setRightContext:(id)a3;
- (void)setSelectedText:(id)a3;
- (void)setUserProfileData:(id)a3;
- (void)speechProfileCodepathIdsWithReply:(id)a3;
- (void)updateJitProfileData:(id)a3;
- (void)updateUserProfileData:(id)a3;
- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10;
@end

@implementation EARSpeechRecognizer

- (void)dealloc
{
  v2 = self;
  sub_10001E8A4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_resultStream));
  swift_bridgeObjectRelease();
  swift_release();

  sub_100019380();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_userSpeechProfiles));
  objc_release(*(id *)((char *)OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_modelContextDelegateInterface
                     + (void)self));
  sub_100008834((uint64_t)self + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_speechProfileLastModifiedDate, &qword_1000641B0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_supportedFeatures));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_clientInfo));
  sub_100019380();

  swift_bridgeObjectRelease();
}

- (void)prepareForReuseWithNewSupportedFeatures:(id)a3 clientInfo:(id)a4 analysisContext:(id)a5 analysisOptions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  sub_10001EAD0(v10, v11, v12, a6);
}

- (void)modelInfoSamplingRatesWithReply:(id)a3
{
}

- (void)runRecognitionWithResultStream:(id)a3 language:(id)a4 task:(id)a5 samplingRate:(unint64_t)a6 reply:(id)a7
{
  id v10 = _Block_copy(a7);
  id v11 = (void *)sub_1000411F0();
  uint64_t v13 = v12;
  uint64_t v14 = sub_1000411F0();
  v16 = v15;
  _Block_copy(v10);
  id v17 = a3;
  v18 = self;
  sub_10001FAF4(v17, v11, v13, v14, v16, a6, (uint64_t)v18, (void (**)(void, void, void))v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_100020C00(v6, v7);

  return v9;
}

- (void)setExtraLmList:(id)a3 sandboxExtensions:(id)a4
{
  sub_100041270();
  sub_100041270();
  v5 = self;
  sub_100020E60();

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)setUserProfileData:(id)a3
{
}

- (void)updateUserProfileData:(id)a3
{
}

- (void)updateJitProfileData:(id)a3
{
}

- (void)rightContextWithReply:(id)a3
{
}

- (void)modelInfoWithReply:(id)a3
{
}

- (void)recognitionStatisticsWithReply:(id)a3
{
}

- (void)recognitionUtterenceStatisticsWithReply:(id)a3
{
}

- (void)recognitionMetricsWithReply:(id)a3
{
}

- (void)resumeRecognitionWithLeftContext:(id)a3 rightContext:(id)a4 selectedText:(id)a5
{
  sub_1000411F0();
  sub_1000411F0();
  sub_1000411F0();
  id v6 = self;
  sub_100021B14();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10
{
  if (a3)
  {
    uint64_t v29 = sub_1000411F0();
    uint64_t v32 = v15;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v27 = 0;
    v31 = 0;
    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v29 = 0;
  uint64_t v32 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v27 = sub_1000411F0();
  v31 = v16;
  if (a5)
  {
LABEL_4:
    uint64_t v26 = sub_1000411F0();
    v28 = v17;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v26 = 0;
  v28 = 0;
LABEL_8:
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v23 = self;
  id v24 = a6;
  v25 = v23;
  sub_100021E34(v29, v32, v27, v31, v26, v28, (uint64_t)v24, (uint64_t)a7, (uint64_t)a8, (uint64_t)a9, (uint64_t)a10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)requestEagerResult:(id)a3
{
  sub_10000CD4C(0, &qword_100063260);
  uint64_t v4 = sub_100041270();
  v5 = self;
  sub_1000221E8(v4);

  swift_bridgeObjectRelease();
}

- (void)isSpeechProfileUsedWithReply:(id)a3
{
}

- (void)speechProfileCodepathIdsWithReply:(id)a3
{
}

- (void)modelLoadTimeWithReply:(id)a3
{
}

- (void)setLeftContextText:(id)a3
{
}

- (void)setRightContext:(id)a3
{
}

- (void)setSelectedText:(id)a3
{
}

- (_TtC22localspeechrecognition19EARSpeechRecognizer)init
{
}

@end