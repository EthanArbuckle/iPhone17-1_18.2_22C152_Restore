@interface CKWalletItemSearchResultsCell
+ (id)reuseIdentifier;
- (CGPoint)avatarOffsetLTR;
- (CGPoint)avatarOffsetRTL;
- (double)editModeHorizontalOffset;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
@end

@implementation CKWalletItemSearchResultsCell

+ (id)reuseIdentifier
{
  return @"PassSearchCell";
}

- (double)editModeHorizontalOffset
{
  return 7.0;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)CKWalletItemSearchResultsCell;
  [(CKAttachmentSearchResultCell *)&v17 layoutSubviews];
  v3 = [(CKEditableSearchResultCell *)self imageView];
  v4 = [v3 layer];

  [v4 setBorderColor:0];
  [v4 setBorderWidth:0.0];
  [v4 setCornerRadius:0.0];
  v5 = [(CKAttachmentSearchResultCell *)self titleLabel];
  [v5 setHidden:1];

  v6 = [(CKAttachmentSearchResultCell *)self titleLabel];
  [v6 frame];
  double v8 = v7;

  v9 = [(CKAttachmentSearchResultCell *)self dateLabel];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v16 = [(CKAttachmentSearchResultCell *)self dateLabel];
  objc_msgSend(v16, "setFrame:", v11, v8, v13, v15);
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  [v4 frame];
  double x = v16.origin.x;
  double y = v16.origin.y;
  double width = v16.size.width;
  CGFloat height = v16.size.height;
  double v9 = CGRectGetWidth(v16);
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.CGFloat height = height;
  double v10 = CGRectGetWidth(v17);
  double v11 = [(CKAttachmentSearchResultCell *)self dateLabel];
  objc_msgSend(v11, "sizeThatFits:", v9, 1.79769313e308);
  double v13 = v12;

  objc_msgSend(v4, "setFrame:", x, y, width, v10 + v13 + 4.0);

  return v4;
}

- (CGPoint)avatarOffsetLTR
{
  double v2 = -8.0;
  double v3 = 6.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)avatarOffsetRTL
{
  double v2 = 8.0;
  double v3 = 6.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

@end