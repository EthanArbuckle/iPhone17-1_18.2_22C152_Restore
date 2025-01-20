@interface IDSIPCListener
- (IDSEntitlements)entitlements;
- (IDSIPCListener)initWithRemoteObject:(id)a3 localObject:(id)a4 ID:(id)a5 capabilities:(unsigned int)a6 entitlements:(id)a7 services:(id)a8 notificationServices:(id)a9 commands:(id)a10 bundleID:(id)a11;
- (IDSIPCRemoteObject)remoteObject;
- (IMLocalObject)localObject;
- (NSMutableSet)notificationServices;
- (NSSet)commands;
- (NSSet)services;
- (NSString)ID;
- (NSString)bundleID;
- (int64_t)type;
- (unsigned)capabilities;
- (void)setCapabilities:(unsigned int)a3;
- (void)setCommands:(id)a3;
- (void)setServices:(id)a3;
@end

@implementation IDSIPCListener

- (IMLocalObject)localObject
{
  return self->_localObject;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (IDSEntitlements)entitlements
{
  return self->_entitlements;
}

- (int64_t)type
{
  return (int64_t)[(IDSIPCRemoteObject *)self->_remoteObject ipcType];
}

- (IDSIPCRemoteObject)remoteObject
{
  return self->_remoteObject;
}

- (NSSet)services
{
  return self->_services;
}

- (NSMutableSet)notificationServices
{
  return self->_notificationServices;
}

- (IDSIPCListener)initWithRemoteObject:(id)a3 localObject:(id)a4 ID:(id)a5 capabilities:(unsigned int)a6 entitlements:(id)a7 services:(id)a8 notificationServices:(id)a9 commands:(id)a10 bundleID:(id)a11
{
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v17 = a11;
  v29.receiver = self;
  v29.super_class = (Class)IDSIPCListener;
  v18 = [(IDSIPCListener *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_remoteObject, a3);
    objc_storeStrong((id *)&v19->_localObject, a4);
    objc_storeStrong((id *)&v19->_ID, a5);
    v19->_capabilities = a6;
    objc_storeStrong((id *)&v19->_entitlements, a7);
    objc_storeStrong((id *)&v19->_services, a8);
    objc_storeStrong((id *)&v19->_notificationServices, a9);
    objc_storeStrong((id *)&v19->_commands, a10);
    objc_storeStrong((id *)&v19->_bundleID, a11);
  }

  return v19;
}

- (NSSet)commands
{
  return self->_commands;
}

- (unsigned)capabilities
{
  return self->_capabilities;
}

- (NSString)ID
{
  return self->_ID;
}

- (void)setCapabilities:(unsigned int)a3
{
  self->_capabilities = a3;
}

- (void)setServices:(id)a3
{
}

- (void)setCommands:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_notificationServices, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_ID, 0);
  objc_storeStrong((id *)&self->_localObject, 0);

  objc_storeStrong((id *)&self->_remoteObject, 0);
}

@end