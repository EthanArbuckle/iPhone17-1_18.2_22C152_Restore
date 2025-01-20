@interface ArcadeDownloadPackGameLockupPlaceholder
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholder)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholder)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeDownloadPackGameLockupPlaceholder

- (_TtC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholder)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholder *)sub_1006A8C38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholder)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006A9964();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  id v5 = [(ArcadeDownloadPackGameLockupPlaceholder *)v4 traitCollection];
  if (qword_100930D08 != -1) {
    swift_once();
  }
  sub_10006AA28((uint64_t)&xmmword_100991FD0, (uint64_t)v12);
  if (qword_100930D10 != -1) {
    swift_once();
  }
  id v6 = [(ArcadeDownloadPackGameLockupPlaceholder *)v4 traitCollection];
  [(ArcadeDownloadPackGameLockupPlaceholder *)v4 layoutMargins];
  double v7 = sub_100319C1C((uint64_t)v12, (uint64_t)&xmmword_100992130, v6, width);
  double v9 = v8;

  sub_10006AA84((uint64_t)v12);
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
  sub_1006A8E78(v4);
  sub_10000FE94(v4, v4[3]);
  sub_10075C580();
  id v3 = [v2 traitCollection];
  sub_100765900();

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholder_iconPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholder_headingPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholder_titlePlaceholder));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholder_offerButtonPlaceholder);
}

@end