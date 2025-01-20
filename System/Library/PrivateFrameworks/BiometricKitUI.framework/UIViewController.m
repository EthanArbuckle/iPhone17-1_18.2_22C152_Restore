@interface UIViewController
@end

@implementation UIViewController

uint64_t __136__UIViewController_ForcedRotation__bkui_rotateView_fromOrientation_toOrientation_containerBounds_animatedDuration_alongSide_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) layer];
  v3 = [v2 valueForKeyPath:@"transform.rotation.z"];
  [v3 floatValue];
  double v5 = v4;

  CGFloat v6 = 0.0;
  uint64_t v7 = *(void *)(a1 + 48);
  switch(*(void *)(a1 + 56))
  {
    case 1:
      unint64_t v8 = v7 - 2;
      if (v8 < 3)
      {
        v9 = (double *)&unk_1E4BD1790;
        goto LABEL_10;
      }
      break;
    case 2:
      unint64_t v8 = v7 - 1;
      if (v8 < 4)
      {
        v9 = (double *)&unk_1E4BD17E0;
        goto LABEL_10;
      }
      break;
    case 3:
      unint64_t v8 = v7 - 1;
      if (v8 < 4)
      {
        v9 = (double *)&unk_1E4BD17C0;
        goto LABEL_10;
      }
      break;
    case 4:
      unint64_t v8 = v7 - 1;
      if (v8 < 3)
      {
        v9 = (double *)&unk_1E4BD17A8;
LABEL_10:
        CGFloat v6 = v9[v8];
      }
      break;
    default:
      break;
  }
  memset(&v30, 0, sizeof(v30));
  CGAffineTransformMakeRotation(&v30, v6);
  float b = v30.b;
  float a = v30.a;
  double v12 = v5 + atan2f(b, a);
  v13 = [*(id *)(a1 + 32) layer];
  v14 = [NSNumber numberWithDouble:v12];
  [v13 setValue:v14 forKeyPath:@"transform.rotation.z"];

  __asm { FMOV            V2.2D, #0.5 }
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", vaddq_f64(*(float64x2_t *)(a1 + 64), vmulq_f64(*(float64x2_t *)(a1 + 80), _Q2)));
  if (v12 == 0.0) {
    goto LABEL_12;
  }
  int v22 = 100 * (int)v12;
  if (v22 < 0) {
    int v22 = -100 * (int)v12;
  }
  HIDWORD(v23) = -1775253149 * v22;
  LODWORD(v23) = -1775253149 * v22;
  if ((v23 >> 2) <= 0xDA740D)
  {
LABEL_12:
    v20 = *(void **)(a1 + 32);
    v21 = [v20 superview];
    [v21 bounds];
    objc_msgSend(v20, "setBounds:");
  }
  else
  {
    v24 = [*(id *)(a1 + 32) superview];
    [v24 bounds];
    double v26 = v25;
    double v28 = v27;

    objc_msgSend(*(id *)(a1 + 32), "setBounds:", v26, v28, *(double *)(a1 + 88), *(double *)(a1 + 80));
  }
  [*(id *)(a1 + 32) layoutIfNeeded];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(double))(result + 16))(v6);
  }
  return result;
}

@end