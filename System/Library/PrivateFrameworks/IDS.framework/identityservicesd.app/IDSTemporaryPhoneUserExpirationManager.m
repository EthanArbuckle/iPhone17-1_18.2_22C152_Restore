@interface IDSTemporaryPhoneUserExpirationManager
- (IDSTemporaryPhoneUserExpirationManager)initWithUserStore:(id)a3 delegate:(id)a4;
- (IDSTemporaryPhoneUserExpirationManagerDelegate)delegate;
- (NSMutableDictionary)usersToTimers;
- (os_unfair_lock_s)usersToTimersLock;
- (void)_attemptToKickoffExpirationTimerForUser:(id)a3;
- (void)_cancelExpirationTimerForUser:(id)a3;
- (void)_expireTimer:(id)a3;
- (void)_kickoffExpirationTimerForInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUsersToTimers:(id)a3;
- (void)setUsersToTimersLock:(os_unfair_lock_s)a3;
- (void)userStore:(id)a3 didAddUser:(id)a4;
- (void)userStore:(id)a3 didRemoveUser:(id)a4 withAuthenticationCertificate:(id)a5;
- (void)userStore:(id)a3 didUpdateUser:(id)a4;
@end

@implementation IDSTemporaryPhoneUserExpirationManager

- (IDSTemporaryPhoneUserExpirationManager)initWithUserStore:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)IDSTemporaryPhoneUserExpirationManager;
  v8 = [(IDSTemporaryPhoneUserExpirationManager *)&v22 init];
  v9 = v8;
  if (v8)
  {
    v8->_usersToTimersLock._os_unfair_lock_opaque = 0;
    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    usersToTimers = v9->_usersToTimers;
    v9->_usersToTimers = v10;

    objc_storeWeak((id *)&v9->_delegate, v7);
    [v6 addActionListener:v9 forRealm:2];
    v12 = [v6 usersWithRealm:2];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = [v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          [(IDSTemporaryPhoneUserExpirationManager *)v9 _attemptToKickoffExpirationTimerForUser:*(void *)(*((void *)&v18 + 1) + 8 * (void)v16)];
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v14);
    }
  }
  return v9;
}

- (void)_attemptToKickoffExpirationTimerForUser:(id)a3
{
  id v9 = a3;
  BOOL v4 = [v9 realm] == (id)2;
  v5 = v9;
  if (v4)
  {
    id v6 = v9;
    id v7 = [v6 expirationDate];

    if (v7)
    {
      v8 = [[IDSTemporaryPhoneUserExpirationTimerInfo alloc] initWithUser:v6];
      [(IDSTemporaryPhoneUserExpirationManager *)self _kickoffExpirationTimerForInfo:v8];
    }
    v5 = v9;
  }
}

- (void)_kickoffExpirationTimerForInfo:(id)a3
{
  id v4 = a3;
  v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 user];
    int v25 = 138412546;
    v26 = v6;
    __int16 v27 = 2048;
    id v28 = [v4 expirationPhase];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting expiration timer for temporary user %@ with phase %ld", (uint8_t *)&v25, 0x16u);
  }
  id v7 = [v4 user];
  os_unfair_lock_lock(&self->_usersToTimersLock);
  v8 = [(IDSTemporaryPhoneUserExpirationManager *)self usersToTimers];
  id v9 = [v7 uniqueIdentifier];
  v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    v11 = [(IDSTemporaryPhoneUserExpirationManager *)self usersToTimers];
    v12 = [v7 uniqueIdentifier];
    id v13 = [v11 objectForKeyedSubscript:v12];
    [v13 invalidate];

    id v14 = [(IDSTemporaryPhoneUserExpirationManager *)self usersToTimers];
    uint64_t v15 = [v7 uniqueIdentifier];
    [v14 setObject:0 forKeyedSubscript:v15];
  }
  id v16 = objc_alloc((Class)IMTimer);
  [v4 expirationInterval];
  double v18 = v17;
  long long v19 = [v7 uniqueIdentifier];
  long long v20 = im_primary_queue();
  id v21 = [v16 initWithTimeInterval:v19 name:1 shouldWake:self target:"_expireTimer:" selector:v4 userInfo:v20 queue:v18];

  objc_super v22 = [(IDSTemporaryPhoneUserExpirationManager *)self usersToTimers];
  v23 = [v7 uniqueIdentifier];
  [v22 setObject:v21 forKeyedSubscript:v23];

  os_unfair_lock_unlock(&self->_usersToTimersLock);
  [v4 expirationInterval];
  if (v24 <= 0.0) {
    [(IDSTemporaryPhoneUserExpirationManager *)self _expireTimer:v21];
  }
}

