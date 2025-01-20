@interface _CNDonationAgentLogger
- (OS_os_log)log_t;
- (_CNDonationAgentLogger)init;
- (void)acceptingConnectionFromProcess:(int)a3;
- (void)acceptingDonations:(id)a3;
- (void)agentDidHandleRequest:(SEL)a3;
- (void)agentDidStart;
- (void)agentWillHandleRequest:(SEL)a3;
- (void)agentWillStart;
- (void)agentWillStop;
- (void)beginRestorePersistedState;
- (void)contactsChangedNotificationEmailAddressesChanged:(BOOL)a3;
- (void)contactsChangedNotificationFoundName:(BOOL)a3 nameChanged:(BOOL)a4;
- (void)couldNotRejectClusterIdentifier:(id)a3 error:(id)a4;
- (void)couldNotRejectDonationIdentifier:(id)a3 error:(id)a4;
- (void)couldNotRejectUnknownClusterIdentifier:(id)a3;
- (void)couldNotRejectUnknownDonationIdentifier:(id)a3;
- (void)couldNotRenewBecauseDonorError:(id)a3;
- (void)couldNotRenewBecauseLoadingError:(id)a3;
- (void)couldNotRenewBecauseNotADonorExtension:(id)a3;
- (void)denyingRequestFromProcess:(int)a3;
- (void)didDiscoverExtension:(id)a3;
- (void)didDiscoverExtensions;
- (void)didDiscoverUnexpectedExtensionType:(id)a3;
- (void)didFailToDiscoverExtensions:(id)a3;
- (void)didListRejections;
- (void)didRejectClusterIdentifier:(id)a3;
- (void)didRejectDonationIdentifier:(id)a3;
- (void)didRemoveAllRejections;
- (void)didRenewValue:(id)a3 untilDate:(id)a4;
- (void)donationServiceDidStart;
- (void)donationServiceWillStart;
- (void)donationServiceWillStop;
- (void)endRestorePersistedState;
- (void)featureDidDisable;
- (void)featureDidEnable;
- (void)featureNotEnabled:(SEL)a3;
- (void)featureWillDisable;
- (void)featureWillEnable;
- (void)foundUnhashableValue:(id)a3;
- (void)maintenanceServiceDidStart;
- (void)maintenanceServiceWillStart;
- (void)maintenanceServiceWillStop;
- (void)preExpiredDonations:(id)a3;
- (void)willDiscoverExtensions;
- (void)willListRejections;
- (void)willLoadExtensionVersions;
- (void)willRejectClusterIdentifier:(id)a3;
- (void)willRejectDonationIdentifier:(id)a3;
- (void)willRemoveAllRejections;
- (void)willRenewValues:(id)a3 withDonor:(id)a4;
- (void)willSaveExtensionVersions;
@end

@implementation _CNDonationAgentLogger

- (_CNDonationAgentLogger)init
{
  v7.receiver = self;
  v7.super_class = (Class)_CNDonationAgentLogger;
  v2 = [(_CNDonationAgentLogger *)&v7 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.contacts.donation", "agent");
    log_t = v2->_log_t;
    v2->_log_t = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)agentWillStart
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "will start agent", v3, 2u);
  }
}

- (void)agentDidStart
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "did start agent", v3, 2u);
  }
}

- (void)agentWillStop
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "will stop agent", v3, 2u);
  }
}

- (void)donationServiceWillStart
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "will start donation service", v3, 2u);
  }
}

- (void)donationServiceDidStart
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "did start donation service", v3, 2u);
  }
}

- (void)donationServiceWillStop
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "will stop donation service", v3, 2u);
  }
}

- (void)maintenanceServiceWillStart
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "will start maintenance service", v3, 2u);
  }
}

- (void)maintenanceServiceDidStart
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "did start maintenance service", v3, 2u);
  }
}

- (void)maintenanceServiceWillStop
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "maintenance service stopping", v3, 2u);
  }
}

- (void)beginRestorePersistedState
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "will restore persisted state", v3, 2u);
  }
}

- (void)endRestorePersistedState
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "did restore persisted state", v3, 2u);
  }
}

- (void)acceptingConnectionFromProcess:(int)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v4 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a3;
    _os_log_impl(&dword_214267000, v4, OS_LOG_TYPE_DEFAULT, "Accepting connection from process %d", (uint8_t *)v5, 8u);
  }
}

