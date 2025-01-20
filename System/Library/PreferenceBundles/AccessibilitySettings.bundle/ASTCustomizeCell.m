@interface ASTCustomizeCell
- (ASTButtonCell)cellForPresentedHUDView;
- (ASTCustomizeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (ASTCustomizeCellDelegateProtocol)delegate;
- (AXDispatchTimer)presentHUDViewTimer;
- (BOOL)_accessibilityIgnoreInternalLabels;
- (BOOL)_showsLargeContentViewer;
- (BOOL)shouldDelayBeforePresentingHUDView;
- (id)_cellForTouches:(id)a3;
- (id)_itemForCell:(id)a3;
- (id)_layoutIcons;
- (id)_updateButton:(id)a3 withIcon:(id)a4 layout:(int64_t)a5 shouldUpdateLayoutViewIfNeeded:(BOOL)a6;
- (id)accessibilityElements;
- (void)_displayPickerForIcon:(id)a3 andLocation:(id)a4 cell:(id)a5;
- (void)_hideLargeContentViewerIfNeeded;
- (void)_rearrangeMap;
- (void)_removeInvalidIconsIfNeeded;
- (void)_updateLargeContentViewerForCell:(id)a3;
- (void)setCellForPresentedHUDView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentHUDViewTimer:(id)a3;
- (void)setShouldDelayBeforePresentingHUDView:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateButton:(id)a3 withIcon:(id)a4 layout:(int64_t)a5;
@end

@implementation ASTCustomizeCell

- (ASTCustomizeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v62.receiver = self;
  v62.super_class = (Class)ASTCustomizeCell;
  id v55 = a4;
  id v56 = a5;
  v7 = -[ASTCustomizeCell initWithStyle:reuseIdentifier:specifier:](&v62, "initWithStyle:reuseIdentifier:specifier:", a3, v55);
  if (v7)
  {
    v8 = AXSystemRootDirectory();
    v9 = [v8 stringByAppendingPathComponent:@"System/Library/CoreServices/AssistiveTouch.app"];
    uint64_t v10 = +[NSBundle bundleWithPath:v9];
    astBundle = v7->_astBundle;
    v7->_astBundle = (NSBundle *)v10;

    v12 = [(ASTCustomizeCell *)v7 subviews];
    [v12 enumerateObjectsUsingBlock:&__block_literal_global_12];

    [(ASTCustomizeCell *)v7 setAutoresizesSubviews:1];
    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    buttonCells = v7->_buttonCells;
    v7->_buttonCells = v13;

    v15 = (AXAssistiveTouchLayoutView *)objc_alloc_init((Class)AXAssistiveTouchLayoutView);
    layoutView = v7->_layoutView;
    v7->_layoutView = v15;

    [(AXAssistiveTouchLayoutView *)v7->_layoutView setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [(ASTCustomizeCell *)v7 contentView];
    [v17 addSubview:v7->_layoutView];

    v18 = +[UIColor clearColor];
    [(ASTCustomizeCell *)v7 setBackgroundColor:v18];

    v19 = [(ASTCustomizeCell *)v7 contentView];
    [v19 setUserInteractionEnabled:0];

    v20 = [(ASTCustomizeCell *)v7 contentView];
    [(ASTCustomizeCell *)v7 addSubview:v20];

    v21 = [(AXAssistiveTouchLayoutView *)v7->_layoutView widthAnchor];
    v22 = [(ASTCustomizeCell *)v7 contentView];
    v23 = [v22 widthAnchor];
    v58 = [v21 constraintEqualToAnchor:v23 multiplier:0.9];

    LODWORD(v24) = 1131937792;
    [v58 setPriority:v24];
    +[AXAssistiveTouchLayoutView layoutViewSideLengthScaledFromDefaultLength:389.0];
    double v26 = v25;
    v27 = [(AXAssistiveTouchLayoutView *)v7->_layoutView widthAnchor];
    v57 = [v27 constraintLessThanOrEqualToConstant:v26];

    LODWORD(v28) = 1132003328;
    [v57 setPriority:v28];
    v54 = [(ASTCustomizeCell *)v7 contentView];
    v53 = [v54 centerXAnchor];
    v52 = [(AXAssistiveTouchLayoutView *)v7->_layoutView centerXAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v63[0] = v51;
    v50 = [(ASTCustomizeCell *)v7 contentView];
    v49 = [v50 topAnchor];
    v48 = [(AXAssistiveTouchLayoutView *)v7->_layoutView topAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v63[1] = v47;
    v46 = [(ASTCustomizeCell *)v7 contentView];
    v45 = [v46 bottomAnchor];
    v44 = [(AXAssistiveTouchLayoutView *)v7->_layoutView bottomAnchor];
    v43 = [v45 constraintGreaterThanOrEqualToAnchor:v44];
    v63[2] = v43;
    v63[3] = v58;
    v63[4] = v57;
    v42 = [(AXAssistiveTouchLayoutView *)v7->_layoutView widthAnchor];
    v29 = [v42 constraintGreaterThanOrEqualToConstant:320.0];
    v63[5] = v29;
    v30 = [(AXAssistiveTouchLayoutView *)v7->_layoutView heightAnchor];
    v31 = [(AXAssistiveTouchLayoutView *)v7->_layoutView widthAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    v63[6] = v32;
    v33 = [(AXAssistiveTouchLayoutView *)v7->_layoutView widthAnchor];
    v34 = [(ASTCustomizeCell *)v7 contentView];
    v35 = [v34 widthAnchor];
    v36 = [v33 constraintLessThanOrEqualToAnchor:v35];
    v63[7] = v36;
    v37 = +[NSArray arrayWithObjects:v63 count:8];
    +[NSLayoutConstraint activateConstraints:v37];

    [(ASTCustomizeCell *)v7 setUserInteractionEnabled:1];
    [(ASTCustomizeCell *)v7 setMultipleTouchEnabled:1];
    [(ASTCustomizeCell *)v7 setExclusiveTouch:1];
    objc_initWeak(&location, v7);
    v38 = +[AXSettings sharedInstance];
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = __60__ASTCustomizeCell_initWithStyle_reuseIdentifier_specifier___block_invoke_2;
    v59[3] = &unk_208798;
    objc_copyWeak(&v60, &location);
    [v38 registerUpdateBlock:v59 forRetrieveSelector:"assistiveTouchMainScreenCustomization" withListener:v7];

    objc_destroyWeak(&v60);
    id v39 = [(ASTCustomizeCell *)v7 _layoutIcons];
    v40 = v7;
    objc_destroyWeak(&location);
  }
  return v7;
}

void __60__ASTCustomizeCell_initWithStyle_reuseIdentifier_specifier___block_invoke(id a1, id a2, unint64_t a3, BOOL *a4)
{
}

void __60__ASTCustomizeCell_initWithStyle_reuseIdentifier_specifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _rearrangeMap];
}

- (id)accessibilityElements
{
  v3 = +[NSMutableArray array];
  v4 = [(NSMutableDictionary *)self->_buttonCells objectForKeyedSubscript:AXAssistiveTouchIconLocationTopMiddle];
  [v3 axSafelyAddObject:v4];

  v5 = [(NSMutableDictionary *)self->_buttonCells objectForKeyedSubscript:AXAssistiveTouchIconLocationTopLeft];
  [v3 axSafelyAddObject:v5];

  v6 = [(NSMutableDictionary *)self->_buttonCells objectForKeyedSubscript:AXAssistiveTouchIconLocationTopRight];
  [v3 axSafelyAddObject:v6];

  v7 = [(NSMutableDictionary *)self->_buttonCells objectForKeyedSubscript:AXAssistiveTouchIconLocationMidLeft];
  [v3 axSafelyAddObject:v7];

  v8 = [(NSMutableDictionary *)self->_buttonCells objectForKeyedSubscript:AXAssistiveTouchIconLocationMidMiddle];
  [v3 axSafelyAddObject:v8];

  v9 = [(NSMutableDictionary *)self->_buttonCells objectForKeyedSubscript:AXAssistiveTouchIconLocationMidRight];
  [v3 axSafelyAddObject:v9];

  uint64_t v10 = [(NSMutableDictionary *)self->_buttonCells objectForKeyedSubscript:AXAssistiveTouchIconLocationBottomLeft];
  [v3 axSafelyAddObject:v10];

  v11 = [(NSMutableDictionary *)self->_buttonCells objectForKeyedSubscript:AXAssistiveTouchIconLocationBottomMiddle];
  [v3 axSafelyAddObject:v11];

  v12 = [(NSMutableDictionary *)self->_buttonCells objectForKeyedSubscript:AXAssistiveTouchIconLocationBottomRight];
  [v3 axSafelyAddObject:v12];

  return v3;
}

- (void)_rearrangeMap
{
  v3 = +[AXSettings sharedInstance];
  v4 = [v3 assistiveTouchMainScreenCustomization];

  id v5 = [v4 count];
  BOOL v6 = v5 > [(NSMutableDictionary *)self->_buttonCells count];
  v7 = +[NSMutableArray array];
  v8 = +[NSMutableArray array];
  id v9 = [(NSMutableDictionary *)self->_buttonCells copy];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __33__ASTCustomizeCell__rearrangeMap__block_invoke;
  v16[3] = &unk_209790;
  v16[4] = self;
  id v17 = v4;
  BOOL v21 = v6;
  id v18 = v7;
  id v19 = v8;
  id v20 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __33__ASTCustomizeCell__rearrangeMap__block_invoke_4;
  v14[3] = &unk_2097B8;
  id v15 = v18;
  id v10 = v18;
  id v11 = v9;
  id v12 = v8;
  id v13 = v4;
  +[UIView animateWithDuration:v16 animations:v14 completion:0.25];
}

void __33__ASTCustomizeCell__rearrangeMap__block_invoke(uint64_t a1)
{
  id v37 = +[NSMutableDictionary dictionary];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 152) allKeys];
  id v39 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v59;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v59 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = v2;
        v3 = [*(id *)(*(void *)(a1 + 32) + 152) objectForKey:*(void *)(*((void *)&v58 + 1) + 8 * v2)];
        [v3 setLocation:0];
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        v4 = [*(id *)(a1 + 40) allKeys];
        id v5 = [v4 countByEnumeratingWithState:&v54 objects:v64 count:16];
        if (v5)
        {
          id v6 = v5;
          uint64_t v7 = *(void *)v55;
          do
          {
            for (i = 0; i != v6; i = (char *)i + 1)
            {
              if (*(void *)v55 != v7) {
                objc_enumerationMutation(v4);
              }
              uint64_t v9 = *(void *)(*((void *)&v54 + 1) + 8 * i);
              id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
              id v11 = [v3 iconKey];
              unsigned int v12 = [v11 isEqualToString:v10];

              if (v12) {
                [v3 setLocation:v9];
              }
            }
            id v6 = [v4 countByEnumeratingWithState:&v54 objects:v64 count:16];
          }
          while (v6);
        }

        id v13 = [v3 location];

        if (v13)
        {
          v14 = [v3 location];
          [v37 setObject:v3 forKey:v14];
        }
        else
        {
          [v3 setAlpha:0.0];
          [*(id *)(a1 + 48) addObject:v3];
        }

        uint64_t v2 = v40 + 1;
      }
      while ((id)(v40 + 1) != v39);
      id v39 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
    }
    while (v39);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 152), v37);
  if (*(unsigned char *)(a1 + 72))
  {
    id v15 = [*(id *)(*(void *)(a1 + 32) + 152) count];
    if (v15 != [*(id *)(a1 + 40) count])
    {
      do
      {
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v16 = *(id *)(a1 + 40);
        id v17 = [v16 countByEnumeratingWithState:&v50 objects:v63 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v51;
LABEL_24:
          uint64_t v20 = 0;
          while (1)
          {
            if (*(void *)v51 != v19) {
              objc_enumerationMutation(v16);
            }
            BOOL v21 = *(void **)(*((void *)&v50 + 1) + 8 * v20);
            v22 = [*(id *)(*(void *)(a1 + 32) + 152) objectForKeyedSubscript:v21];

            if (!v22) {
              break;
            }
            if (v18 == (id)++v20)
            {
              id v18 = [v16 countByEnumeratingWithState:&v50 objects:v63 count:16];
              if (v18) {
                goto LABEL_24;
              }
              goto LABEL_30;
            }
          }
          id v23 = v21;

          if (!v23) {
            goto LABEL_33;
          }
          double v24 = [ASTButtonCell alloc];
          double v25 = [*(id *)(a1 + 40) objectForKey:v23];
          double v26 = [(ASTButtonCell *)v24 initWithLocation:v23 iconKey:v25];

          [*(id *)(a1 + 56) addObject:v26];
          v27 = [*(id *)(a1 + 32) contentView];
          [v27 addSubview:v26];

          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = __33__ASTCustomizeCell__rearrangeMap__block_invoke_2;
          v49[3] = &unk_209740;
          v49[4] = *(void *)(a1 + 32);
          [(ASTButtonCell *)v26 setActivateCellBlock:v49];
          [*(id *)(*(void *)(a1 + 32) + 152) setObject:v26 forKey:v23];
        }
        else
        {
LABEL_30:

LABEL_33:
          _AXAssert();
        }
        id v28 = [*(id *)(*(void *)(a1 + 32) + 152) count];
      }
      while (v28 != [*(id *)(a1 + 40) count]);
    }
  }
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = __33__ASTCustomizeCell__rearrangeMap__block_invoke_3;
  v45[3] = &unk_209768;
  v45[4] = *(void *)(a1 + 32);
  id v46 = *(id *)(a1 + 56);
  id v47 = *(id *)(a1 + 64);
  id v48 = *(id *)(a1 + 48);
  +[UIView performWithoutAnimation:v45];
  id v29 = [*(id *)(a1 + 32) _layoutIcons];
  [*(id *)(a1 + 32) layoutIfNeeded];
  v30 = [*(id *)(a1 + 32) delegate];
  [v30 wantsHeightUpdatedForCustomCell:*(void *)(a1 + 32)];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v31 = *(id *)(a1 + 56);
  id v32 = [v31 countByEnumeratingWithState:&v41 objects:v62 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v42;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(void *)v42 != v34) {
          objc_enumerationMutation(v31);
        }
        [*(id *)(*((void *)&v41 + 1) + 8 * (void)j) setAlpha:1.0];
      }
      id v33 = [v31 countByEnumeratingWithState:&v41 objects:v62 count:16];
    }
    while (v33);
  }
}

