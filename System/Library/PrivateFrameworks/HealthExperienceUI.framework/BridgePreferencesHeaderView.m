@interface BridgePreferencesHeaderView
- (_TtC18HealthExperienceUI27BridgePreferencesHeaderView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI27BridgePreferencesHeaderView)initWithFrame:(CGRect)a3;
- (_TtC18HealthExperienceUI27BridgePreferencesHeaderView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3;
@end

@implementation BridgePreferencesHeaderView

- (_TtC18HealthExperienceUI27BridgePreferencesHeaderView)initWithSpecifier:(id)a3
{
  return (_TtC18HealthExperienceUI27BridgePreferencesHeaderView *)BridgePreferencesHeaderView.init(specifier:)(a3);
}

- (_TtC18HealthExperienceUI27BridgePreferencesHeaderView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BridgePreferencesHeaderView();
  return [(BridgePreferencesHeaderView *)&v5 initWithCoder:a3];
}

- (_TtC18HealthExperienceUI27BridgePreferencesHeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC18HealthExperienceUI27BridgePreferencesHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (double)preferredHeightForWidth:(double)a3
{
  v4 = self;
  [(BridgePreferencesHeaderView *)v4 directionalLayoutMargins];
  double v6 = a3 - v5;
  [(BridgePreferencesHeaderView *)v4 directionalLayoutMargins];
  double v8 = v6 - v7;
  LODWORD(v9) = 1148846080;
  LODWORD(v7) = 1112014848;
  -[BridgePreferencesHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v4, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, v8, 0.0, v9, v7);
  double v11 = v10;

  return v11;
}

@end