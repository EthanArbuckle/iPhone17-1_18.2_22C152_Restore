@interface WFBannerTransitionSettings
+ (id)settingsControllerModule;
- (BOOL)disableTransition;
- (double)hintAnimationResponse;
- (double)hintAnimationTargetScale;
- (double)hintDuration;
- (double)poofInAlphaResponse;
- (double)poofInBlurRadius;
- (double)poofInBlurResponse;
- (double)poofInScale;
- (double)poofInScaleDamping;
- (double)poofInScaleResponse;
- (double)poofOutAlphaDelay;
- (double)poofOutAlphaResponse;
- (double)poofOutBlurDelay;
- (double)poofOutBlurRadius;
- (double)poofOutBlurResponse;
- (double)poofOutScale;
- (double)poofOutScaleDamping;
- (double)poofOutScaleResponse;
- (void)setDefaultValues;
- (void)setDisableTransition:(BOOL)a3;
- (void)setHintAnimationResponse:(double)a3;
- (void)setHintAnimationTargetScale:(double)a3;
- (void)setHintDuration:(double)a3;
- (void)setPoofInAlphaResponse:(double)a3;
- (void)setPoofInBlurRadius:(double)a3;
- (void)setPoofInBlurResponse:(double)a3;
- (void)setPoofInScale:(double)a3;
- (void)setPoofInScaleDamping:(double)a3;
- (void)setPoofInScaleResponse:(double)a3;
- (void)setPoofOutAlphaDelay:(double)a3;
- (void)setPoofOutAlphaResponse:(double)a3;
- (void)setPoofOutBlurDelay:(double)a3;
- (void)setPoofOutBlurRadius:(double)a3;
- (void)setPoofOutBlurResponse:(double)a3;
- (void)setPoofOutScale:(double)a3;
- (void)setPoofOutScaleDamping:(double)a3;
- (void)setPoofOutScaleResponse:(double)a3;
@end

@implementation WFBannerTransitionSettings

- (void)setDisableTransition:(BOOL)a3
{
  self->_disableTransition = a3;
}

- (BOOL)disableTransition
{
  return self->_disableTransition;
}

- (void)setPoofOutAlphaDelay:(double)a3
{
  self->_poofOutAlphaDelay = a3;
}

- (double)poofOutAlphaDelay
{
  return self->_poofOutAlphaDelay;
}

- (void)setPoofOutAlphaResponse:(double)a3
{
  self->_poofOutAlphaResponse = a3;
}

- (double)poofOutAlphaResponse
{
  return self->_poofOutAlphaResponse;
}

- (void)setPoofOutBlurDelay:(double)a3
{
  self->_poofOutBlurDelay = a3;
}

- (double)poofOutBlurDelay
{
  return self->_poofOutBlurDelay;
}

- (void)setPoofOutBlurResponse:(double)a3
{
  self->_poofOutBlurResponse = a3;
}

- (double)poofOutBlurResponse
{
  return self->_poofOutBlurResponse;
}

- (void)setPoofOutBlurRadius:(double)a3
{
  self->_poofOutBlurRadius = a3;
}

- (double)poofOutBlurRadius
{
  return self->_poofOutBlurRadius;
}

- (void)setPoofOutScaleDamping:(double)a3
{
  self->_poofOutScaleDamping = a3;
}

- (double)poofOutScaleDamping
{
  return self->_poofOutScaleDamping;
}

- (void)setPoofOutScaleResponse:(double)a3
{
  self->_poofOutScaleResponse = a3;
}

- (double)poofOutScaleResponse
{
  return self->_poofOutScaleResponse;
}

- (void)setPoofOutScale:(double)a3
{
  self->_poofOutScale = a3;
}

- (double)poofOutScale
{
  return self->_poofOutScale;
}

- (void)setPoofInAlphaResponse:(double)a3
{
  self->_poofInAlphaResponse = a3;
}

- (double)poofInAlphaResponse
{
  return self->_poofInAlphaResponse;
}

- (void)setPoofInBlurResponse:(double)a3
{
  self->_poofInBlurResponse = a3;
}

- (double)poofInBlurResponse
{
  return self->_poofInBlurResponse;
}

- (void)setPoofInBlurRadius:(double)a3
{
  self->_poofInBlurRadius = a3;
}