void __33__ASTCustomizeCell__rearrangeMap__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 iconKey];
  v4 = [v3 location];
  [v2 _displayPickerForIcon:v5 andLocation:v4 cell:v3];
}

void __33__ASTCustomizeCell__rearrangeMap__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _layoutIcons];
  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(a1 + 40) addObjectsFromArray:v2];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v3 = *(id *)(a1 + 40);
  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v28;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v8 setTranslatesAutoresizingMaskIntoConstraints:1];
        [v8 setAlpha:0.0];
      }
      id v5 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v5);
  }

  [*(id *)(*(void *)(a1 + 32) + 144) layoutItemsByLocation:*(void *)(a1 + 48) hasBackButton:0];
  [*(id *)(a1 + 32) layoutIfNeeded];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = *(id *)(a1 + 56);
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * (void)j) setTranslatesAutoresizingMaskIntoConstraints:1];
      }
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v11);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = *(id *)(a1 + 40);
  id v15 = [v14 countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (k = 0; k != v16; k = (char *)k + 1)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)k), "setTranslatesAutoresizingMaskIntoConstraints:", 0, (void)v19);
      }
      id v16 = [v14 countByEnumeratingWithState:&v19 objects:v31 count:16];
    }
    while (v16);
  }
}

void __33__ASTCustomizeCell__rearrangeMap__block_invoke_4(uint64_t a1)
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  id v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * (void)v5), "removeFromSuperview", (void)v6);
        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (id)_cellForTouches:(id)a3
{
  id v27 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v4 = [(ASTCustomizeCell *)self contentView];
  id v5 = [v4 subviews];

  id v6 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          uint64_t v12 = [v11 borderView];
          [v12 bounds];
          CGFloat v14 = v13;
          CGFloat v16 = v15;
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          long long v21 = [v27 anyObject];
          long long v22 = [v11 borderView];
          [v21 locationInView:v22];
          v34.x = v23;
          v34.y = v24;
          v35.origin.x = v14;
          v35.origin.y = v16;
          v35.size.width = v18;
          v35.size.height = v20;
          BOOL v25 = CGRectContainsPoint(v35, v34);

          if (v25) {
            goto LABEL_12;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v7);
  }
  id v11 = 0;
