@interface CNSharedProfileAnimationGenerator
+ (id)log;
- (id)coinFlipSpringAnimationWithKeyPath:(id)a3 fromValue:(double)a4 toValue:(double)a5;
- (id)peekABooFinalSpringAnimationWithKeyPath:(id)a3 fromValue:(double)a4 toValue:(double)a5;
- (id)peekABooIntermediateSpringAnimationWithKeyPath:(id)a3 fromValue:(double)a4 toValue:(double)a5;
- (id)springAnimationWithKeyPath:(id)a3 fromValue:(double)a4 toValue:(double)a5 stiffness:(double)a6 damping:(double)a7 mass:(double)a8;
- (void)applyBlurFilterToLayer:(id)a3 inputRadius:(double)a4;
- (void)performCoinFlipAnimationForAnimatingAvatarView:(id)a3 pendingNickname:(id)a4 contact:(id)a5 completionHandler:(id)a6;
- (void)performCoinFlipAnimationForAnimatingAvatarView:(id)a3 toAvatarImage:(id)a4 completionHandler:(id)a5;
- (void)performCoinFlipAnimationForAnimatingAvatarView:(id)a3 toContact:(id)a4 rightToLeft:(BOOL)a5 avatarSize:(CGSize)a6 completionHandler:(id)a7;
- (void)performPeekABooAnimationForAnimatingAvatarView:(id)a3 pendingNickname:(id)a4 contact:(id)a5 completionHandler:(id)a6;
@end

@implementation CNSharedProfileAnimationGenerator

+ (id)log
{
  if (log_cn_once_token_1_54587 != -1) {
    dispatch_once(&log_cn_once_token_1_54587, &__block_literal_global_54588);
  }
  v2 = (void *)log_cn_once_object_1_54589;

  return v2;
}

void __40__CNSharedProfileAnimationGenerator_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.ui", "CNSharedProfileAnimationGenerator");
  v1 = (void *)log_cn_once_object_1_54589;
  log_cn_once_object_1_54589 = (uint64_t)v0;
}

- (void)applyBlurFilterToLayer:(id)a3 inputRadius:(double)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F39BC0];
  uint64_t v6 = *MEMORY[0x1E4F3A0D0];
  id v7 = a3;
  v8 = [v5 filterWithType:v6];
  v11[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v7 setFilters:v9];

  v10 = [NSNumber numberWithDouble:a4];
  [v8 setValue:v10 forKey:@"inputRadius"];
}

- (id)springAnimationWithKeyPath:(id)a3 fromValue:(double)a4 toValue:(double)a5 stiffness:(double)a6 damping:(double)a7 mass:(double)a8
{
  v13 = [MEMORY[0x1E4F39C90] animationWithKeyPath:a3];
  v14 = [NSNumber numberWithDouble:a4];
  [v13 setFromValue:v14];

  v15 = [NSNumber numberWithDouble:a5];
  [v13 setToValue:v15];

  [v13 setStiffness:a6];
  [v13 setDamping:a7];
  [v13 setMass:a8];
  [v13 setInitialVelocity:0.0];
  [v13 settlingDuration];
  objc_msgSend(v13, "setDuration:");

  return v13;
}

- (id)peekABooFinalSpringAnimationWithKeyPath:(id)a3 fromValue:(double)a4 toValue:(double)a5
{
  return [(CNSharedProfileAnimationGenerator *)self springAnimationWithKeyPath:a3 fromValue:a4 toValue:a5 stiffness:25.0 damping:5.0 mass:1.0];
}

- (id)peekABooIntermediateSpringAnimationWithKeyPath:(id)a3 fromValue:(double)a4 toValue:(double)a5
{
  return [(CNSharedProfileAnimationGenerator *)self springAnimationWithKeyPath:a3 fromValue:a4 toValue:a5 stiffness:25.0 damping:5.0 mass:1.0];
}

- (id)coinFlipSpringAnimationWithKeyPath:(id)a3 fromValue:(double)a4 toValue:(double)a5
{
  return [(CNSharedProfileAnimationGenerator *)self springAnimationWithKeyPath:a3 fromValue:a4 toValue:a5 stiffness:25.0 damping:5.0 mass:1.0];
}

