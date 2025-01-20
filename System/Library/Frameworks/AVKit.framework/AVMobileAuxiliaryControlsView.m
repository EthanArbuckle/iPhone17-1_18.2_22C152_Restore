@interface AVMobileAuxiliaryControlsView
- (AVMobileAuxiliaryControlsView)init;
- (AVMobileAuxiliaryControlsViewDelegate)delegate;
- (BOOL)_requiresOverflowControl;
- (BOOL)hasOverflowOnlyControl;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeFittingControls:(id)a3;
- (NSArray)controls;
- (double)avkit_extendedDynamicRangeGain;
- (double)controlSpacing;
- (id)_controlsWithViewsInPriorityOrder;
- (id)_overflowControl;
- (id)overflowMenuItemsForControlOverflowButton:(id)a3;
- (void)_updateHasOverflowOnlyControl;
- (void)_updateOverflowControlContextMenu;
- (void)_updatePriorityOrderControlsList;
- (void)_updateTintColorsForOverflowControlButton;
- (void)auxiliaryControlDidChangeState:(id)a3;
- (void)avkit_intrinsicContentSizeOfSubviewWasInvalidated:(id)a3;
- (void)buttonIsOverVideoDidChange:(id)a3;
- (void)layoutSubviews;
- (void)overflowButtonDidHideContextMenu:(id)a3;
- (void)overflowButtonWillShowContextMenu:(id)a3;
- (void)setAvkit_extendedDynamicRangeGain:(double)a3;
- (void)setControlSpacing:(double)a3;
- (void)setControls:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasOverflowOnlyControl:(BOOL)a3;
- (void)updateOverflowMenu;
@end

@implementation AVMobileAuxiliaryControlsView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_controls, 0);
  objc_storeStrong((id *)&self->_controlsInPriorityOrder, 0);

  objc_storeStrong((id *)&self->_overflowControl, 0);
}

- (void)setDelegate:(id)a3
{
}

- (AVMobileAuxiliaryControlsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMobileAuxiliaryControlsViewDelegate *)WeakRetained;
}

- (BOOL)hasOverflowOnlyControl
{
  return self->_hasOverflowOnlyControl;
}

- (double)controlSpacing
{
  return self->_controlSpacing;
}

- (NSArray)controls
{
  return self->_controls;
}

- (void)_updateTintColorsForOverflowControlButton
{
  overflowControl = self->_overflowControl;
  v4 = (void *)MEMORY[0x1E4FB1618];
  uint64_t v5 = [(AVButton *)overflowControl isButtonOverVideo];
  id v7 = [(AVMobileAuxiliaryControlsView *)self traitCollection];
  v6 = objc_msgSend(v4, "avkit_tintColorForControlElementIsOverVideo:withUserInterfaceStyle:", v5, objc_msgSend(v7, "userInterfaceStyle"));
  [(AVControlOverflowButton *)overflowControl setTintColor:v6];
}

- (void)_updatePriorityOrderControlsList
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"displayPriority" ascending:0];
  controls = self->_controls;
  v8[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v6 = [(NSArray *)controls sortedArrayUsingDescriptors:v5];
  controlsInPriorityOrder = self->_controlsInPriorityOrder;
  self->_controlsInPriorityOrder = v6;
}

- (void)_updateOverflowControlContextMenu
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __66__AVMobileAuxiliaryControlsView__updateOverflowControlContextMenu__block_invoke;
  v2[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __66__AVMobileAuxiliaryControlsView__updateOverflowControlContextMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[57] updateContextMenu];
    id WeakRetained = v2;
  }
}

- (void)_updateHasOverflowOnlyControl
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_controls;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "isIncluded", (void)v8)
          && ([v7 canOnlyAppearInOverflowMenu] & 1) != 0)
        {
          uint64_t v4 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  [(AVMobileAuxiliaryControlsView *)self setHasOverflowOnlyControl:v4];
}

