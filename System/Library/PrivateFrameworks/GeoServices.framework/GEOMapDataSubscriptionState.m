@interface GEOMapDataSubscriptionState
- (GEOMapDataSubscriptionState)init;
- (GEOMapDataSubscriptionState)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSDictionary)userInfo;
- (NSError)lastError;
- (NSProgress)downloadProgress;
- (int64_t)downloadState;
- (int64_t)loadState;
- (unint64_t)downloadedDataCount;
- (unint64_t)downloadedDataSize;
- (void)_commonInit;
- (void)_handleXPCError:(uint64_t)a1;
- (void)_setLoadState:(uint64_t)a3 downloadState:(void *)a4 downloadProgress:(void *)a5 lastError:(uint64_t)a6 downloadedDataCount:(uint64_t)a7 downloadedDataSize:(void *)a8 userInfo:;
- (void)_updateWithPairedDeviceState:(uint64_t)a1;
- (void)_updateWithXPCDictionary:(uint64_t)a1;
- (void)encodeToXPCDictionary:(id)a3;
@end

@implementation GEOMapDataSubscriptionState

- (GEOMapDataSubscriptionState)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapDataSubscriptionState;
  v2 = [(GEOMapDataSubscriptionState *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(GEOMapDataSubscriptionState *)v2 _commonInit];
    v4 = v3;
  }

  return v3;
}

- (GEOMapDataSubscriptionState)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapDataSubscriptionState;
  objc_super v6 = [(GEOMapDataSubscriptionState *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(GEOMapDataSubscriptionState *)v6 _commonInit];
    -[GEOMapDataSubscriptionState _updateWithXPCDictionary:]((uint64_t)v7, v5);
    v8 = v7;
  }

  return v7;
}

