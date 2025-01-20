@interface CSSXPCListenerDelegate
+ (void)assertObjectConformsToExportedProtocols:(id)a3;
- (BOOL)connection:(id)a3 hasBooleanEntitlement:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CSSXPCListenerDelegate)initWithExportedObject:(id)a3;
- (id)denialMessageForConnection:(id)a3;
- (id)exportedInterfaceForConnection:(id)a3;
- (id)exportedObject;
- (id)exportedProtocolForRoles:(id)a3;
- (id)rolesForConnection:(id)a3;
- (void)configureInterface:(id)a3 forRoles:(id)a4;
@end

@implementation CSSXPCListenerDelegate

- (CSSXPCListenerDelegate)initWithExportedObject:(id)a3
{
  id v5 = a3;
  [(id)objc_opt_class() assertObjectConformsToExportedProtocols:v5];
  v9.receiver = self;
  v9.super_class = (Class)CSSXPCListenerDelegate;
  v6 = [(CSSXPCListenerDelegate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_exportedObject, a3);
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [(CSSXPCListenerDelegate *)self exportedInterfaceForConnection:v5];
  if (v6)
  {
    v7 = [(CSSXPCListenerDelegate *)self exportedObject];
    [v5 setExportedObject:v7];

    [v5 setExportedInterface:v6];
    [v5 resume];
  }
  else
  {
    if (qword_100012458 != -1) {
      dispatch_once(&qword_100012458, &stru_10000C6C0);
    }
    v8 = (void *)qword_100012450;
    if (os_log_type_enabled((os_log_t)qword_100012450, OS_LOG_TYPE_ERROR)) {
      sub_100007478(v8, self, (uint64_t)v5);
    }
  }

  return v6 != 0;
}

+ (void)assertObjectConformsToExportedProtocols:(id)a3
{
  id v5 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = CSSAllRoles();
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = [v11 protocol];
        unsigned __int8 v13 = [v5 conformsToProtocol:v12];

        if ((v13 & 1) == 0)
        {
          v14 = +[NSAssertionHandler currentHandler];
          v15 = [v11 protocol];
          v16 = NSStringFromProtocol(v15);
          [v14 handleFailureInMethod:a2, a1, @"CSSXPCListenerDelegate.m", 57, @"%@ does not conform to %@", v5, v16, (void)v17 object file lineNumber description];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (id)denialMessageForConnection:(id)a3
{
  id v3 = a3;
  v4 = CSSAllRoles();
  id v5 = objc_msgSend(v4, "crk_mapUsingBlock:", &stru_10000C638);
  v6 = [v5 allObjects];

  id v7 = [v6 sortedArrayUsingSelector:"compare:"];
  id v8 = [v7 componentsJoinedByString:@" or "];
  id v9 = [v3 processIdentifier];

  v10 = +[NSString stringWithFormat:@"Denying connection from (%d) as it lacks a valid entitlement (%@).", v9, v8];

  return v10;
}

- (id)exportedInterfaceForConnection:(id)a3
{
  v4 = [(CSSXPCListenerDelegate *)self rolesForConnection:a3];
  if ([v4 count])
  {
    id v5 = [(CSSXPCListenerDelegate *)self exportedProtocolForRoles:v4];
    v6 = +[NSXPCInterface interfaceWithProtocol:v5];
    [(CSSXPCListenerDelegate *)self configureInterface:v6 forRoles:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)rolesForConnection:(id)a3
{
  id v4 = a3;
  id v5 = CSSAllRoles();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000054B4;
  v9[3] = &unk_10000C660;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "crk_filterUsingBlock:", v9);

  return v7;
}

- (id)exportedProtocolForRoles:(id)a3
{
  id v3 = objc_msgSend(a3, "crk_mapUsingBlock:", &stru_10000C6A0);
  id v4 = +[CRKProtocolUnioner protocolByUnioningProtocols:v3];

  return v4;
}

- (void)configureInterface:(id)a3 forRoles:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) configureInterfaceForRole:v5];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)connection:(id)a3 hasBooleanEntitlement:(id)a4
{
  id v4 = [a3 valueForEntitlement:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  unsigned __int8 v7 = [v6 BOOLValue];

  return v7;
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (void).cxx_destruct
{
}

@end