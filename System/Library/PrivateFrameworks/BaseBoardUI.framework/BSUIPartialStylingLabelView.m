@interface BSUIPartialStylingLabelView
- (BOOL)_textAlignmentFollowsWritingDirection;
- (BOOL)adjustsFontSizeToFitWidth;
- (BSUIPartialStylingLabelView)initWithFrame:(CGRect)a3;
- (BSUIPartialStylingLabelView)initWithRangeFindingBlock:(id)a3;
- (BSUIPartialStylingLabelView)initWithTokenType:(int64_t)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)attributedText;
- (NSString)text;
- (UIColor)textColor;
- (UIFont)font;
- (UILabel)contentLabel;
- (double)_baselineOffsetFromBottom;
- (double)_firstLineBaselineOffsetFromBoundsTop;
- (int64_t)lineBreakMode;
- (int64_t)numberOfLines;
- (int64_t)textAlignment;
- (void)_initWithFrame:(double)a3 rangeFindingBlock:(double)a4;
- (void)_newLabel;
- (void)_setTextAlignmentFollowsWritingDirection:(BOOL)a3;
- (void)_updateLabelsWithRawText:(uint64_t)a1;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setAttributedText:(id)a3;
- (void)setFont:(id)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
@end

@implementation BSUIPartialStylingLabelView

- (BSUIPartialStylingLabelView)initWithTokenType:(int64_t)a3
{
  v3 = &__block_literal_global_3;
  if (a3 != 1) {
    v3 = 0;
  }
  if (a3) {
    v4 = v3;
  }
  else {
    v4 = &__block_literal_global_1;
  }
  return [(BSUIPartialStylingLabelView *)self initWithRangeFindingBlock:v4];
}

- (BSUIPartialStylingLabelView)initWithRangeFindingBlock:(id)a3
{
  return (BSUIPartialStylingLabelView *)-[BSUIPartialStylingLabelView _initWithFrame:rangeFindingBlock:](self, a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)_initWithFrame:(double)a3 rangeFindingBlock:(double)a4
{
  id v11 = a2;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)BSUIPartialStylingLabelView;
    v12 = objc_msgSendSuper2(&v18, sel_initWithFrame_, a3, a4, a5, a6);
    a1 = v12;
    if (v12)
    {
      v13 = -[BSUIPartialStylingLabelView _newLabel](v12);
      v14 = (void *)a1[55];
      a1[55] = v13;

      [a1 setUserInteractionEnabled:0];
      uint64_t v15 = [v11 copy];
      v16 = (void *)a1[51];
      a1[51] = v15;
    }
  }

  return a1;
}

- (void)_newLabel
{
  id v2 = objc_alloc(MEMORY[0x1E4F42B38]);
  [a1 bounds];
  v3 = objc_msgSend(v2, "initWithFrame:");
  [a1 addSubview:v3];
  [v3 setAutoresizingMask:18];
  return v3;
}

- (void)setTextColor:(id)a3
{
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  -[UILabel setFont:](self->_contentLabel, "setFont:");
  [(UILabel *)self->_tokenTypeLabel setFont:v4];
}

- (void)setText:(id)a3
{
  id v7 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    id v4 = (NSString *)[v7 copy];
    rawText = self->_rawText;
    self->_rawText = v4;

    rawAttributedText = self->_rawAttributedText;
    self->_rawAttributedText = 0;

    -[BSUIPartialStylingLabelView _updateLabelsWithRawText:]((uint64_t)self, self->_rawText);
  }
}

