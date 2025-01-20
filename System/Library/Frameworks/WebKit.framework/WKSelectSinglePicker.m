@interface WKSelectSinglePicker
- (WKSelectSinglePicker)initWithView:(id)a3;
- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)controlEndEditing;
- (void)dealloc;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)selectRow:(int64_t)a3 inComponent:(int64_t)a4 extendingSelection:(BOOL)a5;
@end

@implementation WKSelectSinglePicker

- (WKSelectSinglePicker)initWithView:(id)a3
{
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v14.receiver = self;
  v14.super_class = (Class)WKSelectSinglePicker;
  v8 = -[WKSelectSinglePicker initWithFrame:](&v14, sel_initWithFrame_, v4, v5, v6, v7);
  v9 = v8;
  if (!v8) {
    return v9;
  }
  v8->_view = (WKContentView *)a3;
  [(WKSelectSinglePicker *)v8 setDelegate:v8];
  [(WKSelectSinglePicker *)v9 setDataSource:v9];
  [(WKSelectSinglePicker *)v9 setAutoresizingMask:18];
  v9->_int64_t selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
  if (!*(_DWORD *)([a3 focusedSelectElementOptions] + 12))
  {
LABEL_9:
    [(WKSelectSinglePicker *)v9 reloadAllComponents];
    int64_t selectedIndex = v9->_selectedIndex;
    if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL) {
      [(WKSelectSinglePicker *)v9 selectRow:selectedIndex inComponent:0 animated:0];
    }
    return v9;
  }
  unint64_t v10 = 0;
  uint64_t v11 = 9;
  while (1)
  {
    result = [(WKContentView *)v9->_view focusedSelectElementOptions];
    if (v10 >= *((unsigned int *)&result->super.super.super._responderFlags + 1)) {
      break;
    }
    if (*((unsigned char *)result->super.super.super.super.isa + v11))
    {
      v9->_int64_t selectedIndex = v10;
      goto LABEL_9;
    }
    ++v10;
    v11 += 16;
    if (v10 >= *(unsigned int *)([a3 focusedSelectElementOptions] + 12)) {
      goto LABEL_9;
    }
  }
  __break(0xC471u);
  return result;
}

- (void)dealloc
{
  [(WKSelectSinglePicker *)self setDelegate:0];
  [(WKSelectSinglePicker *)self setDataSource:0];
  v3.receiver = self;
  v3.super_class = (Class)WKSelectSinglePicker;
  [(WKSelectSinglePicker *)&v3 dealloc];
}

- (void)controlEndEditing
{
  int64_t selectedIndex = self->_selectedIndex;
  if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL
    && selectedIndex < *(unsigned int *)([(WKContentView *)self->_view focusedSelectElementOptions]+ 12))
  {
    double v4 = [(WKContentView *)self->_view focusedSelectElementOptions];
    unint64_t v5 = self->_selectedIndex;
    if (v5 >= v4[3])
    {
      __break(0xC471u);
    }
    else
    {
      *(unsigned char *)(*(void *)v4 + 16 * v5 + 9) = 1;
      view = self->_view;
      -[WKContentView updateFocusedElementSelectedIndex:allowsMultipleSelection:](view, "updateFocusedElementSelectedIndex:allowsMultipleSelection:");
    }
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return *(unsigned int *)([(WKContentView *)self->_view focusedElementInformation]
                         + 212);
}

- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  if (a4 < 0
    || *(unsigned int *)([(WKContentView *)self->_view focusedSelectElementOptions]
                       + 12) <= (unint64_t)a4)
  {
    return 0;
  }
  id result = [(WKContentView *)self->_view focusedSelectElementOptions];
  if (*((unsigned int *)result + 3) > (unint64_t)a4)
  {
    uint64_t v8 = *(void *)result;
    if (*(void *)(*(void *)result + 16 * a4)) {
      v9 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      v9 = &stru_1EEA10550;
    }
    unint64_t v10 = (__CFString *)[(__CFString *)v9 mutableCopy];
    CFStringTrimWhitespace(v10);
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v10];
    if (*(unsigned char *)(v8 + 16 * a4 + 10))
    {
      uint64_t v12 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.300000012];
      uint64_t v13 = [(__CFString *)v10 length];
      objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E4F42510], v12, 0, v13);
    }
    CFTypeRef v14 = (id)CFMakeCollectable(v11);
    if (v10) {
      CFRelease(v10);
    }
    return (id)v14;
  }
  __break(0xC471u);
  return result;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  if ((a4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4;
    if (*(unsigned int *)([(WKContentView *)self->_view focusedSelectElementOptions]
                         + 12) > (unint64_t)a4)
    {
      double v7 = [(WKContentView *)self->_view focusedSelectElementOptions];
      if (v7[3] <= v5)
      {
LABEL_19:
        __break(0xC471u);
        JUMPOUT(0x198DD5134);
      }
      if (*(unsigned char *)(*(void *)v7 + 16 * v5 + 10))
      {
        uint64_t v8 = 16 * v5 - 6;
        uint64_t v9 = v5;
        while (v9 > 0)
        {
          --v9;
          unint64_t v10 = [(WKContentView *)self->_view focusedSelectElementOptions];
          if (v9 >= (unint64_t)v10[3]) {
            goto LABEL_19;
          }
          int v11 = *(unsigned __int8 *)(*(void *)v10 + v8);
          v8 -= 16;
          if (!v11)
          {
LABEL_14:
            [(WKSelectSinglePicker *)self selectRow:v9 inComponent:0 animated:1];
            unint64_t v5 = v9;
            goto LABEL_15;
          }
        }
        uint64_t v12 = 16 * v5 + 26;
        uint64_t v9 = v5;
        while (++v9 < (unint64_t)*(unsigned int *)([(WKContentView *)self->_view focusedSelectElementOptions]+ 12))
        {
          uint64_t v13 = [(WKContentView *)self->_view focusedSelectElementOptions];
          if (v9 >= (unint64_t)v13[3])
          {
            __break(0xC471u);
            JUMPOUT(0x198DD513CLL);
          }
          int v14 = *(unsigned __int8 *)(*(void *)v13 + v12);
          v12 += 16;
          if (!v14) {
            goto LABEL_14;
          }
        }
      }
      else
      {
LABEL_15:
        self->_int64_t selectedIndex = v5;
      }
    }
  }
}

- (void)selectRow:(int64_t)a3 inComponent:(int64_t)a4 extendingSelection:(BOOL)a5
{
  [(WKSelectSinglePicker *)self selectRow:a3 inComponent:0 animated:0];
  double v7 = (void *)[(WKSelectSinglePicker *)self delegate];

  [v7 pickerView:self didSelectRow:a3 inComponent:0];
}

@end