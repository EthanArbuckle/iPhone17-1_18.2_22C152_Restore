@interface _SFWebProcessPlugIn
- (id)pageControllerWithBrowserContextController:(id)a3;
- (void)_installUIClientIfNecessaryWithPageController:(id)a3;
- (void)dealloc;
- (void)didCreatePageController:(id)a3 forBrowserContextController:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)webProcessPlugIn:(id)a3 initializeWithObject:(id)a4;
- (void)willDestroyPageController:(id)a3 forBrowserContextController:(id)a4;
@end

@implementation _SFWebProcessPlugIn

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([MEMORY[0x1E4F98AF8] isInternalInstall]
    && (uint64_t v13 = *MEMORY[0x1E4F99100], [v10 isEqualToString:*MEMORY[0x1E4F99100]]))
  {
    v14 = [(WBSWebProcessPlugIn *)self plugInController];
    v15 = [v14 parameters];
    v16 = [v15 valueForKey:v13];
    uint64_t v17 = [v16 BOOLValue];

    v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v18 setBool:v17 forKey:v13];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)_SFWebProcessPlugIn;
    [(_SFWebProcessPlugIn *)&v19 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)webProcessPlugIn:(id)a3 initializeWithObject:(id)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_SFWebProcessPlugIn;
  [(WBSWebProcessPlugIn *)&v20 webProcessPlugIn:v6 initializeWithObject:a4];
  v7 = [v6 parameters];
  v8 = [v7 valueForKey:@"JavaScriptConsoleOutputURLBookmarkData"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [MEMORY[0x1E4F1CB10] URLByResolvingBookmarkData:v8 options:0 relativeToURL:0 bookmarkDataIsStale:0 error:0];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __61___SFWebProcessPlugIn_webProcessPlugIn_initializeWithObject___block_invoke;
    uint64_t v17 = &unk_1E5C72628;
    v18 = self;
    id v10 = v9;
    id v19 = v10;
    objc_msgSend(v10, "safari_accessingSecurityScopedResource:", &v14);
    javaScriptConsoleOutputFile = self->_javaScriptConsoleOutputFile;
    if (javaScriptConsoleOutputFile)
    {
      setvbuf(javaScriptConsoleOutputFile, 0, 1, 0);
    }
    else
    {
      id v12 = WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[_SFWebProcessPlugIn webProcessPlugIn:initializeWithObject:]((uint64_t)v10, v12);
      }
    }
  }
  if (objc_msgSend(MEMORY[0x1E4F98AF8], "isInternalInstall", v14, v15, v16, v17, v18))
  {
    uint64_t v13 = [v6 parameters];
    [v13 addObserver:self forKeyPath:*MEMORY[0x1E4F99100] options:4 context:0];
  }
}

- (void)didCreatePageController:(id)a3 forBrowserContextController:(id)a4
{
  id value = a3;
  id v6 = a4;
  objc_setAssociatedObject(v6, &kContextControllerToPlugInPageControllerAssociationKey, value, (void *)0x301);
  [(_SFWebProcessPlugIn *)self _installUIClientIfNecessaryWithPageController:value];
}

- (void)_installUIClientIfNecessaryWithPageController:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F78290] supportsWebpageStatusBar];
  javaScriptConsoleOutputFile = self->_javaScriptConsoleOutputFile;
  if (javaScriptConsoleOutputFile) {
    char v7 = 1;
  }
  else {
    char v7 = v5;
  }
  if (v7)
  {
    v8 = mouseDidMoveOverElementCallback;
    if (!v5) {
      v8 = 0;
    }
    if (javaScriptConsoleOutputFile) {
      v9 = willAddMessageWithDetailsToConsoleCallback;
    }
    else {
      v9 = 0;
    }
    objc_msgSend(v4, "browserContextController", 5, v4, 0, 0, 0, 0, 0, v8, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
    id v10 = v9);
    [v10 _bundlePageRef];
    WKBundlePageSetUIClient();
  }
}

- (void)dealloc
{
  v3 = [(WBSWebProcessPlugIn *)self plugInController];
  id v4 = [v3 parameters];

  [v4 removeObserver:self forKeyPath:*MEMORY[0x1E4F78878]];
  [v4 removeObserver:self forKeyPath:*MEMORY[0x1E4F78880]];
  [v4 removeObserver:self forKeyPath:*MEMORY[0x1E4F99120]];
  [v4 removeObserver:self forKeyPath:*MEMORY[0x1E4F78888]];
  javaScriptConsoleOutputFile = self->_javaScriptConsoleOutputFile;
  if (javaScriptConsoleOutputFile) {
    fclose(javaScriptConsoleOutputFile);
  }
  if ([MEMORY[0x1E4F98AF8] isInternalInstall])
  {
    id v6 = [(WBSWebProcessPlugIn *)self plugInController];
    char v7 = [v6 parameters];
    [v7 removeObserver:self forKeyPath:*MEMORY[0x1E4F99100]];
  }
  v8.receiver = self;
  v8.super_class = (Class)_SFWebProcessPlugIn;
  [(_SFWebProcessPlugIn *)&v8 dealloc];
}

- (void)willDestroyPageController:(id)a3 forBrowserContextController:(id)a4
{
}

- (id)pageControllerWithBrowserContextController:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    int v5 = [v4 _groupIdentifier];
  }
  else
  {
    id v6 = [v4 pageGroup];
    int v5 = [v6 identifier];
  }
  if ([v5 isEqualToString:@"Reader"])
  {
    char v7 = off_1E5C71468;
  }
  else
  {
    int v8 = [v5 isEqualToString:*MEMORY[0x1E4F99720]];
    char v7 = off_1E5C71588;
    if (v8) {
      char v7 = (__objc2_class **)0x1E4F98F38;
    }
  }
  v9 = (void *)[objc_alloc(*v7) initWithPlugIn:self contextController:v4];

  return v9;
}

- (void)webProcessPlugIn:(uint64_t)a1 initializeWithObject:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A690B000, a2, OS_LOG_TYPE_ERROR, "Unable to open JavaScript output file at %{public}@", (uint8_t *)&v2, 0xCu);
}

@end