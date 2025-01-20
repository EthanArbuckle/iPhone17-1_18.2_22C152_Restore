@interface SRUserUtteranceView
+ (double)insertionAnimatedZPosition;
- (BOOL)isBlendEffectEnabled;
- (BOOL)isEditable;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (SRUserUtteranceView)initWithFrame:(CGRect)a3;
- (double)_indentWidth;
- (double)_scaledSiriTapToEditViewLeading;
- (double)_streamingTextMaxYToTapToEditOriginDistance;
- (double)baselineOffsetFromBottom;
- (double)firstLineBaselineOffsetFromTop;
- (void)layoutSubviews;
- (void)setBlendEffectEnabled:(BOOL)a3;
- (void)setChevronHidden:(BOOL)a3;
- (void)setEditable:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation SRUserUtteranceView

- (SRUserUtteranceView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)SRUserUtteranceView;
  v7 = -[SRUserUtteranceView initWithFrame:](&v17, "initWithFrame:");
  if (v7)
  {
    v8 = [objc_alloc((Class)SUICStreamingTextView) initWithFrame:x, y, width, height];
    streamingTextView = v7->_streamingTextView;
    v7->_streamingTextView = v8;

    v10 = v7->_streamingTextView;
    v11 = +[UIFont siriui_userUtteranceFont];
    [(SUICStreamingTextView *)v10 setFont:v11];

    [(SUICStreamingTextView *)v7->_streamingTextView setAnimationDuration:0.3];
    v12 = v7->_streamingTextView;
    SiriUITextHyphenationFactor();
    -[SUICStreamingTextView setHyphenationFactor:](v12, "setHyphenationFactor:");
    [(SRUserUtteranceView *)v7 addSubview:v7->_streamingTextView];
    v13 = -[SRTapToEditView initWithFrame:]([SRTapToEditView alloc], "initWithFrame:", x, y, width, height);
    tapToEditView = v7->_tapToEditView;
    v7->_tapToEditView = v13;

    [(SRUserUtteranceView *)v7 addSubview:v7->_tapToEditView];
    [(SRTapToEditView *)v7->_tapToEditView setHidden:1];
    CGFloat v15 = SiriUIDefaultEdgePadding;
    v7->_edgeInsets.top = 0.0;
    v7->_edgeInsets.leading = v15;
    v7->_edgeInsets.bottom = 0.0;
    v7->_edgeInsets.trailing = v15;
    [(SRUserUtteranceView *)v7 recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];
  }
  return v7;
}

- (void)setChevronHidden:(BOOL)a3
{
  if (self->_blendEffectEnabled)
  {
    [(SRTapToEditView *)self->_tapToEditView setHidden:a3];
    [(SRUserUtteranceView *)self setNeedsLayout];
  }
}

+ (double)insertionAnimatedZPosition
{
  return 500.0;
}

- (double)firstLineBaselineOffsetFromTop
{
  v2 = +[UIFont siriui_userUtteranceFont];
  [v2 ascender];
  double v4 = v3;

  return v4;
}

- (double)baselineOffsetFromBottom
{
  double v3 = +[UIFont siriui_userUtteranceFont];
  [v3 descender];
  double v5 = v4;

  if ([(SRTapToEditView *)self->_tapToEditView isHidden]) {
    return -v5;
  }
  tapToEditView = self->_tapToEditView;

  [(SRTapToEditView *)tapToEditView baselineOffsetFromBottom];
  return result;
}

- (NSString)text
{
  return (NSString *)[(SUICStreamingTextView *)self->_streamingTextView text];
}