LABEL_12:

  return v11;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[ASTCustomizeCell _cellForTouches:](self, "_cellForTouches:", a3, a4);
  id v5 = (ASTButtonCell *)objc_claimAutoreleasedReturnValue();
  downCell = self->_downCell;
  self->_downCell = v5;

  if ([(ASTCustomizeCell *)self _showsLargeContentViewer])
  {
    [(ASTCustomizeCell *)self setShouldDelayBeforePresentingHUDView:1];
    id v7 = self->_downCell;
    [(ASTCustomizeCell *)self _updateLargeContentViewerForCell:v7];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  downCell = self->_downCell;
  if (downCell)
  {
    uint64_t v8 = [(ASTButtonCell *)downCell borderView];
    [v8 bounds];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    double v17 = [v24 anyObject];
    CGFloat v18 = [(ASTButtonCell *)self->_downCell borderView];
    [v17 locationInView:v18];
    v26.x = v19;
    v26.y = v20;
    v27.origin.x = v10;
    v27.origin.y = v12;
    v27.size.width = v14;
    v27.size.height = v16;
    BOOL v21 = CGRectContainsPoint(v27, v26);

    if (!v21)
    {
      long long v22 = self->_downCell;
      self->_downCell = 0;
    }
  }
  if ([(ASTCustomizeCell *)self _showsLargeContentViewer])
  {
    CGFloat v23 = [(ASTCustomizeCell *)self _cellForTouches:v24];
    [(ASTCustomizeCell *)self _updateLargeContentViewerForCell:v23];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  downCell = self->_downCell;
  if (downCell)
  {
    uint64_t v8 = [(ASTButtonCell *)downCell activateCellBlock];

    if (v8)
    {
      double v9 = [(ASTButtonCell *)self->_downCell activateCellBlock];
      ((void (**)(void, ASTButtonCell *))v9)[2](v9, self->_downCell);
LABEL_8:

      goto LABEL_9;
    }
  }
  if ([(ASTCustomizeCell *)self _showsLargeContentViewer])
  {
    uint64_t v10 = [(ASTCustomizeCell *)self cellForPresentedHUDView];
    if (v10)
    {
      double v11 = (void *)v10;
      CGFloat v12 = [(ASTCustomizeCell *)self cellForPresentedHUDView];
      double v13 = [v12 activateCellBlock];

      if (v13)
      {
        double v9 = [(ASTCustomizeCell *)self cellForPresentedHUDView];
        CGFloat v14 = [v9 activateCellBlock];
        double v15 = [(ASTCustomizeCell *)self cellForPresentedHUDView];
        ((void (**)(void, void *))v14)[2](v14, v15);

        goto LABEL_8;
      }
    }
  }
LABEL_9:
  CGFloat v16 = self->_downCell;
  self->_downCell = 0;

  if ([(ASTCustomizeCell *)self _showsLargeContentViewer])
  {
    [(ASTCustomizeCell *)self _hideLargeContentViewerIfNeeded];
    double v17 = [(ASTCustomizeCell *)self _tableView];
    [v17 setScrollEnabled:1];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  downCell = self->_downCell;
  self->_downCell = 0;

  if ([(ASTCustomizeCell *)self _showsLargeContentViewer])
  {
    [(ASTCustomizeCell *)self _hideLargeContentViewerIfNeeded];
    id v6 = [(ASTCustomizeCell *)self _tableView];
    [v6 setScrollEnabled:1];
  }
}

- (void)_displayPickerForIcon:(id)a3 andLocation:(id)a4 cell:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ASTCustomizeCell *)self delegate];
  [v11 customCell:self wantsPickerDisplayedForIconKey:v10 andLocation:v9 cell:v8];
}