- (void)performPeekABooAnimationForAnimatingAvatarView:(id)a3 pendingNickname:(id)a4 contact:(id)a5 completionHandler:(id)a6
{
  v85[4] = *MEMORY[0x1E4F143B8];
  id v72 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v12 sourceAvatarLayer];
  v14 = [v12 destinationAvatarImageView];
  v15 = [v12 destinationAvatarImageView];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  v20 = [v12 destinationAvatarImageView];

  v21 = [v20 traitCollection];
  v73 = +[CNSharedProfileAvatarImageGenerator sharedAvatarImageForNickname:contact:size:isRTL:](CNSharedProfileAvatarImageGenerator, "sharedAvatarImageForNickname:contact:size:isRTL:", v11, v10, [v21 layoutDirection] == 1, v17, v19);

  [v14 setImage:v73];
  v71 = v13;
  [v13 setDoubleSided:0];
  v22 = [v14 layer];
  [v22 setDoubleSided:0];

  [(CNSharedProfileAnimationGenerator *)self applyBlurFilterToLayer:v13 inputRadius:0.0];
  v23 = [v14 layer];
  [(CNSharedProfileAnimationGenerator *)self applyBlurFilterToLayer:v23 inputRadius:13.0];

  id v24 = objc_alloc_init(MEMORY[0x1E4F39B38]);
  v25 = [(CNSharedProfileAnimationGenerator *)self peekABooIntermediateSpringAnimationWithKeyPath:@"transform.rotation.y" fromValue:0.0 toValue:3.14159265];
  v85[0] = v25;
  v26 = [(CNSharedProfileAnimationGenerator *)self peekABooIntermediateSpringAnimationWithKeyPath:@"filters.gaussianBlur.inputHardEdges" fromValue:0.0 toValue:1.0];
  v85[1] = v26;
  v27 = [(CNSharedProfileAnimationGenerator *)self peekABooIntermediateSpringAnimationWithKeyPath:@"filters.gaussianBlur.inputNormalizeEdges" fromValue:0.0 toValue:1.0];
  v85[2] = v27;
  v28 = [(CNSharedProfileAnimationGenerator *)self peekABooIntermediateSpringAnimationWithKeyPath:@"filters.gaussianBlur.inputRadius" fromValue:0.0 toValue:13.0];
  v85[3] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:4];
  [v24 setAnimations:v29];

  [v24 setBeginTime:CACurrentMediaTime()];
  [v24 setDuration:1.0];
  uint64_t v30 = *MEMORY[0x1E4F39FA8];
  [v24 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v24 setRemovedOnCompletion:0];
  id v31 = objc_alloc_init(MEMORY[0x1E4F39B38]);
  v32 = [(CNSharedProfileAnimationGenerator *)self peekABooFinalSpringAnimationWithKeyPath:@"transform.rotation.y" fromValue:3.14159265 toValue:0.0];
  v84[0] = v32;
  v33 = [(CNSharedProfileAnimationGenerator *)self peekABooFinalSpringAnimationWithKeyPath:@"filters.gaussianBlur.inputRadius" fromValue:13.0 toValue:0.0];
  v84[1] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:2];
  [v31 setAnimations:v34];

  [v24 beginTime];
  double v36 = v35;
  [v24 duration];
  [v31 setBeginTime:v36 + v37];
  v38 = [v31 animations];
  v39 = [v38 firstObject];
  [v39 duration];
  objc_msgSend(v31, "setDuration:");

  [v31 setFillMode:v30];
  [v31 setRemovedOnCompletion:0];
  id v40 = objc_alloc_init(MEMORY[0x1E4F39B38]);
  v41 = [(CNSharedProfileAnimationGenerator *)self peekABooIntermediateSpringAnimationWithKeyPath:@"transform.rotation.y" fromValue:3.14159265 toValue:0.0];
  v83 = v41;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
  [v40 setAnimations:v42];

  [v40 setBeginTime:CACurrentMediaTime()];
  [v40 setDuration:1.0];
  [v40 setFillMode:v30];
  [v40 setRemovedOnCompletion:0];
  id v43 = objc_alloc_init(MEMORY[0x1E4F39B38]);
  v44 = [(CNSharedProfileAnimationGenerator *)self peekABooIntermediateSpringAnimationWithKeyPath:@"filters.gaussianBlur.inputRadius" fromValue:13.0 toValue:0.0];
  v82 = v44;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
  [v43 setAnimations:v45];

  [v40 beginTime];
  [v43 setBeginTime:v46 + 0.2];
  v47 = [v43 animations];
  v48 = [v47 firstObject];
  [v48 duration];
  objc_msgSend(v43, "setDuration:");

  [v43 setFillMode:v30];
  [v43 setRemovedOnCompletion:0];
  id v49 = objc_alloc_init(MEMORY[0x1E4F39B38]);
  v50 = [(CNSharedProfileAnimationGenerator *)self peekABooFinalSpringAnimationWithKeyPath:@"transform.rotation.y" fromValue:0.0 toValue:3.14159265];
  v81 = v50;
  v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
  [v49 setAnimations:v51];

  [v40 beginTime];
  double v53 = v52;
  [v40 duration];
  [v49 setBeginTime:v53 + v54];
  v55 = [v49 animations];
  v56 = [v55 firstObject];
  [v56 duration];
  objc_msgSend(v49, "setDuration:");

  [v49 setFillMode:v30];
  [v49 setRemovedOnCompletion:0];
  id v57 = objc_alloc_init(MEMORY[0x1E4F39B38]);
  v58 = [(CNSharedProfileAnimationGenerator *)self peekABooFinalSpringAnimationWithKeyPath:@"filters.gaussianBlur.inputRadius" fromValue:0.0 toValue:13.0];
  v80 = v58;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
  [v57 setAnimations:v59];

  [v49 beginTime];
  [v57 setBeginTime:v60 + 0.2];
  v61 = [v57 animations];
  v62 = [v61 firstObject];
  [v62 duration];
  objc_msgSend(v57, "setDuration:");

  [v57 setFillMode:v30];
  [v57 setRemovedOnCompletion:0];
  CATransform3DMakeRotation(&v79, 3.14159265, 0.0, 1.0, 0.0);
  CATransform3D v78 = v79;
  [v14 setTransform3D:&v78];
  v63 = (void *)MEMORY[0x1E4F39CF8];
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __126__CNSharedProfileAnimationGenerator_performPeekABooAnimationForAnimatingAvatarView_pendingNickname_contact_completionHandler___block_invoke;
  v74[3] = &unk_1E549AFF8;
  id v75 = v71;
  id v76 = v14;
  id v77 = v72;
  id v64 = v72;
  id v65 = v14;
  id v66 = v71;
  [v63 setCompletionBlock:v74];
  [v66 addAnimation:v24 forKey:0];
  [v66 addAnimation:v31 forKey:0];
  v67 = [v65 layer];
  [v67 addAnimation:v40 forKey:0];

  v68 = [v65 layer];
  [v68 addAnimation:v43 forKey:0];

  v69 = [v65 layer];
  [v69 addAnimation:v49 forKey:0];

  v70 = [v65 layer];
  [v70 addAnimation:v57 forKey:0];
}