- (void)denyingRequestFromProcess:(int)a3
{
  v4 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[_CNDonationAgentLogger denyingRequestFromProcess:](a3, v4);
  }
}

- (void)acceptingDonations:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v14;
    *(void *)&long long v6 = 138543362;
    long long v12 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        v11 = [(_CNDonationAgentLogger *)self log_t];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v12;
          uint64_t v18 = v10;
          _os_log_impl(&dword_214267000, v11, OS_LOG_TYPE_DEFAULT, "Accepting donation: %{public}@", buf, 0xCu);
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)preExpiredDonations:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v14;
    *(void *)&long long v6 = 138412290;
    long long v12 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        v11 = [(_CNDonationAgentLogger *)self log_t];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v12;
          uint64_t v18 = v10;
          _os_log_error_impl(&dword_214267000, v11, OS_LOG_TYPE_ERROR, "Donation (%@) already expired. Asking the extension to renew. In the future, this value will not be persisted and you will not be asked to renew it.", buf, 0xCu);
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)agentWillHandleRequest:(SEL)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(a3);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_214267000, v4, OS_LOG_TYPE_DEFAULT, "Will handle request: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)agentDidHandleRequest:(SEL)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(a3);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_214267000, v4, OS_LOG_TYPE_DEFAULT, "Did handle request: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)featureNotEnabled:(SEL)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(a3);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_214267000, v4, OS_LOG_TYPE_DEFAULT, "Could not handle request because feature not enabled: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)featureWillDisable
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "Will disable feature", v3, 2u);
  }
}

- (void)featureDidDisable
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "Did disable feature", v3, 2u);
  }
}

- (void)featureWillEnable
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "Will enable feature", v3, 2u);
  }
}

- (void)featureDidEnable
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "Did enable feature", v3, 2u);
  }
}

- (void)contactsChangedNotificationFoundName:(BOOL)a3 nameChanged:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v6 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109376;
    v7[1] = v5;
    __int16 v8 = 1024;
    BOOL v9 = v4;
    _os_log_impl(&dword_214267000, v6, OS_LOG_TYPE_INFO, "Notified of contacts change. Found name: %u. Changed name: %u.", (uint8_t *)v7, 0xEu);
  }
}

- (void)contactsChangedNotificationEmailAddressesChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v4 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_214267000, v4, OS_LOG_TYPE_INFO, "Notified of contacts change. Email addresses changed: %u.", (uint8_t *)v5, 8u);
  }
}

- (void)willDiscoverExtensions
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "Will discover extensions", v3, 2u);
  }
}

- (void)didDiscoverExtension:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_214267000, v5, OS_LOG_TYPE_INFO, "Did discover extension: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)didDiscoverUnexpectedExtensionType:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNDonationAgentLogger didDiscoverUnexpectedExtensionType:]();
  }
}

- (void)didDiscoverExtensions
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "Did discover extensions", v3, 2u);
  }
}

- (void)didFailToDiscoverExtensions:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNDonationAgentLogger didFailToDiscoverExtensions:]();
  }
}

- (void)willLoadExtensionVersions
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_INFO, "Will load extension versions", v3, 2u);
  }
}

- (void)willSaveExtensionVersions
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_INFO, "Will save extension versions", v3, 2u);
  }
}

- (void)willRejectDonationIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_214267000, v5, OS_LOG_TYPE_INFO, "Will reject donation with identifier '%{public}@'", (uint8_t *)&v6, 0xCu);
  }
}

- (void)didRejectDonationIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_214267000, v5, OS_LOG_TYPE_INFO, "Did reject donation with identifier '%{public}@'", (uint8_t *)&v6, 0xCu);
  }
}

- (void)couldNotRejectUnknownDonationIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNDonationAgentLogger couldNotRejectUnknownDonationIdentifier:]();
  }
}

- (void)couldNotRejectDonationIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[_CNDonationAgentLogger couldNotRejectDonationIdentifier:error:]();
  }
}

- (void)willRejectClusterIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_214267000, v5, OS_LOG_TYPE_INFO, "Will reject donations with cluster identifier '%@'", (uint8_t *)&v6, 0xCu);
  }
}

