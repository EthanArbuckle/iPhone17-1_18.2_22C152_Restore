@interface AMUIPosterSwitcherSettings
+ (id)settingsControllerModule;
- (BOOL)exitingCardBehaviorScaleDownOnly;
- (BOOL)horizontalSwitcherCircular;
- (BOOL)photoSymbolHugsEdge;
- (BOOL)useFallbackTitleAndSymbol;
- (BOOL)verticalSwitcherCircular;
- (double)chromeFadeoutTargetProgress;
- (double)exitingCardTargetOpacity;
- (double)forwardTimeFadeoutTargetProgress;
- (double)horizontalExitingCardTargetScale;
- (double)horizontalScaleDampingRatio;
- (double)horizontalScaleResponse;
- (double)labelFadeinTargetProgress;
- (double)reverseTimeFadeoutTargetProgress;
- (double)verticalExitingCardTargetScale;
- (double)verticalScaleDampingRatio;
- (double)verticalScaleResponse;
- (double)verticalScootch;
- (void)setChromeFadeoutTargetProgress:(double)a3;
- (void)setDefaultValues;
- (void)setExitingCardBehaviorScaleDownOnly:(BOOL)a3;
- (void)setExitingCardTargetOpacity:(double)a3;
- (void)setForwardTimeFadeoutTargetProgress:(double)a3;
- (void)setHorizontalExitingCardTargetScale:(double)a3;
- (void)setHorizontalScaleDampingRatio:(double)a3;
- (void)setHorizontalScaleResponse:(double)a3;
- (void)setHorizontalSwitcherCircular:(BOOL)a3;
- (void)setLabelFadeinTargetProgress:(double)a3;
- (void)setPhotoSymbolHugsEdge:(BOOL)a3;
- (void)setReverseTimeFadeoutTargetProgress:(double)a3;
- (void)setUseFallbackTitleAndSymbol:(BOOL)a3;
- (void)setVerticalExitingCardTargetScale:(double)a3;
- (void)setVerticalScaleDampingRatio:(double)a3;
- (void)setVerticalScaleResponse:(double)a3;
- (void)setVerticalScootch:(double)a3;
- (void)setVerticalSwitcherCircular:(BOOL)a3;
@end

@implementation AMUIPosterSwitcherSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)AMUIPosterSwitcherSettings;
  [(PTSettings *)&v3 setDefaultValues];
  self->_exitingCardBehaviorScaleDownOnly = 1;
  self->_verticalExitingCardTargetScale = 0.884615362;
  self->_horizontalExitingCardTargetScale = 0.61;
  self->_exitingCardTargetOpacity = 0.0;
  self->_verticalSwitcherCircular = 0;
  self->_horizontalSwitcherCircular = 0;
  self->_verticalScootch = 0.0;
  self->_forwardTimeFadeoutTargetProgress = 0.3;
  self->_reverseTimeFadeoutTargetProgress = 0.05;
  self->_chromeFadeoutTargetProgress = 0.05;
  self->_labelFadeinTargetProgress = 0.05;
  self->_useFallbackTitleAndSymbol = 0;
  self->_photoSymbolHugsEdge = 1;
  self->_horizontalScaleDampingRatio = 1.0;
  self->_horizontalScaleResponse = 0.35;
  self->_verticalScaleDampingRatio = 1.0;
  self->_verticalScaleResponse = 0.35;
}

