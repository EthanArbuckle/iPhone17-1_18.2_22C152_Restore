@interface _SFFindOnPageUIActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (_SFFindOnPageUIActivity)initWithWebView:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)activityDidFinish:(BOOL)a3;
- (void)performActivity;
@end

@implementation _SFFindOnPageUIActivity

- (_SFFindOnPageUIActivity)initWithWebView:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFFindOnPageUIActivity;
  v6 = [(UIActivity *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webView, a3);
    v8 = v7;
  }

  return v7;
}

- (id)activityType
{
  return @"com.apple.mobilesafari.activity.findOnPage";
}

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)_systemImageName
{
  return @"doc.text.magnifyingglass";
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    LOBYTE(v6) = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          objc_super v10 = objc_msgSend(v9, "activeWebView", (void)v12);
          uint64_t v6 = [v10 URL];

          if (!v6) {
            goto LABEL_13;
          }
          LOBYTE(v6) = 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }
LABEL_13:

  return v6 & 1;
}

- (void)performActivity
{
  [(_SFWebView *)self->_webView find:0];

  [(_SFFindOnPageUIActivity *)self activityDidFinish:1];
}

- (void)activityDidFinish:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_SFFindOnPageUIActivity;
  -[_SFActivity activityDidFinish:](&v5, sel_activityDidFinish_);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F98948] sharedLogger];
    [v4 didFindOnPageWithTrigger:1];
  }
}

- (void).cxx_destruct
{
}

@end