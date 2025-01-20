@interface HMCameraStreamControl
- (HMCameraStream)cameraStream;
- (HMCameraStreamControl)init;
- (HMCameraStreamControl)initWithStreamControl:(id)a3;
- (HMCameraStreamState)streamState;
- (_HMCameraStreamControl)streamControl;
- (id)delegate;
- (void)cameraStreamControl:(id)a3 didStopStreamWithError:(id)a4;
- (void)cameraStreamControlDidStartStream:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)startStream;
- (void)startStreamWithPreferences:(id)a3;
- (void)stopStream;
@end

@implementation HMCameraStreamControl

void __49___HMCameraStreamControl___configureWithContext___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained streamState] == 2)
  {
    v2 = (void *)MEMORY[0x19F3A64A0]();
    id v3 = WeakRetained;
    v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = HMFGetLogIdentifier();
      int v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failing active stream due to daemon reconnection", (uint8_t *)&v7, 0xCu);
    }
    v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    [v3 _resetStateWithError:v6];
  }
}

- (HMCameraStream)cameraStream
{
  v2 = [(HMCameraStreamControl *)self streamControl];
  id v3 = [v2 cameraStream];

  return (HMCameraStream *)v3;
}

- (HMCameraStreamState)streamState
{
  v2 = [(HMCameraStreamControl *)self streamControl];
  HMCameraStreamState v3 = [v2 streamState];

  return v3;
}

- (_HMCameraStreamControl)streamControl
{
  return (_HMCameraStreamControl *)objc_getProperty(self, a2, 24, 1);
}

- (HMCameraStreamControl)initWithStreamControl:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMCameraStreamControl;
  v6 = [(HMCameraControl *)&v9 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_streamControl, a3);
    [(_HMCameraStreamControl *)v7->_streamControl setDelegate:v7];
  }

  return v7;
}

- (void)setDelegate:(id)delegate
{
  p_lock = &self->_lock;
  id v5 = delegate;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamControl, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)cameraStreamControl:(id)a3 didStopStreamWithError:(id)a4
{
  id v6 = a4;
  id v5 = [(HMCameraStreamControl *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 cameraStreamControl:self didStopStreamWithError:v6];
  }
}

- (void)cameraStreamControlDidStartStream:(id)a3
{
  id v4 = [(HMCameraStreamControl *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 cameraStreamControlDidStartStream:self];
  }
}

- (void)stopStream
{
  id v2 = [(HMCameraStreamControl *)self streamControl];
  [v2 stopStream];
}

- (void)startStreamWithPreferences:(id)a3
{
  id v4 = a3;
  id v5 = [(HMCameraStreamControl *)self streamControl];
  [v5 startStreamWithPreferences:v4];
}

- (void)startStream
{
  id v2 = [(HMCameraStreamControl *)self streamControl];
  [v2 startStreamWithPreferences:0];
}

- (id)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return WeakRetained;
}

- (HMCameraStreamControl)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMCameraStreamControl;
  return [(HMCameraControl *)&v3 init];
}

void __61___HMCameraStreamControl__callVideoStoppedDelegateWithError___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) hmPublicError];
  [v1 cameraStreamControl:v2 didStopStreamWithError:v3];
}

uint64_t __51___HMCameraStreamControl__callVideoStartedDelegate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cameraStreamControlDidStartStream:*(void *)(a1 + 40)];
}

uint64_t __36___HMCameraStreamControl_stopStream__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleVideoStopResponse:a3 sessionID:*(void *)(a1 + 40) error:a2];
}

uint64_t __53___HMCameraStreamControl_startStreamWithPreferences___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleStreamStartedWithResponse:a3 sessionID:*(void *)(a1 + 40) error:a2];
}

uint64_t __37___HMCameraStreamControl_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v30_63412;
  logCategory__hmf_once_v30_63412 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end