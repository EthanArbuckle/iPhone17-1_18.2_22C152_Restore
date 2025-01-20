@interface SettingsHeaderView
- (_TtC22DepthCompanionSettings18SettingsHeaderView)initWithCoder:(id)a3;
- (_TtC22DepthCompanionSettings18SettingsHeaderView)initWithFrame:(CGRect)a3;
- (_TtC22DepthCompanionSettings18SettingsHeaderView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3;
@end

@implementation SettingsHeaderView

- (_TtC22DepthCompanionSettings18SettingsHeaderView)initWithSpecifier:(id)a3
{
  return (_TtC22DepthCompanionSettings18SettingsHeaderView *)SettingsHeaderView.init(specifier:)(a3);
}

- (_TtC22DepthCompanionSettings18SettingsHeaderView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SettingsHeaderView();
  return [(SettingsHeaderView *)&v5 initWithCoder:a3];
}

- (_TtC22DepthCompanionSettings18SettingsHeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC22DepthCompanionSettings18SettingsHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (double)preferredHeightForWidth:(double)a3
{
  v4 = self;
  [(SettingsHeaderView *)v4 directionalLayoutMargins];
  double v6 = a3 - v5;
  [(SettingsHeaderView *)v4 directionalLayoutMargins];
  double v8 = v6 - v7;
  LODWORD(v9) = 1148846080;
  LODWORD(v7) = 1112014848;
  -[SettingsHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v4, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v8, 0.0, v9, v7);
  double v11 = v10;

  return v11;
}

@end