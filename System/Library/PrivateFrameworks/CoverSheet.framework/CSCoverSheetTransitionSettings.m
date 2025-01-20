@interface CSCoverSheetTransitionSettings
+ (id)settingsControllerModule;
- (BOOL)_isMaglevActive;
- (BOOL)alwaysFadesCoverSheetContent;
- (BOOL)blursBehindCoverSheet;
- (BOOL)blursPanel;
- (BOOL)darkensContent;
- (BOOL)fadePanelWallpaper;
- (BOOL)fadesContent;
- (BOOL)fadesCoverSheetContent;
- (BOOL)floatingLayerAsWallpaperOverlay;
- (BOOL)iconsFlyIn;
- (BOOL)orientPanelWallpaper;
- (BOOL)panelWallpaper;
- (BOOL)revealWallpaper;
- (BOOL)scaleWallpaper;
- (BOOL)trackingWallpaper;
- (BOOL)usesFixedWallpaperPresentationProgress;
- (NSString)description;
- (SBFFluidBehaviorSettings)wallpaperScaleSettings;
- (double)behindCoverSheetBlurEnd;
- (double)behindCoverSheetBlurRadius;
- (double)behindCoverSheetBlurStart;
- (double)blurEnd;
- (double)blurEndReducedTransparency;
- (double)blurRadius;
- (double)blurStart;
- (double)contentFadeEnd;
- (double)contentFadeStart;
- (double)darkeningColorAlpha;
- (double)darkeningColorWhite;
- (double)darkeningEnd;
- (double)darkeningStart;
- (double)fadePanelWallpaperEnd;
- (double)fadePanelWallpaperStart;
- (double)fadesCoverSheetContentEnd;
- (double)fadesCoverSheetContentStart;
- (double)fixedWallpaperPresentationProgress;
- (double)maxContentAlpha;
- (double)trackingWallpaperParallaxFactor;
- (double)wallpaperScale;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)transitionStyle;
- (void)setAlwaysFadesCoverSheetContent:(BOOL)a3;
- (void)setBehindCoverSheetBlurEnd:(double)a3;
- (void)setBehindCoverSheetBlurRadius:(double)a3;
- (void)setBehindCoverSheetBlurStart:(double)a3;
- (void)setBlurEnd:(double)a3;
- (void)setBlurEndReducedTransparency:(double)a3;
- (void)setBlurRadius:(double)a3;
- (void)setBlurStart:(double)a3;
- (void)setBlursBehindCoverSheet:(BOOL)a3;
- (void)setBlursPanel:(BOOL)a3;
- (void)setContentFadeEnd:(double)a3;
- (void)setContentFadeStart:(double)a3;
- (void)setDarkeningColorAlpha:(double)a3;
- (void)setDarkeningColorWhite:(double)a3;
- (void)setDarkeningEnd:(double)a3;
- (void)setDarkeningStart:(double)a3;
- (void)setDarkensContent:(BOOL)a3;
- (void)setDefaultValues;
- (void)setFadePanelWallpaper:(BOOL)a3;
- (void)setFadePanelWallpaperEnd:(double)a3;
- (void)setFadePanelWallpaperStart:(double)a3;
- (void)setFadesContent:(BOOL)a3;
- (void)setFadesCoverSheetContent:(BOOL)a3;
- (void)setFadesCoverSheetContentEnd:(double)a3;
- (void)setFadesCoverSheetContentStart:(double)a3;
- (void)setFixedWallpaperPresentationProgress:(double)a3;
- (void)setFloatingLayerAsWallpaperOverlay:(BOOL)a3;
- (void)setIconsFlyIn:(BOOL)a3;
- (void)setMaxContentAlpha:(double)a3;
- (void)setOrientPanelWallpaper:(BOOL)a3;
- (void)setPanelWallpaper:(BOOL)a3;
- (void)setRevealWallpaper:(BOOL)a3;
- (void)setScaleWallpaper:(BOOL)a3;
- (void)setTrackingWallpaper:(BOOL)a3;
- (void)setTrackingWallpaperParallaxFactor:(double)a3;
- (void)setTransitionStyle:(int64_t)a3;
- (void)setUsesFixedWallpaperPresentationProgress:(BOOL)a3;
- (void)setWallpaperScale:(double)a3;
- (void)setWallpaperScaleSettings:(id)a3;
@end

