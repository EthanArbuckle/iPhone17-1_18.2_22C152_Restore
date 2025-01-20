@interface WKMultipleSelectPicker
- (BOOL)selectFormAccessoryHasCheckedItemAtRow:(int64_t)a3;
- (WKMultipleSelectPicker)initWithView:(id)a3;
- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6;
- (int64_t)findItemIndexAt:(int)a3;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)pickerView:(id)a3 row:(int)a4 column:(int)a5 checked:(BOOL)a6;
- (void)selectRow:(int64_t)a3 inComponent:(int64_t)a4 extendingSelection:(BOOL)a5;
@end

@implementation WKMultipleSelectPicker

- (WKMultipleSelectPicker)initWithView:(id)a3
{
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v21.receiver = self;
  v21.super_class = (Class)WKMultipleSelectPicker;
  v8 = -[WKMultipleSelectPicker initWithFrame:](&v21, sel_initWithFrame_, v4, v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_view = (WKContentView *)a3;
    v8->_allowsMultipleSelection = *(unsigned char *)([a3 focusedElementInformation] + 178);
    v9->_singleSelectionIndex = 0x7FFFFFFFFFFFFFFFLL;
    [(WKMultipleSelectPicker *)v9 setAutoresizingMask:18];
    [(WKMultipleSelectPicker *)v9 setDataSource:v9];
    [(WKMultipleSelectPicker *)v9 setDelegate:v9];
    [(WKMultipleSelectPicker *)v9 _setUsesCheckedSelection:1];
    [(WKMultipleSelectPicker *)v9 _setMagnifierEnabled:0];
    v9->_textAlignment = 0;
    [(WKMultipleSelectPicker *)v9 setAllowsMultipleSelection:v9->_allowsMultipleSelection];
    [(WKMultipleSelectPicker *)v9 frame];
    double v11 = v10;
    double v13 = v12;
    [a3 sizeForLegacyFormControlPickerViews];
    -[WKMultipleSelectPicker setFrame:](v9, "setFrame:", v11, v13, v14, v15);
    [(WKMultipleSelectPicker *)v9 reloadAllComponents];
    if (!v9->_allowsMultipleSelection)
    {
      uint64_t v16 = [(WKContentView *)v9->_view focusedSelectElementOptions];
      uint64_t v17 = *(unsigned int *)(v16 + 12);
      if (v17)
      {
        unint64_t v18 = 0;
        for (i = (unsigned char *)(*(void *)v16 + 9); *(i - 1) || !*i; i += 16)
        {
          if (v17 == ++v18) {
            return v9;
          }
        }
        v9->_singleSelectionIndex = v18;
        -[WKMultipleSelectPicker selectRow:inComponent:animated:](v9, "selectRow:inComponent:animated:");
      }
    }
  }
  return v9;
}

