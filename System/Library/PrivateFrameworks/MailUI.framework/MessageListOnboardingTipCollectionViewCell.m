@interface MessageListOnboardingTipCollectionViewCell
- (UIButton)cancelButton;
- (UIButton)learnMoreButton;
- (UIImageView)appBadgeImageView;
- (UILabel)infoLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)horizontalStackView;
- (UIStackView)verticalStackView;
- (UIView)separatorView;
- (UIView)tipContentView;
- (_TtC6MailUI42MessageListOnboardingTipCollectionViewCell)initWithCoder:(id)a3;
- (_TtC6MailUI42MessageListOnboardingTipCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)attributedStringWithImageWithReplacingKeyword:(id)a3 inLocalizedString:(id)a4 imageName:(id)a5 bucketColor:(id)a6;
- (void)configureForBucket:(int64_t)a3;
- (void)setAppBadgeImageView:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setHorizontalStackView:(id)a3;
- (void)setInfoLabel:(id)a3;
- (void)setLearnMoreButton:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTipContentView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setVerticalStackView:(id)a3;
@end

@implementation MessageListOnboardingTipCollectionViewCell

- (UILabel)titleLabel
{
  v2 = self;
  id v5 = sub_1DDE23F24();

  return (UILabel *)v5;
}

- (void)setTitleLabel:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DDE23FDC(a3);
}

- (UILabel)subtitleLabel
{
  v2 = self;
  id v5 = sub_1DDE240BC();

  return (UILabel *)v5;
}

- (void)setSubtitleLabel:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DDE24174(a3);
}

- (UIView)tipContentView
{
  v2 = self;
  id v5 = sub_1DDE24254();

  return (UIView *)v5;
}

- (void)setTipContentView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DDE2430C(a3);
}

- (UIStackView)horizontalStackView
{
  v2 = self;
  id v5 = sub_1DDE243EC();

  return (UIStackView *)v5;
}

- (void)setHorizontalStackView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DDE244A4(a3);
}

- (UIStackView)verticalStackView
{
  v2 = self;
  id v5 = sub_1DDE24584();

  return (UIStackView *)v5;
}

- (void)setVerticalStackView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DDE2463C(a3);
}

- (UILabel)infoLabel
{
  v2 = self;
  id v5 = sub_1DDE2471C();

  return (UILabel *)v5;
}

- (void)setInfoLabel:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DDE24864(a3);
}

- (UIImageView)appBadgeImageView
{
  v2 = self;
  id v5 = sub_1DDE24A08();

  return (UIImageView *)v5;
}

- (void)setAppBadgeImageView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DDE24B50(a3);
}

- (UIView)separatorView
{
  v2 = self;
  id v5 = sub_1DDE24EE0();

  return (UIView *)v5;
}

- (void)setSeparatorView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DDE25028(a3);
}

- (UIButton)learnMoreButton
{
  v2 = self;
  id v5 = MessageListOnboardingTipCollectionViewCell.learnMoreButton.getter();

  return (UIButton *)v5;
}

- (void)setLearnMoreButton:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MessageListOnboardingTipCollectionViewCell.learnMoreButton.setter(a3);
}

- (UIButton)cancelButton
{
  v2 = self;
  id v5 = MessageListOnboardingTipCollectionViewCell.cancelButton.getter();

  return (UIButton *)v5;
}

- (void)setCancelButton:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MessageListOnboardingTipCollectionViewCell.cancelButton.setter(a3);
}

- (_TtC6MailUI42MessageListOnboardingTipCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6MailUI42MessageListOnboardingTipCollectionViewCell *)sub_1DDE26678(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6MailUI42MessageListOnboardingTipCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC6MailUI42MessageListOnboardingTipCollectionViewCell *)sub_1DDE29068();
}

- (void)configureForBucket:(int64_t)a3
{
  id v3 = self;
  MessageListOnboardingTipCollectionViewCell.configure(forBucket:)(a3);
}

- (id)attributedStringWithImageWithReplacingKeyword:(id)a3 inLocalizedString:(id)a4 imageName:(id)a5 bucketColor:(id)a6
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  v11 = self;
  uint64_t v18 = sub_1DDEEEB78();
  uint64_t v22 = v12;
  uint64_t v17 = sub_1DDEEEB78();
  uint64_t v20 = v13;
  uint64_t v14 = sub_1DDEEEB78();
  id v26 = sub_1DDE2C51C(v18, v22, v17, v20, v14, v15, a6);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v26;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI42MessageListOnboardingTipCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI42MessageListOnboardingTipCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI42MessageListOnboardingTipCollectionViewCell_tipContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI42MessageListOnboardingTipCollectionViewCell_horizontalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI42MessageListOnboardingTipCollectionViewCell_verticalStackView));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI42MessageListOnboardingTipCollectionViewCell____lazy_storage___infoLabel));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI42MessageListOnboardingTipCollectionViewCell____lazy_storage___appBadgeImageView));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI42MessageListOnboardingTipCollectionViewCell____lazy_storage___separatorView));
  sub_1DDE25684((uint64_t)self+ OBJC_IVAR____TtC6MailUI42MessageListOnboardingTipCollectionViewCell____lazy_storage___titleTextAttributesTransformer);
  sub_1DDD31B20((id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI42MessageListOnboardingTipCollectionViewCell____lazy_storage___learnMoreButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI42MessageListOnboardingTipCollectionViewCell_cancelButton));
  sub_1DDD31430();
}

@end