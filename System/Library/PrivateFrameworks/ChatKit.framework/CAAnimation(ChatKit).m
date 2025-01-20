@interface CAAnimation(ChatKit)
+ (id)ck_opacityAnimationForRevealingSticker:()ChatKit;
+ (id)ck_springAnimationForRevealingReactWithASticker;
+ (id)ck_springAnimationForRevealingSticker:()ChatKit;
+ (id)ck_stickerFlyInBoundsAnimationFromSize:()ChatKit toSize:;
+ (id)ck_stickerFlyInMoveAnimationFromRect:()ChatKit toRect:;
+ (id)ck_stickerFlyInScaleAnimation;
+ (id)ck_stickerFlyInSpringAnimation;
+ (id)ck_stickerFlyInTransformAnimationTo:()ChatKit;
@end

@implementation CAAnimation(ChatKit)

+ (id)ck_springAnimationForRevealingSticker:()ChatKit
{
  v4 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
  v5 = v4;
  if (a3) {
    v6 = &unk_1EDF16748;
  }
  else {
    v6 = &unk_1EDF16760;
  }
  if (a3) {
    v7 = &unk_1EDF16760;
  }
  else {
    v7 = &unk_1EDF16748;
  }
  [v4 setFromValue:v6];
  [v5 setToValue:v7];
  [v5 setMass:2.0];
  [v5 setStiffness:300.0];
  [v5 setDamping:400.0];
  [v5 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v5 setRemovedOnCompletion:0];

  return v5;
}

+ (id)ck_springAnimationForRevealingReactWithASticker
{
  v0 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"bounds"];
  long long v1 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  v4[0] = *MEMORY[0x1E4F1DB28];
  v4[1] = v1;
  v2 = [MEMORY[0x1E4F29238] valueWithBytes:v4 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v0 setFromValue:v2];

  [v0 setMass:1.0];
  [v0 setStiffness:109.0];
  [v0 setDamping:14.6];
  [v0 setInitialVelocity:10.0];
  [v0 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v0 setRemovedOnCompletion:0];

  return v0;
}

+ (id)ck_opacityAnimationForRevealingSticker:()ChatKit
{
  v4 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
  v5 = v4;
  if (a3) {
    v6 = &unk_1EDF16748;
  }
  else {
    v6 = &unk_1EDF16760;
  }
  if (a3) {
    v7 = &unk_1EDF16760;
  }
  else {
    v7 = &unk_1EDF16748;
  }
  [v4 setFromValue:v6];
  [v5 setToValue:v7];
  [v5 setMass:2.0];
  [v5 setStiffness:300.0];
  [v5 setDamping:400.0];
  [v5 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v5 setRemovedOnCompletion:0];

  return v5;
}

+ (id)ck_stickerFlyInMoveAnimationFromRect:()ChatKit toRect:
{
  v41[4] = *MEMORY[0x1E4F143B8];
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (CKMainScreenScale_once_51 != -1)
  {
    double v39 = a7;
    double v40 = a8;
    dispatch_once(&CKMainScreenScale_once_51, &__block_literal_global_129);
    a7 = v39;
    a8 = v40;
  }
  double v16 = *(double *)&CKMainScreenScale_sMainScreenScale_51;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_51 == 0.0) {
    double v16 = 1.0;
  }
  double v17 = a1 * v16 + floor((a3 * v16 - v14 * v16) * 0.5);
  double v18 = a2 * v16 + floor((a4 * v16 - v15 * v16) * 0.5);
  double v19 = 1.0 / v16;
  double v20 = v19 * v17;
  double v21 = v19 * v18;
  double v22 = *(double *)&CKMainScreenScale_sMainScreenScale_51;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_51 == 0.0) {
    double v22 = 1.0;
  }
  double v23 = a5 * v22 + floor((a7 * v22 - v14 * v22) * 0.5);
  double v24 = a6 * v22 + floor((a8 * v22 - v15 * v22) * 0.5);
  double v25 = 1.0 / v22;
  double v26 = v25 * v23;
  double v27 = v25 * v24;
  double v28 = v25 * v23 - v20;
  double v29 = v20 + v28 * 0.35;
  double v30 = v20 + v28 * 0.7;
  v31 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position"];
  [v31 setCalculationMode:*MEMORY[0x1E4F39D70]];
  [v31 setFillMode:*MEMORY[0x1E4F39FA8]];
  v32 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v31 setTimingFunction:v32];

  v33 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v20, v21);
  v41[0] = v33;
  v34 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v29, v21 + (v27 - v21) * 0.35);
  v41[1] = v34;
  v35 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v30, v21 + (v27 - v21) * 0.7);
  v41[2] = v35;
  v36 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v26, v27);
  v41[3] = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
  [v31 setValues:v37];

  [v31 setKeyTimes:&unk_1EDF15590];
  [v31 setDuration:0.5];
  [v31 setRemovedOnCompletion:0];

  return v31;
}

