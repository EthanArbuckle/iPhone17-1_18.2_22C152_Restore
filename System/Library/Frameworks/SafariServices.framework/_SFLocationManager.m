@interface _SFLocationManager
+ (id)sharedLocationManager;
+ (void)setDefaultEffectiveBundleIdentifier:(id)a3;
- (_SFLocationManager)init;
- (void)_handleApplicationStateChange:(id)a3;
- (void)_setApplication:(id)a3 isForeground:(BOOL)a4;
- (void)_updateApplicationsToMonitor;
- (void)_updateAssertion;
- (void)addClientForApplication:(id)a3;
- (void)removeClientForApplication:(id)a3;
@end

@implementation _SFLocationManager

+ (id)sharedLocationManager
{
  if (sharedLocationManager_onceToken != -1) {
    dispatch_once(&sharedLocationManager_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)sharedLocationManager_shared;

  return v2;
}

+ (void)setDefaultEffectiveBundleIdentifier:(id)a3
{
}

- (_SFLocationManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)_SFLocationManager;
  v2 = [(_SFLocationManager *)&v14 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    clients = v2->_clients;
    v2->_clients = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F4E278]) initWithBundleIDs:0 states:0];
    stateMonitor = v2->_stateMonitor;
    v2->_stateMonitor = (BKSApplicationStateMonitor *)v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    foregroundApplications = v2->_foregroundApplications;
    v2->_foregroundApplications = v7;

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __26___SFLocationManager_init__block_invoke;
    v11[3] = &unk_1E5C73AE8;
    objc_copyWeak(&v12, &location);
    [(BKSApplicationStateMonitor *)v2->_stateMonitor setHandler:v11];
    v9 = v2;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)_updateAssertion
{
  int v3 = [(NSMutableSet *)self->_foregroundApplications intersectsSet:self->_clients];
  assertion = self->_assertion;
  if (v3)
  {
    if (assertion) {
      return;
    }
    uint64_t v5 = (CLInUseAssertion *)[MEMORY[0x1E4F1E5E8] newAssertionForBundleIdentifier:@"com.apple.mobilesafari" withReason:@"SFSafariViewController is being used by a foreground app." level:1];
  }
  else
  {
    if (!assertion) {
      return;
    }
    [(CLInUseAssertion *)assertion invalidate];
    uint64_t v5 = 0;
  }
  v6 = self->_assertion;
  self->_assertion = v5;
}

- (void)_handleApplicationStateChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4E230]];
    v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4E248]];
    int v8 = [v7 unsignedIntegerValue];

    uint64_t v9 = 0;
    switch(v8)
    {
      case 0:
      case 2:
      case 4:
        goto LABEL_12;
      case 1:
        if (-[NSCountedSet containsObject:](self->_clients, "containsObject:", v6, 0))
        {
          do
            [(NSCountedSet *)self->_clients removeObject:v6];
          while (([(NSCountedSet *)self->_clients containsObject:v6] & 1) != 0);
        }
        goto LABEL_11;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_9;
      case 8:
        goto LABEL_8;
      default:
        if (v8 == 16) {
          goto LABEL_12;
        }
        if (v8 == 32)
        {
LABEL_8:
          uint64_t v9 = 1;
        }
        else
        {
LABEL_9:
          v10 = WBS_LOG_CHANNEL_PREFIXViewService();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            -[_SFLocationManager _handleApplicationStateChange:](v8, v10);
          }
LABEL_11:
          uint64_t v9 = 0;
        }
LABEL_12:
        [(_SFLocationManager *)self _setApplication:v6 isForeground:v9];

        break;
    }
  }
}

- (void)_setApplication:(id)a3 isForeground:(BOOL)a4
{
  int v4 = a4;
  id v7 = a3;
  if (-[NSMutableSet containsObject:](self->_foregroundApplications, "containsObject:") != v4
    && [(NSCountedSet *)self->_clients containsObject:v7])
  {
    foregroundApplications = self->_foregroundApplications;
    if (v4) {
      [(NSMutableSet *)foregroundApplications addObject:v7];
    }
    else {
      [(NSMutableSet *)foregroundApplications removeObject:v7];
    }
    [(_SFLocationManager *)self _updateAssertion];
  }
}

- (void)_updateApplicationsToMonitor
{
  if ([(NSCountedSet *)self->_clients count]) {
    uint64_t v3 = *MEMORY[0x1E4F4E220];
  }
  else {
    uint64_t v3 = 0;
  }
  stateMonitor = self->_stateMonitor;
  id v5 = [(NSCountedSet *)self->_clients allObjects];
  [(BKSApplicationStateMonitor *)stateMonitor updateInterestedBundleIDs:v5 states:v3];
}

- (void)addClientForApplication:(id)a3
{
  id v7 = a3;
  char v4 = [(NSCountedSet *)self->_clients containsObject:v7];
  [(NSCountedSet *)self->_clients addObject:v7];
  if ((v4 & 1) == 0) {
    [(_SFLocationManager *)self _updateApplicationsToMonitor];
  }
  stateMonitor = self->_stateMonitor;
  v6 = [(BKSApplicationStateMonitor *)stateMonitor handler];
  [(BKSApplicationStateMonitor *)stateMonitor applicationInfoForApplication:v7 completion:v6];
}

- (void)removeClientForApplication:(id)a3
{
  id v6 = a3;
  int v4 = [(NSCountedSet *)self->_clients containsObject:v6];
  id v5 = v6;
  if (v4)
  {
    [(NSCountedSet *)self->_clients removeObject:v6];
    if (([(NSCountedSet *)self->_clients containsObject:v6] & 1) == 0)
    {
      [(NSMutableSet *)self->_foregroundApplications removeObject:v6];
      [(_SFLocationManager *)self _updateApplicationsToMonitor];
    }
    [(_SFLocationManager *)self _updateAssertion];
    id v5 = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMonitor, 0);
  objc_storeStrong((id *)&self->_foregroundApplications, 0);
  objc_storeStrong((id *)&self->_clients, 0);

  objc_storeStrong((id *)&self->_assertion, 0);
}

- (void)_handleApplicationStateChange:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A690B000, a2, OS_LOG_TYPE_ERROR, "Unknown BKSApplicationState value %u", (uint8_t *)v2, 8u);
}

@end