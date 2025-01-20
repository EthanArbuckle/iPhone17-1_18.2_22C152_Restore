@interface FTTranscriptionMessage
- (NSAttributedString)attributedText;
- (NSString)text;
- (_TtC13InCallService22FTTranscriptionMessage)init;
- (double)confidence;
- (unint64_t)confidenceRating;
@end

@implementation FTTranscriptionMessage

- (NSAttributedString)attributedText
{
  v2 = self;
  id v3 = sub_10017E9DC();

  return (NSAttributedString *)v3;
}

- (NSString)text
{
  return (NSString *)sub_10017EDE8(self, (uint64_t)a2, (void (*)(void))sub_10017EA2C);
}

- (unint64_t)confidenceRating
{
  return sub_10017EA94();
}

- (double)confidence
{
  return 1.0;
}

- (_TtC13InCallService22FTTranscriptionMessage)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC13InCallService22FTTranscriptionMessage_transcriptData;
  type metadata accessor for Transcript();
  sub_10013FC1C();
  v5 = *(void (**)(char *, uint64_t))(v4 + 8);

  v5(v2, v3);
}

@end