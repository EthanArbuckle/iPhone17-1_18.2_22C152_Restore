@interface CMPhotoProcessMonitor
+ (BOOL)isCameraCaptured;
+ (BOOL)isDeferredMediad;
+ (BOOL)isForegroundApp;
+ (BOOL)isManagedByRunningBoard;
+ (id)getShared;
- (BOOL)gotRBSConnectionError;
- (CMPhotoProcessMonitor)init;
- (NSMutableDictionary)backgroundNotificationBlocks;
- (NSMutableDictionary)heldAssertions;
- (OS_dispatch_queue)processMonitorSyncQueue;
- (OS_os_transaction)latestTransaction;
- (RBSAssertion)latestAssertion;
- (RBSDomainAttribute)domainAttribute;
- (RBSProcessMonitor)processMonitor;
- (int)registerBackgroundNotificationHandlerForContext:(void *)a3 handler:(id)a4;
- (int)releaseAssertionForContext:(void *)a3;
- (int)takeAssertionUntilTime:(unint64_t)a3 forContext:(void *)a4;
- (int)unregisterBackgroundNotificationForContext:(void *)a3;
- (unint64_t)assertionHeldToTime;
- (void)_createRBSMonitorIfNeeded;
- (void)_handleBackgroundingNotification;
- (void)_takeOSTransactionForContext:(void *)a3;
- (void)_takeRBSAssertionForContext:(void *)a3 until:(unint64_t)a4 maxLength:(unint64_t)a5;
- (void)dealloc;
- (void)setAssertionHeldToTime:(unint64_t)a3;
- (void)setBackgroundNotificationBlocks:(id)a3;
- (void)setDomainAttribute:(id)a3;
- (void)setGotRBSConnectionError:(BOOL)a3;
- (void)setHeldAssertions:(id)a3;
- (void)setLatestAssertion:(id)a3;
- (void)setLatestTransaction:(id)a3;
- (void)setProcessMonitor:(id)a3;
- (void)setProcessMonitorSyncQueue:(id)a3;
- (void)waitForPendingNotifications;
@end

@implementation CMPhotoProcessMonitor

uint64_t __50__CMPhotoProcessMonitor__createRBSMonitorIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) processMonitor];
  if (!result)
  {
    uint64_t result = +[CMPhotoProcessMonitor isManagedByRunningBoard];
    if (result)
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __50__CMPhotoProcessMonitor__createRBSMonitorIfNeeded__block_invoke_2;
      v3[3] = &unk_1E5E2EBA8;
      v3[4] = *(void *)(a1 + 32);
      return objc_msgSend(*(id *)(a1 + 32), "setProcessMonitor:", objc_msgSend(MEMORY[0x1E4F96418], "monitorWithConfiguration:", v3));
    }
  }
  return result;
}

- (RBSProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (void)setProcessMonitor:(id)a3
{
}

- (int)registerBackgroundNotificationHandlerForContext:(void *)a3 handler:(id)a4
{
  [(CMPhotoProcessMonitor *)self _createRBSMonitorIfNeeded];
  v7 = (void *)[a4 copy];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = [(CMPhotoProcessMonitor *)self backgroundNotificationBlocks];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v7, [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:a3]);
  os_unfair_lock_unlock(p_lock);

  return 0;
}

- (void)_createRBSMonitorIfNeeded
{
  v3 = [(CMPhotoProcessMonitor *)self processMonitorSyncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CMPhotoProcessMonitor__createRBSMonitorIfNeeded__block_invoke;
  block[3] = &unk_1E5E2EBD0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)v3, block);
}

- (OS_dispatch_queue)processMonitorSyncQueue
{
  return self->_processMonitorSyncQueue;
}

- (NSMutableDictionary)backgroundNotificationBlocks
{
  return self->_backgroundNotificationBlocks;
}

