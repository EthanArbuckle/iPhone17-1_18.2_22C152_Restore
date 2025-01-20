@interface ARUIRingGroupController
+ (double)defaultAnimationDuration;
+ (id)animationTimingFunction;
+ (id)ringGroupControllerConfiguredForCompanionWithRingType:(int64_t)a3 withIcon:(BOOL)a4;
+ (id)ringGroupControllerConfiguredForWatchWithRingType:(int64_t)a3 withIcon:(BOOL)a4;
- (ARUIRingGroup)ringGroup;
- (ARUIRingGroupController)init;
- (ARUIRingGroupController)initWithNumberOfRings:(int64_t)a3;
- (ARUIRingGroupController)initWithRingGroup:(id)a3;
- (ARUISpriteSheet)spriteSheet;
- (CGPoint)center;
- (double)additionalSpacingAtIndex;
- (double)backingOrigin;
- (float)diameterForRingAtIndex:(unint64_t)a3;
- (float)emptyOpacity;
- (float)opacity;
- (float)ringDiameter;
- (float)ringIconSize;
- (float)ringInterspacing;
- (float)ringScale;
- (float)ringThickness;
- (float)trackOpacity;
- (float)zRotation;
- (int64_t)numberOfRings;
- (void)addAnimation:(id)a3 forRingGroupPropertyType:(unint64_t)a4;
- (void)addCelebration:(id)a3 toRingAtIndex:(int64_t)a4;
- (void)setActiveEnergyPercentage:(double)a3 animated:(BOOL)a4;
- (void)setActiveEnergyPercentage:(double)a3 briskPercentage:(double)a4 movingHoursPercentage:(double)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)setAdditionalSpacingAtIndex:(double)a3;
- (void)setBackingOrigin:(double)a3;
- (void)setBriskPercentage:(double)a3 animated:(BOOL)a4;
- (void)setCenter:(CGPoint)a3;
- (void)setEmptyOpacity:(float)a3;
- (void)setMovingHoursPercentage:(double)a3 animated:(BOOL)a4;
- (void)setOpacity:(double)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5;
- (void)setOpacity:(float)a3;
- (void)setPercentage:(double)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5;
- (void)setPercentage:(double)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)setPercentage:(double)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5 duration:(double)a6 timingFunction:(id)a7 completion:(id)a8;
- (void)setRingDiameter:(float)a3;
- (void)setRingIconSize:(float)a3;
- (void)setRingInterspacing:(float)a3;
- (void)setRingScale:(float)a3;
- (void)setRingThickness:(double)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5;
- (void)setRingThickness:(float)a3;
- (void)setSpriteSheet:(id)a3;
- (void)setTopColor:(id)a3 bottomColor:(id)a4;
- (void)setTopColor:(id)a3 bottomColor:(id)a4 contrastColor:(id)a5 ofRingAtIndex:(int64_t)a6;
- (void)setTopColor:(id)a3 bottomColor:(id)a4 ofRingAtIndex:(int64_t)a5;
- (void)setTrackOpacity:(float)a3;
- (void)setZRotation:(float)a3;
@end

@implementation ARUIRingGroupController

+ (id)animationTimingFunction
{
  LODWORD(v2) = 1051361018;
  LODWORD(v3) = 1.0;
  return (id)[MEMORY[0x263F15808] functionWithControlPoints:v2 :0.0 :0.0 :v3];
}

+ (double)defaultAnimationDuration
{
  return 1.1;
}

- (ARUIRingGroupController)init
{
  double v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"-init is unavailable on %@.", v6 format];

  return 0;
}

- (ARUIRingGroupController)initWithNumberOfRings:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ARUIRingGroupController;
  uint64_t v4 = [(ARUIRingGroupController *)&v8 init];
  if (v4)
  {
    v5 = [[ARUIRingGroup alloc] initWithNumberOfRings:a3];
    ringGroup = v4->_ringGroup;
    v4->_ringGroup = v5;
  }
  return v4;
}

- (ARUIRingGroupController)initWithRingGroup:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARUIRingGroupController;
  v6 = [(ARUIRingGroupController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ringGroup, a3);
  }

  return v7;
}

- (int64_t)numberOfRings
{
  double v2 = [(ARUIRingGroup *)self->_ringGroup rings];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)setSpriteSheet:(id)a3
{
  [(ARUIRingGroup *)self->_ringGroup setSpriteSheet:a3];
  ringGroup = self->_ringGroup;

  [(ARUIRingGroup *)ringGroup playSpriteAnimation];
}

