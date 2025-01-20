@interface _SFAddToHomeScreenActivity
- (BOOL)_showsInSystemActionGroup;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (_SFAddToHomeScreenActivity)initWithWebView:(id)a3;
- (id)activityType;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation _SFAddToHomeScreenActivity

- (_SFAddToHomeScreenActivity)initWithWebView:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFAddToHomeScreenActivity;
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
  return @"com.apple.mobilesafari.activity.addToHomeScreen";
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (!self->_webView) {
    return 0;
  }
  v8[0] = self->_webView;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v7.receiver = self;
  v7.super_class = (Class)_SFAddToHomeScreenActivity;
  BOOL v5 = [(UIAddToHomeScreenActivity *)&v7 canPerformWithActivityItems:v4];

  return v5;
}

- (void)prepareWithActivityItems:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (self->_webView)
  {
    v6[0] = self->_webView;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    v5.receiver = self;
    v5.super_class = (Class)_SFAddToHomeScreenActivity;
    [(UIAddToHomeScreenActivity *)&v5 prepareWithActivityItems:v4];
  }
}

- (BOOL)_showsInSystemActionGroup
{
  return 1;
}

- (void).cxx_destruct
{
}

@end