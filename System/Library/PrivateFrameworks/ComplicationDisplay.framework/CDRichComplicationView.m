@interface CDRichComplicationView
- (BOOL)paused;
- (BOOL)viewShouldIgnoreTwoPieceImage:(id)a3;
- (CDComplicationDisplayObserver)displayObserver;
- (CDRichComplicationView)initWithFamily:(int64_t)a3;
- (CLKDevice)device;
- (CLKMonochromeFilterProvider)filterProvider;
- (NSDate)complicationDate;
- (NSDate)timeTravelDate;
- (UIColor)foregroundColor;
- (UIFontDescriptor)fontDescriptor;
- (double)fontSizeFactor;
- (id)_fontWithSize:(double)a3 withFontDescriptor:(id)a4;
- (id)backgroundColorForView:(id)a3;
- (id)colorForView:(id)a3 accented:(BOOL)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)filtersForView:(id)a3 style:(int64_t)a4;
- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)interpolatedColorForView:(id)a3;
- (int64_t)family;
- (int64_t)fontStyle;
- (int64_t)tritiumUpdateMode;
- (unint64_t)textLayoutStyle;
- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3;
- (void)_setWhistlerAnalogEditingAlphaTransitonFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5;
- (void)_updateColoringLabel:(id)a3 withFontDescriptor:(id)a4 andSizeFactor:(double)a5;
- (void)setDisplayObserver:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setFilterProvider:(id)a3;
- (void)setFontStyle:(int64_t)a3;
- (void)setForegroundColor:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setTextLayoutStyle:(unint64_t)a3;
- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CDRichComplicationView

- (CDRichComplicationView)initWithFamily:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CDRichComplicationView;
  v4 = -[CDRichComplicationView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v4)
  {
    v5 = [MEMORY[0x263EFD1F0] sharedRenderingContext];
    uint64_t v6 = [v5 device];
    device = v4->_device;
    v4->_device = (CLKDevice *)v6;

    v4->_family = a3;
    v4->_paused = 1;
    [(CDRichComplicationView *)v4 setUserInteractionEnabled:0];
  }
  return v4;
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    [(CDRichComplicationView *)self _applyPausedUpdate];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CDRichComplicationView;
  [(CDRichComplicationView *)&v4 traitCollectionDidChange:a3];
  [(CDRichComplicationView *)self setNeedsLayout];
}

- (void)_setWhistlerAnalogEditingAlphaTransitonFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5
{
  if (a5 == 1)
  {
    CLKCompressFraction();
    double v6 = v8;
  }
  else
  {
    double v6 = 0.0;
    if (!a5)
    {
      CLKCompressFraction();
      double v6 = 1.0 - v7;
    }
  }
  -[CDRichComplicationView setAlpha:](self, "setAlpha:", a4, v6);
}

- (int64_t)tritiumUpdateMode
{
  return 2;
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_timeTravelDate, a3);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__CDRichComplicationView_setTimeTravelDate_animated___block_invoke;
  v8[3] = &unk_2644A5438;
  id v9 = v6;
  id v7 = v6;
  [(CDRichComplicationView *)self _enumerateLabelsWithBlock:v8];
}

uint64_t __53__CDRichComplicationView_setTimeTravelDate_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setInTimeTravel:*(void *)(a1 + 32) != 0];
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    if (!a3)
    {
      [(CDRichComplicationView *)self setAlpha:1.0];
      [(CDRichComplicationView *)self _editingDidEnd];
      [(CDRichComplicationView *)self setNeedsLayout];
    }
  }
}

- (NSDate)complicationDate
{
  timeTravelDate = self->_timeTravelDate;
  if (timeTravelDate)
  {
    v3 = timeTravelDate;
  }
  else
  {
    v3 = [MEMORY[0x263EFD170] complicationDate];
  }
  return v3;
}

