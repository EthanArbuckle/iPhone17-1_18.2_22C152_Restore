@interface MKTransitDepartureContainerHeaderViewModel
- (BOOL)showIncidentsIcon;
- (NSArray)labelItems;
- (NSString)titleText;
- (void)setLabelItems:(id)a3;
- (void)setShowIncidentsIcon:(BOOL)a3;
- (void)setTitleText:(id)a3;
@end

@implementation MKTransitDepartureContainerHeaderViewModel

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (BOOL)showIncidentsIcon
{
  return self->_showIncidentsIcon;
}

- (void)setShowIncidentsIcon:(BOOL)a3
{
  self->_showIncidentsIcon = a3;
}

- (NSArray)labelItems
{
  return self->_labelItems;
}

- (void)setLabelItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelItems, 0);

  objc_storeStrong((id *)&self->_titleText, 0);
}

@end