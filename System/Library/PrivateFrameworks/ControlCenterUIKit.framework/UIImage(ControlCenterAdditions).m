@interface UIImage(ControlCenterAdditions)
- (id)ccuiAlphaOnlyImageForMaskImage;
@end

@implementation UIImage(ControlCenterAdditions)

- (id)ccuiAlphaOnlyImageForMaskImage
{
  [a1 size];
  BSRectWithSize();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  double v7 = v6;
  double v9 = v8;
  v10 = [MEMORY[0x1E4FB17E0] defaultFormat];
  [v10 setPreferredRange:0x7FFFLL];
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v10, v7, v9);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__UIImage_ControlCenterAdditions__ccuiAlphaOnlyImageForMaskImage__block_invoke;
  v14[3] = &unk_1E6AD47D0;
  v14[4] = a1;
  v14[5] = v3;
  v14[6] = v5;
  *(double *)&v14[7] = v7;
  *(double *)&v14[8] = v9;
  v12 = [v11 imageWithActions:v14];

  return v12;
}

@end