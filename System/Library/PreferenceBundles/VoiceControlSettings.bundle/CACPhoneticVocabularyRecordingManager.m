@interface CACPhoneticVocabularyRecordingManager
- (_TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager)init;
- (void)dealloc;
- (void)dictationConnection:(id)a3 didRecognizeTranscriptionObjects:(id)a4 languageModel:(id)a5;
- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4;
- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4;
- (void)dictationConnectionSpeechRecognitionDidSucceed:(id)a3;
- (void)dictationConnectionSpeechRecordingDidBegin:(id)a3;
- (void)dictationConnectionSpeechRecordingDidCancel:(id)a3;
- (void)dictationConnectionSpeechRecordingDidEnd:(id)a3;
@end

@implementation CACPhoneticVocabularyRecordingManager

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection);
  v4 = self;
  if (v3) {
    [v3 endSession];
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CACPhoneticVocabularyRecordingManager(0);
  [(CACPhoneticVocabularyRecordingManager *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection));
  sub_24890(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_recognizedPhonemesBlock));
  sub_24890(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_didStart));
  sub_24890(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_didEnd));
  sub_24890(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_didError));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_logger;
  uint64_t v4 = sub_38420();
  objc_super v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)dictationConnectionSpeechRecordingDidBegin:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_112A0(a3);
}

- (void)dictationConnection:(id)a3 didRecognizeTranscriptionObjects:(id)a4 languageModel:(id)a5
{
  if (a4)
  {
    uint64_t v8 = sub_390A0();
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v8 = 0;
  if (a5) {
LABEL_3:
  }
    sub_38FE0();
LABEL_4:
  id v9 = a3;
  v10 = self;
  sub_22594(a3, v8);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4
{
  id v7 = a3;
  uint64_t v8 = self;
  id v9 = a4;
  sub_11A80(a3, (uint64_t)a4);
}

- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4
{
  id v7 = a3;
  uint64_t v8 = self;
  id v9 = a4;
  sub_11B64(a3, (uint64_t)a4);
}

- (void)dictationConnectionSpeechRecordingDidCancel:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_12114(a3);
}

- (void)dictationConnectionSpeechRecognitionDidSucceed:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_125AC(a3);
}

- (void)dictationConnectionSpeechRecordingDidEnd:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_129F8(a3);
}

- (_TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager)init
{
  result = (_TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end