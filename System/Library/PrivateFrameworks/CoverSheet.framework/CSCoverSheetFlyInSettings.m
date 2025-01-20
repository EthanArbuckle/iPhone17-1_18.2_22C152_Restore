@interface CSCoverSheetFlyInSettings
+ (id)settingsControllerModule;
- (BOOL)animateIconsOnPresentationToo;
- (BOOL)centerFollowsFinger;
- (double)baselineDistance;
- (double)distanceExponent;
- (double)effectMultiplier;
- (double)iconsFlyInFriction;
- (double)iconsFlyInInteractiveDampingRatioMax;
- (double)iconsFlyInInteractiveDampingRatioMin;
- (double)iconsFlyInInteractiveResponseMax;
- (double)iconsFlyInInteractiveResponseMin;
- (double)iconsFlyInTension;
- (double)slomoRate;
- (void)setAnimateIconsOnPresentationToo:(BOOL)a3;
- (void)setBaselineDistance:(double)a3;
- (void)setCenterFollowsFinger:(BOOL)a3;
- (void)setDefaultValues;
- (void)setDistanceExponent:(double)a3;
- (void)setEffectMultiplier:(double)a3;
- (void)setIconsFlyInFriction:(double)a3;
- (void)setIconsFlyInInteractiveDampingRatioMax:(double)a3;
- (void)setIconsFlyInInteractiveDampingRatioMin:(double)a3;
- (void)setIconsFlyInInteractiveResponseMax:(double)a3;
- (void)setIconsFlyInInteractiveResponseMin:(double)a3;
- (void)setIconsFlyInTension:(double)a3;
- (void)setSlomoRate:(double)a3;
@end

@implementation CSCoverSheetFlyInSettings

- (void)setDefaultValues
{
  [(CSCoverSheetFlyInSettings *)self setCenterFollowsFinger:0];
  [(CSCoverSheetFlyInSettings *)self setAnimateIconsOnPresentationToo:0];
  [(CSCoverSheetFlyInSettings *)self setIconsFlyInInteractiveResponseMin:0.5];
  [(CSCoverSheetFlyInSettings *)self setIconsFlyInInteractiveResponseMax:0.86];
  [(CSCoverSheetFlyInSettings *)self setIconsFlyInInteractiveDampingRatioMin:0.7];
  [(CSCoverSheetFlyInSettings *)self setIconsFlyInInteractiveDampingRatioMax:0.9];
  uint64_t v3 = SBFEffectiveHomeButtonType();
  double v4 = 130.0;
  if (v3 == 2)
  {
    double v4 = 72.0;
    double v5 = 14.4;
  }
  else
  {
    double v5 = 22.0;
  }
  [(CSCoverSheetFlyInSettings *)self setIconsFlyInTension:v4];
  [(CSCoverSheetFlyInSettings *)self setIconsFlyInFriction:v5];
  [(CSCoverSheetFlyInSettings *)self setSlomoRate:2000.0];
  [(CSCoverSheetFlyInSettings *)self setBaselineDistance:0.5];
  [(CSCoverSheetFlyInSettings *)self setEffectMultiplier:7.7];

  [(CSCoverSheetFlyInSettings *)self setDistanceExponent:1.0];
}