- (BOOL)_requiresOverflowControl
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_hasOverflowOnlyControl) {
    return 1;
  }
  [(AVMobileAuxiliaryControlsView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v8 = self->_controls;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  uint64_t v10 = 0;
  if (v9)
  {
    uint64_t v11 = *(void *)v22;
    double v12 = 0.0;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v14, "isIncluded", (void)v21)
          && ([v14 canOnlyAppearInOverflowMenu] & 1) == 0)
        {
          v15 = [v14 controlView];
          [v15 intrinsicContentSize];
          double v17 = v16;
          double v19 = v18;

          if (v19 > v7)
          {
            LOBYTE(v9) = 1;
            goto LABEL_17;
          }
          double v12 = v12 + v17;
          ++v10;
        }
      }
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    double v12 = 0.0;
  }
LABEL_17:

  if (v10 <= 1) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = v10;
  }
  if (v12 + (double)(v20 - 1) * self->_controlSpacing > v5) {
    return 1;
  }
  else {
    return v9;
  }
}

- (id)_overflowControl
{
  overflowControl = self->_overflowControl;
  if (!overflowControl)
  {
    double v4 = +[AVControlOverflowButton secondGenerationButton];
    [(AVControlOverflowButton *)v4 setPointerInteractionEnabled:1];
    [(AVControlOverflowButton *)v4 setAutoresizingMask:0];
    double v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E4FB2998], *MEMORY[0x1E4FB09C8]);
    [(AVButton *)v4 setInlineFont:v5];

    double v6 = (void *)MEMORY[0x1E4FB1618];
    uint64_t v7 = [(AVButton *)v4 isButtonOverVideo];
    long long v8 = [(AVMobileAuxiliaryControlsView *)self traitCollection];
    uint64_t v9 = objc_msgSend(v6, "avkit_tintColorForControlElementIsOverVideo:withUserInterfaceStyle:", v7, objc_msgSend(v8, "userInterfaceStyle"));
    [(AVControlOverflowButton *)v4 setTintColor:v9];

    [(AVButton *)v4 setDelegate:self];
    [(AVControlOverflowButton *)v4 setHidden:1];
    uint64_t v10 = self->_overflowControl;
    self->_overflowControl = v4;
    uint64_t v11 = v4;

    [(AVMobileAuxiliaryControlsView *)self addSubview:self->_overflowControl];
    overflowControl = self->_overflowControl;
  }

  return overflowControl;
}

- (id)_controlsWithViewsInPriorityOrder
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_controls, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v4 = self->_controlsInPriorityOrder;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "canOnlyAppearInOverflowMenu", (void)v11) & 1) == 0) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)setHasOverflowOnlyControl:(BOOL)a3
{
  if (self->_hasOverflowOnlyControl != a3)
  {
    self->_hasOverflowOnlyControl = a3;
    [(AVMobileAuxiliaryControlsView *)self setNeedsLayout];
  }
}

- (void)avkit_intrinsicContentSizeOfSubviewWasInvalidated:(id)a3
{
  [(AVMobileAuxiliaryControlsView *)self setNeedsLayout];
  id v4 = [(AVMobileAuxiliaryControlsView *)self superview];
  objc_msgSend(v4, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);
}

- (void)setAvkit_extendedDynamicRangeGain:(double)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_extendedDynamicRangeGain != a3)
  {
    self->_extendedDynamicRangeGain = a3;
    if (([(AVControlOverflowButton *)self->_overflowControl isHidden] & 1) == 0) {
      [(UIView *)self->_overflowControl setAvkit_extendedDynamicRangeGain:self->_extendedDynamicRangeGain];
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = self->_controls;
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
          uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(v9, "controlView", (void)v13);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            long long v12 = [v9 controlView];
            objc_msgSend(v12, "setAvkit_extendedDynamicRangeGain:", self->_extendedDynamicRangeGain);
          }
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
}

- (double)avkit_extendedDynamicRangeGain
{
  return self->_extendedDynamicRangeGain;
}

