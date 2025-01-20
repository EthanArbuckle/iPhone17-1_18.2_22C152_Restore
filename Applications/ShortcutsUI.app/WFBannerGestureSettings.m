@interface WFBannerGestureSettings
+ (id)settingsControllerModule;
- (BOOL)alphaOutEnabled;
- (BOOL)fixedEndTranslationUpEnabled;
- (BOOL)horizontalTrackingEnabled;
- (BOOL)rubberBandingEnabled;
- (BOOL)squeezeEnabled;
- (BOOL)testUnregisteredVelocityEdgeCase;
- (BOOL)trackingBlurEnabled;
- (double)blurBottomLimit;
- (double)blurTopLimit;
- (double)bottomLimit;
- (double)bottomRubberBandRange;
- (double)fixedEndTranslationUp;
- (double)horizontalTrackingFriction;
- (double)phase1_artificialInitialOffset;
- (double)phase1_impulse;
- (double)phase1_impulse_unregisteredVelocity;
- (double)phase1_initialBlurRadius;
- (double)phase1_initialScale;
- (double)phase1_phaseDuration;
- (double)phase1_response;
- (double)poofAlphaDelay;
- (double)poofAlphaResponse;
- (double)poofBlurDelay;
- (double)poofBlurRadius;
- (double)poofBlurResponse;
- (double)poofResponse;
- (double)poofScaleDown;
- (double)poofScaleUp;
- (double)poofThrowDistanceDown;
- (double)poofThrowDistanceUp;
- (double)poof_scale_multiplier_y;
- (double)scrollDismissalActivationLeniency;
- (double)squeeze_up;
- (double)topLimit;
- (double)topRubberBandRange;
- (double)trackingDampingRatio;
- (double)trackingResponse;
- (double)trackingScale;
- (double)trackingSqueezeFactor;
- (void)setAlphaOutEnabled:(BOOL)a3;
- (void)setBlurBottomLimit:(double)a3;
- (void)setBlurTopLimit:(double)a3;
- (void)setBottomLimit:(double)a3;
- (void)setBottomRubberBandRange:(double)a3;
- (void)setDefaultValues;
- (void)setFixedEndTranslationUp:(double)a3;
- (void)setFixedEndTranslationUpEnabled:(BOOL)a3;
- (void)setHorizontalTrackingEnabled:(BOOL)a3;
- (void)setHorizontalTrackingFriction:(double)a3;
- (void)setPhase1_artificialInitialOffset:(double)a3;
- (void)setPhase1_impulse:(double)a3;
- (void)setPhase1_impulse_unregisteredVelocity:(double)a3;
- (void)setPhase1_initialBlurRadius:(double)a3;
- (void)setPhase1_initialScale:(double)a3;
- (void)setPhase1_phaseDuration:(double)a3;
- (void)setPhase1_response:(double)a3;
- (void)setPoofAlphaDelay:(double)a3;
- (void)setPoofAlphaResponse:(double)a3;
- (void)setPoofBlurDelay:(double)a3;
- (void)setPoofBlurRadius:(double)a3;
- (void)setPoofBlurResponse:(double)a3;
- (void)setPoofResponse:(double)a3;
- (void)setPoofScaleDown:(double)a3;
- (void)setPoofScaleUp:(double)a3;
- (void)setPoofThrowDistanceDown:(double)a3;
- (void)setPoofThrowDistanceUp:(double)a3;
- (void)setPoof_scale_multiplier_y:(double)a3;
- (void)setRubberBandingEnabled:(BOOL)a3;
- (void)setScrollDismissalActivationLeniency:(double)a3;
- (void)setSqueezeEnabled:(BOOL)a3;
- (void)setSqueeze_up:(double)a3;
- (void)setTestUnregisteredVelocityEdgeCase:(BOOL)a3;
- (void)setTopLimit:(double)a3;
- (void)setTopRubberBandRange:(double)a3;
- (void)setTrackingBlurEnabled:(BOOL)a3;
- (void)setTrackingDampingRatio:(double)a3;
- (void)setTrackingResponse:(double)a3;
- (void)setTrackingScale:(double)a3;
- (void)setTrackingSqueezeFactor:(double)a3;
@end