- (int)takeAssertionUntilTime:(unint64_t)a3 forContext:(void *)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dispatch_time_t v8 = dispatch_time(0, 30000000000);
  if (v8 <= a3)
  {
    int v10 = FigSignalErrorAt();
  }
  else
  {
    [(CMPhotoProcessMonitor *)self _takeRBSAssertionForContext:a4 until:a3 maxLength:v8];
    [(CMPhotoProcessMonitor *)self _takeOSTransactionForContext:a4];
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:a4];
    -[NSMutableDictionary setObject:forKeyedSubscript:](-[CMPhotoProcessMonitor heldAssertions](self, "heldAssertions"), "setObject:forKeyedSubscript:", [MEMORY[0x1E4F28ED0] numberWithLongLong:a3], v9);
    int v10 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (NSMutableDictionary)heldAssertions
{
  return self->_heldAssertions;
}

- (void)_takeOSTransactionForContext:(void *)a3
{
  if ([(CMPhotoProcessMonitor *)self latestTransaction])
  {
    v4 = [(CMPhotoProcessMonitor *)self latestTransaction];
    MEMORY[0x1F40CD5B0](v4);
  }
  else
  {
    uint64_t v5 = os_transaction_create();
    if (v5)
    {
      id v6 = (id)v5;
      [(CMPhotoProcessMonitor *)self setLatestTransaction:v5];
    }
    else
    {
      FigSignalErrorAt();
    }
  }
}

- (OS_os_transaction)latestTransaction
{
  return self->_latestTransaction;
}

- (void)_takeRBSAssertionForContext:(void *)a3 until:(unint64_t)a4 maxLength:(unint64_t)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (+[CMPhotoProcessMonitor isManagedByRunningBoard]&& ![(CMPhotoProcessMonitor *)self gotRBSConnectionError]&& (![(CMPhotoProcessMonitor *)self latestAssertion]|| [(CMPhotoProcessMonitor *)self assertionHeldToTime] <= a4))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F96318]);
    uint64_t v9 = [MEMORY[0x1E4F96478] targetWithPid:getpid()];
    v14[0] = [(CMPhotoProcessMonitor *)self domainAttribute];
    id v10 = (id)objc_msgSend(v8, "initWithExplanation:target:attributes:", @"CMPhoto pool cleanup timer", v9, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 1));
    if (!v10)
    {
      FigSignalErrorAt();
      return;
    }
    id v11 = v10;
    id v13 = 0;
    if ([v10 acquireWithError:&v13]) {
      goto LABEL_11;
    }
    uint64_t v12 = [v13 domain];
    if ((v12 != *MEMORY[0x1E4F964B0] || [v13 code] != 2) && objc_msgSend(v13, "code") == 4099)
    {
      [(CMPhotoProcessMonitor *)self setGotRBSConnectionError:1];
LABEL_11:
      [(RBSAssertion *)[(CMPhotoProcessMonitor *)self latestAssertion] invalidate];
      [(CMPhotoProcessMonitor *)self setAssertionHeldToTime:a5];
      [(CMPhotoProcessMonitor *)self setLatestAssertion:v11];
    }
  }
}

- (RBSAssertion)latestAssertion
{
  return self->_latestAssertion;
}

+ (BOOL)isManagedByRunningBoard
{
  if (isManagedByRunningBoard_onceToken != -1) {
    dispatch_once(&isManagedByRunningBoard_onceToken, &__block_literal_global_11);
  }
  return isManagedByRunningBoard_sIsManagedByRunningBoard;
}

- (BOOL)gotRBSConnectionError
{
  return self->_gotRBSConnectionError;
}

- (unint64_t)assertionHeldToTime
{
  return self->_assertionHeldToTime;
}

- (void)setLatestTransaction:(id)a3
{
}

- (void)setLatestAssertion:(id)a3
{
}

- (void)setAssertionHeldToTime:(unint64_t)a3
{
  self->_assertionHeldToTime = a3;
}

- (RBSDomainAttribute)domainAttribute
{
  return self->_domainAttribute;
}

+ (BOOL)isForegroundApp
{
  if (isForegroundApp_onceToken != -1) {
    dispatch_once(&isForegroundApp_onceToken, &__block_literal_global_2);
  }
  return isForegroundApp_sIsForeground;
}

+ (id)getShared
{
  if (getShared_onceToken != -1) {
    dispatch_once(&getShared_onceToken, &__block_literal_global_8);
  }
  return (id)getShared_sSharedMonitor;
}

