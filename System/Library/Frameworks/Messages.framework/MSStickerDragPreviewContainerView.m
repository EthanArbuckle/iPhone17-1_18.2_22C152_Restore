@interface MSStickerDragPreviewContainerView
@end

@implementation MSStickerDragPreviewContainerView

void __68___MSStickerDragPreviewContainerView_meshTransformWithContentScale___block_invoke(uint64_t a1)
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  double v1 = *(double *)(a1 + 32) + -1.0;
  v5[0] = 0.0 - v1;
  v5[1] = 0.0;
  long long v6 = xmmword_1E4AA8370;
  v5[2] = 0.0 - v1;
  double v7 = v1 + 1.0;
  uint64_t v8 = 0;
  double v9 = v1 + 1.0;
  long long v10 = xmmword_1E4AA8370;
  double v11 = 0.0 - v1;
  uint64_t v12 = 0x3FB999999999999ALL;
  long long v14 = xmmword_1E4AA8380;
  double v13 = 0.0 - v1;
  double v15 = v1 + 1.0;
  uint64_t v16 = 0x3FB999999999999ALL;
  double v17 = v1 + 1.0;
  long long v18 = xmmword_1E4AA8380;
  double v19 = 0.0 - v1;
  uint64_t v20 = 0x3FC999999999999ALL;
  long long v22 = xmmword_1E4AA8390;
  double v21 = 0.0 - v1;
  double v23 = v1 + 1.0;
  uint64_t v24 = 0x3FC999999999999ALL;
  double v25 = v1 + 1.0;
  long long v26 = xmmword_1E4AA8390;
  double v27 = 0.0 - v1;
  uint64_t v28 = 0x3FD3333333333333;
  double v29 = 0.0 - v1;
  uint64_t v30 = 0x3FD3333333333333;
  uint64_t v31 = 0x405E000000000000;
  double v32 = v1 + 1.0;
  uint64_t v33 = 0x3FD3333333333333;
  double v34 = v1 + 1.0;
  long long v35 = xmmword_1E4AA83A0;
  double v36 = 0.0 - v1;
  uint64_t v37 = 0x3FD999999999999ALL;
  double v38 = 0.0 - v1;
  uint64_t v39 = 0x3FD999999999999ALL;
  uint64_t v40 = 0x405E000000000000;
  double v41 = v1 + 1.0;
  uint64_t v42 = 0x3FD999999999999ALL;
  double v43 = v1 + 1.0;
  long long v44 = xmmword_1E4AA83B0;
  double v45 = 0.0 - v1;
  uint64_t v46 = 0x3FE0000000000000;
  double v47 = 0.0 - v1;
  uint64_t v48 = 0x3FE0000000000000;
  uint64_t v49 = 0x405E000000000000;
  double v50 = v1 + 1.0;
  uint64_t v51 = 0x3FE0000000000000;
  double v52 = v1 + 1.0;
  long long v53 = xmmword_1E4AA83C0;
  double v54 = 0.0 - v1;
  uint64_t v55 = 0x3FE3333333333333;
  double v56 = 0.0 - v1;
  uint64_t v57 = 0x3FE3333333333333;
  uint64_t v58 = 0;
  double v59 = v1 + 1.0;
  uint64_t v60 = 0x3FE3333333333333;
  double v61 = v1 + 1.0;
  long long v62 = xmmword_1E4AA83D0;
  double v63 = 0.0 - v1;
  uint64_t v64 = 0x3FE6666666666666;
  double v65 = 0.0 - v1;
  uint64_t v66 = 0x3FE6666666666666;
  uint64_t v67 = 0;
  double v68 = v1 + 1.0;
  uint64_t v69 = 0x3FE6666666666666;
  double v70 = v1 + 1.0;
  long long v71 = xmmword_1E4AA83E0;
  double v72 = 0.0 - v1;
  uint64_t v73 = 0x3FE999999999999ALL;
  double v74 = 0.0 - v1;
  uint64_t v75 = 0x3FE999999999999ALL;
  uint64_t v76 = 0;
  double v77 = v1 + 1.0;
  uint64_t v78 = 0x3FE999999999999ALL;
  double v79 = v1 + 1.0;
  long long v80 = xmmword_1E4AA83F0;
  double v81 = 0.0 - v1;
  uint64_t v82 = 0x3FECCCCCCCCCCCCDLL;
  double v83 = 0.0 - v1;
  uint64_t v84 = 0x3FECCCCCCCCCCCCDLL;
  uint64_t v85 = 0;
  double v86 = v1 + 1.0;
  uint64_t v87 = 0x3FECCCCCCCCCCCCDLL;
  double v88 = v1 + 1.0;
  long long v89 = xmmword_1E4AA8400;
  double v90 = 0.0 - v1;
  uint64_t v91 = 0x3FF0000000000000;
  double v92 = 0.0 - v1;
  uint64_t v93 = 0x3FF0000000000000;
  uint64_t v94 = 0;
  double v95 = v1 + 1.0;
  uint64_t v96 = 0x3FF0000000000000;
  double v97 = v1 + 1.0;
  long long v98 = xmmword_1E4AA8410;
  memcpy(__dst, &unk_1E4AA8448, sizeof(__dst));
  uint64_t v2 = [MEMORY[0x1E4F39C18] meshTransformWithVertexCount:22 vertices:v5 faceCount:10 faces:__dst depthNormalization:*MEMORY[0x1E4F39ED8]];
  v3 = (void *)meshTransformWithContentScale____mesh;
  meshTransformWithContentScale____mesh = v2;
}

