@interface _SFDownloadCurrentPageActivity
- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (_SFDownloadCurrentPageActivity)initWithWebView:(id)a3;
- (void)performActivity;
@end

@implementation _SFDownloadCurrentPageActivity

- (_SFDownloadCurrentPageActivity)initWithWebView:(id)a3
{
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F43610];
  id v16 = 0;
  v7 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:v6 error:&v16];
  id v8 = v16;
  if (!v7)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_SFDownloadCurrentPageActivity initWithWebView:](v13, v8);
    }
    goto LABEL_6;
  }
  v9 = [v7 _plugIn];
  uint64_t v10 = [v9 userElection];

  if (v10 == 2)
  {
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  v15.receiver = self;
  v15.super_class = (Class)_SFDownloadCurrentPageActivity;
  v11 = [(UIApplicationExtensionActivity *)&v15 initWithApplicationExtension:v7];
  objc_storeStrong((id *)&v11->_webView, a3);
  self = v11;
  v12 = self;
LABEL_7:

  return v12;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return [(WKWebView *)self->_webView _isDisplayingStandaloneMediaDocument];
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  return 0;
}

- (void)performActivity
{
}

- (void).cxx_destruct
{
}

- (void)initWithWebView:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1A690B000, v3, OS_LOG_TYPE_ERROR, "Failed to find 'Save to Files' extension: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end