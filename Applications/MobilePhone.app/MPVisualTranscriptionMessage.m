@interface MPVisualTranscriptionMessage
- (MPVisualTranscriptionMessage)init;
- (MPVisualTranscriptionMessage)initWithVMTranscript:(id)a3;
- (NSAttributedString)attributedText;
- (NSString)text;
- (double)confidence;
- (unint64_t)confidenceRating;
@end

@implementation MPVisualTranscriptionMessage

- (NSAttributedString)attributedText
{
  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x60);
  v3 = self;
  v2();
  id v4 = objc_allocWithZone((Class)NSAttributedString);
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithString:v5];

  return (NSAttributedString *)v6;
}

- (NSString)text
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript);
  v3 = self;
  id v4 = [v2 transcriptionString];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (unint64_t)confidenceRating
{
  return (unint64_t)[*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript) confidenceRating];
}

- (double)confidence
{
  [*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript) confidence];
  return v2;
}

- (MPVisualTranscriptionMessage)initWithVMTranscript:(id)a3
{
  return (MPVisualTranscriptionMessage *)@objc VisualTranscriptionMessage.init(vmTranscript:)((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript, type metadata accessor for VisualTranscriptionMessage);
}

- (MPVisualTranscriptionMessage)init
{
  result = (MPVisualTranscriptionMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end