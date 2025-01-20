@interface ExpandableTextView.MeasurementsCacheKey
- (BOOL)isEqual:(id)a3;
- (_TtCC18ASMessagesProvider18ExpandableTextViewP33_22EA8C57047A2D7BD3210E46FB89642920MeasurementsCacheKey)init;
- (int64_t)hash;
@end

@implementation ExpandableTextView.MeasurementsCacheKey

- (BOOL)isEqual:(id)a3
{
  return sub_1A37C8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_1A31DC);
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = sub_1A3404();

  return v3;
}

- (_TtCC18ASMessagesProvider18ExpandableTextViewP33_22EA8C57047A2D7BD3210E46FB89642920MeasurementsCacheKey)init
{
  result = (_TtCC18ASMessagesProvider18ExpandableTextViewP33_22EA8C57047A2D7BD3210E46FB89642920MeasurementsCacheKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC18ASMessagesProvider18ExpandableTextViewP33_22EA8C57047A2D7BD3210E46FB89642920MeasurementsCacheKey_traitCollection));
  Swift::Int v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC18ASMessagesProvider18ExpandableTextViewP33_22EA8C57047A2D7BD3210E46FB89642920MeasurementsCacheKey_attributedText);
}

@end