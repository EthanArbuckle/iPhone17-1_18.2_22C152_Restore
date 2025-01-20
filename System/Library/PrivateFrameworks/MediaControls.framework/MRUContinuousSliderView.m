@interface MRUContinuousSliderView
- (MRUOutputDeviceAsset)outputDeviceAsset;
- (UIImageSymbolConfiguration)imageSymbolConfiguration;
- (double)referenceGlyphScale;
- (void)setGlyphScale:(double)a3;
- (void)setImageSymbolConfiguration:(id)a3;
- (void)setOutputDeviceAsset:(id)a3 state:(id)a4 animated:(BOOL)a5;
- (void)setReferenceGlyphScale:(double)a3;
@end

@implementation MRUContinuousSliderView

- (void)setGlyphScale:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MRUContinuousSliderView;
  -[CCUIBaseSliderView setGlyphScale:](&v5, sel_setGlyphScale_);
  [(MRUContinuousSliderView *)self setReferenceGlyphScale:a3];
}

- (void)setImageSymbolConfiguration:(id)a3
{
  id v7 = a3;
  if (!-[UIImageSymbolConfiguration isEqualToConfiguration:](self->_imageSymbolConfiguration, "isEqualToConfiguration:"))
  {
    objc_storeStrong((id *)&self->_imageSymbolConfiguration, a3);
    objc_super v5 = [(MRUOutputDeviceAsset *)self->_outputDeviceAsset icon];
    if (v7 && v5)
    {
      v6 = [v5 imageByApplyingSymbolConfiguration:v7];
      [(CCUIBaseSliderView *)self setGlyphImage:v6];

      [(MRUContinuousSliderView *)self setNeedsLayout];
      [(MRUContinuousSliderView *)self layoutIfNeeded];
    }
  }
}

- (void)setOutputDeviceAsset:(id)a3 state:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  if (v5) {
    int v11 = [v9 isEqual:self->_outputDeviceAsset] ^ 1;
  }
  else {
    int v11 = 0;
  }
  objc_storeStrong((id *)&self->_outputDeviceAsset, a3);
  v12 = [v9 packageDescription];
  v13 = [v9 icon];
  v14 = v13;
  if (v13 && self->_imageSymbolConfiguration)
  {
    uint64_t v15 = objc_msgSend(v13, "imageByApplyingSymbolConfiguration:");

    v14 = (void *)v15;
  }
  if (v11)
  {
    [(MRUContinuousSliderView *)self _removeAllAnimations:1];
    v16 = (void *)MEMORY[0x1E4FB1EB0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __63__MRUContinuousSliderView_setOutputDeviceAsset_state_animated___block_invoke;
    v24[3] = &unk_1E5F0DBF8;
    v24[4] = self;
    v24[5] = 0x3FE999999999999ALL;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__MRUContinuousSliderView_setOutputDeviceAsset_state_animated___block_invoke_2;
    v18[3] = &unk_1E5F0E310;
    v18[4] = self;
    id v19 = v9;
    id v20 = v14;
    id v21 = v12;
    id v22 = v10;
    uint64_t v23 = 6;
    [v16 _animateUsingSpringWithDuration:6 delay:v24 options:v18 mass:0.3175 stiffness:0.0 damping:1.0 initialVelocity:845.74 animations:58.1632 completion:0.0];
  }
  else
  {
    [(CCUIBaseSliderView *)self setGlyphImage:v14];
    [(CCUIBaseSliderView *)self setGlyphPackageDescription:v12];
    [(CCUIBaseSliderView *)self setGlyphState:v10];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__MRUContinuousSliderView_setOutputDeviceAsset_state_animated___block_invoke_4;
    v17[3] = &unk_1E5F0D7F8;
    v17[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v17];
  }
}

uint64_t __63__MRUContinuousSliderView_setOutputDeviceAsset_state_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) referenceGlyphScale];
  double v3 = v2 * *(double *)(a1 + 40);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)MRUContinuousSliderView;
  objc_msgSendSuper2(&v5, sel_setGlyphScale_, v3);
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __63__MRUContinuousSliderView_setOutputDeviceAsset_state_animated___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) outputDeviceAsset];
  double v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    [*(id *)(a1 + 32) setGlyphImage:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setGlyphPackageDescription:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) setGlyphState:*(void *)(a1 + 64)];
    [*(id *)(a1 + 32) layoutIfNeeded];
  }
  uint64_t v4 = *(void *)(a1 + 72);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__MRUContinuousSliderView_setOutputDeviceAsset_state_animated___block_invoke_3;
  v6[3] = &unk_1E5F0D7F8;
  v6[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDuration:v4 delay:v6 options:0 mass:0.9975 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:30.0 completion:0.0];
}

uint64_t __63__MRUContinuousSliderView_setOutputDeviceAsset_state_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) referenceGlyphScale];
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)MRUContinuousSliderView;
  objc_msgSendSuper2(&v3, sel_setGlyphScale_);
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __63__MRUContinuousSliderView_setOutputDeviceAsset_state_animated___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) referenceGlyphScale];
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)MRUContinuousSliderView;
  objc_msgSendSuper2(&v3, sel_setGlyphScale_);
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (MRUOutputDeviceAsset)outputDeviceAsset
{
  return self->_outputDeviceAsset;
}

- (double)referenceGlyphScale
{
  return self->_referenceGlyphScale;
}

- (void)setReferenceGlyphScale:(double)a3
{
  self->_referenceGlyphScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceAsset, 0);

  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
}

@end