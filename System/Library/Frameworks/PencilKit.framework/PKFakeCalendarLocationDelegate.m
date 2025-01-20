@interface PKFakeCalendarLocationDelegate
- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4;
- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4;
- (PKFakeCalendarLocationDelegate)initWithCell:(id)a3 window:(id)a4;
- (id)_searchBarInView:(id)a3;
- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6;
- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5;
@end

@implementation PKFakeCalendarLocationDelegate

- (PKFakeCalendarLocationDelegate)initWithCell:(id)a3 window:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKFakeCalendarLocationDelegate;
  v8 = [(PKFakeCalendarLocationDelegate *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_window, v7);
    objc_storeWeak((id *)&v9->_cell, v6);
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    elementID = v9->_elementID;
    v9->_elementID = (NSUUID *)v10;

    v12 = [v6 superview];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = v12;
    }
    else
    {
      do
      {
        v13 = [v12 superview];

        objc_opt_class();
        v12 = v13;
      }
      while ((objc_opt_isKindOfClass() & 1) == 0);
    }
    objc_storeWeak((id *)&v9->_tableView, v13);
  }
  return v9;
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *, uint64_t))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  if (WeakRetained)
  {
    v9[0] = self->_elementID;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    v6[2](v6, v8, 0x7FFFFFFFFFFFFFFFLL);
  }
  else
  {
    v6[2](v6, (void *)MEMORY[0x1E4F1CBF0], 0x7FFFFFFFFFFFFFFFLL);
  }
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  id v7 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  id v9 = objc_loadWeakRetained((id *)&self->_window);
  uint64_t v10 = v9;
  if (WeakRetained && v9)
  {
    v11 = [WeakRetained delegate];
    v12 = [MEMORY[0x1E4F28D58] indexPathForRow:1 inSection:0];
    [v11 tableView:WeakRetained didSelectRowAtIndexPath:v12];

    dispatch_time_t v13 = dispatch_time(0, 800000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __115__PKFakeCalendarLocationDelegate__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke;
    block[3] = &unk_1E64C6988;
    block[4] = self;
    id v15 = v10;
    id v16 = v7;
    dispatch_after(v13, MEMORY[0x1E4F14428], block);
  }
}

void __115__PKFakeCalendarLocationDelegate__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _searchBarInView:*(void *)(a1 + 40)];
  id v6 = v2;
  if (v2)
  {
    v3 = [v2 searchField];
    [v3 becomeFirstResponder];

    uint64_t v4 = *(void *)(a1 + 48);
    v5 = [v6 searchField];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB20];
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 1;
}

- (id)_searchBarInView:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    double v6 = objc_msgSend(v4, "subviews", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [(PKFakeCalendarLocationDelegate *)self _searchBarInView:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          if (v11)
          {
            id v5 = (id)v11;

            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v5 = 0;
  }
LABEL_13:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementID, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_destroyWeak((id *)&self->_tableView);

  objc_destroyWeak((id *)&self->_cell);
}

@end