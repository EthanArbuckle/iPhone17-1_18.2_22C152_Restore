@interface PlaybackEngineSessionManager.OPACKDecoderDelegate
- (Class)decoder:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5;
- (_TtCC17MediaPlaybackCore28PlaybackEngineSessionManagerP33_1E9E2D41781E1C170C90974595EBBAFA20OPACKDecoderDelegate)init;
@end

@implementation PlaybackEngineSessionManager.OPACKDecoderDelegate

- (Class)decoder:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  sub_21BEAA178();
  sub_21BEAA308();
  uint64_t v5 = OUTLINED_FUNCTION_15_1();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v5) {
    return 0;
  }

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtCC17MediaPlaybackCore28PlaybackEngineSessionManagerP33_1E9E2D41781E1C170C90974595EBBAFA20OPACKDecoderDelegate)init
{
  return (_TtCC17MediaPlaybackCore28PlaybackEngineSessionManagerP33_1E9E2D41781E1C170C90974595EBBAFA20OPACKDecoderDelegate *)sub_21BCC7724();
}

@end