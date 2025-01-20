@interface MFPopupButton
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (MFActivityIndicatorLabel)label;
- (MFPopupButton)initWithFrame:(CGRect)a3;
- (MFPopupButtonDelegate)delegate;
- (MFPopupButtonItem)selectedItem;
- (NSArray)combinedItems;
- (NSArray)deferredItems;
- (NSArray)items;
- (UIFont)font;
- (id)actionForItem:(id)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)_didSelectItem:(id)a3;
- (void)_updateUI;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)disableMenu;
- (void)dismissMenu;
- (void)enableMenu;
- (void)setDeferredItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFont:(id)a3;
- (void)setItems:(id)a3;
- (void)setSelectedItem:(id)a3;
- (void)sizeToFit;
- (void)updateItem:(id)a3;
@end

@implementation MFPopupButton

- (MFPopupButton)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MFPopupButton;
  v3 = -[MFPopupButton initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    items = v3->_items;
    v6 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v3->_items = (NSArray *)MEMORY[0x1E4F1CBF0];

    deferredItems = v4->_deferredItems;
    v4->_deferredItems = v6;

    v8 = objc_alloc_init(MFActivityIndicatorLabel);
    label = v4->_label;
    v4->_label = v8;

    [(MFPopupButton *)v4 bounds];
    -[MFActivityIndicatorLabel setFrame:](v4->_label, "setFrame:");
    v10 = [(MFActivityIndicatorLabel *)v4->_label textLabel];
    [v10 setTextAlignment:4];

    [(MFPopupButton *)v4 addSubview:v4->_label];
    [(UIView *)v4->_label mf_pinToView:v4 layoutMarginEdges:0 flexibleEdges:13];
    [(MFPopupButton *)v4 setContextMenuInteractionEnabled:0];
    [(MFPopupButton *)v4 setShowsMenuAsPrimaryAction:1];
  }
  return v4;
}

- (void)setSelectedItem:(id)a3
{
  id v6 = a3;
  if (!-[MFPopupButtonItem isEqual:](self->_selectedItem, "isEqual:"))
  {
    v4 = (MFPopupButtonItem *)[v6 copy];
    selectedItem = self->_selectedItem;
    self->_selectedItem = v4;

    [(MFPopupButton *)self updateItem:v6];
    [(MFPopupButton *)self _updateUI];
  }
}

- (void)setItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 copy];
  id v6 = (void *)v5;
  if (v5) {
    v7 = (void *)v5;
  }
  else {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v7;

  if (([v8 isEqualToArray:self->_items] & 1) == 0)
  {
    [(MFPopupButton *)self dismissMenu];
    objc_storeStrong((id *)&self->_items, v7);
    [(MFPopupButton *)self setContextMenuInteractionEnabled:[(NSArray *)self->_items count] != 0];
    [(MFPopupButton *)self _updateUI];
  }
}

- (void)setDeferredItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 copy];
  id v6 = (void *)v5;
  if (v5) {
    v7 = (void *)v5;
  }
  else {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v7;

  if (([v8 isEqualToArray:self->_deferredItems] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_deferredItems, v7);
    [(MFPopupButton *)self _updateUI];
  }
}

- (NSArray)combinedItems
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v3 = [(MFPopupButton *)self items];
  v8[0] = v3;
  id v4 = [(MFPopupButton *)self deferredItems];
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = objc_msgSend(v5, "ef_flatten");

  return (NSArray *)v6;
}

- (void)updateItem:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(MFPopupButton *)self combinedItems];
  uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v9 = [v8 popupTitle];
        v10 = [v4 popupTitle];
        if ([v9 isEqualToString:v10])
        {
          v11 = [v8 title];
          objc_super v12 = [v4 title];
          char v13 = [v11 isEqualToString:v12];

          if ((v13 & 1) == 0)
          {
            v14 = [v4 title];
            [v8 setTitle:v14];

            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
LABEL_12:
}

- (UIFont)font
{
  v2 = [(MFPopupButton *)self label];
  v3 = [v2 textLabel];
  id v4 = [v3 font];

  return (UIFont *)v4;
}

- (void)setFont:(id)a3
{
  id v6 = a3;
  id v4 = [(MFPopupButton *)self label];
  uint64_t v5 = [v4 textLabel];
  [v5 setFont:v6];
}

- (void)dismissMenu
{
  id v2 = [(MFPopupButton *)self contextMenuInteraction];
  [v2 dismissMenu];
}

- (void)disableMenu
{
}

- (void)enableMenu
{
}

- (void)sizeToFit
{
  v5.receiver = self;
  v5.super_class = (Class)MFPopupButton;
  [(MFPopupButton *)&v5 sizeToFit];
  v3 = [(MFPopupButton *)self label];
  [v3 sizeToFit];

  id v4 = [(MFPopupButton *)self label];
  [v4 frame];
  -[MFPopupButton setBounds:](self, "setBounds:");
}

- (void)_updateUI
{
  v3 = [MEMORY[0x1E4FB1618] mailSenderAddressPickerColorNormalTextColor];
  id v4 = [(MFPopupButton *)self selectedItem];
  [(MFPopupButton *)self updateItem:v4];
  if (v4
    && ([(MFPopupButton *)self combinedItems],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 containsObject:v4],
        v5,
        v6))
  {
    v7 = [(MFPopupButton *)self selectedItem];
    char v13 = [v7 title];

    if ([v4 style] == 1)
    {
      uint64_t v8 = [MEMORY[0x1E4FB1618] mailSenderAddressPickerUnsafeDomainColorTextColor];

      v3 = (void *)v8;
    }
  }
  else
  {
    char v13 = &stru_1F0817A00;
  }
  v9 = [(MFPopupButton *)self label];
  v10 = [v9 textLabel];
  [v10 setText:v13];

  v11 = [(MFPopupButton *)self label];
  objc_super v12 = [v11 textLabel];
  [v12 setTextColor:v3];
}

