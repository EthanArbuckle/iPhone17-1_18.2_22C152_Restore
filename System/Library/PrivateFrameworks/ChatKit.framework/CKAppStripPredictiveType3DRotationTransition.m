@interface CKAppStripPredictiveType3DRotationTransition
- (void)transitionFromView:(id)a3 toView:(id)a4 withDirection:(int64_t)a5 completion:(id)a6;
@end

@implementation CKAppStripPredictiveType3DRotationTransition

- (void)transitionFromView:(id)a3 toView:(id)a4 withDirection:(int64_t)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [v9 superview];
  v13 = v12;
  if (a5 <= 0) {
    double v14 = 1.57079633;
  }
  else {
    double v14 = -1.57079633;
  }
  if (a5 <= 0) {
    double v15 = -1.57079633;
  }
  else {
    double v15 = 1.57079633;
  }
  [v12 bringSubviewToFront:v10];
  [v10 setAlpha:1.0];
  [v9 setAlpha:1.0];
  v16 = [v10 layer];
  [v16 setDoubleSided:0];

  v17 = [v9 layer];
  [v17 setDoubleSided:0];

  [v13 bounds];
  double v19 = v18 * 0.5;
  v20 = [v10 layer];
  [v20 setAnchorPointZ:v19];

  v21 = [v9 layer];
  [v21 setAnchorPointZ:v19];

  v22 = [v9 layer];
  [v22 setZPosition:v19];

  v23 = [v10 layer];
  [v23 setZPosition:v19];

  memset(&v41, 0, sizeof(v41));
  CATransform3DMakeRotation(&v41, v14, 1.0, 0.0, 0.0);
  CATransform3D v40 = v41;
  v24 = [v10 layer];
  CATransform3D v39 = v40;
  [v24 setTransform:&v39];

  v25 = [v9 layer];
  long long v26 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v27 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v28 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v38[5] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v38[6] = v27;
  v38[7] = v28;
  long long v29 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v38[0] = *MEMORY[0x1E4F39B10];
  v38[1] = v29;
  long long v30 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v38[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v38[3] = v30;
  v38[4] = v26;
  [v25 setTransform:v38];

  v31 = (void *)MEMORY[0x1E4F42FF0];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __99__CKAppStripPredictiveType3DRotationTransition_transitionFromView_toView_withDirection_completion___block_invoke;
  v34[3] = &unk_1E5620E38;
  double v37 = v15;
  id v35 = v9;
  id v36 = v10;
  id v32 = v10;
  id v33 = v9;
  [v31 animateWithDuration:0 delay:v34 usingSpringWithDamping:v11 initialSpringVelocity:0.5 options:0.0 animations:14.0 completion:0.0];
}

void __99__CKAppStripPredictiveType3DRotationTransition_transitionFromView_toView_withDirection_completion___block_invoke(uint64_t a1)
{
  memset(&v11, 0, sizeof(v11));
  CATransform3DMakeRotation(&v11, *(CGFloat *)(a1 + 48), 1.0, 0.0, 0.0);
  CATransform3D v10 = v11;
  v2 = [*(id *)(a1 + 32) layer];
  CATransform3D v9 = v10;
  [v2 setTransform:&v9];

  v3 = [*(id *)(a1 + 40) layer];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v8[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v8[5] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v8[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v8[7] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v8[0] = *MEMORY[0x1E4F39B10];
  v8[1] = v6;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v8[3] = v7;
  [v3 setTransform:v8];
}

@end