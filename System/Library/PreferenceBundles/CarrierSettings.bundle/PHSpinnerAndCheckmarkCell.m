@interface PHSpinnerAndCheckmarkCell
- (void)_addSpinner;
- (void)_removeSpinner;
- (void)setLoading:(BOOL)a3;
- (void)setReallyChecked:(BOOL)a3;
- (void)setRow:(int)a3;
@end

@implementation PHSpinnerAndCheckmarkCell

- (void)setReallyChecked:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHSpinnerAndCheckmarkCell;
  [(PSTableCell *)&v4 setChecked:a3];
  [(PHSpinnerAndCheckmarkCell *)self setLoading:0];
  [(PHSpinnerAndCheckmarkCell *)self _removeSpinner];
  [(PHSpinnerAndCheckmarkCell *)self setNeedsDisplay];
}

- (void)setLoading:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 1200);
  if ((((v3 & 1) == 0) ^ a3)) {
    return;
  }
  char v5 = v3 & 0xFE | a3;
  *((unsigned char *)self + 1200) = v5;
  if (a3)
  {
    spinner = self->_spinner;
    if (!spinner
      || ([(UIActivityIndicatorView *)spinner superview],
          v7 = (PHSpinnerAndCheckmarkCell *)objc_claimAutoreleasedReturnValue(),
          v7,
          v7 != self))
    {
      [(PHSpinnerAndCheckmarkCell *)self _addSpinner];
      return;
    }
    char v5 = *((unsigned char *)self + 1200);
  }
  if ((v5 & 1) == 0)
  {
    [(PHSpinnerAndCheckmarkCell *)self _removeSpinner];
  }
}

- (void)setRow:(int)a3
{
  self->_row = a3;
}

- (void)_addSpinner
{
  spinner = self->_spinner;
  if (!spinner)
  {
    objc_super v4 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:4];
    char v5 = self->_spinner;
    self->_spinner = v4;

    [(UIActivityIndicatorView *)self->_spinner sizeToFit];
    spinner = self->_spinner;
  }
  v6 = [(PHSpinnerAndCheckmarkCell *)self accessoryView];

  if (spinner != v6)
  {
    [(UIActivityIndicatorView *)self->_spinner startAnimating];
    v7 = self->_spinner;
    [(PHSpinnerAndCheckmarkCell *)self setAccessoryView:v7];
  }
}

- (void)_removeSpinner
{
  spinner = self->_spinner;
  objc_super v4 = [(PHSpinnerAndCheckmarkCell *)self accessoryView];

  if (spinner == v4)
  {
    [(UIActivityIndicatorView *)self->_spinner stopAnimating];
    [(PHSpinnerAndCheckmarkCell *)self setAccessoryView:0];
  }
}

- (void).cxx_destruct
{
}

@end