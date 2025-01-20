@interface ExpandableTextView.MeasurementsCacheKey
- (BOOL)isEqual:(id)a3;
- (_TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey)init;
- (int64_t)hash;
@end

@implementation ExpandableTextView.MeasurementsCacheKey

- (BOOL)isEqual:(id)a3
{
  return sub_10074C54C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_10074BF60);
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = sub_10074C188();

  return v3;
}

- (_TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey)init
{
  result = (_TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_traitCollection));
  Swift::Int v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_attributedText);
}

@end