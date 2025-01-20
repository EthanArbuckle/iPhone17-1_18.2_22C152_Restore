@interface EKTextViewWithLabelTextMetrics
- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4;
- (EKTextViewWithLabelTextMetrics)initWithFrame:(CGRect)a3;
- (int64_t)lineBreakMode;
- (int64_t)numberOfLines;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setURL:(id)a3;
@end

@implementation EKTextViewWithLabelTextMetrics

- (EKTextViewWithLabelTextMetrics)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EKTextViewWithLabelTextMetrics;
  v3 = -[EKTextViewWithLabelTextMetrics initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(EKTextViewWithLabelTextMetrics *)v3 textLayoutManager];
    [v5 setLimitsLayoutForSuspiciousContents:1];

    [(EKTextViewWithLabelTextMetrics *)v4 setDataDetectorTypes:0];
    [(EKTextViewWithLabelTextMetrics *)v4 setEditable:0];
    [(EKTextViewWithLabelTextMetrics *)v4 setScrollEnabled:0];
    [(EKTextViewWithLabelTextMetrics *)v4 setLineBreakMode:4];
    -[EKTextViewWithLabelTextMetrics setTextContainerInset:](v4, "setTextContainerInset:", 4.0, 0.0, 8.0, 0.0);
    v6 = [(EKTextViewWithLabelTextMetrics *)v4 textContainer];
    [v6 setLineFragmentPadding:0.0];
  }
  return v4;
}

- (void)setURL:(id)a3
{
  id v4 = [a3 absoluteString];
  [(EKTextViewWithLabelTextMetrics *)self setText:v4];
}

- (int64_t)numberOfLines
{
  return 0;
}

- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double v7 = *MEMORY[0x1E4F1DAD8];
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v9 = [(EKTextViewWithLabelTextMetrics *)self text];
  v10 = [(EKTextViewWithLabelTextMetrics *)self font];
  objc_msgSend(v9, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v10, -[EKTextViewWithLabelTextMetrics lineBreakMode](self, "lineBreakMode"), width, height);
  double v12 = v11;
  double v14 = v13;

  double v15 = round(v12);
  double v16 = round(v14);
  double v17 = v7;
  double v18 = v8;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (int64_t)lineBreakMode
{
  return self->lineBreakMode;
}

- (void)setLineBreakMode:(int64_t)a3
{
  self->lineBreakMode = a3;
}

@end