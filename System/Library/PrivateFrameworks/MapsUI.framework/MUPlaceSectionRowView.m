@interface MUPlaceSectionRowView
+ (id)rowViewWithContentView:(id)a3;
- (BOOL)handlesHighlighting;
- (BOOL)isSelected;
- (BOOL)supportsInteractionMenuItems;
- (MUPlaceSectionRowView)initWithFrame:(CGRect)a3;
- (id)_createCopyAction;
- (id)_speechMenuElementFromSuggestedActions:(id)a3;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (void)_updateBackgroundColor:(BOOL)a3;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)setHandlesHighlighting:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation MUPlaceSectionRowView

- (MUPlaceSectionRowView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MUPlaceSectionRowView;
  v3 = -[MKViewWithHairline initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3 && [(MUPlaceSectionRowView *)v3 supportsInteractionMenuItems])
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1758]) initWithDelegate:v4];
    editMenuInteraction = v4->_editMenuInteraction;
    v4->_editMenuInteraction = (UIEditMenuInteraction *)v5;

    [(MUPlaceSectionRowView *)v4 addInteraction:v4->_editMenuInteraction];
  }
  return v4;
}

+ (id)rowViewWithContentView:(id)a3
{
  id v3 = a3;
  v4 = [MUPlaceSectionRowView alloc];
  uint64_t v5 = -[MUPlaceSectionRowView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MUPlaceSectionRowView *)v5 addSubview:v3];
  v6 = [[MUEdgeLayout alloc] initWithItem:v3 container:v5];

  [(MUConstraintLayout *)v6 activate];
  return v5;
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_selected != a3)
  {
    BOOL v4 = a4;
    self->_selected = a3;
    if (a3 && [(MUPlaceSectionRowView *)self supportsInteractionMenuItems])
    {
      [(MUPlaceSectionRowView *)self center];
      double v7 = v6;
      double v9 = v8;
      v10 = [(MUPlaceSectionRowView *)self superview];
      -[MUPlaceSectionRowView convertPoint:fromView:](self, "convertPoint:fromView:", v10, v7, v9);
      double v12 = v11;
      double v14 = v13;

      editMenuInteraction = self->_editMenuInteraction;
      v16 = objc_msgSend(MEMORY[0x1E4FB1750], "configurationWithIdentifier:sourcePoint:", @"MUPlaceSectionRowViewMenu", v12, v14);
      [(UIEditMenuInteraction *)editMenuInteraction presentEditMenuWithConfiguration:v16];
    }
    [(MUPlaceSectionRowView *)self _updateBackgroundColor:v4];
  }
}

- (void)_updateBackgroundColor:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_selected) {
    +[MUInfoCardStyle rowSelectedColor];
  }
  else {
  uint64_t v5 = +[MUInfoCardStyle rowUnselectedColor];
  }
  double v6 = v5;
  if (v3)
  {
    double v7 = (void *)MEMORY[0x1E4FB1EB0];
    double v8 = *MEMORY[0x1E4F31148];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__MUPlaceSectionRowView__updateBackgroundColor___block_invoke;
    v9[3] = &unk_1E574EE08;
    v9[4] = self;
    id v10 = v5;
    objc_msgSend(v7, "_mapkit_animateWithDuration:animations:completion:", v9, 0, v8);
  }
  else
  {
    [(MUPlaceSectionRowView *)self _mapkit_setBackgroundColor:v5];
  }
}

uint64_t __48__MUPlaceSectionRowView__updateBackgroundColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mapkit_setBackgroundColor:", *(void *)(a1 + 40));
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MUPlaceSectionRowView;
  [(MUPlaceSectionRowView *)&v5 touchesBegan:a3 withEvent:a4];
  if ([(MUPlaceSectionRowView *)self handlesHighlighting]) {
    [(MUPlaceSectionRowView *)self setSelected:1];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MUPlaceSectionRowView;
  [(MUPlaceSectionRowView *)&v5 touchesEnded:a3 withEvent:a4];
  if ([(MUPlaceSectionRowView *)self handlesHighlighting]) {
    [(MUPlaceSectionRowView *)self setSelected:0];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MUPlaceSectionRowView;
  [(MUPlaceSectionRowView *)&v5 touchesCancelled:a3 withEvent:a4];
  if ([(MUPlaceSectionRowView *)self handlesHighlighting]) {
    [(MUPlaceSectionRowView *)self setSelected:0];
  }
}

- (BOOL)supportsInteractionMenuItems
{
  if (MUIdiomInTraitEnvironment(self) == 5) {
    char v2 = 0;
  }
  else {
    char v2 = objc_opt_respondsToSelector();
  }
  return v2 & 1;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v6 = a5;
  double v7 = [MEMORY[0x1E4F1CA48] array];
  if (objc_opt_respondsToSelector())
  {
    double v8 = [(MUPlaceSectionRowView *)self _createCopyAction];
    [v7 addObject:v8];
  }
  double v9 = [(MUPlaceSectionRowView *)self _speechMenuElementFromSuggestedActions:v6];
  objc_msgSend(v7, "_mapsui_addObjectIfNotNil:", v9);

  if (![v7 count]) {
    [(MUPlaceSectionRowView *)self setSelected:0];
  }
  id v10 = [MEMORY[0x1E4FB1970] menuWithChildren:v7];

  return v10;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__MUPlaceSectionRowView_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke;
  v5[3] = &unk_1E574EFD0;
  v5[4] = self;
  objc_msgSend(a5, "addAnimations:", v5, a4);
}

uint64_t __86__MUPlaceSectionRowView_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelected:0];
}

- (id)_speechMenuElementFromSuggestedActions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    uint64_t v7 = *MEMORY[0x1E4FB2D70];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        double v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          double v11 = objc_msgSend(v10, "identifier", (void)v14);
          char v12 = [v11 isEqualToString:v7];

          if (v12) {
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  id v10 = 0;
LABEL_12:

  return v10;
}

- (id)_createCopyAction
{
  objc_initWeak(&location, self);
  char v2 = (void *)MEMORY[0x1E4FB13F0];
  id v3 = _MULocalizedStringFromThisBundle(@"Copy [Pasteboard]");
  uint64_t v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__MUPlaceSectionRowView__createCopyAction__block_invoke;
  v7[3] = &unk_1E574FCE0;
  objc_copyWeak(&v8, &location);
  uint64_t v5 = [v2 actionWithTitle:v3 image:v4 identifier:@"Copy" handler:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

void __42__MUPlaceSectionRowView__createCopyAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained copy:0];
    id WeakRetained = v2;
  }
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)handlesHighlighting
{
  return self->_handlesHighlighting;
}

- (void)setHandlesHighlighting:(BOOL)a3
{
  self->_handlesHighlighting = a3;
}

- (void).cxx_destruct
{
}

@end