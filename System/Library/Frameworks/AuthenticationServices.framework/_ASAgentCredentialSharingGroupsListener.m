@interface _ASAgentCredentialSharingGroupsListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_ASAgentCredentialSharingGroupsListener)init;
@end

@implementation _ASAgentCredentialSharingGroupsListener

- (_ASAgentCredentialSharingGroupsListener)init
{
  v10.receiver = self;
  v10.super_class = (Class)_ASAgentCredentialSharingGroupsListener;
  v2 = [(_ASAgentCredentialSharingGroupsListener *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(ASCredentialSharingGroupsNotificationManager);
    notificationManager = v2->_notificationManager;
    v2->_notificationManager = v3;

    id v5 = objc_alloc(MEMORY[0x263F08D88]);
    uint64_t v6 = [v5 initWithMachServiceName:*MEMORY[0x263F66400]];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v6;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    v8 = v2;
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  char HasEntitlement = WBSAuditTokenHasEntitlement();
  if (HasEntitlement)
  {
    objc_super v10 = WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface();
    objc_msgSend(v8, "setExportedInterface:", v10, 0, 0, 0, 0);

    [v8 setExportedObject:self->_notificationManager];
    [v8 resume];
  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[_ASAgentCredentialSharingGroupsListener listener:shouldAcceptNewConnection:](v11);
    }
  }

  return HasEntitlement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManager, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21918F000, log, OS_LOG_TYPE_FAULT, "Rejecting connection from unentitled process", v1, 2u);
}

@end