- (void)setText:(id)a3
{
  id v4 = a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_10005EAE0;
  v36 = sub_10005EAF0;
  id v37 = 0;
  double v5 = +[NSCharacterSet whitespaceCharacterSet];
  v6 = [v4 stringByTrimmingCharactersInSet:v5];

  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    v8 = (void *)v33[5];
    v33[5] = (uint64_t)v7;

    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = sub_10005EAE0;
    v30 = sub_10005EAF0;
    id v31 = 0;
    if (SiriUIIsTextInputEnabled())
    {
      id v9 = [v6 length];
      if ((unint64_t)v9 >= 0x8C) {
        uint64_t v10 = 140;
      }
      else {
        uint64_t v10 = (uint64_t)v9;
      }
    }
    else
    {
      uint64_t v10 = (uint64_t)[v6 length];
    }
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_10005EAF8;
    objc_super v17 = &unk_1001444B0;
    v19 = &v22;
    v20 = &v26;
    id v11 = v6;
    id v18 = v11;
    v21 = &v32;
    [v11 enumerateSubstringsInRange:0 options:1027 usingBlock:&v14];
    if (v27[5]) {
      [v33[5] addObject:v14, v15, v16, v17];
    }
    if (!objc_msgSend((id)v33[5], "count", v14, v15, v16, v17) && objc_msgSend(v11, "length")) {
      [(id)v33[5] addObject:v11];
    }
    if (SiriUIIsTextInputEnabled() && (unint64_t)[v11 length] >= 0x8D)
    {
      if (*((unsigned char *)v23 + 24) && (unint64_t)[(id)v33[5] count] >= 2) {
        [(id)v33[5] removeLastObject];
      }
      v12 = (void *)v33[5];
      v13 = +[NSString stringWithFormat:@"…"];
      [v12 addObject:v13];
    }
    [(SUICStreamingTextView *)self->_streamingTextView setWords:v33[5]];
    [(SUICStreamingTextView *)self->_streamingTextView siriui_setBlendEffectEnabled:self->_blendEffectEnabled];

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);
  }
  _Block_object_dispose(&v32, 8);
}

- (void)setBlendEffectEnabled:(BOOL)a3
{
  if (self->_blendEffectEnabled != a3)
  {
    self->_blendEffectEnabled = a3;
    if (a3)
    {
      id v4 = objc_alloc((Class)SUICStreamingTextView);
      [(SUICStreamingTextView *)self->_streamingTextView frame];
      double v5 = (SUICStreamingTextView *)[v4 initWithFrame:];
      clonedStreamingTextView = self->_clonedStreamingTextView;
      self->_clonedStreamingTextView = v5;

      [(SUICStreamingTextView *)self->_clonedStreamingTextView recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];
      id v7 = self->_clonedStreamingTextView;
      v8 = +[UIFont siriui_userUtteranceFont];
      [(SUICStreamingTextView *)v7 setFont:v8];

      [(SUICStreamingTextView *)self->_clonedStreamingTextView setAnimationDuration:0.0];
      id v9 = self->_clonedStreamingTextView;
      SiriUITextHyphenationFactor();
      -[SUICStreamingTextView setHyphenationFactor:](v9, "setHyphenationFactor:");
      uint64_t v10 = self->_clonedStreamingTextView;
      id v11 = [(SUICStreamingTextView *)self->_streamingTextView words];
      [(SUICStreamingTextView *)v10 setWords:v11];

      [(SRUserUtteranceView *)self addSubview:self->_clonedStreamingTextView];
      streamingTextView = self->_streamingTextView;
      v13 = +[UIColor siriui_blendEffectColor];
      [(SUICStreamingTextView *)streamingTextView setEndTextColor:v13];

      [(SUICStreamingTextView *)self->_streamingTextView siriui_setBlendEffectEnabled:1];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10005EFBC;
      v20[3] = &unk_100142E88;
      v20[4] = self;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10005EFD4;
      v19[3] = &unk_1001444D8;
      v19[4] = self;
      +[UIView animateWithDuration:v20 animations:v19 completion:0.3];
      if ([(SRUserUtteranceView *)self isEditable])
      {
        [(SRTapToEditView *)self->_tapToEditView setHidden:0];
        [(SRTapToEditView *)self->_tapToEditView setAlpha:0.0];
        v17[4] = self;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10005F024;
        v18[3] = &unk_100142E88;
        v18[4] = self;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10005F03C;
        v17[3] = &unk_1001444D8;
        +[UIView animateWithDuration:v18 animations:v17 completion:0.3];
      }
    }
    else
    {
      v14 = self->_streamingTextView;
      uint64_t v15 = +[UIColor lightTextColor];
      [(SUICStreamingTextView *)v14 setEndTextColor:v15];

      v16 = self->_streamingTextView;
      [(SUICStreamingTextView *)v16 siriui_setBlendEffectEnabled:0];
    }
  }
}

