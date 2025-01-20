@interface ImageQualityMetrics
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)debugDescription;
- (_TtC13CoreIDVShared19ImageQualityMetrics)init;
- (_TtC13CoreIDVShared19ImageQualityMetrics)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ImageQualityMetrics

+ (BOOL)supportsSecureCoding
{
  return byte_1EA843440;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EA843440 = a3;
}

- (_TtC13CoreIDVShared19ImageQualityMetrics)init
{
  return (_TtC13CoreIDVShared19ImageQualityMetrics *)ImageQualityMetrics.init()();
}

- (_TtC13CoreIDVShared19ImageQualityMetrics)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC13CoreIDVShared19ImageQualityMetrics *)sub_1D78D9BFC();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D78D41A4(v4);
}

- (NSString)debugDescription
{
  return (NSString *)sub_1D78D96A0(self, (uint64_t)a2, (void (*)(void))sub_1D78D6814);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CoreIDVShared19ImageQualityMetrics_fuzzyMatchAssessment));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end