uint64_t __126__CNSharedProfileAnimationGenerator_performPeekABooAnimationForAnimatingAvatarView_pendingNickname_contact_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4F1CBF0];
  [*(id *)(a1 + 32) setFilters:MEMORY[0x1E4F1CBF0]];
  v3 = [*(id *)(a1 + 40) layer];
  [v3 setFilters:v2];

  [*(id *)(a1 + 32) removeAllAnimations];
  v4 = [*(id *)(a1 + 40) layer];
  [v4 removeAllAnimations];

  v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v5();
}

- (void)performCoinFlipAnimationForAnimatingAvatarView:(id)a3 toAvatarImage:(id)a4 completionHandler:(id)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v49 = a5;
  id v9 = a3;
  id v10 = [v9 sourceAvatarLayer];
  id v11 = [v9 destinationAvatarImageView];

  [v11 setImage:v8];
  id v12 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v48 = [v11 layer];
    *(_DWORD *)buf = 134349312;
    id v63 = v8;
    __int16 v64 = 2050;
    id v65 = v48;
    _os_log_debug_impl(&dword_18B625000, v12, OS_LOG_TYPE_DEBUG, "Setting contents (%{public}p) for coin flip animation on destination avatar layer: %{public}p", buf, 0x16u);
  }
  v51 = v8;

  v13 = [v10 mask];

  if (!v13)
  {
    v14 = [MEMORY[0x1E4F39C88] layer];
    v15 = (void *)MEMORY[0x1E4FB14C0];
    [v11 bounds];
    double v17 = v16;
    [v11 bounds];
    objc_msgSend(v15, "bezierPathWithOvalInRect:", 0.0, 0.0, v17);
    id v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPath:", objc_msgSend(v18, "CGPath"));

    [v10 setMask:v14];
    double v19 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349312;
      id v63 = v14;
      __int16 v64 = 2050;
      id v65 = v10;
      _os_log_debug_impl(&dword_18B625000, v19, OS_LOG_TYPE_DEBUG, "Setting source avatar layer mask (%{public}p) for coin flip animation on layer: %{public}p", buf, 0x16u);
    }
  }
  objc_msgSend(v10, "setDoubleSided:", 0, v49);
  v20 = [v11 layer];
  [v20 setDoubleSided:0];

  [(CNSharedProfileAnimationGenerator *)self applyBlurFilterToLayer:v10 inputRadius:0.0];
  v21 = [v11 layer];
  [(CNSharedProfileAnimationGenerator *)self applyBlurFilterToLayer:v21 inputRadius:13.0];

  id v22 = objc_alloc_init(MEMORY[0x1E4F39B38]);
  v23 = [(CNSharedProfileAnimationGenerator *)self coinFlipSpringAnimationWithKeyPath:@"transform.rotation.y" fromValue:0.0 toValue:3.14159265];
  v61[0] = v23;
  id v24 = [(CNSharedProfileAnimationGenerator *)self coinFlipSpringAnimationWithKeyPath:@"filters.gaussianBlur.inputHardEdges" fromValue:0.0 toValue:1.0];
  v61[1] = v24;
  v25 = [(CNSharedProfileAnimationGenerator *)self coinFlipSpringAnimationWithKeyPath:@"filters.gaussianBlur.inputNormalizeEdges" fromValue:0.0 toValue:1.0];
  v61[2] = v25;
  v26 = [(CNSharedProfileAnimationGenerator *)self coinFlipSpringAnimationWithKeyPath:@"filters.gaussianBlur.inputRadius" fromValue:0.0 toValue:13.0];
  v61[3] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:4];
  [v22 setAnimations:v27];

  [v22 setBeginTime:CACurrentMediaTime()];
  v28 = [v22 animations];
  v29 = [v28 firstObject];
  [v29 duration];
  objc_msgSend(v22, "setDuration:");

  uint64_t v30 = *MEMORY[0x1E4F39FA8];
  [v22 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v22 setRemovedOnCompletion:0];
  id v31 = objc_alloc_init(MEMORY[0x1E4F39B38]);
  v32 = [(CNSharedProfileAnimationGenerator *)self coinFlipSpringAnimationWithKeyPath:@"transform.rotation.y" fromValue:3.14159265 toValue:0.0];
  double v60 = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
  [v31 setAnimations:v33];

  [v31 setBeginTime:CACurrentMediaTime()];
  v34 = [v31 animations];
  double v35 = [v34 firstObject];
  [v35 duration];
  objc_msgSend(v31, "setDuration:");

  [v31 setFillMode:v30];
  [v31 setRemovedOnCompletion:0];
  id v36 = objc_alloc_init(MEMORY[0x1E4F39B38]);
  double v37 = [(CNSharedProfileAnimationGenerator *)self coinFlipSpringAnimationWithKeyPath:@"filters.gaussianBlur.inputRadius" fromValue:13.0 toValue:0.0];
  v59 = v37;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
  [v36 setAnimations:v38];

  [v36 setBeginTime:CACurrentMediaTime() + 0.2];
  v39 = [v36 animations];
  id v40 = [v39 firstObject];
  [v40 duration];
  objc_msgSend(v36, "setDuration:");

  [v36 setFillMode:v30];
  [v36 setRemovedOnCompletion:0];
  CATransform3DMakeRotation(&v58, 3.14159265, 0.0, 1.0, 0.0);
  CATransform3D v57 = v58;
  [v11 setTransform3D:&v57];
  v41 = (void *)MEMORY[0x1E4F39CF8];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __116__CNSharedProfileAnimationGenerator_performCoinFlipAnimationForAnimatingAvatarView_toAvatarImage_completionHandler___block_invoke;
  v52[3] = &unk_1E549A940;
  id v53 = v10;
  id v54 = v51;
  id v55 = v11;
  id v56 = v50;
  id v42 = v50;
  id v43 = v11;
  id v44 = v51;
  id v45 = v10;
  [v41 setCompletionBlock:v52];
  [v45 addAnimation:v22 forKey:0];
  double v46 = [v43 layer];
  [v46 addAnimation:v31 forKey:0];

  v47 = [v43 layer];
  [v47 addAnimation:v36 forKey:0];
}

