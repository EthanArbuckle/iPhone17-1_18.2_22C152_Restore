@interface _UNNotificationContentExtensionManager
+ (id)sharedInstance;
+ (void)initialize;
- (_UNNotificationContentExtensionCache)extensionsCache;
- (_UNNotificationContentExtensionManager)init;
- (id)_matchingAttributes;
- (id)extensionForNotificationSourceIdentifier:(id)a3 categoryIdentifier:(id)a4;
- (id)extensionsDiscoveryToken;
- (void)_beginMatchingExtensions;
- (void)_stopMatchingExtensions;
- (void)setExtensionsCache:(id)a3;
- (void)setExtensionsDiscoveryToken:(id)a3;
@end

@implementation _UNNotificationContentExtensionManager

+ (void)initialize
{
  id v2 = [(id)objc_opt_class() sharedInstance];
  [v2 _beginMatchingExtensions];
}

- (_UNNotificationContentExtensionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionManager;
  id v2 = [(_UNNotificationContentExtensionManager *)&v6 init];
  if (v2)
  {
    UNRegisterUserNotificationsUILogging();
    v3 = objc_alloc_init(_UNNotificationContentExtensionCache);
    extensionsCache = v2->_extensionsCache;
    v2->_extensionsCache = v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  id v2 = (void *)sharedInstance_instance;

  return v2;
}

- (id)extensionForNotificationSourceIdentifier:(id)a3 categoryIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [(_UNNotificationContentExtensionManager *)self extensionsCache];
    v9 = [v8 extensionForNotificationSourceIdentifier:v6 categoryIdentifier:v7];
  }
  else
  {
    v10 = UNLogExtensions;
    if (os_log_type_enabled((os_log_t)UNLogExtensions, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_222224000, v10, OS_LOG_TYPE_DEFAULT, "Not loading an extension because the notification has no category identifier", v12, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)_matchingAttributes
{
  id v2 = objc_opt_new();
  [v2 setObject:@"com.apple.usernotifications.content-extension" forKeyedSubscript:*MEMORY[0x263F07FF8]];

  return v2;
}

- (void)_beginMatchingExtensions
{
  v3 = UNLogExtensions;
  if (os_log_type_enabled((os_log_t)UNLogExtensions, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222224000, v3, OS_LOG_TYPE_DEFAULT, "Starting notifications extensions discovery", buf, 2u);
  }
  v4 = [(_UNNotificationContentExtensionManager *)self _matchingAttributes];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66___UNNotificationContentExtensionManager__beginMatchingExtensions__block_invoke;
  v7[3] = &unk_264603598;
  v7[4] = self;
  v5 = [MEMORY[0x263F08800] beginMatchingExtensionsWithAttributes:v4 completion:v7];
  id extensionsDiscoveryToken = self->_extensionsDiscoveryToken;
  self->_id extensionsDiscoveryToken = v5;
}

- (void)_stopMatchingExtensions
{
  if (self->_extensionsDiscoveryToken)
  {
    objc_msgSend(MEMORY[0x263F08800], "endMatchingExtensions:");
    id extensionsDiscoveryToken = self->_extensionsDiscoveryToken;
    self->_id extensionsDiscoveryToken = 0;
  }
}

- (_UNNotificationContentExtensionCache)extensionsCache
{
  return self->_extensionsCache;
}

- (void)setExtensionsCache:(id)a3
{
}

- (id)extensionsDiscoveryToken
{
  return self->_extensionsDiscoveryToken;
}

- (void)setExtensionsDiscoveryToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_extensionsDiscoveryToken, 0);

  objc_storeStrong((id *)&self->_extensionsCache, 0);
}

@end