- (ARUISpriteSheet)spriteSheet
{
  return [(ARUIRingGroup *)self->_ringGroup spriteSheet];
}

- (CGPoint)center
{
  [(ARUIRingGroup *)self->_ringGroup translation];
  double v4 = v3;
  [(ARUIRingGroup *)self->_ringGroup translation];
  double v6 = v5;
  double v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  CGFloat y = a3.y;
  [(ARUIRingGroup *)self->_ringGroup setTranslation:COERCE_DOUBLE(vcvt_f32_f64((float64x2_t)a3))];
}

- (float)opacity
{
  [(ARUIRingGroup *)self->_ringGroup opacity];
  return result;
}

- (void)setOpacity:(float)a3
{
}

- (float)emptyOpacity
{
  [(ARUIRingGroup *)self->_ringGroup emptyOpacity];
  return result;
}

- (void)setEmptyOpacity:(float)a3
{
}

- (float)ringDiameter
{
  [(ARUIRingGroup *)self->_ringGroup groupDiameter];
  return result;
}

- (void)setRingDiameter:(float)a3
{
}

- (float)ringInterspacing
{
  [(ARUIRingGroup *)self->_ringGroup interspacing];
  return result;
}

- (void)setRingInterspacing:(float)a3
{
}

- (float)ringThickness
{
  [(ARUIRingGroup *)self->_ringGroup thickness];
  return result;
}

- (void)setRingThickness:(float)a3
{
}

- (float)ringScale
{
  [(ARUIRingGroup *)self->_ringGroup scale];
  return result;
}

- (void)setRingScale:(float)a3
{
}

- (float)trackOpacity
{
  [(ARUIRingGroup *)self->_ringGroup trackOpacity];
  return result;
}

- (void)setTrackOpacity:(float)a3
{
}

- (float)zRotation
{
  [(ARUIRingGroup *)self->_ringGroup zRotation];
  return result;
}

- (void)setZRotation:(float)a3
{
}

- (void)addAnimation:(id)a3 forRingGroupPropertyType:(unint64_t)a4
{
  id v6 = a3;
  double v7 = v6;
  switch(a4)
  {
    case 0uLL:
      objc_super v8 = [v6 _endValue];
      [v8 CGPointValue];
      long long v51 = v10;
      long long v52 = v9;

      *(void *)&v11.f64[0] = v52;
      *(void *)&v11.f64[1] = v51;
      float32x2_t v12 = vcvt_f32_f64(v11);
      [v7 duration];
      double v14 = v13;
      v69[0] = MEMORY[0x263EF8330];
      v69[1] = 3221225472;
      v69[2] = __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke;
      v69[3] = &unk_264498D30;
      v69[4] = self;
      v69[5] = v12;
      v15 = [v7 completionHandler];
      v16 = v69;
      double v17 = v14;
      goto LABEL_12;
    case 1uLL:
      v18 = [v6 _endValue];
      [v18 floatValue];
      int v20 = v19;

      [v7 duration];
      double v22 = v21;
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      v67[2] = __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_2;
      v67[3] = &unk_264498D58;
      v67[4] = self;
      int v68 = v20;
      v15 = [v7 completionHandler];
      v16 = v67;
      goto LABEL_11;
    case 2uLL:
      v23 = [v6 _endValue];
      [v23 floatValue];
      int v25 = v24;

      [v7 duration];
      double v22 = v26;
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_3;
      v65[3] = &unk_264498D58;
      v65[4] = self;
      int v66 = v25;
      v15 = [v7 completionHandler];
      v16 = v65;
      goto LABEL_11;
    case 3uLL:
      v27 = [v6 _endValue];
      [v27 floatValue];
      int v29 = v28;

      [v7 duration];
      double v22 = v30;
      v63[0] = MEMORY[0x263EF8330];
      v63[1] = 3221225472;
      v63[2] = __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_4;
      v63[3] = &unk_264498D58;
      v63[4] = self;
      int v64 = v29;
      v15 = [v7 completionHandler];
      v16 = v63;
      goto LABEL_11;
    case 5uLL:
      v31 = [v6 _endValue];
      [v31 floatValue];
      int v33 = v32;

      [v7 duration];
      double v22 = v34;
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_5;
      v61[3] = &unk_264498D58;
      v61[4] = self;
      int v62 = v33;
      v15 = [v7 completionHandler];
      v16 = v61;
      goto LABEL_11;
    case 6uLL:
      v35 = [v6 _endValue];
      [v35 floatValue];
      int v37 = v36;

      [v7 duration];
      double v22 = v38;
      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_6;
      v59[3] = &unk_264498D58;
      v59[4] = self;
      int v60 = v37;
      v15 = [v7 completionHandler];
      v16 = v59;
      goto LABEL_11;
    case 7uLL:
      v39 = [v6 _endValue];
      [v39 floatValue];
      int v41 = v40;

      [v7 duration];
      double v22 = v42;
      v57[0] = MEMORY[0x263EF8330];
      v57[1] = 3221225472;
      v57[2] = __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_7;
      v57[3] = &unk_264498D58;
      v57[4] = self;
      int v58 = v41;
      v15 = [v7 completionHandler];
      v16 = v57;
      goto LABEL_11;
    case 8uLL:
      v43 = [v6 _endValue];
      [v43 floatValue];
      int v45 = v44;

      [v7 duration];
      double v22 = v46;
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_8;
      v55[3] = &unk_264498D58;
      v55[4] = self;
      int v56 = v45;
      v15 = [v7 completionHandler];
      v16 = v55;
      goto LABEL_11;
    case 9uLL:
      v47 = [v6 _endValue];
      [v47 floatValue];
      int v49 = v48;

      [v7 duration];
      double v22 = v50;
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_9;
      v53[3] = &unk_264498D58;
      v53[4] = self;
      int v54 = v49;
      v15 = [v7 completionHandler];
      v16 = v53;
LABEL_11:
      double v17 = v22;
LABEL_12:
      +[ARUIRingGroup animateWithDuration:animations:curve:completion:](ARUIRingGroup, "animateWithDuration:animations:curve:completion:", v16, 0, v15, v17, v51, v52);

      break;
    default:
      break;
  }
}

