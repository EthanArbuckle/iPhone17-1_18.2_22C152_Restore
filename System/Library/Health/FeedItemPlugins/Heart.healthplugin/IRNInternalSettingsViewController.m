@interface IRNInternalSettingsViewController
- (_TtC5Heart33IRNInternalSettingsViewController)initWithHealthStore:(id)a3;
- (id)makeFeatureStateViewControllerForFeatureIdentifier:(id)a3;
@end

@implementation IRNInternalSettingsViewController

- (id)makeFeatureStateViewControllerForFeatureIdentifier:(id)a3
{
  id v4 = objc_allocWithZone((Class)sub_240BB5490());
  id v5 = a3;
  v6 = (void *)sub_240BB5480();

  return v6;
}

- (_TtC5Heart33IRNInternalSettingsViewController)initWithHealthStore:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IRNInternalSettingsViewController();
  return [(WDAtrialFibrillationInternalSettingsViewController *)&v5 initWithHealthStore:a3];
}

@end