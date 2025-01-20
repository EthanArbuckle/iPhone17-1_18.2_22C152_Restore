@interface EMFEmojiPreferencesService
+ (id)sharedServiceWithMachName:(id)a3;
- (BOOL)allowsConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (EMFEmojiPreferences)preferences;
- (EMFEmojiPreferencesService)initWithMachName:(id)a3;
- (OS_dispatch_queue)dispatchQueue;
- (id)obtainApplicationIdentifierFromConnection:(id)a3;
- (id)obtainBundleIdentifierFromConnection:(id)a3;
- (void)_createPreferencesIfNecessary;
- (void)dealloc;
- (void)setPreferences:(id)a3;
@end

@implementation EMFEmojiPreferencesService

+ (id)sharedServiceWithMachName:(id)a3
{
  v3 = (__CFString *)a3;
  if (v3) {
    v4 = v3;
  }
  else {
    v4 = @"com.apple.TextInput.emoji";
  }
  if (+[EMFEmojiPreferencesService sharedServiceWithMachName:]::onceToken != -1) {
    dispatch_once(&+[EMFEmojiPreferencesService sharedServiceWithMachName:]::onceToken, &__block_literal_global_294);
  }
  v5 = [(id)+[EMFEmojiPreferencesService sharedServiceWithMachName:]::_services objectForKey:v4];
  if (!v5)
  {
    v5 = [[EMFEmojiPreferencesService alloc] initWithMachName:v4];
    [(id)+[EMFEmojiPreferencesService sharedServiceWithMachName:]::_services setObject:v5 forKey:v4];
  }

  return v5;
}

uint64_t __56__EMFEmojiPreferencesService_sharedServiceWithMachName___block_invoke()
{
  +[EMFEmojiPreferencesService sharedServiceWithMachName:]::_services = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  return MEMORY[0x1F41817F8]();
}

- (EMFEmojiPreferencesService)initWithMachName:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EMFEmojiPreferencesService;
  v5 = [(EMFEmojiPreferencesService *)&v13 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.TextInput.emoji", 0);
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v6;

    v8 = v5->_dispatchQueue;
    v9 = dispatch_get_global_queue(2, 0);
    dispatch_set_target_queue(v8, v9);

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v4];
    listener = v5->_listener;
    v5->_listener = (NSXPCListener *)v10;

    [(NSXPCListener *)v5->_listener setDelegate:v5];
    [(NSXPCListener *)v5->_listener _setQueue:v5->_dispatchQueue];
    [(NSXPCListener *)v5->_listener resume];
  }

  return v5;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  listener = self->_listener;
  self->_listener = 0;

  preferences = self->_preferences;
  self->_preferences = 0;

  v5.receiver = self;
  v5.super_class = (Class)EMFEmojiPreferencesService;
  [(EMFEmojiPreferencesService *)&v5 dealloc];
}

- (void)_createPreferencesIfNecessary
{
  if (!self->_preferences)
  {
    v3 = objc_alloc_init(EMFEmojiPreferences);
    preferences = self->_preferences;
    self->_preferences = v3;

    objc_super v5 = self->_preferences;
    [(EMFEmojiPreferences *)v5 readEmojiDefaults];
  }
}

- (EMFEmojiPreferences)preferences
{
  [(EMFEmojiPreferencesService *)self _createPreferencesIfNecessary];
  preferences = self->_preferences;
  return preferences;
}

- (id)obtainApplicationIdentifierFromConnection:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    [v3 auditToken];
    objc_super v5 = SecTaskCreateWithAuditToken(0, &token);
    dispatch_queue_t v6 = v5;
    v12 = v5;
    if (v5)
    {
      CFTypeRef cf = 0;
      v7 = (void *)SecTaskCopyValueForEntitlement(v5, @"application-identifier", (CFErrorRef *)&cf);
      if (cf) {
        CFRelease(cf);
      }
      id v8 = v7;
      CFRelease(v6);
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)obtainBundleIdentifierFromConnection:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3
    && ([v3 _xpcConnection],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        dispatch_queue_t v6 = (void *)xpc_connection_copy_bundle_id(),
        v5,
        v6))
  {
    v7 = [NSString stringWithUTF8String:v6];
    free(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)allowsConnection:(id)a3
{
  id v4 = a3;
  if (!_os_feature_enabled_impl() || !_os_feature_enabled_impl()) {
    goto LABEL_6;
  }
  objc_super v5 = [(EMFEmojiPreferencesService *)self obtainApplicationIdentifierFromConnection:v4];
  dispatch_queue_t v6 = [(EMFEmojiPreferencesService *)self obtainBundleIdentifierFromConnection:v4];
  if (([v5 hasPrefix:@"com.apple."] & 1) != 0
    || ([v6 hasPrefix:@"com.apple."] & 1) != 0)
  {

LABEL_6:
    BOOL v7 = 1;
    goto LABEL_7;
  }
  v9 = emf_logging_get_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    [(EMFEmojiPreferencesService *)(uint64_t)v5 allowsConnection:v9];
  }

  BOOL v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(EMFEmojiPreferencesService *)self allowsConnection:v5];
  if (v6)
  {
    [(EMFEmojiPreferencesService *)self _createPreferencesIfNecessary];
    BOOL v7 = [(EMFEmojiPreferencesService *)self preferences];
    [v5 setExportedObject:v7];

    id v8 = +[EMFEmojiPreferencesClient serviceInterface];
    [v5 setExportedInterface:v8];

    v9 = [(EMFEmojiPreferencesService *)self dispatchQueue];
    [v5 _setQueue:v9];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__EMFEmojiPreferencesService_listener_shouldAcceptNewConnection___block_invoke;
    v12[3] = &unk_1E61A9BD0;
    v12[4] = self;
    [v5 setInterruptionHandler:v12];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__EMFEmojiPreferencesService_listener_shouldAcceptNewConnection___block_invoke_2;
    v11[3] = &unk_1E61A9BD0;
    v11[4] = self;
    [v5 setInvalidationHandler:v11];
    [v5 resume];
  }

  return v6;
}

uint64_t __65__EMFEmojiPreferencesService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) writeEmojiDefaults];
}

uint64_t __65__EMFEmojiPreferencesService_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) writeEmojiDefaults];
}

- (void)setPreferences:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)allowsConnection:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B8C45000, log, OS_LOG_TYPE_ERROR, "EMFEmojiPreferencesService rejected client connection (appId: %@ bundleId: %@)", (uint8_t *)&v3, 0x16u);
}

@end