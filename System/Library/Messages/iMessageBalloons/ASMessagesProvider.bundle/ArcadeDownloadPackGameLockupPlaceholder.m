@interface ArcadeDownloadPackGameLockupPlaceholder
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider39ArcadeDownloadPackGameLockupPlaceholder)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider39ArcadeDownloadPackGameLockupPlaceholder)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeDownloadPackGameLockupPlaceholder

- (_TtC18ASMessagesProvider39ArcadeDownloadPackGameLockupPlaceholder)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider39ArcadeDownloadPackGameLockupPlaceholder *)sub_F13A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider39ArcadeDownloadPackGameLockupPlaceholder)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_F212C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  id v5 = [(ArcadeDownloadPackGameLockupPlaceholder *)v4 traitCollection];
  if (qword_94D728 != -1) {
    swift_once();
  }
  sub_CC1D8((uint64_t)&xmmword_9AE520, (uint64_t)v12);
  if (qword_94D730 != -1) {
    swift_once();
  }
  id v6 = [(ArcadeDownloadPackGameLockupPlaceholder *)v4 traitCollection];
  [(ArcadeDownloadPackGameLockupPlaceholder *)v4 layoutMargins];
  double v7 = sub_CBF70((uint64_t)v12, (uint64_t)&xmmword_9AE680, v6, width);
  double v9 = v8;

  sub_CC234((uint64_t)v12);
  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(ArcadeDownloadPackGameLockupPlaceholder *)&v5 layoutSubviews];
  sub_F15E8(v4);
  sub_FB9C(v4, v4[3]);
  sub_772580();
  id v3 = [v2 traitCollection];
  sub_77B970();

  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider39ArcadeDownloadPackGameLockupPlaceholder_iconPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider39ArcadeDownloadPackGameLockupPlaceholder_headingPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider39ArcadeDownloadPackGameLockupPlaceholder_titlePlaceholder));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider39ArcadeDownloadPackGameLockupPlaceholder_offerButtonPlaceholder);
}

@end