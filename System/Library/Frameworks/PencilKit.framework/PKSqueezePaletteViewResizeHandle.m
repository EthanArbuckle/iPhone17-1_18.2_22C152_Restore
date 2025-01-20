@interface PKSqueezePaletteViewResizeHandle
- (PKSqueezePaletteViewResizeHandle)init;
- (id)initWithStrokeStartPresentationValue:(double)a3 strokeEndPresentationValue:;
- (void)_performAnimated:(void *)a3 animations:(void *)a4 completion:;
- (void)resizeToStrokeStart:(void *)a3 strokeEnd:(void *)a4 animated:(double)a5 resizeHandler:(double)a6 completion:;
@end

@implementation PKSqueezePaletteViewResizeHandle

- (PKSqueezePaletteViewResizeHandle)init
{
  return (PKSqueezePaletteViewResizeHandle *)-[PKSqueezePaletteViewResizeHandle initWithStrokeStartPresentationValue:strokeEndPresentationValue:](self, 0.0, 0.0);
}

- (id)initWithStrokeStartPresentationValue:(double)a3 strokeEndPresentationValue:
{
  v18[2] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v17.receiver = a1;
  v17.super_class = (Class)PKSqueezePaletteViewResizeHandle;
  v5 = (id *)objc_msgSendSuper2(&v17, sel_init);
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1ED0]);
    id v7 = v5[1];
    v5[1] = v6;

    id v8 = objc_alloc_init(MEMORY[0x1E4FB1ED0]);
    id v9 = v5[2];
    v5[2] = v8;

    [v5[1] setValue:a2];
    [v5[2] setValue:a3];
    objc_initWeak(&location, v5);
    v10 = (void *)MEMORY[0x1E4FB1EB0];
    id v11 = v5[2];
    v18[0] = v5[1];
    v18[1] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __100__PKSqueezePaletteViewResizeHandle_initWithStrokeStartPresentationValue_strokeEndPresentationValue___block_invoke;
    v14[3] = &unk_1E64C5998;
    objc_copyWeak(&v15, &location);
    [v10 _createTransformerWithInputAnimatableProperties:v12 presentationValueChangedCallback:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __100__PKSqueezePaletteViewResizeHandle_initWithStrokeStartPresentationValue_strokeEndPresentationValue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = *((void *)WeakRetained + 3);
    if (v3)
    {
      v4 = v2;
      (*(void (**)(void))(v3 + 16))();
      v2 = v4;
    }
  }
}

- (void)resizeToStrokeStart:(void *)a3 strokeEnd:(void *)a4 animated:(double)a5 resizeHandler:(double)a6 completion:
{
  id v11 = a3;
  id v12 = a4;
  if (a1)
  {
    uint64_t v13 = [v11 copy];
    v14 = (void *)a1[3];
    a1[3] = v13;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __100__PKSqueezePaletteViewResizeHandle_resizeToStrokeStart_strokeEnd_animated_resizeHandler_completion___block_invoke;
    aBlock[3] = &unk_1E64C6060;
    id v24 = v12;
    id v15 = _Block_copy(aBlock);
    objc_initWeak(&location, a1);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __100__PKSqueezePaletteViewResizeHandle_resizeToStrokeStart_strokeEnd_animated_resizeHandler_completion___block_invoke_2;
    v19[3] = &unk_1E64C9C20;
    objc_copyWeak(v21, &location);
    id v20 = v15;
    v21[1] = *(id *)&a5;
    v21[2] = *(id *)&a6;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __100__PKSqueezePaletteViewResizeHandle_resizeToStrokeStart_strokeEnd_animated_resizeHandler_completion___block_invoke_3;
    v17[3] = &unk_1E64C8F08;
    id v16 = v20;
    id v18 = v16;
    -[PKSqueezePaletteViewResizeHandle _performAnimated:animations:completion:]((uint64_t)a1, a2, v19, v17);

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
}

uint64_t __100__PKSqueezePaletteViewResizeHandle_resizeToStrokeStart_strokeEnd_animated_resizeHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __100__PKSqueezePaletteViewResizeHandle_resizeToStrokeStart_strokeEnd_animated_resizeHandler_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[1] setValue:*(double *)(a1 + 48)];
    [v3[2] setValue:*(double *)(a1 + 56)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __100__PKSqueezePaletteViewResizeHandle_resizeToStrokeStart_strokeEnd_animated_resizeHandler_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performAnimated:(void *)a3 animations:(void *)a4 completion:
{
  id v8 = a3;
  id v7 = a4;
  if (a1)
  {
    if (a2) {
      [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDampingRatio:0 response:v8 tracking:v7 initialDampingRatio:*(double *)&PKSqueezePaletteViewResizeDampingRatio initialResponse:*(double *)&PKSqueezePaletteViewResizeResponse dampingRatioSmoothing:0.0 responseSmoothing:0.0 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
    }
    else {
      [MEMORY[0x1E4FB1EB0] _performWithoutRetargetingAnimations:v8];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationValueDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_strokeEndAnimatableProperty, 0);

  objc_storeStrong((id *)&self->_strokeStartAnimatableProperty, 0);
}

@end