@implementation CSCoverSheetTransitionSettings

- (void)setDefaultValues
{
  [(CSCoverSheetTransitionSettings *)self setBlursPanel:1];
  [(CSCoverSheetTransitionSettings *)self setBlurRadius:20.0];
  [(CSCoverSheetTransitionSettings *)self setBlurStart:0.2];
  [(CSCoverSheetTransitionSettings *)self setBlurEnd:0.4];
  [(CSCoverSheetTransitionSettings *)self setBlurEndReducedTransparency:0.275];
  [(CSCoverSheetTransitionSettings *)self setFadesContent:1];
  [(CSCoverSheetTransitionSettings *)self setMaxContentAlpha:1.0];
  [(CSCoverSheetTransitionSettings *)self setContentFadeStart:0.3];
  [(CSCoverSheetTransitionSettings *)self setContentFadeEnd:0.7];
  [(CSCoverSheetTransitionSettings *)self setDarkensContent:1];
  [(CSCoverSheetTransitionSettings *)self setDarkeningColorWhite:0.0];
  [(CSCoverSheetTransitionSettings *)self setDarkeningColorAlpha:0.2];
  [(CSCoverSheetTransitionSettings *)self setDarkeningStart:0.0];
  [(CSCoverSheetTransitionSettings *)self setDarkeningEnd:0.5];
  [(CSCoverSheetTransitionSettings *)self setPanelWallpaper:0];
  [(CSCoverSheetTransitionSettings *)self setTrackingWallpaper:0];
  [(CSCoverSheetTransitionSettings *)self setTrackingWallpaperParallaxFactor:0.5];
  [(CSCoverSheetTransitionSettings *)self setRevealWallpaper:0];
  [(CSCoverSheetTransitionSettings *)self setOrientPanelWallpaper:1];
  [(CSCoverSheetTransitionSettings *)self setFadePanelWallpaper:0];
  [(CSCoverSheetTransitionSettings *)self setFadePanelWallpaperStart:0.2];
  [(CSCoverSheetTransitionSettings *)self setFadePanelWallpaperEnd:1.0];
  [(CSCoverSheetTransitionSettings *)self setScaleWallpaper:0];
  [(CSCoverSheetTransitionSettings *)self setWallpaperScale:1.4];
  id v3 = [(CSCoverSheetTransitionSettings *)self wallpaperScaleSettings];
  [v3 setDefaultValues];
  [v3 setBehaviorType:1];
  [v3 setDampingRatio:1.0];
  [v3 setResponse:0.75];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v3, "setFrameRateRange:highFrameRateReason:", 1114125, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
  [(CSCoverSheetTransitionSettings *)self setFadesCoverSheetContent:0];
  [(CSCoverSheetTransitionSettings *)self setAlwaysFadesCoverSheetContent:0];
  [(CSCoverSheetTransitionSettings *)self setFadesCoverSheetContentStart:0.0];
  [(CSCoverSheetTransitionSettings *)self setFadesCoverSheetContentEnd:0.75];
  [(CSCoverSheetTransitionSettings *)self setBlursBehindCoverSheet:0];
  [(CSCoverSheetTransitionSettings *)self setBehindCoverSheetBlurRadius:50.0];
  [(CSCoverSheetTransitionSettings *)self setBehindCoverSheetBlurStart:0.0];
  [(CSCoverSheetTransitionSettings *)self setBehindCoverSheetBlurEnd:1.0];
  [(CSCoverSheetTransitionSettings *)self setIconsFlyIn:1];
  [(CSCoverSheetTransitionSettings *)self setFloatingLayerAsWallpaperOverlay:0];
  [(CSCoverSheetTransitionSettings *)self setTransitionStyle:0];
  [(CSCoverSheetTransitionSettings *)self setUsesFixedWallpaperPresentationProgress:0];
  [(CSCoverSheetTransitionSettings *)self setFixedWallpaperPresentationProgress:0.0];
}

- (BOOL)blursPanel
{
  return !UIAccessibilityIsReduceMotionEnabled() && self->_blursPanel;
}

- (BOOL)fadesContent
{
  return !UIAccessibilityIsReduceMotionEnabled() && self->_fadesContent;
}

- (BOOL)panelWallpaper
{
  return UIAccessibilityIsReduceMotionEnabled() || self->_panelWallpaper;
}