+ (BOOL)isDeferredMediad
{
  return _currentProcessIsOfIdentifier(@"com.apple.deferredmediad");
}

+ (BOOL)isCameraCaptured
{
  return _currentProcessIsOfIdentifier(@"com.apple.cameracaptured");
}

uint64_t __50__CMPhotoProcessMonitor__createRBSMonitorIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)[MEMORY[0x1E4F96448] descriptor];
  [v4 setValues:1];
  [v4 setEndowmentNamespaces:&unk_1F02E51C8];
  [a2 setStateDescriptor:v4];
  v7[0] = objc_msgSend(MEMORY[0x1E4F96430], "predicateMatchingIdentifier:", objc_msgSend(MEMORY[0x1E4F963F8], "identifierForCurrentProcess"));
  objc_msgSend(a2, "setPredicates:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v7, 1));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__CMPhotoProcessMonitor__createRBSMonitorIfNeeded__block_invoke_3;
  v6[3] = &unk_1E5E2EB80;
  v6[4] = *(void *)(a1 + 32);
  return [a2 setUpdateHandler:v6];
}

CMPhotoProcessMonitor *__34__CMPhotoProcessMonitor_getShared__block_invoke()
{
  uint64_t result = (CMPhotoProcessMonitor *)FigServer_IsServerProcess();
  if (!result)
  {
    uint64_t result = objc_alloc_init(CMPhotoProcessMonitor);
    getShared_sSharedMonitor = (uint64_t)result;
  }
  return result;
}

- (CMPhotoProcessMonitor)init
{
  v15.receiver = self;
  v15.super_class = (Class)CMPhotoProcessMonitor;
  v2 = [(CMPhotoProcessMonitor *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"FinishTaskCanSleep"];
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.coremedia.CMPhotoProcessMonitor.notifications", 0);
    id v8 = (CMPhotoProcessMonitor *)v7;
    if (v4) {
      BOOL v9 = v5 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9 || v6 == 0 || v7 == 0)
    {
      int v14 = FigSignalErrorAt();

      uint64_t v12 = 0;
      id v8 = v3;
      if (!v14) {
        return v3;
      }
    }
    else
    {
      [(CMPhotoProcessMonitor *)v3 setDomainAttribute:v4];
      [(CMPhotoProcessMonitor *)v3 setHeldAssertions:v5];
      [(CMPhotoProcessMonitor *)v3 setBackgroundNotificationBlocks:v6];
      [(CMPhotoProcessMonitor *)v3 setProcessMonitorSyncQueue:v8];
      uint64_t v12 = v3;
    }

    return v12;
  }
  return v3;
}

- (void)setProcessMonitorSyncQueue:(id)a3
{
}

- (void)setHeldAssertions:(id)a3
{
}

- (void)setDomainAttribute:(id)a3
{
}

- (void)setBackgroundNotificationBlocks:(id)a3
{
}

uint64_t __40__CMPhotoProcessMonitor_isForegroundApp__block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F963E8], "currentProcess"), "isApplication");
  isForegroundApp_sIsForeground = result;
  return result;
}

uint64_t __48__CMPhotoProcessMonitor_isManagedByRunningBoard__block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F963E8], "currentProcess"), "isManaged");
  isManagedByRunningBoard_sIsManagedByRunningBoard = result;
  return result;
}

- (void)dealloc
{
  if ([(CMPhotoProcessMonitor *)self processMonitorSyncQueue]) {
    dispatch_barrier_sync((dispatch_queue_t)[(CMPhotoProcessMonitor *)self processMonitorSyncQueue], &__block_literal_global_20);
  }
  [(CMPhotoProcessMonitor *)self setProcessMonitorSyncQueue:0];
  [(CMPhotoProcessMonitor *)self setBackgroundNotificationBlocks:0];
  [(RBSProcessMonitor *)[(CMPhotoProcessMonitor *)self processMonitor] invalidate];
  [(CMPhotoProcessMonitor *)self setProcessMonitor:0];
  [(RBSAssertion *)[(CMPhotoProcessMonitor *)self latestAssertion] invalidate];
  [(CMPhotoProcessMonitor *)self setLatestAssertion:0];
  [(CMPhotoProcessMonitor *)self setLatestTransaction:0];
  [(CMPhotoProcessMonitor *)self setDomainAttribute:0];
  [(CMPhotoProcessMonitor *)self setHeldAssertions:0];
  v3.receiver = self;
  v3.super_class = (Class)CMPhotoProcessMonitor;
  [(CMPhotoProcessMonitor *)&v3 dealloc];
}