- (void)updateButton:(id)a3 withIcon:(id)a4 layout:(int64_t)a5
{
  id v5 = [(ASTCustomizeCell *)self _updateButton:a3 withIcon:a4 layout:a5 shouldUpdateLayoutViewIfNeeded:1];
}

- (id)_updateButton:(id)a3 withIcon:(id)a4 layout:(int64_t)a5 shouldUpdateLayoutViewIfNeeded:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = [(NSMutableDictionary *)self->_buttonCells objectForKey:v9];
  if (v11)
  {
    CGFloat v12 = v11;
    [(ASTButtonCell *)v11 setIconKey:v10];
    double v13 = 0;
  }
  else
  {
    CGFloat v14 = [[ASTButtonCell alloc] initWithLocation:v9 iconKey:v10];
    [(NSMutableDictionary *)self->_buttonCells setObject:v14 forKey:v9];
    double v15 = [(ASTCustomizeCell *)self contentView];
    [v15 addSubview:v14];

    if (v6) {
      [(AXAssistiveTouchLayoutView *)self->_layoutView layoutItemsByLocation:self->_buttonCells hasBackButton:0];
    }
    double v13 = v14;
    CGFloat v12 = v13;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __81__ASTCustomizeCell__updateButton_withIcon_layout_shouldUpdateLayoutViewIfNeeded___block_invoke;
  v18[3] = &unk_209740;
  v18[4] = self;
  [(ASTButtonCell *)v12 setActivateCellBlock:v18];
  CGFloat v16 = v13;

  return v16;
}

