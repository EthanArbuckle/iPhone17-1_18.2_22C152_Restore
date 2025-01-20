@interface LPVerticalTextStackViewStyle
- (BOOL)shouldAlignToBaselines;
- (LPPadding)captionTextPadding;
- (LPPadding)emailCompatibleMargin;
- (LPPointUnit)firstLineLeading;
- (LPPointUnit)lastLineDescent;
- (LPTextRowStyle)aboveTopCaption;
- (LPTextRowStyle)belowBottomCaption;
- (LPTextRowStyle)bottomCaption;
- (LPTextRowStyle)topCaption;
- (LPVerticalTextStackViewStyle)initWithPlatform:(int64_t)a3 sizeClass:(unint64_t)a4 fontScalingFactor:(double)a5;
- (unsigned)maximumNumberOfLines;
- (void)applyToAllTextViewStyles:(id)a3;
- (void)applyToLowerTextRowStyles:(id)a3;
- (void)setFirstLineLeading:(id)a3;
- (void)setLastLineDescent:(id)a3;
- (void)setMaximumNumberOfLines:(unsigned int)a3;
- (void)setShouldAlignToBaselines:(BOOL)a3;
@end

@implementation LPVerticalTextStackViewStyle

- (LPVerticalTextStackViewStyle)initWithPlatform:(int64_t)a3 sizeClass:(unint64_t)a4 fontScalingFactor:(double)a5
{
  v53.receiver = self;
  v53.super_class = (Class)LPVerticalTextStackViewStyle;
  v8 = [(LPVerticalTextStackViewStyle *)&v53 init];
  if (v8)
  {
    uint64_t v9 = +[LPPointUnit zero];
    firstLineLeading = v8->_firstLineLeading;
    v8->_firstLineLeading = (LPPointUnit *)v9;

    uint64_t v11 = +[LPPointUnit zero];
    lastLineDescent = v8->_lastLineDescent;
    v8->_lastLineDescent = (LPPointUnit *)v11;

    v8->_shouldAlignToBaselines = 1;
    v13 = topCaptionFont(a3, a4);
    v14 = [[LPTextRowStyle alloc] initWithPlatform:a3 fontScalingFactor:a5];
    aboveTopCaption = v8->_aboveTopCaption;
    v8->_aboveTopCaption = v14;

    v16 = [(LPTextRowStyle *)v8->_aboveTopCaption leading];
    [v16 setFont:v13];

    v17 = [(LPTextRowStyle *)v8->_aboveTopCaption trailing];
    [v17 setFont:v13];

    v18 = [[LPTextRowStyle alloc] initWithPlatform:a3 fontScalingFactor:a5];
    topCaption = v8->_topCaption;
    v8->_topCaption = v18;

    v20 = [(LPTextRowStyle *)v8->_topCaption leading];
    [v20 setFont:v13];

    v21 = [(LPTextRowStyle *)v8->_topCaption trailing];
    [v21 setFont:v13];

    v22 = bottomCaptionFont(a3, a4);
    v23 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v24 = [[LPTextRowStyle alloc] initWithPlatform:a3 fontScalingFactor:a5];
    bottomCaption = v8->_bottomCaption;
    v8->_bottomCaption = v24;

    v26 = [(LPTextRowStyle *)v8->_bottomCaption leading];
    [v26 setFont:v22];

    v27 = [(LPTextRowStyle *)v8->_bottomCaption trailing];
    [v27 setFont:v22];

    v28 = [(LPTextRowStyle *)v8->_bottomCaption leading];
    [v28 setColor:v23];

    v29 = [(LPTextRowStyle *)v8->_bottomCaption trailing];
    [v29 setColor:v23];

    v30 = [[LPTextRowStyle alloc] initWithPlatform:a3 fontScalingFactor:a5];
    belowBottomCaption = v8->_belowBottomCaption;
    v8->_belowBottomCaption = v30;

    v32 = [(LPTextRowStyle *)v8->_belowBottomCaption leading];
    [v32 setFont:v22];

    v33 = [(LPTextRowStyle *)v8->_belowBottomCaption trailing];
    [v33 setFont:v22];

    v34 = [(LPTextRowStyle *)v8->_belowBottomCaption leading];
    [v34 setColor:v23];

    v35 = [(LPTextRowStyle *)v8->_belowBottomCaption trailing];
    [v35 setColor:v23];

    switch(a3)
    {
      case 0:
      case 6:
        v37 = [LPPointUnit alloc];
        double v39 = 18.0;
        goto LABEL_9;
      case 1:
      case 3:
      case 4:
        v37 = [LPPointUnit alloc];
        double v38 = 14.0;
        goto LABEL_10;
      case 2:
        v37 = [LPPointUnit alloc];
        double v39 = 12.5;
        goto LABEL_9;
      case 5:
        v37 = [LPPointUnit alloc];
        if (a4 == 5) {
          double v39 = 17.0;
        }
        else {
          double v39 = 19.0;
        }
LABEL_9:
        double v38 = a5 * v39;
LABEL_10:
        v36 = [(LPPointUnit *)v37 initWithValue:v38];
        break;
      default:
        break;
    }
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __77__LPVerticalTextStackViewStyle_initWithPlatform_sizeClass_fontScalingFactor___block_invoke;
    v51[3] = &unk_1E5B06400;
    v40 = v36;
    v52 = v40;
    [(LPVerticalTextStackViewStyle *)v8 applyToAllTextViewStyles:v51];
    v41 = objc_alloc_init(LPPadding);
    captionTextPadding = v8->_captionTextPadding;
    v8->_captionTextPadding = v41;

    v43 = outerHorizontalTextMargin((id)a3);
    [(LPPadding *)v8->_captionTextPadding setLeading:v43];

    v44 = outerHorizontalTextMargin((id)a3);
    [(LPPadding *)v8->_captionTextPadding setTrailing:v44];

    v45 = objc_alloc_init(LPPadding);
    emailCompatibleMargin = v8->_emailCompatibleMargin;
    v8->_emailCompatibleMargin = v45;

    if (!initWithPlatform_sizeClass_fontScalingFactor__emailCompatibleVerticalMargin)
    {
      v47 = [[LPPointUnit alloc] initWithValue:8.0];
      v48 = (void *)initWithPlatform_sizeClass_fontScalingFactor__emailCompatibleVerticalMargin;
      initWithPlatform_sizeClass_fontScalingFactor__emailCompatibleVerticalMargin = (uint64_t)v47;
    }
    -[LPPadding setTop:](v8->_emailCompatibleMargin, "setTop:");
    [(LPPadding *)v8->_emailCompatibleMargin setBottom:initWithPlatform_sizeClass_fontScalingFactor__emailCompatibleVerticalMargin];
    v49 = v8;
  }
  return v8;
}

