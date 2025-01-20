@interface NPHCSCellularUsageHeaderView
- (UIButton)sortToggle;
- (UILabel)sortingTypeLabel;
- (UILabel)titleLabel;
- (UIStackView)sortControlsStackView;
- (_TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView)initWithCoder:(id)a3;
- (_TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView)initWithReuseIdentifier:(id)a3;
- (void)configureContents;
- (void)setSortControlsStackView:(id)a3;
- (void)setSortToggle:(id)a3;
- (void)setSortingTypeLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitles;
@end

@implementation NPHCSCellularUsageHeaderView

- (UILabel)titleLabel
{
  id v2 = sub_10634();

  return (UILabel *)v2;
}

- (void)setTitleLabel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1069C((uint64_t)v4);
}

- (UIStackView)sortControlsStackView
{
  id v2 = sub_106DC();

  return (UIStackView *)v2;
}

- (void)setSortControlsStackView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10744((uint64_t)v4);
}

- (UILabel)sortingTypeLabel
{
  id v2 = sub_10784();

  return (UILabel *)v2;
}

- (void)setSortingTypeLabel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_107EC((uint64_t)v4);
}

- (UIButton)sortToggle
{
  id v2 = sub_1082C();

  return (UIButton *)v2;
}

- (void)setSortToggle:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10894((uint64_t)v4);
}

- (_TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_12660();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView *)sub_108A0(v3, v4);
}

- (_TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView)initWithCoder:(id)a3
{
}

- (void)configureContents
{
  id v2 = self;
  sub_10A74();
}

- (void)setTitles
{
  id v2 = self;
  sub_11390();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortControlsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortingTypeLabel));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortToggle);
}

@end