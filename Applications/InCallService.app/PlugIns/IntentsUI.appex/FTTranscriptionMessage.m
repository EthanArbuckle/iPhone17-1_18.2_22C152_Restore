@interface FTTranscriptionMessage
- (NSAttributedString)attributedText;
- (NSString)text;
- (_TtC9IntentsUI22FTTranscriptionMessage)init;
- (double)confidence;
- (unint64_t)confidenceRating;
@end

@implementation FTTranscriptionMessage

- (NSAttributedString)attributedText
{
  v2 = self;
  sub_100062180();
  id v3 = objc_allocWithZone((Class)NSAttributedString);
  NSString v4 = sub_1000622D0();
  swift_bridgeObjectRelease();
  id v5 = [v3 initWithString:v4];

  return (NSAttributedString *)v5;
}

- (NSString)text
{
  v2 = self;
  sub_100062180();

  NSString v3 = sub_1000622D0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (unint64_t)confidenceRating
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC9IntentsUI22FTTranscriptionMessage_confidenceRating);
}

- (double)confidence
{
  return 1.0;
}

- (_TtC9IntentsUI22FTTranscriptionMessage)init
{
  result = (_TtC9IntentsUI22FTTranscriptionMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC9IntentsUI22FTTranscriptionMessage_transcriptData;
  uint64_t v3 = sub_100062190();
  NSString v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end