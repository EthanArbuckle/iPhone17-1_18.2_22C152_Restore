@interface UIView(ChatKit)
- (double)ck_identityTransformFrame;
- (double)ck_identityTransformFrameInView:()ChatKit;
- (uint64_t)ck_performHideAnimated:()ChatKit completion:;
- (uint64_t)ck_performRevealAnimated:()ChatKit completion:;
- (void)ck_performAnimationVisibility:()ChatKit animated:completion:;
- (void)ck_performUnanimatedVisibility:()ChatKit completion:;
@end

@implementation UIView(ChatKit)

- (uint64_t)ck_performRevealAnimated:()ChatKit completion:
{
  return objc_msgSend(a1, "ck_performAnimationVisibility:animated:completion:", 1, a3, a4);
}

- (uint64_t)ck_performHideAnimated:()ChatKit completion:
{
  return objc_msgSend(a1, "ck_performAnimationVisibility:animated:completion:", 0, a3, a4);
}

- (void)ck_performAnimationVisibility:()ChatKit animated:completion:
{
  v18[2] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v7 = (void *)MEMORY[0x1E4F39B30];
    id v8 = a5;
    objc_msgSend(v7, "ck_springAnimationForRevealingSticker:", a3);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(MEMORY[0x1E4F39B30], "ck_opacityAnimationForRevealingSticker:", a3);
    v11 = [MEMORY[0x1E4F39B38] animation];
    v18[0] = v9;
    v18[1] = v10;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    [v11 setAnimations:v12];

    [v11 setFillMode:*MEMORY[0x1E4F39FA0]];
    [v11 setRemovedOnCompletion:0];
    [MEMORY[0x1E4F39CF8] begin];
    v13 = (void *)MEMORY[0x1E4F39CF8];
    [v9 settlingDuration];
    double v15 = v14;
    [v10 settlingDuration];
    if (v15 >= v16) {
      double v16 = v15;
    }
    [v13 setAnimationDuration:v16];
    [MEMORY[0x1E4F39CF8] setCompletionBlock:v8];

    v17 = [a1 layer];
    [v17 addAnimation:v11 forKey:0];

    [MEMORY[0x1E4F39CF8] commit];
  }
  else
  {
    id v9 = a5;
    objc_msgSend(a1, "ck_performUnanimatedVisibility:completion:", a3, v9);
  }
}

- (void)ck_performUnanimatedVisibility:()ChatKit completion:
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (a3) {
    v5 = &unk_1EDF16850;
  }
  else {
    v5 = &unk_1EDF16868;
  }
  if (a3) {
    v6 = &unk_1EDF16868;
  }
  else {
    v6 = &unk_1EDF16850;
  }
  v7 = (void *)MEMORY[0x1E4F39B48];
  id v8 = a4;
  id v9 = [v7 animationWithKeyPath:@"transform.scale.xy"];
  [v9 setToValue:v5];
  [v9 setFromValue:v6];
  uint64_t v10 = *MEMORY[0x1E4F39FA0];
  [v9 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v9 setRemovedOnCompletion:0];
  v11 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v11 setToValue:v5];
  [v11 setFromValue:v6];
  [v11 setFillMode:v10];
  [v11 setRemovedOnCompletion:0];
  v12 = [MEMORY[0x1E4F39B38] animation];
  v15[0] = v9;
  v15[1] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v12 setAnimations:v13];

  [v12 setFillMode:v10];
  [v12 setRemovedOnCompletion:0];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.01];
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v8];

  double v14 = [a1 layer];
  [v14 addAnimation:v12 forKey:0];

  [MEMORY[0x1E4F39CF8] commit];
}

- (double)ck_identityTransformFrame
{
  memset(&v10, 0, sizeof(v10));
  [a1 transform];
  CGAffineTransform v9 = v10;
  if (CGAffineTransformIsIdentity(&v9))
  {
    [a1 frame];
    return v2;
  }
  else
  {
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v8[0] = *MEMORY[0x1E4F1DAB8];
    v8[1] = v4;
    v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [a1 setTransform:v8];
    [a1 frame];
    double v3 = v5;
    CGAffineTransform v7 = v10;
    [a1 setTransform:&v7];
  }
  return v3;
}

- (double)ck_identityTransformFrameInView:()ChatKit
{
  id v4 = a3;
  objc_msgSend(a1, "ck_identityTransformFrame");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [a1 superview];
  objc_msgSend(v4, "convertRect:fromView:", v13, v6, v8, v10, v12);
  double v15 = v14;

  return v15;
}

@end