+ (id)settingsControllerModule
{
  v33[2] = *MEMORY[0x1E4F143B8];
  v28 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Center Follows Finger" valueKeyPath:@"centerFollowsFinger"];
  v27 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Animate On Presentation Too" valueKeyPath:@"animateIconsOnPresentationToo"];
  v2 = (void *)MEMORY[0x1E4F94160];
  v33[0] = v28;
  v33[1] = v27;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  double v4 = [v2 sectionWithRows:v3 title:@"Icons FlyIn"];

  v26 = [MEMORY[0x1E4F94148] rowWithTitle:@"Tension" valueKeyPath:@"iconsFlyInTension"];
  v25 = [MEMORY[0x1E4F94148] rowWithTitle:@"Friction" valueKeyPath:@"iconsFlyInFriction"];
  double v5 = (void *)MEMORY[0x1E4F94160];
  v32[0] = v26;
  v32[1] = v25;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  v21 = [v5 sectionWithRows:v6 title:@"Animated"];

  v24 = [MEMORY[0x1E4F94148] rowWithTitle:@"Interactive Response Min" valueKeyPath:@"iconsFlyInInteractiveResponseMin"];
  v23 = [MEMORY[0x1E4F94148] rowWithTitle:@"Interactive Response Max" valueKeyPath:@"iconsFlyInInteractiveResponseMax"];
  v22 = [MEMORY[0x1E4F94148] rowWithTitle:@"Interactive Damping Ratio Min" valueKeyPath:@"iconsFlyInInteractiveDampingRatioMin"];
  v20 = [MEMORY[0x1E4F94148] rowWithTitle:@"Interactive Damping Ratio Max" valueKeyPath:@"iconsFlyInInteractiveDampingRatioMax"];
  v7 = (void *)MEMORY[0x1E4F94160];
  v31[0] = v24;
  v31[1] = v23;
  v31[2] = v22;
  v31[3] = v20;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
  v9 = [v7 sectionWithRows:v8 title:@"Interactive"];

  v10 = [MEMORY[0x1E4F94148] rowWithTitle:@"Baseline Distance" valueKeyPath:@"baselineDistance"];
  v11 = [MEMORY[0x1E4F94148] rowWithTitle:@"Effect Multiplier" valueKeyPath:@"effectMultiplier"];
  v12 = [MEMORY[0x1E4F94148] rowWithTitle:@"Distance Exponent" valueKeyPath:@"distanceExponent"];
  v13 = (void *)MEMORY[0x1E4F94160];
  v30[0] = v10;
  v30[1] = v11;
  v30[2] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
  v15 = [v13 sectionWithRows:v14 title:@"Animation / Curve"];

  v16 = (void *)MEMORY[0x1E4F94160];
  v29[0] = v4;
  v29[1] = v21;
  v29[2] = v9;
  v29[3] = v15;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  v18 = [v16 moduleWithTitle:@"Hey" contents:v17];

  return v18;
}

- (BOOL)centerFollowsFinger
{
  return self->_centerFollowsFinger;
}

- (void)setCenterFollowsFinger:(BOOL)a3
{
  self->_centerFollowsFinger = a3;
}

- (BOOL)animateIconsOnPresentationToo
{
  return self->_animateIconsOnPresentationToo;
}

- (void)setAnimateIconsOnPresentationToo:(BOOL)a3
{
  self->_animateIconsOnPresentationToo = a3;
}

- (double)iconsFlyInInteractiveResponseMin
{
  return self->_iconsFlyInInteractiveResponseMin;
}

- (void)setIconsFlyInInteractiveResponseMin:(double)a3
{
  self->_iconsFlyInInteractiveResponseMin = a3;
}

- (double)iconsFlyInInteractiveResponseMax
{
  return self->_iconsFlyInInteractiveResponseMax;
}

- (void)setIconsFlyInInteractiveResponseMax:(double)a3
{
  self->_iconsFlyInInteractiveResponseMax = a3;
}

- (double)iconsFlyInInteractiveDampingRatioMin
{
  return self->_iconsFlyInInteractiveDampingRatioMin;
}

- (void)setIconsFlyInInteractiveDampingRatioMin:(double)a3
{
  self->_iconsFlyInInteractiveDampingRatioMin = a3;
}

- (double)iconsFlyInInteractiveDampingRatioMax
{
  return self->_iconsFlyInInteractiveDampingRatioMax;
}

- (void)setIconsFlyInInteractiveDampingRatioMax:(double)a3
{
  self->_iconsFlyInInteractiveDampingRatioMax = a3;
}

- (double)iconsFlyInTension
{
  return self->_iconsFlyInTension;
}

- (void)setIconsFlyInTension:(double)a3
{
  self->_iconsFlyInTension = a3;
}

- (double)iconsFlyInFriction
{
  return self->_iconsFlyInFriction;
}

- (void)setIconsFlyInFriction:(double)a3
{
  self->_iconsFlyInFriction = a3;
}

- (double)slomoRate
{
  return self->_slomoRate;
}

- (void)setSlomoRate:(double)a3
{
  self->_slomoRate = a3;
}

- (double)baselineDistance
{
  return self->_baselineDistance;
}

- (void)setBaselineDistance:(double)a3
{
  self->_baselineDistance = a3;
}

- (double)effectMultiplier
{
  return self->_effectMultiplier;
}

- (void)setEffectMultiplier:(double)a3
{
  self->_effectMultiplier = a3;
}

- (double)distanceExponent
{
  return self->_distanceExponent;
}

- (void)setDistanceExponent:(double)a3
{
  self->_distanceExponent = a3;
}

@end