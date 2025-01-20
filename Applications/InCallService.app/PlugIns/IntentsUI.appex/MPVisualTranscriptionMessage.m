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
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript);
  v3 = self;
  id v4 = [v2 transcriptionString];
  sub_100062300();

  id v5 = objc_allocWithZone((Class)NSAttributedString);
  NSString v6 = sub_1000622D0();
  swift_bridgeObjectRelease();
  id v7 = [v5 initWithString:v6];

  return (NSAttributedString *)v7;
}

- (NSString)text
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript);
  v3 = self;
  id v4 = [v2 transcriptionString];
  sub_100062300();

  NSString v5 = sub_1000622D0();
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
  return (MPVisualTranscriptionMessage *)sub_1000472B0((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript, type metadata accessor for VisualTranscriptionMessage);
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