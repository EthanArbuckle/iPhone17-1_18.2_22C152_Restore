@interface MKPlaceCardActionsViewController
- (BOOL)allowRowSelection;
- (BOOL)haveTwoColumns;
- (BOOL)showTopButtonSeparator;
- (BOOL)showTopSeparator;
- (BOOL)useMarginLayout;
- (BOOL)useSmallFonts;
- (MKPlaceActionManager)actionManager;
- (MKPlaceCardActionsViewController)init;
- (NSArray)actionItemArray;
- (NSArray)viewArray;
- (_MKPlaceViewControllerDelegate)placeViewControllerDelegate;
- (id)_makePlaceActionButton;
- (id)infoCardChildPossibleActions;
- (id)infoCardChildUnactionableUIElements;
- (void)_setUpSectionViews;
- (void)placeCardActionSectionView:(id)a3 buttonWithActionItemPressed:(id)a4;
- (void)sectionView:(id)a3 didSelectRow:(id)a4 atIndex:(unint64_t)a5;
- (void)setActionItemArray:(id)a3;
- (void)setActionManager:(id)a3;
- (void)setAllowRowSelection:(BOOL)a3;
- (void)setHaveTwoColumns:(BOOL)a3;
- (void)setPlaceViewControllerDelegate:(id)a3;
- (void)setShowTopButtonSeparator:(BOOL)a3;
- (void)setShowTopSeparator:(BOOL)a3;
- (void)setUseMarginLayout:(BOOL)a3;
- (void)setUseSmallFonts:(BOOL)a3;
- (void)setViewArray:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MKPlaceCardActionsViewController

- (MKPlaceCardActionsViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)MKPlaceCardActionsViewController;
  result = [(MKPlaceCardActionsViewController *)&v3 init];
  if (result) {
    result->_useMarginLayout = 1;
  }
  return result;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)MKPlaceCardActionsViewController;
  [(MKPlaceCardActionsViewController *)&v7 viewDidLoad];
  objc_super v3 = [(MKPlaceSectionViewController *)self sectionView];
  [v3 setStackDelegate:self];

  v4 = [(MKPlaceSectionViewController *)self sectionView];
  [v4 setPreservesSuperviewLayoutMargins:1];

  BOOL allowRowSelection = self->_allowRowSelection;
  v6 = [(MKPlaceSectionViewController *)self sectionView];
  [v6 setHighlightsTouches:allowRowSelection];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MKPlaceCardActionsViewController;
  [(MKPlaceCardActionsViewController *)&v4 viewDidAppear:a3];
  if (![(NSArray *)self->_viewArray count]) {
    [(MKPlaceCardActionsViewController *)self _setUpSectionViews];
  }
}

- (id)_makePlaceActionButton
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F427E0]);
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v2;
}

- (void)_setUpSectionViews
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MKPlaceCardActionsViewController *)self viewIfLoaded];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    v5 = [(MKPlaceCardActionsViewController *)self viewIfLoaded];
    [v5 frame];
    double v7 = v6;

    if (v7 != 0.0)
    {
      p_vtable = &OBJC_METACLASS___MKPlaceInfoContactRowView.vtable;
      if (self->_haveTwoColumns)
      {
        v9 = [(MKPlaceCardActionsViewController *)self view];
        [v9 frame];
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        v18 = [(MKPlaceCardActionsViewController *)self view];
        [v18 layoutMargins];
        CGFloat v20 = v13 + v19;
        CGFloat v23 = v15 - (v21 + v22);
        v66.size.height = v17 - (v19 + v24);
        v66.origin.x = v11 + v21;
        v66.origin.y = v20;
        v66.size.width = v23;
        double Width = CGRectGetWidth(v66);

        v26 = +[MKPlaceCardActionSectionView _font:self->_useSmallFonts];
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        obunint64_t j = self->_actionItemArray;
        uint64_t v27 = [(NSArray *)obj countByEnumeratingWithState:&v58 objects:v64 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          double v29 = (Width + -30.0) * 0.5;
          uint64_t v30 = *(void *)v59;
          uint64_t v31 = *MEMORY[0x1E4F42508];
          while (2)
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v59 != v30) {
                objc_enumerationMutation(obj);
              }
              v33 = [*(id *)(*((void *)&v58 + 1) + 8 * i) displayString];
              uint64_t v62 = v31;
              v63 = v26;
              uint64_t v34 = 1;
              v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
              [v33 sizeWithAttributes:v35];
              double v37 = v36;

              if (v37 > v29)
              {
                p_vtable = (void **)(&OBJC_METACLASS___MKPlaceInfoContactRowView + 24);
                goto LABEL_14;
              }
              p_vtable = (void **)(&OBJC_METACLASS___MKPlaceInfoContactRowView + 24);
            }
            uint64_t v28 = [(NSArray *)obj countByEnumeratingWithState:&v58 objects:v64 count:16];
            if (v28) {
              continue;
            }
            break;
          }
        }
        uint64_t v34 = 0;
