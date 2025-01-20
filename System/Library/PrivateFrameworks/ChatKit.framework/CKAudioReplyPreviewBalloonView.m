@interface CKAudioReplyPreviewBalloonView
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKAudioReplyPreviewBalloonView)initWithFrame:(CGRect)a3;
- (CKWaveformProgressView)waveformProgressView;
- (UIEdgeInsets)alignmentRectInsets;
- (double)duration;
- (int64_t)waveformContentMode;
- (void)configureForComposition:(id)a3;
- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5;
- (void)configureForMessagePart:(id)a3;
- (void)layoutSubviews;
- (void)prepareForDisplay;
- (void)setDuration:(double)a3;
- (void)setWaveform:(id)a3;
- (void)setWaveformContentMode:(int64_t)a3;
- (void)setWaveformProgressView:(id)a3;
@end

@implementation CKAudioReplyPreviewBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5
{
  uint64_t v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CKAudioReplyPreviewBalloonView;
  id v8 = a3;
  [(CKBalloonView *)&v12 configureForMediaObject:v8 previewWidth:v5 orientation:a4];
  v9 = objc_msgSend(v8, "waveformForOrientation:", v5, v12.receiver, v12.super_class);
  [(CKAudioReplyPreviewBalloonView *)self setWaveform:v9];

  [v8 duration];
  double v11 = v10;

  [(CKAudioReplyPreviewBalloonView *)self setDuration:v11];
}

- (void)configureForComposition:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKAudioReplyPreviewBalloonView;
  id v4 = a3;
  [(CKColoredBalloonView *)&v8 configureForComposition:v4];
  uint64_t v5 = objc_msgSend(v4, "mediaObjects", v8.receiver, v8.super_class);

  v6 = [v5 lastObject];
  v7 = +[CKUIBehavior sharedBehaviors];
  [v7 previewMaxWidth];
  -[CKAudioReplyPreviewBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v6, 1);
}

- (CKAudioReplyPreviewBalloonView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)CKAudioReplyPreviewBalloonView;
  v7 = -[CKColoredBalloonView initWithFrame:](&v13, sel_initWithFrame_);
  if (v7)
  {
    objc_super v8 = -[CKWaveformProgressView initWithFrame:]([CKWaveformProgressView alloc], "initWithFrame:", x, y, width, height);
    waveformProgressView = v7->_waveformProgressView;
    v7->_waveformProgressView = v8;

    [(CKWaveformProgressView *)v7->_waveformProgressView setColor:[(CKBalloonView *)v7 color]];
    [(CKWaveformProgressView *)v7->_waveformProgressView setPlaying:0];
    [(CKWaveformProgressView *)v7->_waveformProgressView setPlayed:0];
    [(CKWaveformProgressView *)v7->_waveformProgressView setCurrentTime:0.0];
    double v10 = v7->_waveformProgressView;
    [(CKAudioReplyPreviewBalloonView *)v7 duration];
    -[CKWaveformProgressView setDuration:](v10, "setDuration:");
    [(CKWaveformProgressView *)v7->_waveformProgressView setContentMode:1];
    [(CKAudioReplyPreviewBalloonView *)v7 addSubview:v7->_waveformProgressView];
    double v11 = [(CKBalloonView *)v7 doubleTapGestureRecognizer];
    [v11 setEnabled:0];
  }
  return v7;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)CKAudioReplyPreviewBalloonView;
  [(CKColoredBalloonView *)&v27 layoutSubviews];
  [(CKAudioReplyPreviewBalloonView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[CKAudioReplyPreviewBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(CKAudioReplyPreviewBalloonView *)self waveformProgressView];
  [v15 frame];
  objc_msgSend(v15, "sizeThatFits:", v4, v6);
  double v17 = v16;
  double v19 = v18;
  v20 = +[CKUIBehavior sharedBehaviors];
  [v20 audioReplyPreviewBalloonAlignmentInsets];
  double v23 = v17 - (v21 + v22);
  double v26 = v19 - (v24 + v25);

  objc_msgSend(v15, "setFrame:", v8 + floor((v12 - v23) * 0.5), v10 + floor((v14 - v26) * 0.5), v23, v26);
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v3 = [(CKBalloonImageView *)self image];
  if (!v3)
  {
    double v4 = [(CKColoredBalloonView *)self mask];
    double v3 = [v4 image];

    if (!v3)
    {
      double v14 = *MEMORY[0x1E4F437F8];
      double v7 = *(double *)(MEMORY[0x1E4F437F8] + 8);
      double v9 = *(double *)(MEMORY[0x1E4F437F8] + 16);
      double v11 = *(double *)(MEMORY[0x1E4F437F8] + 24);
      goto LABEL_9;
    }
  }
  double v5 = +[CKUIBehavior sharedBehaviors];
  [v5 balloonMaskTailSizeForTailShape:1];
  double v7 = v6;

  uint64_t v8 = [v3 imageOrientation];
  double v9 = 0.0;
  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v10 = v8;
  if (v8 != 4)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    double v13 = objc_msgSend(NSString, "stringWithUTF8String:", "UIEdgeInsets CKEdgeInsetsWithImageOrientation(UIEdgeInsets, UIImageOrientation)");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"CKGeometry.h", 429, @"CKEdgeInsetsWithImageOrientation %ld hasn't been implemented", v10);

LABEL_7:
    double v11 = v7;
    double v7 = 0.0;
    goto LABEL_8;
  }
  double v11 = 0.0;
