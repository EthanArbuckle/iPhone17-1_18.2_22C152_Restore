@interface CAMFullscreenModeSelector
- (CAMFullscreenModeSelector)init;
- (CAMFullscreenModeSelectorDataSource)dataSource;
- (CAMFullscreenModeSelectorDelegate)delegate;
- (CGPoint)_touchBeganPosition;
- (NSArray)_modes;
- (NSDictionary)_titleViewsByMode;
- (UIView)_titleContainer;
- (double)_titleIndexOffset;
- (double)_titleYForIndex:(int64_t)a3;
- (double)_touchBeganTime;
- (id)_modeTitleForLegacyTitle:(id)a3;
- (int64_t)_highlightedIndex;
- (int64_t)_state;
- (int64_t)_titleIndexForY:(double)a3;
- (int64_t)selectedMode;
- (void)_selectModeAtIndex:(int64_t)a3;
- (void)_setHighlightedIndex:(int64_t)a3;
- (void)_setItems:(id)a3;
- (void)_setModes:(id)a3;
- (void)_setSelectedMode:(int64_t)a3 shouldNotify:(BOOL)a4;
- (void)_setState:(int64_t)a3;
- (void)_setTouchBeganPosition:(CGPoint)a3;
- (void)_setTouchBeganTime:(double)a3;
- (void)_touchSequenceBeganAtPoint:(CGPoint)a3;
- (void)_touchSequenceChangedToPoint:(CGPoint)a3;
- (void)_touchSequenceEndedAtPoint:(CGPoint)a3;
- (void)_updateAlpha;
- (void)_updateTitles;
- (void)enterTappableState;
- (void)handlePress:(id)a3;
- (void)layoutSubviews;
- (void)reloadData;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedMode:(int64_t)a3;
@end

@implementation CAMFullscreenModeSelector

- (CAMFullscreenModeSelector)init
{
  v9.receiver = self;
  v9.super_class = (Class)CAMFullscreenModeSelector;
  v2 = [(CAMFullscreenModeSelector *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
    [(CAMFullscreenModeSelector *)v2 setBackgroundColor:v3];

    [(CAMFullscreenModeSelector *)v2 setAlpha:0.0];
    id v4 = objc_alloc(MEMORY[0x263F82E00]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    titleContainer = v2->__titleContainer;
    v2->__titleContainer = (UIView *)v5;

    [(CAMFullscreenModeSelector *)v2 addSubview:v2->__titleContainer];
    v7 = v2;
  }

  return v2;
}

- (void)reloadData
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = [(CAMFullscreenModeSelector *)self dataSource];
  id v4 = [(CAMFullscreenModeSelector *)self _titleViewsByMode];
  uint64_t v5 = [v4 allValues];

  [v5 makeObjectsPerformSelector:sel_removeFromSuperview];
  if (v3)
  {
    v6 = [v3 modesForModeSelector:self];
    [(CAMFullscreenModeSelector *)self _setModes:v6];
    uint64_t v7 = [(CAMFullscreenModeSelector *)self selectedMode];
    v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMFullscreenModeSelector selectedMode](self, "selectedMode"));
    char v9 = [v6 containsObject:v8];

    v25 = v5;
    if ((v9 & 1) == 0)
    {
      if (([v6 containsObject:&unk_26BDDE328] & 1) != 0 || !objc_msgSend(v6, "count"))
      {
        uint64_t v7 = 0;
      }
      else
      {
        v10 = [v6 firstObject];
        uint64_t v7 = [v10 integerValue];
      }
    }
    [(CAMFullscreenModeSelector *)self setSelectedMode:v7];
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v6;
    uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      double v15 = *MEMORY[0x263F001A8];
      double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v17 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v18 = *(double *)(MEMORY[0x263F001A8] + 24);
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v21 = [v20 integerValue];
          v22 = -[CAMModeSelectTitleView initWithFrame:]([CAMModeSelectTitleView alloc], "initWithFrame:", v15, v16, v17, v18);
          v23 = objc_msgSend(NSString, "cam_localizedTitleForMode:wantsCompactTitle:", v21, 0);
          v24 = [(CAMFullscreenModeSelector *)self _modeTitleForLegacyTitle:v23];
          [(CAMModeSelectTitleView *)v22 setText:v24];
          [(UIView *)self->__titleContainer addSubview:v22];
          [v11 setObject:v22 forKey:v20];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }

    [(CAMFullscreenModeSelector *)self _setItems:v11];
    [(CAMFullscreenModeSelector *)self _updateTitles];

    uint64_t v5 = v25;
  }
}

