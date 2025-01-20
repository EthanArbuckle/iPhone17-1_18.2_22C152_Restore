@interface CKAssistantSMSRetrieve
- (id)_validateRetrieve;
- (void)performWithCompletion:(id)a3;
@end

@implementation CKAssistantSMSRetrieve

- (id)_validateRetrieve
{
  v2 = [(CKAssistantSMSRetrieve *)self identifiers];
  id v3 = [v2 count];

  if (v3) {
    id v4 = 0;
  }
  else {
    id v4 = [objc_alloc((Class)SACommandFailed) initWithReason:@"No identifiers to retrieve"];
  }

  return v4;
}

- (void)performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "SMSRetrieve performWithCompletion", buf, 2u);
    }
  }
  id v6 = [(CKAssistantSMSRetrieve *)self _validateRetrieve];
  if (!v6)
  {
    v7 = +[NSMutableArray array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = [(CKAssistantSMSRetrieve *)self identifiers];
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v11) identifier];
          v13 = CKAssistantGetDraftForIdentifier();

          if (v13) {
            [v7 addObject:v13];
          }

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }

    id v6 = objc_alloc_init((Class)SADomainObjectRetrieveCompleted);
    [v6 setObjects:v7];
  }
  v14 = [v6 dictionary];
  v4[2](v4, v14);
}

@end