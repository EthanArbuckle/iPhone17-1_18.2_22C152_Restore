@interface SCATScrollViewPickerManager
- (BOOL)canBeActiveElementManager;
- (BOOL)handleInputAction:(id)a3 withElement:(id)a4;
- (NSArray)elementsToScroll;
- (NSArray)scrollViews;
- (SCATScrollViewPickerViewController)pickerViewController;
- (id)visualProvider;
- (int)scrollAction;
- (void)setElementsToScroll:(id)a3;
- (void)setPickerViewController:(id)a3;
- (void)setScrollAction:(int)a3;
- (void)setScrollViews:(id)a3;
@end

@implementation SCATScrollViewPickerManager

- (id)visualProvider
{
  v3 = [(SCATScrollViewPickerManager *)self pickerViewController];

  if (!v3)
  {
    v4 = [(SCATElementManagerViewController *)[SCATScrollViewPickerViewController alloc] initWithElementManager:self];
    [(SCATScrollViewPickerManager *)self setPickerViewController:v4];
  }

  return [(SCATScrollViewPickerManager *)self pickerViewController];
}

- (BOOL)canBeActiveElementManager
{
  v2 = [(SCATScrollViewPickerManager *)self scrollViews];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)handleInputAction:(id)a3 withElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 action] != (id)100
    && [v6 action] != (id)103
    && [v6 action] != (id)109)
  {
    goto LABEL_12;
  }
  if (([v7 scatIsAXElement] & 1) == 0)
  {
    id v15 = v7;
    _AXAssert();
  }
  v8 = [(SCATScrollViewPickerManager *)self scrollViews];

  if (!v8) {
    _AXAssert();
  }
  if ([v7 scatIsAXElement])
  {
    v9 = [(SCATScrollViewPickerManager *)self scrollViews];

    if (v9)
    {
      v9 = [(SCATScrollViewPickerManager *)self scrollViews];
      id v10 = [v9 indexOfObject:v7];

      LOBYTE(v9) = v10 != (id)0x7FFFFFFFFFFFFFFFLL;
      if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v12 = [(SCATScrollViewPickerManager *)self scrollViews];
        _AXAssert();
      }
      else
      {
        v11 = [(SCATScrollViewPickerManager *)self elementsToScroll];
        v12 = [v11 objectAtIndexedSubscript:v10];

        objc_msgSend(v12, "performAction:", -[SCATScrollViewPickerManager scrollAction](self, "scrollAction"));
        [(SCATScrollViewPickerManager *)self setScrollViews:0];
        v13 = +[SCATScannerManager sharedManager];
        [v13 beginScanningWithFocusContext:0];
      }
    }
  }
  else
  {
LABEL_12:
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}

- (NSArray)scrollViews
{
  return self->_scrollViews;
}

- (void)setScrollViews:(id)a3
{
}

- (NSArray)elementsToScroll
{
  return self->_elementsToScroll;
}

- (void)setElementsToScroll:(id)a3
{
}

- (int)scrollAction
{
  return self->_scrollAction;
}

- (void)setScrollAction:(int)a3
{
  self->_scrollAction = a3;
}

- (SCATScrollViewPickerViewController)pickerViewController
{
  return self->_pickerViewController;
}

- (void)setPickerViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerViewController, 0);
  objc_storeStrong((id *)&self->_elementsToScroll, 0);

  objc_storeStrong((id *)&self->_scrollViews, 0);
}

@end