- (NSDate)timeTravelDate
{
  return self->_timeTravelDate;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  id v6 = [(CDRichComplicationView *)self filterProvider];
  id v7 = [v6 filtersForView:self style:a4];

  return v7;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  double v8 = [(CDRichComplicationView *)self filterProvider];
  id v9 = [v8 filtersForView:self style:a4 fraction:a5];

  return v9;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  double v8 = [(CDRichComplicationView *)self filterProvider];
  id v9 = [v8 filterForView:self style:a4 fraction:a5];

  return v9;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  id v6 = [(CDRichComplicationView *)self filterProvider];
  id v7 = [v6 filterForView:self style:a4];

  return v7;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CDRichComplicationView *)self filterProvider];
  double v8 = [v7 colorForView:v6 accented:v4];

  return v8;
}

- (id)interpolatedColorForView:(id)a3
{
  id v4 = a3;
  v5 = [(CDRichComplicationView *)self filterProvider];
  id v6 = [v5 interpolatedColorForView:v4];

  return v6;
}

- (id)backgroundColorForView:(id)a3
{
  id v4 = a3;
  v5 = [(CDRichComplicationView *)self filterProvider];
  id v6 = [v5 backgroundColorForView:v4];

  return v6;
}

- (BOOL)viewShouldIgnoreTwoPieceImage:(id)a3
{
  id v4 = [(CDRichComplicationView *)self filterProvider];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = [(CDRichComplicationView *)self filterProvider];
  char v7 = [v6 viewShouldIgnoreTwoPieceImage:self];

  return v7;
}

- (void)setFontStyle:(int64_t)a3
{
  if (self->_fontStyle != a3)
  {
    self->_fontStyle = a3;
    if (a3 == 3)
    {
      char v5 = CDRichComplicationSemiboldFontDescriptor();
    }
    else
    {
      if (a3 != 2)
      {
        BOOL v4 = a3 == 1;
        char v5 = 0;
        uint64_t v6 = 0;
LABEL_8:
        v8[0] = v4;
        id v7 = v5;
        id v9 = v7;
        uint64_t v10 = v6;
        [(CDRichComplicationView *)self _setFontConfiguration:v8];

        return;
      }
      char v5 = CDRichComplicationMonoFontDescriptor();
    }
    BOOL v4 = 0;
    uint64_t v6 = 0x3FF0000000000000;
    goto LABEL_8;
  }
}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  objc_storeStrong((id *)&self->_fontDescriptor, a3->var1);
  self->_fontSizeFactor = a3->var2;
  id var1 = a3->var1;
}

- (void)_updateColoringLabel:(id)a3 withFontDescriptor:(id)a4 andSizeFactor:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v9 font];
  [v10 pointSize];
  v12 = [(CDRichComplicationView *)self _fontWithSize:v8 withFontDescriptor:v11 * a5];

  [v9 setFont:v12];
  [(CDRichComplicationView *)self setNeedsLayout];
}

- (id)_fontWithSize:(double)a3 withFontDescriptor:(id)a4
{
  BOOL v4 = [MEMORY[0x263EFD198] fontWithDescriptor:a4 size:a3];
  char v5 = [v4 CLKFontWithAlternativePunctuation];

  return v5;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (CDComplicationDisplayObserver)displayObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->displayObserver);
  return (CDComplicationDisplayObserver *)WeakRetained;
}

- (void)setDisplayObserver:(id)a3
{
}

- (unint64_t)textLayoutStyle
{
  return self->textLayoutStyle;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  self->textLayoutStyle = a3;
}

- (CLKDevice)device
{
  return self->_device;
}

- (int64_t)family
{
  return self->_family;
}

- (BOOL)paused
{
  return self->_paused;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
}

- (int64_t)fontStyle
{
  return self->_fontStyle;
}

- (UIFontDescriptor)fontDescriptor
{
  return self->_fontDescriptor;
}

- (double)fontSizeFactor
{
  return self->_fontSizeFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontDescriptor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->displayObserver);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
}

@end