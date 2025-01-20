@interface CKTextReplyPreviewBalloonView
- (BOOL)hasBackground;
- (BOOL)isFromMe;
- (BOOL)shouldUseFilledBalloonStyle;
- (CGSize)_minimumFittingSize;
- (CGSize)_textSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4 isSingleLine:(BOOL *)a5;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4 isSingleLine:(BOOL *)a5;
- (CKBalloonDescriptor_t)balloonDescriptor;
- (CKTextReplyPreviewBalloonView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)alignmentRectInsets;
- (UIEdgeInsets)targetTextContainerInsets;
- (id)description;
- (void)addFilter:(id)a3;
- (void)clearFilters;
- (void)configureForMessagePart:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setIsFromMe:(BOOL)a3;
- (void)setShouldUseFilledBalloonStyle:(BOOL)a3;
@end

@implementation CKTextReplyPreviewBalloonView

- (void)configureForMessagePart:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKTextReplyPreviewBalloonView;
  [(CKTextBalloonView *)&v6 configureForMessagePart:v4];
  if (v4) {
    [v4 balloonDescriptor];
  }
  else {
    memset(v5, 0, sizeof(v5));
  }
  [(CKColoredBalloonView *)self setBalloonDescriptor:v5];
  -[CKTextReplyPreviewBalloonView setIsFromMe:](self, "setIsFromMe:", [v4 isFromMe]);
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)CKTextReplyPreviewBalloonView;
  id v4 = [(CKTextBalloonView *)&v9 textView];
  v8.receiver = self;
  v8.super_class = (Class)CKTextReplyPreviewBalloonView;
  v5 = [(CKTextBalloonView *)&v8 description];
  objc_super v6 = [v3 stringWithFormat:@"[CKTextReplyPreviewBalloonView textView:%@ %@]", v4, v5];

  return v6;
}

- (CKTextReplyPreviewBalloonView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKTextReplyPreviewBalloonView;
  v3 = -[CKTextBalloonView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    v5 = [(CKTextBalloonView *)v3 textView];
    [(CKTextReplyPreviewBalloonView *)v4 targetTextContainerInsets];
    objc_msgSend(v5, "setTextContainerInset:");
    [v5 setSelectable:0];
    objc_super v6 = [v5 textContainer];
    v7 = +[CKUIBehavior sharedBehaviors];
    objc_msgSend(v6, "setMaximumNumberOfLines:", objc_msgSend(v7, "replyBalloonMaximumNumberOfLines"));

    [v6 setLineBreakMode:4];
    [(CKTextReplyPreviewBalloonView *)v4 setIsFromMe:0];
    objc_super v8 = [(CKBalloonView *)v4 doubleTapGestureRecognizer];
    [v8 setEnabled:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)CKTextReplyPreviewBalloonView;
  [(CKTextBalloonView *)&v39 layoutSubviews];
  v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v4 = [v3 isExpressiveTextEnabled];

  if ((v4 & 1) == 0)
  {
    [(CKTextReplyPreviewBalloonView *)self bounds];
    -[CKTextReplyPreviewBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(CKBalloonView *)self textAlignmentInsets];
    double v14 = v13;
    double v16 = v15;
    double v18 = v15 + v17;
    double v20 = v12 + v13 + v19;
    if ([(CKTextBalloonView *)self containsExcessiveLineHeightCharacters])
    {
      v21 = +[CKUIBehavior sharedBehaviors];
      [v21 transcriptTextFontLanguageAwareOutsets];
      double v23 = v22;
      double v38 = v10;
      double v24 = v8;
      double v25 = v6;
      double v27 = v26;

      double v28 = v23 + v27;
      double v6 = v25;
      double v8 = v24;
      double v10 = v38;
      double v20 = v20 + v28;
    }
    double v29 = v6 - v16;
    double v30 = v8 - v14;
    double v31 = v10 + v18;
    if (CKMainScreenScale_once_73 != -1) {
      dispatch_once(&CKMainScreenScale_once_73, &__block_literal_global_183);
    }
    double v32 = *(double *)&CKMainScreenScale_sMainScreenScale_73;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_73 == 0.0) {
      double v32 = 1.0;
    }
    double v33 = floor(v29 * v32) / v32;
    double v34 = ceil(v31 * v32) / v32;
    double v35 = floor(v30 * v32) / v32;
    double v36 = ceil(v20 * v32) / v32;
    v37 = [(CKTextBalloonView *)self textView];
    objc_msgSend(v37, "setFrame:", v33, v35, v34, v36);
  }
}

