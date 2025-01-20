@interface _HearingAidInternalViewController
- (_TtC21HearingModeSettingsUI33_HearingAidInternalViewController)init;
- (id)makeMediaAssistViewControllerWithAddress:(id)a3 audiogramSample:(id)a4;
@end

@implementation _HearingAidInternalViewController

- (id)makeMediaAssistViewControllerWithAddress:(id)a3 audiogramSample:(id)a4
{
  sub_25126C488();
  id v6 = objc_allocWithZone((Class)sub_25126BD28());
  id v7 = a4;
  v8 = self;
  swift_bridgeObjectRetain();
  v9 = (void *)sub_25126BD18();

  swift_bridgeObjectRelease();
  return v9;
}

- (_TtC21HearingModeSettingsUI33_HearingAidInternalViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _HearingAidInternalViewController();
  return [(_HearingAidInternalViewController *)&v3 init];
}

@end