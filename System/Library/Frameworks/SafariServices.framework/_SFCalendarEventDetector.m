@interface _SFCalendarEventDetector
- (_SFCalendarEventDetector)initWithWebView:(id)a3;
- (void)_containsCalendarEventForPageWithSchemaOrgMarkup:(BOOL)a3;
- (void)_foundCalendarEvents:(id)a3;
- (void)_service:(id)a3 didFindEventCandidateForURL:(id)a4 pageTitle:(id)a5;
- (void)cancelCheckForConfirmationPage;
- (void)containsCalendarEventForPageWithSchemaOrgMarkup:(BOOL)a3;
@end

@implementation _SFCalendarEventDetector

- (_SFCalendarEventDetector)initWithWebView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFCalendarEventDetector;
  v5 = [(_SFCalendarEventDetector *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webView, v4);
    v7 = v6;
  }

  return v6;
}

- (void)containsCalendarEventForPageWithSchemaOrgMarkup:(BOOL)a3
{
  [(_SFCalendarEventDetector *)self cancelCheckForConfirmationPage];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v6 = [WeakRetained _unreachableURL];

  if (!v6)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76___SFCalendarEventDetector_containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke;
    block[3] = &unk_1E5C750F8;
    objc_copyWeak(&v11, &location);
    BOOL v12 = a3;
    dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
    id checkForCalendarEventsBlock = self->_checkForCalendarEventsBlock;
    self->_id checkForCalendarEventsBlock = v7;

    dispatch_time_t v9 = dispatch_time(0, 2000000000);
    dispatch_after(v9, MEMORY[0x1E4F14428], self->_checkForCalendarEventsBlock);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)cancelCheckForConfirmationPage
{
  id checkForCalendarEventsBlock = self->_checkForCalendarEventsBlock;
  if (checkForCalendarEventsBlock)
  {
    dispatch_block_cancel(checkForCalendarEventsBlock);
    id v4 = self->_checkForCalendarEventsBlock;
    self->_id checkForCalendarEventsBlock = 0;
  }
}

- (void)_containsCalendarEventForPageWithSchemaOrgMarkup:(BOOL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_block_t v7 = [WeakRetained URL];
    v8 = [v6 title];
    dispatch_time_t v9 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[_SFCalendarEventDetector _containsCalendarEventForPageWithSchemaOrgMarkup:](v9);
    }
    v10 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[_SFCalendarEventDetector _containsCalendarEventForPageWithSchemaOrgMarkup:]();
    }
    id v11 = dispatch_get_global_queue(9, 0);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77___SFCalendarEventDetector__containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke;
    v14[3] = &unk_1E5C75148;
    id v15 = v7;
    id v16 = v8;
    BOOL v18 = a3;
    v17 = self;
    id v12 = v8;
    id v13 = v7;
    dispatch_async(v11, v14);
  }
}

- (void)_service:(id)a3 didFindEventCandidateForURL:(id)a4 pageTitle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  id v12 = WeakRetained;
  if (WeakRetained)
  {
    id v13 = [WeakRetained URL];
    int v14 = [v13 isEqual:v9];

    if (v14)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke;
      v15[3] = &unk_1E5C75198;
      id v16 = v9;
      id v17 = v8;
      id v18 = v10;
      v19 = self;
      [v12 _getMainResourceDataWithCompletionHandler:v15];
    }
  }
}

- (void)_foundCalendarEvents:(id)a3
{
  id v3 = a3;
  id v4 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A690B000, v4, OS_LOG_TYPE_INFO, "Found calendar events", v6, 2u);
  }
  v5 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_SFCalendarEventDetector _foundCalendarEvents:]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_checkForCalendarEventsBlock, 0);

  objc_destroyWeak((id *)&self->_webView);
}

- (void)_containsCalendarEventForPageWithSchemaOrgMarkup:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2113;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1A690B000, v1, OS_LOG_TYPE_DEBUG, "Page URL: %{private}@ and title: '%{private}@'", v2, 0x16u);
}

- (void)_containsCalendarEventForPageWithSchemaOrgMarkup:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1A690B000, log, OS_LOG_TYPE_DEBUG, "Beginning event detection on page", v1, 2u);
}

- (void)_foundCalendarEvents:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1A690B000, v0, OS_LOG_TYPE_DEBUG, "Calendar events: %{private}@", v1, 0xCu);
}

@end