@interface ComposeReviewDelegate
- (_TtC18ASMessagesProviderP33_8593DF36867E5E4F61FE17D5FBD3E0CF21ComposeReviewDelegate)init;
- (void)reviewComposeViewController:(id)a3 didFinishSubmitting:(BOOL)a4;
@end

@implementation ComposeReviewDelegate

- (void)reviewComposeViewController:(id)a3 didFinishSubmitting:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  sub_46ADD0(a3, a4);
}

- (_TtC18ASMessagesProviderP33_8593DF36867E5E4F61FE17D5FBD3E0CF21ComposeReviewDelegate)init
{
  result = (_TtC18ASMessagesProviderP33_8593DF36867E5E4F61FE17D5FBD3E0CF21ComposeReviewDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(char **)((char *)&self->super.isa
                + OBJC_IVAR____TtC18ASMessagesProviderP33_8593DF36867E5E4F61FE17D5FBD3E0CF21ComposeReviewDelegate_selfReference);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18ASMessagesProviderP33_8593DF36867E5E4F61FE17D5FBD3E0CF21ComposeReviewDelegate_selfReference) = 0;
  if (v3)
  {
    while (1)
    {
      v6 = v3;
      if (!swift_isUniquelyReferenced()) {
        break;
      }
      v4 = *(char **)&v6[OBJC_IVAR____TtC18ASMessagesProviderP33_8593DF36867E5E4F61FE17D5FBD3E0CF21ComposeReviewDelegate_selfReference];
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