void __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) ringGroup];
  [v2 setTranslation:*(double *)(a1 + 40)];
}

void __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ringGroup];
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  [v3 setGroupDiameter:v2];
}

void __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ringGroup];
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  [v3 setEmptyOpacity:v2];
}

void __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ringGroup];
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  [v3 setOpacity:v2];
}

void __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_5(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ringGroup];
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  [v3 setInterspacing:v2];
}

void __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_6(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ringGroup];
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  [v3 setThickness:v2];
}

void __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_7(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ringGroup];
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  [v3 setScale:v2];
}

void __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_8(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ringGroup];
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  [v3 setTrackOpacity:v2];
}

void __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_9(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ringGroup];
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  [v3 setZRotation:v2];
}

- (void)setTopColor:(id)a3 bottomColor:(id)a4
{
}

- (void)setTopColor:(id)a3 bottomColor:(id)a4 ofRingAtIndex:(int64_t)a5
{
}

- (void)setTopColor:(id)a3 bottomColor:(id)a4 contrastColor:(id)a5 ofRingAtIndex:(int64_t)a6
{
}

- (void)setOpacity:(double)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5
{
  if (a5)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __61__ARUIRingGroupController_setOpacity_ofRingAtIndex_animated___block_invoke;
    v6[3] = &unk_264498D30;
    v6[4] = self;
    *(double *)&v6[5] = a3;
    +[ARUIRingGroup animateWithDuration:v6 animations:0.25];
  }
  else
  {
    ringGroup = self->_ringGroup;
    *(float *)&a3 = a3;
    -[ARUIRingGroup setOpacity:](ringGroup, "setOpacity:", a4, a3);
  }
}

uint64_t __61__ARUIRingGroupController_setOpacity_ofRingAtIndex_animated___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  *(float *)&double v1 = v1;
  return [*(id *)(*(void *)(a1 + 32) + 24) setOpacity:v1];
}

- (void)setRingThickness:(double)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__ARUIRingGroupController_setRingThickness_ofRingAtIndex_animated___block_invoke;
  v5[3] = &unk_264498D30;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  +[ARUIRingGroup animateWithDuration:animations:](ARUIRingGroup, "animateWithDuration:animations:", v5, a5, 0.2);
}

void __67__ARUIRingGroupController_setRingThickness_ofRingAtIndex_animated___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ringGroup];
  double v2 = *(double *)(a1 + 40);
  *(float *)&double v2 = v2;
  [v3 setThickness:v2];
}

