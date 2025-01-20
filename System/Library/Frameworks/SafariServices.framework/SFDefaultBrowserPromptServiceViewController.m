@interface SFDefaultBrowserPromptServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_isDefaultBrowserSafari;
- (id)_defaultBrowserRecord;
- (void)_defaultBrowserRecord;
- (void)determineIfBrowserIconSwapAlertNeedsDisplayWithCompletionHandler:(id)a3;
- (void)determineIfBrowserSheetNeedsDisplayWithCompletionHandler:(id)a3;
@end

@implementation SFDefaultBrowserPromptServiceViewController

- (void)determineIfBrowserIconSwapAlertNeedsDisplayWithCompletionHandler:(id)a3
{
  v5 = (void (**)(id, void))a3;
  if ([(SFDefaultBrowserPromptServiceViewController *)self _isDefaultBrowserSafari])
  {
    v5[2](v5, 0);
  }
  else
  {
    v4 = [(SFDefaultBrowserPromptServiceViewController *)self _defaultBrowserRecord];
    ((void (**)(id, void *))v5)[2](v5, v4);
  }
}

- (void)determineIfBrowserSheetNeedsDisplayWithCompletionHandler:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, BOOL))a3 + 2))(v5, [(SFDefaultBrowserPromptServiceViewController *)self _isDefaultBrowserSafari]);
}

- (id)_defaultBrowserRecord
{
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v7 = 0;
  v3 = [v2 defaultApplicationForCategory:1 error:&v7];
  id v4 = v7;

  if (v4)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(SFDefaultBrowserPromptServiceViewController *)v5 _defaultBrowserRecord];
    }
  }

  return v3;
}

- (BOOL)_isDefaultBrowserSafari
{
  v2 = [(SFDefaultBrowserPromptServiceViewController *)self _defaultBrowserRecord];
  v3 = [v2 bundleIdentifier];
  char v4 = WBSIsEqual();

  return v4;
}

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC6F408];
}

+ (id)_exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC80498];
}

- (void)_defaultBrowserRecord
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  char v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A690B000, v3, OS_LOG_TYPE_ERROR, "Failed to get default browser: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end