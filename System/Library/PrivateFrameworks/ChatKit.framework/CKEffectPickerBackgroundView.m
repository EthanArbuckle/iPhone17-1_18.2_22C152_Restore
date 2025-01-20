@interface CKEffectPickerBackgroundView
- (CKEffectPickerBackgroundView)initWithFrame:(CGRect)a3;
- (UIVisualEffectView)effectView;
- (void)setBackgroundColorForTranscriptType:(BOOL)a3;
- (void)setEffectView:(id)a3;
@end

@implementation CKEffectPickerBackgroundView

- (CKEffectPickerBackgroundView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKEffectPickerBackgroundView;
  v3 = -[CKEffectPickerBackgroundView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
    [(CKEffectPickerBackgroundView *)v3 setEffectView:v4];

    v5 = [(CKEffectPickerBackgroundView *)v3 effectView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v6 = [(CKEffectPickerBackgroundView *)v3 effectView];
    [(CKEffectPickerBackgroundView *)v3 insertSubview:v6 atIndex:0];

    v7 = [(CKEffectPickerBackgroundView *)v3 effectView];
    objc_msgSend(v7, "__ck_makeEdgesEqualTo:", v3);
  }
  return v3;
}

- (void)setBackgroundColorForTranscriptType:(BOOL)a3
{
  id v7 = +[CKUIBehavior sharedBehaviors];
  v4 = [(CKEffectPickerBackgroundView *)self traitCollection];
  v5 = objc_msgSend(v7, "chromeEffectForInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));
  v6 = [(CKEffectPickerBackgroundView *)self effectView];
  [v6 setEffect:v5];
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end