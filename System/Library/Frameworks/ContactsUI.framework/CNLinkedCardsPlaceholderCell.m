@interface CNLinkedCardsPlaceholderCell
- (CNPropertyCellDelegate)delegate;
- (void)performDefaultAction;
- (void)setDelegate:(id)a3;
@end

@implementation CNLinkedCardsPlaceholderCell

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (CNPropertyCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPropertyCellDelegate *)WeakRetained;
}

- (void)performDefaultAction
{
  id v4 = [(CNLinkedCardsPlaceholderCell *)self delegate];
  v3 = [(CNContactCell *)self cardGroupItem];
  [v4 propertyCell:self performActionForItem:v3 withTransportType:0];
}

@end