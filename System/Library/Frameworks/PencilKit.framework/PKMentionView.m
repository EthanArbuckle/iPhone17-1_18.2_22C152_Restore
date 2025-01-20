@interface PKMentionView
- (NSArray)possibleParticipants;
- (PKMentionItem)mentionItem;
- (PKMentionView)initWithMentionItem:(id)a3 possibleParticipants:(id)a4 inDrawing:(id)a5;
- (PKMentionViewDelegate)delegate;
- (UIColor)mentionColor;
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
- (void)setMentionColor:(id)a3;
- (void)setPossibleParticipants:(id)a3;
- (void)updateActivationState;
@end

@implementation PKMentionView

- (PKMentionView)initWithMentionItem:(id)a3 possibleParticipants:(id)a4 inDrawing:(id)a5
{
  v8 = (PKMentionItem *)a3;
  v17.receiver = self;
  v17.super_class = (Class)PKMentionView;
  id v9 = a5;
  id v10 = a4;
  v11 = [(PKDetectionView *)&v17 init];
  mentionItem = v11->_mentionItem;
  v11->_mentionItem = v8;
  v13 = v8;

  -[PKDetectionItem setDrawing:](v11->_mentionItem, "setDrawing:", v9, v17.receiver, v17.super_class);
  uint64_t v14 = [v10 copy];

  possibleParticipants = v11->_possibleParticipants;
  v11->_possibleParticipants = (NSArray *)v14;

  return v11;
}

- (id)item
{
  return self->_mentionItem;
}

- (void)setMentionColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_mentionColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_mentionColor, a3);
    [(PKMentionView *)self setNeedsDisplay];
  }
}

- (id)_underlineColor
{
  if ([(PKMentionItem *)self->_mentionItem active] && (mentionColor = self->_mentionColor) != 0)
  {
    v4 = mentionColor;
  }
  else
  {
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
  v3 = [(PKMentionView *)self mentionItem];
  id v9 = [v3 mentionUUID];

  v4 = [(PKMentionView *)self mentionItem];
  [v4 invalidateUUID];

  id v5 = [(PKMentionView *)self mentionItem];
  id v6 = [v5 mentionUUID];

  if (v9 != v6 && ([v9 isEqual:v6] & 1) == 0)
  {
    v7 = [(PKMentionView *)self delegate];
    v8 = v7;
    if (v6) {
      [v7 mentionViewDidActivateMention:self withParticpant:0];
    }
    else {
      [v7 mentionViewWillDeactivateMention:self];
    }

    [(PKMentionView *)self setNeedsDisplay];
  }
}

- (id)accessibilityIdentifier
{
  return @"com.apple.pencilkit.mentionView";
}

- (id)accessibilityValue
{
  return [(PKMentionItem *)self->_mentionItem mentionResult];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PKMentionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v6[3] = &unk_1E64C8BB8;
  v6[4] = self;
  v4 = [MEMORY[0x1E4FB1678] configurationWithIdentifier:0 previewProvider:0 actionProvider:v6];

  return v4;
}

id __71__PKMentionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = [*(id *)(a1 + 32) mentionItem];
  v4 = [v3 mentionUUID];

  if (v4)
  {
    id v5 = _PencilKitBundle();
    id v6 = [v5 localizedStringForKey:@"Convert to text" value:@"Convert to text" table:@"Localizable"];

    v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"textformat"];
    v8 = (void *)MEMORY[0x1E4FB13F0];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __71__PKMentionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
    v37[3] = &unk_1E64C6E08;
    v37[4] = *(void *)(a1 + 32);
    id v38 = v6;
    id v9 = v6;
    id v10 = [v8 actionWithTitle:v9 image:v7 identifier:0 handler:v37];
    [v2 addObject:v10];
    v11 = [*(id *)(a1 + 32) mentionItem];
    v12 = [v11 mentionResult];
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v31 = a1;
    id obj = [*(id *)(a1 + 32) possibleParticipants];
    uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          objc_super v17 = v2;
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x1E4FB13F0];
          v20 = [v18 displayName];
          v21 = [v18 color];
          v22 = [MEMORY[0x1E4FB1BA8] mainScreen];
          [v22 scale];
          CGFloat v24 = v23;
          v42.width = 24.0;
          v42.height = 24.0;
          UIGraphicsBeginImageContextWithOptions(v42, 0, v24);

          v25 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 4.0, 4.0, 16.0, 16.0);
          [v25 addClip];

          [v21 set];
          v43.origin.x = 4.0;
          v43.origin.y = 4.0;
          v43.size.width = 16.0;
          v43.size.height = 16.0;
          UIRectFill(v43);
          v26 = UIGraphicsGetImageFromCurrentImageContext();
          UIGraphicsEndImageContext();
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __71__PKMentionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
          v32[3] = &unk_1E64C6E08;
          v32[4] = *(void *)(v31 + 32);
          v32[5] = v18;
          v27 = [v19 actionWithTitle:v20 image:v26 identifier:0 handler:v32];

          v2 = v17;
          [v17 addObject:v27];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v14);
    }

    v7 = _PencilKitBundle();
    v12 = [v7 localizedStringForKey:@"Participants to mention" value:@"Participants to mention" table:@"Localizable"];
  }

  v28 = [MEMORY[0x1E4FB1970] menuWithTitle:v12 children:v2];

  return v28;
}