- (void)layoutSubviews
{
  [(AVMobileAuxiliaryControlsView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  BOOL v7 = [(AVMobileAuxiliaryControlsView *)self _requiresOverflowControl];
  [(AVMobileAuxiliaryControlsView *)self intrinsicContentSize];
  if (v8 >= v6) {
    double v9 = v6;
  }
  else {
    double v9 = v8;
  }
  double v10 = v6 + v9 * -0.5;
  uint64_t v11 = [(AVMobileAuxiliaryControlsView *)self effectiveUserInterfaceLayoutDirection];
  long long v12 = [(AVMobileAuxiliaryControlsView *)self _controlsWithViewsInPriorityOrder];
  if (v7)
  {
    long long v13 = [(AVMobileAuxiliaryControlsView *)self _overflowControl];
    [v13 intrinsicContentSize];
    double v15 = v14;
    double v17 = v16;
    *(float *)&double v14 = v14;
    *(float *)&double v16 = v4;
    float v18 = vabds_f32(*(float *)&v14, *(float *)&v16);
    BOOL v19 = *(float *)&v14 < *(float *)&v16 || v18 < 0.00000011921;
    if (v19
      && ((float v20 = v17, v21 = v6, v22 = vabds_f32(v20, v21), v20 >= v21) ? (v23 = v22 < 0.00000011921) : (v23 = 1), v23))
    {
      double v4 = v4 - v15;
      -[UIView avkit_setFrame:inLayoutDirection:](self->_overflowControl, "avkit_setFrame:inLayoutDirection:", v11, v4, v10 + v17 * -0.5);
      uint64_t v24 = 0;
    }
    else
    {
      uint64_t v24 = 1;
    }
  }
  else
  {
    uint64_t v24 = 1;
  }
  overflowControl = self->_overflowControl;
  if (!overflowControl || v24 == [(AVControlOverflowButton *)overflowControl isHidden])
  {
    char v27 = 0;
    if ((v24 & 1) == 0)
    {
LABEL_24:
      double v28 = fmax(v4 - self->_controlSpacing, 0.0);
      goto LABEL_27;
    }
  }
  else
  {
    [(AVControlOverflowButton *)self->_overflowControl setHidden:v24];
    double extendedDynamicRangeGain = 0.0;
    if ((v24 & 1) == 0) {
      double extendedDynamicRangeGain = self->_extendedDynamicRangeGain;
    }
    [(UIView *)self->_overflowControl setAvkit_extendedDynamicRangeGain:extendedDynamicRangeGain];
    char v27 = 1;
    if ((v24 & 1) == 0) {
      goto LABEL_24;
    }
  }
  double v28 = v4;
  if (v7)
  {
LABEL_43:
    uint64_t v31 = -1;
    goto LABEL_45;
  }
LABEL_27:
  if (![v12 count]) {
    goto LABEL_43;
  }
  uint64_t v29 = 0;
  float v30 = v6;
  uint64_t v31 = -1;
  while (1)
  {
    v32 = [v12 objectAtIndex:v29];
    if ([v32 isIncluded]) {
      break;
    }
LABEL_41:

    if (++v29 >= (unint64_t)[v12 count]) {
      goto LABEL_45;
    }
  }
  v33 = [v32 controlView];
  [v33 intrinsicContentSize];
  float v36 = v34;
  float v37 = v28;
  float v38 = vabds_f32(v36, v37);
  if (v36 < v37 || v38 < 0.00000011921)
  {
    float v40 = v35;
    float v41 = vabds_f32(v40, v30);
    if (v40 < v30 || v41 < 0.00000011921)
    {
      double v28 = fmax(v28 - (v34 + self->_controlSpacing), 0.0);

      uint64_t v31 = v29;
      goto LABEL_41;
    }
  }

LABEL_45:
  uint64_t v43 = [v12 count];
  if (v43 - 1 >= 0)
  {
    uint64_t v44 = v43;
    char v45 = v24 ^ 1;
    while (1)
    {
      v46 = [v12 objectAtIndex:--v44];
      v47 = [v46 controlView];
      if (![v46 isIncluded]) {
        break;
      }
      [v47 intrinsicContentSize];
      if (v44 <= v31)
      {
        double v4 = v4 - v48;
        if (v45) {
          double v4 = v4 - self->_controlSpacing;
        }
        objc_msgSend(v47, "avkit_setFrame:inLayoutDirection:", v11, v4, v10 + v49 * -0.5, v48);
        if ([v47 isHidden])
        {
          uint64_t v50 = 0;
LABEL_56:
          char v45 = 1;
LABEL_57:
          [v47 setHidden:v50];
          goto LABEL_58;
        }
      }
      else if (![v47 isHidden])
      {
        uint64_t v50 = 1;
        goto LABEL_56;
      }
      char v45 = 1;
      if ((v27 & 1) == 0)
      {
        char v27 = 0;
        goto LABEL_59;
      }
LABEL_58:
      [(AVMobileAuxiliaryControlsView *)self _updateOverflowControlContextMenu];
      char v27 = 1;
LABEL_59:

      if (v44 <= 0) {
        goto LABEL_63;
      }
    }
    uint64_t v50 = 1;
    goto LABEL_57;
  }
LABEL_63:
  v51.receiver = self;
  v51.super_class = (Class)AVMobileAuxiliaryControlsView;
  [(AVView *)&v51 layoutSubviews];
}

- (CGSize)intrinsicContentSize
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_hasOverflowOnlyControl)
  {
    [(AVButton *)self->_overflowControl intrinsicContentSize];
    double v4 = fmax(v3, 0.0);
    double v6 = v5 + 0.0;
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
    double v6 = 0.0;
    double v4 = 0.0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v8 = self->_controls;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v13, "isIncluded", (void)v21)
          && ([v13 canOnlyAppearInOverflowMenu] & 1) == 0)
        {
          double v14 = [v13 controlView];
          [v14 intrinsicContentSize];
          double v16 = v15;
          double v18 = v17;

          if (v4 < v18) {
            double v4 = v18;
          }
          double v6 = v6 + v16;
          ++v7;
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  double v19 = v6 + (double)(unint64_t)(v7 - 1) * self->_controlSpacing;
  double v20 = v4;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)buttonIsOverVideoDidChange:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a3;
  uint64_t v6 = [v5 isButtonOverVideo];
  id v8 = [(AVMobileAuxiliaryControlsView *)self traitCollection];
  uint64_t v7 = objc_msgSend(v4, "avkit_tintColorForControlElementIsOverVideo:withUserInterfaceStyle:", v6, objc_msgSend(v8, "userInterfaceStyle"));
  [v5 setTintColor:v7];
}

