@interface CNPhotoPickerAnimojiPosePreviewView
- (AVTView)avtView;
- (CAShapeLayer)clippingLayer;
- (void)layoutSubviews;
- (void)setClippingLayer:(id)a3;
- (void)setupPreview;
- (void)updatePoseWithConfiguration:(id)a3;
- (void)updatePreviewWithItem:(id)a3;
@end

@implementation CNPhotoPickerAnimojiPosePreviewView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clippingLayer, 0);

  objc_storeStrong((id *)&self->_avtView, 0);
}

- (void)setClippingLayer:(id)a3
{
}

- (CAShapeLayer)clippingLayer
{
  return self->_clippingLayer;
}

- (AVTView)avtView
{
  return self->_avtView;
}

- (void)updatePoseWithConfiguration:(id)a3
{
  id v4 = a3;
  [v4 loadIfNeeded];
  v5 = [(CNPhotoPickerAnimojiPosePreviewView *)self avtView];
  v6 = [v5 avatar];

  [v6 stopTransitionAnimation];
  v7 = [v4 poseAnimation];

  v8 = [v7 staticPose];

  v9 = [v6 pose];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__CNPhotoPickerAnimojiPosePreviewView_updatePoseWithConfiguration___block_invoke;
  v11[3] = &unk_1E549BF80;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v6 transitionFromPose:v9 toPose:v10 duration:v11 delay:0.25 completionHandler:0.0];
}

void __67__CNPhotoPickerAnimojiPosePreviewView_updatePoseWithConfiguration___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) avtView];
  v2 = [v3 avatar];
  [v2 setPose:*(void *)(a1 + 40)];
}

- (void)updatePreviewWithItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [(CNPhotoPickerAnimojiPosePreviewView *)self avtView];
    v9 = [v8 avatar];

    if (v9)
    {
      id v10 = [v7 poseConfiguration];
      [(CNPhotoPickerAnimojiPosePreviewView *)self updatePoseWithConfiguration:v10];
    }
    else
    {
      uint64_t v17 = 0;
      v18 = &v17;
      uint64_t v19 = 0x2050000000;
      v11 = (void *)getAVTAvatarRecordRenderingClass_softClass_54544;
      uint64_t v20 = getAVTAvatarRecordRenderingClass_softClass_54544;
      if (!getAVTAvatarRecordRenderingClass_softClass_54544)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __getAVTAvatarRecordRenderingClass_block_invoke_54545;
        v16[3] = &unk_1E549AD00;
        v16[4] = &v17;
        __getAVTAvatarRecordRenderingClass_block_invoke_54545((uint64_t)v16);
        v11 = (void *)v18[3];
      }
      id v12 = v11;
      _Block_object_dispose(&v17, 8);
      v13 = [v7 avatarRecord];
      v14 = [v12 avatarForRecord:v13];
      v15 = [(CNPhotoPickerAnimojiPosePreviewView *)self avtView];
      [v15 setAvatar:v14];
    }
  }
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)CNPhotoPickerAnimojiPosePreviewView;
  [(CNPhotoPickerPreviewView *)&v8 layoutSubviews];
  id v3 = (void *)MEMORY[0x1E4FB14C0];
  id v4 = [(CNPhotoPickerAnimojiPosePreviewView *)self avtView];
  [v4 bounds];
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  id v5 = objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 CGPath];
  id v7 = [(CNPhotoPickerAnimojiPosePreviewView *)self clippingLayer];
  [v7 setPath:v6];
}

- (void)setupPreview
{
  [(CNPhotoPickerAnimojiPosePreviewView *)self frame];
  double v4 = v3;
  [(CNPhotoPickerAnimojiPosePreviewView *)self frame];
  double v6 = v5;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  id v7 = (void *)getAVTViewClass_softClass_54566;
  uint64_t v20 = getAVTViewClass_softClass_54566;
  if (!getAVTViewClass_softClass_54566)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __getAVTViewClass_block_invoke_54567;
    v16[3] = &unk_1E549AD00;
    v16[4] = &v17;
    __getAVTViewClass_block_invoke_54567((uint64_t)v16);
    id v7 = (void *)v18[3];
  }
  objc_super v8 = v7;
  _Block_object_dispose(&v17, 8);
  v9 = (AVTView *)objc_msgSend([v8 alloc], "initWithFrame:", 0.0, 0.0, v4, v6);
  avtView = self->_avtView;
  self->_avtView = v9;

  [(AVTView *)self->_avtView setEnableFaceTracking:0];
  [(AVTView *)self->_avtView setAutoresizingMask:18];
  v11 = +[CNUIColorRepository photoPickerAvatarBackgroundDefaultColor];
  [(AVTView *)self->_avtView setBackgroundColor:v11];

  [(CNPhotoPickerAnimojiPosePreviewView *)self addSubview:self->_avtView];
  id v12 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
  clippingLayer = self->_clippingLayer;
  self->_clippingLayer = v12;

  v14 = self->_clippingLayer;
  v15 = [(AVTView *)self->_avtView layer];
  [v15 setMask:v14];
}

@end