+ (id)settingsControllerModule
{
  v58[9] = *MEMORY[0x263EF8340];
  v52 = [MEMORY[0x263F62328] rowWithTitle:@"Scale Down Only" valueKeyPath:@"exitingCardBehaviorScaleDownOnly"];
  v2 = [MEMORY[0x263F62320] rowWithTitle:@"Vertical Switching Target Scale" valueKeyPath:@"verticalExitingCardTargetScale"];
  v51 = [v2 minValue:0.0 maxValue:1.0];

  objc_super v3 = [MEMORY[0x263F62320] rowWithTitle:@"Horizontal Switching Target Scale" valueKeyPath:@"horizontalExitingCardTargetScale"];
  v50 = [v3 minValue:0.0 maxValue:1.0];

  v4 = [MEMORY[0x263F62320] rowWithTitle:@"Target Opacity" valueKeyPath:@"exitingCardTargetOpacity"];
  v49 = [v4 minValue:0.0 maxValue:1.0];

  v5 = [MEMORY[0x263F62320] rowWithTitle:@"Horizontal Scale Damping Ratio" valueKeyPath:@"horizontalScaleDampingRatio"];
  v48 = [v5 minValue:0.0 maxValue:2.0];

  v6 = [MEMORY[0x263F62320] rowWithTitle:@"Horizontal Scale Response" valueKeyPath:@"horizontalScaleResponse"];
  v47 = [v6 minValue:0.0 maxValue:2.0];

  v7 = [MEMORY[0x263F62320] rowWithTitle:@"Vertical Scale Damping Ratio" valueKeyPath:@"verticalScaleDampingRatio"];
  v46 = [v7 minValue:0.0 maxValue:2.0];

  v8 = [MEMORY[0x263F62320] rowWithTitle:@"Vertical Scale Response" valueKeyPath:@"verticalScaleResponse"];
  v45 = [v8 minValue:0.0 maxValue:2.0];

  v9 = [MEMORY[0x263F62320] rowWithTitle:@"Scootch" valueKeyPath:@"verticalScootch"];
  v44 = [v9 minValue:0.0 maxValue:200.0];

  v10 = (void *)MEMORY[0x263F622D8];
  v58[0] = v52;
  v58[1] = v51;
  v58[2] = v50;
  v58[3] = v49;
  v58[4] = v48;
  v58[5] = v47;
  v58[6] = v46;
  v58[7] = v45;
  v58[8] = v44;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:9];
  v12 = [v10 sectionWithRows:v11 title:@"Outgoing Card Transitions"];

  v43 = [MEMORY[0x263F62328] rowWithTitle:@"Circular - Vertical" valueKeyPath:@"verticalSwitcherCircular"];
  v42 = [MEMORY[0x263F62328] rowWithTitle:@"Circular - Horizontal" valueKeyPath:@"horizontalSwitcherCircular"];
  v13 = (void *)MEMORY[0x263F622D8];
  v57[0] = v43;
  v57[1] = v42;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:2];
  v41 = [v13 sectionWithRows:v14 title:@"Scrolling Behavior"];

  v15 = [MEMORY[0x263F62320] rowWithTitle:@"Forward Time Fadeout" valueKeyPath:@"forwardTimeFadeoutTargetProgress"];
  v40 = [v15 minValue:0.0 maxValue:0.5];

  v16 = [MEMORY[0x263F62320] rowWithTitle:@"Reverse Time Fadeout" valueKeyPath:@"reverseTimeFadeoutTargetProgress"];
  v39 = [v16 minValue:0.0 maxValue:0.25];

  v17 = [MEMORY[0x263F62320] rowWithTitle:@"Chrome Fadeout" valueKeyPath:@"chromeFadeoutTargetProgress"];
  v38 = [v17 minValue:0.0 maxValue:0.25];

  v18 = [MEMORY[0x263F62320] rowWithTitle:@"Label Fadein" valueKeyPath:@"labelFadeinTargetProgress"];
  v37 = [v18 minValue:0.0 maxValue:0.25];

  v19 = (void *)MEMORY[0x263F622D8];
  v56[0] = v40;
  v56[1] = v39;
  v56[2] = v38;
  v56[3] = v37;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:4];
  v21 = [v19 sectionWithRows:v20 title:@"Transition Target Progresses"];

  v22 = [MEMORY[0x263F62328] rowWithTitle:@"Use Fallback Title When Unavailable" valueKeyPath:@"useFallbackTitleAndSymbol"];
  v23 = [MEMORY[0x263F62328] rowWithTitle:@"Symbols Hug Screen Edge" valueKeyPath:@"photoSymbolHugsEdge"];
  v24 = (void *)MEMORY[0x263F622D8];
  v55[0] = v22;
  v55[1] = v23;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
  v26 = [v24 sectionWithRows:v25 title:@"Photo Labels"];

  v27 = (void *)MEMORY[0x263F622A0];
  v28 = [MEMORY[0x263F622F8] actionWithSettingsKeyPath:0];
  v29 = [v27 rowWithTitle:@"Restore Defaults" action:v28];

  v30 = (void *)MEMORY[0x263F622D8];
  v54 = v29;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
  v32 = [v30 sectionWithRows:v31];

  v33 = (void *)MEMORY[0x263F622D8];
  v53[0] = v12;
  v53[1] = v41;
  v53[2] = v21;
  v53[3] = v26;
  v53[4] = v32;
  v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:5];
  v35 = [v33 moduleWithTitle:@"Quick Switching" contents:v34];

  return v35;
}