- (void)_updateWithXPCDictionary:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  id v3 = a2;
  int64_t int64 = xpc_dictionary_get_int64(v3, "load_state");
  int64_t v31 = xpc_dictionary_get_int64(v3, "download_state");
  uint64_t int64 = xpc_dictionary_get_uint64(v3, "data_count");
  uint64_t v4 = xpc_dictionary_get_uint64(v3, "data_size");
  xpc_dictionary_get_dictionary(v3, "progress");
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = xpc_dictionary_get_value(v3, "last_error");
  objc_super v6 = xpc_dictionary_get_dictionary(v3, "user_info");

  id v7 = v6;
  uint64_t v23 = v4;
  if (v7)
  {
    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v9 = xpc_dictionary_get_uint64(v7, (const char *)[@"GEOMapDataSubscriptionStateWaitingReasonKey" UTF8String]);
    if (v9)
    {
      objc_super v10 = [NSNumber numberWithUnsignedLongLong:v9];
      [v8 setObject:v10 forKeyedSubscript:@"GEOMapDataSubscriptionStateWaitingReasonKey"];
    }
    uint64_t v11 = xpc_dictionary_get_uint64(v7, (const char *)[@"GEOMapDataSubscriptionStateWaitingMinimumBatteryLevelKey" UTF8String]);
    if (v11)
    {
      v12 = [NSNumber numberWithUnsignedLongLong:v11];
      [v8 setObject:v12 forKeyedSubscript:@"GEOMapDataSubscriptionStateWaitingMinimumBatteryLevelKey"];
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CC08];
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  uint64_t v26 = *(void *)(a1 + 16);
  uint64_t v27 = *(void *)(a1 + 24);
  uint64_t v28 = *(void *)(a1 + 56);
  uint64_t v29 = *(void *)(a1 + 64);
  BOOL v13 = *(void *)(a1 + 32) == 0;
  id obj = v8;
  char v14 = [v8 isEqualToDictionary:*(void *)(a1 + 48)];
  v24 = (void *)v5;
  if (v5)
  {
    v15 = _geo_NSErrorFromXPCDictionaryRepresentationCopy();
    v16 = v15;
    v18 = (id *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 40);
    int v19 = (v15 != 0) ^ (v17 != 0);
    if (v15 && v17) {
      int v19 = objc_msgSend(v15, "isEqual:") ^ 1;
    }
  }
  else
  {
    v16 = 0;
    v18 = (id *)(a1 + 40);
    int v19 = *(void *)(a1 + 40) != 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  if (int64 != v26) {
    [(id)a1 willChangeValueForKey:@"loadState"];
  }
  if (v31 != v27) {
    [(id)a1 willChangeValueForKey:@"downloadState"];
  }
  if (uint64 != v28) {
    [(id)a1 willChangeValueForKey:@"downloadedDataCount"];
  }
  if (v4 == v29)
  {
    if (((v33 != 0) ^ v13)) {
      goto LABEL_20;
    }
  }
  else
  {
    [(id)a1 willChangeValueForKey:@"downloadedDataSize"];
    if (((v33 != 0) ^ v13))
    {
LABEL_20:
      if (!v19) {
        goto LABEL_21;
      }
      goto LABEL_28;
    }
  }
  [(id)a1 willChangeValueForKey:@"downloadProgress"];
  if (!v19)
  {
LABEL_21:
    if (v14) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_28:
  [(id)a1 willChangeValueForKey:@"lastError"];
  if ((v14 & 1) == 0) {
LABEL_22:
  }
    [(id)a1 willChangeValueForKey:@"userInfo"];
LABEL_23:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  *(void *)(a1 + 16) = int64;
  *(void *)(a1 + 24) = v31;
  *(void *)(a1 + 56) = uint64;
  *(void *)(a1 + 64) = v4;
  v20 = *(void **)(a1 + 32);
  if (v33)
  {
    if (v20) {
      goto LABEL_33;
    }
    uint64_t v21 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
    v20 = *(void **)(a1 + 32);
  }
  else
  {
    if (!v20) {
      goto LABEL_33;
    }
    uint64_t v21 = 0;
  }
  *(void *)(a1 + 32) = v21;

LABEL_33:
  objc_storeStrong(v18, v16);
  if ((v14 & 1) == 0) {
    objc_storeStrong((id *)(a1 + 48), obj);
  }
  id v22 = *(id *)(a1 + 32);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  objc_msgSend(v22, "_geo_configureFromMirroredProgressXPCDictionary:", v33);

  if (int64 != v26) {
    [(id)a1 didChangeValueForKey:@"loadState"];
  }
  if (v31 != v27) {
    [(id)a1 didChangeValueForKey:@"downloadState"];
  }
  if (uint64 != v28) {
    [(id)a1 didChangeValueForKey:@"downloadedDataCount"];
  }
  if (v23 == v29)
  {
    if (((v33 != 0) ^ v13)) {
      goto LABEL_43;
    }
  }
  else
  {
    [(id)a1 didChangeValueForKey:@"downloadedDataSize"];
    if (((v33 != 0) ^ v13))
    {
LABEL_43:
      if (!v19) {
        goto LABEL_44;
      }
LABEL_51:
      [(id)a1 didChangeValueForKey:@"lastError"];
      if (v14) {
        goto LABEL_46;
      }
      goto LABEL_45;
    }
  }
  [(id)a1 didChangeValueForKey:@"downloadProgress"];
  if (v19) {
    goto LABEL_51;
  }
LABEL_44:
  if ((v14 & 1) == 0) {
LABEL_45:
  }
    [(id)a1 didChangeValueForKey:@"userInfo"];
LABEL_46:
}

- (void)_commonInit
{
  self->_lock._os_unfair_lock_opaque = 0;
  userInfo = self->_userInfo;
  self->_userInfo = (NSDictionary *)MEMORY[0x1E4F1CC08];
}

- (void)_handleXPCError:(uint64_t)a1
{
  id v6 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    uint64_t v4 = *(void *)(a1 + 32);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v4)
    {
      [(id)a1 willChangeValueForKey:@"downloadProgress"];
      [(id)a1 willChangeValueForKey:@"lastError"];
      [(id)a1 willChangeValueForKey:@"downloadState"];
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      [*(id *)(a1 + 32) cancel];
      uint64_t v5 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;

      objc_storeStrong((id *)(a1 + 40), a2);
      *(void *)(a1 + 24) = 4;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      [(id)a1 didChangeValueForKey:@"downloadProgress"];
      [(id)a1 didChangeValueForKey:@"lastError"];
      [(id)a1 didChangeValueForKey:@"downloadState"];
    }
  }
}

