@interface CKHeartAcknowledgmentGlyphView
- (CGPoint)glyphOffset;
- (int64_t)acknowledgmentType;
- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5;
@end

@implementation CKHeartAcknowledgmentGlyphView

- (int64_t)acknowledgmentType
{
  return 2000;
}

- (CGPoint)glyphOffset
{
  if (CKPixelWidth_once_18 != -1) {
    dispatch_once(&CKPixelWidth_once_18, &__block_literal_global_204_1);
  }
  double v2 = -*(double *)&CKPixelWidth_sPixel_18;
  double v3 = -*(double *)&CKPixelWidth_sPixel_18;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5
{
  id v8 = a5;
  [MEMORY[0x1E4F39CF8] begin];
  v9 = (void *)MEMORY[0x1E4F39CF8];
  [(CKSimpleAcknowledgementGlyphView *)self animationDuration];
  objc_msgSend(v9, "setAnimationDuration:");
  v10 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position.y"];
  v11 = [(CKSimpleAcknowledgementGlyphView *)self glyph];
  [v11 frame];
  double MaxY = CGRectGetMaxY(v25);

  *(float *)&double v13 = MaxY;
  v14 = [NSNumber numberWithFloat:v13];
  [v10 setFromValue:v14];

  [v10 setMass:1.0];
  [v10 setStiffness:125.0];
  [v10 setDamping:12.0];
  LODWORD(v15) = 1.0;
  [v10 setSpeed:v15];
  [v10 setBeginTime:a3];
  [v10 setRemovedOnCompletion:1];
  uint64_t v16 = *MEMORY[0x1E4F39FA0];
  [v10 setFillMode:*MEMORY[0x1E4F39FA0]];
  v17 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
  [v17 setFromValue:&unk_1EDF16E20];
  [v17 setMass:2.0];
  [v17 setStiffness:350.0];
  [v17 setDamping:15.0];
  [v17 setBeginTime:a3];
  [v17 setRemovedOnCompletion:1];
  [v17 setFillMode:v16];
  if (v8)
  {
    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__CKHeartAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke;
    block[3] = &unk_1E5620F48;
    id v24 = v8;
    dispatch_after(v18, MEMORY[0x1E4F14428], block);
  }
  v19 = [(CKSimpleAcknowledgementGlyphView *)self glyph];
  v20 = [v19 layer];
  [v20 addAnimation:v10 forKey:@"position.y"];

  v21 = [(CKSimpleAcknowledgementGlyphView *)self glyph];
  v22 = [v21 layer];
  [v22 addAnimation:v17 forKey:@"transform.scale.xy"];

  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __82__CKHeartAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end