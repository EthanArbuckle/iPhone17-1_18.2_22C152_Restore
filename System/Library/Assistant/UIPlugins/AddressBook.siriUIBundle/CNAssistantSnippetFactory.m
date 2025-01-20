@interface CNAssistantSnippetFactory
- (CNAssistantDisambiguationProvider)disambiguationProvider;
- (CNAssistantSnippetFactory)init;
- (CNContactStore)contactStore;
- (id)disambiguationItemForListItem:(id)a3 disambiguationKey:(id)a4;
- (id)speakableNamespaceProviderForAceObject:(id)a3;
- (id)viewControllerForSnippet:(id)a3 error:(id *)a4;
- (void)setContactStore:(id)a3;
- (void)setDisambiguationProvider:(id)a3;
@end

@implementation CNAssistantSnippetFactory

- (CNAssistantSnippetFactory)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNAssistantSnippetFactory;
  v2 = [(CNAssistantSnippetFactory *)&v6 init];
  if (v2)
  {
    v3 = (CNContactStore *)objc_alloc_init((Class)CNContactStore);
    contactStore = v2->_contactStore;
    v2->_contactStore = v3;
  }
  return v2;
}

- (id)viewControllerForSnippet:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [CNAssistantSnippetController alloc];
    v8 = [(CNAssistantSnippetFactory *)self contactStore];
    v9 = [(CNAssistantSnippetController *)v7 initWithAceObject:v6 contactStore:v8 error:a4];

    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_72A8();
    if (a4) {
      goto LABEL_5;
    }
  }
  else if (a4)
  {
LABEL_5:
    +[NSError errorWithDomain:SiriUISnippetPluginErrorDomain code:100 userInfo:0];
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (id)disambiguationItemForListItem:(id)a3 disambiguationKey:(id)a4
{
  id v5 = a3;
  disambiguationProvider = self->_disambiguationProvider;
  if (!disambiguationProvider)
  {
    v7 = [CNAssistantDisambiguationProvider alloc];
    v8 = [(CNAssistantSnippetFactory *)self contactStore];
    v9 = [(CNAssistantDisambiguationProvider *)v7 initWithContactStore:v8];
    v10 = self->_disambiguationProvider;
    self->_disambiguationProvider = v9;

    disambiguationProvider = self->_disambiguationProvider;
  }
  v11 = [(CNAssistantDisambiguationProvider *)disambiguationProvider disambiguationItemForListItem:v5];

  return v11;
}

- (id)speakableNamespaceProviderForAceObject:(id)a3
{
  return 0;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (CNAssistantDisambiguationProvider)disambiguationProvider
{
  return self->_disambiguationProvider;
}

- (void)setDisambiguationProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disambiguationProvider, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end