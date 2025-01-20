@interface UIView(CKMessageAcknowledgmentAnimations)
- (void)messageAcknowledgmentBounceView:()CKMessageAcknowledgmentAnimations;
- (void)messageAcknowledgmentShrinkViewToPoint:()CKMessageAcknowledgmentAnimations completion:;
@end

@implementation UIView(CKMessageAcknowledgmentAnimations)

- (void)messageAcknowledgmentBounceView:()CKMessageAcknowledgmentAnimations
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  [a1 transform];
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeScale(&v14, 0.95, 0.95);
  CGAffineTransform v13 = v14;
  [a1 setTransform:&v13];
  v5 = (void *)MEMORY[0x1E4F42FF0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  long long v10 = v15;
  long long v11 = v16;
  v9[2] = __77__UIView_CKMessageAcknowledgmentAnimations__messageAcknowledgmentBounceView___block_invoke;
  v9[3] = &unk_1E5621D50;
  v9[4] = a1;
  long long v12 = v17;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__UIView_CKMessageAcknowledgmentAnimations__messageAcknowledgmentBounceView___block_invoke_2;
  v7[3] = &unk_1E5622358;
  id v8 = v4;
  id v6 = v4;
  [v5 animateWithDuration:0 delay:v9 usingSpringWithDamping:v7 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:-100.0];
}

- (void)messageAcknowledgmentShrinkViewToPoint:()CKMessageAcknowledgmentAnimations completion:
{
  id v8 = a5;
  [a1 frame];
  double v10 = v9;
  double v12 = v11;
  [a1 frame];
  double Width = CGRectGetWidth(v36);
  [a1 frame];
  double Height = CGRectGetHeight(v37);
  memset(&v35, 0, sizeof(v35));
  long long v15 = [a1 layer];
  long long v16 = v15;
  if (v15) {
    [v15 transform];
  }
  else {
    memset(&v35, 0, sizeof(v35));
  }

  memset(&v34, 0, sizeof(v34));
  CATransform3DMakeScale(&v34, 0.0, 0.0, 1.0);
  memset(&v33, 0, sizeof(v33));
  CATransform3DMakeTranslation(&v33, a2 - (v10 + Width * 0.5), a3 - (v12 + Height * 0.5), 0.0);
  memset(&v32, 0, sizeof(v32));
  CATransform3D a = v34;
  CATransform3D b = v33;
  CATransform3DConcat(&v32, &a, &b);
  long long v17 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  CATransform3D a = v35;
  v18 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&a];
  [v17 setFromValue:v18];

  CATransform3D a = v32;
  v19 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&a];
  [v17 setToValue:v19];

  [v17 setDuration:0.300000012];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  v20 = (void *)MEMORY[0x1E4F39CF8];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __95__UIView_CKMessageAcknowledgmentAnimations__messageAcknowledgmentShrinkViewToPoint_completion___block_invoke;
  v28[3] = &unk_1E5620F48;
  id v29 = v8;
  id v21 = v8;
  [v20 setCompletionBlock:v28];
  v22 = [a1 layer];
  [v22 addAnimation:v17 forKey:@"transform"];

  v23 = (void *)MEMORY[0x1E4F39CF8];
  v24 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v23 setAnimationTimingFunction:v24];

  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.300000012];
  [MEMORY[0x1E4F39CF8] setDisableActions:0];
  [MEMORY[0x1E4F39CF8] begin];
  CATransform3D v27 = v32;
  v25 = [a1 layer];
  CATransform3D v26 = v27;
  [v25 setTransform:&v26];

  [MEMORY[0x1E4F39CF8] commit];
}

@end