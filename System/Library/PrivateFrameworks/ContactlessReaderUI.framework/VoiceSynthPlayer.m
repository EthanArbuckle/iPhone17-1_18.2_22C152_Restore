@interface VoiceSynthPlayer
- (_TtC19ContactlessReaderUI16VoiceSynthPlayer)init;
- (uint64_t)speechSynthesizer:(void *)a3 didFinishSpeechUtterance:(void *)a4;
- (void)dealloc;
- (void)speechSynthesizer:(id)a3 didStartSpeechUtterance:(id)a4;
@end

@implementation VoiceSynthPlayer

- (void)dealloc
{
  v2 = self;
  sub_23EDFA3E8();
}

- (void).cxx_destruct
{
  sub_23EDC4A90((uint64_t)self + OBJC_IVAR____TtC19ContactlessReaderUI16VoiceSynthPlayer_audioPlayerDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUI16VoiceSynthPlayer_voiceSynthesizer));
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC19ContactlessReaderUI16VoiceSynthPlayer_locale;
  uint64_t v4 = sub_23EF032B8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (_TtC19ContactlessReaderUI16VoiceSynthPlayer)init
{
  result = (_TtC19ContactlessReaderUI16VoiceSynthPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)speechSynthesizer:(id)a3 didStartSpeechUtterance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_23EDFC5A8();
}

- (uint64_t)speechSynthesizer:(void *)a3 didFinishSpeechUtterance:(void *)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  id v9 = objc_msgSend(v7, sel_speechString);
  uint64_t v10 = sub_23EF05418();
  unint64_t v12 = v11;

  sub_23EDFB2F8(v10, v12);
  return swift_bridgeObjectRelease();
}

@end