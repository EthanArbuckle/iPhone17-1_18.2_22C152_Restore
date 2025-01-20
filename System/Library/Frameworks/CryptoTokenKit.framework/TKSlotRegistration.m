@interface TKSlotRegistration
+ (BOOL)handleConnection:(id)a3 server:(id)a4;
- (NSString)slotName;
- (NSString)slotType;
- (NSXPCListenerEndpoint)endpoint;
- (OS_os_transaction)transaction;
- (TKSlotRegistration)initWithConnection:(id)a3 server:(id)a4;
- (void)addSlotWithEndpoint:(id)a3 name:(id)a4 type:(id)a5 reply:(id)a6;
- (void)setSlotName:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation TKSlotRegistration

- (TKSlotRegistration)initWithConnection:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TKSlotRegistration;
  v8 = [(TKSlotRegistration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    objc_storeStrong((id *)&v9->_server, a4);
  }

  return v9;
}

+ (BOOL)handleConnection:(id)a3 server:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[TKSlotRegistration alloc] initWithConnection:v6 server:v5];

  v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TKProtocolSlotRegistry];
  [v6 setExportedInterface:v8];

  [v6 setExportedObject:v7];
  return 1;
}

- (void)addSlotWithEndpoint:(id)a3 name:(id)a4 type:(id)a5 reply:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(id, void *))a6;
  if (!self->_endpoint)
  {
    location = (id *)&self->_connection;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    v16 = [WeakRetained valueForEntitlement:@"com.apple.private.ctk.slot-type"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v16 isEqualToString:v13])
      {
LABEL_22:
        objc_storeStrong((id *)&self->_slotType, a5);
        objc_storeStrong((id *)&self->_endpoint, a3);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10000DC90;
        v30[3] = &unk_100020600;
        v30[4] = self;
        id v25 = objc_loadWeakRetained(location);
        [v25 setInvalidationHandler:v30];

        [(TKSlotServer *)self->_server addSlotRegistration:self name:v12];
        v24 = [(TKSlotRegistration *)self slotName];
        v14[2](v14, v24);
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v26 = v14;
        id v27 = v12;
        id v28 = v11;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v18 = v16;
        id v19 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v32;
          while (2)
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v32 != v21) {
                objc_enumerationMutation(v18);
              }
              if ([v13 isEqualToString:*(void *)(*((void *)&v31 + 1) + 8 * i)])
              {

                id v12 = v27;
                id v11 = v28;
                v14 = v26;
                goto LABEL_22;
              }
            }
            id v20 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }

        id v12 = v27;
        id v11 = v28;
        v14 = v26;
      }
    }
    v23 = sub_10000DC3C();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100014978(location, (uint64_t)v13, v23);
    }

    v24 = objc_loadWeakRetained(location);
    [v24 invalidate];
    goto LABEL_23;
  }
  v15 = sub_10000DC3C();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100014A38((uint64_t)self, v15);
  }

  v16 = objc_loadWeakRetained((id *)&self->_connection);
  [v16 invalidate];
LABEL_24:
}

- (NSString)slotName
{
  return self->_slotName;
}

- (void)setSlotName:(id)a3
{
}

- (NSString)slotType
{
  return self->_slotType;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_slotType, 0);
  objc_storeStrong((id *)&self->_slotName, 0);
  objc_storeStrong((id *)&self->_server, 0);

  objc_destroyWeak((id *)&self->_connection);
}

@end