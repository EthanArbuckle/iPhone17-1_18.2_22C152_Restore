@interface PreorderDisclaimerCollectionViewCell
- (_TtC18ASMessagesProvider36PreorderDisclaimerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider36PreorderDisclaimerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PreorderDisclaimerCollectionViewCell

- (_TtC18ASMessagesProvider36PreorderDisclaimerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider36PreorderDisclaimerCollectionViewCell *)sub_8D334(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider36PreorderDisclaimerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_8DAC8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_8D770();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36PreorderDisclaimerCollectionViewCell_disclaimerLabel));
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider36PreorderDisclaimerCollectionViewCell_itemLayoutContext;

  sub_411F8((uint64_t)v3);
}

@end