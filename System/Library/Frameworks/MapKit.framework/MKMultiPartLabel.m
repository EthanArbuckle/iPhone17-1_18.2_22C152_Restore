@interface MKMultiPartLabel
+ (id)_formattedStringsCache;
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MKMultiPartAttributedString)multiPartString;
- (MKMultiPartLabel)initWithFrame:(CGRect)a3;
- (NSString)text;
- (UIColor)highlightedTextColor;
- (UIColor)textColor;
- (UIEdgeInsets)textInset;
- (UIFont)font;
- (_MKMultiPartLabelMetrics)data;
- (id)_addDefaultAttributesToAttributedString:(id)a3;
- (id)_attributedAdjustedMultiPartStringFromString:(id)a3;
- (id)_textAttributes;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)lineBreakMode;
- (int64_t)textAlignment;
- (unint64_t)numberOfLines;
- (void)_setupTextView;
- (void)_updateColorsForCurrentState;
- (void)_updateStrings;
- (void)_updateTextViewTextAndInvalidateLayout:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setContentCompressionResistancePriority:(float)a3 forAxis:(int64_t)a4;
- (void)setContentHuggingPriority:(float)a3 forAxis:(int64_t)a4;
- (void)setData:(id)a3;
- (void)setFont:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedTextColor:(id)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setMultiPartString:(id)a3;
- (void)setNumberOfLines:(unint64_t)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTextInset:(UIEdgeInsets)a3;
@end

@implementation MKMultiPartLabel

- (MKMultiPartLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKMultiPartLabel;
  v3 = -[MKMultiPartLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MKMultiPartLabel *)v3 _setupTextView];
  }
  return v4;
}

- (void)_setupTextView
{
  v32[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F42F58]);
  v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  textView = self->_textView;
  self->_textView = v4;

  [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextView *)self->_textView setScrollEnabled:0];
  [(UITextView *)self->_textView setAdjustsFontForContentSizeCategory:1];
  [(UITextView *)self->_textView setEditable:0];
  [(UITextView *)self->_textView setSelectable:0];
  objc_super v6 = [(UITextView *)self->_textView textContainer];
  [v6 setLineFragmentPadding:0.0];

  v7 = [(UITextView *)self->_textView textContainer];
  [v7 setWidthTracksTextView:1];

  v8 = [(UITextView *)self->_textView textContainer];
  [v8 setHeightTracksTextView:1];

  v9 = [MEMORY[0x1E4F428B8] clearColor];
  [(UITextView *)self->_textView setBackgroundColor:v9];

  [(MKMultiPartLabel *)self addSubview:self->_textView];
  [(MKMultiPartLabel *)self setTextAlignment:4];
  [(MKMultiPartLabel *)self setLineBreakMode:0];
  id v10 = objc_alloc(MEMORY[0x1E4F42A40]);
  v11 = (void *)[v10 initForTextStyle:*MEMORY[0x1E4F43870]];
  v12 = [MEMORY[0x1E4F42B38] _defaultAttributes];
  v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];

  v14 = [v11 scaledFontForFont:v13];
  [(MKMultiPartLabel *)self setFont:v14];

  v15 = [MEMORY[0x1E4F42B38] _defaultAttributes];
  v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F42510]];

  [(MKMultiPartLabel *)self setTextColor:v16];
  v17 = [(MKMultiPartLabel *)self textColor];
  [(UITextView *)self->_textView setTextColor:v17];

  v27 = (void *)MEMORY[0x1E4F28DC8];
  v31 = [(UITextView *)self->_textView topAnchor];
  v30 = [(MKMultiPartLabel *)self topAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v32[0] = v29;
  v28 = [(UITextView *)self->_textView bottomAnchor];
  v18 = [(MKMultiPartLabel *)self bottomAnchor];
  v19 = [v28 constraintEqualToAnchor:v18];
  v32[1] = v19;
  v20 = [(UITextView *)self->_textView leadingAnchor];
  v21 = [(MKMultiPartLabel *)self leadingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v32[2] = v22;
  v23 = [(UITextView *)self->_textView trailingAnchor];
  v24 = [(MKMultiPartLabel *)self trailingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v32[3] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
  [v27 activateConstraints:v26];
}

- (void)setFont:(id)a3
{
  v4 = (UIFont *)a3;
  if (self->_font != v4)
  {
    obj = v4;
    if ((-[UIFont isEqual:](v4, "isEqual:") & 1) == 0)
    {
      v5 = obj;
      if (!obj)
      {
        objc_super v6 = [MEMORY[0x1E4F42B38] _defaultAttributes];
        obja = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];

        v5 = obja;
      }
      obj = v5;
      objc_storeStrong((id *)&self->_font, v5);
      [(UITextView *)self->_textView setFont:obj];
      cachedTextAttributes = self->_cachedTextAttributes;
      self->_cachedTextAttributes = 0;

      [(MKMultiPartLabel *)self _updateStrings];
    }
    v4 = obj;
  }
}

- (void)setTextColor:(id)a3
{
  v4 = (UIColor *)a3;
  if (self->_textColor != v4)
  {
    obj = v4;
    if ((-[UIColor isEqual:](v4, "isEqual:") & 1) == 0)
    {
      v5 = obj;
      if (!obj)
      {
        objc_super v6 = [MEMORY[0x1E4F42B38] _defaultAttributes];
        obja = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F42510]];

        v5 = obja;
      }
      obj = v5;
      objc_storeStrong((id *)&self->_textColor, v5);
      [(MKMultiPartLabel *)self _updateColorsForCurrentState];
      cachedTextAttributes = self->_cachedTextAttributes;
      self->_cachedTextAttributes = 0;

      [(MKMultiPartLabel *)self _updateStrings];
    }
    v4 = obj;
  }
}

