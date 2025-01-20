@interface ComposeReviewDelegate
- (_TtC22SubscribePageExtensionP33_17E5165BDAD277E02C837297BEA7454621ComposeReviewDelegate)init;
- (void)reviewComposeViewController:(id)a3 didFinishSubmitting:(BOOL)a4;
@end

@implementation ComposeReviewDelegate

- (void)reviewComposeViewController:(id)a3 didFinishSubmitting:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  sub_10047ACC8(a3, a4);
}

- (_TtC22SubscribePageExtensionP33_17E5165BDAD277E02C837297BEA7454621ComposeReviewDelegate)init
{
  result = (_TtC22SubscribePageExtensionP33_17E5165BDAD277E02C837297BEA7454621ComposeReviewDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(char **)((char *)&self->super.isa
                + OBJC_IVAR____TtC22SubscribePageExtensionP33_17E5165BDAD277E02C837297BEA7454621ComposeReviewDelegate_selfReference);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_17E5165BDAD277E02C837297BEA7454621ComposeReviewDelegate_selfReference) = 0;
  if (v3)
  {
    while (1)
    {
      v6 = v3;
      if (!swift_isUniquelyReferenced()) {
        break;
      }
      v4 = *(char **)&v6[OBJC_IVAR____TtC22SubscribePageExtensionP33_17E5165BDAD277E02C837297BEA7454621ComposeReviewDelegate_selfReference];
      v5 = v4;

      v3 = v4;
      if (!v4) {
        goto LABEL_6;
      }
    }
    v3 = v6;
  }
LABEL_6:
}

@end