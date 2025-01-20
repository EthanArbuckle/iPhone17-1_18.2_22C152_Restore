@interface PKHashtagView
- (PKHashtagItem)hashtagItem;
- (PKHashtagView)initWithHashtagItem:(id)a3 inDrawing:(id)a4;
- (PKHashtagViewDelegate)delegate;
- (UIView)blankPreviewView;
- (double)_underlineThickness;
- (id)_underlineColor;
- (id)accessibilityIdentifier;
- (id)accessibilityValue;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)item;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)setBlankPreviewView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateActivationState;
@end

@implementation PKHashtagView

- (PKHashtagView)initWithHashtagItem:(id)a3 inDrawing:(id)a4
{
  v6 = (PKHashtagItem *)a3;
  v12.receiver = self;
  v12.super_class = (Class)PKHashtagView;
  id v7 = a4;
  v8 = [(PKDetectionView *)&v12 init];
  hashtagItem = v8->_hashtagItem;
  v8->_hashtagItem = v6;
  v10 = v6;

  -[PKDetectionItem setDrawing:](v8->_hashtagItem, "setDrawing:", v7, v12.receiver, v12.super_class);
  return v8;
}

- (id)item
{
  return self->_hashtagItem;
}

- (id)_underlineColor
{
  v3 = [(PKHashtagView *)self hashtagItem];
  if ([v3 active]) {
    [(PKHashtagView *)self tintColor];
  }
  else {
  v4 = [MEMORY[0x1E4FB1618] separatorColor];
  }

  return v4;
}

- (double)_underlineThickness
{
  return 1.0;
}

- (void)updateActivationState
{
  v3 = [(PKHashtagView *)self hashtagItem];
  id v9 = [v3 hashtagUUID];

  v4 = [(PKHashtagView *)self hashtagItem];
  [v4 invalidateUUID];

  v5 = [(PKHashtagView *)self hashtagItem];
  id v6 = [v5 hashtagUUID];

  if (v9 != v6 && ([v9 isEqual:v6] & 1) == 0)
  {
    id v7 = [(PKHashtagView *)self delegate];
    v8 = v7;
    if (v6) {
      [v7 hashtagViewDidActivateHashtag:self];
    }
    else {
      [v7 hashtagViewWillDeactivateHashtag:self];
    }

    [(PKHashtagView *)self setNeedsDisplay];
  }
}

- (id)accessibilityIdentifier
{
  return @"com.apple.pencilkit.hashtagView";
}

- (id)accessibilityValue
{
  return [(PKHashtagItem *)self->_hashtagItem hashtagResult];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PKHashtagView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v6[3] = &unk_1E64C8BB8;
  v6[4] = self;
  v4 = [MEMORY[0x1E4FB1678] configurationWithIdentifier:0 previewProvider:0 actionProvider:v6];

  return v4;
}

id __71__PKHashtagView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) hashtagItem];
  char v3 = [v2 active];
  v4 = _PencilKitBundle();
  v5 = v4;
  if (v3) {
    id v6 = @"Convert to text";
  }
  else {
    id v6 = @"Convert to tag";
  }
  id v7 = [v4 localizedStringForKey:v6 value:v6 table:@"Localizable"];

  v8 = (void *)MEMORY[0x1E4FB1818];
  id v9 = [*(id *)(a1 + 32) hashtagItem];
  if ([v9 active]) {
    v10 = @"textformat";
  }
  else {
    v10 = @"number";
  }
  v11 = [v8 systemImageNamed:v10];

  objc_super v12 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __71__PKHashtagView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v24 = &unk_1E64C6E08;
  uint64_t v25 = *(void *)(a1 + 32);
  id v26 = v7;
  id v13 = v7;
  v14 = [v12 actionWithTitle:v13 image:v11 identifier:0 handler:&v21];
  v15 = (void *)MEMORY[0x1E4FB1970];
  v16 = objc_msgSend(*(id *)(a1 + 32), "hashtagItem", v21, v22, v23, v24, v25);
  v17 = [v16 hashtagResult];
  v27[0] = v14;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v19 = [v15 menuWithTitle:v17 children:v18];

  return v19;
}

void __71__PKHashtagView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) hashtagItem];
  int v3 = [v2 active];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) delegate];
    [v4 hashtagViewWillDeactivateHashtag:*(void *)(a1 + 32)];
  }
  v5 = [*(id *)(a1 + 32) hashtagItem];
  id v6 = [*(id *)(a1 + 32) hashtagItem];
  objc_msgSend(v5, "setActive:", objc_msgSend(v6, "active") ^ 1);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [*(id *)(a1 + 32) hashtagItem];
  LODWORD(v6) = [v7 active];

  v8 = [*(id *)(a1 + 32) delegate];
  id v9 = v8;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v6) {
    [v8 hashtagViewDidActivateHashtag:v10];
  }
  else {
    [v8 hashtagViewDidDeactivateHashtag:v10];
  }

  [v12 setActionName:*(void *)(a1 + 40)];
  v11 = [*(id *)(a1 + 32) delegate];
  [v11 hashtagView:*(void *)(a1 + 32) registerCommand:v12];

  [*(id *)(a1 + 32) setNeedsDisplay];
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  id v7 = [MEMORY[0x1E4FB1618] clearColor];
  [v6 setBackgroundColor:v7];

  v8 = [MEMORY[0x1E4FB14C0] bezierPath];
  [v6 setShadowPath:v8];

  id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(PKHashtagView *)self frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [(PKHashtagView *)self frame];
  CGFloat v19 = v18 * 0.5;
  v29.origin.x = v11;
  v29.origin.y = v13;
  v29.size.width = v15;
  v29.size.height = v17;
  CGRect v30 = CGRectInset(v29, 0.0, v19);
  v20 = objc_msgSend(v9, "initWithFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
  [(PKHashtagView *)self setBlankPreviewView:v20];

  uint64_t v21 = [(PKHashtagView *)self blankPreviewView];
  [v21 setOpaque:0];

  uint64_t v22 = [(PKHashtagView *)self superview];
  v23 = [(PKHashtagView *)self blankPreviewView];
  [v22 addSubview:v23];

  id v24 = objc_alloc(MEMORY[0x1E4FB1D48]);
  uint64_t v25 = [(PKHashtagView *)self blankPreviewView];
  id v26 = (void *)[v24 initWithView:v25 parameters:v6];

  return v26;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__PKHashtagView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v5[3] = &unk_1E64C61C0;
  v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

uint64_t __73__PKHashtagView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) blankPreviewView];
  [v2 removeFromSuperview];

  int v3 = *(void **)(a1 + 32);

  return [v3 setBlankPreviewView:0];
}

- (PKHashtagItem)hashtagItem
{
  return self->_hashtagItem;
}

- (PKHashtagViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKHashtagViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_hashtagItem, 0);
}

@end