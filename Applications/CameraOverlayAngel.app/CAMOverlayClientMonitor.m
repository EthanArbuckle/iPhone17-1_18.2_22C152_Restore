@interface CAMOverlayClientMonitor
- (CAMOverlayClientMonitorDelegate)delegate;
- (SBSUICameraOverlaySceneClientMonitor)underlyingMonitor;
- (void)beginMonitoringScene:(id)a3 delegate:(id)a4;
- (void)clientMonitor:(id)a3 requestingSceneUpdatedWithInfo:(id)a4;
- (void)endMonitoring;
- (void)setDelegate:(id)a3;
- (void)setUnderlyingMonitor:(id)a3;
@end

@implementation CAMOverlayClientMonitor

- (void)beginMonitoringScene:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  [(CAMOverlayClientMonitor *)self setDelegate:a4];
  v7 = [v6 _FBSScene];

  v8 = [v7 cameraOverlaySceneClientMonitor];
  [(CAMOverlayClientMonitor *)self setUnderlyingMonitor:v8];

  id v9 = [(CAMOverlayClientMonitor *)self underlyingMonitor];
  [v9 addObserver:self];
}

- (void)endMonitoring
{
  [(CAMOverlayClientMonitor *)self setDelegate:0];
  v3 = [(CAMOverlayClientMonitor *)self underlyingMonitor];
  [v3 removeObserver:self];

  [(CAMOverlayClientMonitor *)self setUnderlyingMonitor:0];
}

- (void)clientMonitor:(id)a3 requestingSceneUpdatedWithInfo:(id)a4
{
  [a4 overlayRequestingProcessAuditToken:a3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(CAMOverlayClientMonitor *)self delegate];
  [v5 clientMonitor:self didUpdateWithAuditToken:v6];
}

- (SBSUICameraOverlaySceneClientMonitor)underlyingMonitor
{
  return self->_underlyingMonitor;
}

- (void)setUnderlyingMonitor:(id)a3
{
}

- (CAMOverlayClientMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CAMOverlayClientMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_underlyingMonitor, 0);
}

@end