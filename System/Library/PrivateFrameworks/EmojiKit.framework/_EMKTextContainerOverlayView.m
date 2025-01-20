@interface _EMKTextContainerOverlayView
- (BOOL)isOpaque;
- (EMKGlyphRippler)rippler;
- (EMKTextEnumerator)textEnumerator;
- (NSMutableArray)fragmentViews;
- (UITextView)textView;
- (_EMKTextContainerOverlayView)initWithFrame:(CGRect)a3 rippler:(id)a4;
- (id)_newFragmentViewForFragment:(id)a3;
- (unint64_t)timeIndex;
- (void)_layoutFragmentView:(id)a3;
- (void)layoutSubviews;
- (void)prepareWithTextView:(id)a3;
- (void)setFragmentViews:(id)a3;
- (void)setRippler:(id)a3;
- (void)setTextEnumerator:(id)a3;
- (void)setTextView:(id)a3;
- (void)setTimeIndex:(unint64_t)a3;
- (void)startAnimation;
- (void)updateAnimationAndGetFinished:(BOOL *)a3;
@end

@implementation _EMKTextContainerOverlayView

- (_EMKTextContainerOverlayView)initWithFrame:(CGRect)a3 rippler:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_EMKTextContainerOverlayView;
  v11 = -[_EMKTextContainerOverlayView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    textEnumerator = v11->_textEnumerator;
    v11->_textEnumerator = (EMKTextEnumerator *)v12;

    textView = v11->_textView;
    v11->_textView = 0;

    objc_storeStrong((id *)&v11->_rippler, a4);
    v11->_timeIndedouble x = 0;
    uint64_t v15 = objc_opt_new();
    fragmentViews = v11->_fragmentViews;
    v11->_fragmentViews = (NSMutableArray *)v15;

    [(_EMKTextContainerOverlayView *)v11 setUserInteractionEnabled:1];
    v17 = [(_EMKTextContainerOverlayView *)v11 layer];
    [v17 setMasksToBounds:1];

    [(_EMKTextContainerOverlayView *)v11 setClipsToBounds:1];
  }

  return v11;
}

- (void)layoutSubviews
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)_EMKTextContainerOverlayView;
  [(_EMKTextContainerOverlayView *)&v12 layoutSubviews];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = self->_fragmentViews;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[_EMKTextContainerOverlayView _layoutFragmentView:](self, "_layoutFragmentView:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)prepareWithTextView:(id)a3
{
  fragmentViews = self->_fragmentViews;
  id v5 = a3;
  [(NSMutableArray *)fragmentViews makeObjectsPerformSelector:sel_removeFromSuperview];
  uint64_t v6 = [(_EMKTextContainerOverlayView *)self fragmentViews];
  [v6 removeAllObjects];

  [(_EMKTextContainerOverlayView *)self setTextView:v5];
  uint64_t v7 = [(_EMKTextContainerOverlayView *)self textView];
  long long v8 = [v7 textLayoutManager];

  long long v9 = [v8 documentRange];
  long long v10 = [v9 location];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52___EMKTextContainerOverlayView_prepareWithTextView___block_invoke;
  v12[3] = &unk_1E6E96F08;
  v12[4] = self;
  id v11 = (id)[v8 enumerateTextLayoutFragmentsFromLocation:v10 options:4 usingBlock:v12];

  [(_EMKTextContainerOverlayView *)self setNeedsLayout];
}

- (void)startAnimation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(UITextView *)self->_textView textLayoutManager];
  uint64_t v4 = objc_msgSend(v3, "animatingGlyphCount_emk");

  if (v4)
  {
    self->_timeIndedouble x = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = self->_fragmentViews;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          objc_msgSend(v11, "startAnimationWithRippler:animatingGlyphCount:animatingGlyphCountBefore:", self->_rippler, v4, v8, (void)v13);
          objc_super v12 = [v11 layoutFragment];
          v8 += objc_msgSend(v12, "animatingGlyphCount_emk");
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

- (void)updateAnimationAndGetFinished:(BOOL *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = [(UITextView *)self->_textView textLayoutManager];
  uint64_t v6 = objc_msgSend(v5, "animatingGlyphCount_emk");

  unint64_t v7 = [(EMKGlyphRippler *)self->_rippler currentTimeIndex];
  self->_timeIndedouble x = v7;
  BOOL v8 = [(EMKGlyphRippler *)self->_rippler finishedForGlyphIndex:v6 - 1 numberOfGlyphs:v6 timeIndex:v7];
  if (!v8) {
    [(_EMKTextContainerOverlayView *)self setNeedsDisplay];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = [(NSMutableArray *)self->_fragmentViews objectEnumerator];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) updateWithTimeIndex:self->_timeIndex];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  *a3 = v8;
}

- (void)_layoutFragmentView:(id)a3
{
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v9 = *MEMORY[0x1E4F1DB28];
  long long v10 = v4;
  long long v7 = v9;
  long long v8 = v4;
  id v5 = a3;
  uint64_t v6 = [v5 layoutFragment];
  [(UITextView *)self->_textView textContainerInset];
  objc_msgSend(v6, "_emk_getFragmentViewFrame:getBounds:textContainerInset:", &v9, &v7);

  objc_msgSend(v5, "setFrame:", v9, v10);
  objc_msgSend(v5, "setBounds:", v7, v8);
}

- (id)_newFragmentViewForFragment:(id)a3
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v11 = *MEMORY[0x1E4F1DB28];
  long long v12 = v3;
  long long v9 = v11;
  long long v10 = v3;
  textView = self->_textView;
  id v5 = a3;
  [(UITextView *)textView textContainerInset];
  objc_msgSend(v5, "_emk_getFragmentViewFrame:getBounds:textContainerInset:", &v11, &v9);
  uint64_t v6 = [_EMKTextLayoutFragmentView alloc];
  long long v7 = -[_EMKTextLayoutFragmentView initWithFrame:layoutFragment:](v6, "initWithFrame:layoutFragment:", v5, v11, v12);

  -[_EMKTextLayoutFragmentView setBounds:](v7, "setBounds:", v9, v10);
  return v7;
}

- (EMKTextEnumerator)textEnumerator
{
  return self->_textEnumerator;
}

- (void)setTextEnumerator:(id)a3
{
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (NSMutableArray)fragmentViews
{
  return self->_fragmentViews;
}

- (void)setFragmentViews:(id)a3
{
}

- (EMKGlyphRippler)rippler
{
  return self->_rippler;
}

- (void)setRippler:(id)a3
{
}

- (unint64_t)timeIndex
{
  return self->_timeIndex;
}

- (void)setTimeIndex:(unint64_t)a3
{
  self->_timeIndedouble x = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rippler, 0);
  objc_storeStrong((id *)&self->_fragmentViews, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_textEnumerator, 0);
}

@end