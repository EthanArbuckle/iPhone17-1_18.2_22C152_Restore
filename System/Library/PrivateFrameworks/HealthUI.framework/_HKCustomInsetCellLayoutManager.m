@interface _HKCustomInsetCellLayoutManager
+ (BOOL)requiresLegacyLayout;
- (CGRect)accessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5;
- (CGRect)accessoryStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5;
- (CGRect)contentEndingRectForCell:(id)a3 forDisplayOfDeleteConfirmation:(BOOL)a4;
- (CGRect)contentEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4;
- (CGRect)contentRectForCell:(id)a3 forState:(unint64_t)a4;
- (CGRect)contentStartingRectForCell:(id)a3 forDisplayOfDeleteConfirmation:(BOOL)a4;
- (CGRect)contentStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4;
- (CGRect)editControlEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4;
- (CGRect)editControlStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4;
- (CGRect)editingAccessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5;
- (CGRect)editingAccessoryStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5;
- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5;
- (double)textLabelLeftInset;
- (double)topInset;
- (void)setTextLabelLeftInset:(double)a3;
- (void)setTopInset:(double)a3;
@end

@implementation _HKCustomInsetCellLayoutManager

+ (BOOL)requiresLegacyLayout
{
  return 1;
}

- (CGRect)contentRectForCell:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_HKCustomInsetCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v29 contentRectForCell:v6 forState:a4];
  double v8 = v7;
  double v10 = v9;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v12 = v11;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v14 = v13;
  if (objc_msgSend(v6, "hk_isLeftToRight"))
  {
    [(_HKCustomInsetCellLayoutManager *)self textLabelLeftInset];
    double v16 = v15;
    [v6 frame];
    double v18 = v17 - v16;
  }
  else
  {
    [v6 frame];
    double v20 = v19;
    [(_HKCustomInsetCellLayoutManager *)self textLabelLeftInset];
    double v18 = v20 - v21;
    [v6 frame];
    double v23 = v22 - v18;
    [(_HKCustomInsetCellLayoutManager *)self textLabelLeftInset];
    double v16 = v23 - v24;
  }

  double v25 = v16;
  double v26 = v12 + v8;
  double v27 = v18;
  double v28 = v10 - v14;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5
{
  uint64_t v5 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_HKCustomInsetCellLayoutManager;
  id v7 = a3;
  [(UITableViewCellLayoutManager *)&v20 textRectForCell:v7 rowWidth:v5 forSizing:a4];
  double v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  CGFloat v15 = v14;
  LODWORD(v5) = objc_msgSend(v7, "hk_isLeftToRight", v20.receiver, v20.super_class);

  if (v5)
  {
    double MaxX = a4 - v9;
  }
  else
  {
    v21.origin.x = v9;
    v21.origin.y = v11;
    v21.size.width = v13;
    v21.size.height = v15;
    double MaxX = CGRectGetMaxX(v21);
    double v9 = v9 - (MaxX - v13);
  }
  double v17 = v9;
  double v18 = v11;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = MaxX;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)editControlStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  v18.receiver = self;
  v18.super_class = (Class)_HKCustomInsetCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v18 editControlStartingRectForCell:a3 forNewEditingState:a4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v14 = v13 + v8;
  double v15 = v6;
  double v16 = v10;
  double v17 = v12;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (CGRect)editControlEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  v18.receiver = self;
  v18.super_class = (Class)_HKCustomInsetCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v18 editControlEndingRectForCell:a3 forNewEditingState:a4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v14 = v13 + v8;
  double v15 = v6;
  double v16 = v10;
  double v17 = v12;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (CGRect)accessoryStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  v21.receiver = self;
  v21.super_class = (Class)_HKCustomInsetCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v21 accessoryStartingRectForCell:a3 forNewEditingState:a4 showingDeleteConfirmation:a5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v15 = v14 + v9;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v17 = v13 - v16;
  double v18 = v7;
  double v19 = v15;
  double v20 = v11;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)accessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  v21.receiver = self;
  v21.super_class = (Class)_HKCustomInsetCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v21 accessoryEndingRectForCell:a3 forNewEditingState:a4 showingDeleteConfirmation:a5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v15 = v14 + v9;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v17 = v13 - v16;
  double v18 = v7;
  double v19 = v15;
  double v20 = v11;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)editingAccessoryStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  v21.receiver = self;
  v21.super_class = (Class)_HKCustomInsetCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v21 editingAccessoryStartingRectForCell:a3 forNewEditingState:a4 showingDeleteConfirmation:a5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v15 = v14 + v9;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v17 = v13 - v16;
  double v18 = v7;
  double v19 = v15;
  double v20 = v11;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)editingAccessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  v21.receiver = self;
  v21.super_class = (Class)_HKCustomInsetCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v21 editingAccessoryEndingRectForCell:a3 forNewEditingState:a4 showingDeleteConfirmation:a5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v15 = v14 + v9;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v17 = v13 - v16;
  double v18 = v7;
  double v19 = v15;
  double v20 = v11;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)contentStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_HKCustomInsetCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v29 contentStartingRectForCell:v6 forNewEditingState:v4];
  double v8 = v7;
  double v10 = v9;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v12 = v11;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v14 = v13;
  if (objc_msgSend(v6, "hk_isLeftToRight"))
  {
    [(_HKCustomInsetCellLayoutManager *)self textLabelLeftInset];
    double v16 = v15;
    [v6 frame];
    double v18 = v17 - v16;
  }
  else
  {
    [v6 frame];
    double v20 = v19;
    [(_HKCustomInsetCellLayoutManager *)self textLabelLeftInset];
    double v18 = v20 - v21;
    [v6 frame];
    double v23 = v22 - v18;
    [(_HKCustomInsetCellLayoutManager *)self textLabelLeftInset];
    double v16 = v23 - v24;
  }

  double v25 = v16;
  double v26 = v12 + v8;
  double v27 = v18;
  double v28 = v10 - v14;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)contentEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_HKCustomInsetCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v29 contentEndingRectForCell:v6 forNewEditingState:v4];
  double v8 = v7;
  double v10 = v9;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v12 = v11;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v14 = v13;
  if (objc_msgSend(v6, "hk_isLeftToRight"))
  {
    [(_HKCustomInsetCellLayoutManager *)self textLabelLeftInset];
    double v16 = v15;
    [v6 frame];
    double v18 = v17 - v16;
  }
  else
  {
    [v6 frame];
    double v20 = v19;
    [(_HKCustomInsetCellLayoutManager *)self textLabelLeftInset];
    double v18 = v20 - v21;
    [v6 frame];
    double v23 = v22 - v18;
    [(_HKCustomInsetCellLayoutManager *)self textLabelLeftInset];
    double v16 = v23 - v24;
  }

  double v25 = v16;
  double v26 = v12 + v8;
  double v27 = v18;
  double v28 = v10 - v14;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)contentStartingRectForCell:(id)a3 forDisplayOfDeleteConfirmation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_HKCustomInsetCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v29 contentStartingRectForCell:v6 forDisplayOfDeleteConfirmation:v4];
  double v8 = v7;
  double v10 = v9;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v12 = v11;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v14 = v13;
  if (objc_msgSend(v6, "hk_isLeftToRight"))
  {
    [(_HKCustomInsetCellLayoutManager *)self textLabelLeftInset];
    double v16 = v15;
    [v6 frame];
    double v18 = v17 - v16;
  }
  else
  {
    [v6 frame];
    double v20 = v19;
    [(_HKCustomInsetCellLayoutManager *)self textLabelLeftInset];
    double v18 = v20 - v21;
    [v6 frame];
    double v23 = v22 - v18;
    [(_HKCustomInsetCellLayoutManager *)self textLabelLeftInset];
    double v16 = v23 - v24;
  }

  double v25 = v16;
  double v26 = v12 + v8;
  double v27 = v18;
  double v28 = v10 - v14;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)contentEndingRectForCell:(id)a3 forDisplayOfDeleteConfirmation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_HKCustomInsetCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v29 contentEndingRectForCell:v6 forDisplayOfDeleteConfirmation:v4];
  double v8 = v7;
  double v10 = v9;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v12 = v11;
  [(_HKCustomInsetCellLayoutManager *)self topInset];
  double v14 = v13;
  if ([v6 _shouldReverseLayoutDirection])
  {
    [v6 frame];
    double v16 = v15;
    [(_HKCustomInsetCellLayoutManager *)self textLabelLeftInset];
    double v18 = v16 - v17;
    [v6 frame];
    double v20 = v19 - v18;
    [(_HKCustomInsetCellLayoutManager *)self textLabelLeftInset];
    double v22 = v20 - v21;
  }
  else
  {
    [(_HKCustomInsetCellLayoutManager *)self textLabelLeftInset];
    double v22 = v23;
    [v6 frame];
    double v18 = v24 - v22;
  }

  double v25 = v22;
  double v26 = v12 + v8;
  double v27 = v18;
  double v28 = v10 - v14;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (double)topInset
{
  return self->_topInset;
}

- (void)setTopInset:(double)a3
{
  self->_topInset = a3;
}

- (double)textLabelLeftInset
{
  return self->_textLabelLeftInset;
}

- (void)setTextLabelLeftInset:(double)a3
{
  self->_textLabelLeftInset = a3;
}

@end