- (id)overflowMenuItemsForControlOverflowButton:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_controls, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = self->_controlsInPriorityOrder;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v10 isIncluded])
        {
          char v11 = [v10 canOnlyAppearInOverflowMenu];
          if ((v11 & 1) == 0)
          {
            double v3 = [v10 controlView];
            long long v12 = v3;
            if (![v3 isHidden]) {
              goto LABEL_14;
            }
          }
          long long v13 = [(AVMobileAuxiliaryControlsView *)self delegate];
          char v14 = objc_opt_respondsToSelector();

          if ((v11 & 1) == 0) {
          if (v14)
          }
          {
            double v15 = [(AVMobileAuxiliaryControlsView *)self delegate];
            long long v12 = [v15 auxiliaryControlsView:self menuElementForControl:v10];

            if (v12) {
              [v18 addObject:v12];
            }
LABEL_14:

            continue;
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  return v18;
}

- (void)overflowButtonWillShowContextMenu:(id)a3
{
  id v4 = [(AVMobileAuxiliaryControlsView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 auxiliaryControlsViewWillBeginShowingOverflowMenu:self];
  }
}

- (void)overflowButtonDidHideContextMenu:(id)a3
{
  id v4 = [(AVMobileAuxiliaryControlsView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 auxiliaryControlsViewDidEndShowingOverflowMenu:self];
  }
}

- (void)auxiliaryControlDidChangeState:(id)a3
{
  [(AVMobileAuxiliaryControlsView *)self _updateHasOverflowOnlyControl];
  [(AVMobileAuxiliaryControlsView *)self setNeedsLayout];

  [(AVMobileAuxiliaryControlsView *)self updateOverflowMenu];
}

- (void)updateOverflowMenu
{
}

- (CGSize)sizeFittingControls:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  BOOL hasOverflowOnlyControl = self->_hasOverflowOnlyControl;
  double v7 = 0.0;
  if (!v4 || ![v4 count])
  {
    uint64_t v13 = 0;
    double v15 = 0.0;
    if (!hasOverflowOnlyControl) {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  BOOL v31 = hasOverflowOnlyControl;
  uint64_t v8 = self->_controlsInPriorityOrder;
  uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:v5];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v10 = v8;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v33;
    double v15 = 0.0;
LABEL_5:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v33 != v14) {
        objc_enumerationMutation(v10);
      }
      id v17 = *(void **)(*((void *)&v32 + 1) + 8 * v16);
      if ([v17 isIncluded] && (objc_msgSend(v17, "canOnlyAppearInOverflowMenu") & 1) == 0)
      {
        id v18 = [v17 controlView];
        [v18 intrinsicContentSize];
        double v20 = v19;
        double v22 = v21;

        double v15 = v15 + v20;
        if (v7 < v22) {
          double v7 = v22;
        }
        ++v13;
      }
      [v9 removeObject:v17];
      if (![v9 count]) {
        break;
      }
      if (v12 == ++v16)
      {
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v12) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
    double v15 = 0.0;
  }

  int v30 = v31 | (v13 < [(NSArray *)v10 count]);
  if (v30)
  {
LABEL_18:
    long long v23 = [(AVMobileAuxiliaryControlsView *)self _overflowControl];
    [v23 intrinsicContentSize];
    double v15 = v15 + v25;
    if (v7 < v24) {
      double v7 = v24;
    }
    ++v13;
  }
