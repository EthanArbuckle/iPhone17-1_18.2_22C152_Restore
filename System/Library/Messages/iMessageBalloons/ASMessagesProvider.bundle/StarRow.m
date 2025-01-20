@interface StarRow
- (NSString)maximumContentSizeCategory;
- (NSString)minimumContentSizeCategory;
- (_TtC18ASMessagesProviderP33_DC70C8EA8944F731B495ED3266C3CFFA7StarRow)initWithCoder:(id)a3;
- (_TtC18ASMessagesProviderP33_DC70C8EA8944F731B495ED3266C3CFFA7StarRow)initWithFrame:(CGRect)a3;
- (void)setMaximumContentSizeCategory:(id)a3;
- (void)setMinimumContentSizeCategory:(id)a3;
@end

@implementation StarRow

- (NSString)maximumContentSizeCategory
{
  return (NSString *)sub_44A37C(self, (uint64_t)a2, (SEL *)&selRef_maximumContentSizeCategory);
}

- (void)setMaximumContentSizeCategory:(id)a3
{
}

- (NSString)minimumContentSizeCategory
{
  return (NSString *)sub_44A37C(self, (uint64_t)a2, (SEL *)&selRef_minimumContentSizeCategory);
}

- (void)setMinimumContentSizeCategory:(id)a3
{
}

- (_TtC18ASMessagesProviderP33_DC70C8EA8944F731B495ED3266C3CFFA7StarRow)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_44B468();
}

- (_TtC18ASMessagesProviderP33_DC70C8EA8944F731B495ED3266C3CFFA7StarRow)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProviderP33_DC70C8EA8944F731B495ED3266C3CFFA7StarRow_starColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProviderP33_DC70C8EA8944F731B495ED3266C3CFFA7StarRow_starImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProviderP33_DC70C8EA8944F731B495ED3266C3CFFA7StarRow_starLayer);
}

@end