uint64_t __77__LPVerticalTextStackViewStyle_initWithPlatform_sizeClass_fontScalingFactor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFirstLineLeading:*(void *)(a1 + 32)];
}

- (void)applyToAllTextViewStyles:(id)a3
{
  id v4 = a3;
  -[LPTextRowStyle applyToAllTextViewStyles:](self->_aboveTopCaption, "applyToAllTextViewStyles:");
  [(LPTextRowStyle *)self->_topCaption applyToAllTextViewStyles:v4];
  [(LPTextRowStyle *)self->_bottomCaption applyToAllTextViewStyles:v4];
  [(LPTextRowStyle *)self->_belowBottomCaption applyToAllTextViewStyles:v4];
}

- (void)applyToLowerTextRowStyles:(id)a3
{
  id v4 = (void (**)(id, LPTextRowStyle *))a3;
  v4[2](v4, self->_bottomCaption);
  v4[2](v4, self->_belowBottomCaption);
}

- (LPPointUnit)firstLineLeading
{
  return self->_firstLineLeading;
}

- (void)setFirstLineLeading:(id)a3
{
}

- (LPPointUnit)lastLineDescent
{
  return self->_lastLineDescent;
}

- (void)setLastLineDescent:(id)a3
{
}

- (LPTextRowStyle)aboveTopCaption
{
  return self->_aboveTopCaption;
}

- (LPTextRowStyle)topCaption
{
  return self->_topCaption;
}

- (LPTextRowStyle)bottomCaption
{
  return self->_bottomCaption;
}

- (LPTextRowStyle)belowBottomCaption
{
  return self->_belowBottomCaption;
}

- (unsigned)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

- (void)setMaximumNumberOfLines:(unsigned int)a3
{
  self->_maximumNumberOfLines = a3;
}

- (BOOL)shouldAlignToBaselines
{
  return self->_shouldAlignToBaselines;
}

- (void)setShouldAlignToBaselines:(BOOL)a3
{
  self->_shouldAlignToBaselines = a3;
}

- (LPPadding)captionTextPadding
{
  return self->_captionTextPadding;
}

- (LPPadding)emailCompatibleMargin
{
  return self->_emailCompatibleMargin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailCompatibleMargin, 0);
  objc_storeStrong((id *)&self->_captionTextPadding, 0);
  objc_storeStrong((id *)&self->_belowBottomCaption, 0);
  objc_storeStrong((id *)&self->_bottomCaption, 0);
  objc_storeStrong((id *)&self->_topCaption, 0);
  objc_storeStrong((id *)&self->_aboveTopCaption, 0);
  objc_storeStrong((id *)&self->_lastLineDescent, 0);

  objc_storeStrong((id *)&self->_firstLineLeading, 0);
}

@end