- (void)setHighlightedTextColor:(id)a3
{
  v5 = (UIColor *)a3;
  objc_super v6 = v5;
  if (self->_highlightedTextColor != v5)
  {
    v9 = v5;
    char v7 = -[UIColor isEqual:](v5, "isEqual:");
    objc_super v6 = v9;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_highlightedTextColor, a3);
      [(MKMultiPartLabel *)self _updateColorsForCurrentState];
      cachedTextAttributes = self->_cachedTextAttributes;
      self->_cachedTextAttributes = 0;

      [(MKMultiPartLabel *)self _updateStrings];
      objc_super v6 = v9;
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(MKMultiPartLabel *)self _updateColorsForCurrentState];
    cachedTextAttributes = self->_cachedTextAttributes;
    self->_cachedTextAttributes = 0;

    [(MKMultiPartLabel *)self _updateStrings];
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKMultiPartLabel;
  [(MKMultiPartLabel *)&v11 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  char v7 = [v6 previouslyFocusedView];
  if (v7 == self
    || ([v6 nextFocusedView], v8 = (MKMultiPartLabel *)objc_claimAutoreleasedReturnValue(), v8 == self))
  {
    v9 = [v6 previouslyFocusedView];
    id v10 = [v6 nextFocusedView];

    if (v7 != self) {
    if (v9 != v10)
    }
      [(MKMultiPartLabel *)self _updateColorsForCurrentState];
  }
  else
  {
  }
}

- (void)_updateColorsForCurrentState
{
  uint64_t v3 = [(MKMultiPartLabel *)self highlightedTextColor];
  if (v3)
  {
    v4 = (void *)v3;
    if ([(MKMultiPartLabel *)self isHighlighted])
    {

LABEL_5:
      uint64_t v6 = [(MKMultiPartLabel *)self highlightedTextColor];
      goto LABEL_7;
    }
    char v5 = [(MKMultiPartLabel *)self isFocused];

    if (v5) {
      goto LABEL_5;
    }
  }
  uint64_t v6 = [(MKMultiPartLabel *)self textColor];
LABEL_7:
  id v7 = (id)v6;
  [(UITextView *)self->_textView setTextColor:v6];
}