- (UIEdgeInsets)targetTextContainerInsets
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 replyBalloonTextContainerInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  int v2 = [(CKBalloonView *)self orientation];
  double v3 = +[CKUIBehavior sharedBehaviors];
  [v3 textReplyPreviewBalloonAlignmentRectInsets];
  double v7 = v6;
  double v9 = v8;
  if (v2) {
    double v10 = v4;
  }
  else {
    double v10 = v5;
  }
  if (v2) {
    double v11 = v5;
  }
  else {
    double v11 = v4;
  }

  double v12 = +[CKUIBehavior sharedBehaviors];
  [v12 textAlignmentRectInsetsScaleFactor];
  double v14 = v7 * v13;
  double v15 = v10 * v13;
  double v16 = v9 * v13;
  double v17 = v11 * v13;

  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  double v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKTextReplyPreviewBalloonView;
  [(CKTextBalloonView *)&v4 prepareForReuse];
  double v3 = [(CKTextBalloonView *)self textView];
  [v3 setHidden:0];

  [(CKTextBalloonView *)self setContainsExcessiveLineHeightCharacters:0];
}

- (CGSize)_textSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4 isSingleLine:(BOOL *)a5
{
  double height = a3.height;
  double width = a3.width;
  double v9 = [(CKTextBalloonView *)self textView];
  objc_msgSend(v9, "sizeThatFits:textAlignmentInsets:isSingleLine:isReplyPreview:", a4, a5, 1, width, height);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (CGSize)_minimumFittingSize
{
  if ([(CKBalloonView *)self hasTail]) {
    uint64_t v3 = [(CKBalloonView *)self balloonTailShape];
  }
  else {
    uint64_t v3 = 0;
  }
  objc_super v4 = +[CKUIBehavior sharedBehaviors];
  [v4 skinnyReplyBalloonMaskSizeWithTailShape:v3];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4 isSingleLine:(BOOL *)a5
{
  double height = a3.height;
  double width = a3.width;
  double v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v11 = [v10 isExpressiveTextEnabled];

  if (v11)
  {
    v49.receiver = self;
    v49.super_class = (Class)CKTextReplyPreviewBalloonView;
    -[CKTextBalloonView sizeThatFits:textAlignmentInsets:isSingleLine:](&v49, sel_sizeThatFits_textAlignmentInsets_isSingleLine_, a4, a5, width, height);
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v16 = [(CKTextBalloonView *)self textView];
    -[UIView __ck_alignmentRectSizeForFrameSize:](self, "__ck_alignmentRectSizeForFrameSize:", width, height);
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
    long long v47 = *MEMORY[0x1E4F437F8];
    long long v48 = v17;
    objc_msgSend(v16, "sizeThatFits:textAlignmentInsets:isSingleLine:isReplyPreview:", &v47, a5, 1);
    double v19 = v18;
    double v21 = v20;
    [(CKTextReplyPreviewBalloonView *)self alignmentRectInsets];
    if (*((double *)&v47 + 1) >= v23) {
      double v26 = v23;
    }
    else {
      double v26 = *((double *)&v47 + 1);
    }
    if (*((double *)&v48 + 1) >= v25) {
      double v27 = v25;
    }
    else {
      double v27 = *((double *)&v48 + 1);
    }
    if (*(double *)&v47 >= v22) {
      double v28 = v22;
    }
    else {
      double v28 = *(double *)&v47;
    }
    if (*(double *)&v48 >= v24) {
      double v29 = v24;
    }
    else {
      double v29 = *(double *)&v48;
    }
    if (CKMainScreenScale_once_73 != -1) {
      dispatch_once(&CKMainScreenScale_once_73, &__block_literal_global_183);
    }
    double v30 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_73 != 0.0) {
      double v30 = *(double *)&CKMainScreenScale_sMainScreenScale_73;
    }
    -[UIView __ck_frameSizeForAlignmentRectSize:](self, "__ck_frameSizeForAlignmentRectSize:", ceil((v19 - (v26 + v27)) * v30) / v30, ceil((v21 - (v28 + v29)) * v30) / v30);
    double v32 = v31;
    double v34 = v33;
    if ([(CKBalloonView *)self hasTail]) {
      uint64_t v35 = [(CKBalloonView *)self balloonTailShape];
    }
    else {
      uint64_t v35 = 0;
    }
    double v36 = +[CKUIBehavior sharedBehaviors];
    [v36 skinnyReplyBalloonMaskSizeWithTailShape:v35];
    double v38 = v37;
    double v40 = v39;

    if (v32 < v38)
    {
      double v46 = v34;
      double v41 = (v38 - v32) * 0.5;
      if (CKMainScreenScale_once_73 != -1) {
        dispatch_once(&CKMainScreenScale_once_73, &__block_literal_global_183);
      }
      double v42 = *(double *)&CKMainScreenScale_sMainScreenScale_73;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_73 == 0.0) {
        double v42 = 1.0;
      }
      double v27 = v27 - floor(v41 * v42) / v42;
      double v43 = *(double *)&CKMainScreenScale_sMainScreenScale_73;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_73 == 0.0) {
        double v43 = 1.0;
      }
      double v26 = v26 - floor(v41 * v43) / v43;
      double v34 = v46;
    }
    if (a4)
    {
      a4->top = v28;
      a4->left = v26;
      a4->bottom = v29;
      a4->right = v27;
    }
    double v13 = fmax(v32, v38);
    double v15 = fmax(v34, v40);
  }
  double v44 = v13;
  double v45 = v15;
  result.double height = v45;
  result.double width = v44;
  return result;
}

