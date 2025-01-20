@interface IMSWHighlightCenterController
+ (id)sharedController;
+ (id)sharedControllerWithAppIdentifier:(id)a3;
- (IMSWHighlightCenterController)init;
- (IMSWHighlightCenterController)initWithAppIdentifier:(id)a3;
- (IMSyndicationUtilities)utilities;
- (SWHighlightCenter)highlightCenter;
- (id)collaborationHighlightForURL:(id)a3 error:(id *)a4;
- (id)fetchAttributionsForHighlight:(id)a3;
- (void)fetchAttributionsForHighlight:(id)a3 completionHandler:(id)a4;
@end

@implementation IMSWHighlightCenterController

+ (id)sharedControllerWithAppIdentifier:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4B349F4;
  block[3] = &unk_1E5B7ACD0;
  id v9 = v3;
  uint64_t v4 = qword_1E965DE40;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1E965DE40, block);
  }
  id v6 = (id)qword_1E965DE48;

  return v6;
}

- (IMSWHighlightCenterController)initWithAppIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IMSWHighlightCenterController;
  id v5 = [(IMSWHighlightCenterController *)&v20 init];
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "-[IMSWHighlightCenterController initWithAppIdentifier:]";
        _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
      }
    }
    if (objc_msgSend_supportsSharedWithYou(MEMORY[0x1E4F6E730], v6, v7, v8))
    {
      id v10 = objc_alloc((Class)MEMORY[0x1A6263B40](@"SWHighlightCenter", @"SharedWithYou"));
      uint64_t v13 = objc_msgSend_initWithAppIdentifier_(v10, v11, (uint64_t)v4, v12);
      highlightCenter = v5->_highlightCenter;
      v5->_highlightCenter = (SWHighlightCenter *)v13;

      objc_msgSend_setDelegate_(v5->_highlightCenter, v15, (uint64_t)v5, v16);
      v17 = (IMSyndicationUtilities *)objc_alloc_init(MEMORY[0x1E4F6EA70]);
      utilities = v5->_utilities;
      v5->_utilities = v17;
    }
  }

  return v5;
}

+ (id)sharedController
{
  return (id)((uint64_t (*)(id, char *, void))MEMORY[0x1F4181798])(a1, sel_sharedControllerWithAppIdentifier_, 0);
}

- (IMSWHighlightCenterController)init
{
  return (IMSWHighlightCenterController *)objc_msgSend_initWithAppIdentifier_(self, a2, 0, v2);
}

- (id)collaborationHighlightForURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v10 = objc_msgSend_highlightCenter(self, v7, v8, v9);
  uint64_t v12 = objc_msgSend_collaborationHighlightForURL_error_(v10, v11, (uint64_t)v6, (uint64_t)a4);

  return v12;
}

- (void)fetchAttributionsForHighlight:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v11 = objc_msgSend_utilities(self, v8, v9, v10);
  v15 = objc_msgSend_highlightCenter(self, v12, v13, v14);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1A4B3AAFC;
  v18[3] = &unk_1E5B7ACF8;
  id v19 = v6;
  id v16 = v6;
  objc_msgSend_fetchAttributionsForHighlight_highlight_completionBlock_(v11, v17, (uint64_t)v15, (uint64_t)v7, v18);
}

- (id)fetchAttributionsForHighlight:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_highlightCenter(self, v5, v6, v7);
  v11 = objc_msgSend_fetchAttributionsForHighlight_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (IMSyndicationUtilities)utilities
{
  return self->_utilities;
}

- (SWHighlightCenter)highlightCenter
{
  return self->_highlightCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightCenter, 0);

  objc_storeStrong((id *)&self->_utilities, 0);
}

@end