void __71__PKMentionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setMentionColor:0];
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 mentionViewWillDeactivateMention:*(void *)(a1 + 32)];

  v3 = [*(id *)(a1 + 32) mentionItem];
  id v6 = [v3 setActive:0];

  v4 = [*(id *)(a1 + 32) delegate];
  [v4 mentionViewDidDeactivateMention:*(void *)(a1 + 32)];

  [v6 setActionName:*(void *)(a1 + 40)];
  id v5 = [*(id *)(a1 + 32) delegate];
  [v5 mentionView:*(void *)(a1 + 32) registerCommand:v6];

  [*(id *)(a1 + 32) setNeedsDisplay];
}

void __71__PKMentionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) color];
  [*(id *)(a1 + 32) setMentionColor:v2];

  v3 = [*(id *)(a1 + 32) mentionItem];
  id v8 = [v3 setActive:1];

  v4 = [*(id *)(a1 + 32) delegate];
  [v4 mentionViewDidActivateMention:*(void *)(a1 + 32) withParticpant:*(void *)(a1 + 40)];

  id v5 = _PencilKitBundle();
  id v6 = [v5 localizedStringForKey:@"Convert to mention" value:@"Convert to mention" table:@"Localizable"];
  [v8 setActionName:v6];

  v7 = [*(id *)(a1 + 32) delegate];
  [v7 mentionView:*(void *)(a1 + 32) registerCommand:v8];

  [*(id *)(a1 + 32) setNeedsDisplay];
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  v7 = [MEMORY[0x1E4FB1618] clearColor];
  [v6 setBackgroundColor:v7];

  id v8 = [MEMORY[0x1E4FB14C0] bezierPath];
  [v6 setShadowPath:v8];

  id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(PKMentionView *)self frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [(PKMentionView *)self frame];
  CGFloat v19 = v18 * 0.5;
  v29.origin.x = v11;
  v29.origin.y = v13;
  v29.size.width = v15;
  v29.size.height = v17;
  CGRect v30 = CGRectInset(v29, 0.0, v19);
  v20 = objc_msgSend(v9, "initWithFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
  [(PKMentionView *)self setBlankPreviewView:v20];

  v21 = [(PKMentionView *)self blankPreviewView];
  [v21 setOpaque:0];

  v22 = [(PKMentionView *)self superview];
  double v23 = [(PKMentionView *)self blankPreviewView];
  [v22 addSubview:v23];

  id v24 = objc_alloc(MEMORY[0x1E4FB1D48]);
  v25 = [(PKMentionView *)self blankPreviewView];
  v26 = (void *)[v24 initWithView:v25 parameters:v6];

  return v26;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__PKMentionView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v5[3] = &unk_1E64C61C0;
  v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

uint64_t __73__PKMentionView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) blankPreviewView];
  [v2 removeFromSuperview];

  v3 = *(void **)(a1 + 32);

  return [v3 setBlankPreviewView:0];
}

- (PKMentionItem)mentionItem
{
  return self->_mentionItem;
}

- (UIColor)mentionColor
{
  return self->_mentionColor;
}

- (PKMentionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKMentionViewDelegate *)WeakRetained;
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

- (NSArray)possibleParticipants
{
  return self->_possibleParticipants;
}

- (void)setPossibleParticipants:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleParticipants, 0);
  objc_storeStrong((id *)&self->_blankPreviewView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mentionColor, 0);

  objc_storeStrong((id *)&self->_mentionItem, 0);
}

@end