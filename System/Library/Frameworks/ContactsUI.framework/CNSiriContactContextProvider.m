@interface CNSiriContactContextProvider
+ (id)descriptorForRequiredKeys;
- (BOOL)allowContextProvider:(id)a3;
- (BOOL)isEnabled;
- (CNContact)contact;
- (CNContactStore)store;
- (CNSiriContactContextProvider)initWithContact:(id)a3 store:(id)a4;
- (id)defaultContextManager;
- (id)getCurrentContext;
- (void)_removeContextProviderOnMainThread;
- (void)dealloc;
- (void)setContact:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setStore:(id)a3;
@end

@implementation CNSiriContactContextProvider

+ (id)descriptorForRequiredKeys
{
  v2 = +[CNCapabilitiesManager defaultCapabilitiesManager];
  int v3 = [v2 hasSiriCapability];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F1B8F8];
    v5 = [(objc_class *)getCNAssistantConversionClass() descriptorsForRequiredKeys];
    v6 = [NSString stringWithUTF8String:"+[CNSiriContactContextProvider descriptorForRequiredKeys]"];
    v7 = [v4 descriptorWithKeyDescriptors:v5 description:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setStore:(id)a3
{
}

- (CNContactStore)store
{
  return self->_store;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (id)defaultContextManager
{
  Class v2 = (Class)getAFContextManagerClass[0]();

  return (id)[(objc_class *)v2 defaultContextManager];
}

- (void)_removeContextProviderOnMainThread
{
  id v3 = [(CNSiriContactContextProvider *)self defaultContextManager];
  [v3 removeContextProvider:self];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[CNSiriContactContextProvider setIsEnabled:](self, "setIsEnabled:");
  v5 = [(CNSiriContactContextProvider *)self defaultContextManager];
  id v6 = v5;
  if (v3) {
    [v5 addContextProvider:self];
  }
  else {
    [v5 removeContextProvider:self];
  }
}

- (id)getCurrentContext
{
  v9[1] = *MEMORY[0x1E4F143B8];
  Class CNAssistantConversionClass = getCNAssistantConversionClass();
  v4 = [(CNSiriContactContextProvider *)self contact];
  v5 = [(objc_class *)CNAssistantConversionClass createSAPersonFromCNContact:v4];

  if (v5)
  {
    id v6 = [v5 dictionary];
    v9[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)allowContextProvider:(id)a3
{
  return 1;
}

- (void)dealloc
{
  BOOL v3 = +[CNCapabilitiesManager defaultCapabilitiesManager];
  int v4 = [v3 hasSiriCapability];

  if (v4) {
    [(CNSiriContactContextProvider *)self performSelectorOnMainThread:sel__removeContextProviderOnMainThread withObject:0 waitUntilDone:1];
  }
  v5.receiver = self;
  v5.super_class = (Class)CNSiriContactContextProvider;
  [(CNSiriContactContextProvider *)&v5 dealloc];
}

- (CNSiriContactContextProvider)initWithContact:(id)a3 store:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[CNCapabilitiesManager defaultCapabilitiesManager];
  int v10 = [v9 hasSiriCapability];

  if (v10)
  {
    v15.receiver = self;
    v15.super_class = (Class)CNSiriContactContextProvider;
    v11 = [(CNSiriContactContextProvider *)&v15 init];
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_contact, a3);
      objc_storeStrong(p_isa + 3, a4);
    }
    self = p_isa;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end