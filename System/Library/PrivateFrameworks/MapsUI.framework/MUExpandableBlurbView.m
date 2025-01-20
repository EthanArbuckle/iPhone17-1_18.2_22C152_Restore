@interface MUExpandableBlurbView
- (MUExpandableBlurbView)initWithFrame:(CGRect)a3;
- (NSString)text;
- (id)moreAction;
- (id)resizeBlock;
- (void)_contentSizeDidChange;
- (void)_expand;
- (void)_setupLabel;
- (void)infoCardThemeChanged;
- (void)setMoreAction:(id)a3;
- (void)setNumberOfLinesWhenCollapsed:(unint64_t)a3;
- (void)setResizeBlock:(id)a3;
- (void)setText:(id)a3;
@end

@implementation MUExpandableBlurbView

- (MUExpandableBlurbView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUExpandableBlurbView;
  v3 = -[MUExpandableBlurbView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUExpandableBlurbView *)v3 _setupLabel];
    [(MUExpandableBlurbView *)v4 setAccessibilityIdentifier:@"ExpandableBlurb"];
  }
  return v4;
}

- (void)_setupLabel
{
  v26[1] = *MEMORY[0x1E4F143B8];
  [(MUExpandableBlurbView *)self setInsetsLayoutMarginsFromSafeArea:0];
  int64_t v3 = +[MUInfoCardStyle containerStyle];
  double v4 = 16.0;
  if (v3 == 1) {
    double v4 = 0.0;
  }
  -[MUExpandableBlurbView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", v4, 16.0, v4, 16.0);
  v5 = [MUExpandingLabel alloc];
  objc_super v6 = -[MUExpandingLabel initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  expandingLabel = self->_expandingLabel;
  self->_expandingLabel = v6;

  [(MUExpandingLabel *)self->_expandingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(MUExpandingLabel *)self->_expandingLabel setFont:v8];

  v9 = +[MUInfoCardStyle textColor];
  [(MUExpandingLabel *)self->_expandingLabel setTextColor:v9];

  v10 = +[MUInfoCardStyle tintColor];
  [(MUExpandingLabel *)self->_expandingLabel setShowMoreTextColor:v10];

  v11 = _MULocalizedStringFromThisBundle(@"More [See All Blurb View]");
  [(MUExpandingLabel *)self->_expandingLabel setShowMoreText:v11];

  [(MUExpandingLabel *)self->_expandingLabel setNumberOfLinesWhenCollapsed:5];
  objc_initWeak(&location, self);
  v12 = self->_expandingLabel;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __36__MUExpandableBlurbView__setupLabel__block_invoke;
  v23 = &unk_1E574F3A8;
  objc_copyWeak(&v24, &location);
  [(MUExpandingLabel *)v12 setLabelResizedBlock:&v20];
  -[MUExpandableBlurbView addSubview:](self, "addSubview:", self->_expandingLabel, v20, v21, v22, v23);
  v13 = [MUEdgeLayout alloc];
  v14 = self->_expandingLabel;
  v15 = [(MUExpandableBlurbView *)self layoutMarginsGuide];
  v16 = [(MUEdgeLayout *)v13 initWithItem:v14 container:v15];

  v17 = (void *)MEMORY[0x1E4F28DC8];
  v26[0] = v16;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  objc_msgSend(v17, "_mapsui_activateLayouts:", v18);

  [(UIView *)self _mapsui_addSelectGestureRecognizerWithTarget:self action:sel__expand];
  v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v19 addObserver:self selector:sel__contentSizeDidChange name:*MEMORY[0x1E4FB27A8] object:0];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

uint64_t __36__MUExpandableBlurbView__setupLabel__block_invoke(uint64_t a1)
{
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)WeakRetained;
  if (WeakRetained)
  {
    v7 = (id *)WeakRetained;
    char v3 = [*(id *)(WeakRetained + 408) isExpanded];
    v2 = v7;
    if ((v3 & 1) != 0 || (uint64_t WeakRetained = [v7[51] isShowingExpanded], v2 = v7, (WeakRetained & 1) == 0))
    {
      double v4 = [v2 resizeBlock];

      v2 = v7;
      if (v4)
      {
        v5 = [v7 resizeBlock];
        v5[2]();

        v2 = v7;
      }
    }
  }
  return MEMORY[0x1F41817F8](WeakRetained, v2);
}

- (void)setNumberOfLinesWhenCollapsed:(unint64_t)a3
{
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return [(MUExpandingLabel *)self->_expandingLabel text];
}

- (void)_contentSizeDidChange
{
  id v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(MUExpandingLabel *)self->_expandingLabel setFont:v3];
}

- (void)_expand
{
  moreAction = (void (**)(id))self->_moreAction;
  if (moreAction) {
    moreAction[2](self->_moreAction);
  }
  else {
    [(MUExpandingLabel *)self->_expandingLabel setExpanded:1];
  }
}

- (void)infoCardThemeChanged
{
  id v3 = +[MUInfoCardStyle tintColor];
  [(MUExpandingLabel *)self->_expandingLabel setShowMoreTextColor:v3];
}

- (id)moreAction
{
  return self->_moreAction;
}

- (void)setMoreAction:(id)a3
{
}

- (id)resizeBlock
{
  return self->_resizeBlock;
}

- (void)setResizeBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resizeBlock, 0);
  objc_storeStrong(&self->_moreAction, 0);
  objc_storeStrong((id *)&self->_expandingLabel, 0);
}

@end