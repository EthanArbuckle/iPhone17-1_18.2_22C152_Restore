@interface WKApplicationStateTrackingView
- (BOOL)isBackground;
- (WKApplicationStateTrackingView)initWithFrame:(CGRect)a3 webView:(id)a4;
- (id).cxx_construct;
- (void)_applicationDidEnterBackground;
- (void)_applicationDidFinishSnapshottingAfterEnteringBackground;
- (void)_applicationWillEnterForeground;
- (void)_didCompleteSnapshotSequence;
- (void)_willBeginSnapshotSequence;
- (void)didMoveToWindow;
- (void)willMoveToWindow:(id)a3;
@end

@implementation WKApplicationStateTrackingView

- (void)willMoveToWindow:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(WKApplicationStateTrackingView *)self window])
  {
    v5 = [(UIView *)[(WKApplicationStateTrackingView *)self _contentView] window];
    if (a3 || !v5) {
      return;
    }
  }
  else if (a3)
  {
    return;
  }
  id Weak = objc_loadWeak(&self->_webViewToTrack.m_weakReference);
  if (Weak) {
    [Weak _page];
  }
  else {
    uint64_t v10 = 0;
  }
  v7 = qword_1EB358730;
  if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
  {
    if (v10)
    {
      uint64_t v8 = *(void *)(*(void *)(v10 + 32) + 760);
      int v9 = *(unsigned __int8 *)(v10 + 1105);
    }
    else
    {
      uint64_t v8 = 0;
      int v9 = 0;
    }
    *(_DWORD *)buf = 134218752;
    v12 = self;
    __int16 v13 = 2048;
    uint64_t v14 = v10;
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    __int16 v17 = 1024;
    int v18 = v9;
    _os_log_impl(&dword_1985F2000, v7, OS_LOG_TYPE_DEFAULT, "%p - WKApplicationStateTrackingView: View with page [%p, pageProxyID=%llu] was removed from a window, _lastObservedStateWasBackground=%d", buf, 0x26u);
  }
  WebKit::ApplicationStateTracker::setWindow((id *)self->_applicationStateTracker.__ptr_.__value_, 0);
}

- (void)didMoveToWindow
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(UIView *)[(WKApplicationStateTrackingView *)self _contentView] window])
  {
    id Weak = objc_loadWeak(&self->_webViewToTrack.m_weakReference);
    if (Weak)
    {
      [Weak _page];
      if (v9) {
        BOOL v4 = *(unsigned __int8 *)(v9 + 1105) != 0;
      }
      else {
        BOOL v4 = 0;
      }
    }
    else
    {
      BOOL v4 = 0;
      uint64_t v9 = 0;
    }
    WebKit::ApplicationStateTracker::setWindow((id *)self->_applicationStateTracker.__ptr_.__value_, [(UIView *)[(WKApplicationStateTrackingView *)self _contentView] window]);
    v5 = qword_1EB358730;
    if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
    {
      if (v9) {
        uint64_t v6 = *(void *)(*(void *)(v9 + 32) + 760);
      }
      else {
        uint64_t v6 = 0;
      }
      BOOL v7 = [(WKApplicationStateTrackingView *)self isBackground];
      *(_DWORD *)buf = 134219008;
      v11 = self;
      __int16 v12 = 2048;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = v6;
      __int16 v16 = 1024;
      BOOL v17 = v4;
      __int16 v18 = 1024;
      BOOL v19 = v7;
      _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKApplicationStateTrackingView: View with page [%p, pageProxyID=%llu] was added to a window, _lastObservedStateWasBackground=%d, isNowBackground=%d", buf, 0x2Cu);
    }
    BOOL v8 = [(WKApplicationStateTrackingView *)self isBackground];
    if (v4)
    {
      if (!v8) {
        [(WKApplicationStateTrackingView *)self _applicationWillEnterForeground];
      }
    }
    else if (v8)
    {
      [(WKApplicationStateTrackingView *)self _applicationDidEnterBackground];
    }
  }
}

- (BOOL)isBackground
{
  value = self->_applicationStateTracker.__ptr_.__value_;
  return !value || *((unsigned char *)value + 88) != 0;
}

- (id).cxx_construct
{
  *((void *)self + 51) = 0;
  *((void *)self + 52) = 0;
  return self;
}

- (WKApplicationStateTrackingView)initWithFrame:(CGRect)a3 webView:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WKApplicationStateTrackingView;
  v5 = -[WKApplicationStateTrackingView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_webViewToTrack.m_weakReference, a4);
    BOOL v7 = (WebKit::ApplicationStateTracker *)WTF::fastMalloc((WTF *)0x80);
    WebKit::ApplicationStateTracker::ApplicationStateTracker(v7, &v6->super, (objc_selector *)sel__applicationDidEnterBackground, (objc_selector *)sel__applicationWillEnterForeground, (objc_selector *)sel__willBeginSnapshotSequence, (objc_selector *)sel__didCompleteSnapshotSequence);
    std::unique_ptr<WebKit::ApplicationStateTracker>::reset[abi:sn180100]((id **)&v6->_applicationStateTracker, (id *)v7);
  }
  return v6;
}