LABEL_14:
      }
      else
      {
        uint64_t v34 = 0;
      }
      v38 = [MEMORY[0x1E4F1CA48] array];
      if ([(NSArray *)self->_actionItemArray count])
      {
        for (unint64_t j = 0; j < [(NSArray *)self->_actionItemArray count]; ++j)
        {
          if ((v34 & 1) != 0 || !self->_haveTwoColumns)
          {
            id v47 = objc_alloc((Class)(p_vtable + 297));
            v41 = [(NSArray *)self->_actionItemArray objectAtIndex:j];
            BOOL useSmallFonts = self->_useSmallFonts;
            BOOL useMarginLayout = self->_useMarginLayout;
            v44 = v47;
            v45 = v41;
            uint64_t v46 = v34;
          }
          else
          {
            if (j != [(NSArray *)self->_actionItemArray count] - 1)
            {
              v41 = [(NSArray *)self->_actionItemArray objectAtIndex:j];
              v49 = [(NSArray *)self->_actionItemArray objectAtIndex:++j];
              v48 = [[MKPlaceCardActionSectionView alloc] initWithLeftActionItem:v41 rightActionItem:v49 useSmallFonts:self->_useSmallFonts singleItemIsFullWidth:0 useMarginLayout:self->_useMarginLayout];

              p_vtable = (void **)(&OBJC_METACLASS___MKPlaceInfoContactRowView + 24);
              goto LABEL_24;
            }
            id v40 = objc_alloc((Class)(p_vtable + 297));
            v41 = [(NSArray *)self->_actionItemArray objectAtIndex:j];
            BOOL useSmallFonts = self->_useSmallFonts;
            BOOL useMarginLayout = self->_useMarginLayout;
            v44 = v40;
            v45 = v41;
            uint64_t v46 = 0;
          }
          v48 = (MKPlaceCardActionSectionView *)[v44 initWithLeftActionItem:v45 rightActionItem:0 useSmallFonts:useSmallFonts singleItemIsFullWidth:v46 useMarginLayout:useMarginLayout];
LABEL_24:

          [(MKPlaceCardActionSectionView *)v48 setDelegate:self];
          [(MKPlaceCardActionSectionView *)v48 setTopHairlineHidden:!self->_showTopButtonSeparator];
          [(MKViewWithHairline *)v48 setBottomHairlineHidden:1];
          [v38 addObject:v48];
        }
      }
      BOOL v50 = !self->_showTopSeparator;
      v51 = [v38 firstObject];
      [v51 setTopHairlineHidden:v50];

      v52 = [v38 lastObject];
      [v52 setBottomHairlineHidden:1];

      v53 = (NSArray *)[v38 copy];
      viewArray = self->_viewArray;
      self->_viewArray = v53;

      v55 = [(MKPlaceSectionViewController *)self sectionView];
      [v55 setRowViews:v38];

      v56 = [(MKPlaceCardActionsViewController *)self view];
      objc_msgSend(v56, "_mapkit_setNeedsLayout");
    }
  }
}

- (void)setActionItemArray:(id)a3
{
  objc_super v4 = (NSArray *)[a3 copy];
  actionItemArray = self->_actionItemArray;
  self->_actionItemArray = v4;

  [(MKPlaceCardActionsViewController *)self _setUpSectionViews];
}

