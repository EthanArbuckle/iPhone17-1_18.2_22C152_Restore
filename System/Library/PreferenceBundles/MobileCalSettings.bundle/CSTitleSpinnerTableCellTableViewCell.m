@interface CSTitleSpinnerTableCellTableViewCell
- (CSTitleSpinnerTableCellTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation CSTitleSpinnerTableCellTableViewCell

- (CSTitleSpinnerTableCellTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CSTitleSpinnerTableCellTableViewCell;
  v5 = [(CSTitleSpinnerTableCellTableViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    id v6 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v6 startAnimating];
    [(CSTitleSpinnerTableCellTableViewCell *)v5 setAccessoryView:v6];
  }
  return v5;
}

@end