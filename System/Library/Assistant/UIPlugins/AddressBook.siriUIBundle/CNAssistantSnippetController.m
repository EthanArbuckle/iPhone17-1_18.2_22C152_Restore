@interface CNAssistantSnippetController
- (CNAssistantSnippetController)initWithAceObject:(id)a3 contactStore:(id)a4 error:(id *)a5;
- (CNAssistantSnippetView)snippetView;
- (double)desiredHeightForWidth:(double)a3;
- (id)_displayedPropertiesFromSiriDiplayedProperties:(id)a3;
- (void)configureContentWithSizeClass:(int64_t)a3;
- (void)setSnippetView:(id)a3;
@end

@implementation CNAssistantSnippetController

- (CNAssistantSnippetController)initWithAceObject:(id)a3 contactStore:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CNAssistantSnippetController;
  v10 = [(CNAssistantSnippetController *)&v32 init];
  if (v10)
  {
    v11 = [v8 persons];
    id v12 = [v11 count];

    if (!v12)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_7260();
      }

      v10 = 0;
    }
    v13 = [v8 persons];
    v14 = [v13 objectAtIndex:0];

    v15 = [v14 me];
    if ([v15 BOOLValue])
    {
    }
    else
    {
      v16 = [v14 identifier];

      if (!v16)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_7218();
        }
        v21 = v10;
        goto LABEL_26;
      }
    }
    if (!v10)
    {
LABEL_28:

      goto LABEL_29;
    }
    v17 = [v14 me];
    unsigned int v18 = [v17 BOOLValue];

    if (v18)
    {
      v19 = +[CNAssistantSnippetView descriptorForRequiredKeys];
      id v31 = 0;
      v20 = [v9 _crossPlatformUnifiedMeContactWithKeysToFetch:v19 error:&v31];
      v21 = (CNAssistantSnippetController *)v31;

      if (!v20 && v21)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_710C((uint64_t)v21);
        }
LABEL_22:

LABEL_26:
        v10 = 0;
        goto LABEL_27;
      }
    }
    else
    {
      v22 = [v14 identifier];
      v23 = +[CNAssistantID contactIDFromAssistantID:v22];

      v24 = +[CNAssistantSnippetView descriptorForRequiredKeys];
      id v30 = 0;
      v20 = [v9 unifiedContactWithIdentifier:v23 keysToFetch:v24 error:&v30];
      v21 = (CNAssistantSnippetController *)v30;

      if (!v20 && v21 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_718C((uint64_t)v23, (uint64_t)v21);
      }
    }
    if (v20)
    {
      v25 = [v8 displayProperties];
      v26 = [(CNAssistantSnippetController *)v10 _displayedPropertiesFromSiriDiplayedProperties:v25];

      v27 = -[CNAssistantSnippetView initWithFrame:contact:displayedProperties:viewController:]([CNAssistantSnippetView alloc], "initWithFrame:contact:displayedProperties:viewController:", v20, v26, v10, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      snippetView = v10->_snippetView;
      v10->_snippetView = v27;

      [(CNAssistantSnippetController *)v10 setView:v10->_snippetView];
      -[CNAssistantSnippetController setDefaultViewInsets:](v10, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

LABEL_27:
      goto LABEL_28;
    }
    goto LABEL_22;
  }
LABEL_29:
  if (a5 && !v10)
  {
    *a5 = +[NSError errorWithDomain:SiriUISnippetPluginErrorDomain code:101 userInfo:0];
  }

  return v10;
}

- (double)desiredHeightForWidth:(double)a3
{
  v4 = [(CNAssistantSnippetController *)self snippetView];
  [v4 desiredHeightForWidth:a3];
  double v6 = v5;

  return v6;
}

- (id)_displayedPropertiesFromSiriDiplayedProperties:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    double v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v20 = v4;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v23;
      v21 = (NSString *)CNContactUIBirthdaysKey;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          unsigned __int8 v12 = [v11 isEqualToString:@"emails"];
          v13 = CNContactEmailAddressesKey;
          if (v12) {
            goto LABEL_13;
          }
          unsigned __int8 v14 = [v11 isEqualToString:@"phones"];
          v13 = CNContactPhoneNumbersKey;
          if (v14) {
            goto LABEL_13;
          }
          unsigned __int8 v15 = [v11 isEqualToString:@"addresses"];
          v13 = CNContactPostalAddressesKey;
          if ((v15 & 1) == 0)
          {
            unsigned __int8 v16 = [v11 isEqualToString:@"birthday"];
            v13 = v21;
            if ((v16 & 1) == 0)
            {
              unsigned __int8 v17 = [v11 isEqualToString:@"relatedNames"];
              v13 = CNContactRelationsKey;
              if ((v17 & 1) == 0)
              {
                unsigned int v18 = [v11 isEqualToString:@"socialProfiles"];
                v13 = CNContactSocialProfilesKey;
                if (!v18) {
                  continue;
                }
              }
            }
          }
LABEL_13:
          [v5 addObject:v13];
        }
        id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    v4 = v20;
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)configureContentWithSizeClass:(int64_t)a3
{
  id v4 = [(CNAssistantSnippetController *)self snippetView];
  [v4 setSnippetSizeClass:a3];
}

- (CNAssistantSnippetView)snippetView
{
  return self->_snippetView;
}

- (void)setSnippetView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end