- (void)waitForPendingNotifications
{
  v2 = [(CMPhotoProcessMonitor *)self processMonitorSyncQueue];
  dispatch_barrier_sync((dispatch_queue_t)v2, &__block_literal_global_24);
}

uint64_t __50__CMPhotoProcessMonitor__createRBSMonitorIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "previousState"), "endowmentNamespaces"), "containsObject:", @"com.apple.frontboard.visibility");
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "state"), "endowmentNamespaces"), "containsObject:", @"com.apple.frontboard.visibility");
  if (v6 && (result & 1) == 0)
  {
    id v8 = *(void **)(a1 + 32);
    return [v8 _handleBackgroundingNotification];
  }
  return result;
}

- (void)_handleBackgroundingNotification
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(CMPhotoProcessMonitor *)self processMonitorSyncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CMPhotoProcessMonitor__handleBackgroundingNotification__block_invoke;
  block[3] = &unk_1E5E2EBD0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)v4, block);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(CMPhotoProcessMonitor *)self backgroundNotificationBlocks];
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        dispatch_async((dispatch_queue_t)[(CMPhotoProcessMonitor *)self processMonitorSyncQueue], (dispatch_block_t)[(NSMutableDictionary *)[(CMPhotoProcessMonitor *)self backgroundNotificationBlocks] objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * v9++)]);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
  os_unfair_lock_unlock(p_lock);
}

void __57__CMPhotoProcessMonitor__handleBackgroundingNotification__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "processMonitor"), "invalidate");
  [*(id *)(a1 + 32) setProcessMonitor:0];
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_unlock(v2);
}

- (int)releaseAssertionForContext:(void *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [(CMPhotoProcessMonitor *)self heldAssertions];
  -[NSMutableDictionary removeObjectForKey:](v6, "removeObjectForKey:", [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:a3]);
  if ([(NSMutableDictionary *)[(CMPhotoProcessMonitor *)self heldAssertions] count])
  {
    dispatch_time_t v7 = dispatch_time(0, 0);
    uint64_t v8 = (void *)[(NSMutableDictionary *)[(CMPhotoProcessMonitor *)self heldAssertions] allKeys];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__CMPhotoProcessMonitor_releaseAssertionForContext___block_invoke;
    v10[3] = &unk_1E5E2EBF8;
    v10[4] = self;
    v10[5] = v7;
    -[NSMutableDictionary removeObjectsForKeys:](-[CMPhotoProcessMonitor heldAssertions](self, "heldAssertions"), "removeObjectsForKeys:", objc_msgSend(v8, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", v10)));
  }
  if (![(NSMutableDictionary *)[(CMPhotoProcessMonitor *)self heldAssertions] count])
  {
    [(RBSAssertion *)[(CMPhotoProcessMonitor *)self latestAssertion] invalidate];
    [(CMPhotoProcessMonitor *)self setLatestAssertion:0];
    [(CMPhotoProcessMonitor *)self setLatestTransaction:0];
  }
  os_unfair_lock_unlock(p_lock);
  return 0;
}

BOOL __52__CMPhotoProcessMonitor_releaseAssertionForContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return (unint64_t)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "heldAssertions"), "objectForKeyedSubscript:", a2), "longLongValue") <= *(void *)(a1 + 40);
}

- (int)unregisterBackgroundNotificationForContext:(void *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [(CMPhotoProcessMonitor *)self backgroundNotificationBlocks];
  -[NSMutableDictionary removeObjectForKey:](v6, "removeObjectForKey:", [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:a3]);
  os_unfair_lock_unlock(p_lock);
  return 0;
}

- (void)setGotRBSConnectionError:(BOOL)a3
{
  self->_gotRBSConnectionError = a3;
}

@end