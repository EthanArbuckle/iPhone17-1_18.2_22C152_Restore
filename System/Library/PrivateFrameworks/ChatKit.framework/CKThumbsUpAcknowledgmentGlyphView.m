@interface CKThumbsUpAcknowledgmentGlyphView
- (CALayer)animationLayer;
- (CALayer)contentLayer;
- (double)animationDuration;
- (int64_t)acknowledgmentType;
- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5;
- (void)setAnimationLayer:(id)a3;
- (void)setContentLayer:(id)a3;
- (void)setGlyphColor:(id)a3;
@end

@implementation CKThumbsUpAcknowledgmentGlyphView

- (int64_t)acknowledgmentType
{
  return 2001;
}

- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5
{
  id v6 = a5;
  v7 = [(CKThumbsUpAcknowledgmentGlyphView *)self animationLayer];
  [v7 setHidden:1];

  [MEMORY[0x1E4F39CF8] begin];
  v8 = (void *)MEMORY[0x1E4F39CF8];
  [(CKThumbsUpAcknowledgmentGlyphView *)self animationDuration];
  objc_msgSend(v8, "setAnimationDuration:");
  v9 = [(CKSimpleAcknowledgementGlyphView *)self glyph];
  v10 = [v9 layer];
  [v10 position];
  double v12 = v11;
  double v14 = v13;

  v15 = [(CKSimpleAcknowledgementGlyphView *)self glyph];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  v24 = [(CKSimpleAcknowledgementGlyphView *)self glyph];
  [v24 removeFromSuperview];

  v25 = [MEMORY[0x1E4F39BE8] layer];
  [(CKThumbsUpAcknowledgmentGlyphView *)self setAnimationLayer:v25];
  double v26 = v17;
  double v70 = v23;
  objc_msgSend(v25, "setBounds:", v17, v19, v21, v23);
  objc_msgSend(v25, "setPosition:", v12, v14);
  v27 = [(CKThumbsUpAcknowledgmentGlyphView *)self layer];
  [v27 addSublayer:v25];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__CKThumbsUpAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke;
  aBlock[3] = &unk_1E5620AF8;
  aBlock[4] = self;
  id v28 = v25;
  id v74 = v28;
  v69 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E4F39CF8], "setCompletionBlock:");
  if (v6)
  {
    dispatch_time_t v29 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__CKThumbsUpAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke_2;
    block[3] = &unk_1E5620F48;
    id v72 = v6;
    dispatch_after(v29, MEMORY[0x1E4F14428], block);
  }
  v30 = [MEMORY[0x1E4F39BE8] layer];
  [v28 bounds];
  CGFloat x = v75.origin.x;
  CGFloat y = v75.origin.y;
  CGFloat width = v75.size.width;
  CGFloat height = v75.size.height;
  CGRectGetMidX(v75);
  v76.origin.CGFloat x = x;
  v76.origin.CGFloat y = y;
  v76.size.CGFloat width = width;
  v76.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v76);
  objc_msgSend(v30, "setBounds:", v26, v19, v21, v70);
  objc_msgSend(v30, "setPosition:", 0.0, MidY);
  [v28 addSublayer:v30];
  v36 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.rotation.z"];
  v67 = v6;
  LODWORD(v37) = -1073345902;
  v38 = [NSNumber numberWithFloat:v37];
  [v36 setFromValue:v38];

  LODWORD(v39) = 1054828275;
  v40 = [NSNumber numberWithFloat:v39];
  [v36 setToValue:v40];

  [v36 setMass:1.0];
  [v36 setStiffness:250.0];
  [v36 setDamping:20.0];
  LODWORD(v41) = 1.0;
  [v36 setSpeed:v41];
  [v36 setDuration:1.15];
  [v36 setBeginTime:a3];
  uint64_t v42 = *MEMORY[0x1E4F39FA0];
  [v36 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v30 addAnimation:v36 forKey:@"transform.rotation.z"];
  v43 = [MEMORY[0x1E4F39BE8] layer];
  [v30 bounds];
  CGFloat v44 = v77.origin.x;
  CGFloat v45 = v77.origin.y;
  CGFloat v46 = v77.size.width;
  CGFloat v47 = v77.size.height;
  double MidX = CGRectGetMidX(v77);
  v78.origin.CGFloat x = v44;
  v78.origin.CGFloat y = v45;
  v78.size.CGFloat width = v46;
  v78.size.CGFloat height = v47;
  double v49 = CGRectGetMidY(v78);
  objc_msgSend(v43, "setBounds:", v26, v19, v21, v70);
  objc_msgSend(v43, "setPosition:", MidX, v49);
  [v30 addSublayer:v43];
  v50 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.rotation.z"];
  LODWORD(v51) = -1092655373;
  v52 = [NSNumber numberWithFloat:v51];
  [v50 setToValue:v52];

  [v50 setMass:1.0];
  [v50 setStiffness:400.0];
  [v50 setDamping:15.0];
  LODWORD(v53) = 1.0;
  [v50 setSpeed:v53];
  [v50 setDuration:1.0];
  [v50 setBeginTime:a3 + 0.150000006];
  [v50 setFillMode:v42];
  [v43 addAnimation:v50 forKey:@"transform.rotation.z"];
  v54 = [(CKSimpleAcknowledgementGlyphView *)self glyph];
  v55 = [v54 image];

  v56 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v55];
  v57 = [v56 layer];

  [v43 bounds];
  CGFloat v58 = v79.origin.x;
  CGFloat v59 = v79.origin.y;
  CGFloat v60 = v79.size.width;
  CGFloat v61 = v79.size.height;
  CGRectGetMidX(v79);
  v80.origin.CGFloat x = v58;
  v80.origin.CGFloat y = v59;
  v80.size.CGFloat width = v60;
  v80.size.CGFloat height = v61;
  double v62 = CGRectGetMidY(v80);
  v81.origin.CGFloat x = v26;
  v81.origin.CGFloat y = v19;
  v81.size.CGFloat width = v21;
  v81.size.CGFloat height = v70;
  double MaxX = CGRectGetMaxX(v81);
  objc_msgSend(v57, "setBounds:", v26, v19, v21, v70);
  objc_msgSend(v57, "setPosition:", MaxX, v62);
  id v64 = v55;
  objc_msgSend(v57, "setContents:", objc_msgSend(v64, "CGImage"));
  [v64 scale];
  objc_msgSend(v57, "setContentsScale:");
  [v57 setContentsGravity:*MEMORY[0x1E4F3A3E0]];
  [(CKThumbsUpAcknowledgmentGlyphView *)self setContentLayer:v57];
  [v43 addSublayer:v57];
  v65 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
  [v65 setFromValue:&unk_1EDF16E20];
  [v65 setMass:1.0];
  [v65 setStiffness:350.0];
  [v65 setDamping:25.0];
  [v65 setBeginTime:a3 + 0.0500000007];
  [v65 setFillMode:v42];
  [v57 addAnimation:v65 forKey:@"transform.scale.xy"];
  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __85__CKThumbsUpAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 glyph];
  [v2 addSubview:v3];

  [*(id *)(a1 + 40) removeFromSuperlayer];
  [*(id *)(a1 + 32) setAnimationLayer:0];
  v4 = *(void **)(a1 + 32);

  return [v4 setContentLayer:0];
}

uint64_t __85__CKThumbsUpAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)animationDuration
{
  return 1.15;
}

- (void)setGlyphColor:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKThumbsUpAcknowledgmentGlyphView;
  [(CKSimpleAcknowledgementGlyphView *)&v9 setGlyphColor:a3];
  v4 = [(CKThumbsUpAcknowledgmentGlyphView *)self contentLayer];

  if (v4)
  {
    v5 = [(CKSimpleAcknowledgementGlyphView *)self glyph];
    id v6 = [v5 image];

    v7 = [(CKThumbsUpAcknowledgmentGlyphView *)self contentLayer];
    id v8 = v6;
    objc_msgSend(v7, "setContents:", objc_msgSend(v8, "CGImage"));
  }
}

- (CALayer)animationLayer
{
  return self->_animationLayer;
}

- (void)setAnimationLayer:(id)a3
{
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (void)setContentLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLayer, 0);

  objc_storeStrong((id *)&self->_animationLayer, 0);
}

@end