@interface CKThumbsDownAcknowledgmentGlyphView
- (CALayer)animationLayer;
- (CALayer)contentLayer;
- (double)animationDuration;
- (int64_t)acknowledgmentType;
- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5;
- (void)setAnimationLayer:(id)a3;
- (void)setContentLayer:(id)a3;
- (void)setGlyphColor:(id)a3;
@end

@implementation CKThumbsDownAcknowledgmentGlyphView

- (int64_t)acknowledgmentType
{
  return 2002;
}

- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5
{
  id v7 = a5;
  v8 = [(CKThumbsDownAcknowledgmentGlyphView *)self animationLayer];
  [v8 setHidden:1];

  [MEMORY[0x1E4F39CF8] begin];
  v9 = (void *)MEMORY[0x1E4F39CF8];
  [(CKThumbsDownAcknowledgmentGlyphView *)self animationDuration];
  objc_msgSend(v9, "setAnimationDuration:");
  v10 = [(CKSimpleAcknowledgementGlyphView *)self glyph];
  v11 = [v10 layer];
  [v11 position];
  double v13 = v12;
  double v15 = v14;

  v16 = [(CKSimpleAcknowledgementGlyphView *)self glyph];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  v25 = [(CKSimpleAcknowledgementGlyphView *)self glyph];
  [v25 removeFromSuperview];

  v26 = [MEMORY[0x1E4F39BE8] layer];
  [(CKThumbsDownAcknowledgmentGlyphView *)self setAnimationLayer:v26];
  double v27 = v24;
  objc_msgSend(v26, "setBounds:", v18, v20, v22, v24);
  objc_msgSend(v26, "setPosition:", v13, v15);
  v28 = [(CKThumbsDownAcknowledgmentGlyphView *)self layer];
  [v28 addSublayer:v26];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__CKThumbsDownAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke;
  aBlock[3] = &unk_1E5620AF8;
  aBlock[4] = self;
  id v29 = v26;
  id v75 = v29;
  v30 = _Block_copy(aBlock);
  if (v7)
  {
    dispatch_time_t v31 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__CKThumbsDownAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke_2;
    block[3] = &unk_1E5620F48;
    id v73 = v7;
    dispatch_after(v31, MEMORY[0x1E4F14428], block);
  }
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v30];
  v32 = [MEMORY[0x1E4F39BE8] layer];
  [v29 bounds];
  CGFloat x = v76.origin.x;
  CGFloat y = v76.origin.y;
  CGFloat width = v76.size.width;
  CGFloat height = v76.size.height;
  CGRectGetMidX(v76);
  v77.origin.CGFloat x = x;
  v77.origin.CGFloat y = y;
  v77.size.CGFloat width = width;
  v77.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v77);
  [v29 bounds];
  double MaxX = CGRectGetMaxX(v78);
  double v68 = v27;
  objc_msgSend(v32, "setBounds:", v18, v20, v22, v27);
  objc_msgSend(v32, "setPosition:", MaxX, MidY);
  [v29 addSublayer:v32];
  [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.rotation.z"];
  v69 = v30;
  v39 = v70 = v7;
  LODWORD(v40) = 1074137746;
  v41 = [NSNumber numberWithFloat:v40];
  [v39 setFromValue:v41];

  LODWORD(v42) = -1092655373;
  v43 = [NSNumber numberWithFloat:v42];
  [v39 setToValue:v43];

  [v39 setMass:1.0];
  [v39 setStiffness:250.0];
  [v39 setDamping:20.0];
  LODWORD(v44) = 1.0;
  [v39 setSpeed:v44];
  [v39 setDuration:1.15];
  [v39 setBeginTime:a3];
  uint64_t v45 = *MEMORY[0x1E4F39FA0];
  [v39 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v32 addAnimation:v39 forKey:@"transform.rotation.z"];
  v46 = [MEMORY[0x1E4F39BE8] layer];
  [v32 bounds];
  CGFloat v47 = v79.origin.x;
  CGFloat v48 = v79.origin.y;
  CGFloat v49 = v79.size.width;
  CGFloat v50 = v79.size.height;
  double MidX = CGRectGetMidX(v79);
  v80.origin.CGFloat x = v47;
  v80.origin.CGFloat y = v48;
  v80.size.CGFloat width = v49;
  v80.size.CGFloat height = v50;
  double v52 = CGRectGetMidY(v80);
  objc_msgSend(v46, "setBounds:", v18, v20, v22, v68);
  objc_msgSend(v46, "setPosition:", MidX, v52);
  [v32 addSublayer:v46];
  v53 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.rotation.z"];
  LODWORD(v54) = 1054828275;
  v55 = [NSNumber numberWithFloat:v54];
  [v53 setToValue:v55];

  [v53 setMass:1.0];
  [v53 setStiffness:400.0];
  [v53 setDamping:15.0];
  LODWORD(v56) = 1.0;
  [v53 setSpeed:v56];
  [v53 setDuration:1.0];
  [v53 setBeginTime:a3 + 0.150000006];
  [v53 setFillMode:v45];
  [v46 addAnimation:v53 forKey:@"transform.rotation.z"];
  v57 = [(CKSimpleAcknowledgementGlyphView *)self glyph];
  v58 = [v57 image];

  v59 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v58];
  v60 = [v59 layer];

  [v46 bounds];
  CGFloat v61 = v81.origin.x;
  CGFloat v62 = v81.origin.y;
  CGFloat v63 = v81.size.width;
  CGFloat v64 = v81.size.height;
  CGRectGetMidX(v81);
  v82.origin.CGFloat x = v61;
  v82.origin.CGFloat y = v62;
  v82.size.CGFloat width = v63;
  v82.size.CGFloat height = v64;
  double v65 = CGRectGetMidY(v82);
  objc_msgSend(v60, "setBounds:", v18, v20, v22, v68);
  objc_msgSend(v60, "setPosition:", 0.0, v65);
  id v66 = v58;
  objc_msgSend(v60, "setContents:", objc_msgSend(v66, "CGImage"));
  [v66 scale];
  objc_msgSend(v60, "setContentsScale:");
  [v60 setContentsGravity:*MEMORY[0x1E4F3A3E0]];
  [(CKThumbsDownAcknowledgmentGlyphView *)self setContentLayer:v60];
  [v46 addSublayer:v60];
  v67 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
  [v67 setFromValue:&unk_1EDF16E20];
  [v67 setMass:1.0];
  [v67 setStiffness:350.0];
  [v67 setDamping:25.0];
  [v67 setBeginTime:a3 + 0.0500000007];
  [v67 setFillMode:v45];
  [v60 addAnimation:v67 forKey:@"transform.scale.xy"];
  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __87__CKThumbsDownAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 glyph];
  [v2 addSubview:v3];

  v4 = *(void **)(a1 + 40);

  return [v4 removeFromSuperlayer];
}

uint64_t __87__CKThumbsDownAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke_2(uint64_t a1)
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
  v9.super_class = (Class)CKThumbsDownAcknowledgmentGlyphView;
  [(CKSimpleAcknowledgementGlyphView *)&v9 setGlyphColor:a3];
  v4 = [(CKThumbsDownAcknowledgmentGlyphView *)self contentLayer];

  if (v4)
  {
    v5 = [(CKSimpleAcknowledgementGlyphView *)self glyph];
    v6 = [v5 image];

    id v7 = [(CKThumbsDownAcknowledgmentGlyphView *)self contentLayer];
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