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
  v2 = self;
  id v3 = sub_1001C0608();

  return (NSAttributedString *)v3;
}

- (NSString)text
{
  v2 = self;
  sub_1001C06A4();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (unint64_t)confidenceRating
{
  v2 = self;
  id v3 = sub_1001C0738();

  return (unint64_t)v3;
}

- (double)confidence
{
  v2 = self;
  double v3 = sub_1001C078C();

  return v3;
}

- (MPVisualTranscriptionMessage)initWithVMTranscript:(id)a3
{
  return (MPVisualTranscriptionMessage *)sub_1001C1684((uint64_t)a3, &OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript, type metadata accessor for VisualTranscriptionMessage);
}

- (MPVisualTranscriptionMessage)init
{
}

- (void).cxx_destruct
{
}

@end