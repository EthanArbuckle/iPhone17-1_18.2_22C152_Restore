@interface UIImage(CAHelper)
- (id)__ck_imageScaledToFillSize:()CAHelper;
@end

@implementation UIImage(CAHelper)

- (id)__ck_imageScaledToFillSize:()CAHelper
{
  [a1 size];
  double v7 = a2 / v6;
  [a1 size];
  if (v7 < a3 / v8) {
    double v7 = a3 / v8;
  }
  [a1 size];
  double v10 = v9 * v7;
  [a1 size];
  double v12 = v11 * v7;
  v13 = [MEMORY[0x1E4F42A60] preferredFormat];
  [v13 setScale:0.0];
  [v13 setPreferredRange:0];
  [v13 setOpaque:0];
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:format:", v13, v10, v12);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __48__UIImage_CAHelper____ck_imageScaledToFillSize___block_invoke;
  v17[3] = &unk_1E5625B10;
  v17[4] = a1;
  *(double *)&v17[5] = v10;
  *(double *)&v17[6] = v12;
  v15 = [v14 imageWithActions:v17];

  return v15;
}

@end