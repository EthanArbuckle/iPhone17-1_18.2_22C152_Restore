@interface WKFullscreenStackView
- (WKFullscreenStackView)init;
- (id).cxx_construct;
- (void)addArrangedSubview:(id)a3 applyingMaterialStyle:(int64_t)a4 tintEffectStyle:(int64_t)a5;
- (void)layoutSubviews;
@end

@implementation WKFullscreenStackView

- (WKFullscreenStackView)init
{
  v2 = -[WKFullscreenStackView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  v3 = v2;
  if (v2)
  {
    [(WKFullscreenStackView *)v2 setClipsToBounds:1];
    v4 = objc_msgSend(objc_alloc((Class)getAVBackgroundViewClass()), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
    m_ptr = v3->_backgroundView.m_ptr;
    v3->_backgroundView.m_ptr = v4;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v4 = v3->_backgroundView.m_ptr;
    }
    [v4 setClipsToBounds:1];
    objc_msgSend((id)objc_msgSend(v3->_backgroundView.m_ptr, "layer"), "setContinuousCorners:", 1);
    objc_msgSend((id)objc_msgSend(v3->_backgroundView.m_ptr, "layer"), "setCornerRadius:", 16.0);
    v6 = (void *)[v3->_backgroundView.m_ptr layer];
    [v6 setCornerCurve:*MEMORY[0x1E4F39EA0]];
    [(WKFullscreenStackView *)v3 addSubview:v3->_backgroundView.m_ptr];
  }
  return v3;
}

- (void)addArrangedSubview:(id)a3 applyingMaterialStyle:(int64_t)a4 tintEffectStyle:(int64_t)a5
{
  [self->_backgroundView.m_ptr addSubview:a3 applyingMaterialStyle:a4 tintEffectStyle:a5];

  [(WKFullscreenStackView *)self addArrangedSubview:a3];
}

- (void)layoutSubviews
{
  m_ptr = self->_backgroundView.m_ptr;
  [(WKFullscreenStackView *)self bounds];
  objc_msgSend(m_ptr, "setFrame:");
  v4.receiver = self;
  v4.super_class = (Class)WKFullscreenStackView;
  [(WKFullscreenStackView *)&v4 layoutSubviews];
}

- (void).cxx_destruct
{
  m_ptr = self->_backgroundView.m_ptr;
  self->_backgroundView.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 55) = 0;
  return self;
}

@end