@interface ChicletCell
- (BOOL)isHighlighted;
- (UILabel)accessibilityTitleLabel;
- (UILabel)titleLabel;
- (UIView)accessibilityMetadataContainer;
- (UIView)container;
- (UIView)iconContainer;
- (UIView)metadataContainer;
- (_TtC29GameCenterMatchmakerExtension11ChicletCell)initWithCoder:(id)a3;
- (_TtC29GameCenterMatchmakerExtension11ChicletCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setContainer:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIconContainer:(id)a3;
- (void)setMetadataContainer:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ChicletCell

- (UIView)container
{
  v2 = (void *)sub_10000AB48();

  return (UIView *)v2;
}

- (void)setContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000ABB0();
}

- (UIView)metadataContainer
{
  v2 = (void *)sub_10000AC28();

  return (UIView *)v2;
}

- (void)setMetadataContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000AC90();
}

- (UIView)iconContainer
{
  v2 = (void *)sub_10000AD08();

  return (UIView *)v2;
}

- (void)setIconContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000AD70();
}

- (UILabel)titleLabel
{
  v2 = (void *)sub_10000ADE8();

  return (UILabel *)v2;
}

- (void)setTitleLabel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000AE50();
}

- (void)awakeFromNib
{
  v2 = self;
  sub_10000AEAC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10000B580((uint64_t)a3);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10000C91C((uint64_t)v6, v7);
}

- (BOOL)isHighlighted
{
  v2 = self;
  unsigned __int8 v3 = sub_10000CCFC();

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  id v4 = self;
  sub_10000CD84(a3);
}

- (UILabel)accessibilityTitleLabel
{
  v2 = (void *)sub_10000CF38();

  return (UILabel *)v2;
}

- (UIView)accessibilityMetadataContainer
{
  v2 = (void *)sub_10000CF78();

  return (UIView *)v2;
}

- (_TtC29GameCenterMatchmakerExtension11ChicletCell)initWithFrame:(CGRect)a3
{
  return (_TtC29GameCenterMatchmakerExtension11ChicletCell *)sub_10000CF88();
}

- (_TtC29GameCenterMatchmakerExtension11ChicletCell)initWithCoder:(id)a3
{
  return (_TtC29GameCenterMatchmakerExtension11ChicletCell *)sub_10000D108(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_vibrancyView));

  swift_bridgeObjectRelease();
}

@end