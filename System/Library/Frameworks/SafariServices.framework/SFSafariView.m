@interface SFSafariView
- (void)didMoveToWindow;
- (void)setTintColor:(id)a3;
@end

@implementation SFSafariView

- (void)setTintColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFSafariView;
  [(SFSafariView *)&v6 setTintColor:a3];
  if ((warnAboutTintColorIfNeeded_didWarningCheck & 1) == 0)
  {
    warnAboutTintColorIfNeeded_didWarningCheck = 1;
    if (__UIApplicationLinkedOnOrAfter())
    {
      int v3 = dyld_program_minos_at_least();
      v4 = WBS_LOG_CHANNEL_PREFIXOther();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
      if (v3)
      {
        if (v5) {
          -[SFSafariView setTintColor:](v4);
        }
      }
      else if (v5)
      {
        -[SFSafariView setTintColor:](v4);
      }
    }
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SFSafariView;
  [(SFSafariView *)&v3 didMoveToWindow];
  v2 = [MEMORY[0x1E4F31A90] sharedInstance];
  [v2 setNeedsUpdate];
}

- (void)setTintColor:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "When deploying for iOS 10 and later, 'SFSafariViewController.view.tintColor' has no effect. Use 'SFSafariViewController.preferredControlTintColor'.", v1, 2u);
}

- (void)setTintColor:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "When running on iOS 10 and later, 'SFSafariViewController.view.tintColor' has no effect. Use 'SFSafariViewController.preferredControlTintColor' if available, and 'tintColor' otherwise.", v1, 2u);
}

@end