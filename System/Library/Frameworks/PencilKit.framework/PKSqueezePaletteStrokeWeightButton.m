@interface PKSqueezePaletteStrokeWeightButton
- (double)initWithStrokeWeight:(void *)a1;
@end

@implementation PKSqueezePaletteStrokeWeightButton

- (double)initWithStrokeWeight:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)PKSqueezePaletteStrokeWeightButton;
  v3 = (double *)objc_msgSendSuper2(&v9, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[93] = a2;
    objc_initWeak(&location, v3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__PKSqueezePaletteStrokeWeightButton_initWithStrokeWeight___block_invoke;
    v6[3] = &unk_1E64C81A8;
    objc_copyWeak(&v7, &location);
    [v4 setPointerStyleProvider:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v4;
}

id __59__PKSqueezePaletteStrokeWeightButton_initWithStrokeWeight___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  v8 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v10 = objc_loadWeakRetained(v8);
    char v11 = [v10 isSelected];

    if (v11)
    {
      WeakRetained = 0;
    }
    else
    {
      v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v6];
      v13 = [MEMORY[0x1E4FB1AC0] effectWithPreview:v12];
      WeakRetained = [MEMORY[0x1E4FB1AE8] styleWithEffect:v13 shape:v7];
    }
  }

  return WeakRetained;
}

@end