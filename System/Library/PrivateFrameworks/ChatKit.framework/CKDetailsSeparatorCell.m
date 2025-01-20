@interface CKDetailsSeparatorCell
+ (double)defaultHeight;
+ (double)defaultLeadingSpace;
+ (id)reuseIdentifier;
- (BOOL)indentSeparator;
- (CKDetailsSeparatorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIView)separatorView;
- (double)leadingSpace;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setIndentSeparator:(BOOL)a3;
- (void)setLeadingSpace:(double)a3;
@end

@implementation CKDetailsSeparatorCell

- (CKDetailsSeparatorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CKDetailsSeparatorCell;
  v4 = [(CKDetailsCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42FF0]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    separatorView = v4->_separatorView;
    v4->_separatorView = (UIView *)v6;

    v8 = v4->_separatorView;
    v9 = [MEMORY[0x1E4F428B8] separatorColor];
    [(UIView *)v8 setBackgroundColor:v9];

    [(CKDetailsSeparatorCell *)v4 addSubview:v4->_separatorView];
    [(CKDetailsSeparatorCell *)v4 setIndentSeparator:1];
    v10 = [MEMORY[0x1E4F428B8] clearColor];
    [(CKDetailsSeparatorCell *)v4 setBackgroundColor:v10];
  }
  return v4;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)CKDetailsSeparatorCell;
  [(CKDetailsCell *)&v16 layoutSubviews];
  [(CKDetailsSeparatorCell *)self layoutMargins];
  double v4 = v3;
  double v6 = v5;
  v7 = +[CKUIBehavior sharedBehaviors];
  int v8 = [v7 detailsSeperatorsFollowLayoutMargins];

  [(CKDetailsSeparatorCell *)self bounds];
  double v10 = v9;
  LODWORD(v7) = [(CKDetailsSeparatorCell *)self indentSeparator] | v8;
  [(CKDetailsSeparatorCell *)self leadingSpace];
  double v12 = v11;
  double v13 = 0.0;
  if (v7) {
    double v13 = v6;
  }
  else {
    double v4 = 0.0;
  }
  double v14 = v10 - v4 - v13;
  v15 = [(CKDetailsSeparatorCell *)self separatorView];
  objc_msgSend(v15, "setFrame:", v4, v12, v14, 1.0);
}

- (void)prepareForReuse
{
  v2.receiver = self;
  v2.super_class = (Class)CKDetailsSeparatorCell;
  [(CKDetailsCell *)&v2 prepareForReuse];
}

+ (id)reuseIdentifier
{
  return @"CKDetailsSeparatorCell_reuseIdentifier";
}

+ (double)defaultHeight
{
  return 1.0;
}

+ (double)defaultLeadingSpace
{
  return 0.0;
}

- (double)leadingSpace
{
  return self->_leadingSpace;
}

- (void)setLeadingSpace:(double)a3
{
  self->_leadingSpace = a3;
}

- (BOOL)indentSeparator
{
  return self->_indentSeparator;
}

- (void)setIndentSeparator:(BOOL)a3
{
  self->_indentSeparator = a3;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void).cxx_destruct
{
}

@end