LABEL_21:
  if (v13 <= 1) {
    uint64_t v26 = 1;
  }
  else {
    uint64_t v26 = v13;
  }
  double controlSpacing = self->_controlSpacing;

  double v28 = v15 + controlSpacing * (double)(v26 - 1);
  double v29 = v7;
  result.height = v29;
  result.width = v28;
  return result;
}

- (void)setControlSpacing:(double)a3
{
  if (self->_controlSpacing != a3)
  {
    self->_double controlSpacing = a3;
    [(AVMobileAuxiliaryControlsView *)self setNeedsLayout];
  }
}

- (void)setControls:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = (NSArray *)a3;
  controls = self->_controls;
  if (controls != v5)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    double v7 = controls;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (![(NSArray *)v5 containsObject:v12])
          {
            [v12 setDelegate:0];
            if (([v12 canOnlyAppearInOverflowMenu] & 1) == 0)
            {
              uint64_t v13 = [v12 controlView];
              [v13 removeFromSuperview];
            }
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v9);
    }

    uint64_t v14 = self->_controls;
    objc_storeStrong((id *)&self->_controls, a3);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    double v25 = v5;
    double v15 = v5;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          double v20 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          double v21 = [v20 controlView];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            long long v23 = [v20 controlView];
            [v23 setPointerInteractionEnabled:1];
            objc_msgSend(v23, "setAvkit_extendedDynamicRangeGain:", self->_extendedDynamicRangeGain);
          }
          if (![(NSArray *)v14 containsObject:v20])
          {
            [v20 setDelegate:self];
            if (([v20 canOnlyAppearInOverflowMenu] & 1) == 0)
            {
              double v24 = [v20 controlView];
              [(AVMobileAuxiliaryControlsView *)self addSubview:v24];
            }
          }
        }
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v17);
    }

    [(AVMobileAuxiliaryControlsView *)self _updateHasOverflowOnlyControl];
    [(AVMobileAuxiliaryControlsView *)self _updatePriorityOrderControlsList];
    [(AVMobileAuxiliaryControlsView *)self updateOverflowMenu];
    [(AVMobileAuxiliaryControlsView *)self setNeedsLayout];

    id v5 = v25;
  }
}

- (AVMobileAuxiliaryControlsView)init
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)AVMobileAuxiliaryControlsView;
  v2 = -[AVView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v3 = v2;
  if (v2)
  {
    controls = v2->_controls;
    v2->_controls = (NSArray *)MEMORY[0x1E4F1CBF0];

    [(AVView *)v3 setIgnoresTouches:1];
    v9[0] = objc_opt_class();
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v6 = (id)[(AVMobileAuxiliaryControlsView *)v3 registerForTraitChanges:v5 withHandler:&__block_literal_global_14439];
  }
  return v3;
}

uint64_t __37__AVMobileAuxiliaryControlsView_init__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updateTintColorsForOverflowControlButton];
}

@end