@interface WFDefaultContentPermissionRequestor
- (WFContactStore)contactStore;
- (void)allowContactsAccessWithCompletionHandler:(id)a3;
- (void)allowNetworkAccessAfterPromptingForURLs:(id)a3 completionHandler:(id)a4;
- (void)allowNetworkAccessWithoutPromptingWithCompletionHandler:(id)a3;
- (void)requestUserConsentToLoadWebContentAtURL:(id)a3 completionHandler:(id)a4;
- (void)setContactStore:(id)a3;
@end

@implementation WFDefaultContentPermissionRequestor

- (void).cxx_destruct
{
}

- (void)setContactStore:(id)a3
{
}

- (WFContactStore)contactStore
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = getWFContentGraphLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[WFDefaultContentPermissionRequestor contactStore]";
    _os_log_impl(&dword_216505000, v3, OS_LOG_TYPE_DEFAULT, "%s Returning default contact store.", (uint8_t *)&v8, 0xCu);
  }

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v5 = (WFContactStore *)objc_opt_new();
    v6 = self->_contactStore;
    self->_contactStore = v5;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (void)allowNetworkAccessWithoutPromptingWithCompletionHandler:(id)a3
{
}

- (void)allowNetworkAccessAfterPromptingForURLs:(id)a3 completionHandler:(id)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a4;
  v5 = getWFSecurityLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[WFDefaultContentPermissionRequestor allowNetworkAccessAfterPromptingForURLs:completionHandler:]";
    _os_log_impl(&dword_216505000, v5, OS_LOG_TYPE_DEFAULT, "%s Denying unrestricted network access due to missing WFContentPermissionRequestor", (uint8_t *)&v6, 0xCu);
  }

  (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
}

- (void)allowContactsAccessWithCompletionHandler:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = (void (**)(id, void *, void))a3;
  id v4 = getWFContentGraphLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[WFDefaultContentPermissionRequestor allowContactsAccessWithCompletionHandler:]";
    _os_log_impl(&dword_216505000, v4, OS_LOG_TYPE_DEFAULT, "%s Client requested -makeContactAccessResourceAvailable, but no WFContentPermissionRequestor was provided, using default contact store.", (uint8_t *)&v6, 0xCu);
  }

  v5 = objc_opt_new();
  v3[2](v3, v5, 0);
}

- (void)requestUserConsentToLoadWebContentAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a4;
  v5 = getWFSecurityLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[WFDefaultContentPermissionRequestor requestUserConsentToLoadWebContentAtURL:completionHandler:]";
    _os_log_impl(&dword_216505000, v5, OS_LOG_TYPE_DEFAULT, "%s Denying load of external web resources due to missing WFContentPermissionRequestor.", (uint8_t *)&v6, 0xCu);
  }

  (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
}

@end