uint64_t __108___MSStickerDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __108___MSStickerDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return [*(id *)(a1 + 32) setAlpha:0.999];
}

uint64_t __108___MSStickerDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __79___MSStickerDragPreviewContainerView__animateLiftAlongsideAnimator_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) center];
  objc_msgSend(*(id *)(a1 + 32), "setOriginalCenter:");
  [*(id *)(a1 + 32) bounds];
  double v3 = v2 * 1.1 + v2 * 1.1;
  v4 = objc_opt_class();
  LODWORD(v5) = 1050253722;
  long long v6 = [v4 springAnimationWithKeyPath:@"position" speed:v5];
  double v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, v3);
  [v6 setByValue:v7];

  [v6 setBeginTime:CACurrentMediaTime() + -0.31];
  uint64_t v8 = objc_opt_class();
  LODWORD(v9) = 1050253722;
  long long v10 = [v8 springAnimationWithKeyPath:@"position" speed:v9];
  double v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, -v3);
  [v10 setByValue:v11];

  [v10 setBeginTime:CACurrentMediaTime() + -0.31];
  uint64_t v12 = objc_opt_class();
  LODWORD(v13) = 1053609165;
  long long v14 = [v12 springAnimationWithKeyPath:@"position" speed:v13];
  double v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 135.0);
  [v14 setByValue:v15];

  [v14 setBeginTime:CACurrentMediaTime() + -0.12];
  uint64_t v16 = objc_opt_class();
  LODWORD(v17) = 1061997773;
  long long v18 = [v16 springAnimationWithKeyPath:@"position" speed:v17];
  double v19 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 130.0);
  [v18 setByValue:v19];

  [v18 setBeginTime:CACurrentMediaTime() + 0.1];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.310000002];
  uint64_t v20 = [*(id *)(a1 + 32) meshLayer];
  [v20 addAnimation:v6 forKey:@"meshAnimation"];

  double v21 = [*(id *)(a1 + 32) peelLayer];
  [v21 addAnimation:v10 forKey:@"peelAnimation"];

  long long v22 = [*(id *)(a1 + 32) shineLayer];
  [v22 addAnimation:v14 forKey:@"shineAnimation"];

  double v23 = [*(id *)(a1 + 32) shadowLayer];
  [v23 addAnimation:v18 forKey:@"shadowAnimation"];

  [MEMORY[0x1E4F39CF8] commit];
  dispatch_time_t v24 = dispatch_time(0, 910000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79___MSStickerDragPreviewContainerView__animateLiftAlongsideAnimator_completion___block_invoke_2;
  block[3] = &unk_1E6E98A40;
  id v26 = *(id *)(a1 + 40);
  dispatch_after(v24, MEMORY[0x1E4F14428], block);
}

uint64_t __79___MSStickerDragPreviewContainerView__animateLiftAlongsideAnimator_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __91___MSStickerDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  [v1 originalCenter];

  return objc_msgSend(v1, "reversePeelAnimationToPoint:forPlacement:shouldShrink:completionBlock:", 0, 0, &__block_literal_global_8);
}

uint64_t __91___MSStickerDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __91___MSStickerDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __79___MSStickerDragPreviewContainerView__animateDropAlongsideAnimator_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v2 = ms_defaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1E4A76000, v2, OS_LOG_TYPE_DEFAULT, "<_MSStickerDragPreviewContainerView: %p> _animateDropAlongsideAnimator animator callback.", buf, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  [v4 center];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79___MSStickerDragPreviewContainerView__animateDropAlongsideAnimator_completion___block_invoke_83;
  v6[3] = &unk_1E6E987F0;
  v6[4] = *(void *)(a1 + 32);
  return objc_msgSend(v4, "reversePeelAnimationToPoint:forPlacement:shouldShrink:completionBlock:", 1, 0, v6);
}

uint64_t __79___MSStickerDragPreviewContainerView__animateDropAlongsideAnimator_completion___block_invoke_83(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v2 = ms_defaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1E4A76000, v2, OS_LOG_TYPE_DEFAULT, "<_MSStickerDragPreviewContainerView: %p> _animateDropAlongsideAnimator reversePeelAnimationToPoint callback", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) setDropAnimationIsComplete:1];
}

@end