@implementation WFBannerGestureSettings

- (void)setPhase1_phaseDuration:(double)a3
{
  self->_phase1_phaseDuration = a3;
}

- (double)phase1_phaseDuration
{
  return self->_phase1_phaseDuration;
}

- (void)setPhase1_initialBlurRadius:(double)a3
{
  self->_phase1_initialBlurRadius = a3;
}

- (double)phase1_initialBlurRadius
{
  return self->_phase1_initialBlurRadius;
}

- (void)setPhase1_initialScale:(double)a3
{
  self->_phase1_initialScale = a3;
}

- (double)phase1_initialScale
{
  return self->_phase1_initialScale;
}

- (void)setPhase1_artificialInitialOffset:(double)a3
{
  self->_phase1_artificialInitialOffset = a3;
}

- (double)phase1_artificialInitialOffset
{
  return self->_phase1_artificialInitialOffset;
}

- (void)setPhase1_impulse_unregisteredVelocity:(double)a3
{
  self->_phase1_impulse_unregisteredVelocity = a3;
}

- (double)phase1_impulse_unregisteredVelocity
{
  return self->_phase1_impulse_unregisteredVelocity;
}

- (void)setPhase1_impulse:(double)a3
{
  self->_phase1_impulse = a3;
}

- (double)phase1_impulse
{
  return self->_phase1_impulse;
}

- (void)setPhase1_response:(double)a3
{
  self->_phase1_response = a3;
}

- (double)phase1_response
{
  return self->_phase1_response;
}

- (void)setTestUnregisteredVelocityEdgeCase:(BOOL)a3
{
  self->_testUnregisteredVelocityEdgeCase = a3;
}

- (BOOL)testUnregisteredVelocityEdgeCase
{
  return self->_testUnregisteredVelocityEdgeCase;
}

- (void)setTrackingScale:(double)a3
{
  self->_trackingScale = a3;
}

- (double)trackingScale
{
  return self->_trackingScale;
}

- (void)setPoof_scale_multiplier_y:(double)a3
{
  self->_poof_scale_multiplier_y = a3;
}

- (double)poof_scale_multiplier_y
{
  return self->_poof_scale_multiplier_y;
}

- (void)setSqueeze_up:(double)a3
{
  self->_squeeze_up = a3;
}

- (double)squeeze_up
{
  return self->_squeeze_up;
}

- (void)setScrollDismissalActivationLeniency:(double)a3
{
  self->_scrollDismissalActivationLeniency = a3;
}

- (double)scrollDismissalActivationLeniency
{
  return self->_scrollDismissalActivationLeniency;
}

- (void)setHorizontalTrackingFriction:(double)a3
{
  self->_horizontalTrackingFriction = a3;
}

- (double)horizontalTrackingFriction
{
  return self->_horizontalTrackingFriction;
}

- (void)setHorizontalTrackingEnabled:(BOOL)a3
{
  self->_horizontalTrackingEnabled = a3;
}

- (BOOL)horizontalTrackingEnabled
{
  return self->_horizontalTrackingEnabled;
}

- (void)setBottomRubberBandRange:(double)a3
{
  self->_bottomRubberBandRange = a3;
}

- (double)bottomRubberBandRange
{
  return self->_bottomRubberBandRange;
}

- (void)setTopRubberBandRange:(double)a3
{
  self->_topRubberBandRange = a3;
}

- (double)topRubberBandRange
{
  return self->_topRubberBandRange;
}

- (void)setRubberBandingEnabled:(BOOL)a3
{
  self->_rubberBandingEnabled = a3;
}

- (BOOL)rubberBandingEnabled
{
  return self->_rubberBandingEnabled;
}

- (void)setBlurBottomLimit:(double)a3
{
  self->_blurBottomLimit = a3;
}

- (double)blurBottomLimit
{
  return self->_blurBottomLimit;
}

- (void)setBlurTopLimit:(double)a3
{
  self->_blurTopLimit = a3;
}