- (void)_updateLabelsWithRawText:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = objc_opt_class();
    id v5 = v3;
    if (v4)
    {
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
    }
    else
    {
      v6 = 0;
    }
    unint64_t v7 = v6;

    uint64_t v8 = objc_opt_class();
    id v9 = v5;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    unint64_t v11 = v10;

    if (v7 | v11)
    {
      uint64_t v12 = *(void *)(a1 + 408);
      uint64_t v31 = 0;
      v13 = (*(void (**)(void))(v12 + 16))();
      id v14 = 0;
      if ([v13 count])
      {
        id v27 = v14;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __56__BSUIPartialStylingLabelView__updateLabelsWithRawText___block_invoke;
        v28[3] = &unk_1E5ABD5E0;
        id v29 = (id)v11;
        id v30 = (id)v7;
        uint64_t v15 = (void (**)(void, void))MEMORY[0x1A623AF30](v28);
        v16 = *(void **)(a1 + 440);
        v17 = ((void (**)(void, void *))v15)[2](v15, v13);
        [v16 setAttributedText:v17];

        objc_super v18 = *(void **)(a1 + 416);
        if (!v18)
        {
          v19 = -[BSUIPartialStylingLabelView _newLabel]((void *)a1);
          v20 = *(void **)(a1 + 416);
          *(void *)(a1 + 416) = v19;

          v21 = *(void **)(a1 + 416);
          v22 = [*(id *)(a1 + 440) font];
          [v21 setFont:v22];

          objc_msgSend(*(id *)(a1 + 416), "setNumberOfLines:", objc_msgSend(*(id *)(a1 + 440), "numberOfLines"));
          objc_msgSend(*(id *)(a1 + 416), "setTextAlignment:", objc_msgSend(*(id *)(a1 + 440), "textAlignment"));
          objc_msgSend(*(id *)(a1 + 416), "setLineBreakMode:", objc_msgSend(*(id *)(a1 + 440), "lineBreakMode"));
          objc_msgSend(*(id *)(a1 + 416), "setAdjustsFontSizeToFitWidth:", objc_msgSend(*(id *)(a1 + 440), "adjustsFontSizeToFitWidth"));
          objc_super v18 = *(void **)(a1 + 416);
        }
        v23 = ((void (**)(void, id))v15)[2](v15, v27);
        [v18 setAttributedText:v23];

        v24 = v29;
        id v14 = v27;
      }
      else
      {
        v26 = *(void **)(a1 + 440);
        if (v7) {
          [v26 setText:v7];
        }
        else {
          [v26 setAttributedText:v11];
        }
        [*(id *)(a1 + 416) removeFromSuperview];
        v24 = *(void **)(a1 + 416);
        *(void *)(a1 + 416) = 0;
      }
    }
    else
    {
      [*(id *)(a1 + 440) setText:0];
      [*(id *)(a1 + 440) setAttributedText:0];
      [*(id *)(a1 + 416) removeFromSuperview];
      v25 = *(void **)(a1 + 416);
      *(void *)(a1 + 416) = 0;
    }
  }
}

id __49__BSUIPartialStylingLabelView_initWithTokenType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = 0;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = -[NSString _bsui_rangesOfEmojiTokens:](v8, a3);
  }
  else
  {
    uint64_t v10 = objc_opt_class();
    id v11 = v6;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      id v14 = [v13 string];
      id v9 = -[NSString _bsui_rangesOfEmojiTokens:](v14, a3);
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

id __49__BSUIPartialStylingLabelView_initWithTokenType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = 0;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__1;
    v40 = __Block_byref_object_dispose__1;
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__1;
    v34 = __Block_byref_object_dispose__1;
    if (a3) {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v9 = 0;
    }
    id v35 = v9;
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3010000000;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    id v27 = &unk_1A2B2EB5E;
    uint64_t v11 = [v8 length];
    uint64_t v12 = *MEMORY[0x1E4F424C0];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __81__NSAttributedString_BSUIPartialStylingAdditions___bsui_rangesOfTextAttachments___block_invoke;
    v23[3] = &unk_1E5ABD630;
    v23[4] = &v36;
    v23[5] = &v30;
    v23[6] = &v24;
    objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v11, 0, v23);
    if (v31[5])
    {
      uint64_t v13 = v25[4];
      uint64_t v14 = v25[5];
      if (v14 + v13 < (unint64_t)[v8 length])
      {
        uint64_t v15 = v25[4];
        uint64_t v16 = v25[5];
        uint64_t v17 = [v8 length];
        uint64_t v18 = v16 + v15;
        v19 = (void *)v31[5];
        v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v18, v17 - (v25[4] + v25[5]));
        [v19 addObject:v20];
      }
      v21 = (void *)v31[5];
      if (v21) {
        *a3 = v21;
      }
    }
    id v10 = (id)v37[5];
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BSUIPartialStylingLabelView)initWithFrame:(CGRect)a3
{
  return (BSUIPartialStylingLabelView *)-[BSUIPartialStylingLabelView _initWithFrame:rangeFindingBlock:](self, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_contentLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIFont)font
{
  return [(UILabel *)self->_contentLabel font];
}

- (NSString)text
{
  return self->_rawText;
}

- (NSAttributedString)attributedText
{
  return self->_rawAttributedText;
}

- (void)setAttributedText:(id)a3
{
  id v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    double v4 = (NSAttributedString *)[v7 copy];
    rawAttributedText = self->_rawAttributedText;
    self->_rawAttributedText = v4;

    rawText = self->_rawText;
    self->_rawText = 0;

    -[BSUIPartialStylingLabelView _updateLabelsWithRawText:]((uint64_t)self, self->_rawAttributedText);
  }
}

