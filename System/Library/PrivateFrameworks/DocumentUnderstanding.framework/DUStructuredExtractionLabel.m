@interface DUStructuredExtractionLabel
- (NSString)labelName;
- (_TtC21DocumentUnderstanding27DUStructuredExtractionLabel)init;
- (_TtC21DocumentUnderstanding27DUStructuredExtractionLabel)initWithCoder:(id)a3;
- (double)confidenceScore;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidenceScore:(double)a3;
- (void)setLabelName:(id)a3;
@end

@implementation DUStructuredExtractionLabel

- (NSString)labelName
{
  return (NSString *)sub_2368CB164((uint64_t)self, (uint64_t)a2, (void (*)(void))DUStructuredExtractionLabel.labelName.getter);
}

- (void)setLabelName:(id)a3
{
}

- (double)confidenceScore
{
  return DUStructuredExtractionLabel.confidenceScore.getter();
}

- (void)setConfidenceScore:(double)a3
{
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_2368CEC58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))DUStructuredExtractionLabel.copy(with:));
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  DUStructuredExtractionLabel.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding27DUStructuredExtractionLabel)initWithCoder:(id)a3
{
  id v3 = a3;
  DUStructuredExtractionLabel.init(coder:)();
  return result;
}

- (_TtC21DocumentUnderstanding27DUStructuredExtractionLabel)init
{
  return (_TtC21DocumentUnderstanding27DUStructuredExtractionLabel *)DUStructuredExtractionLabel.init()();
}

- (void).cxx_destruct
{
}

@end