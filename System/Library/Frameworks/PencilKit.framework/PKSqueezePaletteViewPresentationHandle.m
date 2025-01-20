@interface PKSqueezePaletteViewPresentationHandle
- (PKSqueezePaletteViewPresentationHandle)init;
- (double)animationProgress;
- (id)initWithPaletteViewOpacityPresentationValue:(double)a3 paletteViewScalePresentationValue:;
- (void)animateToPaletteViewOpacity:(void *)a3 paletteViewScale:(void *)a4 animated:(double)a5 presentationValueHandler:(double)a6 completion:;
@end

@implementation PKSqueezePaletteViewPresentationHandle

- (PKSqueezePaletteViewPresentationHandle)init
{
  return (PKSqueezePaletteViewPresentationHandle *)-[PKSqueezePaletteViewPresentationHandle initWithPaletteViewOpacityPresentationValue:paletteViewScalePresentationValue:](self, 0.0, 1.0);
}

- (id)initWithPaletteViewOpacityPresentationValue:(double)a3 paletteViewScalePresentationValue:
{
  v18[2] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v17.receiver = a1;
  v17.super_class = (Class)PKSqueezePaletteViewPresentationHandle;
  v5 = (id *)objc_msgSendSuper2(&v17, sel_init);
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1ED0]);
    id v7 = v5[3];
    v5[3] = v6;

    [v5[3] setValue:a2];
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1ED0]);
    id v9 = v5[4];
    v5[4] = v8;

    [v5[4] setValue:a3];
    id v10 = v5[4];
    v18[0] = v5[3];
    v18[1] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    objc_initWeak(&location, v5);
    v12 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __120__PKSqueezePaletteViewPresentationHandle_initWithPaletteViewOpacityPresentationValue_paletteViewScalePresentationValue___block_invoke;
    v14[3] = &unk_1E64C5998;
    objc_copyWeak(&v15, &location);
    [v12 _createTransformerWithInputAnimatableProperties:v11 presentationValueChangedCallback:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __120__PKSqueezePaletteViewPresentationHandle_initWithPaletteViewOpacityPresentationValue_paletteViewScalePresentationValue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = *((void *)WeakRetained + 5);
    if (v3)
    {
      v4 = v2;
      (*(void (**)(void))(v3 + 16))();
      v2 = v4;
    }
  }
}

- (void)animateToPaletteViewOpacity:(void *)a3 paletteViewScale:(void *)a4 animated:(double)a5 presentationValueHandler:(double)a6 completion:
{
  id v11 = a3;
  id v12 = a4;
  if (a1)
  {
    uint64_t v13 = [v11 copy];
    v14 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v13;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __132__PKSqueezePaletteViewPresentationHandle_animateToPaletteViewOpacity_paletteViewScale_animated_presentationValueHandler_completion___block_invoke;
    aBlock[3] = &unk_1E64C8F08;
    id v33 = v12;
    id v15 = _Block_copy(aBlock);
    [*(id *)(a1 + 24) value];
    *(void *)(a1 + 8) = v16;
    [*(id *)(a1 + 32) value];
    *(void *)(a1 + 16) = v17;
    objc_initWeak(&location, (id)a1);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __132__PKSqueezePaletteViewPresentationHandle_animateToPaletteViewOpacity_paletteViewScale_animated_presentationValueHandler_completion___block_invoke_2;
    v28[3] = &unk_1E64C9C20;
    objc_copyWeak(v30, &location);
    id v18 = v15;
    id v29 = v18;
    v30[1] = *(id *)&a5;
    v30[2] = *(id *)&a6;
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __132__PKSqueezePaletteViewPresentationHandle_animateToPaletteViewOpacity_paletteViewScale_animated_presentationValueHandler_completion___block_invoke_3;
    v25 = &unk_1E64CAE90;
    objc_copyWeak(&v27, &location);
    id v19 = v18;
    id v26 = v19;
    v20 = v28;
    v21 = &v22;
    if (a2) {
      objc_msgSend(MEMORY[0x1E4FB1EB0], "_animateUsingSpringWithDampingRatio:response:tracking:initialDampingRatio:initialResponse:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v20, v21, *(double *)&PKSqueezePaletteViewPresentationDampingRatio, *(double *)&PKSqueezePaletteViewPresentationResponse, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v22, v23, v24, v25, v26);
    }
    else {
      objc_msgSend(MEMORY[0x1E4FB1EB0], "_performWithoutRetargetingAnimations:", v20, v22, v23, v24, v25, v26);
    }

    objc_destroyWeak(&v27);
    objc_destroyWeak(v30);
    objc_destroyWeak(&location);
  }
}

uint64_t __132__PKSqueezePaletteViewPresentationHandle_animateToPaletteViewOpacity_paletteViewScale_animated_presentationValueHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __132__PKSqueezePaletteViewPresentationHandle_animateToPaletteViewOpacity_paletteViewScale_animated_presentationValueHandler_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 48) = 1;
    [WeakRetained[3] setValue:*(double *)(a1 + 48)];
    [v3[4] setValue:*(double *)(a1 + 56)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __132__PKSqueezePaletteViewPresentationHandle_animateToPaletteViewOpacity_paletteViewScale_animated_presentationValueHandler_completion___block_invoke_3(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    WeakRetained[48] = a2 ^ 1;
  }
  id v5 = WeakRetained;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)animationProgress
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 24) presentationValue];
  double v3 = v2 - *(double *)(a1 + 8);
  [*(id *)(a1 + 24) value];
  double v5 = v3 / (v4 - *(double *)(a1 + 8));
  [*(id *)(a1 + 32) presentationValue];
  double v7 = v6 - *(double *)(a1 + 16);
  [*(id *)(a1 + 32) value];
  return (v5 + v7 / (v8 - *(double *)(a1 + 16))) * 0.5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationValueDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_paletteViewScaleAnimatableProperty, 0);

  objc_storeStrong((id *)&self->_paletteViewOpacityAnimatableProperty, 0);
}

@end