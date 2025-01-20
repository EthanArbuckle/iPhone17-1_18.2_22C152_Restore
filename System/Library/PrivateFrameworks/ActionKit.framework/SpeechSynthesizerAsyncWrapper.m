@interface SpeechSynthesizerAsyncWrapper
- (_TtC9ActionKitP33_3FD069E75236963E75C4BE2D87E9ECB629SpeechSynthesizerAsyncWrapper)init;
- (void)speechSynthesizer:(id)a3 didFailSpeakingUtterance:(id)a4 error:(id)a5;
- (void)speechSynthesizer:(id)a3 didFinishSpeakingUtterance:(id)a4 intoFile:(id)a5;
@end

@implementation SpeechSynthesizerAsyncWrapper

- (void)speechSynthesizer:(id)a3 didFailSpeakingUtterance:(id)a4 error:(id)a5
{
  uint64_t v8 = sub_23C6D5568();
  uint64_t v10 = v9;
  id v11 = a3;
  v12 = self;
  id v13 = a5;
  sub_23C3E1BBC((uint64_t)v11, v8, v10, a5);

  swift_bridgeObjectRelease();
}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingUtterance:(id)a4 intoFile:(id)a5
{
  uint64_t v8 = sub_23C6D5568();
  uint64_t v10 = v9;
  id v11 = a3;
  id v12 = a5;
  id v13 = self;
  sub_23C3E2034((uint64_t)v11, v8, v10, a5);

  swift_bridgeObjectRelease();
}

- (_TtC9ActionKitP33_3FD069E75236963E75C4BE2D87E9ECB629SpeechSynthesizerAsyncWrapper)init
{
  return (_TtC9ActionKitP33_3FD069E75236963E75C4BE2D87E9ECB629SpeechSynthesizerAsyncWrapper *)sub_23C3E2280();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9ActionKitP33_3FD069E75236963E75C4BE2D87E9ECB629SpeechSynthesizerAsyncWrapper_synthesizer));
  sub_23C3E30D0((uint64_t)self+ OBJC_IVAR____TtC9ActionKitP33_3FD069E75236963E75C4BE2D87E9ECB629SpeechSynthesizerAsyncWrapper_continuation, (uint64_t *)&unk_268BA73A8);
}

@end