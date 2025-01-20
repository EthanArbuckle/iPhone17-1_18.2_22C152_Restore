@interface _SFOpenWithAppUIActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (_SFOpenWithAppUIActivity)initWithApplicationIdentifier:(id)a3 andFilePath:(id)a4;
- (id)_activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4;
- (void)performActivity;
@end

@implementation _SFOpenWithAppUIActivity

- (_SFOpenWithAppUIActivity)initWithApplicationIdentifier:(id)a3 andFilePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SFOpenWithAppUIActivity;
  v8 = [(UIActivity *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v6];
    appProxy = v8->_appProxy;
    v8->_appProxy = (LSApplicationProxy *)v9;

    objc_storeStrong((id *)&v8->_filePath, a4);
  }

  return v8;
}

- (id)activityType
{
  return @"com.apple.mobilesafari.activity.openWithApp";
}

- (id)activityTitle
{
  return (id)[(LSApplicationProxy *)self->_appProxy localizedName];
}

- (id)_activityImage
{
  return (id)[MEMORY[0x1E4FB1818] _iconForResourceProxy:self->_appProxy format:2];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_filePath];
  v5 = [(LSApplicationProxy *)self->_appProxy bundleIdentifier];
  id v6 = [v3 operationToOpenResource:v4 usingApplication:v5 uniqueDocumentIdentifier:0 userInfo:0 delegate:self];

  [v6 start];
}

- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75___SFOpenWithAppUIActivity_openResourceOperation_didFinishCopyingResource___block_invoke;
  block[3] = &unk_1E5C724D8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);

  objc_storeStrong((id *)&self->_appProxy, 0);
}

@end