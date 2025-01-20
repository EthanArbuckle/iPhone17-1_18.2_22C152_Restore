@interface _WKWebContentProcessInfo
- (BOOL)runningServiceWorkers;
- (BOOL)runningSharedWorkers;
- (NSArray)webViews;
- (_WKWebContentProcessInfo)initWithTaskInfo:(const TaskInfo *)a3 process:(const void *)a4;
- (double)totalBackgroundTime;
- (double)totalForegroundTime;
- (double)totalSuspendedTime;
- (id).cxx_construct;
- (int64_t)webContentState;
@end

@implementation _WKWebContentProcessInfo

- (_WKWebContentProcessInfo)initWithTaskInfo:(const TaskInfo *)a3 process:(const void *)a4
{
  v16.receiver = self;
  v16.super_class = (Class)_WKWebContentProcessInfo;
  v5 = [(_WKProcessInfo *)&v16 initWithTaskInfo:a3];
  v6 = v5;
  if (v5)
  {
    v5->_webContentState = 2;
    if (*((unsigned char *)a4 + 778))
    {
      v5->_webContentState = 0;
    }
    else if (*((unsigned char *)a4 + 712))
    {
      v5->_webContentState = 1;
    }
    else
    {
      WebKit::WebProcessProxy::pages((WebKit::WebProcessProxy *)a4, (uint64_t)&v14);
      if (v15)
      {
        uint64_t v8 = v14;
        uint64_t v9 = 8 * v15;
        do
        {
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)v8 + 32) + 2016));
          if (WeakRetained)
          {
            id m_ptr = v6->_webViews.m_ptr;
            if (!m_ptr)
            {
              id m_ptr = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              v12 = v6->_webViews.m_ptr;
              v6->_webViews.id m_ptr = m_ptr;
              if (v12)
              {
                CFRelease(v12);
                id m_ptr = v6->_webViews.m_ptr;
              }
            }
            [m_ptr addObject:WeakRetained];
            CFRelease(WeakRetained);
          }
          v8 += 8;
          v9 -= 8;
        }
        while (v9);
      }
      WTF::Vector<WTF::Ref<WebKit::WebPageProxy,WTF::RawPtrTraits<WebKit::WebPageProxy>,WTF::DefaultRefDerefTraits<WebKit::WebPageProxy>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v14, v7);
    }
    v6->_runningServiceWorkers = *((unsigned char *)a4 + 872);
    v6->_runningSharedWorkers = *((unsigned char *)a4 + 952);
    v6->_totalForegroundTime = WebKit::WebProcessProxy::totalForegroundTime((WebKit::WebProcessProxy *)a4);
    v6->_totalBackgroundTime = WebKit::WebProcessProxy::totalBackgroundTime((WebKit::WebProcessProxy *)a4);
    v6->_totalSuspendedTime = WebKit::WebProcessProxy::totalSuspendedTime((WebKit::WebProcessProxy *)a4);
  }
  return v6;
}

- (NSArray)webViews
{
  return (NSArray *)self->_webViews.m_ptr;
}

- (int64_t)webContentState
{
  return self->_webContentState;
}

- (BOOL)runningServiceWorkers
{
  return self->_runningServiceWorkers;
}

- (BOOL)runningSharedWorkers
{
  return self->_runningSharedWorkers;
}

- (double)totalForegroundTime
{
  return self->_totalForegroundTime;
}

- (double)totalBackgroundTime
{
  return self->_totalBackgroundTime;
}

- (double)totalSuspendedTime
{
  return self->_totalSuspendedTime;
}

- (void).cxx_destruct
{
  id m_ptr = self->_webViews.m_ptr;
  self->_webViews.id m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  return self;
}

@end