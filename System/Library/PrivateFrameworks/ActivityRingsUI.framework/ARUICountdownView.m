@interface ARUICountdownView
+ (id)countdownViewConfiguredForCompanion;
+ (id)countdownViewConfiguredForDisplayWithRingDiameter:(float)a3;
+ (id)countdownViewConfiguredForWatch;
- (id)backingTrackRingGroup;
- (id)ringGroup;
@end

@implementation ARUICountdownView

- (id)ringGroup
{
  v3 = [(ARUIRingsView *)self ringGroups];
  unint64_t v4 = [v3 count];

  if (v4 < 2)
  {
    v8.receiver = self;
    v8.super_class = (Class)ARUICountdownView;
    v6 = [(ARUIRingsView *)&v8 ringGroup];
  }
  else
  {
    v5 = [(ARUIRingsView *)self ringGroups];
    v6 = [v5 lastObject];
  }

  return v6;
}

- (id)backingTrackRingGroup
{
  v3 = [(ARUIRingsView *)self ringGroups];
  unint64_t v4 = [v3 count];

  if (v4 < 2)
  {
    v6 = 0;
  }
  else
  {
    v5 = [(ARUIRingsView *)self ringGroups];
    v6 = [v5 objectAtIndex:0];
  }

  return v6;
}

+ (id)countdownViewConfiguredForWatch
{
  v2 = +[ARUIRingGroup countdownRingGroup];
  v3 = [[ARUIRenderer alloc] initWithRenderStyle:1];
  unint64_t v4 = [[ARUIRingGroupController alloc] initWithRingGroup:v2];
  LODWORD(v5) = 1122238464;
  [(ARUIRingGroupController *)v4 setRingDiameter:v5];
  LODWORD(v6) = 9.5;
  [(ARUIRingGroupController *)v4 setRingThickness:v6];
  [(ARUIRingGroupController *)v4 setPercentage:0 ofRingAtIndex:0 animated:0.0];
  v7 = [(ARUIRingsView *)[ARUICountdownView alloc] initWithRingGroupController:v4 renderer:v3];

  return v7;
}

+ (id)countdownViewConfiguredForCompanion
{
  v11[2] = *MEMORY[0x263EF8340];
  v2 = +[ARUIRingGroup countdownRingGroup];
  v3 = [[ARUIRingGroupController alloc] initWithRingGroup:v2];
  unint64_t v4 = +[ARUIRingGroup countdownRingGroup];
  double v5 = [[ARUIRingGroupController alloc] initWithRingGroup:v4];
  double v6 = [[ARUIRenderer alloc] initWithRenderStyle:1];
  v7 = [ARUICountdownView alloc];
  v11[0] = v5;
  v11[1] = v3;
  objc_super v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  v9 = [(ARUIRingsView *)v7 initWithRingGroupControllers:v8 renderer:v6];

  return v9;
}

+ (id)countdownViewConfiguredForDisplayWithRingDiameter:(float)a3
{
  v33[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = +[ARUIRingGroup countdownRingGroup];
  double v5 = +[ARUIRingGroup countdownRingGroup];
  v26 = (void *)v4;
  v33[0] = v4;
  v33[1] = v5;
  double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
  v7 = +[ARUIMetricColors keyColors];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        *(float *)&double v10 = a3;
        [v14 setGroupDiameter:v10];
        LODWORD(v15) = 7.0;
        [v14 setThickness:v15];
        [v14 setPercentage:0 ofRingAtIndex:0.0];
        v16 = [v7 gradientLightColor];
        v17 = [v7 gradientDarkColor];
        [v14 setTopColor:v16 bottomColor:v17 ofRingAtIndex:0];

        LODWORD(v18) = ARUIRingPercentageValueNoRing;
        [v14 setPercentage:0 ofRingAtIndex:v18];
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  v19 = [[ARUIRingGroupController alloc] initWithRingGroup:v26];
  v20 = [[ARUIRingGroupController alloc] initWithRingGroup:v5];
  v21 = [[ARUIRenderer alloc] initWithRenderStyle:1];
  v22 = [ARUICountdownView alloc];
  v31[0] = v20;
  v31[1] = v19;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
  v24 = [(ARUIRingsView *)v22 initWithRingGroupControllers:v23 renderer:v21];

  return v24;
}

@end