- (void)_setHighlightedIndex:(int64_t)a3
{
  if (self->__highlightedIndex != a3)
  {
    self->__highlightedIndex = a3;
    [(CAMFullscreenModeSelector *)self _updateTitles];
  }
}

- (void)_setState:(int64_t)a3
{
  if (self->__state != a3)
  {
    self->__state = a3;
    if (a3 == 2) {
      [(CAMFullscreenModeSelector *)self _setHighlightedIndex:-1];
    }
    [(CAMFullscreenModeSelector *)self _updateAlpha];
    [(CAMFullscreenModeSelector *)self _updateTitles];
  }
}

- (void)enterTappableState
{
}

- (void)_selectModeAtIndex:(int64_t)a3
{
  uint64_t v5 = [(CAMFullscreenModeSelector *)self _modes];
  v6 = [v5 objectAtIndexedSubscript:a3];
  uint64_t v7 = [v6 integerValue];

  [(CAMFullscreenModeSelector *)self _setSelectedMode:v7 shouldNotify:1];
}

- (void)setSelectedMode:(int64_t)a3
{
}

- (void)_setSelectedMode:(int64_t)a3 shouldNotify:(BOOL)a4
{
  if (self->_selectedMode != a3)
  {
    self->_selectedMode = a3;
    if (a4)
    {
      id v5 = [(CAMFullscreenModeSelector *)self delegate];
      [v5 didSelectMode:a3];
    }
  }
}

- (double)_titleIndexOffset
{
  v2 = [(CAMFullscreenModeSelector *)self _modes];
  double v3 = -floor(((double)(unint64_t)[v2 count] + -1.0) * 0.5);

  return v3;
}

- (int64_t)_titleIndexForY:(double)a3
{
  [(CAMFullscreenModeSelector *)self bounds];
  double v5 = floor((a3 - CGRectGetMidY(v11)) / 78.0);
  [(CAMFullscreenModeSelector *)self _titleIndexOffset];
  unint64_t v7 = (uint64_t)(v5 - v6);
  if ((v7 & 0x8000000000000000) != 0) {
    return -1;
  }
  v8 = [(CAMFullscreenModeSelector *)self _modes];
  BOOL v9 = [v8 count] > v7;

  if (v9) {
    return v7;
  }
  else {
    return -1;
  }
}

- (double)_titleYForIndex:(int64_t)a3
{
  [(CAMFullscreenModeSelector *)self bounds];
  double MidY = CGRectGetMidY(v8);
  [(CAMFullscreenModeSelector *)self _titleIndexOffset];
  return MidY + (v6 + (double)a3) * 78.0;
}

- (void)handlePress:(id)a3
{
  id v4 = a3;
  [v4 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 state];

  if ((unint64_t)(v9 - 3) >= 3)
  {
    if (v9 == 2)
    {
      -[CAMFullscreenModeSelector _touchSequenceChangedToPoint:](self, "_touchSequenceChangedToPoint:", v6, v8);
    }
    else if (v9 == 1)
    {
      -[CAMFullscreenModeSelector _touchSequenceBeganAtPoint:](self, "_touchSequenceBeganAtPoint:", v6, v8);
    }
  }
  else
  {
    -[CAMFullscreenModeSelector _touchSequenceEndedAtPoint:](self, "_touchSequenceEndedAtPoint:", v6, v8);
  }
}

- (void)_touchSequenceBeganAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CAMFullscreenModeSelector *)self _setTouchBeganTime:CFAbsoluteTimeGetCurrent()];
  -[CAMFullscreenModeSelector _setTouchBeganPosition:](self, "_setTouchBeganPosition:", x, y);
  int64_t v6 = [(CAMFullscreenModeSelector *)self _state];
  if (v6 == 2)
  {
    int64_t v8 = [(CAMFullscreenModeSelector *)self _titleIndexForY:y];
    [(CAMFullscreenModeSelector *)self _setHighlightedIndex:v8];
  }
  else if (v6 == 1)
  {
    double v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CAMFullscreenModeSelector _touchSequenceBeganAtPoint:](v7);
    }
  }
}

