@interface CKDetonatedAttachmentBalloonView
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKDetonatedAttachmentBalloonView)initWithFrame:(CGRect)a3;
- (CKDetonatedAttachmentView)attachmentView;
- (UIEdgeInsets)alignmentRectInsets;
- (id)overlayImage;
- (void)layoutSubviews;
- (void)setAttachmentView:(id)a3;
@end

@implementation CKDetonatedAttachmentBalloonView

- (CKDetonatedAttachmentBalloonView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CKDetonatedAttachmentBalloonView;
  v3 = -[CKColoredBalloonView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [CKDetonatedAttachmentView alloc];
    uint64_t v5 = -[CKDetonatedAttachmentView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    attachmentView = v3->_attachmentView;
    v3->_attachmentView = (CKDetonatedAttachmentView *)v5;

    [(CKDetonatedAttachmentBalloonView *)v3 addSubview:v3->_attachmentView];
    v7 = +[CKUIBehavior sharedBehaviors];
    -[CKColoredBalloonView setColor:](v3, "setColor:", [v7 attachmentBalloonFillColor]);

    v8 = +[CKUIBehavior sharedBehaviors];
    uint64_t v9 = [v8 attachmentBalloonStrokeColor];

    v10 = +[CKUIBehavior sharedBehaviors];
    v11 = [v10 theme];
    v12 = [v11 unfilledBalloonColorForColorType:v9];
    [v12 ckColor];
    -[CKBalloonView setStrokeColor:](v3, "setStrokeColor:");

    v13 = +[CKUIBehavior sharedBehaviors];
    if ([v13 shouldFillAndStrokeAttachmentBalloon]) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 1;
    }
    [(CKBalloonView *)v3 setBalloonStyle:v14];
  }
  return v3;
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)CKDetonatedAttachmentBalloonView;
  [(CKColoredBalloonView *)&v19 layoutSubviews];
  [(CKDetonatedAttachmentBalloonView *)self bounds];
  -[CKDetonatedAttachmentBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[CKDetonatedAttachmentView sizeThatFits:](self->_attachmentView, "sizeThatFits:", v7, v9);
  -[CKDetonatedAttachmentView setFrame:](self->_attachmentView, "setFrame:", 0.0, 0.0, v11, v12);
  attachmentView = self->_attachmentView;
  [(CKDetonatedAttachmentView *)attachmentView frame];
  double v15 = v14;
  double v17 = v16;
  if (CKMainScreenScale_once_90 != -1) {
    dispatch_once(&CKMainScreenScale_once_90, &__block_literal_global_222);
  }
  double v18 = *(double *)&CKMainScreenScale_sMainScreenScale_90;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_90 == 0.0) {
    double v18 = 1.0;
  }
  -[CKDetonatedAttachmentView setFrame:](attachmentView, "setFrame:", 1.0 / v18 * (v4 * v18 + floor((v8 * v18 - v15 * v18) * 0.5)), 1.0 / v18 * (v6 * v18 + floor((v10 * v18 - v17 * v18) * 0.5)), v15 * v18 * (1.0 / v18), v17 * v18 * (1.0 / v18));
}

- (UIEdgeInsets)alignmentRectInsets
{
  int v3 = [(CKBalloonView *)self orientation];
  double v4 = +[CKUIBehavior sharedBehaviors];
  [(CKColoredBalloonView *)self balloonDescriptor];
  [v4 attachmentBalloonAlignmentRectInsetsWithTailShape:v17];
  double v8 = v7;
  double v10 = v9;
  if (v3) {
    double v11 = v5;
  }
  else {
    double v11 = v6;
  }
  if (v3) {
    double v12 = v6;
  }
  else {
    double v12 = v5;
  }

  double v13 = v8;
  double v14 = v11;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double v4 = +[CKUIBehavior sharedBehaviors];
  [v4 detonatedItemBalloonViewSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)overlayImage
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  [(CKColoredBalloonView *)self balloonDescriptor];
  BYTE2(v6) = 0;
  v5[2] = v8;
  v5[3] = v9;
  v5[4] = v10;
  v5[0] = v6;
  v5[1] = v7;
  v2 = CKResizableBalloonMask(v5);
  int v3 = [v2 imageWithRenderingMode:2];

  return v3;
}

- (CKDetonatedAttachmentView)attachmentView
{
  return self->_attachmentView;
}

- (void)setAttachmentView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end