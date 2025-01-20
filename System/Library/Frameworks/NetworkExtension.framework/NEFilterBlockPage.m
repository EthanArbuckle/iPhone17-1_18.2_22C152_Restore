@interface NEFilterBlockPage
- (NEFilterBlockPage)init;
- (id)page;
@end

@implementation NEFilterBlockPage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remediationButtonText, 0);
  objc_storeStrong((id *)&self->_unblockStyle, 0);
  objc_storeStrong((id *)&self->_formActionURL, 0);
  objc_storeStrong((id *)&self->_userURL, 0);
  objc_storeStrong((id *)&self->_pageTemplateURL, 0);

  objc_storeStrong((id *)&self->_organization, 0);
}

- (NEFilterBlockPage)init
{
  v11.receiver = self;
  v11.super_class = (Class)NEFilterBlockPage;
  v2 = [(NEFilterBlockPage *)&v11 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    formActionURL = v2->_formActionURL;
    v2->_formActionURL = (NSString *)&stru_1EF054CB8;

    remediationButtonText = v2->_remediationButtonText;
    v2->_remediationButtonText = (NSString *)@"Request Access";

    uint64_t v6 = [v3 URLForResource:@"blockpage" withExtension:@"html"];
    pageTemplateURL = v2->_pageTemplateURL;
    v2->_pageTemplateURL = (NSURL *)v6;

    unblockStyle = v2->_unblockStyle;
    v2->_unblockStyle = (NSString *)&stru_1EF054CB8;

    organization = v2->_organization;
    v2->_organization = (NSString *)&stru_1EF054CB8;
  }
  return v2;
}

- (id)page
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = a1[2];
    if (v2)
    {
      id v17 = 0;
      v3 = [NSString stringWithContentsOfURL:v2 encoding:4 error:&v17];
      id v4 = v17;
      v5 = v4;
      if (v3)
      {

        uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v7 = [v6 URLForResource:@"blockpage_style" withExtension:@"css"];
        if (v7)
        {
          *(void *)buf = 0;
          v8 = [NSString stringWithContentsOfURL:v7 encoding:4 error:buf];
        }
        else
        {
          v8 = 0;
        }

        objc_super v11 = [v3 stringByReplacingOccurrencesOfString:@"UNBLOCK_URL_NO_LOC" withString:a1[4]];
        v12 = [v11 stringByReplacingOccurrencesOfString:@"UNBLOCK_BUTTON_TEXT_NO_LOC" withString:a1[6]];

        v13 = [v12 stringByReplacingOccurrencesOfString:@"UNBLOCK_STYLE_NO_LOC" withString:a1[5]];

        v10 = [v13 stringByReplacingOccurrencesOfString:@"PROVIDER_ORGANIZATION_NO_LOC" withString:a1[1]];

        if (a1[3])
        {
          uint64_t v14 = objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", @"USER_VISIBLE_RESTRICTED_URL_NO_LOC");

          v10 = (void *)v14;
        }
        if (v8)
        {
          uint64_t v15 = [v10 stringByReplacingOccurrencesOfString:@"INCLUDE_CSS_FILE_NO_LOC" withString:v8];

          v10 = (void *)v15;
        }

        goto LABEL_16;
      }
      v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v5;
        _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_INFO, "Error loading block page: %@", buf, 0xCu);
      }
    }
    v3 = 0;
    v10 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v10 = 0;
LABEL_17:

  return v10;
}

@end