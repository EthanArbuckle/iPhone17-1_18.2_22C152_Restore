@interface WKLayerHostView
+ (Class)layerClass;
- (BOOL)clipsToBounds;
- (UIView)visibilityPropagationView;
- (id).cxx_construct;
- (id)window;
- (unsigned)contextID;
- (void)setContextID:(unsigned int)a3;
- (void)setVisibilityPropagationView:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation WKLayerHostView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (unsigned)contextID
{
  id v2 = [(WKLayerHostView *)self layerHost];

  return [v2 contextId];
}

- (void)setContextID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(WKLayerHostView *)self layerHost];

  [v4 setContextId:v3];
}

- (BOOL)clipsToBounds
{
  return 0;
}

- (void)willMoveToWindow:(id)a3
{
  objc_storeWeak(&self->_window.m_weakReference, a3);
  v5.receiver = self;
  v5.super_class = (Class)WKLayerHostView;
  [(WKLayerHostView *)&v5 willMoveToWindow:a3];
}

- (id)window
{
  id result = objc_loadWeakRetained(&self->_window.m_weakReference);
  if (result)
  {
    CFRelease(result);
    v4.receiver = self;
    v4.super_class = (Class)WKLayerHostView;
    return [(WKLayerHostView *)&v4 window];
  }
  return result;
}

- (UIView)visibilityPropagationView
{
  return (UIView *)self->_visibilityPropagationView.m_ptr;
}

- (void)setVisibilityPropagationView:(id)a3
{
  [self->_visibilityPropagationView.m_ptr removeFromSuperview];
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = self->_visibilityPropagationView.m_ptr;
  self->_visibilityPropagationView.m_ptr = a3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    a3 = self->_visibilityPropagationView.m_ptr;
  }

  [(WKLayerHostView *)self addSubview:a3];
}

- (void).cxx_destruct
{
  m_ptr = self->_hostingView.m_ptr;
  self->_hostingView.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  objc_super v4 = self->_visibilityPropagationView.m_ptr;
  self->_visibilityPropagationView.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }

  objc_destroyWeak(&self->_window.m_weakReference);
}

- (id).cxx_construct
{
  *((void *)self + 51) = 0;
  *((void *)self + 52) = 0;
  *((void *)self + 53) = 0;
  return self;
}

@end