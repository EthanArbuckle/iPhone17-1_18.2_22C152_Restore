@interface MRUODRDSNoticationObserver
- (MRUODRDSNoticationObserver)initWithDelegate:(id)a3;
- (MRUODRDSNoticationObserverDelegate)delegate;
- (void)endObservation;
- (void)hearingAidReachabilityDidChange;
- (void)setDelegate:(id)a3;
@end

@implementation MRUODRDSNoticationObserver

- (MRUODRDSNoticationObserver)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUODRDSNoticationObserver;
  v5 = [(MRUODRDSNoticationObserver *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_MRUHearingDevicesDidChangeNotification, (CFStringRef)*MEMORY[0x1E4F67CC0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v6;
}

- (void)endObservation
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MRUODRDSNoticationObserver_endObservation__block_invoke;
  block[3] = &unk_1E5F0D7F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __44__MRUODRDSNoticationObserver_endObservation__block_invoke(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v3 = *(const void **)(a1 + 32);
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F67CC0];

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v3, v4, 0);
}

- (void)hearingAidReachabilityDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained hearingAidReachabilityDidChange];
}

- (MRUODRDSNoticationObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUODRDSNoticationObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end