- (double)poofInBlurRadius
{
  return self->_poofInBlurRadius;
}

- (void)setPoofInScaleDamping:(double)a3
{
  self->_poofInScaleDamping = a3;
}

- (double)poofInScaleDamping
{
  return self->_poofInScaleDamping;
}

- (void)setPoofInScaleResponse:(double)a3
{
  self->_poofInScaleResponse = a3;
}

- (double)poofInScaleResponse
{
  return self->_poofInScaleResponse;
}

- (void)setPoofInScale:(double)a3
{
  self->_poofInScale = a3;
}

- (double)poofInScale
{
  return self->_poofInScale;
}

- (void)setHintAnimationTargetScale:(double)a3
{
  self->_hintAnimationTargetScale = a3;
}

- (double)hintAnimationTargetScale
{
  return self->_hintAnimationTargetScale;
}

- (void)setHintAnimationResponse:(double)a3
{
  self->_hintAnimationResponse = a3;
}

- (double)hintAnimationResponse
{
  return self->_hintAnimationResponse;
}

- (void)setHintDuration:(double)a3
{
  self->_hintDuration = a3;
}

- (double)hintDuration
{
  return self->_hintDuration;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)WFBannerTransitionSettings;
  [(WFBannerTransitionSettings *)&v3 setDefaultValues];
  [(WFBannerTransitionSettings *)self setHintDuration:300.0];
  [(WFBannerTransitionSettings *)self setHintAnimationResponse:1.0];
  [(WFBannerTransitionSettings *)self setHintAnimationTargetScale:0.9];
  [(WFBannerTransitionSettings *)self setPoofInScale:0.7];
  [(WFBannerTransitionSettings *)self setPoofInScaleResponse:0.55];
  [(WFBannerTransitionSettings *)self setPoofInScaleDamping:0.68];
  [(WFBannerTransitionSettings *)self setPoofInBlurRadius:50.0];
  [(WFBannerTransitionSettings *)self setPoofInBlurResponse:0.37];
  [(WFBannerTransitionSettings *)self setPoofInAlphaResponse:0.2];
  [(WFBannerTransitionSettings *)self setPoofOutScale:0.81];
  [(WFBannerTransitionSettings *)self setPoofOutScaleResponse:0.45];
  [(WFBannerTransitionSettings *)self setPoofOutBlurRadius:24.0];
  [(WFBannerTransitionSettings *)self setPoofOutBlurResponse:0.45];
  [(WFBannerTransitionSettings *)self setPoofOutBlurDelay:0.0];
  [(WFBannerTransitionSettings *)self setPoofOutAlphaResponse:0.18];
  [(WFBannerTransitionSettings *)self setPoofOutAlphaDelay:0.11];
  [(WFBannerTransitionSettings *)self setDisableTransition:0];
}