- (void)encodeToXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  xpc_dictionary_set_int64(xdict, "load_state", self->_loadState);
  xpc_dictionary_set_int64(xdict, "download_state", self->_downloadState);
  xpc_dictionary_set_uint64(xdict, "data_count", self->_dataCount);
  xpc_dictionary_set_uint64(xdict, "data_size", self->_dataSize);
  progress = self->_progress;
  if (progress)
  {
    id v6 = [(NSProgress *)progress _geo_mirroredProgressXPCDictionary];
    xpc_dictionary_set_value(xdict, "progress", v6);
  }
  lastError = self->_lastError;
  if (lastError)
  {
    v8 = _geo_NSErrorXPCDictionaryRepresentationCopy(lastError);
    xpc_dictionary_set_value(xdict, "last_error", v8);
  }
  uint64_t v9 = self->_userInfo;
  xpc_object_t empty = xpc_dictionary_create_empty();
  uint64_t v11 = [(NSDictionary *)v9 objectForKeyedSubscript:@"GEOMapDataSubscriptionStateWaitingReasonKey"];
  if (v11) {
    xpc_dictionary_set_uint64(empty, (const char *)[@"GEOMapDataSubscriptionStateWaitingReasonKey" UTF8String], objc_msgSend(v11, "unsignedIntegerValue"));
  }
  v12 = [(NSDictionary *)v9 objectForKeyedSubscript:@"GEOMapDataSubscriptionStateWaitingMinimumBatteryLevelKey"];
  if (v12) {
    xpc_dictionary_set_uint64(empty, (const char *)[@"GEOMapDataSubscriptionStateWaitingMinimumBatteryLevelKey" UTF8String], objc_msgSend(v12, "unsignedIntegerValue"));
  }

  xpc_dictionary_set_value(xdict, "user_info", empty);
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)loadState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t loadState = self->_loadState;
  os_unfair_lock_unlock(p_lock);
  return loadState;
}

- (int64_t)downloadState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  downint64_t loadState = self->_downloadState;
  os_unfair_lock_unlock(p_lock);
  return downloadState;
}

- (NSProgress)downloadProgress
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_progress;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSError)lastError
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_lastError;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (unint64_t)downloadedDataCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t dataCount = self->_dataCount;
  os_unfair_lock_unlock(p_lock);
  return dataCount;
}

- (unint64_t)downloadedDataSize
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t dataSize = self->_dataSize;
  os_unfair_lock_unlock(p_lock);
  return dataSize;
}

- (NSDictionary)userInfo
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_userInfo;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)_setLoadState:(uint64_t)a3 downloadState:(void *)a4 downloadProgress:(void *)a5 lastError:(uint64_t)a6 downloadedDataCount:(uint64_t)a7 downloadedDataSize:(void *)a8 userInfo:
{
  id v20 = a4;
  id v15 = a5;
  id v16 = a8;
  if (a1)
  {
    [(id)a1 willChangeValueForKey:@"loadState"];
    [(id)a1 willChangeValueForKey:@"downloadState"];
    [(id)a1 willChangeValueForKey:@"downloadProgress"];
    [(id)a1 willChangeValueForKey:@"lastError"];
    [(id)a1 willChangeValueForKey:@"downloadedDataCount"];
    [(id)a1 willChangeValueForKey:@"downloadedDataSize"];
    [(id)a1 willChangeValueForKey:@"userInfo"];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    *(void *)(a1 + 16) = a2;
    *(void *)(a1 + 24) = a3;
    uint64_t v17 = *(void **)(a1 + 32);
    if (v20)
    {
      if (v17)
      {
        objc_msgSend(v17, "_geo_mirroredProgressReplaceObservedProgressWith:");
      }
      else
      {
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28F90], "_geo_progressMirroringProgress:");
        int v19 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v18;
      }
    }
    else
    {
      *(void *)(a1 + 32) = 0;
    }
    objc_storeStrong((id *)(a1 + 40), a5);
    *(void *)(a1 + 56) = a6;
    *(void *)(a1 + 64) = a7;
    objc_storeStrong((id *)(a1 + 48), a8);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    [(id)a1 didChangeValueForKey:@"loadState"];
    [(id)a1 didChangeValueForKey:@"downloadState"];
    [(id)a1 didChangeValueForKey:@"downloadProgress"];
    [(id)a1 didChangeValueForKey:@"lastError"];
    [(id)a1 didChangeValueForKey:@"downloadedDataCount"];
    [(id)a1 didChangeValueForKey:@"downloadedDataSize"];
    [(id)a1 didChangeValueForKey:@"userInfo"];
  }
}

