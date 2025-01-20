@interface PKProofreadingView
- (NSTimer)visibilityTimer;
- (PKProofreadingItem)proofreadingItem;
- (PKProofreadingView)initWithProofreadingItem:(id)a3 inDrawing:(id)a4;
- (PKProofreadingViewDelegate)delegate;
- (UIEditMenuInteraction)editMenuInteraction;
- (UIView)blankPreviewView;
- (double)_underlineThickness;
- (id)_underlineColor;
- (id)accessibilityIdentifier;
- (id)accessibilityValue;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (id)item;
- (void)_setLineDashFor:(id)a3;
- (void)didMoveToSuperview;
- (void)ensureViewIsVisible;
- (void)setBlankPreviewView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditMenuInteraction:(id)a3;
- (void)setHideTimer;
- (void)setVisibilityTimer:(id)a3;
- (void)tapHandler:(id)a3;
@end

@implementation PKProofreadingView

- (PKProofreadingView)initWithProofreadingItem:(id)a3 inDrawing:(id)a4
{
  v6 = (PKProofreadingItem *)a3;
  v12.receiver = self;
  v12.super_class = (Class)PKProofreadingView;
  id v7 = a4;
  v8 = [(PKDetectionView *)&v12 init];
  proofreadingItem = v8->_proofreadingItem;
  v8->_proofreadingItem = v6;
  v10 = v6;

  -[PKDetectionItem setDrawing:](v8->_proofreadingItem, "setDrawing:", v7, v12.receiver, v12.super_class);
  return v8;
}

- (void)didMoveToSuperview
{
  v3 = [(PKProofreadingView *)self superview];

  if (v3)
  {
    [(PKProofreadingView *)self setHidden:0];
    [(PKProofreadingView *)self setHideTimer];
  }
}

- (void)setHideTimer
{
  [(NSTimer *)self->_visibilityTimer invalidate];
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E4F1CB00];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__PKProofreadingView_setHideTimer__block_invoke;
  v6[3] = &unk_1E64C9870;
  objc_copyWeak(&v7, &location);
  v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:v6 block:30.0];
  visibilityTimer = self->_visibilityTimer;
  self->_visibilityTimer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __34__PKProofreadingView_setHideTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHidden:1];
}

- (void)ensureViewIsVisible
{
  [(PKProofreadingView *)self setHidden:0];

  [(PKProofreadingView *)self setHideTimer];
}

- (id)item
{
  return self->_proofreadingItem;
}

- (id)_underlineColor
{
  v2 = [(PKProofreadingView *)self item];
  v3 = [v2 strokeColor];

  return v3;
}

- (double)_underlineThickness
{
  return 3.0;
}

- (void)_setLineDashFor:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  long long v3 = xmmword_1C482C290;
  [a3 setLineDash:&v3 count:2 phase:0.0];
}

- (id)accessibilityIdentifier
{
  return @"com.apple.pencilkit.proofreadingView";
}

- (id)accessibilityValue
{
  return 0;
}

- (void)tapHandler:(id)a3
{
  [a3 locationInView:self];
  if (-[PKDetectionView hitTest:](self, "hitTest:"))
  {
    if (!self->_editMenuInteraction)
    {
      uint64_t v4 = (UIEditMenuInteraction *)[objc_alloc(MEMORY[0x1E4FB1758]) initWithDelegate:self];
      editMenuInteraction = self->_editMenuInteraction;
      self->_editMenuInteraction = v4;

      [(PKProofreadingView *)self addInteraction:self->_editMenuInteraction];
    }
    [(PKProofreadingView *)self bounds];
    CGFloat x = v13.origin.x;
    CGFloat y = v13.origin.y;
    CGFloat width = v13.size.width;
    CGFloat height = v13.size.height;
    double MidX = CGRectGetMidX(v13);
    v14.origin.CGFloat x = x;
    v14.origin.CGFloat y = y;
    v14.size.CGFloat width = width;
    v14.size.CGFloat height = height;
    objc_msgSend(MEMORY[0x1E4FB1750], "configurationWithIdentifier:sourcePoint:", @"proofreadingView", MidX, CGRectGetMinY(v14) + 20.0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [(UIEditMenuInteraction *)self->_editMenuInteraction presentEditMenuWithConfiguration:v11];
  }
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v6 = [(PKProofreadingView *)self proofreadingItem];
  id v7 = [v6 replacementStrings];
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v9 = [(PKProofreadingView *)self delegate];
  [v9 proofreadingView:self willPresentStringsForProofreadingItem:v6];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1E4FB13F0];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __80__PKProofreadingView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke;
        v20[3] = &unk_1E64CBB58;
        id v21 = v6;
        uint64_t v22 = v14;
        v23 = self;
        v16 = [v15 actionWithTitle:v14 image:0 identifier:0 handler:v20];
        [v8 addObject:v16];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  v17 = [MEMORY[0x1E4FB1970] menuWithChildren:v8];

  return v17;
}

uint64_t __80__PKProofreadingView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.pencilkit", "Proofreading");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = [*(id *)(a1 + 32) identifier];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412547;
    v8 = v5;
    __int16 v9 = 2117;
    uint64_t v10 = v6;
    _os_log_debug_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEBUG, "Activated menu for proofreading item: %@, string: %{sensitive}@", (uint8_t *)&v7, 0x16u);
  }
  long long v3 = [*(id *)(a1 + 48) delegate];
  [v3 proofreadingView:*(void *)(a1 + 48) didReplaceWithString:*(void *)(a1 + 40)];

  return [*(id *)(a1 + 48) setNeedsDisplay];
}

- (PKProofreadingItem)proofreadingItem
{
  return self->_proofreadingItem;
}

- (PKProofreadingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKProofreadingViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIEditMenuInteraction)editMenuInteraction
{
  return self->_editMenuInteraction;
}

- (void)setEditMenuInteraction:(id)a3
{
}

- (NSTimer)visibilityTimer
{
  return self->_visibilityTimer;
}

- (void)setVisibilityTimer:(id)a3
{
}

- (UIView)blankPreviewView
{
  return self->_blankPreviewView;
}

- (void)setBlankPreviewView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blankPreviewView, 0);
  objc_storeStrong((id *)&self->_visibilityTimer, 0);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_proofreadingItem, 0);
}

@end