+ (id)settingsControllerModule
{
  v2 = +[PTRestoreDefaultSettingsRowAction actionWithSettingsKeyPath:0];
  objc_super v3 = +[PTButtonRow rowWithTitle:@"Restore Defaults" action:v2];
  v71 = v3;
  v4 = +[NSArray arrayWithObjects:&v71 count:1];
  v65 = +[PTModule sectionWithRows:v4];

  v5 = +[PTEditFloatRow rowWithTitle:@"Duration (ms)" valueKeyPath:@"hintDuration"];
  v6 = [v5 between:0.0 and:1.79769313e308];
  v7 = [v6 precision:0];
  v70[0] = v7;
  v8 = +[PTEditFloatRow rowWithTitle:@"Animation Response" valueKeyPath:@"hintAnimationResponse"];
  v9 = [v8 between:0.0 and:1.79769313e308];
  v10 = [v9 precision:2];
  v70[1] = v10;
  v11 = +[PTEditFloatRow rowWithTitle:@"Target Scale" valueKeyPath:@"hintAnimationTargetScale"];
  v12 = [v11 between:0.0 and:1.0];
  v13 = [v12 precision:2];
  v70[2] = v13;
  v14 = +[NSArray arrayWithObjects:v70 count:3];
  v64 = +[PTModule sectionWithRows:v14 title:@"Hinting"];

  v61 = +[PTEditFloatRow rowWithTitle:@"Scale" valueKeyPath:@"poofInScale"];
  v59 = [v61 between:0.0 and:1.79769313e308];
  v57 = [v59 precision:2];
  v69[0] = v57;
  v55 = +[PTEditFloatRow rowWithTitle:@"Scale Response" valueKeyPath:@"poofInScaleResponse"];
  v53 = [v55 between:0.0 and:1.79769313e308];
  v51 = [v53 precision:2];
  v69[1] = v51;
  v49 = +[PTEditFloatRow rowWithTitle:@"Scale Damping" valueKeyPath:@"poofInScaleDamping"];
  v47 = [v49 between:0.0 and:1.0];
  v45 = [v47 precision:2];
  v69[2] = v45;
  v15 = +[PTEditFloatRow rowWithTitle:@"Blur Radius" valueKeyPath:@"poofInBlurRadius"];
  v16 = [v15 between:0.0 and:1.79769313e308];
  v17 = [v16 precision:2];
  v69[3] = v17;
  v18 = +[PTEditFloatRow rowWithTitle:@"Blur Response" valueKeyPath:@"poofInBlurResponse"];
  v19 = [v18 between:0.0 and:1.79769313e308];
  v20 = [v19 precision:2];
  v69[4] = v20;
  v21 = +[PTEditFloatRow rowWithTitle:@"Alpha Response" valueKeyPath:@"poofInAlphaResponse"];
  v22 = [v21 between:0.0 and:1.79769313e308];
  v23 = [v22 precision:2];
  v69[5] = v23;
  v24 = +[NSArray arrayWithObjects:v69 count:6];
  v63 = +[PTModule sectionWithRows:v24 title:@"Poof In"];

  v62 = +[PTEditFloatRow rowWithTitle:@"Scale" valueKeyPath:@"poofOutScale"];
  v60 = [v62 between:0.0 and:1.79769313e308];
  v58 = [v60 precision:2];
  v68[0] = v58;
  v56 = +[PTEditFloatRow rowWithTitle:@"Scale Response" valueKeyPath:@"poofOutScaleResponse"];
  v54 = [v56 between:0.0 and:1.79769313e308];
  v52 = [v54 precision:2];
  v68[1] = v52;
  v50 = +[PTEditFloatRow rowWithTitle:@"Blur Radius" valueKeyPath:@"poofOutBlurRadius"];
  v46 = [v50 between:0.0 and:1.79769313e308];
  v44 = [v46 precision:2];
  v68[2] = v44;
  v43 = +[PTEditFloatRow rowWithTitle:@"Blur Response" valueKeyPath:@"poofOutBlurResponse"];
  v42 = [v43 between:0.0 and:1.79769313e308];
  v41 = [v42 precision:2];
  v68[3] = v41;
  v25 = +[PTEditFloatRow rowWithTitle:@"Blur Delay" valueKeyPath:@"poofOutBlurDelay"];
  v26 = [v25 between:0.0 and:1.79769313e308];
  v27 = [v26 precision:2];
  v68[4] = v27;
  v28 = +[PTEditFloatRow rowWithTitle:@"Alpha Response" valueKeyPath:@"poofOutAlphaResponse"];
  v29 = [v28 between:0.0 and:1.79769313e308];
  v30 = [v29 precision:2];
  v68[5] = v30;
  v31 = +[PTEditFloatRow rowWithTitle:@"Alpha Delay" valueKeyPath:@"poofOutAlphaDelay"];
  v32 = [v31 between:0.0 and:1.79769313e308];
  v33 = [v32 precision:2];
  v68[6] = v33;
  v34 = +[NSArray arrayWithObjects:v68 count:7];
  v48 = +[PTModule sectionWithRows:v34 title:@"Poof Out"];

  v35 = +[PTSwitchRow rowWithTitle:@"Disable Transition" valueKeyPath:@"disableTransition"];
  v67 = v35;
  v36 = +[NSArray arrayWithObjects:&v67 count:1];
  v37 = +[PTModule sectionWithRows:v36 title:@"Debug"];

  v66[0] = v65;
  v66[1] = v64;
  v66[2] = v63;
  v66[3] = v48;
  v66[4] = v37;
  v38 = +[NSArray arrayWithObjects:v66 count:5];
  v39 = +[PTModule moduleWithTitle:@"Custom Banner Transitions" contents:v38];

  return v39;
}

@end