void __81__ASTCustomizeCell__updateButton_withIcon_layout_shouldUpdateLayoutViewIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 iconKey];
  uint64_t v4 = [v3 location];
  [v2 _displayPickerForIcon:v5 andLocation:v4 cell:v3];
}

- (void)_removeInvalidIconsIfNeeded
{
  id v2 = +[AXSettings sharedInstance];
  id v3 = [v2 assistiveTouchMainScreenCustomization];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = [v3 allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v5)
  {
    id v7 = v4;
    goto LABEL_16;
  }
  id v6 = v5;
  id v7 = 0;
  uint64_t v8 = *(void *)v22;
  uint64_t v9 = AXAssistiveTouchIconTypeForceTap;
  uint64_t v19 = AXAssistiveTouchIconTypeForceTap;
  CGFloat v20 = v4;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
      CGFloat v12 = [v3 objectForKey:v11];
      if (!_AXSForceTouchEnabled() && [v12 isEqualToString:v9])
      {
        if (!v7) {
          id v7 = [v3 mutableCopy];
        }
        double v13 = v3;
        CGFloat v14 = +[NSUUID UUID];
        [v14 UUIDString];
        v16 = double v15 = v7;
        uint64_t v17 = +[NSString stringWithFormat:@"__empty__%@", v16];

        id v7 = v15;
        [v15 setValue:v17 forKey:v11];
        CGFloat v12 = (void *)v17;
        id v3 = v13;
        uint64_t v9 = v19;
        uint64_t v4 = v20;
      }
    }
    id v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v6);

  if (v7)
  {
    id v18 = +[AXSettings sharedInstance];
    [v18 setAssistiveTouchMainScreenCustomization:v7];

LABEL_16:
  }
}

