@interface StarRow
- (NSString)maximumContentSizeCategory;
- (NSString)minimumContentSizeCategory;
- (_TtC20ProductPageExtensionP33_06779790DFC391F4528ECB93682635147StarRow)initWithCoder:(id)a3;
- (_TtC20ProductPageExtensionP33_06779790DFC391F4528ECB93682635147StarRow)initWithFrame:(CGRect)a3;
- (void)setMaximumContentSizeCategory:(id)a3;
- (void)setMinimumContentSizeCategory:(id)a3;
@end

@implementation StarRow

- (NSString)maximumContentSizeCategory
{
  return (NSString *)sub_10006C950(self, (uint64_t)a2, (SEL *)&selRef_maximumContentSizeCategory);
}

- (void)setMaximumContentSizeCategory:(id)a3
{
}

- (NSString)minimumContentSizeCategory
{
  return (NSString *)sub_10006C950(self, (uint64_t)a2, (SEL *)&selRef_minimumContentSizeCategory);
}

- (void)setMinimumContentSizeCategory:(id)a3
{
}

- (_TtC20ProductPageExtensionP33_06779790DFC391F4528ECB93682635147StarRow)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10006DA94();
}

- (_TtC20ProductPageExtensionP33_06779790DFC391F4528ECB93682635147StarRow)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_06779790DFC391F4528ECB93682635147StarRow_starColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_06779790DFC391F4528ECB93682635147StarRow_starImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtensionP33_06779790DFC391F4528ECB93682635147StarRow_starLayer);
}

@end