- (UIColor)textColor
{
  return [(UILabel *)self->_contentLabel textColor];
}

- (int64_t)numberOfLines
{
  return [(UILabel *)self->_contentLabel numberOfLines];
}

- (void)setNumberOfLines:(int64_t)a3
{
  -[UILabel setNumberOfLines:](self->_contentLabel, "setNumberOfLines:");
  tokenTypeLabel = self->_tokenTypeLabel;

  [(UILabel *)tokenTypeLabel setNumberOfLines:a3];
}

- (double)_firstLineBaselineOffsetFromBoundsTop
{
  [(UILabel *)self->_contentLabel _firstLineBaselineOffsetFromBoundsTop];
  return result;
}

- (double)_baselineOffsetFromBottom
{
  [(UILabel *)self->_contentLabel _baselineOffsetFromBottom];
  return result;
}

- (int64_t)textAlignment
{
  return [(UILabel *)self->_contentLabel textAlignment];
}

- (void)setTextAlignment:(int64_t)a3
{
  -[UILabel setTextAlignment:](self->_contentLabel, "setTextAlignment:");
  tokenTypeLabel = self->_tokenTypeLabel;

  [(UILabel *)tokenTypeLabel setTextAlignment:a3];
}

- (int64_t)lineBreakMode
{
  return [(UILabel *)self->_contentLabel lineBreakMode];
}

- (void)setLineBreakMode:(int64_t)a3
{
  -[UILabel setLineBreakMode:](self->_contentLabel, "setLineBreakMode:");
  tokenTypeLabel = self->_tokenTypeLabel;

  [(UILabel *)tokenTypeLabel setLineBreakMode:a3];
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return [(UILabel *)self->_contentLabel adjustsFontSizeToFitWidth];
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  BOOL v3 = a3;
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_contentLabel, "setAdjustsFontSizeToFitWidth:");
  tokenTypeLabel = self->_tokenTypeLabel;

  [(UILabel *)tokenTypeLabel setAdjustsFontSizeToFitWidth:v3];
}

- (BOOL)_textAlignmentFollowsWritingDirection
{
  return [(UILabel *)self->_contentLabel _textAlignmentFollowsWritingDirection];
}

- (void)_setTextAlignmentFollowsWritingDirection:(BOOL)a3
{
  BOOL v3 = a3;
  -[UILabel _setTextAlignmentFollowsWritingDirection:](self->_contentLabel, "_setTextAlignmentFollowsWritingDirection:");
  tokenTypeLabel = self->_tokenTypeLabel;

  [(UILabel *)tokenTypeLabel _setTextAlignmentFollowsWritingDirection:v3];
}

id __56__BSUIPartialStylingLabelView__updateLabelsWithRawText___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  BOOL v3 = *(void **)(a1 + 32);
  if (v3) {
    uint64_t v4 = objc_msgSend(v3, "mutableCopy", v16);
  }
  else {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E48]), "initWithString:", *(void *)(a1 + 40), v16);
  }
  uint64_t v5 = (void *)v4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v17;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    uint64_t v8 = *MEMORY[0x1E4F42510];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v23 = v8;
        uint64_t v11 = [MEMORY[0x1E4F428B8] clearColor];
        uint64_t v24 = v11;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        uint64_t v13 = [v10 rangeValue];
        objc_msgSend(v5, "addAttributes:range:", v12, v13, v14);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }

  return v5;
}

- (UILabel)contentLabel
{
  return self->_contentLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLabel, 0);
  objc_storeStrong((id *)&self->_rawAttributedText, 0);
  objc_storeStrong((id *)&self->_rawText, 0);
  objc_storeStrong((id *)&self->_tokenTypeLabel, 0);

  objc_storeStrong(&self->_rangeFindingBlock, 0);
}

@end