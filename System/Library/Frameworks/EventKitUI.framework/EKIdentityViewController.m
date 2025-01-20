@interface EKIdentityViewController
+ (Class)_CNContactClass;
+ (Class)_CNContactStoreClass;
+ (Class)_CNContactStoreConfigurationClass;
+ (Class)_CNLabeledValueClass;
+ (Class)_CNMutableContactClass;
+ (id)_CNLabelWork;
+ (id)_createContactForIdentity:(id)a3;
+ (id)_createContactStore;
+ (id)_fetchContactForIdentity:(id)a3 store:(id)a4 keysToFetch:(id)a5;
+ (id)contactForIdentity:(id)a3 keysToFetch:(id)a4;
- (Class)_CNContactViewControllerClass;
- (EKIdentityViewController)initWithIdentity:(id)a3;
- (id)CNContactEmailAddressesKey;
- (id)CNContactPhoneNumbersKey;
- (id)EKUI_oopContentBackgroundColor;
- (void)_setIdentity:(id)a3;
- (void)_updateControllerWithContact:(id)a3 isNew:(BOOL)a4;
- (void)loadView;
@end

@implementation EKIdentityViewController

- (id)CNContactEmailAddressesKey
{
  return (id)EKWeakLinkStringConstant();
}

- (id)CNContactPhoneNumbersKey
{
  return (id)EKWeakLinkStringConstant();
}

+ (id)_CNLabelWork
{
  return (id)EKWeakLinkStringConstant();
}

+ (Class)_CNContactStoreClass
{
  return (Class)EKWeakLinkClass();
}

+ (Class)_CNContactStoreConfigurationClass
{
  return (Class)EKWeakLinkClass();
}

+ (Class)_CNContactClass
{
  return (Class)EKWeakLinkClass();
}

+ (Class)_CNMutableContactClass
{
  return (Class)EKWeakLinkClass();
}

- (Class)_CNContactViewControllerClass
{
  return (Class)EKWeakLinkClass();
}

+ (Class)_CNLabeledValueClass
{
  return (Class)EKWeakLinkClass();
}

- (EKIdentityViewController)initWithIdentity:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKIdentityViewController;
  v5 = [(EKIdentityViewController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() _createContactStore];
    store = v5->_store;
    v5->_store = (CNContactStore *)v6;

    [(EKIdentityViewController *)v5 _setIdentity:v4];
  }

  return v5;
}

+ (id)_createContactStore
{
  id v3 = objc_alloc_init((Class)[a1 _CNContactStoreConfigurationClass]);
  [v3 setIncludeIncludeManagedAppleIDs:1];
  id v4 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_CNContactStoreClass")), "initWithConfiguration:", v3);

  return v4;
}

+ (id)contactForIdentity:(id)a3 keysToFetch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 _createContactStore];
  objc_super v9 = [a1 _fetchContactForIdentity:v6 store:v8 keysToFetch:v7];

  if (!v9)
  {
    objc_super v9 = [a1 _createContactForIdentity:v6];
  }

  return v9;
}

+ (id)_fetchContactForIdentity:(id)a3 store:(id)a4 keysToFetch:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 emailAddress];

  v12 = (void *)[a1 _CNContactClass];
  if (v11)
  {
    v13 = [v10 emailAddress];

    v14 = [v12 predicateForContactsMatchingEmailAddress:v13];
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F1BA70];
    v13 = [v10 phoneNumber];

    v16 = [v15 phoneNumberWithStringValue:v13];
    v14 = [v12 predicateForContactsMatchingPhoneNumber:v16];
  }
  v17 = [v9 unifiedContactsMatchingPredicate:v14 keysToFetch:v8 error:0];

  v18 = [v17 firstObject];

  return v18;
}

+ (id)_createContactForIdentity:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [a1 _CNMutableContactClass];
  v5 = objc_opt_new();
  id v6 = [v4 emailAddress];
  id v7 = [v4 phoneNumber];
  id v8 = [v4 name];
  id v9 = [v4 firstName];
  id v10 = [v4 lastName];

  if ([v8 length]
    && (objc_msgSend(v8, "cal_isPhoneNumber") & 1) == 0
    && (![v9 length] || !objc_msgSend(v10, "length")))
  {
    CUIKDecomposedAttendeeName();
    id v11 = v9;

    id v12 = v10;
    id v10 = v12;
    id v9 = v11;
  }
  if (v6)
  {
    id v13 = objc_alloc((Class)[a1 _CNLabeledValueClass]);
    v14 = [a1 _CNLabelWork];
    v15 = (void *)[v13 initWithLabel:v14 value:v6];

    v22[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [v5 setEmailAddresses:v16];
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    id v17 = objc_alloc((Class)[a1 _CNLabeledValueClass]);
    v18 = [a1 _CNLabelWork];
    v19 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v7];
    v15 = (void *)[v17 initWithLabel:v18 value:v19];

    v21 = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [v5 setPhoneNumbers:v16];
  }

