@interface SCATModernMenuScrollSheet
+ (BOOL)isValidForElement:(id)a3;
- (AXElement)scrollableElement;
- (BOOL)_shouldIncludeFallbackScrollAncestorActionsInVerticalDirection:(BOOL)a3;
- (SCATModernMenuScrollSheet)initWithMenu:(id)a3;
- (id)_fallbackAncestorForScrollToTop;
- (id)makeMenuItemsIfNeeded;
- (int64_t)preferredTipObject;
- (void)_updateScrollableElement;
- (void)reload;
- (void)setScrollableElement:(id)a3;
@end

@implementation SCATModernMenuScrollSheet

+ (BOOL)isValidForElement:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 scatTraits];
  if ((kAXCausesPageTurnTrait & v4) != 0) {
    unsigned __int8 v5 = 1;
  }
  else {
    unsigned __int8 v5 = [v3 scatCanScrollInAtLeastOneDirection];
  }

  return v5;
}

- (void)setScrollableElement:(id)a3
{
  unsigned __int8 v5 = (AXElement *)a3;
  p_scrollableElement = &self->_scrollableElement;
  if (self->_scrollableElement != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_scrollableElement, a3);
    p_scrollableElement = (AXElement **)[(SCATModernMenuSheet *)self invalidateMenuItems];
    unsigned __int8 v5 = v7;
  }

  _objc_release_x1(p_scrollableElement, v5);
}

- (void)_updateScrollableElement
{
  id v3 = [(SCATModernMenuSheet *)self menu];
  unint64_t v4 = [v3 delegate];
  unsigned __int8 v5 = [(SCATModernMenuSheet *)self menu];
  unsigned __int8 v6 = [v4 shouldShowAppWideScrollActionsInMenu:v5];

  if ((v6 & 1) == 0)
  {
    id v9 = [(SCATModernMenuSheet *)self menu];
    v7 = [v9 element];
    v8 = [v7 scrollableElement];
    [(SCATModernMenuScrollSheet *)self setScrollableElement:v8];
  }
}

- (SCATModernMenuScrollSheet)initWithMenu:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCATModernMenuScrollSheet;
  id v3 = [(SCATModernMenuSheet *)&v6 initWithMenu:a3];
  unint64_t v4 = v3;
  if (v3) {
    [(SCATModernMenuScrollSheet *)v3 _updateScrollableElement];
  }
  return v4;
}

