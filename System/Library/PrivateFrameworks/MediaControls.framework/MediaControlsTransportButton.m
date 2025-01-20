@interface MediaControlsTransportButton
- (BOOL)isPerformingHighlightAnimation;
- (BOOL)shouldPresentActionSheet;
- (MPCPlayerCommandRequest)holdBeginCommandRequest;
- (MPCPlayerCommandRequest)holdEndCommandRequest;
- (MPCPlayerCommandRequest)touchUpInsideCommandRequest;
- (MediaControlsTransportButton)initWithFrame:(CGRect)a3;
- (NSString)identifier;
- (double)cursorScale;
- (void)setCursorScale:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHoldBeginCommandRequest:(id)a3;
- (void)setHoldEndCommandRequest:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setShouldPresentActionSheet:(BOOL)a3;
- (void)setTouchUpInsideCommandRequest:(id)a3;
@end

@implementation MediaControlsTransportButton

- (MediaControlsTransportButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MediaControlsTransportButton;
  v3 = -[MPButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MediaControlsTransportButton *)v3 setPointerInteractionEnabled:1];
    [(MediaControlsTransportButton *)v4 setPointerStyleProvider:&__block_literal_global_18];
  }
  return v4;
}

id __46__MediaControlsTransportButton_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 cursorScale];
  [v2 bounds];
  CGRectGetWidth(v18);
  [v2 bounds];
  CGRectGetHeight(v19);
  [v2 bounds];
  UIRectCenteredRect();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  v12 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v4, v6, v8, v10);
  [v11 setVisiblePath:v12];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v2 parameters:v11];
  v14 = [MEMORY[0x1E4FB1AB8] effectWithPreview:v13];
  v15 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v14 shape:0];

  return v15;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MediaControlsTransportButton;
  -[MediaControlsTransportButton setHighlighted:](&v17, sel_setHighlighted_);
  if (v3)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __47__MediaControlsTransportButton_setHighlighted___block_invoke;
    v15 = &unk_1E5F0D7F8;
    v16 = self;
    double v5 = 0.2;
    double v6 = &v12;
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    double v9 = __47__MediaControlsTransportButton_setHighlighted___block_invoke_2;
    double v10 = &unk_1E5F0D7F8;
    id v11 = self;
    double v5 = 0.47;
    double v6 = &v7;
  }
  objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:delay:options:animations:completion:", 2, v6, 0, v5, 0.0, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
}

void __47__MediaControlsTransportButton_setHighlighted___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v4, 0.8, 0.8);
  id v2 = [*(id *)(a1 + 32) _imageView];
  CGAffineTransform v3 = v4;
  [v2 setTransform:&v3];
}

void __47__MediaControlsTransportButton_setHighlighted___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _imageView];
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v3[0] = *MEMORY[0x1E4F1DAB8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v1 setTransform:v3];
}

- (MPCPlayerCommandRequest)touchUpInsideCommandRequest
{
  return self->_touchUpInsideCommandRequest;
}

- (void)setTouchUpInsideCommandRequest:(id)a3
{
}

- (MPCPlayerCommandRequest)holdBeginCommandRequest
{
  return self->_holdBeginCommandRequest;
}

- (void)setHoldBeginCommandRequest:(id)a3
{
}

- (MPCPlayerCommandRequest)holdEndCommandRequest
{
  return self->_holdEndCommandRequest;
}

- (void)setHoldEndCommandRequest:(id)a3
{
}

- (BOOL)shouldPresentActionSheet
{
  return self->_shouldPresentActionSheet;
}

- (void)setShouldPresentActionSheet:(BOOL)a3
{
  self->_shouldPresentActionSheet = a3;
}

- (BOOL)isPerformingHighlightAnimation
{
  return self->_performingHighlightAnimation;
}

- (double)cursorScale
{
  return self->_cursorScale;
}

- (void)setCursorScale:(double)a3
{
  self->_cursorScale = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_holdEndCommandRequest, 0);
  objc_storeStrong((id *)&self->_holdBeginCommandRequest, 0);

  objc_storeStrong((id *)&self->_touchUpInsideCommandRequest, 0);
}

@end