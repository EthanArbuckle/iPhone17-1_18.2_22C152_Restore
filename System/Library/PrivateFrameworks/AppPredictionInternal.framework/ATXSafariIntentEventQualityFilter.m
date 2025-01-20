@interface ATXSafariIntentEventQualityFilter
- (ATXContextKitClient)ckClient;
- (ATXSafariIntentEventQualityFilter)init;
- (ATXSafariIntentEventQualityFilter)initWithContextKitClient:(id)a3;
- (BOOL)shouldAcceptSafariDonation:(id)a3;
- (BOOL)shouldBlockURLForObjectionableContent:(id)a3;
@end

@implementation ATXSafariIntentEventQualityFilter

- (ATXSafariIntentEventQualityFilter)init
{
  v3 = objc_opt_new();
  v4 = [(ATXSafariIntentEventQualityFilter *)self initWithContextKitClient:v3];

  return v4;
}

- (ATXSafariIntentEventQualityFilter)initWithContextKitClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSafariIntentEventQualityFilter;
  v6 = [(ATXSafariIntentEventQualityFilter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ckClient, a3);
  }

  return v7;
}

- (BOOL)shouldAcceptSafariDonation:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 bundleId];
  v6 = [v4 intentType];
  if ([v5 isEqualToString:@"com.apple.mobilesafari"]
    && [v6 isEqualToString:@"NSUA_NSUserActivityTypeBrowsingWeb"])
  {
    v7 = [v4 action];

    if (!v7)
    {
      v10 = __atxlog_handle_default();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (objc_class *)objc_opt_class();
        v19 = NSStringFromClass(v18);
        int v22 = 138412290;
        v23 = v19;
        _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "%@ - No ATXAction found. Skipping this action.", (uint8_t *)&v22, 0xCu);
      }
      goto LABEL_15;
    }
    v8 = [v4 action];
    objc_super v9 = [v8 userActivity];
    v10 = [v9 webpageURL];

    v11 = [v10 absoluteString];
    uint64_t v12 = [v11 length];

    if (v12)
    {
      if (![(ATXSafariIntentEventQualityFilter *)self shouldBlockURLForObjectionableContent:v10])
      {
        BOOL v17 = 1;
        goto LABEL_16;
      }
      v13 = __atxlog_handle_default();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      int v22 = 138412290;
      v23 = v15;
      v16 = "%@ - Objectionable Safari donation found by ContextKit. Skipping this action.";
    }
    else
    {
      v13 = __atxlog_handle_default();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

LABEL_15:
        BOOL v17 = 0;
LABEL_16:

        goto LABEL_17;
      }
      v20 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v20);
      int v22 = 138412290;
      v23 = v15;
      v16 = "%@ - No webpageURL found. Skipping this action.";
    }
    _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, 0xCu);

    goto LABEL_14;
  }
  BOOL v17 = 1;
LABEL_17:

  return v17;
}

- (BOOL)shouldBlockURLForObjectionableContent:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXSafariIntentEventQualityFilter *)self ckClient];
  v6 = [v5 level1TopicIdsForURL:v4];

  LOBYTE(v4) = [v6 containsObject:@"EC9001"];
  return (char)v4;
}

- (ATXContextKitClient)ckClient
{
  return self->_ckClient;
}

- (void).cxx_destruct
{
}

@end