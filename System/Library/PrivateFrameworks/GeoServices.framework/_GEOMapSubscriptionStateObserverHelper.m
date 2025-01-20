@interface _GEOMapSubscriptionStateObserverHelper
- (void)_broadcastState:(id)a3 forIdentifier:(id)a4 fromPairedDevice:(BOOL)a5 toPeer:(id)a6;
- (void)geoXPCConnectionIsReadyToSend:(id)a3;
@end

@implementation _GEOMapSubscriptionStateObserverHelper

- (void)geoXPCConnectionIsReadyToSend:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peer);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained connection];

    if (v7 == v4)
    {
      v15 = self->_isolater;
      _geo_isolate_lock();
      pendingStateUpdates = self->_pendingStateUpdates;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100030428;
      v13[3] = &unk_1000726B8;
      v13[4] = self;
      id v9 = v6;
      id v14 = v9;
      [(NSMutableDictionary *)pendingStateUpdates enumerateKeysAndObjectsUsingBlock:v13];
      [(NSMutableDictionary *)self->_pendingStateUpdates removeAllObjects];
      pendingPairedDeviceStateUpdates = self->_pendingPairedDeviceStateUpdates;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10003043C;
      v11[3] = &unk_1000726B8;
      v11[4] = self;
      id v12 = v9;
      [(NSMutableDictionary *)pendingPairedDeviceStateUpdates enumerateKeysAndObjectsUsingBlock:v11];
      [(NSMutableDictionary *)self->_pendingPairedDeviceStateUpdates removeAllObjects];

      _geo_isolate_unlock();
    }
  }
}

- (void)_broadcastState:(id)a3 forIdentifier:(id)a4 fromPairedDevice:(BOOL)a5 toPeer:(id)a6
{
  BOOL v7 = a5;
  id v15 = a3;
  id v10 = a4;
  id v11 = a6;
  geo_assert_isolated();
  if (!v7)
  {
    if (![(NSMutableArray *)self->_observingIdentifiers containsObject:v10]) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if ([(NSMutableArray *)self->_observingPairedDeviceIdentifiers containsObject:v10])
  {
LABEL_5:
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    [v15 encodeToXPCDictionary:v12];
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v13, "message", "subscription_state_did_change");
    xpc_dictionary_set_value(v13, "state", v12);
    xpc_dictionary_set_string(v13, "id", (const char *)[v10 UTF8String]);
    xpc_dictionary_set_BOOL(v13, "paired_device", v7);
    id v14 = [v11 connection];
    [v14 sendMessage:v13];
  }
LABEL_6:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPairedDeviceStateUpdates, 0);
  objc_storeStrong((id *)&self->_observingPairedDeviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_pendingStateUpdates, 0);
  objc_storeStrong((id *)&self->_observingIdentifiers, 0);
  objc_storeStrong((id *)&self->_isolater, 0);

  objc_destroyWeak((id *)&self->_peer);
}

@end