@interface CNUICoreWhitelistedContactsControllerOptions
+ (CNUICoreWhitelistedContactsControllerOptions)iosOptions;
+ (CNUICoreWhitelistedContactsControllerOptions)macOptions;
+ (CNUICoreWhitelistedContactsControllerOptions)macOptionsLocal;
- (BOOL)shouldPrepopulateEmptyWhitelist;
- (BOOL)shouldRequireConfirmationOfChanges;
- (CNUICoreWhitelistedContactsControllerOptions)init;
- (CNUICoreWhitelistedContactsControllerOptions)initWithShouldPrepopulateEmptyWhitelist:(BOOL)a3 shouldRequireConfirmationOfChanges:(BOOL)a4;
@end

@implementation CNUICoreWhitelistedContactsControllerOptions

+ (CNUICoreWhitelistedContactsControllerOptions)macOptions
{
  v2 = (void *)[objc_alloc((Class)a1) initWithShouldPrepopulateEmptyWhitelist:1 shouldRequireConfirmationOfChanges:1];
  return (CNUICoreWhitelistedContactsControllerOptions *)v2;
}

+ (CNUICoreWhitelistedContactsControllerOptions)macOptionsLocal
{
  v2 = (void *)[objc_alloc((Class)a1) initWithShouldPrepopulateEmptyWhitelist:0 shouldRequireConfirmationOfChanges:1];
  return (CNUICoreWhitelistedContactsControllerOptions *)v2;
}

+ (CNUICoreWhitelistedContactsControllerOptions)iosOptions
{
  v2 = (void *)[objc_alloc((Class)a1) initWithShouldPrepopulateEmptyWhitelist:0 shouldRequireConfirmationOfChanges:0];
  return (CNUICoreWhitelistedContactsControllerOptions *)v2;
}

- (CNUICoreWhitelistedContactsControllerOptions)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreWhitelistedContactsControllerOptions)initWithShouldPrepopulateEmptyWhitelist:(BOOL)a3 shouldRequireConfirmationOfChanges:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CNUICoreWhitelistedContactsControllerOptions;
  v6 = [(CNUICoreWhitelistedContactsControllerOptions *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_shouldPrepopulateEmptyWhitelist = a3;
    v6->_shouldRequireConfirmationOfChanges = a4;
    v8 = v6;
  }

  return v7;
}

- (BOOL)shouldPrepopulateEmptyWhitelist
{
  return self->_shouldPrepopulateEmptyWhitelist;
}

- (BOOL)shouldRequireConfirmationOfChanges
{
  return self->_shouldRequireConfirmationOfChanges;
}

@end