- (void)_updateWithPairedDeviceState:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  id v3 = a2;
  uint64_t v17 = [v3 loadState];
  uint64_t v18 = [v3 downloadState];
  id v19 = [v3 progress];
  uint64_t v4 = [v3 userInfo];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([v4 hasWaitingReasons])
    {
      id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "waitingReasons"));
      [v5 setObject:v6 forKeyedSubscript:@"GEOMapDataSubscriptionStateWaitingReasonKey"];
    }
    if ([v4 hasMinBatteryLevel])
    {
      id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "minBatteryLevel"));
      [v5 setObject:v7 forKeyedSubscript:@"GEOMapDataSubscriptionStateWaitingMinimumBatteryLevelKey"];
    }
    v8 = v5;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CC08];
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  BOOL v11 = *(void *)(a1 + 32) == 0;
  v12 = v8;
  char v13 = [*(id *)(a1 + 48) isEqualToDictionary:v8];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  if (v10 != v17) {
    [(id)a1 willChangeValueForKey:@"loadState"];
  }
  if (v9 == v18)
  {
    if (((v19 != 0) ^ v11)) {
      goto LABEL_13;
    }
LABEL_16:
    [(id)a1 willChangeValueForKey:@"downloadProgress"];
    if (v13) {
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  [(id)a1 willChangeValueForKey:@"downloadState"];
  if ((((v19 != 0) ^ v11) & 1) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  if (v13)
  {
LABEL_14:
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    *(void *)(a1 + 16) = v17;
    *(void *)(a1 + 24) = v18;
    goto LABEL_18;
  }
LABEL_17:
  [(id)a1 willChangeValueForKey:@"userInfo"];
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  *(void *)(a1 + 16) = v17;
  *(void *)(a1 + 24) = v18;
  objc_storeStrong((id *)(a1 + 48), v12);
LABEL_18:
  char v14 = *(void **)(a1 + 32);
  if (v19)
  {
    if (v14) {
      goto LABEL_24;
    }
    uint64_t v15 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
    char v14 = *(void **)(a1 + 32);
  }
  else
  {
    if (!v14) {
      goto LABEL_24;
    }
    uint64_t v15 = 0;
  }
  *(void *)(a1 + 32) = v15;

LABEL_24:
  id v16 = *(id *)(a1 + 32);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  objc_msgSend(v16, "_geo_configureFromPairedDeviceProgress:", v19);

  if (v10 != v17) {
    [(id)a1 didChangeValueForKey:@"loadState"];
  }
  if (v9 == v18)
  {
    if (((v19 != 0) ^ v11)) {
      goto LABEL_28;
    }
LABEL_34:
    [(id)a1 didChangeValueForKey:@"downloadProgress"];
    if (v13) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  [(id)a1 didChangeValueForKey:@"downloadState"];
  if ((((v19 != 0) ^ v11) & 1) == 0) {
    goto LABEL_34;
  }
LABEL_28:
  if ((v13 & 1) == 0) {
LABEL_29:
  }
    [(id)a1 didChangeValueForKey:@"userInfo"];
LABEL_30:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_lastError, 0);

  objc_storeStrong((id *)&self->_progress, 0);
}

@end