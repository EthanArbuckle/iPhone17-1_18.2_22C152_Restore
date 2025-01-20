@interface HRELightsAllOffContextActionTemplate
- (HRELightsAllOffContextActionTemplate)init;
- (id)_lazy_actionMap;
- (id)extraInvolvedTypes;
@end

@implementation HRELightsAllOffContextActionTemplate

- (HRELightsAllOffContextActionTemplate)init
{
  v6.receiver = self;
  v6.super_class = (Class)HRELightsAllOffContextActionTemplate;
  v2 = [(HRETemplate *)&v6 init];
  if (v2)
  {
    v3 = _HRELocalizedStringWithDefaultValue(@"HREContextActionNameLightsAllOff", @"HREContextActionNameLightsAllOff", 1);
    [(HREContextActionTemplate *)v2 setContextActionName:v3];

    v4 = (void *)[objc_alloc(MEMORY[0x263F47B68]) initWithSystemImageNamed:@"lightbulb.slash"];
    [(HREContextActionTemplate *)v2 setIconDescriptor:v4];

    [(HRETemplate *)v2 setIdentifier:@"lightsAllOffContextAction"];
    [(HRETemplate *)v2 setSortingPriority:4.0];
  }
  return v2;
}

- (id)extraInvolvedTypes
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = *MEMORY[0x263F0D780];
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)_lazy_actionMap
{
  v9[1] = *MEMORY[0x263EF8340];
  v8 = @"HREServiceTypeAll";
  uint64_t v6 = *MEMORY[0x263F0C328];
  uint64_t v7 = MEMORY[0x263EFFA80];
  v2 = [NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v3 = +[HRECharacteristicActionMap characteristicActionMap:v2];
  v9[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v4;
}

@end