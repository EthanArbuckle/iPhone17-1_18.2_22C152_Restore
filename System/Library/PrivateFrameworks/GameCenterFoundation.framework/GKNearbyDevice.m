@interface GKNearbyDevice
+ (id)nearbyDeviceWithID:(id)a3;
- (BOOL)usePeerDiscovery;
- (GKPlayer)player;
- (NSData)devicePushToken;
- (NSString)deviceID;
- (int64_t)state;
- (void)sendDictionary:(id)a3 withCompletionHandler:(id)a4;
- (void)setDeviceID:(id)a3;
- (void)setDevicePushToken:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setUsePeerDiscovery:(BOOL)a3;
@end

@implementation GKNearbyDevice

+ (id)nearbyDeviceWithID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setDeviceID:v4];

  [v5 setState:0];
  [v5 setUsePeerDiscovery:0];

  return v5;
}

- (void)sendDictionary:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  v9 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "GKMatchMaker+Nearby: sendDictionary:", buf, 2u);
  }
  v10 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
  v11 = [MEMORY[0x1E4F29128] UUID];
  v12 = [v11 UUIDString];
  [v10 setObject:v12 forKeyedSubscript:@"UUID"];

  v13 = +[GKLocalPlayer localPlayer];
  v14 = [v13 internal];
  v15 = [v14 playerID];

  if (v15) {
    [v10 setObject:v15 forKey:@"playerID"];
  }
  v16 = [(GKNearbyDevice *)self deviceID];
  id v36 = 0;
  v17 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v10 format:200 options:0 error:&v36];
  id v18 = v36;
  if (!v17)
  {
    if (!os_log_GKGeneral) {
      id v29 = GKOSLoggers();
    }
    v30 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
    {
      -[GKNearbyDevice sendDictionary:withCompletionHandler:](v30, (uint64_t)v6, (uint64_t)v18);
      if (!v7) {
        goto LABEL_22;
      }
    }
    else if (!v7)
    {
      goto LABEL_22;
    }
    v7[2](v7, v18);
    goto LABEL_22;
  }
  if (!os_log_GKGeneral) {
    id v19 = GKOSLoggers();
  }
  v20 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2D22000, v20, OS_LOG_TYPE_INFO, "GKMatchMaker+Nearby: sendDictionary: Sending Dictionary to device", buf, 2u);
  }
  id v31 = v18;
  if (!os_log_GKGeneral) {
    id v21 = GKOSLoggers();
  }
  v22 = v7;
  v23 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v24 = v23;
    v25 = +[GKMatchmaker descriptionForNearbyDictionary:v6];
    *(_DWORD *)buf = 138412546;
    v38 = v25;
    __int16 v39 = 2112;
    v40 = v16;
    _os_log_impl(&dword_1C2D22000, v24, OS_LOG_TYPE_INFO, "Sending dictionary %@ to deviceID: %@", buf, 0x16u);
  }
  v26 = +[GKDaemonProxy proxyForLocalPlayer];
  v27 = [v26 multiplayerService];
  BOOL v28 = [(GKNearbyDevice *)self usePeerDiscovery];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __55__GKNearbyDevice_sendDictionary_withCompletionHandler___block_invoke;
  v32[3] = &unk_1E646DF30;
  id v33 = v6;
  id v34 = v16;
  v35 = v22;
  [v27 sendDataToParticipant:0 deviceID:v34 data:v17 usePeerDiscovery:v28 handler:v32];

  v7 = v22;
  id v18 = v31;
LABEL_22:
}

void __55__GKNearbyDevice_sendDictionary_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "GKMatchMaker+Nearby: sendDictionary: sendDataToParticipant", v9, 2u);
  }
  if (v3)
  {
    if (!os_log_GKGeneral) {
      id v6 = GKOSLoggers();
    }
    v7 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __55__GKNearbyDevice_sendDictionary_withCompletionHandler___block_invoke_cold_1(a1, v7, (uint64_t)v3);
    }
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (GKPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (NSData)devicePushToken
{
  return self->_devicePushToken;
}

- (void)setDevicePushToken:(id)a3
{
}

- (BOOL)usePeerDiscovery
{
  return self->_usePeerDiscovery;
}

- (void)setUsePeerDiscovery:(BOOL)a3
{
  self->_usePeerDiscovery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicePushToken, 0);
  objc_storeStrong((id *)&self->_player, 0);

  objc_storeStrong((id *)&self->_deviceID, 0);
}

- (void)sendDictionary:(uint64_t)a3 withCompletionHandler:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = +[GKMatchmaker descriptionForNearbyDictionary:a2];
  int v8 = 138412546;
  v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = a3;
  OUTLINED_FUNCTION_1_2(&dword_1C2D22000, v5, v7, "GKMatchMaker+Nearby:sendDictionary: Error creating query data for dictionary: %@, error = %@", (uint8_t *)&v8);
}

void __55__GKNearbyDevice_sendDictionary_withCompletionHandler___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = +[GKMatchmaker descriptionForNearbyDictionary:v5];
  uint64_t v8 = *(void *)(a1 + 40);
  int v9 = 138412802;
  __int16 v10 = v7;
  __int16 v11 = 2112;
  uint64_t v12 = v8;
  __int16 v13 = 2112;
  uint64_t v14 = a3;
  _os_log_error_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_ERROR, "Error sending dictionary %@ to deviceID: %@, error = %@", (uint8_t *)&v9, 0x20u);
}

@end