- (id)makeMenuItemsIfNeeded
{
  id v3 = +[NSMutableArray array];
  unint64_t v4 = [(SCATModernMenuScrollSheet *)self scrollableElement];

  if (!v4)
  {
    v17 = +[HNDAccessibilityManager sharedManager];
    v18 = [v17 scrollViewsForAction:2007];
    if ([v18 count])
    {
    }
    else
    {
      v22 = [v17 scrollViewsForAction:2006];
      id v23 = [v22 count];

      if (!v23) {
        goto LABEL_21;
      }
    }
    v24 = +[SCATModernMenuScrollFactory menuItemForScrollAction:2006 withDelegate:self];
    [v3 addObject:v24];

    v25 = +[SCATModernMenuScrollFactory menuItemForScrollAction:2007 withDelegate:self];
    [v3 addObject:v25];

LABEL_21:
    v26 = [v17 scrollViewsForAction:2008];
    if ([v26 count])
    {
    }
    else
    {
      v27 = [v17 scrollViewsForAction:2009];
      id v28 = [v27 count];

      if (!v28) {
        goto LABEL_39;
      }
    }
    v29 = +[HNDAccessibilityManager sharedManager];
    unsigned int v30 = [v29 applicationIsRTL];

    if (v30) {
      uint64_t v31 = 2009;
    }
    else {
      uint64_t v31 = 2008;
    }
    if (v30) {
      uint64_t v32 = 2008;
    }
    else {
      uint64_t v32 = 2009;
    }
    v33 = +[SCATModernMenuScrollFactory menuItemForScrollAction:v31 withDelegate:self];
    [v3 addObject:v33];

    v34 = +[SCATModernMenuScrollFactory menuItemForScrollAction:v32 withDelegate:self];
    [v3 addObject:v34];

    goto LABEL_39;
  }
  unsigned __int8 v5 = [(SCATModernMenuScrollSheet *)self scrollableElement];
  if ([v5 scatSupportsAction:2006])
  {
LABEL_5:

LABEL_6:
    v7 = +[SCATModernMenuScrollFactory menuItemForScrollAction:2006 withDelegate:self];
    [v3 addObject:v7];

    v8 = +[SCATModernMenuScrollFactory menuItemForScrollAction:2007 withDelegate:self];
    [v3 addObject:v8];

    int v9 = 1;
    goto LABEL_7;
  }
  objc_super v6 = [(SCATModernMenuScrollSheet *)self scrollableElement];
  if ([v6 scatSupportsAction:2007])
  {

    goto LABEL_5;
  }
  unsigned __int8 v21 = [(SCATModernMenuScrollSheet *)self _shouldIncludeFallbackScrollAncestorActionsInVerticalDirection:1];

  if (v21) {
    goto LABEL_6;
  }
  int v9 = 0;
LABEL_7:
  v10 = +[HNDAccessibilityManager sharedManager];
  unsigned __int8 v11 = [v10 applicationIsRTL];

  v12 = [(SCATModernMenuScrollSheet *)self scrollableElement];
  unint64_t v13 = (unint64_t)[v12 scatTraits];
  unint64_t v14 = kAXCausesPageTurnTrait & v13;

  if (v14)
  {
    v15 = +[SCATModernMenuScrollFactory menuItemForScrollAction:2020 withDelegate:self];
    uint64_t v16 = 2019;
LABEL_32:
    [v3 addObject:v15];

    v35 = +[SCATModernMenuScrollFactory menuItemForScrollAction:v16 withDelegate:self];
    [v3 addObject:v35];

    goto LABEL_33;
  }
  v19 = [(SCATModernMenuScrollSheet *)self scrollableElement];
  if ([v19 scatSupportsAction:2009]) {
    goto LABEL_14;
  }
  v20 = [(SCATModernMenuScrollSheet *)self scrollableElement];
  if ([v20 scatSupportsAction:2008])
  {

LABEL_14:
    goto LABEL_15;
  }
  unsigned __int8 v41 = [(SCATModernMenuScrollSheet *)self _shouldIncludeFallbackScrollAncestorActionsInVerticalDirection:0];

  if (v41)
  {
LABEL_15:
    if (v11)
    {
      v15 = +[SCATModernMenuScrollFactory menuItemForScrollAction:2009 withDelegate:self];
      uint64_t v16 = 2008;
    }
    else
    {
      v15 = +[SCATModernMenuScrollFactory menuItemForScrollAction:2008 withDelegate:self];
      uint64_t v16 = 2009;
    }
    goto LABEL_32;
  }
LABEL_33:
  v36 = [(SCATModernMenuScrollSheet *)self scrollableElement];
  if ([v36 scatSupportsAction:2030])
  {

LABEL_36:
    v39 = +[SCATModernMenuScrollFactory menuItemForScrollAction:2030 withDelegate:self];
    [v3 addObject:v39];

    goto LABEL_37;
  }
  v37 = [(SCATModernMenuScrollSheet *)self _fallbackAncestorForScrollToTop];
  unsigned int v38 = [v37 scatSupportsAction:2030];

  if (v38) {
    goto LABEL_36;
  }
LABEL_37:
  if (!v9) {
    goto LABEL_40;
  }
  v17 = +[SCATModernMenuScrollFactory menuItemForScrollAction:2031 withDelegate:self];
  [v3 addObject:v17];
LABEL_39:

LABEL_40:

  return v3;
}

- (id)_fallbackAncestorForScrollToTop
{
  id v3 = [(SCATModernMenuSheet *)self menu];
  unint64_t v4 = [v3 fallbackScrollUpAncestor];
  unsigned __int8 v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(SCATModernMenuSheet *)self menu];
    id v6 = [v7 fallbackScrollDownAncestor];
  }
  v8 = +[AXElement elementWithUIElement:v6];

  return v8;
}

- (int64_t)preferredTipObject
{
  return 2;
}

- (void)reload
{
  [(SCATModernMenuScrollSheet *)self _updateScrollableElement];
  v3.receiver = self;
  v3.super_class = (Class)SCATModernMenuScrollSheet;
  [(SCATModernMenuSheet *)&v3 reload];
}

- (BOOL)_shouldIncludeFallbackScrollAncestorActionsInVerticalDirection:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = [(SCATModernMenuSheet *)self menu];
  id v6 = v5;
  if (v3)
  {
    v7 = [v5 fallbackScrollUpAncestor];
    if (!v7)
    {
      v8 = [(SCATModernMenuSheet *)self menu];
      int v9 = [v8 fallbackScrollDownAncestor];
LABEL_7:
      BOOL v10 = v9 != 0;

      goto LABEL_8;
    }
  }
  else
  {
    v7 = [v5 fallbackScrollLeftAncestor];
    if (!v7)
    {
      v8 = [(SCATModernMenuSheet *)self menu];
      int v9 = [v8 fallbackScrollRightAncestor];
      goto LABEL_7;
    }
  }
  BOOL v10 = 1;
LABEL_8:

  return v10;
}

- (AXElement)scrollableElement
{
  return self->_scrollableElement;
}

- (void).cxx_destruct
{
}

@end