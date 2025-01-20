@interface CKGroupPhotoCell
+ (BOOL)shouldHighlight;
+ (id)reuseIdentifier;
- (CKGroupPhotoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIView)groupView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setGroupView:(id)a3;
@end

@implementation CKGroupPhotoCell

+ (id)reuseIdentifier
{
  return @"CKDetailsGroupPhotoCell_reuseIdentifier";
}

+ (BOOL)shouldHighlight
{
  return 0;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)CKGroupPhotoCell;
  [(CKDetailsCell *)&v15 layoutSubviews];
  v3 = [(CKDetailsCell *)self topSeperator];
  [v3 setHidden:1];

  v4 = [(CKDetailsCell *)self bottomSeperator];
  [v4 setHidden:1];

  v5 = [(CKGroupPhotoCell *)self contentView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [(CKGroupPhotoCell *)self groupView];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
}

- (CKGroupPhotoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CKGroupPhotoCell;
  v4 = [(CKDetailsCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[CKUIBehavior sharedBehaviors];
    double v6 = [v5 theme];
    double v7 = [v6 detailsGroupPhotoBackgroundColor];
    [(CKGroupPhotoCell *)v4 setBackgroundColor:v7];

    double v8 = [(CKDetailsCell *)v4 topSeperator];
    [v8 setHidden:1];

    double v9 = [(CKDetailsCell *)v4 bottomSeperator];
    [v9 setHidden:1];
  }
  return v4;
}

- (void)setGroupView:(id)a3
{
  v5 = (UIView *)a3;
  p_groupView = &self->_groupView;
  groupView = self->_groupView;
  if (groupView != v5)
  {
    double v9 = v5;
    if (groupView) {
      [(UIView *)groupView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_groupView, a3);
    double v8 = [(CKGroupPhotoCell *)self contentView];
    [v8 addSubview:*p_groupView];

    v5 = v9;
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKGroupPhotoCell;
  [(CKDetailsCell *)&v4 prepareForReuse];
  [(UIView *)self->_groupView removeFromSuperview];
  groupView = self->_groupView;
  self->_groupView = 0;
}

- (UIView)groupView
{
  return self->_groupView;
}

- (void).cxx_destruct
{
}

@end