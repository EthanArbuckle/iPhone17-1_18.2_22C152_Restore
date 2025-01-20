@interface PHCallBlockingAndIdentificationSettingsBundleController
- (BOOL)isHidden;
- (BOOL)shouldInsert;
- (CXCallDirectoryExtensionManager)extensionManager;
- (NSMutableArray)extensions;
- (NSMutableArray)llextensions;
- (PHBusinessCallingController)businessCallingController;
- (PHCallBlockingAndIdentificationSettingsBundleController)initWithParentListController:(id)a3;
- (PHCallBlockingServiceProviderController)serviceProviderController;
- (PSListController)parentListController;
- (PSSpecifier)callDirectorySpecifier;
- (id)specifiersWithSpecifier:(id)a3;
- (void)_updateExtensions;
- (void)didChangeServiceProvidersForCallBlockingServiceProviderController:(id)a3;
- (void)extensionsChangedForCallDirectoryExtensionManager:(id)a3;
- (void)setCallDirectorySpecifier:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setLlextensions:(id)a3;
- (void)updateParentListController;
@end

@implementation PHCallBlockingAndIdentificationSettingsBundleController

- (PHCallBlockingAndIdentificationSettingsBundleController)initWithParentListController:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PHCallBlockingAndIdentificationSettingsBundleController;
  v3 = [(PHCallBlockingAndIdentificationSettingsBundleController *)&v15 initWithParentListController:a3];
  if (v3)
  {
    v4 = (CXCallDirectoryExtensionManager *)objc_alloc_init((Class)CXCallDirectoryExtensionManager);
    extensionManager = v3->_extensionManager;
    v3->_extensionManager = v4;

    [(CXCallDirectoryExtensionManager *)v3->_extensionManager setDelegate:v3 queue:0];
    [(CXCallDirectoryExtensionManager *)v3->_extensionManager beginObservingExtensions];
    [(PHCallBlockingAndIdentificationSettingsBundleController *)v3 _updateExtensions];
    v6 = (PHCallBlockingServiceProviderController *)objc_alloc_init((Class)PHCallBlockingServiceProviderController);
    serviceProviderController = v3->_serviceProviderController;
    v3->_serviceProviderController = v6;

    [(PHCallBlockingServiceProviderController *)v3->_serviceProviderController setDelegate:v3];
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v9 = dispatch_queue_create("PHCallDirectorySettingsListControllerQueue", v8);
    id v10 = objc_alloc((Class)PHBusinessCallingController);
    id v11 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:v9];
    v12 = (PHBusinessCallingController *)[v10 initWithCoreTelephonyClient:v11];
    businessCallingController = v3->_businessCallingController;
    v3->_businessCallingController = v12;
  }
  return v3;
}

- (id)specifiersWithSpecifier:(id)a3
{
  v4 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self callDirectorySpecifier];

  if (!v4)
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"CALL_DIRECTORY_NAV_TITLE" value:&stru_42B8 table:@"CallDirectorySettings"];
    v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v7 setIdentifier:@"CALL_DIRECTORIES"];
    [(PHCallBlockingAndIdentificationSettingsBundleController *)self setCallDirectorySpecifier:v7];
  }
  if ([(PHCallBlockingAndIdentificationSettingsBundleController *)self isHidden])
  {
    v8 = 0;
  }
  else
  {
    dispatch_queue_t v9 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self callDirectorySpecifier];
    v8 = +[NSArray arrayWithObject:v9];
  }
  id v10 = [v8 copy];

  return v10;
}

- (BOOL)isHidden
{
  v3 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self extensions];
  unint64_t v4 = (unint64_t)[v3 count];

  v5 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self serviceProviderController];
  v6 = [v5 serviceProvidersSupportingSpamBlocking];
  unint64_t v7 = (unint64_t)[v6 count];

  v8 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self businessCallingController];
  dispatch_queue_t v9 = [v8 specifiers];
  unint64_t v10 = (unint64_t)[v9 count];

  id v11 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self llextensions];
  unint64_t v12 = (unint64_t)[v11 count];

  v13 = CallDirectoryLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218752;
    unint64_t v16 = v4;
    __int16 v17 = 2048;
    unint64_t v18 = v7;
    __int16 v19 = 2048;
    unint64_t v20 = v10;
    __int16 v21 = 2048;
    unint64_t v22 = v12;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "shouldShow extensions=%ld service providers=%ld business calling specifiers=%ld liveLookupExtensionsCount=%ld", (uint8_t *)&v15, 0x2Au);
  }

  return (v4 | v7 | v10 | v12) == 0;
}

- (void)_updateExtensions
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self extensionManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2424;
  v4[3] = &unk_41F8;
  v4[4] = self;
  [v3 extensionsWithCompletionHandler:v4];
}

- (PSListController)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSBundleController_opaque[OBJC_IVAR___PSBundleController__parent]);

  return (PSListController *)WeakRetained;
}

- (void)extensionsChangedForCallDirectoryExtensionManager:(id)a3
{
  unint64_t v4 = CallDirectoryLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Call directory extensions have changed", v5, 2u);
  }

  [(PHCallBlockingAndIdentificationSettingsBundleController *)self _updateExtensions];
}

- (void)didChangeServiceProvidersForCallBlockingServiceProviderController:(id)a3
{
  unint64_t v4 = CallDirectoryLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Call blocking service providers have changed", v5, 2u);
  }

  [(PHCallBlockingAndIdentificationSettingsBundleController *)self updateParentListController];
}

- (BOOL)shouldInsert
{
  v3 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self parentListController];
  unint64_t v4 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self parentListController];
  v5 = [v4 specifierID];

  v6 = [v3 specifierForID:@"CALL_DIRECTORIES"];

  if (!v6)
  {
    if ([v5 isEqualToString:@"com.apple.preferences.phone"])
    {
      LOBYTE(v7) = 1;
      goto LABEL_3;
    }
    if ([v5 isEqualToString:@"com.apple.preferences.facetime"])
    {
      unsigned int v7 = +[TUCallCapabilities supportsPrimaryCalling] ^ 1;
      goto LABEL_3;
    }
  }
  LOBYTE(v7) = 0;
LABEL_3:

  return v7;
}

- (void)updateParentListController
{
  id v4 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self parentListController];
  [v4 beginUpdates];
  if ([(PHCallBlockingAndIdentificationSettingsBundleController *)self isHidden])
  {
    [v4 removeSpecifierID:@"CALL_DIRECTORIES"];
  }
  else if ([(PHCallBlockingAndIdentificationSettingsBundleController *)self shouldInsert])
  {
    v3 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self callDirectorySpecifier];
    [v4 insertSpecifier:v3 afterSpecifierID:@"SILENCE_CALLS"];
  }
  [v4 endUpdates];
}

- (PSSpecifier)callDirectorySpecifier
{
  return self->_callDirectorySpecifier;
}

- (void)setCallDirectorySpecifier:(id)a3
{
}

- (NSMutableArray)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (NSMutableArray)llextensions
{
  return self->_llextensions;
}

- (void)setLlextensions:(id)a3
{
}

- (CXCallDirectoryExtensionManager)extensionManager
{
  return self->_extensionManager;
}

- (PHCallBlockingServiceProviderController)serviceProviderController
{
  return self->_serviceProviderController;
}

- (PHBusinessCallingController)businessCallingController
{
  return self->_businessCallingController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessCallingController, 0);
  objc_storeStrong((id *)&self->_serviceProviderController, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_llextensions, 0);
  objc_storeStrong((id *)&self->_extensions, 0);

  objc_storeStrong((id *)&self->_callDirectorySpecifier, 0);
}

@end