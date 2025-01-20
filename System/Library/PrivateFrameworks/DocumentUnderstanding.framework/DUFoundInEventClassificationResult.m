@interface DUFoundInEventClassificationResult
- (NSNumber)containsDataDetectors;
- (NSNumber)isClassifiedAsEvent;
- (NSNumber)isEventCandidate;
- (NSNumber)isHumanHeaders;
- (NSNumber)isHumanSender;
- (NSNumber)isSupportedLocale;
- (NSNumber)textLengthPass;
- (_TtC21DocumentUnderstanding34DUFoundInEventClassificationResult)init;
- (_TtC21DocumentUnderstanding34DUFoundInEventClassificationResult)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (id)serializedData;
- (void)encodeWithCoder:(id)a3;
- (void)setContainsDataDetectors:(id)a3;
- (void)setIsClassifiedAsEvent:(id)a3;
- (void)setIsEventCandidate:(id)a3;
- (void)setIsHumanHeaders:(id)a3;
- (void)setIsHumanSender:(id)a3;
- (void)setIsSupportedLocale:(id)a3;
- (void)setTextLengthPass:(id)a3;
@end

@implementation DUFoundInEventClassificationResult

- (NSNumber)isSupportedLocale
{
  v2 = DUFoundInEventClassificationResult.isSupportedLocale.getter();
  return (NSNumber *)v2;
}

- (void)setIsSupportedLocale:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUFoundInEventClassificationResult.isSupportedLocale.setter(a3);
}

- (NSNumber)isHumanSender
{
  v2 = DUFoundInEventClassificationResult.isHumanSender.getter();
  return (NSNumber *)v2;
}

- (void)setIsHumanSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUFoundInEventClassificationResult.isHumanSender.setter(a3);
}

- (NSNumber)isHumanHeaders
{
  v2 = DUFoundInEventClassificationResult.isHumanHeaders.getter();
  return (NSNumber *)v2;
}

- (void)setIsHumanHeaders:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUFoundInEventClassificationResult.isHumanHeaders.setter(a3);
}

- (NSNumber)containsDataDetectors
{
  v2 = DUFoundInEventClassificationResult.containsDataDetectors.getter();
  return (NSNumber *)v2;
}

- (void)setContainsDataDetectors:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUFoundInEventClassificationResult.containsDataDetectors.setter(a3);
}

- (NSNumber)isClassifiedAsEvent
{
  v2 = DUFoundInEventClassificationResult.isClassifiedAsEvent.getter();
  return (NSNumber *)v2;
}

- (void)setIsClassifiedAsEvent:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUFoundInEventClassificationResult.isClassifiedAsEvent.setter(a3);
}

- (NSNumber)textLengthPass
{
  v2 = DUFoundInEventClassificationResult.textLengthPass.getter();
  return (NSNumber *)v2;
}

- (void)setTextLengthPass:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUFoundInEventClassificationResult.textLengthPass.setter(a3);
}

- (NSNumber)isEventCandidate
{
  v2 = DUFoundInEventClassificationResult.isEventCandidate.getter();
  return (NSNumber *)v2;
}

- (void)setIsEventCandidate:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUFoundInEventClassificationResult.isEventCandidate.setter(a3);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  DUFoundInEventClassificationResult.copy(with:)(v6);

  sub_2367CBEE8(v6, (uint64_t)v6[3]);
  v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (id)serializedData
{
  v2 = self;
  id v3 = sub_23680385C();

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DUFoundInEventClassificationResult.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding34DUFoundInEventClassificationResult)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding34DUFoundInEventClassificationResult *)DUFoundInEventClassificationResult.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding34DUFoundInEventClassificationResult)init
{
  return (_TtC21DocumentUnderstanding34DUFoundInEventClassificationResult *)DUFoundInEventClassificationResult.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding34DUFoundInEventClassificationResult_isSupportedLocale));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding34DUFoundInEventClassificationResult_isHumanSender));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding34DUFoundInEventClassificationResult_isHumanHeaders));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding34DUFoundInEventClassificationResult_containsDataDetectors));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding34DUFoundInEventClassificationResult_isClassifiedAsEvent));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding34DUFoundInEventClassificationResult_textLengthPass));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21DocumentUnderstanding34DUFoundInEventClassificationResult_isEventCandidate);
}

@end