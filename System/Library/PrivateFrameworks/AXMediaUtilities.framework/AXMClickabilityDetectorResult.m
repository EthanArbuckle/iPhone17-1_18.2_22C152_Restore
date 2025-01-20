@interface AXMClickabilityDetectorResult
- (CGRect)resultBox;
- (_TtC16AXMediaUtilities29AXMClickabilityDetectorResult)init;
- (double)resultConfidence;
- (id)resultLabelName;
- (int64_t)resultLabel;
@end

@implementation AXMClickabilityDetectorResult

- (CGRect)resultBox
{
  double v2 = sub_1B588F39C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int64_t)resultLabel
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_label);
}

- (id)resultLabelName
{
  return sub_1B588F418();
}

- (double)resultConfidence
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_confidence);
}

- (_TtC16AXMediaUtilities29AXMClickabilityDetectorResult)init
{
  CGRect result = (_TtC16AXMediaUtilities29AXMClickabilityDetectorResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end