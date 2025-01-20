@interface SCATGridPointPickerViewController
- (BOOL)_isVisible;
- (BOOL)_showsRowsForSelectionPath:(id)a3;
- (BOOL)handleInputAction:(id)a3 withElement:(id)a4;
- (CGPath)scannerPathForPointPickerCenterPoint:(id)a3;
- (CGRect)scannerFrameForPointPickerCenterPoint:(id)a3;
- (CGRect)scannerFrameForPointPickerGroup:(id)a3;
- (CGRect)scannerFrameForPointPickerSquare:(id)a3;
- (Class)classForPointPickerView;
- (NSIndexPath)currentSelectionPath;
- (NSString)description;
- (id)_scannableElements;
- (id)_scannableElementsAtSelectionPath:(id)a3;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)generateElementsForGroup:(id)a3;
- (id)lastElementWithOptions:(int *)a3;
- (void)_resetGrid;
- (void)didGenerateElements:(id)a3;
- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5;
- (void)setCurrentSelectionPath:(id)a3;
@end

@implementation SCATGridPointPickerViewController

- (Class)classForPointPickerView
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)SCATGridPointPickerViewController;
  v3 = [(SCATGridPointPickerViewController *)&v8 description];
  v4 = [(SCATPointPickerViewController *)self prompt];
  v5 = [(SCATGridPointPickerViewController *)self currentSelectionPath];
  v6 = [v3 stringByAppendingFormat:@" - prompt %@, current selection path %@", v4, v5];

  return (NSString *)v6;
}

- (BOOL)_isVisible
{
  v2 = [(SCATGridPointPickerViewController *)self view];
  v3 = [v2 superview];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_showsRowsForSelectionPath:(id)a3
{
  return ((unint64_t)[a3 length] & 1) == 0;
}

- (id)_scannableElementsAtSelectionPath:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[NSNull null];
  }
  v7 = v6;
  objc_super v8 = [(NSMutableDictionary *)self->_scannableElements objectForKey:v6];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    unsigned int v11 = [(SCATGridPointPickerViewController *)self _showsRowsForSelectionPath:v5];
    v12 = [(SCATGridPointPickerViewController *)self pointPickerView];
    v13 = v12;
    v25 = v7;
    if (v11) {
      v14 = (char *)[v12 numberOfRows];
    }
    else {
      v14 = (char *)[v12 numberOfColumns];
    }
    v15 = v14;

    id v10 = +[NSMutableArray arrayWithCapacity:v15 + 1];
    v16 = [(SCATPointPickerElement *)[SCATPointPickerCenterPoint alloc] initWithSelectionPath:v5];
    [(SCATPointPickerCenterPoint *)v16 setDelegate:self];
    v24 = v16;
    [v10 addObject:v16];
    if (v15)
    {
      for (i = 0; i != v15; ++i)
      {
        if (v5) {
          [v5 indexPathByAddingIndex:i];
        }
        else {
        v18 = +[NSIndexPath indexPathWithIndex:i];
        }
        if ([v18 length] == (id)8)
        {
          v19 = [(SCATPointPickerElement *)[SCATPointPickerSquare alloc] initWithSelectionPath:v18];
          [(SCATPointPickerSquare *)v19 setDelegate:self];
        }
        else
        {
          v19 = [[SCATPointPickerGroup alloc] initWithSelectionPath:v18 generatorDelegate:self];
        }
        [v10 addObject:v19];
      }
    }
    scannableElements = self->_scannableElements;
    if (!scannableElements)
    {
      v21 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
      v22 = self->_scannableElements;
      self->_scannableElements = v21;

      scannableElements = self->_scannableElements;
    }
    v7 = v25;
    [(NSMutableDictionary *)scannableElements setObject:v10 forKey:v25];
  }

  return v10;
}

- (id)_scannableElements
{
  v3 = [(SCATGridPointPickerViewController *)self currentSelectionPath];
  id v4 = [(SCATGridPointPickerViewController *)self _scannableElementsAtSelectionPath:v3];

  return v4;
}

- (void)_resetGrid
{
}

- (NSIndexPath)currentSelectionPath
{
  v2 = [(SCATGridPointPickerViewController *)self pointPickerView];
  v3 = [v2 currentSelectionPath];

  return (NSIndexPath *)v3;
}

- (void)setCurrentSelectionPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATGridPointPickerViewController *)self pointPickerView];
  [v5 setCurrentSelectionPath:v4];
}