- (void)setNumberOfLines:(unint64_t)a3
{
  id v4 = [(UITextView *)self->_textView textContainer];
  [v4 setMaximumNumberOfLines:a3];
}

- (unint64_t)numberOfLines
{
  v2 = [(UITextView *)self->_textView textContainer];
  unint64_t v3 = [v2 maximumNumberOfLines];

  return v3;
}

- (void)setLineBreakMode:(int64_t)a3
{
  char v5 = [(UITextView *)self->_textView textContainer];
  [v5 setLineBreakMode:a3];

  cachedTextAttributes = self->_cachedTextAttributes;
  self->_cachedTextAttributes = 0;

  [(MKMultiPartLabel *)self _updateStrings];
}

- (int64_t)lineBreakMode
{
  v2 = [(UITextView *)self->_textView textContainer];
  int64_t v3 = [v2 lineBreakMode];

  return v3;
}

- (id)_textAttributes
{
  cachedTextAttributes = self->_cachedTextAttributes;
  if (!cachedTextAttributes)
  {
    id v4 = [MEMORY[0x1E4F42678] defaultParagraphStyle];
    char v5 = (void *)[v4 mutableCopy];

    objc_msgSend(v5, "setAlignment:", -[MKMultiPartLabel textAlignment](self, "textAlignment"));
    objc_msgSend(v5, "setLineBreakMode:", -[MKMultiPartLabel lineBreakMode](self, "lineBreakMode"));
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v5 forKey:*MEMORY[0x1E4F42540]];
    id v7 = [(UITextView *)self->_textView textColor];

    if (v7)
    {
      v8 = [(UITextView *)self->_textView textColor];
      [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F42510]];
    }
    v9 = [(MKMultiPartLabel *)self font];

    if (v9)
    {
      id v10 = [(MKMultiPartLabel *)self font];
      [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F42508]];
    }
    objc_super v11 = (NSDictionary *)[v6 copy];
    v12 = self->_cachedTextAttributes;
    self->_cachedTextAttributes = v11;

    cachedTextAttributes = self->_cachedTextAttributes;
  }

  return cachedTextAttributes;
}

- (NSString)text
{
  return [(UITextView *)self->_textView text];
}

- (void)setText:(id)a3
{
  if (a3)
  {
    uint64_t v4 = +[MKMultiPartAttributedString multiPartAttributedStringWithString:](MKMultiPartAttributedString, "multiPartAttributedStringWithString:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(MKMultiPartLabel *)self setMultiPartString:v4];
}

- (void)setMultiPartString:(id)a3
{
  id v5 = a3;
  multiPartString = self->_multiPartString;
  unint64_t v11 = (unint64_t)v5;
  id v7 = multiPartString;
  v8 = (void *)v11;
  if (v11 | (unint64_t)v7)
  {
    char v9 = [(id)v11 isEqual:v7];

    v8 = (void *)v11;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_multiPartString, a3);
      data = self->_data;
      self->_data = 0;

      [(MKMultiPartLabel *)self _updateStrings];
      v8 = (void *)v11;
    }
  }
}

- (void)_updateStrings
{
  id v6 = [(MKMultiPartLabel *)self _attributedAdjustedMultiPartStringFromString:self->_multiPartString];
  if (v6) {
    int64_t v3 = [[_MKMultiPartLabelMetrics alloc] initWithMultiPartString:v6];
  }
  else {
    int64_t v3 = 0;
  }
  objc_storeStrong((id *)&self->_data, v3);
  if (v6) {

  }
  uint64_t v4 = [(MKMultiPartLabel *)self data];
  id v5 = [v4 attributedString];
  [(MKMultiPartLabel *)self _updateTextViewTextAndInvalidateLayout:v5];
}

