@interface FuzzyMatchAssessment
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)debugDescription;
- (_TtC13CoreIDVShared20FuzzyMatchAssessment)init;
- (_TtC13CoreIDVShared20FuzzyMatchAssessment)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FuzzyMatchAssessment

+ (BOOL)supportsSecureCoding
{
  return byte_1EA843442;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EA843442 = a3;
}

- (_TtC13CoreIDVShared20FuzzyMatchAssessment)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC13CoreIDVShared20FuzzyMatchAssessment *)sub_1D78DB6F4();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D78D92B8(v4);
}

- (NSString)debugDescription
{
  return (NSString *)sub_1D78D96A0(self, (uint64_t)a2, (void (*)(void))sub_1D78D9710);
}

- (_TtC13CoreIDVShared20FuzzyMatchAssessment)init
{
  result = (_TtC13CoreIDVShared20FuzzyMatchAssessment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end