- (BOOL)isBlendEffectEnabled
{
  return self->_blendEffectEnabled;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SRUserUtteranceView *)self _indentWidth];
  SiriUIUtteranceWidthForAvailableWidthAndInsets();
  -[SUICStreamingTextView sizeThatFits:](self->_streamingTextView, "sizeThatFits:");
  double v7 = v6;
  if (![(SRTapToEditView *)self->_tapToEditView isHidden] || self->_chevronHasBeenShown)
  {
    [(SRUserUtteranceView *)self _streamingTextMaxYToTapToEditOriginDistance];
    double v9 = v7 + v8;
    -[SRTapToEditView sizeThatFits:](self->_tapToEditView, "sizeThatFits:", width, height);
    double v7 = v9 + v10;
  }
  double v11 = width;
  double v12 = v7;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)SRUserUtteranceView;
  [(SRUserUtteranceView *)&v27 layoutSubviews];
  [(SRUserUtteranceView *)self bounds];
  CGFloat x = v28.origin.x;
  double y = v28.origin.y;
  CGFloat width = v28.size.width;
  CGFloat height = v28.size.height;
  CGRectGetWidth(v28);
  [(SRUserUtteranceView *)self _indentWidth];
  SiriUIUtteranceWidthForAvailableWidthAndInsets();
  double v8 = v7;
  v29.origin.CGFloat x = x;
  v29.origin.double y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double v9 = CGRectGetHeight(v29);
  -[SUICStreamingTextView sizeThatFits:](self->_streamingTextView, "sizeThatFits:", v8, v9);
  double v11 = v10;
  if (SiriLanguageIsRTL())
  {
    v30.origin.CGFloat x = x;
    v30.origin.double y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    CGFloat v12 = CGRectGetWidth(v30) - v8 - self->_edgeInsets.leading;
    [(SRUserUtteranceView *)self _indentWidth];
    double v14 = v12 - v13;
  }
  else
  {
    double leading = self->_edgeInsets.leading;
    [(SRUserUtteranceView *)self _indentWidth];
    double v14 = leading + v16;
  }
  -[SUICStreamingTextView setFrame:](self->_clonedStreamingTextView, "setFrame:", v14, y, v8, v11);
  -[SUICStreamingTextView setFrame:](self->_streamingTextView, "setFrame:", v14, y, v8, v11);
  if (([(SRTapToEditView *)self->_tapToEditView isHidden] & 1) == 0)
  {
    -[SRTapToEditView sizeThatFits:](self->_tapToEditView, "sizeThatFits:", v8, v9);
    double v25 = v18;
    double v26 = v17;
    double v19 = v14;
    if (SiriLanguageIsRTL())
    {
      v31.origin.CGFloat x = x;
      v31.origin.double y = y;
      v31.size.CGFloat width = width;
      v31.size.CGFloat height = height;
      double v20 = CGRectGetWidth(v31);
      v32.origin.CGFloat x = 0.0;
      v32.origin.double y = 0.0;
      v32.size.CGFloat height = v25;
      v32.size.CGFloat width = v26;
      double v21 = v20 - CGRectGetWidth(v32) - self->_edgeInsets.leading;
      [(SRUserUtteranceView *)self _indentWidth];
      double v19 = v21 - v22;
    }
    v33.origin.CGFloat x = v14;
    v33.origin.double y = y;
    v33.size.CGFloat width = v8;
    v33.size.CGFloat height = v11;
    double MaxY = CGRectGetMaxY(v33);
    [(SRUserUtteranceView *)self _streamingTextMaxYToTapToEditOriginDistance];
    -[SRTapToEditView setFrame:](self->_tapToEditView, "setFrame:", v19, MaxY + v24, v26, v25);
  }
}

- (double)_streamingTextMaxYToTapToEditOriginDistance
{
  double v3 = +[UIScreen mainScreen];
  [v3 scale];
  double v5 = v4;
  [(SRUserUtteranceView *)self _scaledSiriTapToEditViewLeading];
  double v7 = v6;
  double v8 = [(SUICStreamingTextView *)self->_streamingTextView font];
  [v8 descender];
  double v10 = v7 + v9;
  [(SRTapToEditView *)self->_tapToEditView firstLineBaselineOffsetFromTop];
  double v12 = v10 - v11;
  double v13 = floor(v12);
  if (v5 < 2.0) {
    double v14 = v13;
  }
  else {
    double v14 = v12;
  }

  return v14;
}

- (double)_indentWidth
{
  double v2 = 28.0;
  if ((SiriUIIsCompactWidth() & 1) == 0)
  {
    if (SiriUIIsCompactHeight()) {
      return 28.0;
    }
    else {
      return 31.0;
    }
  }
  return v2;
}

- (double)_scaledSiriTapToEditViewLeading
{
  double v2 = +[UIFont siriui_serverUtteranceCorrectionPromptFont];
  [v2 _scaledValueForValue:26.0];
  double v4 = v3;

  return v4;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToEditView, 0);
  objc_storeStrong((id *)&self->_streamingTextView, 0);

  objc_storeStrong((id *)&self->_clonedStreamingTextView, 0);
}

@end