- (void)_updateTextViewTextAndInvalidateLayout:(id)a3
{
  id v16 = a3;
  if (v16)
  {
    uint64_t v3 = [(UITextView *)self->_textView attributedText];
    if ([v16 isEqual:v3])
    {
LABEL_16:

      goto LABEL_17;
    }
    if ([v16 length])
    {

      goto LABEL_9;
    }
  }
  else if ([0 length])
  {
    goto LABEL_9;
  }
  id v5 = [(UITextView *)self->_textView attributedText];
  uint64_t v6 = [v5 length];

  if (v16) {
  if (v6)
  }
  {
LABEL_9:
    id v7 = [(UITextView *)self->_textView attributedText];
    v8 = [v7 string];

    [(UITextView *)self->_textView setAttributedText:v16];
    char v9 = (void *)[(NSDictionary *)self->_cachedTextAttributes mutableCopy];
    [v9 removeObjectForKey:*MEMORY[0x1E4F42510]];
    id v10 = [v16 string];
    uint64_t v3 = v8;
    unint64_t v11 = v10;
    if (v3 | v11 && (int v12 = [(id)v3 isEqual:v11], (id)v11, (id)v3, !v12))
    {
    }
    else
    {
      BOOL v13 = [(NSDictionary *)self->_lastAppliedNonColorAttributes isEqualToDictionary:v9];

      if (v13) {
        goto LABEL_15;
      }
    }
    v14 = (NSDictionary *)[v9 copy];
    lastAppliedNonColorAttributes = self->_lastAppliedNonColorAttributes;
    self->_lastAppliedNonColorAttributes = v14;

    [(UIView *)self _mapkit_setNeedsLayout];
    [(MKMultiPartLabel *)self invalidateIntrinsicContentSize];
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:
}

- (id)_attributedAdjustedMultiPartStringFromString:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
    id v7 = [v4 components];
    v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    char v9 = [v5 components];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [(MKMultiPartLabel *)self _addDefaultAttributesToAttributedString:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v11);
    }

    v15 = (void *)MEMORY[0x1E4F1CA48];
    id v16 = [v5 separators];
    v17 = objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "count"));

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v18 = objc_msgSend(v5, "separators", 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [(MKMultiPartLabel *)self _addDefaultAttributesToAttributedString:*(void *)(*((void *)&v26 + 1) + 8 * j)];
          [v17 addObject:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v20);
    }

    v24 = [[MKMultiPartAttributedString alloc] initWithComponents:v8 separators:v17];
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)_addDefaultAttributesToAttributedString:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28E48];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 string];
  v8 = [(MKMultiPartLabel *)self _textAttributes];
  char v9 = (void *)[v6 initWithString:v7 attributes:v8];

  uint64_t v10 = [v5 length];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__MKMultiPartLabel__addDefaultAttributesToAttributedString___block_invoke;
  v13[3] = &unk_1E54BC408;
  id v11 = v9;
  id v14 = v11;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v13);

  return v11;
}

uint64_t __60__MKMultiPartLabel__addDefaultAttributesToAttributedString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, a3, a4);
}