- (double)blurTopLimit
{
  return self->_blurTopLimit;
}

- (void)setTrackingBlurEnabled:(BOOL)a3
{
  self->_trackingBlurEnabled = a3;
}

- (BOOL)trackingBlurEnabled
{
  return self->_trackingBlurEnabled;
}

- (void)setBottomLimit:(double)a3
{
  self->_bottomLimit = a3;
}

- (double)bottomLimit
{
  return self->_bottomLimit;
}

- (void)setTopLimit:(double)a3
{
  self->_topLimit = a3;
}

- (double)topLimit
{
  return self->_topLimit;
}

- (void)setPoofBlurDelay:(double)a3
{
  self->_poofBlurDelay = a3;
}

- (double)poofBlurDelay
{
  return self->_poofBlurDelay;
}

- (void)setPoofBlurResponse:(double)a3
{
  self->_poofBlurResponse = a3;
}

- (double)poofBlurResponse
{
  return self->_poofBlurResponse;
}

- (void)setPoofBlurRadius:(double)a3
{
  self->_poofBlurRadius = a3;
}

- (double)poofBlurRadius
{
  return self->_poofBlurRadius;
}

- (void)setTrackingSqueezeFactor:(double)a3
{
  self->_trackingSqueezeFactor = a3;
}

- (double)trackingSqueezeFactor
{
  return self->_trackingSqueezeFactor;
}

- (void)setSqueezeEnabled:(BOOL)a3
{
  self->_squeezeEnabled = a3;
}

- (BOOL)squeezeEnabled
{
  return self->_squeezeEnabled;
}

- (void)setTrackingDampingRatio:(double)a3
{
  self->_trackingDampingRatio = a3;
}

- (double)trackingDampingRatio
{
  return self->_trackingDampingRatio;
}

- (void)setTrackingResponse:(double)a3
{
  self->_trackingResponse = a3;
}

- (double)trackingResponse
{
  return self->_trackingResponse;
}

- (void)setPoofAlphaDelay:(double)a3
{
  self->_poofAlphaDelay = a3;
}

- (double)poofAlphaDelay
{
  return self->_poofAlphaDelay;
}

- (void)setPoofAlphaResponse:(double)a3
{
  self->_poofAlphaResponse = a3;
}

- (double)poofAlphaResponse
{
  return self->_poofAlphaResponse;
}

- (void)setAlphaOutEnabled:(BOOL)a3
{
  self->_alphaOutEnabled = a3;
}

- (BOOL)alphaOutEnabled
{
  return self->_alphaOutEnabled;
}

- (void)setFixedEndTranslationUp:(double)a3
{
  self->_fixedEndTranslationUp = a3;
}

- (double)fixedEndTranslationUp
{
  return self->_fixedEndTranslationUp;
}

- (void)setFixedEndTranslationUpEnabled:(BOOL)a3
{
  self->_fixedEndTranslationUpEnabled = a3;
}

- (BOOL)fixedEndTranslationUpEnabled
{
  return self->_fixedEndTranslationUpEnabled;
}

- (void)setPoofThrowDistanceDown:(double)a3
{
  self->_poofThrowDistanceDown = a3;
}

- (double)poofThrowDistanceDown
{
  return self->_poofThrowDistanceDown;
}

- (void)setPoofThrowDistanceUp:(double)a3
{
  self->_poofThrowDistanceUp = a3;
}

- (double)poofThrowDistanceUp
{
  return self->_poofThrowDistanceUp;
}

- (void)setPoofScaleDown:(double)a3
{
  self->_poofScaleDown = a3;
}

- (double)poofScaleDown
{
  return self->_poofScaleDown;
}

- (void)setPoofScaleUp:(double)a3
{
  self->_poofScaleUp = a3;
}

- (double)poofScaleUp
{
  return self->_poofScaleUp;
}

- (void)setPoofResponse:(double)a3
{
  self->_poofResponse = a3;
}

