@interface ChicletMetadata
- (NSLayoutConstraint)subtitleToBadgeTrailingConstraint;
- (UILabel)accessibilityChicletCaption;
- (UILabel)accessibilityChicletRank;
- (UILabel)accessibilityChicletSubtitle;
- (UILabel)badge;
- (UILabel)caption;
- (UILabel)rank;
- (UILabel)subtitle;
- (UIStackView)stackView;
- (UIView)badgeContainer;
- (UIVisualEffectView)vibrancyView;
- (_TtC29GameCenterMatchmakerExtension15ChicletMetadata)initWithCoder:(id)a3;
- (_TtC29GameCenterMatchmakerExtension15ChicletMetadata)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
- (void)layoutSubviews;
- (void)setBadge:(id)a3;
- (void)setBadgeContainer:(id)a3;
- (void)setCaption:(id)a3;
- (void)setRank:(id)a3;
- (void)setStackView:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleToBadgeTrailingConstraint:(id)a3;
- (void)setVibrancyView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ChicletMetadata

- (NSLayoutConstraint)subtitleToBadgeTrailingConstraint
{
  v2 = sub_100007FB0();

  return (NSLayoutConstraint *)v2;
}

- (void)setSubtitleToBadgeTrailingConstraint:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10000803C((uint64_t)a3);
}

- (UILabel)rank
{
  v2 = (void *)sub_10000807C();

  return (UILabel *)v2;
}

- (void)setRank:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000080E4();
}

- (UILabel)caption
{
  v2 = (void *)sub_10000815C();

  return (UILabel *)v2;
}

- (void)setCaption:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000081C4();
}

- (UILabel)subtitle
{
  v2 = (void *)sub_10000823C();

  return (UILabel *)v2;
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000082A4();
}

- (UILabel)badge
{
  v2 = (void *)sub_10000831C();

  return (UILabel *)v2;
}

- (void)setBadge:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100008384();
}

- (UIView)badgeContainer
{
  v2 = (void *)sub_1000083FC();

  return (UIView *)v2;
}

- (void)setBadgeContainer:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100008464();
}

- (UIStackView)stackView
{
  v2 = (void *)sub_1000084DC();

  return (UIStackView *)v2;
}

- (void)setStackView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100008544();
}

- (UIVisualEffectView)vibrancyView
{
  v2 = sub_1000085BC();

  return (UIVisualEffectView *)v2;
}

- (void)setVibrancyView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100008648((uint64_t)a3);
}

- (void)awakeFromNib
{
  v2 = self;
  sub_100008654();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000088C8();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100008A84((uint64_t)a3);
}

- (UILabel)accessibilityChicletRank
{
  v2 = (void *)sub_100009ABC();

  return (UILabel *)v2;
}

- (UILabel)accessibilityChicletCaption
{
  v2 = (void *)sub_100009AFC();

  return (UILabel *)v2;
}

- (UILabel)accessibilityChicletSubtitle
{
  v2 = (void *)sub_100009B3C();

  return (UILabel *)v2;
}

- (_TtC29GameCenterMatchmakerExtension15ChicletMetadata)initWithFrame:(CGRect)a3
{
  return (_TtC29GameCenterMatchmakerExtension15ChicletMetadata *)sub_100009B70();
}

- (_TtC29GameCenterMatchmakerExtension15ChicletMetadata)initWithCoder:(id)a3
{
  return (_TtC29GameCenterMatchmakerExtension15ChicletMetadata *)sub_100009C40(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_subtitleToBadgeTrailingConstraint));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_vibrancyView));

  swift_bridgeObjectRelease();
}

@end