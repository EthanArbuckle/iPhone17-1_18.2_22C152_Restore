@interface CKVibrantBalloonContainerView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKVibrantBalloonContainerView)initWithAudioBallonView:(id)a3 frame:(CGRect)a4;
- (CKVibrantBalloonContainerView)initWithTextBalloonView:(id)a3 frame:(CGRect)a4;
- (void)_commonInitWithVibrantBalloon:(id)a3;
- (void)_setupVisualEffectViews;
- (void)layoutSubviews;
- (void)setBlurEffect:(id)a3;
- (void)setColorOverlay:(id)a3;
- (void)setVibrancyEffect:(id)a3;
@end

@implementation CKVibrantBalloonContainerView

- (CKVibrantBalloonContainerView)initWithTextBalloonView:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKVibrantBalloonContainerView;
  v10 = -[CKVibrantBalloonContainerView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10) {
    [(CKVibrantBalloonContainerView *)v10 _commonInitWithVibrantBalloon:v9];
  }

  return v11;
}

- (CKVibrantBalloonContainerView)initWithAudioBallonView:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKVibrantBalloonContainerView;
  v10 = -[CKVibrantBalloonContainerView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10) {
    [(CKVibrantBalloonContainerView *)v10 _commonInitWithVibrantBalloon:v9];
  }

  return v11;
}

- (void)_commonInitWithVibrantBalloon:(id)a3
{
  objc_storeStrong((id *)&self->_vibrantBalloonView, a3);

  [(CKVibrantBalloonContainerView *)self _setupVisualEffectViews];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)CKVibrantBalloonContainerView;
  [(CKVibrantBalloonContainerView *)&v6 layoutSubviews];
  blurView = self->_blurView;
  [(CKVibrantBalloonContainerView *)self bounds];
  -[UIVisualEffectView setFrame:](blurView, "setFrame:");
  vibrantView = self->_vibrantView;
  [(CKVibrantBalloonContainerView *)self bounds];
  -[UIVisualEffectView setFrame:](vibrantView, "setFrame:");
  vibrantBalloonView = self->_vibrantBalloonView;
  [(CKVibrantBalloonContainerView *)self bounds];
  -[CKBalloonVibrancy setFrame:](vibrantBalloonView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[CKBalloonVibrancy sizeThatFits:](self->_vibrantBalloonView, "sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(CKBalloonVibrancy *)self->_vibrantBalloonView intrinsicContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)_setupVisualEffectViews
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F43028]);
  uint64_t v4 = [MEMORY[0x1E4F427D8] effectWithStyle:10];
  [v3 setEffect:v4];
  v17 = v3;
  objc_storeStrong((id *)&self->_blurView, v3);
  [(CKVibrantBalloonContainerView *)self addSubview:self->_blurView];
  id v5 = objc_alloc_init(MEMORY[0x1E4F43028]);
  v16 = (void *)v4;
  objc_super v6 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v4 style:2];
  [v5 setEffect:v6];

  objc_storeStrong((id *)&self->_vibrantView, v5);
  v7 = [(UIVisualEffectView *)self->_blurView contentView];
  [v7 addSubview:self->_vibrantView];

  v8 = [(CKBalloonVibrancy *)self->_vibrantBalloonView nonVibrantSubViews];
  [(CKBalloonVibrancy *)self->_vibrantBalloonView vibrantContainerWillReparentNonVibrantSubviews:v8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v14 removeFromSuperview];
        [(CKVibrantBalloonContainerView *)self addSubview:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  v15 = [(UIVisualEffectView *)self->_vibrantView contentView];
  [v15 addSubview:self->_vibrantBalloonView];

  [(UIVisualEffectView *)self->_blurView setMaskView:self->_vibrantBalloonView];
}

- (void)setBlurEffect:(id)a3
{
  blurView = self->_blurView;
  id v5 = a3;
  [(UIVisualEffectView *)blurView setEffect:v5];
  [(UIVisualEffectView *)self->_vibrantView setEffect:v5];
}

- (void)setVibrancyEffect:(id)a3
{
}

- (void)setColorOverlay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrantView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);

  objc_storeStrong((id *)&self->_vibrantBalloonView, 0);
}

@end