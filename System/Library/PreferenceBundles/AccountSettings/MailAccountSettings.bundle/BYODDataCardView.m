@interface BYODDataCardView
- (BYODDataCardPrimaryCell)primaryCell;
- (BYODDataCardView)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5;
- (void)setHideChevron:(BOOL)a3;
- (void)setPrimaryCell:(id)a3;
@end

@implementation BYODDataCardView

- (BYODDataCardView)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BYODDataCardView;
  v11 = [(BYODStackView *)&v16 init];
  if (v11)
  {
    v12 = [[BYODDataCardPrimaryCell alloc] initWithTitle:v8 subtitle:v9 icon:v10];
    primaryCell = v11->_primaryCell;
    v11->_primaryCell = v12;

    [(BYODDataCardPrimaryCell *)v11->_primaryCell setTranslatesAutoresizingMaskIntoConstraints:0];
    -[BYODDataCardPrimaryCell setDirectionalLayoutMargins:](v11->_primaryCell, "setDirectionalLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
    [(BYODDataCardPrimaryCell *)v11->_primaryCell setHideChevron:0];
    v14 = [(BYODStackView *)v11 stackView];
    [v14 addArrangedSubview:v11->_primaryCell];
  }
  return v11;
}

- (void)setHideChevron:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BYODDataCardView *)self primaryCell];
  [v4 setHideChevron:v3];
}

- (BYODDataCardPrimaryCell)primaryCell
{
  return self->_primaryCell;
}

- (void)setPrimaryCell:(id)a3
{
}

- (void).cxx_destruct
{
}

@end