- (double)poofResponse
{
  return self->_poofResponse;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)WFBannerGestureSettings;
  [(WFBannerGestureSettings *)&v3 setDefaultValues];
  [(WFBannerGestureSettings *)self setPoofResponse:0.55];
  [(WFBannerGestureSettings *)self setPoofScaleUp:0.56];
  [(WFBannerGestureSettings *)self setPoof_scale_multiplier_y:0.92];
  [(WFBannerGestureSettings *)self setPoofScaleDown:0.550000012];
  [(WFBannerGestureSettings *)self setPoofThrowDistanceDown:-110.0];
  [(WFBannerGestureSettings *)self setPoofThrowDistanceUp:-60.0];
  [(WFBannerGestureSettings *)self setFixedEndTranslationUpEnabled:1];
  [(WFBannerGestureSettings *)self setFixedEndTranslationUp:28.0];
  [(WFBannerGestureSettings *)self setAlphaOutEnabled:1];
  [(WFBannerGestureSettings *)self setPoofAlphaResponse:0.32];
  [(WFBannerGestureSettings *)self setPoofAlphaDelay:0.12];
  [(WFBannerGestureSettings *)self setPoofBlurRadius:19.0];
  [(WFBannerGestureSettings *)self setPoofBlurResponse:0.45];
  [(WFBannerGestureSettings *)self setPoofBlurDelay:0.08];
  [(WFBannerGestureSettings *)self setSqueezeEnabled:1];
  [(WFBannerGestureSettings *)self setTrackingSqueezeFactor:0.5];
  [(WFBannerGestureSettings *)self setRubberBandingEnabled:1];
  [(WFBannerGestureSettings *)self setTopLimit:-10.0];
  [(WFBannerGestureSettings *)self setTopRubberBandRange:32.0];
  [(WFBannerGestureSettings *)self setBottomLimit:40.0];
  [(WFBannerGestureSettings *)self setBottomRubberBandRange:220.0];
  [(WFBannerGestureSettings *)self setHorizontalTrackingEnabled:1];
  [(WFBannerGestureSettings *)self setHorizontalTrackingFriction:0.99];
  [(WFBannerGestureSettings *)self setTrackingBlurEnabled:1];
  [(WFBannerGestureSettings *)self setBlurTopLimit:-65.0];
  [(WFBannerGestureSettings *)self setBlurBottomLimit:200.0];
  [(WFBannerGestureSettings *)self setTrackingResponse:0.14];
  [(WFBannerGestureSettings *)self setTrackingDampingRatio:0.75];
  [(WFBannerGestureSettings *)self setTrackingScale:0.38];
  [(WFBannerGestureSettings *)self setSqueeze_up:0.11];
  [(WFBannerGestureSettings *)self setScrollDismissalActivationLeniency:12.0];
  [(WFBannerGestureSettings *)self setTestUnregisteredVelocityEdgeCase:0];
  [(WFBannerGestureSettings *)self setPhase1_response:0.5];
  [(WFBannerGestureSettings *)self setPhase1_impulse:0.018];
  [(WFBannerGestureSettings *)self setPhase1_impulse_unregisteredVelocity:0.042];
  [(WFBannerGestureSettings *)self setPhase1_artificialInitialOffset:34.0];
  [(WFBannerGestureSettings *)self setPhase1_initialScale:0.6];
  [(WFBannerGestureSettings *)self setPhase1_initialBlurRadius:5.0];
  [(WFBannerGestureSettings *)self setPhase1_phaseDuration:0.08];
}

