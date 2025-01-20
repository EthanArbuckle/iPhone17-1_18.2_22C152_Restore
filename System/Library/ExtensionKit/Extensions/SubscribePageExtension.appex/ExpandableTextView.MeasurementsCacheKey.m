@interface ExpandableTextView.MeasurementsCacheKey
- (BOOL)isEqual:(id)a3;
- (_TtCC22SubscribePageExtension18ExpandableTextViewP33_177A8550F09467BBA030D3A485389D2420MeasurementsCacheKey)init;
- (int64_t)hash;
@end

@implementation ExpandableTextView.MeasurementsCacheKey

- (BOOL)isEqual:(id)a3
{
  return sub_100275FC0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_1002759D4);
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = sub_100275BFC();

  return v3;
}

- (_TtCC22SubscribePageExtension18ExpandableTextViewP33_177A8550F09467BBA030D3A485389D2420MeasurementsCacheKey)init
{
  result = (_TtCC22SubscribePageExtension18ExpandableTextViewP33_177A8550F09467BBA030D3A485389D2420MeasurementsCacheKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22SubscribePageExtension18ExpandableTextViewP33_177A8550F09467BBA030D3A485389D2420MeasurementsCacheKey_traitCollection));
  Swift::Int v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC22SubscribePageExtension18ExpandableTextViewP33_177A8550F09467BBA030D3A485389D2420MeasurementsCacheKey_attributedText);
}

@end