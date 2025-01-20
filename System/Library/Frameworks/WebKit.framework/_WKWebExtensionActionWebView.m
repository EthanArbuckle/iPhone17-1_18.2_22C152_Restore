@interface _WKWebExtensionActionWebView
- (BOOL)contentSizeHasStabilized;
- (CGSize)contentSize;
- (_WKWebExtensionActionWebView)initWithFrame:(CGRect)a3 configuration:(id)a4 webExtensionAction:(void *)a5;
- (id).cxx_construct;
- (void)_contentSizeDidChange;
- (void)_contentSizeHasStabilized;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation _WKWebExtensionActionWebView

- (_WKWebExtensionActionWebView)initWithFrame:(CGRect)a3 configuration:(id)a4 webExtensionAction:(void *)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_WKWebExtensionActionWebView;
  v12 = -[WKWebView initWithFrame:configuration:](&v19, sel_initWithFrame_configuration_, v11, x, y, width, height);
  if (v12)
  {
    WTF::WeakPtrFactory<WebPushD::PushServiceConnection,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a5 + 4, (uint64_t)a5);
    v14 = (atomic_uint *)*((void *)a5 + 2);
    if (v14) {
      atomic_fetch_add(v14, 1u);
    }
    m_ptr = (unsigned int *)v12->_webExtensionAction.m_impl.m_ptr;
    v12->_webExtensionAction.m_impl.m_ptr = (DefaultWeakPtrImpl *)v14;
    if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v13);
    }
    v16 = [(WKWebView *)v12 scrollView];
    [v16 addObserver:v12 forKeyPath:@"contentSize" options:1 context:kvoContext];

    v17 = v12;
  }

  return v12;
}

- (void)dealloc
{
  v3 = [(WKWebView *)self scrollView];
  [v3 removeObserver:self forKeyPath:@"contentSize" context:kvoContext];

  v4.receiver = self;
  v4.super_class = (Class)_WKWebExtensionActionWebView;
  [(WKWebView *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)kvoContext == a6)
  {
    [(_WKWebExtensionActionWebView *)self _contentSizeDidChange];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_WKWebExtensionActionWebView;
    [(_WKWebExtensionActionWebView *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (CGSize)contentSize
{
  v2 = [(WKWebView *)self scrollView];
  [v2 contentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)_contentSizeDidChange
{
  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (m_ptr && *((void *)m_ptr + 1))
  {
    [(_WKWebExtensionActionWebView *)self contentSize];
    CGFloat v6 = v5;
    CGFloat v7 = v4;
    if (v5 != self->_previousContentSize.width || v4 != self->_previousContentSize.height)
    {
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__contentSizeHasStabilized object:0];
      [(_WKWebExtensionActionWebView *)self performSelector:sel__contentSizeHasStabilized withObject:0 afterDelay:0.075];
      self->_previousContentSize.double width = v6;
      self->_previousContentSize.double height = v7;
    }
  }
}

- (void)_contentSizeHasStabilized
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (m_ptr)
  {
    if (*((void *)m_ptr + 1))
    {
      if (![(WKWebView *)self isLoading])
      {
        [(_WKWebExtensionActionWebView *)self contentSize];
        if (v5 >= 50.0 && v4 >= 50.0)
        {
          self->_contentSizeHasStabilized = 1;
          CGFloat v6 = self->_webExtensionAction.m_impl.m_ptr;
          uint64_t v7 = v6 ? *((void *)v6 + 1) : 0;
          double v8 = *(void **)(v7 + 64);
          WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v8);
          [(id)objc_claimAutoreleasedReturnValue() _updatePopoverContentSize];

          if (*(unsigned char *)(v7 + 180))
          {
            v9 = *(void **)(v7 + 72);
            WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v9);
            [(id)objc_claimAutoreleasedReturnValue() contentSize];
            uint64_t v11 = v10;
            uint64_t v13 = v12;

            v14 = qword_1EB357DF8;
            if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_DEBUG))
            {
              int v15 = 134349312;
              uint64_t v16 = v11;
              __int16 v17 = 2050;
              uint64_t v18 = v13;
              _os_log_debug_impl(&dword_1985F2000, v14, OS_LOG_TYPE_DEBUG, "Presenting popup with size { %{public}.0f, %{public}.0f }", (uint8_t *)&v15, 0x16u);
            }
            WebKit::WebExtensionAction::readyToPresentPopup((WebKit::WebExtensionAction *)v7);
          }
        }
      }
    }
  }
}

- (BOOL)contentSizeHasStabilized
{
  return self->_contentSizeHasStabilized;
}

- (void).cxx_destruct
{
  m_ptr = (unsigned int *)self->_webExtensionAction.m_impl.m_ptr;
  self->_webExtensionAction.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 224) = 0;
  return self;
}

@end