- (void)layoutSubviews
{
  p_previousBounds = &self->_previousBounds;
  [(MKMultiPartLabel *)self bounds];
  v73.origin.x = v4;
  v73.origin.y = v5;
  v73.size.width = v6;
  v73.size.height = v7;
  if (!CGRectEqualToRect(*p_previousBounds, v73))
  {
    [(MKMultiPartLabel *)self bounds];
    p_previousBounds->origin.x = v8;
    p_previousBounds->origin.y = v9;
    p_previousBounds->size.width = v10;
    p_previousBounds->size.height = v11;
    [(UITextView *)self->_textView setAttributedText:0];
    uint64_t v12 = [(MKMultiPartLabel *)self data];
    [v12 reset];

    BOOL v13 = [(MKMultiPartLabel *)self data];
    id v14 = [v13 attributedString];
    [(MKMultiPartLabel *)self _updateTextViewTextAndInvalidateLayout:v14];
  }
  v72.receiver = self;
  v72.super_class = (Class)MKMultiPartLabel;
  [(MKMultiPartLabel *)&v72 layoutSubviews];
  [(MKMultiPartLabel *)self bounds];
  if (v15 != 0.0)
  {
    [(MKMultiPartLabel *)self bounds];
    if (v16 != 0.0 && [(MKMultiPartLabel *)self numberOfLines] != 1)
    {
      v17 = [(MKMultiPartLabel *)self data];
      v18 = [(_MKMultiPartLabelCacheKey *)v17 components];
      if ([v18 count] == 1) {
        goto LABEL_27;
      }
      uint64_t v19 = [(MKMultiPartLabel *)self data];
      uint64_t v20 = [v19 attributedString];
      uint64_t v21 = [v20 length];

      if (v21)
      {
        v22 = [_MKMultiPartLabelCacheKey alloc];
        v23 = [(_MKMultiPartLabelMetrics *)self->_data originalAttributedString];
        [(MKMultiPartLabel *)self bounds];
        v17 = -[_MKMultiPartLabelCacheKey initWithAttributedString:size:](v22, "initWithAttributedString:size:", v23, v24, v25);

        v18 = [(id)objc_opt_class() _formattedStringsCache];
        long long v26 = [v18 objectForKey:v17];
        if (v26)
        {
          [(UITextView *)self->_textView setAttributedText:v26];
          long long v27 = [(MKMultiPartLabel *)self data];
          long long v28 = [v27 separators];
          uint64_t v29 = [v28 count];
          long long v30 = [(MKMultiPartLabel *)self data];
          [v30 setCurrentSeparatorIndex:v29];

          goto LABEL_25;
        }
        long long v31 = [(MKMultiPartLabel *)self data];
        unint64_t v32 = [v31 currentSeparatorIndex];

        long long v33 = [(MKMultiPartLabel *)self data];
        v34 = [v33 separators];
        unint64_t v35 = [v34 count];

        if (v32 >= v35) {
          goto LABEL_23;
        }
        while (1)
        {
          uint64_t v36 = [(MKMultiPartLabel *)self data];
          v37 = [v36 separators];
          v38 = [v37 objectAtIndexedSubscript:v32];

          [v38 range];
          if (v39 && [v38 range] != 0x7FFFFFFFFFFFFFFFLL)
          {
            v40 = [(UITextView *)self->_textView layoutManager];
            uint64_t v41 = objc_msgSend(v40, "glyphIndexForCharacterAtIndex:", objc_msgSend(v38, "range"));

            v42 = [(UITextView *)self->_textView layoutManager];
            uint64_t v43 = [v38 range];
            unint64_t v45 = [v42 glyphIndexForCharacterAtIndex:v44 + v43 - 1];

            if (v41 != 0x7FFFFFFFFFFFFFFFLL && v45 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v70 = 0;
              uint64_t v71 = 0;
              v47 = [(UITextView *)self->_textView layoutManager];
              [v47 lineFragmentRectForGlyphAtIndex:v41 effectiveRange:&v70];

              if (v70 != 0x7FFFFFFFFFFFFFFFLL)
              {
                if (v41 == v70)
                {
                  v64 = [(MKMultiPartLabel *)self data];
                  v65 = v64;
                  v66 = &stru_1ED919588;
LABEL_31:
                  char v67 = [v64 replaceSeparatorAtIndex:v32 withString:v66];

                  if (v67)
                  {
                    v68 = [(MKMultiPartLabel *)self data];
                    v69 = [v68 attributedString];
                    [(MKMultiPartLabel *)self _updateTextViewTextAndInvalidateLayout:v69];
                  }
                  ++v32;

LABEL_23:
                  v58 = [(MKMultiPartLabel *)self data];
                  [v58 setCurrentSeparatorIndex:v32];

                  v59 = [(MKMultiPartLabel *)self data];
                  unint64_t v60 = [v59 currentSeparatorIndex];
                  v61 = [(MKMultiPartLabel *)self data];
                  v62 = [v61 separators];
                  unint64_t v63 = [v62 count];

                  long long v26 = 0;
                  if (v60 >= v63)
                  {
                    long long v27 = [(MKMultiPartLabel *)self data];
                    long long v28 = [v27 attributedString];
                    [v18 setObject:v28 forKey:v17];
LABEL_25:
                  }
LABEL_27:

                  return;
                }
                unint64_t v48 = v70 + v71 - 1;
                if (v45 > v48) {
                  goto LABEL_29;
                }
                if (v45 == v48)
                {
                  uint64_t v49 = [v38 range];
                  unint64_t v51 = v49 + v50;
                  v52 = [(MKMultiPartLabel *)self data];
                  v53 = [v52 attributedString];
                  unint64_t v54 = [v53 length];

                  if (v51 < v54)
                  {
LABEL_29:
                    v64 = [(MKMultiPartLabel *)self data];
                    v65 = v64;
                    v66 = @"\n";
                    goto LABEL_31;
                  }
                }
              }
            }
          }

          ++v32;
          v55 = [(MKMultiPartLabel *)self data];
          v56 = [v55 separators];
          unint64_t v57 = [v56 count];

          if (v32 >= v57) {
            goto LABEL_23;
          }
        }
      }
    }
  }
}