- (id)_layoutIcons
{
  id v3 = +[NSMutableArray array];
  [(ASTCustomizeCell *)self _removeInvalidIconsIfNeeded];
  uint64_t v4 = +[AXSettings sharedInstance];
  id v5 = [v4 assistiveTouchMainScreenCustomization];

  [v5 count];
  uint64_t v6 = AXAssistiveTouchNamedLayout();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = objc_msgSend(v5, "allKeys", 0);
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        double v13 = [v5 objectForKey:v12];
        CGFloat v14 = [(ASTCustomizeCell *)self _updateButton:v12 withIcon:v13 layout:v6 shouldUpdateLayoutViewIfNeeded:0];

        if (v14) {
          [v3 addObject:v14];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  [(AXAssistiveTouchLayoutView *)self->_layoutView layoutItemsByLocation:self->_buttonCells hasBackButton:0];

  return v3;
}

- (BOOL)_accessibilityIgnoreInternalLabels
{
  return 1;
}

- (BOOL)_showsLargeContentViewer
{
  if (+[UILargeContentViewerInteraction isEnabled])
  {
    id v2 = +[AXAssistiveTouchLayoutView labelMaximumContentSizeCategory];
    BOOL v3 = !UIContentSizeCategoryIsAccessibilityCategory(v2);
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)_itemForCell:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)UIAccessibilityHUDItem);
  id v5 = [v3 label];
  uint64_t v6 = [v5 text];
  id v7 = [v3 imageView];

  id v8 = [v7 image];
  id v9 = objc_msgSend(v4, "initWithTitle:image:imageInsets:scaleImage:", v6, v8, 1, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  return v9;
}