- (void)_didSelectItem:(id)a3
{
  id v7 = a3;
  id v4 = [(MFPopupButton *)self delegate];
  objc_super v5 = [(MFPopupButton *)self combinedItems];
  int v6 = [v5 containsObject:v7];

  if (v6)
  {
    [(MFPopupButton *)self setSelectedItem:v7];
    if (objc_opt_respondsToSelector()) {
      [v4 popupButton:self didSelectItem:v7];
    }
  }
}

- (id)actionForItem:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MFPopupButton *)self selectedItem];
  unsigned int v6 = [v4 isEqual:v5];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v7 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v8 = [v4 popupTitle];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __31__MFPopupButton_actionForItem___block_invoke;
  v14[3] = &unk_1E5F7BF50;
  objc_copyWeak(&v16, &location);
  id v9 = v4;
  id v15 = v9;
  v10 = [v7 actionWithTitle:v8 image:0 identifier:0 handler:v14];

  v11 = [v9 subtitle];
  [v10 setSubtitle:v11];

  if ([v9 style] == 1)
  {
    uint64_t v12 = 2;
  }
  else
  {
    if ([v9 style] != 2) {
      goto LABEL_6;
    }
    uint64_t v12 = 1;
  }
  [v10 setAttributes:v12];
LABEL_6:
  [v10 setState:v6];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v10;
}

void __31__MFPopupButton_actionForItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didSelectItem:*(void *)(a1 + 32)];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v4 = (void *)MEMORY[0x1E4FB1678];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__MFPopupButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v7[3] = &unk_1E5F7CFF8;
  objc_copyWeak(&v8, &location);
  objc_super v5 = [v4 configurationWithIdentifier:0 previewProvider:0 actionProvider:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

id __71__MFPopupButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained delegate];
  v3 = [v2 menuForPopupButton:WeakRetained];

  return v3;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a5;
  v10.receiver = self;
  v10.super_class = (Class)MFPopupButton;
  [(MFPopupButton *)&v10 contextMenuInteraction:a3 willDisplayMenuForConfiguration:a4 animator:v8];
  id v9 = [(MFPopupButton *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 popupButtonWillPresentMenu:self animator:v8];
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a5;
  v10.receiver = self;
  v10.super_class = (Class)MFPopupButton;
  [(MFPopupButton *)&v10 contextMenuInteraction:a3 willEndForConfiguration:a4 animator:v8];
  id v9 = [(MFPopupButton *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 popupButtonWillDismissMenu:self animator:v8];
  }
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  uint64_t v4 = [(MFPopupButton *)self effectiveUserInterfaceLayoutDirection];
  [(MFPopupButton *)self bounds];
  CGFloat v9 = v5;
  CGFloat v10 = v6;
  CGFloat v11 = v7;
  CGFloat v12 = v8;
  CGFloat MaxX = v5;
  if (v4 == 1) {
    CGFloat MaxX = CGRectGetMaxX(*(CGRect *)&v5);
  }
  v17.origin.x = v9;
  v17.origin.y = v10;
  v17.size.width = v11;
  v17.size.height = v12;
  double MaxY = CGRectGetMaxY(v17);
  double v15 = MaxX;
  result.y = MaxY;
  result.x = v15;
  return result;
}

- (MFActivityIndicatorLabel)label
{
  return self->_label;
}

- (MFPopupButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFPopupButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MFPopupButtonItem)selectedItem
{
  return self->_selectedItem;
}

- (NSArray)items
{
  return self->_items;
}

- (NSArray)deferredItems
{
  return self->_deferredItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_label, 0);
}

@end