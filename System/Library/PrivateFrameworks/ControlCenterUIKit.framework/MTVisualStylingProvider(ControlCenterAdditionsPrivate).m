@interface MTVisualStylingProvider(ControlCenterAdditionsPrivate)
- (uint64_t)_controlCenterKeyLineOnLightVisualStyling;
- (uint64_t)_controlCenterPrimaryOnLightVisualStyling;
- (uint64_t)_controlCenterScrollViewDarkeningVisualStyling;
- (uint64_t)_controlCenterSecondaryOnLightVisualStyling;
@end

@implementation MTVisualStylingProvider(ControlCenterAdditionsPrivate)

- (uint64_t)_controlCenterPrimaryOnLightVisualStyling
{
  return [a1 _visualStylingForStyleNamed:@"modulePrimaryOnLight"];
}

- (uint64_t)_controlCenterSecondaryOnLightVisualStyling
{
  return [a1 _visualStylingForStyleNamed:@"moduleSecondaryOnLight"];
}

- (uint64_t)_controlCenterScrollViewDarkeningVisualStyling
{
  return [a1 _visualStylingForStyleNamed:@"moduleListTint"];
}

- (uint64_t)_controlCenterKeyLineOnLightVisualStyling
{
  return [a1 _visualStylingForStyleNamed:@"moduleRuleOnLight"];
}

@end