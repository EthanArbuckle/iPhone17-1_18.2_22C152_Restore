@interface HUAnimationUtilities
+ (void)schedulePopAnimation:(id)a3 scaleFactor:(double)a4 beginDuration:(double)a5 endDuration:(double)a6 completion:(id)a7;
@end

@implementation HUAnimationUtilities

+ (void)schedulePopAnimation:(id)a3 scaleFactor:(double)a4 beginDuration:(double)a5 endDuration:(double)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  [v11 setUserInteractionEnabled:0];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  if (v11) {
    [v11 transform];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__HUAnimationUtilities_schedulePopAnimation_scaleFactor_beginDuration_endDuration_completion___block_invoke;
  aBlock[3] = &unk_1E6385C20;
  id v13 = v11;
  id v35 = v13;
  id v36 = v12;
  id v14 = v12;
  v15 = _Block_copy(aBlock);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __94__HUAnimationUtilities_schedulePopAnimation_scaleFactor_beginDuration_endDuration_completion___block_invoke_2;
  v28[3] = &unk_1E6385C50;
  id v16 = v13;
  id v29 = v16;
  long long v30 = v37;
  long long v31 = v38;
  long long v32 = v39;
  double v33 = a4;
  v17 = _Block_copy(v28);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __94__HUAnimationUtilities_schedulePopAnimation_scaleFactor_beginDuration_endDuration_completion___block_invoke_3;
  v21[3] = &unk_1E6385CA0;
  double v24 = a6;
  long long v25 = v37;
  long long v26 = v38;
  long long v27 = v39;
  id v22 = v16;
  id v23 = v15;
  id v18 = v15;
  id v19 = v16;
  v20 = _Block_copy(v21);
  [MEMORY[0x1E4F42FF0] animateWithDuration:0x20000 delay:v17 options:v20 animations:a5 completion:0.0];
}

uint64_t __94__HUAnimationUtilities_schedulePopAnimation_scaleFactor_beginDuration_endDuration_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserInteractionEnabled:1];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __94__HUAnimationUtilities_schedulePopAnimation_scaleFactor_beginDuration_endDuration_completion___block_invoke_2(uint64_t a1)
{
  CGFloat v2 = *(double *)(a1 + 88);
  long long v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v7.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&v7.c = v3;
  *(_OWORD *)&v7.tx = *(_OWORD *)(a1 + 72);
  CGAffineTransformScale(&v8, &v7, v2, v2);
  v4 = *(void **)(a1 + 32);
  CGAffineTransform v6 = v8;
  return [v4 setTransform:&v6];
}

void __94__HUAnimationUtilities_schedulePopAnimation_scaleFactor_beginDuration_endDuration_completion___block_invoke_3(uint64_t a1)
{
  CGFloat v2 = (void *)MEMORY[0x1E4F42FF0];
  double v3 = *(double *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __94__HUAnimationUtilities_schedulePopAnimation_scaleFactor_beginDuration_endDuration_completion___block_invoke_4;
  v5[3] = &unk_1E6385C78;
  id v6 = *(id *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 72);
  long long v7 = *(_OWORD *)(a1 + 56);
  long long v8 = v4;
  long long v9 = *(_OWORD *)(a1 + 88);
  [v2 animateWithDuration:0 delay:v5 options:*(void *)(a1 + 40) animations:v3 completion:0.0];
}

uint64_t __94__HUAnimationUtilities_schedulePopAnimation_scaleFactor_beginDuration_endDuration_completion___block_invoke_4(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return [*(id *)(a1 + 32) setTransform:v3];
}

@end