+ (id)settingsControllerModule
{
  v2 = +[PTRestoreDefaultSettingsRowAction actionWithSettingsKeyPath:0];
  objc_super v3 = +[PTButtonRow rowWithTitle:@"Restore Defaults" action:v2];
  v143 = v3;
  v4 = +[NSArray arrayWithObjects:&v143 count:1];
  v129 = +[PTModule sectionWithRows:v4];

  v126 = +[PTEditFloatRow rowWithTitle:@"Transform Response" valueKeyPath:@"poofResponse"];
  v124 = [v126 between:0.0 and:10.0];
  v142[0] = v124;
  v122 = +[PTEditFloatRow rowWithTitle:@"Scale (Upward)" valueKeyPath:@"poofScaleUp"];
  v119 = [v122 between:0.0 and:2.0];
  v142[1] = v119;
  v116 = +[PTEditFloatRow rowWithTitle:@"Vertical Scale Multiplier" valueKeyPath:@"poof_scale_multiplier_y"];
  v112 = [v116 between:0.0 and:2.0];
  v142[2] = v112;
  v109 = +[PTSwitchRow rowWithTitle:@"Fixed Endpoint (Upward)" valueKeyPath:@"fixedEndTranslationUpEnabled"];
  v142[3] = v109;
  v106 = +[PTEditFloatRow rowWithTitle:@"Endpoint (Upward)" valueKeyPath:@"fixedEndTranslationUp"];
  v104 = [v106 between:-500.0 and:500.0];
  v102 = [v104 precision:0];
  v100 = [v102 conditionFormat:@"fixedEndTranslationUpEnabled = YES"];
  v142[4] = v100;
  v98 = +[PTEditFloatRow rowWithTitle:@"Throw Distance (Upward)" valueKeyPath:@"poofThrowDistanceUp"];
  v96 = [v98 between:-500.0 and:500.0];
  v5 = [v96 precision:0];
  v6 = [v5 conditionFormat:@"fixedEndTranslationUpEnabled = NO"];
  v142[5] = v6;
  v7 = +[PTEditFloatRow rowWithTitle:@"Scale (Downward)" valueKeyPath:@"poofScaleDown"];
  v8 = [v7 between:0.0 and:2.0];
  v9 = [v8 conditionFormat:@"squeezeEnabled = NO"];
  v142[6] = v9;
  v10 = +[PTEditFloatRow rowWithTitle:@"Throw Distance (Downward)" valueKeyPath:@"poofThrowDistanceDown"];
  v11 = [v10 between:-500.0 and:500.0];
  v12 = [v11 precision:0];
  v13 = [v12 conditionFormat:@"squeezeEnabled = NO"];
  v142[7] = v13;
  v14 = +[NSArray arrayWithObjects:v142 count:8];
  v128 = +[PTModule sectionWithRows:v14 title:@"Interactive Poof (Phase 2)"];

  v15 = +[PTSwitchRow rowWithTitle:@"Alpha" valueKeyPath:@"alphaOutEnabled"];
  v141[0] = v15;
  v16 = +[PTEditFloatRow rowWithTitle:@"Response" valueKeyPath:@"poofAlphaResponse"];
  v17 = [v16 between:0.0 and:1.0];
  v18 = [v17 conditionFormat:@"alphaOutEnabled = YES"];
  v141[1] = v18;
  v19 = +[PTEditFloatRow rowWithTitle:@"Delay" valueKeyPath:@"poofAlphaDelay"];
  v20 = [v19 between:0.0 and:1.0];
  v21 = [v20 conditionFormat:@"alphaOutEnabled = YES"];
  v141[2] = v21;
  v22 = +[NSArray arrayWithObjects:v141 count:3];
  v127 = +[PTModule sectionWithRows:v22 title:0];

  v23 = +[PTEditFloatRow rowWithTitle:@"Blur Radius" valueKeyPath:@"poofBlurRadius"];
  v24 = [v23 between:0.0 and:1.79769313e308];
  v25 = [v24 precision:0];
  v140[0] = v25;
  v26 = +[PTEditFloatRow rowWithTitle:@"Blur Response" valueKeyPath:@"poofBlurResponse"];
  v27 = [v26 between:0.0 and:1.79769313e308];
  v140[1] = v27;
  v28 = +[PTEditFloatRow rowWithTitle:@"Blur Delay" valueKeyPath:@"poofBlurDelay"];
  v29 = [v28 between:0.0 and:1.79769313e308];
  v140[2] = v29;
  v30 = +[NSArray arrayWithObjects:v140 count:3];
  v125 = +[PTModule sectionWithRows:v30 title:0];

  v120 = +[PTEditFloatRow rowWithTitle:@"Response" valueKeyPath:@"phase1_response"];
  v139[0] = v120;
  v117 = +[PTEditFloatRow rowWithTitle:@"Impulse" valueKeyPath:@"phase1_impulse"];
  v113 = [v117 between:0.0 and:1.79769313e308];
  v31 = [v113 precision:3];
  v139[1] = v31;
  v32 = +[PTEditFloatRow rowWithTitle:@"Impulse (Unregistered Velocity)" valueKeyPath:@"phase1_impulse_unregisteredVelocity"];
  v33 = [v32 between:0.0 and:1.79769313e308];
  v34 = [v33 precision:3];
  v139[2] = v34;
  v35 = +[PTEditFloatRow rowWithTitle:@"Offset" valueKeyPath:@"phase1_artificialInitialOffset"];
  v139[3] = v35;
  v36 = +[PTEditFloatRow rowWithTitle:@"Scale" valueKeyPath:@"phase1_initialScale"];
  v139[4] = v36;
  v37 = +[PTEditFloatRow rowWithTitle:@"Blur Radius" valueKeyPath:@"phase1_initialBlurRadius"];
  v139[5] = v37;
  v38 = +[PTEditFloatRow rowWithTitle:@"Intermediate Phase Duration" valueKeyPath:@"phase1_phaseDuration"];
  v39 = [v38 precision:2];
  v139[6] = v39;
  v40 = +[NSArray arrayWithObjects:v139 count:7];
  v123 = +[PTModule sectionWithRows:v40 title:@"Interactive Poof (Phase 1)"];

  v41 = +[PTEditFloatRow rowWithTitle:@"Tracking Response" valueKeyPath:@"trackingResponse"];
  v42 = [v41 between:0.0 and:1.79769313e308];
  v43 = [v42 precision:2];
  v138[0] = v43;
  v44 = +[PTEditFloatRow rowWithTitle:@"Tracking Damping Ratio" valueKeyPath:@"trackingDampingRatio"];
  v45 = [v44 between:0.0 and:1.79769313e308];
  v46 = [v45 precision:2];
  v138[1] = v46;
  v47 = +[NSArray arrayWithObjects:v138 count:2];
  v121 = +[PTModule sectionWithRows:v47 title:@"Gesture"];

  v114 = +[PTSwitchRow rowWithTitle:@"Rubber Banding" valueKeyPath:@"rubberBandingEnabled"];
  v137[0] = v114;
  v110 = +[PTEditFloatRow rowWithTitle:@"Start Offset (Upward)" valueKeyPath:@"topLimit"];
  v107 = [v110 between:-1.79769313e308 and:0.0];
  v105 = [v107 precision:0];
  v103 = [v105 conditionFormat:@"rubberBandingEnabled = YES"];
  v137[1] = v103;
  v101 = +[PTEditFloatRow rowWithTitle:@"Range (Upward)" valueKeyPath:@"topRubberBandRange"];
  v99 = [v101 between:5.0 and:1.79769313e308];
  v97 = [v99 precision:0];
  v48 = [v97 conditionFormat:@"rubberBandingEnabled = YES"];
  v137[2] = v48;
  v49 = +[PTEditFloatRow rowWithTitle:@"Start Offset (Downward)" valueKeyPath:@"bottomLimit"];
  v50 = [v49 between:0.0 and:1.79769313e308];
  v51 = [v50 precision:0];
  v52 = [v51 conditionFormat:@"rubberBandingEnabled = YES"];
  v137[3] = v52;
  v53 = +[PTEditFloatRow rowWithTitle:@"Range (Downward)" valueKeyPath:@"bottomRubberBandRange"];
  v54 = [v53 between:0.0 and:1.79769313e308];
  v55 = [v54 precision:0];
  v56 = [v55 conditionFormat:@"rubberBandingEnabled = YES"];
  v137[4] = v56;
  v57 = +[NSArray arrayWithObjects:v137 count:5];
  v118 = +[PTModule sectionWithRows:v57 title:0];

  v58 = +[PTSwitchRow rowWithTitle:@"Horizontal Tracking" valueKeyPath:@"horizontalTrackingEnabled"];
  v136[0] = v58;
  v59 = +[PTEditFloatRow rowWithTitle:@"Friction" valueKeyPath:@"horizontalTrackingFriction"];
  v60 = [v59 between:0.0 and:1.0];
  v61 = [v60 precision:3];
  v62 = [v61 conditionFormat:@"horizontalTrackingEnabled = YES"];
  v136[1] = v62;
  v63 = +[NSArray arrayWithObjects:v136 count:2];
  v115 = +[PTModule sectionWithRows:v63 title:0];

  v64 = +[PTSwitchRow rowWithTitle:@"Squeeze" valueKeyPath:@"squeezeEnabled"];
  v135[0] = v64;
  v65 = +[PTEditFloatRow rowWithTitle:@"Strength" valueKeyPath:@"trackingSqueezeFactor"];
  v66 = [v65 between:0.0 and:1.0];
  v67 = [v66 conditionFormat:@"squeezeEnabled = YES"];
  v135[1] = v67;
  v68 = +[NSArray arrayWithObjects:v135 count:2];
  v111 = +[PTModule sectionWithRows:v68 title:0];

  v69 = +[PTSwitchRow rowWithTitle:@"Tracking Blur" valueKeyPath:@"trackingBlurEnabled"];
  v134[0] = v69;
  v70 = +[PTEditFloatRow rowWithTitle:@"Blur Activation Offset (Upward)" valueKeyPath:@"blurTopLimit"];
  v71 = [v70 between:-1.79769313e308 and:0.0];
  v72 = [v71 precision:0];
  v73 = [v72 conditionFormat:@"trackingBlurEnabled == YES"];
  v134[1] = v73;
  v74 = +[PTEditFloatRow rowWithTitle:@"Blur Activation Offset (Downward)" valueKeyPath:@"blurBottomLimit"];
  v75 = [v74 between:0.0 and:1.79769313e308];
  v76 = [v75 precision:0];
  v77 = [v76 conditionFormat:@"trackingBlurEnabled == YES && squeezeEnabled = NO"];
  v134[2] = v77;
  v78 = +[NSArray arrayWithObjects:v134 count:3];
  v108 = +[PTModule sectionWithRows:v78 title:0];

  v79 = +[PTEditFloatRow rowWithTitle:@"Tracking Scale" valueKeyPath:@"trackingScale"];
  v80 = [v79 between:0.0 and:1.0];
  v133[0] = v80;
  v81 = +[PTEditFloatRow rowWithTitle:@"Upwards Squeeze" valueKeyPath:@"squeeze_up"];
  v82 = [v81 between:0.0 and:1.0];
  v133[1] = v82;
  v83 = +[NSArray arrayWithObjects:v133 count:2];
  v84 = +[PTModule sectionWithRows:v83 title:0];

  v85 = +[PTEditFloatRow rowWithTitle:@"Scroll Dismissal Leniency" valueKeyPath:@"scrollDismissalActivationLeniency"];
  v86 = [v85 between:0.0 and:1.79769313e308];
  v87 = [v86 precision:0];
  v132 = v87;
  v88 = +[NSArray arrayWithObjects:&v132 count:1];
  v89 = +[PTModule sectionWithRows:v88 title:0];

  v90 = +[PTSwitchRow rowWithTitle:@"Test Quick Flick" valueKeyPath:@"testUnregisteredVelocityEdgeCase"];
  v131 = v90;
  v91 = +[NSArray arrayWithObjects:&v131 count:1];
  v92 = +[PTModule sectionWithRows:v91 title:@"Debug"];

  v130[0] = v129;
  v130[1] = v128;
  v130[2] = v127;
  v130[3] = v125;
  v130[4] = v123;
  v130[5] = v121;
  v130[6] = v118;
  v130[7] = v115;
  v130[8] = v111;
  v130[9] = v108;
  v130[10] = v84;
  v130[11] = v89;
  v130[12] = v92;
  v93 = +[NSArray arrayWithObjects:v130 count:13];
  v94 = +[PTModule moduleWithTitle:@"Custom Banner Transitions" contents:v93];

  return v94;
}

@end