- (void)_updateLargeContentViewerForCell:(id)a3
{
  id v4 = a3;
  id v5 = [(ASTCustomizeCell *)self presentHUDViewTimer];
  [v5 cancel];

  if (v4)
  {
    uint64_t v6 = [(ASTCustomizeCell *)self _itemForCell:v4];
    if ([(ASTCustomizeCell *)self shouldDelayBeforePresentingHUDView])
    {
      id v7 = [(ASTCustomizeCell *)self presentHUDViewTimer];

      if (!v7)
      {
        id v8 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
        [(ASTCustomizeCell *)self setPresentHUDViewTimer:v8];
      }
      id v9 = [(ASTCustomizeCell *)self presentHUDViewTimer];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = __53__ASTCustomizeCell__updateLargeContentViewerForCell___block_invoke;
      v11[3] = &unk_209510;
      v11[4] = self;
      id v12 = v4;
      id v13 = v6;
      [v9 afterDelay:v11 processBlock:0.15];
    }
    else
    {
      [(ASTCustomizeCell *)self setCellForPresentedHUDView:v4];
      uint64_t v10 = [(ASTCustomizeCell *)self delegate];
      [v10 customCell:self wantsAccessibilityHUDShownForItem:v6];
    }
  }
  else
  {
    [(ASTCustomizeCell *)self _hideLargeContentViewerIfNeeded];
  }
}

void __53__ASTCustomizeCell__updateLargeContentViewerForCell___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCellForPresentedHUDView:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setShouldDelayBeforePresentingHUDView:0];
  id v2 = [*(id *)(a1 + 32) _tableView];
  [v2 setScrollEnabled:0];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 customCell:*(void *)(a1 + 32) wantsAccessibilityHUDShownForItem:*(void *)(a1 + 48)];
}

- (void)_hideLargeContentViewerIfNeeded
{
  id v3 = [(ASTCustomizeCell *)self presentHUDViewTimer];
  [v3 cancel];

  [(ASTCustomizeCell *)self setCellForPresentedHUDView:0];
  id v4 = [(ASTCustomizeCell *)self delegate];
  [v4 wantsAccessibilityHUDDismissedForCustomCell:self];
}

- (ASTCustomizeCellDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASTCustomizeCellDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AXDispatchTimer)presentHUDViewTimer
{
  return self->_presentHUDViewTimer;
}

- (void)setPresentHUDViewTimer:(id)a3
{
}

- (ASTButtonCell)cellForPresentedHUDView
{
  return self->_cellForPresentedHUDView;
}

- (void)setCellForPresentedHUDView:(id)a3
{
}

- (BOOL)shouldDelayBeforePresentingHUDView
{
  return self->_shouldDelayBeforePresentingHUDView;
}

- (void)setShouldDelayBeforePresentingHUDView:(BOOL)a3
{
  self->_shouldDelayBeforePresentingHUDView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellForPresentedHUDView, 0);
  objc_storeStrong((id *)&self->_presentHUDViewTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_popoverAvailableIcons, 0);
  objc_storeStrong((id *)&self->_buttonCells, 0);
  objc_storeStrong((id *)&self->_layoutView, 0);
  objc_storeStrong((id *)&self->_downCell, 0);
  objc_storeStrong((id *)&self->_astBundle, 0);

  objc_storeStrong((id *)&self->_astBackgroundView, 0);
}

@end