- (BOOL)revealWallpaper
{
  return ![(CSCoverSheetTransitionSettings *)self panelWallpaper] && self->_revealWallpaper;
}

- (BOOL)trackingWallpaper
{
  BOOL v3 = [(CSCoverSheetTransitionSettings *)self panelWallpaper];
  if (v3) {
    LOBYTE(v3) = self->_trackingWallpaper;
  }
  return v3;
}

- (BOOL)_isMaglevActive
{
  return _os_feature_enabled_impl();
}

- (double)trackingWallpaperParallaxFactor
{
  double v3 = 1.0;
  if (![(CSCoverSheetTransitionSettings *)self _isMaglevActive])
  {
    if ([(CSCoverSheetTransitionSettings *)self trackingWallpaper])
    {
      double v3 = 0.0;
      if (!UIAccessibilityIsReduceMotionEnabled()) {
        return self->_trackingWallpaperParallaxFactor;
      }
    }
  }
  return v3;
}

+ (id)settingsControllerModule
{
  v161[4] = *MEMORY[0x1E4F143B8];
  v142 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Blurs Panel" valueKeyPath:@"blursPanel"];
  uint64_t v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"blursPanel == YES"];
  double v3 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Blur Start" valueKeyPath:@"blurStart"];
  v4 = [v3 minValue:0.0 maxValue:1.0];
  CAFrameRateRange v5 = [v4 valueValidator:&__block_literal_global_345];
  v141 = [v5 condition:v2];

  v6 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Blur End" valueKeyPath:@"blurEnd"];
  v7 = [v6 minValue:0.0 maxValue:1.0];
  v8 = [v7 valueValidator:&__block_literal_global_345];
  v145 = (void *)v2;
  v140 = [v8 condition:v2];

  v9 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Blur End Reduced Transparency" valueKeyPath:@"blurEndReducedTransparency"];
  v10 = [v9 minValue:0.0 maxValue:1.0];
  v11 = [v10 valueValidator:&__block_literal_global_345];
  v139 = [v11 condition:v2];

  v12 = (void *)MEMORY[0x1E4F94160];
  v161[0] = v142;
  v161[1] = v141;
  v161[2] = v140;
  v161[3] = v139;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v161 count:4];
  v150 = [v12 sectionWithRows:v13 title:@"Blur"];

  v137 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"orientPanelWallpaper == YES"];
  uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"panelWallpaper == YES"];
  v138 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"trackingWallpaper == YES"];
  v149 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Panel Wallpaper" valueKeyPath:@"panelWallpaper"];
  v15 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Tracking Wallpaper" valueKeyPath:@"trackingWallpaper"];
  v16 = (void *)v14;
  v148 = [v15 condition:v14];

  v17 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Parallax Factor" valueKeyPath:@"trackingWallpaperParallaxFactor"];
  v18 = [v17 minValue:0.0 maxValue:1.0];
  v19 = [v18 valueValidator:&__block_literal_global_345];
  v147 = [v19 condition:v138];

  v20 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Reveal Wallpaper" valueKeyPath:@"revealWallpaper"];
  v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"panelWallpaper == NO"];
  v135 = [v20 condition:v21];

  v22 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Orient Panel Wallpaper" valueKeyPath:@"orientPanelWallpaper"];
  v134 = [v22 condition:v137];

  v23 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Fade Panel Wallpaper" valueKeyPath:@"fadePanelWallpaper"];
  v133 = [v23 condition:v16];

  v24 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Panel WP Fade Start" valueKeyPath:@"fadePanelWallpaperStart"];
  v25 = [v24 minValue:0.0 maxValue:1.0];
  v26 = [v25 valueValidator:&__block_literal_global_345];
  v136 = v16;
  v132 = [v26 condition:v16];

  v27 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Panel WP Fade End" valueKeyPath:@"fadePanelWallpaperEnd"];
  v28 = [v27 minValue:0.0 maxValue:1.0];
  v29 = [v28 valueValidator:&__block_literal_global_345];
  v131 = [v29 condition:v16];

  v30 = (void *)MEMORY[0x1E4F94160];
  v160[0] = v149;
  v160[1] = v148;
  v160[2] = v147;
  v160[3] = v135;
  v160[4] = v134;
  v160[5] = v133;
  v160[6] = v132;
  v160[7] = v131;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v160 count:8];
  v146 = [v30 sectionWithRows:v31 title:@"Panel Wallpaper"];

  v129 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Scale Wallpaper" valueKeyPath:@"scaleWallpaper"];
  uint64_t v32 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"scaleWallpaper == YES"];
  v33 = [MEMORY[0x1E4F941D8] rowWithTitle:@"WP Scale" valueKeyPath:@"wallpaperScale"];
  v34 = [v33 minValue:0.75 maxValue:2.0];
  v130 = (void *)v32;
  v128 = [v34 condition:v32];

  v35 = [MEMORY[0x1E4F94130] rowWithTitle:@"WP Scale Settings" childSettingsKeyPath:@"wallpaperScaleSettings"];
  v127 = [v35 condition:v32];

  v36 = (void *)MEMORY[0x1E4F94160];
  v159[0] = v129;
  v159[1] = v128;
  v159[2] = v127;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v159 count:3];
  v144 = [v36 sectionWithRows:v37 title:@"Scale Wallpaper"];

  v125 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Fades Content" valueKeyPath:@"fadesContent"];
  uint64_t v38 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"fadesContent == YES"];
  v39 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Content Alpha" valueKeyPath:@"maxContentAlpha"];
  v40 = [v39 minValue:0.0 maxValue:1.0];
  v41 = [v40 valueValidator:&__block_literal_global_345];
  v124 = [v41 condition:v38];

  v42 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Fade Start" valueKeyPath:@"contentFadeStart"];
  v43 = [v42 minValue:0.0 maxValue:1.0];
  v44 = [v43 valueValidator:&__block_literal_global_345];
  v126 = (void *)v38;
  v123 = [v44 condition:v38];

  v45 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Fade End" valueKeyPath:@"contentFadeEnd"];
  v46 = [v45 minValue:0.0 maxValue:1.0];
  v47 = [v46 valueValidator:&__block_literal_global_345];
  v122 = [v47 condition:v38];

  v48 = (void *)MEMORY[0x1E4F94160];
  v158[0] = v125;
  v158[1] = v124;
  v158[2] = v123;
  v158[3] = v122;
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v158 count:4];
  v143 = [v48 sectionWithRows:v49 title:@"Fade Content"];

  v121 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Darkens Content" valueKeyPath:@"darkensContent"];
  v50 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"darkensContent == YES"];
  v51 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Color White" valueKeyPath:@"darkeningColorWhite"];
  v52 = [v51 minValue:0.0 maxValue:1.0];
  v53 = [v52 valueValidator:&__block_literal_global_345];
  v120 = [v53 condition:v50];

  v54 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Color Alpha" valueKeyPath:@"darkeningColorAlpha"];
  v55 = [v54 minValue:0.0 maxValue:1.0];
  v56 = [v55 valueValidator:&__block_literal_global_345];
  v119 = [v56 condition:v50];

  v57 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Start" valueKeyPath:@"darkeningStart"];
  v58 = [v57 minValue:0.0 maxValue:1.0];
  v59 = [v58 valueValidator:&__block_literal_global_345];
  v118 = [v59 condition:v50];

  v60 = [MEMORY[0x1E4F941D8] rowWithTitle:@"End" valueKeyPath:@"darkeningEnd"];
  v61 = [v60 minValue:0.0 maxValue:1.0];
  v62 = [v61 valueValidator:&__block_literal_global_345];
  v117 = [v62 condition:v50];

  v63 = (void *)MEMORY[0x1E4F94160];
  v157[0] = v121;
  v157[1] = v120;
  v157[2] = v119;
  v157[3] = v118;
  v157[4] = v117;
  v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v157 count:5];
  v114 = [v63 sectionWithRows:v64 title:@"Darken Content"];

  v115 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Fades Cover Sheet" valueKeyPath:@"fadesCoverSheetContent"];
  uint64_t v65 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"fadesCoverSheetContent == YES"];
  v66 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Fade Start" valueKeyPath:@"fadesCoverSheetContentStart"];
  v67 = [v66 minValue:0.0 maxValue:1.0];
  v113 = [v67 condition:v65];

  v68 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Fade End" valueKeyPath:@"fadesCoverSheetContentEnd"];
  v69 = [v68 minValue:0.0 maxValue:1.0];
  v116 = (void *)v65;
  v112 = [v69 condition:v65];

  v70 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Always Fade" valueKeyPath:@"alwaysFadesCoverSheetContent"];
  v111 = [v70 condition:v65];

  v71 = (void *)MEMORY[0x1E4F94160];
  v156[0] = v115;
  v156[1] = v113;
  v156[2] = v112;
  v156[3] = v111;
  v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v156 count:4];
  v109 = [v71 sectionWithRows:v72 title:@"Fade Cover Sheet"];

  v108 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Blurs Behind Cover Sheet" valueKeyPath:@"blursBehindCoverSheet"];
  v110 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"blursBehindCoverSheet == YES"];
  v73 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Blur Radius" valueKeyPath:@"behindCoverSheetBlurRadius"];
  v74 = [v73 minValue:0.0 maxValue:100.0];
  v75 = [v74 valueValidator:&__block_literal_global_347];
  v107 = [v75 condition:v110];

  v76 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Blur Start" valueKeyPath:@"behindCoverSheetBlurStart"];
  v77 = [v76 minValue:0.0 maxValue:1.0];
  v78 = [v77 valueValidator:&__block_literal_global_345];
  v106 = [v78 condition:v2];

  v79 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Blur End" valueKeyPath:@"behindCoverSheetBlurEnd"];
  v80 = [v79 minValue:0.0 maxValue:1.0];
  v81 = [v80 valueValidator:&__block_literal_global_345];
  v105 = [v81 condition:v2];

  v82 = (void *)MEMORY[0x1E4F94160];
  v155[0] = v108;
  v155[1] = v107;
  v155[2] = v106;
  v155[3] = v105;
  v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v155 count:4];
  v84 = [v82 sectionWithRows:v83 title:@"Blur Behind Cover Sheet"];

  v104 = [MEMORY[0x1E4F94108] rowWithTitle:@"Transition Style" valueKeyPath:@"transitionStyle"];
  [v104 setPossibleTitles:&unk_1F306B1E8];
  [v104 setPossibleValues:&unk_1F306B200];
  v85 = (void *)MEMORY[0x1E4F94160];
  v154 = v104;
  v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v154 count:1];
  v102 = [v85 sectionWithRows:v86 title:@"Transition Style"];

  v103 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Icons Fly In" valueKeyPath:@"iconsFlyIn"];
  v87 = (void *)MEMORY[0x1E4F94160];
  v153 = v103;
  v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v153 count:1];
  v101 = [v87 sectionWithRows:v88 title:@"Icons Fly In"];

  v100 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Uses Fixed Wallpaper Presentation Progress" valueKeyPath:@"usesFixedWallpaperPresentationProgress"];
  v89 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"usesFixedWallpaperPresentationProgress == YES"];
  v90 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Fixed Wallpaper Presentation Progress" valueKeyPath:@"fixedWallpaperPresentationProgress"];
  v91 = [v90 minValue:0.0 maxValue:1.0];
  v92 = [v91 condition:v89];

  v93 = (void *)MEMORY[0x1E4F94160];
  v152[0] = v100;
  v152[1] = v92;
  v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:2];
  v95 = [v93 sectionWithRows:v94 title:@"Fixed Wallpaper Presentation Progress"];

  v96 = (void *)MEMORY[0x1E4F94160];
  v151[0] = v150;
  v151[1] = v146;
  v151[2] = v144;
  v151[3] = v143;
  v151[4] = v114;
  v151[5] = v109;
  v151[6] = v84;
  v151[7] = v102;
  v151[8] = v101;
  v151[9] = v95;
  v97 = [MEMORY[0x1E4F1C978] arrayWithObjects:v151 count:10];
  v98 = [v96 moduleWithTitle:@"Hey" contents:v97];

  return v98;
}

uint64_t __58__CSCoverSheetTransitionSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  [a2 floatValue];
  double v4 = round(v3 / 0.1) * 0.1;

  return [v2 numberWithDouble:v4];
}

uint64_t __58__CSCoverSheetTransitionSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  [a2 floatValue];
  double v4 = roundf(v3);

  return [v2 numberWithDouble:v4];
}

- (NSString)description
{
  return (NSString *)[(CSCoverSheetTransitionSettings *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(CSCoverSheetTransitionSettings *)self succinctDescriptionBuilder];
  float v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  float v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_iconsFlyIn withName:@"iconsFlyIn"];
  BOOL v5 = [(CSCoverSheetTransitionSettings *)self blursPanel];
  id v6 = (id)[v3 appendBool:v5 withName:@"blursPanel"];
  if (v5)
  {
    v7 = [v3 activeMultilinePrefix];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke;
    v32[3] = &unk_1E6AD88C0;
    id v33 = v3;
    v34 = self;
    [v33 appendBodySectionWithName:@"Blur Settings" multilinePrefix:v7 block:v32];
  }
  BOOL v8 = [(CSCoverSheetTransitionSettings *)self fadesContent];
  id v9 = (id)[v3 appendBool:v8 withName:@"fadesContent"];
  if (v8)
  {
    v10 = [v3 activeMultilinePrefix];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke_2;
    v29[3] = &unk_1E6AD88C0;
    id v30 = v3;
    v31 = self;
    [v30 appendBodySectionWithName:@"Fade Settings" multilinePrefix:v10 block:v29];
  }
  BOOL v11 = [(CSCoverSheetTransitionSettings *)self darkensContent];
  id v12 = (id)[v3 appendBool:v11 withName:@"darkensContent"];
  if (v11)
  {
    v13 = [v3 activeMultilinePrefix];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke_3;
    v26[3] = &unk_1E6AD88C0;
    id v27 = v3;
    v28 = self;
    [v27 appendBodySectionWithName:@"Darken Settings" multilinePrefix:v13 block:v26];
  }
  BOOL v14 = [(CSCoverSheetTransitionSettings *)self panelWallpaper];
  id v15 = (id)[v3 appendBool:v14 withName:@"panelWallpaper"];
  if (v14)
  {
    v16 = [v3 activeMultilinePrefix];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke_4;
    v23 = &unk_1E6AD88C0;
    v24 = self;
    id v25 = v3;
    [v25 appendBodySectionWithName:@"Panel Wallpaper Settings" multilinePrefix:v16 block:&v20];
  }
  else
  {
    id v17 = (id)objc_msgSend(v3, "appendBool:withName:", -[CSCoverSheetTransitionSettings revealWallpaper](self, "revealWallpaper"), @"revealWallpaper");
  }
  id v18 = (id)objc_msgSend(v3, "appendBool:withName:", -[CSCoverSheetTransitionSettings iconsFlyIn](self, "iconsFlyIn", v20, v21, v22, v23, v24), @"iconsFlyIn");

  return v3;
}

