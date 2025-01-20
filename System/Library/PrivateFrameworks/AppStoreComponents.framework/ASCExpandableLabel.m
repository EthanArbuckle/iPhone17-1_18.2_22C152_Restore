@interface ASCExpandableLabel
- (ASCExpandableLabel)initWithFrame:(CGRect)a3;
- (ASCExpandableLabelTruncationButton)moreButton;
- (BOOL)accessibilityActivate;
- (BOOL)isTruncated;
- (BOOL)shouldHideMoreButton;
- (JULanguageAwareString)languageAwareString;
- (void)layoutSubviews;
- (void)setAttributedText:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setFont:(id)a3;
- (void)setLanguageAwareString:(id)a3;
- (void)setText:(id)a3;
@end

@implementation ASCExpandableLabel

- (ASCExpandableLabel)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ASCExpandableLabel;
  v3 = -[ASCSkeletonLabel initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [ASCExpandableLabelTruncationButton alloc];
    uint64_t v5 = -[ASCExpandableLabelTruncationButton initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    moreButton = v3->_moreButton;
    v3->_moreButton = (ASCExpandableLabelTruncationButton *)v5;

    [(ASCExpandableLabelTruncationButton *)v3->_moreButton setHidden:1];
    [(ASCExpandableLabel *)v3 addSubview:v3->_moreButton];
  }
  return v3;
}

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)ASCExpandableLabel;
  [(ASCExpandableLabel *)&v38 layoutSubviews];
  BOOL v3 = [(ASCExpandableLabel *)self shouldHideMoreButton];
  v4 = [(ASCExpandableLabel *)self moreButton];
  uint64_t v5 = v4;
  if (v3)
  {
    uint64_t v6 = 1;
  }
  else
  {
    [(ASCExpandableLabel *)self bounds];
    objc_msgSend(v5, "sizeThatFits:", v7, v8);
    double v10 = v9;
    double v12 = v11;

    [(ASCExpandableLabel *)self bounds];
    double v14 = v13;
    [(ASCExpandableLabel *)self bounds];
    double v16 = v14 + v15 - v10;
    [(ASCExpandableLabel *)self bounds];
    double v18 = v17;
    [(ASCExpandableLabel *)self bounds];
    double v20 = v18 + v19 - v12;
    v21 = [(ASCExpandableLabel *)self languageAwareString];
    uint64_t v22 = objc_msgSend(v21, "writingDirectionOfLine:maximumLinesShown:withWidth:lineBreakMode:cacheLayoutInfo:", -[ASCExpandableLabel numberOfLines](self, "numberOfLines") - 1, -[ASCExpandableLabel numberOfLines](self, "numberOfLines"), -[ASCExpandableLabel lineBreakMode](self, "lineBreakMode"), 1, v10);

    [(ASCExpandableLabel *)self bounds];
    +[__ASCLayoutProxy rectWithLayoutDirectionForRect:layoutDirection:relativeTo:](__ASCLayoutProxy, "rectWithLayoutDirectionForRect:layoutDirection:relativeTo:", v22, v16, v20, v10, v12, v23, v24, v25, v26);
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    v35 = [(ASCExpandableLabel *)self moreButton];
    objc_msgSend(v35, "setFrame:", v28, v30, v32, v34);

    BOOL v36 = v22 == 1;
    v37 = [(ASCExpandableLabel *)self moreButton];
    [v37 setIsRTL:v36];

    v4 = [(ASCExpandableLabel *)self moreButton];
    uint64_t v5 = v4;
    uint64_t v6 = 0;
  }
  [v4 setHidden:v6];
}

- (void)setText:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASCExpandableLabel;
  id v4 = a3;
  [(ASCExpandableLabel *)&v7 setText:v4];
  id v5 = objc_alloc(MEMORY[0x1E4F71DD0]);
  uint64_t v6 = objc_msgSend(v5, "initWithString:attributes:baseParagraphStyle:keepStatisticsOnLanguageComponents:", v4, 0, 0, 0, v7.receiver, v7.super_class);

  [(ASCExpandableLabel *)self setLanguageAwareString:v6];
}

- (void)setAttributedText:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASCExpandableLabel;
  id v4 = a3;
  [(ASCExpandableLabel *)&v7 setAttributedText:v4];
  id v5 = objc_alloc(MEMORY[0x1E4F71DD0]);
  uint64_t v6 = objc_msgSend(v5, "initWithAttributedString:baseParagraphStyle:keepStatisticsOnLanguageComponents:", v4, 0, 0, v7.receiver, v7.super_class);

  [(ASCExpandableLabel *)self setLanguageAwareString:v6];
}

- (void)setFont:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASCExpandableLabel;
  id v4 = a3;
  [(ASCExpandableLabel *)&v6 setFont:v4];
  id v5 = [(ASCExpandableLabel *)self moreButton];
  [v5 setFont:v4];
}

- (void)setBackgroundColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASCExpandableLabel;
  id v4 = a3;
  [(ASCExpandableLabel *)&v6 setBackgroundColor:v4];
  id v5 = [(ASCExpandableLabel *)self moreButton];
  [v5 setGradientColor:v4];
}

- (BOOL)shouldHideMoreButton
{
  BOOL v3 = [(ASCExpandableLabel *)self text];
  if ([v3 length])
  {
    id v4 = [(ASCExpandableLabel *)self attributedText];
    if ([v4 length]) {
      BOOL v5 = ![(ASCExpandableLabel *)self isTruncated];
    }
    else {
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)isTruncated
{
  [(ASCExpandableLabel *)self bounds];
  double v4 = v3;
  [(ASCExpandableLabel *)self bounds];
  double v6 = v5;
  [(ASCExpandableLabel *)self bounds];
  -[ASCExpandableLabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", 0, v4, v6);
  double v8 = v7;
  [(ASCExpandableLabel *)self bounds];
  return v9 < v8;
}

- (BOOL)accessibilityActivate
{
  v2 = [(ASCExpandableLabel *)self moreButton];
  [v2 sendActionsForControlEvents:64];

  return 1;
}

- (ASCExpandableLabelTruncationButton)moreButton
{
  return self->_moreButton;
}

- (JULanguageAwareString)languageAwareString
{
  return self->_languageAwareString;
}

- (void)setLanguageAwareString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageAwareString, 0);

  objc_storeStrong((id *)&self->_moreButton, 0);
}

@end