- (UIEdgeInsets)textInset
{
  [(UITextView *)self->_textView textContainerInset];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setTextInset:(UIEdgeInsets)a3
{
}

+ (id)_formattedStringsCache
{
  if (qword_1E9154180 != -1) {
    dispatch_once(&qword_1E9154180, &__block_literal_global_71);
  }
  double v2 = (void *)_MergedGlobals_1_9;

  return v2;
}

void __42__MKMultiPartLabel__formattedStringsCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_MergedGlobals_1_9;
  _MergedGlobals_1_9 = (uint64_t)v0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MKMultiPartLabel;
  -[MKMultiPartLabel hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (UITextView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self->_textView)
  {
    CGFloat v6 = self;

    double v5 = (UITextView *)v6;
  }

  return v5;
}

- (void)setContentCompressionResistancePriority:(float)a3 forAxis:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MKMultiPartLabel;
  -[MKMultiPartLabel setContentCompressionResistancePriority:forAxis:](&v8, sel_setContentCompressionResistancePriority_forAxis_);
  *(float *)&double v7 = a3;
  [(UITextView *)self->_textView setContentCompressionResistancePriority:a4 forAxis:v7];
}

- (void)setContentHuggingPriority:(float)a3 forAxis:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MKMultiPartLabel;
  -[MKMultiPartLabel setContentHuggingPriority:forAxis:](&v8, sel_setContentHuggingPriority_forAxis_);
  *(float *)&double v7 = a3;
  [(UITextView *)self->_textView setContentHuggingPriority:a4 forAxis:v7];
}

- (CGSize)intrinsicContentSize
{
  if (self->_multiPartString && self->_data)
  {
    v4.receiver = self;
    v4.super_class = (Class)MKMultiPartLabel;
    [(MKMultiPartLabel *)&v4 intrinsicContentSize];
  }
  else
  {
    double v2 = *MEMORY[0x1E4F1DB30];
    double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)viewForLastBaselineLayout
{
  return self->_textView;
}

- (id)viewForFirstBaselineLayout
{
  return self->_textView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (MKMultiPartAttributedString)multiPartString
{
  return self->_multiPartString;
}

- (UIFont)font
{
  return self->_font;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (_MKMultiPartLabelMetrics)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_multiPartString, 0);
  objc_storeStrong((id *)&self->_lastAppliedNonColorAttributes, 0);
  objc_storeStrong((id *)&self->_cachedTextAttributes, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end