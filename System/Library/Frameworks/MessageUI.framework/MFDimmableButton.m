@interface MFDimmableButton
- (BOOL)hidesWhenDimmedIfNotSelected;
- (BOOL)isDimmed;
- (BOOL)stickyHiddenValue;
- (unint64_t)autohidePreference;
- (unint64_t)state;
- (void)_setHidden:(BOOL)a3 external:(BOOL)a4;
- (void)_updateDimmedHidingIfNecessary;
- (void)setDimmed:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidesWhenDimmedIfNotSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setStickyHiddenValue:(BOOL)a3;
@end

@implementation MFDimmableButton

- (unint64_t)state
{
  v5.receiver = self;
  v5.super_class = (Class)MFDimmableButton;
  unint64_t v3 = [(MFDimmableButton *)&v5 state];
  if ([(MFDimmableButton *)self isDimmed]) {
    return v3 | 0x10000;
  }
  else {
    return v3;
  }
}

- (void)setDimmed:(BOOL)a3
{
  self->_dimmed = a3;
  [(MFDimmableButton *)self _updateDimmedHidingIfNecessary];

  [(MFDimmableButton *)self setNeedsLayout];
}

- (void)setHidden:(BOOL)a3
{
}

- (void)_setHidden:(BOOL)a3 external:(BOOL)a4
{
  BOOL v4 = a3;
  if (!a4
    || ([(MFDimmableButton *)self setStickyHiddenValue:a3],
        [(MFDimmableButton *)self autohidePreference] != 1))
  {
    v6.receiver = self;
    v6.super_class = (Class)MFDimmableButton;
    [(MFDimmableButton *)&v6 setHidden:v4];
  }
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFDimmableButton;
  [(MFDimmableButton *)&v4 setSelected:a3];
  [(MFDimmableButton *)self _updateDimmedHidingIfNecessary];
}

- (void)setHidesWhenDimmedIfNotSelected:(BOOL)a3
{
  self->_hidesWhenDimmedIfNotSelected = a3;
  [(MFDimmableButton *)self _updateDimmedHidingIfNecessary];
}

- (void)_updateDimmedHidingIfNecessary
{
  unint64_t v3 = [(MFDimmableButton *)self autohidePreference];
  if (v3 == 1)
  {
    uint64_t v4 = 1;
  }
  else
  {
    if (v3 != 2) {
      return;
    }
    uint64_t v4 = 0;
  }

  [(MFDimmableButton *)self _setHidden:v4 external:0];
}

- (unint64_t)autohidePreference
{
  if (![(MFDimmableButton *)self hidesWhenDimmedIfNotSelected]) {
    return 0;
  }
  if ([(MFDimmableButton *)self isDimmed]
    && ![(MFDimmableButton *)self isSelected])
  {
    return 1;
  }
  return 2;
}

- (BOOL)hidesWhenDimmedIfNotSelected
{
  return self->_hidesWhenDimmedIfNotSelected;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (BOOL)stickyHiddenValue
{
  return self->_stickyHiddenValue;
}

- (void)setStickyHiddenValue:(BOOL)a3
{
  self->_stickyHiddenValue = a3;
}

@end