- (void)dealloc
{
  [(WKMultipleSelectPicker *)self setDataSource:0];
  [(WKMultipleSelectPicker *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)WKMultipleSelectPicker;
  [(WKMultipleSelectPicker *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)WKMultipleSelectPicker;
  [(WKMultipleSelectPicker *)&v7 layoutSubviews];
  unint64_t singleSelectionIndex = self->_singleSelectionIndex;
  if (singleSelectionIndex != 0x7FFFFFFFFFFFFFFFLL) {
    [(WKMultipleSelectPicker *)self selectRow:singleSelectionIndex inComponent:0 animated:0];
  }
  double layoutWidth = self->_layoutWidth;
  [(WKMultipleSelectPicker *)self frame];
  if (layoutWidth != v5)
  {
    [(WKMultipleSelectPicker *)self reloadAllComponents];
    [(WKMultipleSelectPicker *)self frame];
    self->_double layoutWidth = v6;
  }
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id result = [(WKContentView *)self->_view focusedSelectElementOptions];
  if (*((unsigned int *)result + 3) <= (unint64_t)a4)
  {
    __break(0xC471u);
  }
  else
  {
    int64_t v10 = *(void *)result + 16 * a4;
    double v11 = off_1E580FE18;
    if (*(unsigned char *)(v10 + 8)) {
      double v11 = off_1E580FE10;
    }
    double v12 = (void *)[objc_alloc(*v11) initWithOptionItem:v10];
    double v13 = (void *)[a3 tableViewForColumn:0];
    objc_msgSend(v13, "rectForRowAtIndexPath:", objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", a4, 0));
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    objc_msgSend(v12, "setFrame:");
    v22 = (void *)[v12 titleLabel];
    v30.origin.x = v15;
    v30.origin.y = v17;
    v30.size.width = v19;
    v30.size.height = v21;
    double Width = CGRectGetWidth(v30);
    v31.origin.x = v15;
    v31.origin.y = v17;
    v31.size.width = v19;
    v31.size.height = v21;
    objc_msgSend(v12, "labelWidthForBounds:", 0.0, 0.0, Width, CGRectGetHeight(v31));
    double v25 = v24;
    v26 = (void *)[v22 font];
    float v27 = v25;
    double v28 = v27;
    if (self->_maximumTextWidth != v27 || self->_fontSize == 0.0)
    {
      self->_maximumTextdouble Width = v28;
      objc_msgSend((id)objc_msgSend(v22, "font"), "pointSize");
      self->_fontSize = adjustedFontSize((uint64_t)v26, (uint64_t)[(WKContentView *)self->_view focusedSelectElementOptions], v28, v29);
    }
    objc_msgSend(v22, "setFont:", objc_msgSend(v26, "fontWithSize:"));
    [v22 setLineBreakMode:0];
    [v22 setNumberOfLines:2];
    [v22 setTextAlignment:self->_textAlignment];
    return (id)(id)CFMakeCollectable(v12);
  }
  return result;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return *(unsigned int *)([(WKContentView *)self->_view focusedSelectElementOptions]+ 12);
}

- (int64_t)findItemIndexAt:(int)a3
{
  if (a3 < 1)
  {
    return 0;
  }
  else
  {
    unint64_t v4 = 0;
    int64_t v5 = 0;
    uint64_t v6 = a3;
    for (uint64_t i = 8; ; i += 16)
    {
      int64_t result = [(WKContentView *)self->_view focusedSelectElementOptions];
      if (v4 >= *(unsigned int *)(result + 12)) {
        break;
      }
      if (!*(unsigned char *)(*(void *)result + i)) {
        ++v5;
      }
      if (v6 == ++v4) {
        return v5;
      }
    }
    __break(0xC471u);
  }
  return result;
}

- (void)pickerView:(id)a3 row:(int)a4 column:(int)a5 checked:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a4;
  unint64_t v10 = *(unsigned int *)([(WKContentView *)self->_view focusedSelectElementOptions]
                        + 12);
  if (v10 > (int)v8)
  {
    double v11 = [(WKContentView *)self->_view focusedSelectElementOptions];
    if (v11[3] <= (unint64_t)(int)v8) {
      goto LABEL_18;
    }
    uint64_t v12 = *(void *)v11;
    uint64_t v13 = *(void *)v11 + 16 * (int)v8;
    int v15 = *(unsigned __int8 *)(v13 + 8);
    double v14 = (unsigned char *)(v13 + 8);
    if (v15 | v14[2])
    {
      double v16 = (void *)[(WKMultipleSelectPicker *)self viewForRow:(int)v8 forComponent:a5];
      [v16 setChecked:0];
      CGFloat v17 = (void *)[v16 titleLabel];
      double v18 = 0.5;
      if (!*v14) {
        double v18 = 0.300000012;
      }
      uint64_t v19 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:v18];
      [v17 setTextColor:v19];
    }
    else
    {
      if ([(WKMultipleSelectPicker *)self allowsMultipleSelection])
      {
        [(WKContentView *)self->_view updateFocusedElementSelectedIndex:[(WKMultipleSelectPicker *)self findItemIndexAt:v8] allowsMultipleSelection:1];
        *(unsigned char *)(v12 + 16 * (int)v8 + 9) = v6;
        return;
      }
      if (v6)
      {
        if (self->_singleSelectionIndex >= v10)
        {
LABEL_15:
          self->_unint64_t singleSelectionIndex = (int)v8;
          [(WKContentView *)self->_view updateFocusedElementSelectedIndex:[(WKMultipleSelectPicker *)self findItemIndexAt:v8] allowsMultipleSelection:0];
          *(unsigned char *)(v12 + 16 * (int)v8 + 9) = 1;
          return;
        }
        double v20 = [(WKContentView *)self->_view focusedSelectElementOptions];
        unint64_t singleSelectionIndex = self->_singleSelectionIndex;
        if (singleSelectionIndex < v20[3])
        {
          *(unsigned char *)(*(void *)v20 + 16 * singleSelectionIndex + 9) = 0;
          goto LABEL_15;
        }
LABEL_18:
        __break(0xC471u);
        JUMPOUT(0x198DD4B6CLL);
      }
      *(unsigned char *)(v12 + 16 * (int)v8 + 9) = 0;
    }
  }
}

- (void)selectRow:(int64_t)a3 inComponent:(int64_t)a4 extendingSelection:(BOOL)a5
{
  [(WKMultipleSelectPicker *)self selectRow:a3 inComponent:0 animated:0];

  [(WKMultipleSelectPicker *)self pickerView:self row:a3 column:0 checked:1];
}

- (BOOL)selectFormAccessoryHasCheckedItemAtRow:(int64_t)a3
{
  if ([(WKMultipleSelectPicker *)self numberOfRowsInComponent:0] <= a3) {
    return 0;
  }
  int64_t v5 = (void *)[(WKMultipleSelectPicker *)self viewForRow:a3 forComponent:0];

  return [v5 isChecked];
}

@end