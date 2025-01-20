@interface MKPlaceAttributionCellButton
- (BOOL)isHighlighted;
- (MKPlaceAttributionCellButtonDelegate)buttonDelegate;
- (void)setButtonDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation MKPlaceAttributionCellButton

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    id v4 = [(MKPlaceAttributionCellButton *)self buttonDelegate];
    [v4 attributionCellButton:self isHighighted:self->_highlighted executeAction:0];
  }
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (MKPlaceAttributionCellButtonDelegate)buttonDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonDelegate);

  return (MKPlaceAttributionCellButtonDelegate *)WeakRetained;
}

- (void)setButtonDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end