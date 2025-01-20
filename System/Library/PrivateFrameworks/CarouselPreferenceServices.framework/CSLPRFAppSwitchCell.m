@interface CSLPRFAppSwitchCell
- (CSLPRFAppSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)blankIcon;
- (id)getLazyIcon;
@end

@implementation CSLPRFAppSwitchCell

- (void).cxx_destruct
{
}

- (id)getLazyIcon
{
  return [(CSLPRFAppTableCellHelper *)self->_cellHelper getLazyIcon];
}

- (id)blankIcon
{
  v3 = [(CSLPRFAppTableCellHelper *)self->_cellHelper blankIcon];
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CSLPRFAppSwitchCell;
    v3 = [(PSTableCell *)&v5 blankIcon];
  }
  return v3;
}

- (CSLPRFAppSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CSLPRFAppSwitchCell;
  v4 = [(CSLPRFAppSwitchCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    objc_super v5 = [[CSLPRFAppTableCellHelper alloc] initWithTableCell:v4];
    cellHelper = v4->_cellHelper;
    v4->_cellHelper = v5;
  }
  return v4;
}

@end