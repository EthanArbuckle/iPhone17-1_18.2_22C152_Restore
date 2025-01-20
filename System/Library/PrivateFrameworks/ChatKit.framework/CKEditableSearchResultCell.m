@interface CKEditableSearchResultCell
- (BOOL)_ck_isEditing;
- (UIImageView)checkmarkView;
- (UIImageView)imageView;
- (UIImageView)selectionOverlay;
- (void)_ck_setEditing:(BOOL)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setCheckmarkView:(id)a3;
- (void)setImageView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionOverlay:(id)a3;
@end

@implementation CKEditableSearchResultCell

- (void)_ck_setEditing:(BOOL)a3
{
  if (self->__ck_editing != a3)
  {
    self->__ck_editing = a3;
    if (a3)
    {
      id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
      v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v6 = [(CKEditableSearchResultCell *)self contentView];
      [v6 addSubview:v5];

      [(CKEditableSearchResultCell *)self setCheckmarkView:v5];
      [(CKEditableSearchResultCell *)self setSelected:0];
    }
    else
    {
      v7 = [(CKEditableSearchResultCell *)self checkmarkView];
      [v7 removeFromSuperview];

      [(CKEditableSearchResultCell *)self setCheckmarkView:0];
    }
    [(CKEditableSearchResultCell *)self setNeedsLayout];
  }
}

- (void)setSelected:(BOOL)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)CKEditableSearchResultCell;
  -[CKEditableSearchResultCell setSelected:](&v16, sel_setSelected_);
  v5 = (void *)MEMORY[0x1E4F42A98];
  v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  v17[0] = v6;
  v7 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  v17[1] = v7;
  v8 = [MEMORY[0x1E4F428B8] systemBlueColor];
  v17[2] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  v10 = [v5 _configurationWithHierarchicalColors:v9];

  if (a3)
  {
    v11 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"checkmark.circle.fill"];
    v12 = [v11 imageWithSymbolConfiguration:v10];
  }
  else
  {
    v11 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"circle"];
    v13 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
    v14 = [v11 imageWithTintColor:v13];
    v12 = [v14 imageWithRenderingMode:1];
  }
  v15 = [(CKEditableSearchResultCell *)self checkmarkView];
  [v15 setImage:v12];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CKEditableSearchResultCell;
  [(CKEditableSearchResultCell *)&v4 layoutSubviews];
  v3 = [(CKEditableSearchResultCell *)self checkmarkView];
  objc_msgSend(v3, "setHighlighted:", -[CKEditableSearchResultCell isSelected](self, "isSelected"));
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKEditableSearchResultCell;
  [(CKEditableSearchResultCell *)&v3 prepareForReuse];
  [(CKEditableSearchResultCell *)self _ck_setEditing:0];
}

- (BOOL)_ck_isEditing
{
  return self->__ck_editing;
}

- (UIImageView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)selectionOverlay
{
  return self->_selectionOverlay;
}

- (void)setSelectionOverlay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionOverlay, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_checkmarkView, 0);
}

@end