- (float)diameterForRingAtIndex:(unint64_t)a3
{
  double v4 = [(ARUIRingGroup *)self->_ringGroup rings];
  float v5 = [v4 objectAtIndex:a3];
  [v5 diameter];
  float v7 = v6;

  return v7;
}

- (void)setPercentage:(double)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5
{
  *(float *)&a3 = a3;
  [(ARUIRingGroup *)self->_ringGroup setPercentage:a4 ofRingAtIndex:a5 animated:a3];
}

- (void)setPercentage:(double)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  *(float *)&a3 = a3;
  [(ARUIRingGroup *)self->_ringGroup setPercentage:a4 ofRingAtIndex:a5 animated:a6 completion:a3];
}

- (void)setPercentage:(double)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5 duration:(double)a6 timingFunction:(id)a7 completion:(id)a8
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __99__ARUIRingGroupController_setPercentage_ofRingAtIndex_animated_duration_timingFunction_completion___block_invoke;
  v8[3] = &unk_264498D80;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  v8[6] = a4;
  +[ARUIRingGroup animateWithDuration:v8 animations:0 curve:a8 completion:a6];
}

void __99__ARUIRingGroupController_setPercentage_ofRingAtIndex_animated_duration_timingFunction_completion___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ringGroup];
  double v2 = *(double *)(a1 + 40);
  *(float *)&double v2 = v2;
  [v3 setPercentage:*(void *)(a1 + 48) ofRingAtIndex:v2];
}

- (ARUIRingGroup)ringGroup
{
  return self->_ringGroup;
}

- (float)ringIconSize
{
  return self->_ringIconSize;
}

- (void)setRingIconSize:(float)a3
{
  self->_ringIconSize = a3;
}

- (double)backingOrigin
{
  return self->_backingOrigin;
}

- (void)setBackingOrigin:(double)a3
{
  self->_backingOrigin = a3;
}

- (double)additionalSpacingAtIndex
{
  return self->_additionalSpacingAtIndex;
}

- (void)setAdditionalSpacingAtIndex:(double)a3
{
  self->_additionalSpacingAtIndex = a3;
}

- (void).cxx_destruct
{
}

- (void)addCelebration:(id)a3 toRingAtIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(ARUIRingGroupController *)self ringGroup];
  [v7 playCelebration:v6 onRingAtIndex:a4];
}

+ (id)ringGroupControllerConfiguredForWatchWithRingType:(int64_t)a3 withIcon:(BOOL)a4
{
  BOOL v4 = a4;
  float v5 = +[ARUIRingGroup activityRingGroupForRingType:a3];
  id v6 = [v5 forWatch];

  if (v4)
  {
    uint64_t v7 = [v6 withSpriteSheet];

    id v6 = (void *)v7;
  }
  objc_super v8 = [[ARUIRingGroupController alloc] initWithRingGroup:v6];

  return v8;
}

+ (id)ringGroupControllerConfiguredForCompanionWithRingType:(int64_t)a3 withIcon:(BOOL)a4
{
  BOOL v4 = a4;
  float v5 = +[ARUIRingGroup activityRingGroupForRingType:a3];
  id v6 = [v5 forCompanion];

  if (v4)
  {
    uint64_t v7 = [v6 withSpriteSheet];

    id v6 = (void *)v7;
  }
  objc_super v8 = [[ARUIRingGroupController alloc] initWithRingGroup:v6];

  return v8;
}

- (void)setActiveEnergyPercentage:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(ARUIRingGroupController *)self ringGroup];
  *(float *)&double v6 = a3;
  [v7 setActiveEnergyPercentage:v4 animated:v6];
}

- (void)setMovingHoursPercentage:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(ARUIRingGroupController *)self ringGroup];
  *(float *)&double v6 = a3;
  [v7 setStandHoursPercentage:v4 animated:v6];
}

- (void)setBriskPercentage:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(ARUIRingGroupController *)self ringGroup];
  *(float *)&double v6 = a3;
  [v7 setExerciseMinutesPercentage:v4 animated:v6];
}

- (void)setActiveEnergyPercentage:(double)a3 briskPercentage:(double)a4 movingHoursPercentage:(double)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v16 = [(ARUIRingGroupController *)self ringGroup];
  *(float *)&double v13 = a3;
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  [v16 setActiveEnergyPercentage:v7 exerciseMinutesPercentage:v12 standHoursPercentage:v13 animated:v14 completion:v15];
}

@end