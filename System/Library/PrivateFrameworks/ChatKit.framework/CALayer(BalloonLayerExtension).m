@interface CALayer(BalloonLayerExtension)
+ (double)boundsForMaskImage:()BalloonLayerExtension withOriginalSize:;
+ (double)extraInsetsForImage:()BalloonLayerExtension;
+ (double)maxInsetForImage:()BalloonLayerExtension;
- (void)setMaskImage:()BalloonLayerExtension;
@end

@implementation CALayer(BalloonLayerExtension)

+ (double)maxInsetForImage:()BalloonLayerExtension
{
  [a3 capInsets];
  return fmax(fmax(v3, v4), fmax(v5, v6));
}

+ (double)extraInsetsForImage:()BalloonLayerExtension
{
  id v4 = a3;
  [v4 capInsets];
  double v6 = v5;
  [a1 maxInsetForImage:v4];
  double v8 = v7;

  return v6 - v8;
}

+ (double)boundsForMaskImage:()BalloonLayerExtension withOriginalSize:
{
  objc_msgSend(a1, "extraInsetsForImage:");
  return v1;
}

- (void)setMaskImage:()BalloonLayerExtension
{
  id v4 = a3;
  [MEMORY[0x1E4F39BE8] maxInsetForImage:v4];
  double v6 = v5;
  [MEMORY[0x1E4F39BE8] extraInsetsForImage:v4];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [v4 size];
  double v16 = v15 - (v10 + v14);
  double v18 = v17 - (v8 + v12);
  if (v10 == *(double *)(MEMORY[0x1E4F437F8] + 8)
    && v8 == *MEMORY[0x1E4F437F8]
    && v14 == *(double *)(MEMORY[0x1E4F437F8] + 24)
    && v12 == *(double *)(MEMORY[0x1E4F437F8] + 16))
  {
    id v22 = v4;
  }
  else
  {
    objc_getAssociatedObject(v4, (const void *)setMaskImage__normalizedImageKey);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      id v23 = objc_alloc_init(MEMORY[0x1E4F42A60]);
      [v4 scale];
      objc_msgSend(v23, "setScale:");
      [v23 setPreferredRange:32766];
      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:format:", v23, v16, v18);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __47__CALayer_BalloonLayerExtension__setMaskImage___block_invoke;
      v30[3] = &unk_1E5626FF0;
      id v25 = v4;
      id v31 = v25;
      double v32 = v8;
      double v33 = v10;
      double v34 = v12;
      double v35 = v14;
      id v22 = [v24 imageWithActions:v30];
      objc_setAssociatedObject(v25, (const void *)setMaskImage__normalizedImageKey, v22, (void *)1);
    }
  }
  if (v16 == 0.0 || v18 == 0.0)
  {
    v28 = IMLogHandleForCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      [(CALayer(BalloonLayerExtension) *)v28 setMaskImage:v18];
    }

    double v26 = 0.0;
    double v27 = 0.0;
  }
  else
  {
    double v26 = v6 / v16;
    double v27 = v6 / v18;
  }
  [a1 setMasksToBounds:1];
  [a1 setCornerContentsMasksEdges:1];
  id v29 = v22;
  objc_msgSend(a1, "setCornerContents:", objc_msgSend(v29, "CGImage"));
  objc_msgSend(a1, "setCornerContentsCenter:", v26, v27, v26 * -2.0 + 1.0, v27 * -2.0 + 1.0);
  [a1 setCornerRadius:v6];
}

- (void)setMaskImage:()BalloonLayerExtension .cold.1(NSObject *a1, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromCGSize(*(CGSize *)&a2);
  int v5 = 138412290;
  double v6 = v4;
  _os_log_error_impl(&dword_18EF18000, a1, OS_LOG_TYPE_ERROR, "normalizedSize had a zero dimension. Would have attempted divide by zero. normalizedSize: %@", (uint8_t *)&v5, 0xCu);
}

@end