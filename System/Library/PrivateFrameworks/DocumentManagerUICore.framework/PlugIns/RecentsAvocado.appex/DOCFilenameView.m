@interface DOCFilenameView
- (UITextField)textField;
- (_TtC14RecentsAvocado15DOCFilenameView)initWithCoder:(id)a3;
- (_TtC14RecentsAvocado15DOCFilenameView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
@end

@implementation DOCFilenameView

- (UITextField)textField
{
  return (UITextField *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                + OBJC_IVAR____TtC14RecentsAvocado15DOCFilenameView_textField));
}

- (_TtC14RecentsAvocado15DOCFilenameView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC14RecentsAvocado15DOCFilenameView_textFieldTextStyle) = (Class)UIFontTextStyleTitle2;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocado15DOCFilenameView_postLayoutTextFieldUpdates) = (Class)&_swiftEmptySetSingleton;
  id v4 = a3;
  v5 = UIFontTextStyleTitle2;

  result = (_TtC14RecentsAvocado15DOCFilenameView *)sub_1004CF6B0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(DOCFilenameView *)&v3 layoutSubviews];
  sub_10040DA0C();
  sub_10040DB44();
}

- (void)didMoveToWindow
{
}

- (_TtC14RecentsAvocado15DOCFilenameView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado15DOCFilenameView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado15DOCFilenameView_thumbnailView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado15DOCFilenameView_textFieldTextStyle));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado15DOCFilenameView_maxTextFieldWidthLandscapeConstraint));
  swift_bridgeObjectRelease();
}

@end