- (BOOL)hasBackground
{
  return 0;
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v6.receiver = self;
  v6.super_class = (Class)CKTextReplyPreviewBalloonView;
  [(CKBalloonDescriptor_t *)&v6 balloonDescriptor];
  CGSize result = (CKBalloonDescriptor_t *)[(CKTextReplyPreviewBalloonView *)self shouldUseFilledBalloonStyle];
  if (result)
  {
    retstr->var2 = 0;
    retstr->var5 = 4;
  }
  return result;
}

- (void)addFilter:(id)a3
{
  id v4 = a3;
  [(CKTextReplyPreviewBalloonView *)self setShouldUseFilledBalloonStyle:1];
  [(CKTextBalloonView *)self prepareForDisplay];
  v5.receiver = self;
  v5.super_class = (Class)CKTextReplyPreviewBalloonView;
  [(CKTextBalloonView *)&v5 addFilter:v4];
}

- (void)clearFilters
{
  [(CKTextReplyPreviewBalloonView *)self setShouldUseFilledBalloonStyle:0];
  [(CKTextBalloonView *)self prepareForDisplay];
  v3.receiver = self;
  v3.super_class = (Class)CKTextReplyPreviewBalloonView;
  [(CKTextBalloonView *)&v3 clearFilters];
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (BOOL)shouldUseFilledBalloonStyle
{
  return self->_shouldUseFilledBalloonStyle;
}

- (void)setShouldUseFilledBalloonStyle:(BOOL)a3
{
  self->_shouldUseFilledBalloonStyle = a3;
}

@end