- (CGRect)scannerFrameForPointPickerSquare:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATGridPointPickerViewController *)self pointPickerView];
  id v6 = [v4 selectionPath];

  [v5 frameForSelectionPath:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = [(SCATGridPointPickerViewController *)self pointPickerView];
  +[HNDScreen convertRect:fromView:](HNDScreen, "convertRect:fromView:", v15, v8, v10, v12, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)scannerFrameForPointPickerCenterPoint:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATGridPointPickerViewController *)self pointPickerView];
  id v6 = [v4 selectionPath];

  [v5 frameForCenterPointAtSelectionPath:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = [(SCATGridPointPickerViewController *)self pointPickerView];
  +[HNDScreen convertRect:fromView:](HNDScreen, "convertRect:fromView:", v15, v8, v10, v12, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGPath)scannerPathForPointPickerCenterPoint:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATGridPointPickerViewController *)self pointPickerView];
  id v6 = [v4 selectionPath];

  double v7 = (CGPath *)[v5 pathForCenterPointAtSelectionPath:v6];
  return v7;
}

- (CGRect)scannerFrameForPointPickerGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATGridPointPickerViewController *)self pointPickerView];
  id v6 = [v4 selectionPath];

  [v5 frameForSelectionPath:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = [(SCATGridPointPickerViewController *)self pointPickerView];
  +[HNDScreen convertRect:fromView:](HNDScreen, "convertRect:fromView:", v15, v8, v10, v12, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (id)generateElementsForGroup:(id)a3
{
  id v4 = [a3 selectionPath];
  id v5 = [(SCATGridPointPickerViewController *)self _scannableElementsAtSelectionPath:v4];

  return v5;
}

- (void)didGenerateElements:(id)a3
{
}

- (id)firstElementWithOptions:(int *)a3
{
  v3 = [(SCATGridPointPickerViewController *)self _scannableElements];
  id v4 = [v3 objectAtIndex:0];

  return v4;
}

- (id)lastElementWithOptions:(int *)a3
{
  v3 = [(SCATGridPointPickerViewController *)self _scannableElements];
  id v4 = [v3 lastObject];

  return v4;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v7 = a3;
  double v8 = [v7 parentGroup];

  if (v8)
  {
    double v9 = [v7 parentGroup];
    double v10 = [v9 nextSiblingOfChild:v7 didWrap:a4];

    goto LABEL_11;
  }
  double v9 = [(SCATGridPointPickerViewController *)self _scannableElementsAtSelectionPath:0];
  double v11 = (char *)[v9 indexOfObject:v7];

  if (v11 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    double v13 = (char *)[v9 count] - 1;
    BOOL v12 = v11 >= v13;
    if (v11 < v13) {
      double v14 = v11 + 1;
    }
    else {
      double v14 = 0;
    }
    double v10 = [v9 objectAtIndex:v14];
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  BOOL v12 = 0;
  double v10 = 0;
  if (a4) {
LABEL_10:
  }
    *a4 = v12;
LABEL_11:

  return v10;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v7 = a3;
  double v8 = [v7 parentGroup];

  if (v8)
  {
    double v9 = [v7 parentGroup];
    double v10 = [v9 previousSiblingOfChild:v7 didWrap:a4];

    goto LABEL_11;
  }
  double v9 = [(SCATGridPointPickerViewController *)self _scannableElementsAtSelectionPath:0];
  double v11 = (char *)[v9 indexOfObject:v7];

  if (v11)
  {
    if (v11 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v12 = 0;
      double v10 = 0;
      if (!a4) {
        goto LABEL_11;
      }
    }
    else
    {
      double v10 = [v9 objectAtIndex:v11 - 1];
      BOOL v12 = 0;
      if (!a4) {
        goto LABEL_11;
      }
    }
LABEL_10:
    *a4 = v12;
    goto LABEL_11;
  }
  double v10 = [v9 lastObject];
  BOOL v12 = 1;
  if (a4) {
    goto LABEL_10;
  }
LABEL_11:

  return v10;
}

- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5
{
  id v6 = a4;
  id v5 = v6;
  AXPerformBlockOnMainThread();
}

- (BOOL)handleInputAction:(id)a3 withElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isGroup] & 1) == 0
    && ([v6 action] == (id)100
     || [v6 action] == (id)103
     || [v6 action] == (id)109))
  {
    [(SCATGridPointPickerViewController *)self _resetGrid];
    id v9 = v7;
    double v10 = [(SCATGridPointPickerViewController *)self pointPickerView];
    double v11 = [v9 selectionPath];

    [v10 frameForSelectionPath:v11];
    AX_CGRectGetCenter();
    double v13 = v12;
    double v15 = v14;

    double v16 = [(SCATPointPickerViewController *)self pointPicker];
    BOOL v8 = 1;
    objc_msgSend(v16, "_savePoint:andNotifyDelegate:", 1, v13, v15);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end