- (void)_touchSequenceChangedToPoint:(CGPoint)a3
{
  double y = a3.y;
  double Current = CFAbsoluteTimeGetCurrent();
  [(CAMFullscreenModeSelector *)self _touchBeganTime];
  double v7 = Current - v6;
  [(CAMFullscreenModeSelector *)self _touchBeganPosition];
  double v9 = y - v8;
  int64_t v10 = [(CAMFullscreenModeSelector *)self _state];
  switch(v10)
  {
    case 2:
      if (v9 / 60.0 > 1.0 && v7 < 0.5)
      {
        uint64_t v12 = self;
        uint64_t v13 = 0;
        goto LABEL_19;
      }
      break;
    case 1:
      [(CAMFullscreenModeSelector *)self _setHighlightedIndex:[(CAMFullscreenModeSelector *)self _titleIndexForY:y]];
      [(CAMFullscreenModeSelector *)self _updateTitles];
      break;
    case 0:
      [(CAMFullscreenModeSelector *)self setAlpha:v9 / -60.0];
      if (v9 / -60.0 > 1.0 || (v9 / -60.0 > 0.1 ? (BOOL v11 = v7 <= 0.5) : (BOOL v11 = 1), !v11))
      {
        uint64_t v12 = self;
        uint64_t v13 = 1;
LABEL_19:
        [(CAMFullscreenModeSelector *)v12 _setState:v13];
      }
      break;
  }
}

- (void)_touchSequenceEndedAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double Current = CFAbsoluteTimeGetCurrent();
  [(CAMFullscreenModeSelector *)self _touchBeganTime];
  double v7 = v6;
  [(CAMFullscreenModeSelector *)self _touchBeganPosition];
  double v9 = v8;
  int64_t v10 = [(CAMFullscreenModeSelector *)self _state];
  if (v10 == 2)
  {
    if ([(CAMFullscreenModeSelector *)self _highlightedIndex] == -1) {
      goto LABEL_13;
    }
  }
  else
  {
    if (v10 != 1)
    {
      if (v10) {
        return;
      }
      if ((y - v9) / -60.0 <= 1.0)
      {
        [(CAMFullscreenModeSelector *)self _updateAlpha];
        return;
      }
      goto LABEL_14;
    }
    if (Current - v7 <= 0.5
      || [(CAMFullscreenModeSelector *)self _highlightedIndex] == -1)
    {
LABEL_14:
      BOOL v11 = self;
      uint64_t v12 = 2;
      goto LABEL_15;
    }
  }
  [(CAMFullscreenModeSelector *)self _selectModeAtIndex:[(CAMFullscreenModeSelector *)self _highlightedIndex]];
LABEL_13:
  BOOL v11 = self;
  uint64_t v12 = 0;
LABEL_15:
  [(CAMFullscreenModeSelector *)v11 _setState:v12];
}

- (id)_modeTitleForLegacyTitle:(id)a3
{
  double v3 = [a3 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26BD78BA0];
  id v4 = objc_msgSend(v3, "cam_capitalizedStringWithPreferredLocale");

  return v4;
}