uint64_t __116__CNSharedProfileAnimationGenerator_performCoinFlipAnimationForAnimatingAvatarView_toAvatarImage_completionHandler___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  objc_msgSend(*(id *)(a1 + 32), "setContents:", objc_msgSend(*(id *)(a1 + 40), "CGImage"));
  uint64_t v2 = *(void **)(a1 + 48);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v11[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v11[5] = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v11[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v11[7] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v11[0] = *MEMORY[0x1E4F39B10];
  v11[1] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  void v11[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v11[3] = v6;
  [v2 setTransform3D:v11];
  uint64_t v7 = MEMORY[0x1E4F1CBF0];
  [*(id *)(a1 + 32) setFilters:MEMORY[0x1E4F1CBF0]];
  id v8 = [*(id *)(a1 + 48) layer];
  [v8 setFilters:v7];

  [*(id *)(a1 + 32) removeAllAnimations];
  id v9 = [*(id *)(a1 + 48) layer];
  [v9 removeAllAnimations];

  [MEMORY[0x1E4F39CF8] commit];
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)performCoinFlipAnimationForAnimatingAvatarView:(id)a3 pendingNickname:(id)a4 contact:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v13 destinationAvatarImageView];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v19 = [v13 destinationAvatarImageView];
  v20 = [v19 traitCollection];
  +[CNSharedProfileAvatarImageGenerator sharedAvatarImageForNickname:contact:size:isRTL:](CNSharedProfileAvatarImageGenerator, "sharedAvatarImageForNickname:contact:size:isRTL:", v12, v11, [v20 layoutDirection] == 1, v16, v18);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  [(CNSharedProfileAnimationGenerator *)self performCoinFlipAnimationForAnimatingAvatarView:v13 toAvatarImage:v21 completionHandler:v10];
}

- (void)performCoinFlipAnimationForAnimatingAvatarView:(id)a3 toContact:(id)a4 rightToLeft:(BOOL)a5 avatarSize:(CGSize)a6 completionHandler:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  BOOL v10 = a5;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  double v16 = v15;
  if (v14)
  {
    double v17 = [CNAvatarImageRenderer alloc];
    double v18 = +[CNAvatarImageRendererSettings defaultSettings];
    double v19 = [(CNAvatarImageRenderer *)v17 initWithSettings:v18];

    v20 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v20 scale];
    id v22 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", v10, 0, width, height, v21);

    v25[0] = v14;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    id v24 = [(CNAvatarImageRenderer *)v19 avatarImageForContacts:v23 scope:v22];

    [(CNSharedProfileAnimationGenerator *)self performCoinFlipAnimationForAnimatingAvatarView:v13 toAvatarImage:v24 completionHandler:v16];
  }
  else if (v15)
  {
    (*((void (**)(id))v15 + 2))(v15);
  }
}

@end