LABEL_11:
  if (!v9)
  {
    if (!v10)
    {
      [v5 setGivenName:v8];
      goto LABEL_16;
    }
LABEL_15:
    [v5 setFamilyName:v10];
    goto LABEL_16;
  }
  [v5 setGivenName:v9];
  if (v10) {
    goto LABEL_15;
  }
LABEL_16:

  return v5;
}

- (void)_updateControllerWithContact:(id)a3 isNew:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  id v6 = [(EKIdentityViewController *)self _CNContactViewControllerClass];
  if (v12)
  {
    if (v4) {
      [(objc_class *)v6 viewControllerForUnknownContact:v12];
    }
    else {
    id v7 = [(objc_class *)v6 viewControllerForContact:v12];
    }
  }
  else
  {
    id v7 = [(objc_class *)v6 viewControllerForNewContact:0];
  }
  id v8 = v7;
  [(CNContactViewController *)v7 setContactStore:self->_store];
  [(CNContactViewController *)v8 setShouldShowLinkedContacts:1];
  [(CNContactViewController *)v8 setDisplayMode:1];
  [(CNContactViewController *)v8 setAllowsEditing:0];
  personViewController = self->_personViewController;
  self->_personViewController = v8;
  id v10 = v8;
  id v11 = personViewController;

  [(EKIdentityViewController *)self addChildViewController:self->_personViewController];
  [(EKIdentityViewController *)self removeChildViewController:v11];
  [(CNContactViewController *)self->_personViewController didMoveToParentViewController:self];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  BOOL v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(EKIdentityViewController *)self setView:v4];

  id firstValue = [(CNContactViewController *)self->_personViewController view];
  [firstValue setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(EKIdentityViewController *)self view];
  [v5 addSubview:firstValue];

  id v6 = [(EKIdentityViewController *)self view];
  id v7 = (void *)MEMORY[0x1E4F28DC8];
  id v8 = _NSDictionaryOfVariableBindings(&cfstr_Personview.isa, firstValue, 0);
  id v9 = [v7 constraintsWithVisualFormat:@"H:|[personView]|" options:0 metrics:0 views:v8];
  [v6 addConstraints:v9];

  id v10 = [(EKIdentityViewController *)self view];
  id v11 = (void *)MEMORY[0x1E4F28DC8];
  id v12 = _NSDictionaryOfVariableBindings(&cfstr_Personview.isa, firstValue, 0);
  id v13 = [v11 constraintsWithVisualFormat:@"V:|[personView]|" options:0 metrics:0 views:v12];
  [v10 addConstraints:v13];
}

- (void)_setIdentity:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v5 = (EKIdentityProtocol *)a3;
  p_identity = &self->_identity;
  if (self->_identity != v5)
  {
    objc_storeStrong((id *)&self->_identity, a3);
    if (*p_identity)
    {
      id v7 = objc_opt_class();
      store = self->_store;
      id v9 = [(objc_class *)[(EKIdentityViewController *)self _CNContactViewControllerClass] descriptorForRequiredKeys];
      v17[0] = v9;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      id v11 = [v7 _fetchContactForIdentity:v5 store:store keysToFetch:v10];

      if (v11)
      {
        [(EKIdentityViewController *)self _updateControllerWithContact:v11 isNew:0];
        id v12 = [(EKIdentityProtocol *)v5 URL];
        int v13 = objc_msgSend(v12, "cal_hasSchemeTel");

        personViewController = self->_personViewController;
        if (v13) {
          [(EKIdentityViewController *)self CNContactPhoneNumbersKey];
        }
        else {
        v15 = [(EKIdentityViewController *)self CNContactEmailAddressesKey];
        }
        v16 = [v11 identifier];
        [(CNContactViewController *)personViewController highlightPropertyWithKey:v15 identifier:v16];
      }
      else
      {
        id v11 = [(id)objc_opt_class() _createContactForIdentity:*p_identity];
        [(EKIdentityViewController *)self _updateControllerWithContact:v11 isNew:1];
      }
    }
    else
    {
      [(EKIdentityViewController *)self _updateControllerWithContact:0 isNew:1];
    }
  }
}

- (id)EKUI_oopContentBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_personViewController, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

@end