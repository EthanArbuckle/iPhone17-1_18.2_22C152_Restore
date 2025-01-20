@interface ComposeReviewDelegate
- (_TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF121ComposeReviewDelegate)init;
- (void)reviewComposeViewController:(id)a3 didFinishSubmitting:(BOOL)a4;
@end

@implementation ComposeReviewDelegate

- (void)reviewComposeViewController:(id)a3 didFinishSubmitting:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  sub_10048673C(a3, a4);
}

- (_TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF121ComposeReviewDelegate)init
{
  result = (_TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF121ComposeReviewDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(char **)((char *)&self->super.isa
                + OBJC_IVAR____TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF121ComposeReviewDelegate_selfReference);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF121ComposeReviewDelegate_selfReference) = 0;
  if (v3)
  {
    while (1)
    {
      v6 = v3;
      if (!swift_isUniquelyReferenced()) {
        break;
      }
      v4 = *(char **)&v6[OBJC_IVAR____TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF121ComposeReviewDelegate_selfReference];
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