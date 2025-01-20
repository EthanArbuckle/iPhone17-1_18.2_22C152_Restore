@interface FPUIAction
- (BOOL)isNonUIAction;
- (FPProviderDomain)fpProviderDomain;
- (FPUIAction)initWithIdentifier:(id)a3 uiActionProviderIdentifier:(id)a4 fileProviderIdentifier:(id)a5 displayName:(id)a6 predicate:(id)a7 displayInline:(BOOL)a8 isNonUIAction:(BOOL)a9;
- (FPUIAction)initWithIdentifier:(id)a3 uiActionProviderIdentifier:(id)a4 fileProviderIdentifier:(id)a5 displayName:(id)a6 predicate:(id)a7 displayInline:(BOOL)a8 isNonUIAction:(BOOL)a9 fpProviderDomain:(id)a10;
@end

@implementation FPUIAction

- (FPUIAction)initWithIdentifier:(id)a3 uiActionProviderIdentifier:(id)a4 fileProviderIdentifier:(id)a5 displayName:(id)a6 predicate:(id)a7 displayInline:(BOOL)a8 isNonUIAction:(BOOL)a9
{
  v10.receiver = self;
  v10.super_class = (Class)FPUIAction;
  result = [(UIDocumentBrowserActionDescriptor *)&v10 initWithIdentifier:a3 uiActionProviderIdentifier:a4 fileProviderIdentifier:a5 displayName:a6 predicate:a7 displayInline:a6 != 0];
  if (result) {
    result->_isNonUIAction = a9;
  }
  return result;
}

- (FPUIAction)initWithIdentifier:(id)a3 uiActionProviderIdentifier:(id)a4 fileProviderIdentifier:(id)a5 displayName:(id)a6 predicate:(id)a7 displayInline:(BOOL)a8 isNonUIAction:(BOOL)a9 fpProviderDomain:(id)a10
{
  BOOL v10 = a8;
  id v17 = a10;
  v21.receiver = self;
  v21.super_class = (Class)FPUIAction;
  v18 = [(UIDocumentBrowserActionDescriptor *)&v21 initWithIdentifier:a3 uiActionProviderIdentifier:a4 fileProviderIdentifier:a5 displayName:a6 predicate:a7 displayInline:v10];
  v19 = v18;
  if (v18)
  {
    v18->_isNonUIAction = a9;
    objc_storeStrong((id *)&v18->_fpProviderDomain, a10);
  }

  return v19;
}

- (FPProviderDomain)fpProviderDomain
{
  return self->_fpProviderDomain;
}

- (BOOL)isNonUIAction
{
  return self->_isNonUIAction;
}

- (void).cxx_destruct
{
}

@end