id __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) blurStart];
  id v3 = (id)objc_msgSend(v2, "appendFloat:withName:", @"blurStart");
  id v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) blurEnd];
  id v5 = (id)objc_msgSend(v4, "appendFloat:withName:", @"blurEnd");
  id v6 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) blurEndReducedTransparency];
  return (id)objc_msgSend(v6, "appendFloat:withName:", @"blurEndReducedTransparency");
}

id __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) contentFadeStart];
  id v3 = (id)objc_msgSend(v2, "appendFloat:withName:", @"contentFadeStart");
  id v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) contentFadeEnd];
  id v5 = (id)objc_msgSend(v4, "appendFloat:withName:", @"contentFadeEnd");
  id v6 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) maxContentAlpha];
  return (id)objc_msgSend(v6, "appendFloat:withName:", @"maxContentAlpha");
}

id __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) darkeningStart];
  id v3 = (id)objc_msgSend(v2, "appendFloat:withName:", @"darkeningStart");
  id v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) darkeningEnd];
  id v5 = (id)objc_msgSend(v4, "appendFloat:withName:", @"darkeningEnd");
  id v6 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) darkeningColorWhite];
  id v7 = (id)objc_msgSend(v6, "appendFloat:withName:", @"darkeningColorWhite");
  BOOL v8 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) darkeningColorAlpha];
  return (id)objc_msgSend(v8, "appendFloat:withName:", @"darkeningColorAlpha");
}

