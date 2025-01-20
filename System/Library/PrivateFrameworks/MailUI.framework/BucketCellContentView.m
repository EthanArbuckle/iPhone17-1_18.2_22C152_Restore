@interface BucketCellContentView
- (_TtC6MailUI21BucketCellContentView)initWithCoder:(id)a3;
- (_TtC6MailUI21BucketCellContentView)initWithFrame:(CGRect)a3;
@end

@implementation BucketCellContentView

- (_TtC6MailUI21BucketCellContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC6MailUI21BucketCellContentView *)BucketCellContentView.init(coder:)();
}

- (_TtC6MailUI21BucketCellContentView)initWithFrame:(CGRect)a3
{
  return (_TtC6MailUI21BucketCellContentView *)BucketCellContentView.init(frame:)();
}

- (void).cxx_destruct
{
  sub_1DDD56280((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI21BucketCellContentView_appliedConfiguration));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI21BucketCellContentView_labelCountStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI21BucketCellContentView_imageViewFontConfiguration));
}

@end