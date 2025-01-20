@interface IDSQuickSwitchAcknowledgementTracker
- (BOOL)isAwaitingAcknowledgement;
- (IDSQuickSwitchAcknowledgementTracker)init;
- (id)awaitAcknowledgementFromServiceDelegate:(id)a3;
- (id)identifierForServiceDelegate:(id)a3;
- (void)_accessDelegateIdentifiersInCriticalSectionWithBlock:(id)a3;
- (void)dealloc;
- (void)stopAwaitingAcknowledgementFromAllServiceDelegates;
- (void)stopAwaitingAcknowledgementFromServiceDelegateWithIdentifier:(id)a3;
@end

@implementation IDSQuickSwitchAcknowledgementTracker

- (IDSQuickSwitchAcknowledgementTracker)init
{
  if (_IDSRunningInDaemon())
  {
    v3 = [MEMORY[0x1E4F6C3B8] watchPairing];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_191A2A590((uint64_t)self, v3);
    }

    v4 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)IDSQuickSwitchAcknowledgementTracker;
    v5 = [(IDSQuickSwitchAcknowledgementTracker *)&v9 init];
    if (v5)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      delegateIdentifiers = v5->_delegateIdentifiers;
      v5->_delegateIdentifiers = v6;

      pthread_mutex_init(&v5->_delegateIdentifiersMutex, 0);
    }
    self = v5;
    v4 = self;
  }

  return v4;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_delegateIdentifiersMutex);
  v3.receiver = self;
  v3.super_class = (Class)IDSQuickSwitchAcknowledgementTracker;
  [(IDSQuickSwitchAcknowledgementTracker *)&v3 dealloc];
}

- (BOOL)isAwaitingAcknowledgement
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = -86;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_191982678;
  v4[3] = &unk_1E572B5D0;
  v4[4] = &v5;
  [(IDSQuickSwitchAcknowledgementTracker *)self _accessDelegateIdentifiersInCriticalSectionWithBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)awaitAcknowledgementFromServiceDelegate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F6C3B8] watchPairing];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2080;
    v15 = "-[IDSQuickSwitchAcknowledgementTracker awaitAcknowledgementFromServiceDelegate:]";
    __int16 v16 = 2112;
    id v17 = v4;
    id v6 = v13;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s  (serviceDelegate: %@)", buf, 0x20u);
  }
  if (v4)
  {
    uint64_t v7 = [(IDSQuickSwitchAcknowledgementTracker *)self identifierForServiceDelegate:v4];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_19198283C;
    v10[3] = &unk_1E572B5F8;
    id v8 = v7;
    id v11 = v8;
    [(IDSQuickSwitchAcknowledgementTracker *)self _accessDelegateIdentifiersInCriticalSectionWithBlock:v10];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)identifierForServiceDelegate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F6C3B8] watchPairing];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2080;
    id v13 = "-[IDSQuickSwitchAcknowledgementTracker identifierForServiceDelegate:]";
    __int16 v14 = 2112;
    id v15 = v3;
    id v5 = v11;
    _os_log_impl(&dword_19190B000, v4, OS_LOG_TYPE_DEFAULT, "%@ %s  (serviceDelegate: %@)", buf, 0x20u);
  }
  if (v3)
  {
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = [NSString stringWithFormat:@"%@ (%p)", v7, v3];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)stopAwaitingAcknowledgementFromServiceDelegateWithIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6C3B8] watchPairing];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2080;
    __int16 v12 = "-[IDSQuickSwitchAcknowledgementTracker stopAwaitingAcknowledgementFromServiceDelegateWithIdentifier:]";
    __int16 v13 = 2112;
    id v14 = v4;
    id v6 = v10;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s  (delegateIdentifier: %@)", buf, 0x20u);
  }
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_191982C08;
    v7[3] = &unk_1E572B5F8;
    id v8 = v4;
    [(IDSQuickSwitchAcknowledgementTracker *)self _accessDelegateIdentifiersInCriticalSectionWithBlock:v7];
  }
}

- (void)stopAwaitingAcknowledgementFromAllServiceDelegates
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F6C3B8] watchPairing];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412546;
    id v6 = (id)objc_opt_class();
    __int16 v7 = 2080;
    id v8 = "-[IDSQuickSwitchAcknowledgementTracker stopAwaitingAcknowledgementFromAllServiceDelegates]";
    id v4 = v6;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v5, 0x16u);
  }
  [(IDSQuickSwitchAcknowledgementTracker *)self _accessDelegateIdentifiersInCriticalSectionWithBlock:&unk_1EE246568];
}

- (void)_accessDelegateIdentifiersInCriticalSectionWithBlock:(id)a3
{
  p_delegateIdentifiersMutex = &self->_delegateIdentifiersMutex;
  int v5 = (void (**)(id, NSMutableSet *))a3;
  pthread_mutex_lock(p_delegateIdentifiersMutex);
  v5[2](v5, self->_delegateIdentifiers);

  pthread_mutex_unlock(p_delegateIdentifiersMutex);
}

- (void).cxx_destruct
{
}

@end