- (void)_cancelExpirationTimerForUser:(id)a3
{
  id v4 = a3;
  v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing expiration timer for temporary user %@", (uint8_t *)&v12, 0xCu);
  }

  p_usersToTimersLock = &self->_usersToTimersLock;
  os_unfair_lock_lock(&self->_usersToTimersLock);
  id v7 = [(IDSTemporaryPhoneUserExpirationManager *)self usersToTimers];
  v8 = [v4 uniqueIdentifier];
  id v9 = [v7 objectForKeyedSubscript:v8];
  [v9 invalidate];

  v10 = [(IDSTemporaryPhoneUserExpirationManager *)self usersToTimers];
  v11 = [v4 uniqueIdentifier];
  [v10 setObject:0 forKeyedSubscript:v11];

  os_unfair_lock_unlock(p_usersToTimersLock);
}

- (void)_expireTimer:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = [v5 user];
  id v7 = +[IMRGLog registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    double v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Expiration timer fired for temporary user %@", (uint8_t *)&v16, 0xCu);
  }

  os_unfair_lock_lock(&self->_usersToTimersLock);
  v8 = [(IDSTemporaryPhoneUserExpirationManager *)self usersToTimers];
  id v9 = [v6 uniqueIdentifier];
  v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    [v4 invalidate];
    v11 = [(IDSTemporaryPhoneUserExpirationManager *)self usersToTimers];
    int v12 = [v6 uniqueIdentifier];
    [v11 setObject:0 forKeyedSubscript:v12];

    os_unfair_lock_unlock(&self->_usersToTimersLock);
    id v13 = [v5 expirationPhase];
    if (v13 == (id)1)
    {
      uint64_t v15 = [(IDSTemporaryPhoneUserExpirationManager *)self delegate];
      [(IDSTemporaryPhoneUserExpirationTimerInfo *)v15 expirationManager:self didExpireUser:v6];
      goto LABEL_9;
    }
    if (!v13)
    {
      id v14 = [(IDSTemporaryPhoneUserExpirationManager *)self delegate];
      [v14 expirationManager:self nearingExpirationForUser:v6];

      uint64_t v15 = [[IDSTemporaryPhoneUserExpirationTimerInfo alloc] initWithUser:v6 expirationPhase:1];
      [(IDSTemporaryPhoneUserExpirationManager *)self _kickoffExpirationTimerForInfo:v15];
LABEL_9:
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_usersToTimersLock);
  }
}

- (void)userStore:(id)a3 didAddUser:(id)a4
{
}

- (void)userStore:(id)a3 didUpdateUser:(id)a4
{
}

- (void)userStore:(id)a3 didRemoveUser:(id)a4 withAuthenticationCertificate:(id)a5
{
}

- (IDSTemporaryPhoneUserExpirationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSTemporaryPhoneUserExpirationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (os_unfair_lock_s)usersToTimersLock
{
  return self->_usersToTimersLock;
}

- (void)setUsersToTimersLock:(os_unfair_lock_s)a3
{
  self->_usersToTimersLock = a3;
}

- (NSMutableDictionary)usersToTimers
{
  return self->_usersToTimers;
}

- (void)setUsersToTimers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usersToTimers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end