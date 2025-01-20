@interface MFEmailSnippetMailProvider
- (BOOL)search:(id)a3 didFindResults:(id)a4;
- (MFEmailSnippetMailProvider)initWithAceObject:(id)a3;
- (id)stringForExpression:(id)a3;
- (id)stringForExpression:(id)a3 containsPrivacySensitiveContents:(BOOL *)a4;
- (void)search:(id)a3 didFinishWithError:(id)a4;
@end

@implementation MFEmailSnippetMailProvider

- (MFEmailSnippetMailProvider)initWithAceObject:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MFEmailSnippetMailProvider;
  v5 = [(MFEmailSnippetMailProvider *)&v23 init];
  if (!v5) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  v6 = [MFAssistantEmail alloc];
  v7 = [v4 dictionary];
  v8 = [(MFAssistantEmail *)v6 initWithDictionary:v7];
  email = v5->_email;
  v5->_email = v8;

  v10 = (EFPromise *)objc_alloc_init((Class)EFPromise);
  emailContentPromise = v5->_emailContentPromise;
  v5->_emailContentPromise = v10;

  v12 = [(MFAssistantEmail *)v5->_email identifier];
  v28 = v12;
  v13 = +[NSArray arrayWithObjects:&v28 count:1];
  v14 = +[MFAssistant loadEmailContentForEmails:v13 delegate:v5];

  v15 = [(EFPromise *)v5->_emailContentPromise future];
  id v22 = 0;
  v16 = [v15 resultWithTimeout:&v22 error:5.0];
  id v17 = v22;

  if (v16)
  {

LABEL_5:
    v18 = v5;
    goto LABEL_6;
  }
  [v14 cancel];
  v20 = MFLogGeneral();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    pthread_t v21 = pthread_self();
    *(_DWORD *)buf = 134218242;
    pthread_t v25 = v21;
    __int16 v26 = 2112;
    id v27 = v17;
    _os_log_impl(&def_4BE8, v20, OS_LOG_TYPE_DEFAULT, "#Warning ERROR: Content did not load in time.  Returning bogus controller: %p error:%@", buf, 0x16u);
  }

  v18 = 0;
LABEL_6:

  return v18;
}

- (id)stringForExpression:(id)a3
{
  v3 = [(MFEmailSnippetMailProvider *)self stringForExpression:a3 containsPrivacySensitiveContents:0];

  return v3;
}

- (id)stringForExpression:(id)a3 containsPrivacySensitiveContents:(BOOL *)a4
{
  id v6 = a3;
  if (![v6 isEqualToString:SAEmailEmailFromEmailPListKey])
  {
    if ([v6 isEqualToString:SAEmailEmailSubjectPListKey])
    {
      if (a4) {
        *a4 = 1;
      }
      uint64_t v16 = [(MFAssistantEmail *)self->_email subject];
    }
    else
    {
      if (![v6 isEqualToString:SAEmailEmailMessagePreviewPListKey])
      {
        if (a4) {
          *a4 = 0;
        }
        v8 = MFLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138412290;
          id v20 = v6;
          _os_log_impl(&def_4BE8, v8, OS_LOG_TYPE_DEFAULT, "#Warning Unknown expression: %@", (uint8_t *)&v19, 0xCu);
        }
        goto LABEL_20;
      }
      if (a4) {
        *a4 = 1;
      }
      uint64_t v16 = [(MFAssistantEmail *)self->_email message];
    }
    id v17 = (void *)v16;
    goto LABEL_24;
  }
  uint64_t v7 = [(MFAssistantEmail *)self->_email fromEmail];
  v8 = v7;
  if (v7)
  {
    if (a4) {
      *a4 = 1;
    }
    uint64_t v21 = v7;
    v9 = +[NSArray arrayWithObjects:&v21 count:1];
    v10 = MFCommentedEmailsFromSAPersonAttributes(v9);
    id v11 = [v10 lastObject];
    v12 = [v11 emailAddressValue];
    v13 = [v12 displayName];
    v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v11 stringValue];
    }
    id v17 = v15;

    goto LABEL_23;
  }
LABEL_20:
  id v17 = 0;
LABEL_23:

LABEL_24:

  return v17;
}

- (BOOL)search:(id)a3 didFindResults:(id)a4
{
  v5 = objc_msgSend(a4, "lastObject", a3);
  +[MFAssistant permuteEmail:self->_email withResults:v5];

  return 1;
}

- (void)search:(id)a3 didFinishWithError:(id)a4
{
  id v6 = a4;
  v5 = [(EFPromise *)self->_emailContentPromise errorOnlyCompletionHandlerAdapter];
  ((void (**)(void, id))v5)[2](v5, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailContentPromise, 0);

  objc_storeStrong((id *)&self->_email, 0);
}

@end