void __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) trackingWallpaper];
  id v3 = (id)[*(id *)(a1 + 40) appendBool:v2 withName:@"trackingWallpaper"];
  if (v2)
  {
    id v4 = *(void **)(a1 + 40);
    [*(id *)(a1 + 32) trackingWallpaperParallaxFactor];
    id v6 = (id)[v4 appendBool:v5 != 0.0 withName:@"trackingWallpaperParallaxFactor"];
  }
  id v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 32), "orientPanelWallpaper"), @"orientPanelWallpaper");
  uint64_t v8 = [*(id *)(a1 + 32) fadePanelWallpaper];
  id v9 = (id)[*(id *)(a1 + 40) appendBool:v8 withName:@"fadePanelWallpaper"];
  if (v8)
  {
    v10 = *(void **)(a1 + 40);
    BOOL v11 = [v10 activeMultilinePrefix];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke_5;
    v14[3] = &unk_1E6AD88C0;
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 32);
    id v15 = v12;
    uint64_t v16 = v13;
    [v10 appendBodySectionWithName:@"Fade Panel Wallpaper Settings" multilinePrefix:v11 block:v14];
  }
}

id __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) fadePanelWallpaperStart];
  id v3 = (id)objc_msgSend(v2, "appendFloat:withName:", @"fadePanelWallpaperStart");
  id v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) fadePanelWallpaperEnd];
  return (id)objc_msgSend(v4, "appendFloat:withName:", @"fadePanelWallpaperEnd");
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(CSCoverSheetTransitionSettings *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (void)setBlursPanel:(BOOL)a3
{
  self->_blursPanel = a3;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (void)setBlurRadius:(double)a3
{
  self->_blurRadius = a3;
}

- (double)blurStart
{
  return self->_blurStart;
}

- (void)setBlurStart:(double)a3
{
  self->_blurStart = a3;
}

- (double)blurEnd
{
  return self->_blurEnd;
}

- (void)setBlurEnd:(double)a3
{
  self->_blurEnd = a3;
}

- (double)blurEndReducedTransparency
{
  return self->_blurEndReducedTransparency;
}

- (void)setBlurEndReducedTransparency:(double)a3
{
  self->_blurEndReducedTransparency = a3;
}

- (void)setFadesContent:(BOOL)a3
{
  self->_fadesContent = a3;
}

- (double)maxContentAlpha
{
  return self->_maxContentAlpha;
}

- (void)setMaxContentAlpha:(double)a3
{
  self->_maxContentAlpha = a3;
}

- (double)contentFadeStart
{
  return self->_contentFadeStart;
}

- (void)setContentFadeStart:(double)a3
{
  self->_contentFadeStart = a3;
}

- (double)contentFadeEnd
{
  return self->_contentFadeEnd;
}

- (void)setContentFadeEnd:(double)a3
{
  self->_contentFadeEnd = a3;
}

- (BOOL)darkensContent
{
  return self->_darkensContent;
}

- (void)setDarkensContent:(BOOL)a3
{
  self->_darkensContent = a3;
}

- (double)darkeningColorWhite
{
  return self->_darkeningColorWhite;
}

- (void)setDarkeningColorWhite:(double)a3
{
  self->_darkeningColorWhite = a3;
}

- (double)darkeningColorAlpha
{
  return self->_darkeningColorAlpha;
}

- (void)setDarkeningColorAlpha:(double)a3
{
  self->_darkeningColorAlpha = a3;
}

- (double)darkeningStart
{
  return self->_darkeningStart;
}

- (void)setDarkeningStart:(double)a3
{
  self->_darkeningStart = a3;
}

- (double)darkeningEnd
{
  return self->_darkeningEnd;
}

- (void)setDarkeningEnd:(double)a3
{
  self->_darkeningEnd = a3;
}

- (void)setPanelWallpaper:(BOOL)a3
{
  self->_panelWallpaper = a3;
}

- (void)setTrackingWallpaper:(BOOL)a3
{
  self->_trackingWallpaper = a3;
}

- (void)setTrackingWallpaperParallaxFactor:(double)a3
{
  self->_trackingWallpaperParallaxFactor = a3;
}

- (void)setRevealWallpaper:(BOOL)a3
{
  self->_revealWallpaper = a3;
}

- (BOOL)orientPanelWallpaper
{
  return self->_orientPanelWallpaper;
}

- (void)setOrientPanelWallpaper:(BOOL)a3
{
  self->_orientPanelWallpaper = a3;
}

- (BOOL)fadePanelWallpaper
{
  return self->_fadePanelWallpaper;
}

- (void)setFadePanelWallpaper:(BOOL)a3
{
  self->_fadePanelWallpaper = a3;
}

- (double)fadePanelWallpaperStart
{
  return self->_fadePanelWallpaperStart;
}

- (void)setFadePanelWallpaperStart:(double)a3
{
  self->_fadePanelWallpaperStart = a3;
}

- (double)fadePanelWallpaperEnd
{
  return self->_fadePanelWallpaperEnd;
}

- (void)setFadePanelWallpaperEnd:(double)a3
{
  self->_fadePanelWallpaperEnd = a3;
}

- (BOOL)scaleWallpaper
{
  return self->_scaleWallpaper;
}

- (void)setScaleWallpaper:(BOOL)a3
{
  self->_scaleWallpaper = a3;
}

- (double)wallpaperScale
{
  return self->_wallpaperScale;
}

- (void)setWallpaperScale:(double)a3
{
  self->_wallpaperScale = a3;
}

- (SBFFluidBehaviorSettings)wallpaperScaleSettings
{
  return self->_wallpaperScaleSettings;
}

- (void)setWallpaperScaleSettings:(id)a3
{
}

- (BOOL)fadesCoverSheetContent
{
  return self->_fadesCoverSheetContent;
}

- (void)setFadesCoverSheetContent:(BOOL)a3
{
  self->_fadesCoverSheetContent = a3;
}

- (double)fadesCoverSheetContentStart
{
  return self->_fadesCoverSheetContentStart;
}

- (void)setFadesCoverSheetContentStart:(double)a3
{
  self->_fadesCoverSheetContentStart = a3;
}

- (double)fadesCoverSheetContentEnd
{
  return self->_fadesCoverSheetContentEnd;
}

- (void)setFadesCoverSheetContentEnd:(double)a3
{
  self->_fadesCoverSheetContentEnd = a3;
}

- (BOOL)alwaysFadesCoverSheetContent
{
  return self->_alwaysFadesCoverSheetContent;
}

- (void)setAlwaysFadesCoverSheetContent:(BOOL)a3
{
  self->_alwaysFadesCoverSheetContent = a3;
}

- (BOOL)blursBehindCoverSheet
{
  return self->_blursBehindCoverSheet;
}

- (void)setBlursBehindCoverSheet:(BOOL)a3
{
  self->_blursBehindCoverSheet = a3;
}

- (double)behindCoverSheetBlurRadius
{
  return self->_behindCoverSheetBlurRadius;
}

- (void)setBehindCoverSheetBlurRadius:(double)a3
{
  self->_behindCoverSheetBlurRadius = a3;
}

- (double)behindCoverSheetBlurStart
{
  return self->_behindCoverSheetBlurStart;
}

- (void)setBehindCoverSheetBlurStart:(double)a3
{
  self->_behindCoverSheetBlurStart = a3;
}

- (double)behindCoverSheetBlurEnd
{
  return self->_behindCoverSheetBlurEnd;
}

- (void)setBehindCoverSheetBlurEnd:(double)a3
{
  self->_behindCoverSheetBlurEnd = a3;
}

- (int64_t)transitionStyle
{
  return self->_transitionStyle;
}

- (void)setTransitionStyle:(int64_t)a3
{
  self->_transitionStyle = a3;
}

- (BOOL)iconsFlyIn
{
  return self->_iconsFlyIn;
}

- (void)setIconsFlyIn:(BOOL)a3
{
  self->_iconsFlyIn = a3;
}

- (BOOL)floatingLayerAsWallpaperOverlay
{
  return self->_floatingLayerAsWallpaperOverlay;
}

- (void)setFloatingLayerAsWallpaperOverlay:(BOOL)a3
{
  self->_floatingLayerAsWallpaperOverlay = a3;
}

- (BOOL)usesFixedWallpaperPresentationProgress
{
  return self->_usesFixedWallpaperPresentationProgress;
}

- (void)setUsesFixedWallpaperPresentationProgress:(BOOL)a3
{
  self->_usesFixedWallpaperPresentationProgress = a3;
}

- (double)fixedWallpaperPresentationProgress
{
  return self->_fixedWallpaperPresentationProgress;
}

- (void)setFixedWallpaperPresentationProgress:(double)a3
{
  self->_fixedWallpaperPresentationProgress = a3;
}

- (void).cxx_destruct
{
}

@end