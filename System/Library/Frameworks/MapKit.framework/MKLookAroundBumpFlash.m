@interface MKLookAroundBumpFlash
- (void)flash;
@end

@implementation MKLookAroundBumpFlash

- (void)flash
{
  v28[3] = *MEMORY[0x1E4F143B8];
  v2 = [(MKLookAroundBumpFlash *)self layer];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [MEMORY[0x1E4F39BE8] layer];
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  double MidX = CGRectGetMidX(v29);
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  objc_msgSend(v11, "setPosition:", MidX, CGRectGetMidY(v30));
  objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"LookAroundBumpFlash");
  id v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContents:", objc_msgSend(v13, "CGImage"));
  [v11 setContentsGravity:*MEMORY[0x1E4F3A3E0]];
  [v11 setOpacity:0.0];
  v14 = [MEMORY[0x1E4F39B38] animation];
  [v14 setDuration:1.5];
  LODWORD(v15) = 0.5;
  v16 = [NSNumber numberWithFloat:v15];
  v17 = makeAnimation(@"opacity", &unk_1ED97DF20, v16, 0.0, 0.07);
  v28[0] = v17;
  LODWORD(v18) = 0.5;
  v19 = [NSNumber numberWithFloat:v18];
  v20 = makeAnimation(@"opacity", v19, &unk_1ED97DF20, 0.07, 0.5);
  v28[1] = v20;
  v21 = makeAnimation(@"transform.scale.xy", &unk_1ED97DF30, &unk_1ED97DF40, 0.0, 0.6);
  v28[2] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  [v14 setAnimations:v22];

  [v11 addAnimation:v14 forKey:0];
  [v2 addSublayer:v11];
  [v14 duration];
  dispatch_time_t v24 = dispatch_time(0, (uint64_t)(v23 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__MKLookAroundBumpFlash_flash__block_invoke;
  block[3] = &unk_1E54B8188;
  id v27 = v11;
  id v25 = v11;
  dispatch_after(v24, MEMORY[0x1E4F14428], block);
}

uint64_t __30__MKLookAroundBumpFlash_flash__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperlayer];
}

@end