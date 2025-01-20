@interface HUEnergyIndicatorAccessoryViewWrapper
+ (id)createEnergyIndicatorViewWithHome:(id)a3;
+ (void)updateWithEnergyIndicatorView:(id)a3 with:(id)a4;
- (HUEnergyIndicatorAccessoryViewWrapper)init;
@end

@implementation HUEnergyIndicatorAccessoryViewWrapper

+ (id)createEnergyIndicatorViewWithHome:(id)a3
{
  id v4 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EBA46708));
  id v5 = a3;
  v6 = (void *)sub_1BE9C3E08();

  return v6;
}

+ (void)updateWithEnergyIndicatorView:(id)a3 with:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  _s6HomeUI35EnergyIndicatorAccessoryViewWrapperC6update06energydF04withySo16UIViewControllerC_So6HMHomeCtFZ_0(v5, v6);
}

- (HUEnergyIndicatorAccessoryViewWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EnergyIndicatorAccessoryViewWrapper();
  return [(HUEnergyIndicatorAccessoryViewWrapper *)&v3 init];
}

@end