LABEL_8:
  double v14 = 0.0;
LABEL_9:

  double v15 = v14;
  double v16 = v7;
  double v17 = v9;
  double v18 = v11;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double width = a3.width;
  -[UIView __ck_alignmentRectSizeForFrameSize:](self, "__ck_alignmentRectSizeForFrameSize:", a3.width, a3.height);
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CKAudioReplyPreviewBalloonView *)self waveformProgressView];
  objc_msgSend(v11, "sizeThatFits:", v8, v10);
  double v13 = v12;

  double v14 = 0.0;
  -[UIView __ck_frameSizeForAlignmentRectSize:](self, "__ck_frameSizeForAlignmentRectSize:", v13, 0.0);
  double v16 = v15;
  double v17 = v15 - width;
  if (v17 > 0.0)
  {
    double v18 = fmod(v17, 1.0);
    double v19 = +[CKUIBehavior sharedBehaviors];
    unint64_t v20 = [v19 waveformPowerLevelWidthIncrement];

    double v14 = v17 + (double)v20 - (v18 + (double)((unint64_t)v17 % v20));
  }
  double v21 = +[CKUIBehavior sharedBehaviors];
  [(CKColoredBalloonView *)self balloonDescriptor];
  [v21 balloonMaskSizeWithBalloonDescriptor:&v38];
  double v23 = v22;

  double v24 = +[CKUIBehavior sharedBehaviors];
  [v24 audioReplyPreviewBalloonAlignmentInsets];
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;

  if (a4)
  {
    a4->top = v26;
    a4->left = v28;
    a4->bottom = v30;
    a4->right = v32;
  }
  v33 = +[CKUIBehavior sharedBehaviors];
  [v33 audioReplyPreviewBalloonInset];
  double v35 = v16 - v14 - v34;

  double v36 = v35;
  double v37 = v23;
  result.double height = v37;
  result.double width = v36;
  return result;
}

- (void)prepareForDisplay
{
  v5.receiver = self;
  v5.super_class = (Class)CKAudioReplyPreviewBalloonView;
  [(CKColoredBalloonView *)&v5 prepareForDisplay];
  double v3 = [(CKAudioReplyPreviewBalloonView *)self waveformProgressView];
  objc_msgSend(v3, "setColor:", -[CKBalloonView color](self, "color"));

  double v4 = [(CKAudioReplyPreviewBalloonView *)self waveformProgressView];
  [v4 prepareForDisplayIfNeeded];
}

- (void)setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    objc_super v5 = [(CKAudioReplyPreviewBalloonView *)self waveformProgressView];
    [v5 setDuration:a3];

    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setWaveform:(id)a3
{
  id v4 = a3;
  [v4 size];
  if (v6 != 0.0)
  {
    double v7 = v5;
    if (v5 != 0.0)
    {
      double v8 = v6;
      double v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", v5, v6);
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      double v14 = __46__CKAudioReplyPreviewBalloonView_setWaveform___block_invoke;
      double v15 = &unk_1E5628E58;
      id v16 = v4;
      double v17 = self;
      double v18 = v7;
      double v19 = v8;
      double v10 = [v9 imageWithActions:&v12];
      double v11 = [(CKAudioReplyPreviewBalloonView *)self waveformProgressView];
      [v11 setWaveform:v10];
    }
  }
}

void __46__CKAudioReplyPreviewBalloonView_setWaveform___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  v2 = +[CKUIBehavior sharedBehaviors];
  double v3 = [v2 theme];
  id v4 = objc_msgSend(v3, "balloonTextColorForColorType:", objc_msgSend(*(id *)(a1 + 40), "color"));
  [v4 set];

  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = 0;
  uint64_t v8 = 0;

  UIRectFillUsingBlendMode(*(CGRect *)&v7, kCGBlendModeSourceIn);
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)waveformContentMode
{
  return self->_waveformContentMode;
}

- (void)setWaveformContentMode:(int64_t)a3
{
  self->_waveformContentMode = a3;
}

- (CKWaveformProgressView)waveformProgressView
{
  return self->_waveformProgressView;
}

- (void)setWaveformProgressView:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)configureForMessagePart:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKAudioReplyPreviewBalloonView;
  [(CKColoredBalloonView *)&v9 configureForMessagePart:v4];
  uint64_t v5 = [v4 mediaObject];
  uint64_t v6 = +[CKUIBehavior sharedBehaviors];
  [v6 previewMaxWidth];
  -[CKAudioReplyPreviewBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v5, [v4 balloonOrientation], v7);

  if (v4) {
    [v4 balloonDescriptor];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  [(CKColoredBalloonView *)self setBalloonDescriptor:v8];
}

@end