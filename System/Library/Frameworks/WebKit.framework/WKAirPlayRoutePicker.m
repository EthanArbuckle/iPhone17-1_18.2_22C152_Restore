@interface WKAirPlayRoutePicker
- (id).cxx_construct;
- (void)dealloc;
- (void)showFromView:(id)a3 routeSharingPolicy:(unsigned __int8)a4 routingContextUID:(id)a5 hasVideo:(BOOL)a6;
@end

@implementation WKAirPlayRoutePicker

- (void)dealloc
{
  [self->_actionSheet.m_ptr dismissViewControllerAnimated:0 completion:0];
  v3.receiver = self;
  v3.super_class = (Class)WKAirPlayRoutePicker;
  [(WKAirPlayRoutePicker *)&v3 dealloc];
}

- (void)showFromView:(id)a3 routeSharingPolicy:(unsigned __int8)a4 routingContextUID:(id)a5 hasVideo:(BOOL)a6
{
  if (!self->_actionSheet.m_ptr)
  {
    BOOL v6 = a6;
    unsigned int v8 = a4;
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3812000000;
    v19 = __Block_byref_object_copy__8;
    v20 = __Block_byref_object_dispose__8;
    v21 = &unk_19964AFC1;
    CFTypeRef cf = (CFTypeRef)[objc_alloc((Class)off_1EC2B20F8()) initWithName:@"WebKit - HTML media element showing AirPlay route picker"];
    [(id)v17[6] setDiscoveryMode:3];
    if ([(id)_MergedGlobals_257() instancesRespondToSelector:sel_setSortByIsVideoRoute_])
    {
      v11 = (void *)[objc_alloc((Class)_MergedGlobals_257()) init];
      [v11 setSortByIsVideoRoute:v6];
    }
    else
    {
      v11 = 0;
    }
    v12 = (void *)[objc_alloc((Class)off_1EC2B2100()) initWithConfiguration:v11];
    m_ptr = self->_actionSheet.m_ptr;
    self->_actionSheet.m_ptr = v12;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    if (objc_opt_respondsToSelector()) {
      [self->_actionSheet.m_ptr setOverrideRouteSharingPolicy:v8 routingContextUID:a5];
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __83__WKAirPlayRoutePicker_showFromView_routeSharingPolicy_routingContextUID_hasVideo___block_invoke;
    v15[3] = &unk_1E58136C0;
    v15[4] = self;
    v15[5] = &v16;
    [self->_actionSheet.m_ptr setDidDismissHandler:v15];
    objc_msgSend((id)objc_msgSend(a3, "_wk_viewControllerForFullScreenPresentation"), "presentViewController:animated:completion:", self->_actionSheet.m_ptr, 1, 0);
    if (v11) {
      CFRelease(v11);
    }
    _Block_object_dispose(&v16, 8);
    CFTypeRef v14 = cf;
    CFTypeRef cf = 0;
    if (v14) {
      CFRelease(v14);
    }
  }
}

void __83__WKAirPlayRoutePicker_showFromView_routeSharingPolicy_routingContextUID_hasVideo___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) setDiscoveryMode:0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v3 = *(const void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(const void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
  if (v5)
  {
    CFRelease(v5);
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_actionSheet.m_ptr;
  self->_actionSheet.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end