- (BOOL)exitingCardBehaviorScaleDownOnly
{
  return self->_exitingCardBehaviorScaleDownOnly;
}

- (void)setExitingCardBehaviorScaleDownOnly:(BOOL)a3
{
  self->_exitingCardBehaviorScaleDownOnly = a3;
}

- (double)verticalExitingCardTargetScale
{
  return self->_verticalExitingCardTargetScale;
}

- (void)setVerticalExitingCardTargetScale:(double)a3
{
  self->_verticalExitingCardTargetScale = a3;
}

- (double)horizontalExitingCardTargetScale
{
  return self->_horizontalExitingCardTargetScale;
}

- (void)setHorizontalExitingCardTargetScale:(double)a3
{
  self->_horizontalExitingCardTargetScale = a3;
}

- (double)exitingCardTargetOpacity
{
  return self->_exitingCardTargetOpacity;
}

- (void)setExitingCardTargetOpacity:(double)a3
{
  self->_exitingCardTargetOpacity = a3;
}

- (BOOL)verticalSwitcherCircular
{
  return self->_verticalSwitcherCircular;
}

- (void)setVerticalSwitcherCircular:(BOOL)a3
{
  self->_verticalSwitcherCircular = a3;
}

- (BOOL)horizontalSwitcherCircular
{
  return self->_horizontalSwitcherCircular;
}

- (void)setHorizontalSwitcherCircular:(BOOL)a3
{
  self->_horizontalSwitcherCircular = a3;
}

- (double)verticalScootch
{
  return self->_verticalScootch;
}

- (void)setVerticalScootch:(double)a3
{
  self->_verticalScootch = a3;
}

- (double)forwardTimeFadeoutTargetProgress
{
  return self->_forwardTimeFadeoutTargetProgress;
}

- (void)setForwardTimeFadeoutTargetProgress:(double)a3
{
  self->_forwardTimeFadeoutTargetProgress = a3;
}

- (double)reverseTimeFadeoutTargetProgress
{
  return self->_reverseTimeFadeoutTargetProgress;
}

- (void)setReverseTimeFadeoutTargetProgress:(double)a3
{
  self->_reverseTimeFadeoutTargetProgress = a3;
}

- (double)chromeFadeoutTargetProgress
{
  return self->_chromeFadeoutTargetProgress;
}

- (void)setChromeFadeoutTargetProgress:(double)a3
{
  self->_chromeFadeoutTargetProgress = a3;
}

- (double)labelFadeinTargetProgress
{
  return self->_labelFadeinTargetProgress;
}

- (void)setLabelFadeinTargetProgress:(double)a3
{
  self->_labelFadeinTargetProgress = a3;
}

- (BOOL)useFallbackTitleAndSymbol
{
  return self->_useFallbackTitleAndSymbol;
}

- (void)setUseFallbackTitleAndSymbol:(BOOL)a3
{
  self->_useFallbackTitleAndSymbol = a3;
}

- (BOOL)photoSymbolHugsEdge
{
  return self->_photoSymbolHugsEdge;
}

- (void)setPhotoSymbolHugsEdge:(BOOL)a3
{
  self->_photoSymbolHugsEdge = a3;
}

- (double)horizontalScaleDampingRatio
{
  return self->_horizontalScaleDampingRatio;
}

- (void)setHorizontalScaleDampingRatio:(double)a3
{
  self->_horizontalScaleDampingRatio = a3;
}

- (double)horizontalScaleResponse
{
  return self->_horizontalScaleResponse;
}

- (void)setHorizontalScaleResponse:(double)a3
{
  self->_horizontalScaleResponse = a3;
}

- (double)verticalScaleDampingRatio
{
  return self->_verticalScaleDampingRatio;
}

- (void)setVerticalScaleDampingRatio:(double)a3
{
  self->_verticalScaleDampingRatio = a3;
}

- (double)verticalScaleResponse
{
  return self->_verticalScaleResponse;
}

- (void)setVerticalScaleResponse:(double)a3
{
  self->_verticalScaleResponse = a3;
}

@end