- (void)_applicationDidEnterBackground
{
  id Weak = objc_loadWeak(&self->_webViewToTrack.m_weakReference);
  if (Weak)
  {
    [Weak _page];
    if (v3)
    {
      WebKit::WebPageProxy::applicationDidEnterBackground(v3);
      WebKit::WebPageProxy::activityStateDidChange((uint64_t)v3, 1007, 0, 0);
    }
  }
}

- (void)_applicationDidFinishSnapshottingAfterEnteringBackground
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id Weak = objc_loadWeak(&self->_webViewToTrack.m_weakReference);
  if (Weak)
  {
    [Weak _page];
    BOOL v4 = v7;
    if (v7)
    {
      v5 = qword_1EB358730;
      if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(*((void *)v7 + 4) + 760);
        *(_DWORD *)buf = 134218496;
        objc_super v9 = self;
        __int16 v10 = 2048;
        v11 = v7;
        __int16 v12 = 2048;
        uint64_t v13 = v6;
        _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKApplicationStateTrackingView: View with page [%p, pageProxyID=%llu] did finish snapshotting after entering background", buf, 0x20u);
        BOOL v4 = v7;
      }
      WebKit::WebPageProxy::applicationDidFinishSnapshottingAfterEnteringBackground(v4);
    }
  }
}

- (void)_applicationWillEnterForeground
{
  id Weak = objc_loadWeak(&self->_webViewToTrack.m_weakReference);
  if (Weak)
  {
    [Weak _page];
    if (v3)
    {
      WebKit::WebPageProxy::applicationWillEnterForeground(v3);
      WebKit::WebPageProxy::activityStateDidChange((uint64_t)v3, 1007, 1, 1);
    }
  }
}

- (void)_willBeginSnapshotSequence
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id Weak = objc_loadWeak(&self->_webViewToTrack.m_weakReference);
  if (Weak)
  {
    [Weak _page];
    if (v6)
    {
      if ([(UIView *)[(WKApplicationStateTrackingView *)self _contentView] window])
      {
        BOOL v4 = qword_1EB358730;
        if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
        {
          if (v6) {
            uint64_t v5 = *(void *)(*(void *)(v6 + 32) + 760);
          }
          else {
            uint64_t v5 = 0;
          }
          *(_DWORD *)buf = 134218496;
          BOOL v8 = self;
          __int16 v9 = 2048;
          uint64_t v10 = v6;
          __int16 v11 = 2048;
          uint64_t v12 = v5;
          _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "%p - WKApplicationStateTrackingView: View with page [%p, pageProxyID=%llu] will begin snapshot sequence", buf, 0x20u);
        }
        buf[0] = 1;
        WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetIsTakingSnapshotsForApplicationSuspension>(*(void *)(v6 + 256), (char *)buf, *(void *)(*(void *)(v6 + 32) + 1928), 0);
      }
    }
  }
}

- (void)_didCompleteSnapshotSequence
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id Weak = objc_loadWeak(&self->_webViewToTrack.m_weakReference);
  if (Weak)
  {
    [Weak _page];
    if (v6)
    {
      if ([(UIView *)[(WKApplicationStateTrackingView *)self _contentView] window])
      {
        BOOL v4 = qword_1EB358730;
        if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
        {
          if (v6) {
            uint64_t v5 = *(void *)(*((void *)v6 + 4) + 760);
          }
          else {
            uint64_t v5 = 0;
          }
          *(_DWORD *)buf = 134218496;
          BOOL v8 = self;
          __int16 v9 = 2048;
          uint64_t v10 = v6;
          __int16 v11 = 2048;
          uint64_t v12 = v5;
          _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "%p - WKApplicationStateTrackingView: View with page [%p, pageProxyID=%llu] did complete snapshot sequence", buf, 0x20u);
        }
        buf[0] = 0;
        WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetIsTakingSnapshotsForApplicationSuspension>(*((void *)v6 + 32), (char *)buf, *(void *)(*((void *)v6 + 4) + 1928), 0);
        if ([(WKApplicationStateTrackingView *)self isBackground]) {
          WebKit::WebPageProxy::applicationDidFinishSnapshottingAfterEnteringBackground(v6);
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  std::unique_ptr<WebKit::ApplicationStateTracker>::reset[abi:sn180100]((id **)&self->_applicationStateTracker, 0);

  objc_destroyWeak(&self->_webViewToTrack.m_weakReference);
}

@end