+ (id)ck_stickerFlyInSpringAnimation
{
  v0 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
  [v0 setFromValue:&unk_1EDF171E8];
  [v0 setToValue:&unk_1EDF171F8];
  [v0 setMass:1.0];
  [v0 setStiffness:109.66];
  [v0 setDamping:14.6];
  [v0 setInitialVelocity:20.0];
  [v0 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v0 setAdditive:1];
  [v0 setBeginTime:0.34];
  [v0 settlingDuration];
  [v0 setDuration:v1 + -0.3];
  [v0 setRemovedOnCompletion:0];

  return v0;
}

+ (id)ck_stickerFlyInScaleAnimation
{
  v0 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.scale.xy"];
  [v0 setValues:&unk_1EDF155A8];
  [v0 setKeyTimes:&unk_1EDF155C0];
  [v0 setDuration:0.7];
  [v0 setCalculationMode:*MEMORY[0x1E4F39D68]];
  [v0 setFillMode:*MEMORY[0x1E4F39FA8]];
  double v1 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  [v0 setTimingFunction:v1];

  [v0 setAdditive:1];
  [v0 setRemovedOnCompletion:0];

  return v0;
}

+ (id)ck_stickerFlyInBoundsAnimationFromSize:()ChatKit toSize:
{
  v8 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds.size"];
  *(double *)v13 = a1;
  *(double *)&v13[1] = a2;
  v9 = [MEMORY[0x1E4F29238] valueWithBytes:v13 objCType:"{CGSize=dd}"];
  [v8 setFromValue:v9];

  *(double *)v12 = a3;
  *(double *)&v12[1] = a4;
  v10 = [MEMORY[0x1E4F29238] valueWithBytes:v12 objCType:"{CGSize=dd}"];
  [v8 setToValue:v10];

  [v8 setDuration:0.7];
  [v8 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v8 setRemovedOnCompletion:0];

  return v8;
}

+ (id)ck_stickerFlyInTransformAnimationTo:()ChatKit
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform"];
  [v4 setCalculationMode:*MEMORY[0x1E4F39D70]];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v19[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v19[5] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v19[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v19[7] = v6;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v19[0] = *MEMORY[0x1E4F39B10];
  v19[1] = v7;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v19[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v19[3] = v8;
  v9 = [MEMORY[0x1E4F29238] valueWithBytes:v19 objCType:"{CATransform3D=dddddddddddddddd}"];
  v20[0] = v9;
  long long v10 = a3[5];
  v18[4] = a3[4];
  v18[5] = v10;
  long long v11 = a3[7];
  v18[6] = a3[6];
  v18[7] = v11;
  long long v12 = a3[1];
  v18[0] = *a3;
  v18[1] = v12;
  long long v13 = a3[3];
  v18[2] = a3[2];
  v18[3] = v13;
  double v14 = [MEMORY[0x1E4F29238] valueWithBytes:v18 objCType:"{CATransform3D=dddddddddddddddd}"];
  v20[1] = v14;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  [v4 setValues:v15];

  [v4 setKeyTimes:&unk_1EDF155D8];
  [v4 setDuration:0.7];
  [v4 setFillMode:*MEMORY[0x1E4F39FA8]];
  double v16 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v4 setTimingFunction:v16];

  [v4 setRemovedOnCompletion:0];

  return v4;
}

@end