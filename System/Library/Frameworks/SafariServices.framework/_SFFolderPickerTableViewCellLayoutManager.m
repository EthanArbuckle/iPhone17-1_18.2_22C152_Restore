@interface _SFFolderPickerTableViewCellLayoutManager
+ (double)indentationWidth;
- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5;
- (UIEdgeInsets)_layoutMarginsForCell:(id)a3;
- (void)layoutSubviewsOfCell:(id)a3;
@end

@implementation _SFFolderPickerTableViewCellLayoutManager

+ (double)indentationWidth
{
  return 15.0;
}

- (void)layoutSubviewsOfCell:(id)a3
{
  id v4 = a3;
  [(_SFFolderPickerTableViewCellLayoutManager *)self _layoutMarginsForCell:v4];
  objc_msgSend(v4, "setLayoutMargins:");
  v5.receiver = self;
  v5.super_class = (Class)_SFFolderPickerTableViewCellLayoutManager;
  [(UITableViewCellLayoutManagerValue1 *)&v5 layoutSubviewsOfCell:v4];
}

- (UIEdgeInsets)_layoutMarginsForCell:(id)a3
{
  [(UITableViewCellLayoutManager *)self contentIndentationForCell:a3];
  double v4 = v3 + 16.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 16.0;
  result.right = v7;
  result.bottom = v6;
  result.left = v4;
  result.top = v5;
  return result;
}

- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5
{
  BOOL v5 = a5;
  v30.receiver = self;
  v30.super_class = (Class)_SFFolderPickerTableViewCellLayoutManager;
  id v8 = a3;
  [(UITableViewCellLayoutManager *)&v30 textRectForCell:v8 rowWidth:v5 forSizing:a4];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v29 = v15;
  double v16 = *MEMORY[0x1E4FB2848];
  double v17 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v19 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v18 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  int v20 = [v8 _shouldReverseLayoutDirection];
  [(UITableViewCellLayoutManager *)self contentIndentationForCell:v8];
  double v22 = v21;

  if (v20) {
    double v23 = v17;
  }
  else {
    double v23 = -v22;
  }
  if (v20) {
    double v24 = -v22;
  }
  else {
    double v24 = v18;
  }
  double v25 = v10 + v23;
  double v26 = v16 + v12;
  double v27 = v14 - (v23 + v24);
  double v28 = v29 - (v16 + v19);
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

@end