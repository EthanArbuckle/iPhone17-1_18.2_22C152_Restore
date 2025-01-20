@interface AFCoreAnalyticsCrossDeviceEvent
- (AFCoreAnalyticsCrossDeviceEvent)init;
- (AFCoreAnalyticsCrossDeviceEvent)initWithNearbyDevicesLoggingID:(id)a3;
- (NSMutableDictionary)nearbyDevicesPayloads;
- (NSString)nearbyDevicesLoggingID;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_setTargetedDeviceContextIdentifier:(id)a3 withAction:(id)a4 payload:(id)a5;
- (void)addCoreAnalyticsDeviceTargetedWithContextIdentifier:(id)a3 commandResultDescription:(id)a4;
- (void)addNearbyDeviceContexts:(id)a3 proximityInfo:(id)a4;
- (void)setNearbyDevicesPayloads:(id)a3;
@end

@implementation AFCoreAnalyticsCrossDeviceEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyDevicesPayloads, 0);
  objc_storeStrong((id *)&self->_nearbyDevicesLoggingID, 0);
}

- (void)setNearbyDevicesPayloads:(id)a3
{
}

- (NSMutableDictionary)nearbyDevicesPayloads
{
  return self->_nearbyDevicesPayloads;
}

- (NSString)nearbyDevicesLoggingID
{
  return self->_nearbyDevicesLoggingID;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = [NSString alloc];
  v16.receiver = self;
  v16.super_class = (Class)AFCoreAnalyticsCrossDeviceEvent;
  v5 = [(AFCoreAnalyticsCrossDeviceEvent *)&v16 description];
  id v6 = [NSString alloc];
  v7 = [(NSString *)self->_nearbyDevicesLoggingID description];
  v8 = (void *)[v6 initWithFormat:@"nearbyDevicesLoggingID = %@", v7];
  v17[0] = v8;
  id v9 = [NSString alloc];
  v10 = [(NSMutableDictionary *)self->_nearbyDevicesPayloads description];
  v11 = (void *)[v9 initWithFormat:@"nearbyDevicesPayloads = %@", v10];
  v17[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v13 = [v12 componentsJoinedByString:@", "];
  v14 = (void *)[v4 initWithFormat:@"%@ {%@}", v5, v13];

  return v14;
}

- (id)description
{
  return [(AFCoreAnalyticsCrossDeviceEvent *)self _descriptionWithIndent:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[AFCoreAnalyticsCrossDeviceEvent allocWithZone:a3] initWithNearbyDevicesLoggingID:self->_nearbyDevicesLoggingID];
  [(AFCoreAnalyticsCrossDeviceEvent *)v4 setNearbyDevicesPayloads:self->_nearbyDevicesPayloads];
  return v4;
}

- (void)addCoreAnalyticsDeviceTargetedWithContextIdentifier:(id)a3 commandResultDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  nearbyDevicesPayloads = self->_nearbyDevicesPayloads;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __112__AFCoreAnalyticsCrossDeviceEvent_addCoreAnalyticsDeviceTargetedWithContextIdentifier_commandResultDescription___block_invoke;
  v11[3] = &unk_1E5927E40;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NSMutableDictionary *)nearbyDevicesPayloads enumerateKeysAndObjectsUsingBlock:v11];
}

void __112__AFCoreAnalyticsCrossDeviceEvent_addCoreAnalyticsDeviceTargetedWithContextIdentifier_commandResultDescription___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v14 = a2;
  id v8 = a3;
  id v9 = *(void **)(a1 + 32);
  id v10 = v9;
  if (!v9)
  {
    id v4 = [v8 proximity];
    v11 = @"primary";
    if ([v4 isEqualToString:@"primary"])
    {

      goto LABEL_7;
    }
    id v10 = *(void **)(a1 + 32);
  }
  id v12 = [v10 UUIDString];
  int v13 = [v12 isEqualToString:v14];

  if (v9)
  {
    if (!v13) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  if (v13)
  {
LABEL_7:
    [*(id *)(a1 + 40) _setTargetedDeviceContextIdentifier:v14 withAction:*(void *)(a1 + 48) payload:v8];
    *a4 = 1;
  }
LABEL_8:
}

- (void)_setTargetedDeviceContextIdentifier:(id)a3 withAction:(id)a4 payload:(id)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__AFCoreAnalyticsCrossDeviceEvent__setTargetedDeviceContextIdentifier_withAction_payload___block_invoke;
  v12[3] = &unk_1E5927E18;
  id v13 = v8;
  id v9 = v8;
  id v10 = a3;
  v11 = [a5 mutatedCopyWithMutator:v12];
  [(NSMutableDictionary *)self->_nearbyDevicesPayloads setObject:v11 forKey:v10];
}

uint64_t __90__AFCoreAnalyticsCrossDeviceEvent__setTargetedDeviceContextIdentifier_withAction_payload___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTargetedResult:*(void *)(a1 + 32)];
}

- (void)addNearbyDeviceContexts:(id)a3 proximityInfo:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v8 = a3;
    id v9 = objc_alloc_init(v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__AFCoreAnalyticsCrossDeviceEvent_addNearbyDeviceContexts_proximityInfo___block_invoke;
    v11[3] = &unk_1E5927DF0;
    id v12 = v6;
    id v13 = self;
    id v14 = v9;
    id v10 = v9;
    [v8 enumerateObjectsUsingBlock:v11];

    [(AFCoreAnalyticsCrossDeviceEvent *)self setNearbyDevicesPayloads:v10];
  }
}

void __73__AFCoreAnalyticsCrossDeviceEvent_addNearbyDeviceContexts_proximityInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 deviceInfo];
  v5 = [v4 assistantIdentifier];

  if (!v5
    || ([*(id *)(a1 + 32) objectForKey:v5],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 integerValue],
        v6,
        v5,
        !v7))
  {
    id v8 = [v3 deviceInfo];
    id v9 = [v8 idsDeviceUniqueIdentifier];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 32) objectForKey:v9];
      uint64_t v7 = [v10 integerValue];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  v11 = AFCoreAnalyticsPayloadCreateForDeviceContext(v3, v7, *(void **)(*(void *)(a1 + 40) + 8));
  id v12 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    objc_super v16 = v12;
    v17 = [v3 identifier];
    v18 = [v17 UUIDString];
    int v19 = 136315650;
    v20 = "-[AFCoreAnalyticsCrossDeviceEvent addNearbyDeviceContexts:proximityInfo:]_block_invoke";
    __int16 v21 = 2112;
    v22 = v18;
    __int16 v23 = 2112;
    v24 = v11;
    _os_log_debug_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_DEBUG, "%s payload for %@: %@", (uint8_t *)&v19, 0x20u);
  }
  id v13 = *(void **)(a1 + 48);
  id v14 = [v3 identifier];
  v15 = [v14 UUIDString];
  [v13 setObject:v11 forKey:v15];
}

- (AFCoreAnalyticsCrossDeviceEvent)initWithNearbyDevicesLoggingID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFCoreAnalyticsCrossDeviceEvent;
  v5 = [(AFCoreAnalyticsCrossDeviceEvent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    nearbyDevicesLoggingID = v5->_nearbyDevicesLoggingID;
    v5->_nearbyDevicesLoggingID = (NSString *)v6;
  }
  return v5;
}

- (AFCoreAnalyticsCrossDeviceEvent)init
{
  return 0;
}

@end