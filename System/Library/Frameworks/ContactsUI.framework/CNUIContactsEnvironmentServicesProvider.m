@interface CNUIContactsEnvironmentServicesProvider
+ (id)applicationWorkspace;
+ (id)capabilities;
+ (id)defaultUserActionFetcher;
+ (id)idsIDQueryControllerWrapper;
+ (id)recentsManagerWithSchedulerProvider:(id)a3;
+ (id)suggestionsService;
@end

@implementation CNUIContactsEnvironmentServicesProvider

+ (id)applicationWorkspace
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F5A608]);

  return v2;
}

+ (id)suggestionsService
{
  id v2 = [(Class)getSGSuggestionsServiceClass[0]() serviceForContacts];
  [v2 setSyncTimeout:0.2];

  return v2;
}

+ (id)idsIDQueryControllerWrapper
{
  id v2 = objc_alloc(MEMORY[0x1E4F5A6A8]);
  v3 = [(objc_class *)getIDSIDQueryControllerClass_49869() sharedInstance];
  v4 = (void *)[v2 initWithController:v3];

  return v4;
}

+ (id)defaultUserActionFetcher
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F5A690]);

  return v2;
}

+ (id)capabilities
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F5A5F8]);

  return v2;
}

+ (id)recentsManagerWithSchedulerProvider:(id)a3
{
  v3 = (Class (__cdecl *)())getCRRecentContactsLibraryClass[0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3());
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F5A680]) initWithRecentsLibrary:v5 schedulerProvider:v4];

  return v6;
}

@end