- (void)didRejectClusterIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_214267000, v5, OS_LOG_TYPE_INFO, "Will reject donations with cluster identifier '%@'", (uint8_t *)&v6, 0xCu);
  }
}

- (void)couldNotRejectUnknownClusterIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_214267000, v5, OS_LOG_TYPE_INFO, "Could not reject cluster with unknown identifier '%@'", (uint8_t *)&v6, 0xCu);
  }
}

- (void)couldNotRejectClusterIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[_CNDonationAgentLogger couldNotRejectClusterIdentifier:error:]();
  }
}

- (void)willListRejections
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_INFO, "Will list rejections", v3, 2u);
  }
}

- (void)didListRejections
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_INFO, "Did list rejections", v3, 2u);
  }
}

- (void)willRemoveAllRejections
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_INFO, "Will remove all rejections", v3, 2u);
  }
}

- (void)didRemoveAllRejections
{
  v2 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_INFO, "Did remove all rejections", v3, 2u);
  }
}

- (void)foundUnhashableValue:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNDonationAgentLogger foundUnhashableValue:]();
  }
}

- (void)couldNotRenewBecauseDonorError:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNDonationAgentLogger couldNotRenewBecauseDonorError:]();
  }
}

- (void)couldNotRenewBecauseLoadingError:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNDonationAgentLogger couldNotRenewBecauseLoadingError:]();
  }
}

- (void)couldNotRenewBecauseNotADonorExtension:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNDonationAgentLogger couldNotRenewBecauseNotADonorExtension:]();
  }
}

- (void)didRenewValue:(id)a3 untilDate:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_CNDonationAgentLogger *)self log_t];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [v6 origin];
    uint64_t v10 = [v9 donationIdentifier];
    int v11 = 138543618;
    long long v12 = v10;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_214267000, v8, OS_LOG_TYPE_DEFAULT, "Donation %{public}@ has been renewed until %{public}@", (uint8_t *)&v11, 0x16u);
  }
}

- (void)willRenewValues:(id)a3 withDonor:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v19;
    *(void *)&long long v9 = 138543618;
    long long v17 = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v6);
        }
        __int16 v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
        id v14 = [(_CNDonationAgentLogger *)self log_t];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [v13 origin];
          long long v16 = [v15 donationIdentifier];
          *(_DWORD *)buf = v17;
          v23 = v16;
          __int16 v24 = 2114;
          id v25 = v7;
          _os_log_impl(&dword_214267000, v14, OS_LOG_TYPE_DEFAULT, "Will renew donation %{public}@ with donor %{public}@", buf, 0x16u);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v10);
  }
}

- (OS_os_log)log_t
{
  return self->_log_t;
}

- (void).cxx_destruct
{
}

- (void)denyingRequestFromProcess:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_214267000, a2, OS_LOG_TYPE_ERROR, "Denying request lacking authorization from process %d", (uint8_t *)v2, 8u);
}

- (void)didDiscoverUnexpectedExtensionType:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214267000, v0, v1, "Did discover extension: %{public}@", v2, v3, v4, v5, v6);
}

- (void)didFailToDiscoverExtensions:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214267000, v0, v1, "Failed to discover extensions: %{public}@", v2, v3, v4, v5, v6);
}

- (void)couldNotRejectUnknownDonationIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214267000, v0, v1, "Could not reject donation with unknown identifier '%{public}@'", v2, v3, v4, v5, v6);
}

- (void)couldNotRejectDonationIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_214267000, v0, v1, "Could not reject donation identifier '%{public}@': %{public}@");
}

- (void)couldNotRejectClusterIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_214267000, v0, v1, "Could not reject cluster identifier '%{public}@': %{public}@");
}

- (void)foundUnhashableValue:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214267000, v0, v1, "Blacklisting an unhashable value: %{public}@", v2, v3, v4, v5, v6);
}

- (void)couldNotRenewBecauseDonorError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214267000, v0, v1, "Could not renew donation because the donor extension returned an error: %@", v2, v3, v4, v5, v6);
}

- (void)couldNotRenewBecauseLoadingError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214267000, v0, v1, "Could not renew donation because there was an error loading the donor extension: %@", v2, v3, v4, v5, v6);
}

- (void)couldNotRenewBecauseNotADonorExtension:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214267000, v0, v1, "Could not renew donation because this isn’t a donor extension: %@", v2, v3, v4, v5, v6);
}

@end