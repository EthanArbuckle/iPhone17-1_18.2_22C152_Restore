@interface CNContactEditAuthorizationManager
- (BOOL)ignoresParentalRestrictions;
- (BOOL)saveWasAuthorized;
- (BOOL)shouldPromptForPasscodeAuthorization;
- (CNContact)contact;
- (CNContactEditAuthorizationManager)initWithContact:(id)a3 contactStore:(id)a4;
- (CNContactStore)contactStore;
- (CNContactViewCache)contactViewCache;
- (CNContainer)parentContainer;
- (CNUIEditAuthorizationController)authorizationController;
- (id)authorizationCheck;
- (id)authorizationResultBlock;
- (int64_t)authorizationResult;
- (void)authorizeForViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completionBlock:(id)a6;
- (void)editAuthorizationController:(id)a3 authorizationDidFinishWithResult:(int64_t)a4;
- (void)resetAuthorization;
- (void)setAuthorizationController:(id)a3;
- (void)setAuthorizationResult:(int64_t)a3;
- (void)setAuthorizationResultBlock:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactViewCache:(id)a3;
- (void)setIgnoresParentalRestrictions:(BOOL)a3;
- (void)setParentContainer:(id)a3;
- (void)updateWithContact:(id)a3;
@end

@implementation CNContactEditAuthorizationManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authorizationResultBlock, 0);
  objc_storeStrong((id *)&self->_authorizationController, 0);
  objc_storeStrong((id *)&self->_parentContainer, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contact, 0);

  objc_storeStrong((id *)&self->_contactViewCache, 0);
}

- (void)setAuthorizationResultBlock:(id)a3
{
}

- (id)authorizationResultBlock
{
  return self->_authorizationResultBlock;
}

- (void)setAuthorizationResult:(int64_t)a3
{
  self->_authorizationResult = a3;
}

- (int64_t)authorizationResult
{
  return self->_authorizationResult;
}

- (void)setAuthorizationController:(id)a3
{
}

- (CNUIEditAuthorizationController)authorizationController
{
  return self->_authorizationController;
}

- (void)setParentContainer:(id)a3
{
}

- (CNContainer)parentContainer
{
  return self->_parentContainer;
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContactViewCache:(id)a3
{
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (void)setIgnoresParentalRestrictions:(BOOL)a3
{
  self->_ignoresParentalRestrictions = a3;
}

- (BOOL)ignoresParentalRestrictions
{
  return self->_ignoresParentalRestrictions;
}

- (void)editAuthorizationController:(id)a3 authorizationDidFinishWithResult:(int64_t)a4
{
  [(CNContactEditAuthorizationManager *)self setAuthorizationController:0];
  [(CNContactEditAuthorizationManager *)self setAuthorizationResult:a4];
  v6 = [(CNContactEditAuthorizationManager *)self authorizationResultBlock];

  if (v6)
  {
    v7 = [(CNContactEditAuthorizationManager *)self authorizationResultBlock];
    v7[2](v7, a4);

    [(CNContactEditAuthorizationManager *)self setAuthorizationResultBlock:0];
  }
}

- (void)resetAuthorization
{
}

- (void)authorizeForViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v7 = a5;
  id v19 = a3;
  id v10 = a4;
  v11 = (void (**)(id, int64_t))a6;
  if ([(CNContactEditAuthorizationManager *)self authorizationResult] == 2) {
    v11[2](v11, [(CNContactEditAuthorizationManager *)self authorizationResult]);
  }
  [(CNContactEditAuthorizationManager *)self setAuthorizationResultBlock:v11];
  v12 = [(CNContactEditAuthorizationManager *)self authorizationController];

  if (!v12)
  {
    v13 = objc_alloc_init(CNUIEditAuthorizationController);
    [(CNContactEditAuthorizationManager *)self setAuthorizationController:v13];

    v14 = [(CNContactEditAuthorizationManager *)self authorizationController];
    [v14 setDelegate:self];

    v15 = [(CNContactEditAuthorizationManager *)self authorizationController];
    [v15 setSender:v10];

    v16 = [(CNContactEditAuthorizationManager *)self authorizationController];
    [v16 setAnimated:v7];

    v17 = [(CNContactEditAuthorizationManager *)self authorizationController];
    [v17 setGuardedViewController:v19];
  }
  v18 = [(CNContactEditAuthorizationManager *)self authorizationController];
  [v18 presentAuthorizationUI];
}

- (id)authorizationCheck
{
  id v3 = objc_alloc(MEMORY[0x1E4F5A650]);
  v4 = [(CNContactEditAuthorizationManager *)self contact];
  v5 = [(CNContactEditAuthorizationManager *)self parentContainer];
  BOOL v6 = [(CNContactEditAuthorizationManager *)self ignoresParentalRestrictions];
  BOOL v7 = [(CNContactEditAuthorizationManager *)self contactViewCache];
  v8 = (void *)[v3 initWithContact:v4 parentContainer:v5 ignoresParentalRestrictions:v6 linkedParentContainerProvider:v7];

  return v8;
}

- (BOOL)saveWasAuthorized
{
  v2 = self;
  id v3 = [(CNContactEditAuthorizationManager *)self authorizationCheck];
  LOBYTE(v2) = objc_msgSend(v3, "shouldBypassRestrictionsGivenAuthorizationResult:", -[CNContactEditAuthorizationManager authorizationResult](v2, "authorizationResult"));

  return (char)v2;
}

- (BOOL)shouldPromptForPasscodeAuthorization
{
  v2 = [(CNContactEditAuthorizationManager *)self authorizationCheck];
  char v3 = [v2 shouldPromptForPasscodeAuthorization];

  return v3;
}

- (void)updateWithContact:(id)a3
{
  BOOL v7 = (CNContact *)a3;
  if (self->_contact != v7)
  {
    objc_storeStrong((id *)&self->_contact, a3);
    v5 = [(CNContactEditAuthorizationManager *)self contactViewCache];
    BOOL v6 = [v5 containerForContact:v7];
    [(CNContactEditAuthorizationManager *)self setParentContainer:v6];
  }
}

- (CNContactEditAuthorizationManager)initWithContact:(id)a3 contactStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactEditAuthorizationManager;
  v9 = [(CNContactEditAuthorizationManager *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a3);
    objc_storeStrong((id *)&v10->_contactStore, a4);
    v10->_authorizationResult = 1;
    v11 = v10;
  }

  return v10;
}

@end