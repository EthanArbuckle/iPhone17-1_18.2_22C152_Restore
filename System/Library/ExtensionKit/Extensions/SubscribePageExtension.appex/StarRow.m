@interface StarRow
- (NSString)maximumContentSizeCategory;
- (NSString)minimumContentSizeCategory;
- (_TtC22SubscribePageExtensionP33_2C6014D15F02DB8C76D5CE42FDC095AC7StarRow)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtensionP33_2C6014D15F02DB8C76D5CE42FDC095AC7StarRow)initWithFrame:(CGRect)a3;
- (void)setMaximumContentSizeCategory:(id)a3;
- (void)setMinimumContentSizeCategory:(id)a3;
@end

@implementation StarRow

- (NSString)maximumContentSizeCategory
{
  return (NSString *)sub_10050EFA4(self, (uint64_t)a2, (SEL *)&selRef_maximumContentSizeCategory);
}

- (void)setMaximumContentSizeCategory:(id)a3
{
}

- (NSString)minimumContentSizeCategory
{
  return (NSString *)sub_10050EFA4(self, (uint64_t)a2, (SEL *)&selRef_minimumContentSizeCategory);
}

- (void)setMinimumContentSizeCategory:(id)a3
{
}

- (_TtC22SubscribePageExtensionP33_2C6014D15F02DB8C76D5CE42FDC095AC7StarRow)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005100F4();
}

- (_TtC22SubscribePageExtensionP33_2C6014D15F02DB8C76D5CE42FDC095AC7StarRow)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_2C6014D15F02DB8C76D5CE42FDC095AC7StarRow_starColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_2C6014D15F02DB8C76D5CE42FDC095AC7StarRow_starImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtensionP33_2C6014D15F02DB8C76D5CE42FDC095AC7StarRow_starLayer);
}

@end