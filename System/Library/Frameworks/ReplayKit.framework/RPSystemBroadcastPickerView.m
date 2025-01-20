@interface RPSystemBroadcastPickerView
- (BOOL)showsMicrophoneButton;
- (NSString)preferredExtension;
- (RPSystemBroadcastPickerView)initWithCoder:(id)a3;
- (RPSystemBroadcastPickerView)initWithFrame:(CGRect)a3;
- (UIButton)broadcastPickerButton;
- (void)addBroadcastPickerButton;
- (void)buttonPressed:(id)a3;
- (void)screenCaptureChanged;
- (void)setBroadcastPickerButton:(id)a3;
- (void)setPreferredExtension:(NSString *)preferredExtension;
- (void)setShowsMicrophoneButton:(BOOL)showsMicrophoneButton;
@end

@implementation RPSystemBroadcastPickerView

- (RPSystemBroadcastPickerView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RPSystemBroadcastPickerView;
  v3 = [(RPSystemBroadcastPickerView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(RPSystemBroadcastPickerView *)v3 addBroadcastPickerButton];
  }
  return v4;
}

- (RPSystemBroadcastPickerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RPSystemBroadcastPickerView;
  v3 = -[RPSystemBroadcastPickerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(RPSystemBroadcastPickerView *)v3 addBroadcastPickerButton];
  }
  return v4;
}

- (void)addBroadcastPickerButton
{
  id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [MEMORY[0x263F1C6B0] imageNamed:@"ModuleIcon" inBundle:v13];
  v4 = [v3 imageWithRenderingMode:2];

  self->_showsMicrophoneButton = 1;
  v5 = [MEMORY[0x263F1C488] buttonWithType:0];
  broadcastPickerButton = self->_broadcastPickerButton;
  self->_broadcastPickerButton = v5;

  v7 = self->_broadcastPickerButton;
  [(RPSystemBroadcastPickerView *)self bounds];
  CGRect v16 = CGRectInset(v15, 5.0, 5.0);
  -[UIButton setFrame:](v7, "setFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
  [(UIButton *)self->_broadcastPickerButton setImage:v4 forState:0];
  v8 = self->_broadcastPickerButton;
  v9 = [MEMORY[0x263F1C550] clearColor];
  [(UIButton *)v8 setBackgroundColor:v9];

  [(UIButton *)self->_broadcastPickerButton setAutoresizingMask:18];
  [(UIButton *)self->_broadcastPickerButton addTarget:self action:sel_buttonPressed_ forControlEvents:64];
  v10 = [(UIButton *)self->_broadcastPickerButton imageView];
  [v10 setContentMode:2];

  v11 = [(RPSystemBroadcastPickerView *)self broadcastPickerButton];
  [(RPSystemBroadcastPickerView *)self addSubview:v11];

  [(RPSystemBroadcastPickerView *)self screenCaptureChanged];
  v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 addObserver:self selector:sel_screenCaptureChanged name:*MEMORY[0x263F1D5A0] object:0];
}

- (void)screenCaptureChanged
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v5 = "-[RPSystemBroadcastPickerView screenCaptureChanged]";
    __int16 v6 = 1024;
    int v7 = 69;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__RPSystemBroadcastPickerView_screenCaptureChanged__block_invoke;
  block[3] = &unk_26451D7F0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __51__RPSystemBroadcastPickerView_screenCaptureChanged__block_invoke(uint64_t a1)
{
  id v6 = [MEMORY[0x263F1C550] blackColor];
  v2 = [MEMORY[0x263F1C920] mainScreen];
  int v3 = [v2 isCaptured];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F1C550] redColor];

    id v5 = (id)v4;
  }
  else
  {
    id v5 = v6;
  }
  id v7 = v5;
  [*(id *)(*(void *)(a1 + 32) + 424) setTintColor:v5];
}

- (void)buttonPressed:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    uint64_t v8 = "-[RPSystemBroadcastPickerView buttonPressed:]";
    __int16 v9 = 1024;
    int v10 = 81;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v7, 0x12u);
  }
  id v5 = +[RPDaemonProxy daemonProxy];
  [v5 setBroadcastPickerPreferredExt:self->_preferredExtension showsMicButton:self->_showsMicrophoneButton];

  id v6 = +[RPDaemonProxy daemonProxy];
  [v6 openControlCenterSystemRecordingView];
}

- (NSString)preferredExtension
{
  return self->_preferredExtension;
}

- (void)setPreferredExtension:(NSString *)preferredExtension
{
}

- (BOOL)showsMicrophoneButton
{
  return self->_showsMicrophoneButton;
}

- (void)setShowsMicrophoneButton:(BOOL)showsMicrophoneButton
{
  self->_showsMicrophoneButton = showsMicrophoneButton;
}

- (UIButton)broadcastPickerButton
{
  return self->_broadcastPickerButton;
}

- (void)setBroadcastPickerButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_broadcastPickerButton, 0);

  objc_storeStrong((id *)&self->_preferredExtension, 0);
}

@end