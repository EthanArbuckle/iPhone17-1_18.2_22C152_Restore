@interface ArcadeDownloadPackGameLockupPlaceholder
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholder)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholder)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeDownloadPackGameLockupPlaceholder

- (_TtC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholder)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholder *)sub_100342594(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholder)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10034336C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  id v5 = [(ArcadeDownloadPackGameLockupPlaceholder *)v4 traitCollection];
  if (qword_100949E78 != -1) {
    swift_once();
  }
  sub_1002840C0((uint64_t)&xmmword_1009ADCE0, (uint64_t)v12);
  if (qword_100949E80 != -1) {
    swift_once();
  }
  id v6 = [(ArcadeDownloadPackGameLockupPlaceholder *)v4 traitCollection];
  [(ArcadeDownloadPackGameLockupPlaceholder *)v4 layoutMargins];
  double v7 = sub_100659FE8((uint64_t)v12, (uint64_t)&xmmword_1009ADE40, v6, width);
  double v9 = v8;

  sub_10028411C((uint64_t)v12);
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
  sub_1003427D4(v4);
  sub_10000FA3C(v4, v4[3]);
  sub_100770A80();
  id v3 = [v2 traitCollection];
  sub_100779F60();

  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholder_iconPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholder_headingPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholder_titlePlaceholder));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholder_offerButtonPlaceholder);
}

@end