- (void)_updateTitles
{
  double v3 = [(CAMFullscreenModeSelector *)self _modes];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__CAMFullscreenModeSelector__updateTitles__block_invoke;
  v4[3] = &unk_263FA33C8;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

void __42__CAMFullscreenModeSelector__updateTitles__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a2;
  double v7 = [v5 _titleViewsByMode];
  double v8 = [v7 objectForKeyedSubscript:v6];

  uint64_t v9 = [*(id *)(a1 + 32) _highlightedIndex];
  uint64_t v10 = [v6 integerValue];

  uint64_t v11 = [*(id *)(a1 + 32) selectedMode];
  uint64_t v12 = [*(id *)(a1 + 32) _state];
  switch(v12)
  {
    case 2:
      if (v10 == v11) {
        [MEMORY[0x263F825C8] systemYellowColor];
      }
      else {
      double v17 = [MEMORY[0x263F825C8] whiteColor];
      }
      [v8 setTextColor:v17];

      if (v9 == a3)
      {
        CGAffineTransformMakeScale(&v20, 0.95, 0.95);
      }
      else
      {
        long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
        *(_OWORD *)&v20.a = *MEMORY[0x263F000D0];
        *(_OWORD *)&v20.c = v18;
        *(_OWORD *)&v20.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      }
      CGAffineTransform v19 = v20;
      double v16 = &v19;
      goto LABEL_16;
    case 1:
      if (v9 == a3) {
        [MEMORY[0x263F825C8] systemYellowColor];
      }
      else {
      uint64_t v14 = [MEMORY[0x263F825C8] whiteColor];
      }
      [v8 setTextColor:v14];

      long long v15 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      v21[0] = *MEMORY[0x263F000D0];
      v21[1] = v15;
      v21[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      double v16 = (CGAffineTransform *)v21;
LABEL_16:
      objc_msgSend(v8, "setTransform:", v16, *(_OWORD *)&v19.a, *(_OWORD *)&v19.c, *(_OWORD *)&v19.tx);
      double v13 = 1.0;
      goto LABEL_17;
    case 0:
      double v13 = 0.0;
LABEL_17:
      [v8 setAlpha:v13];
      break;
  }
}

- (void)_updateAlpha
{
  unint64_t v3 = [(CAMFullscreenModeSelector *)self _state];
  if (v3 <= 2)
  {
    double v4 = dbl_209C79970[v3];
    [(CAMFullscreenModeSelector *)self setAlpha:v4];
  }
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)CAMFullscreenModeSelector;
  [(CAMFullscreenModeSelector *)&v21 layoutSubviews];
  [(CAMFullscreenModeSelector *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(CAMFullscreenModeSelector *)self _modes];
  uint64_t v12 = [(CAMFullscreenModeSelector *)self _titleViewsByMode];
  -[UIView setFrame:](self->__titleContainer, "setFrame:", v4, v6, v8, v10);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__CAMFullscreenModeSelector_layoutSubviews__block_invoke;
  v14[3] = &unk_263FA33F0;
  double v17 = v4;
  double v18 = v6;
  double v19 = v8;
  double v20 = v10;
  id v15 = v12;
  double v16 = self;
  id v13 = v12;
  [v11 enumerateObjectsUsingBlock:v14];
}

void __43__CAMFullscreenModeSelector_layoutSubviews__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  CGRectGetWidth(*(CGRect *)(a1 + 48));
  [*(id *)(a1 + 40) _titleYForIndex:a3];
  double v5 = [*(id *)(a1 + 40) traitCollection];
  [v5 displayScale];
  UIRectIntegralWithScale();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
}

- (CAMFullscreenModeSelectorDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = (CAMFullscreenModeSelectorDataSource *)a3;
}

- (CAMFullscreenModeSelectorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CAMFullscreenModeSelectorDelegate *)a3;
}

- (int64_t)selectedMode
{
  return self->_selectedMode;
}

- (NSArray)_modes
{
  return self->__modes;
}

- (void)_setModes:(id)a3
{
}

- (NSDictionary)_titleViewsByMode
{
  return self->__titleViewsByMode;
}

- (void)_setItems:(id)a3
{
}

- (UIView)_titleContainer
{
  return self->__titleContainer;
}

- (int64_t)_state
{
  return self->__state;
}

- (double)_touchBeganTime
{
  return self->__touchBeganTime;
}

- (void)_setTouchBeganTime:(double)a3
{
  self->__touchBeganTime = a3;
}

- (CGPoint)_touchBeganPosition
{
  double x = self->__touchBeganPosition.x;
  double y = self->__touchBeganPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setTouchBeganPosition:(CGPoint)a3
{
  self->__touchBeganPosition = a3;
}

- (int64_t)_highlightedIndex
{
  return self->__highlightedIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__titleContainer, 0);
  objc_storeStrong((id *)&self->__titleViewsByMode, 0);
  objc_storeStrong((id *)&self->__modes, 0);
}

- (void)_touchSequenceBeganAtPoint:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "CAMModeSelectView cannot already be in draggable mode when a touch starts", v1, 2u);
}

@end