- (void)setAllowRowSelection:(BOOL)a3
{
  self->_BOOL allowRowSelection = a3;
  if ([(MKPlaceCardActionsViewController *)self isViewLoaded])
  {
    BOOL allowRowSelection = self->_allowRowSelection;
    id v5 = [(MKPlaceSectionViewController *)self sectionView];
    [v5 setHighlightsTouches:allowRowSelection];
  }
}

- (void)sectionView:(id)a3 didSelectRow:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MKPlaceCardActionsViewController;
  [(MKPlaceSectionViewController *)&v23 sectionView:a3 didSelectRow:v8 atIndex:a5];
  if (self->_allowRowSelection)
  {
    v9 = [v8 leftItem];
    if (v9)
    {
    }
    else
    {
      double v10 = [v8 rightItem];

      if (!v10) {
        goto LABEL_15;
      }
    }
    uint64_t v11 = [v8 leftItem];
    if (!v11
      || (double v12 = (void *)v11,
          [v8 rightItem],
          double v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          !v13))
    {
      double v14 = [v8 currentLeftItem];
      double v15 = v14;
      if (v14)
      {
        id v16 = v14;
      }
      else
      {
        id v16 = [v8 rightItem];
      }
      double v17 = v16;

      v18 = [v8 leftItem];
      int v19 = [v18 enabled];

      if (v19)
      {
        CGFloat v20 = [v8 leftItem];
        double v21 = [v20 selectedItem];

        if (v21)
        {
          double v22 = [v8 leftItem];
          [v22 setEnabled:0];
        }
        [(MKPlaceCardActionsViewController *)self placeCardActionSectionView:v8 buttonWithActionItemPressed:v17];
      }
    }
  }
LABEL_15:
}

- (void)placeCardActionSectionView:(id)a3 buttonWithActionItemPressed:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    double v10 = @"view";
    v11[0] = a3;
    double v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = a3;
    a3 = [v7 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionManager);
  [WeakRetained performAction:v6 options:a3 completion:&__block_literal_global_21];
}

- (id)infoCardChildPossibleActions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v4 = self->_actionItemArray;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "type", (void)v13) - 1;
        if (v9 <= 0x11 && ((0x201F9u >> v9) & 1) != 0)
        {
          double v10 = [NSNumber numberWithInteger:qword_18BD1B070[v9]];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  uint64_t v11 = (void *)[v3 copy];

  return v11;
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)haveTwoColumns
{
  return self->_haveTwoColumns;
}

- (void)setHaveTwoColumns:(BOOL)a3
{
  self->_haveTwoColumns = a3;
}

- (BOOL)useSmallFonts
{
  return self->_useSmallFonts;
}

- (void)setUseSmallFonts:(BOOL)a3
{
  self->_BOOL useSmallFonts = a3;
}

- (BOOL)showTopSeparator
{
  return self->_showTopSeparator;
}

- (void)setShowTopSeparator:(BOOL)a3
{
  self->_showTopSeparator = a3;
}

- (NSArray)actionItemArray
{
  return self->_actionItemArray;
}

- (NSArray)viewArray
{
  return self->_viewArray;
}

- (void)setViewArray:(id)a3
{
}

- (BOOL)allowRowSelection
{
  return self->_allowRowSelection;
}

- (BOOL)useMarginLayout
{
  return self->_useMarginLayout;
}

- (void)setUseMarginLayout:(BOOL)a3
{
  self->_BOOL useMarginLayout = a3;
}

- (BOOL)showTopButtonSeparator
{
  return self->_showTopButtonSeparator;
}

- (void)setShowTopButtonSeparator:(BOOL)a3
{
  self->_showTopButtonSeparator = a3;
}

- (MKPlaceActionManager)actionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionManager);

  return (MKPlaceActionManager *)WeakRetained;
}

- (void)setActionManager:(id)a3
{
}

- (_MKPlaceViewControllerDelegate)placeViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewControllerDelegate);

  return (_MKPlaceViewControllerDelegate *)WeakRetained;
}

- (void)setPlaceViewControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_placeViewControllerDelegate);
  objc_destroyWeak((id *)&self->_actionManager);
  objc_storeStrong((id *)&self->_viewArray, 0);

  objc_storeStrong((id *)&self->_actionItemArray, 0);
}

@end