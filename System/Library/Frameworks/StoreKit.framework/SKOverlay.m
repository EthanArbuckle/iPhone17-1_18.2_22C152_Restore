@interface SKOverlay
+ (id)unsupportedPlatformErrorWithAPIName:(id)a3;
+ (void)dismissOverlayInScene:(UIWindowScene *)scene;
- (ASOOverlayConfiguration)overlayConfiguration;
- (BOOL)isReadyToPresentInScene:(id)a3;
- (SKOverlay)initWithConfiguration:(SKOverlayConfiguration *)configuration;
- (SKOverlayConfiguration)configuration;
- (id)delegate;
- (id)tranformToPublicError:(id)a3;
- (void)presentInScene:(UIWindowScene *)scene;
- (void)setDelegate:(id)delegate;
- (void)storeOverlay:(id)a3 didFailToLoadWithError:(id)a4;
- (void)storeOverlay:(id)a3 didFinishDismissal:(id)a4;
- (void)storeOverlay:(id)a3 didFinishPresentation:(id)a4;
- (void)storeOverlay:(id)a3 willStartDismissal:(id)a4;
- (void)storeOverlay:(id)a3 willStartPresentation:(id)a4;
@end

@implementation SKOverlay

- (SKOverlay)initWithConfiguration:(SKOverlayConfiguration *)configuration
{
  v5 = configuration;
  v9.receiver = self;
  v9.super_class = (Class)SKOverlay;
  v6 = [(SKOverlay *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, configuration);
  }

  return v7;
}

- (void)presentInScene:(UIWindowScene *)scene
{
  v5 = scene;
  if (-[SKOverlay isReadyToPresentInScene:](self, "isReadyToPresentInScene:"))
  {
    v4 = [(UIWindowScene *)v5 _aso_appOverlayManager];
    [v4 presentOverlay:self];
  }
  else
  {
    v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ASOErrorDomain" code:7 userInfo:0];
    [(SKOverlay *)self storeOverlay:self didFailToLoadWithError:v4];
  }
}

+ (void)dismissOverlayInScene:(UIWindowScene *)scene
{
  id v3 = [(UIWindowScene *)scene _aso_appOverlayManager];
  [v3 dismissOverlay];
}

- (BOOL)isReadyToPresentInScene:(id)a3
{
  id v4 = a3;
  v5 = [(SKOverlay *)self configuration];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  BOOL v7 = (isKindOfClass & 1) == 0 || ![v4 activationState] || objc_msgSend(v4, "activationState") == 1;
  return v7;
}

- (ASOOverlayConfiguration)overlayConfiguration
{
  v2 = [(SKOverlay *)self configuration];
  id v3 = [v2 _backing];

  return (ASOOverlayConfiguration *)v3;
}

- (void)storeOverlay:(id)a3 willStartPresentation:(id)a4
{
  id v9 = a4;
  v5 = [(SKOverlay *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    BOOL v7 = [(SKOverlay *)self delegate];
    v8 = [[SKOverlayTransitionContext alloc] initWithASOOverlayTransitionContext:v9];
    [v7 storeOverlay:self willStartPresentation:v8];
  }
}

- (void)storeOverlay:(id)a3 didFinishPresentation:(id)a4
{
  id v9 = a4;
  v5 = [(SKOverlay *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    BOOL v7 = [(SKOverlay *)self delegate];
    v8 = [[SKOverlayTransitionContext alloc] initWithASOOverlayTransitionContext:v9];
    [v7 storeOverlay:self didFinishPresentation:v8];
  }
}

- (void)storeOverlay:(id)a3 willStartDismissal:(id)a4
{
  id v9 = a4;
  v5 = [(SKOverlay *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    BOOL v7 = [(SKOverlay *)self delegate];
    v8 = [[SKOverlayTransitionContext alloc] initWithASOOverlayTransitionContext:v9];
    [v7 storeOverlay:self willStartDismissal:v8];
  }
}

- (void)storeOverlay:(id)a3 didFinishDismissal:(id)a4
{
  id v9 = a4;
  v5 = [(SKOverlay *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    BOOL v7 = [(SKOverlay *)self delegate];
    v8 = [[SKOverlayTransitionContext alloc] initWithASOOverlayTransitionContext:v9];
    [v7 storeOverlay:self didFinishDismissal:v8];
  }
}

- (void)storeOverlay:(id)a3 didFailToLoadWithError:(id)a4
{
  v5 = [(SKOverlay *)self tranformToPublicError:a4];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SKOverlay storeOverlay:didFailToLoadWithError:](v5);
  }
  char v6 = [(SKOverlay *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(SKOverlay *)self delegate];
    [v8 storeOverlay:self didFailToLoadWithError:v5];
  }
}

- (id)tranformToPublicError:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 domain];
  int v5 = [v4 isEqualToString:@"ASOErrorDomain"];

  if (v5)
  {
    switch([v3 code])
    {
      case 1:
      case 2:
        char v6 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v7 = 16;
        goto LABEL_5;
      case 3:
        v10 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v19 = *MEMORY[0x1E4F28568];
        v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v12 = [v11 localizedStringForKey:@"INVALID_OVERLAY_CONFIGURATION_APP_CLIP" value:&stru_1F08A7B80 table:0];
        v20[0] = v12;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
        v14 = v10;
        uint64_t v15 = 16;
        break;
      case 4:
        char v6 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v7 = 15;
        goto LABEL_5;
      case 6:
        char v6 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v7 = 17;
        goto LABEL_5;
      case 7:
        v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v17 = *MEMORY[0x1E4F28568];
        v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v12 = [v11 localizedStringForKey:@"OVERLAY_PRESENTED_IN_BACKGROUND_SCENE" value:&stru_1F08A7B80 table:0];
        v18 = v12;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        v14 = v16;
        uint64_t v15 = 20;
        break;
      default:
        goto LABEL_4;
    }
    v8 = [v14 errorWithDomain:@"SKErrorDomain" code:v15 userInfo:v13];
  }
  else
  {
LABEL_4:
    char v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = 0;
LABEL_5:
    v8 = [v6 errorWithDomain:@"SKErrorDomain" code:v7 userInfo:0];
  }

  return v8;
}

+ (id)unsupportedPlatformErrorWithAPIName:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = [NSString stringWithFormat:@"%@ is not supported on this platform.", a3, *MEMORY[0x1E4F28568]];
  v9[0] = v4;
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  char v6 = [v3 errorWithDomain:@"SKErrorDomain" code:19 userInfo:v5];

  return v6;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (SKOverlayConfiguration)configuration
{
  return (SKOverlayConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)storeOverlay:(void *)a1 didFailToLoadWithError:.cold.1(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"OVERLAY_FAILED_TO_LOAD" value:&stru_1F08A7B80 table:0];
  int v5 = [a1 localizedDescription];
  char v6 = objc_msgSend(v2, "stringWithFormat:", v4, v5);
  *(_DWORD *)buf = 138543362;
  uint64_t v8 = v6;
  _os_log_error_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
}

@end