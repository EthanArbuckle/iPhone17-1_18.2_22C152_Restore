@interface DNDSIDSSyncEngineMetadataStore
- (BOOL)_areSyncDatesValidAtDate:(id)a3;
- (BOOL)_canTombstoneBeRemovedWithRecordID:(id)a3;
- (BOOL)_isMetadataValidAtDate:(id)a3;
- (BOOL)_isPairedDeviceOutdated:(id)a3;
- (BOOL)hasMetadataForPairedDeviceIdentifier:(id)a3;
- (BOOL)hasPerformedInitialSyncForPairedDeviceIdentifier:(id)a3;
- (BOOL)isValidAtDate:(id)a3;
- (DNDSIDSSyncEngineMetadataStore)init;
- (DNDSIDSSyncEngineMetadataStore)initWithDeviceObsoletionDuration:(double)a3 tombstoneObsoletionDuration:(double)a4;
- (DNDSIDSSyncEngineMetadataStore)initWithURL:(id)a3;
- (id)deletedRecordIDsForPairedDeviceIdentifier:(id)a3;
- (id)modifiedRecordIDsForPairedDeviceIdentifier:(id)a3;
- (id)recordMetadataForRecordID:(id)a3;
- (id)unknownRecordIDsInRecordIDs:(id)a3;
- (void)_forgetMetadataForRecordID:(id)a3;
- (void)_forgetObsoleteTombstones;
- (void)_forgetRecordID:(id)a3;
- (void)_forgetSyncDatesForDevicesWithoutInitialSync;
- (void)_forgetSyncDatesForOutdatedDevices;
- (void)_forgetSyncDatesForRecordID:(id)a3;
- (void)_parseDictionary:(id)a3;
- (void)_read;
- (void)_write;
- (void)garbageCollect;
- (void)purge;
- (void)removePairedDeviceIdentifier:(id)a3;
- (void)setDeletedAtDate:(id)a3 forRecordIDs:(id)a4;
- (void)setLastModifiedDate:(id)a3 forRecordIDs:(id)a4;
- (void)setPerformedInitialSyncForPairedDeviceIdentifier:(id)a3;
- (void)setSyncDate:(id)a3 forRecordIDs:(id)a4 forPairedDeviceIdentifier:(id)a5;
- (void)setSyncDate:(id)a3 forRecordsMatchingMetadata:(id)a4 forPairedDeviceIdentifier:(id)a5;
- (void)updateMetadata:(id)a3;
@end

@implementation DNDSIDSSyncEngineMetadataStore

- (DNDSIDSSyncEngineMetadataStore)init
{
  return [(DNDSIDSSyncEngineMetadataStore *)self initWithURL:0];
}

- (DNDSIDSSyncEngineMetadataStore)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSIDSSyncEngineMetadataStore;
  v5 = [(DNDSIDSSyncEngineMetadataStore *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v6;

    *(_OWORD *)(v5 + 40) = xmmword_1D3122100;
    [v5 _read];
    [v5 garbageCollect];
    [v5 _write];
  }

  return (DNDSIDSSyncEngineMetadataStore *)v5;
}

- (DNDSIDSSyncEngineMetadataStore)initWithDeviceObsoletionDuration:(double)a3 tombstoneObsoletionDuration:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)DNDSIDSSyncEngineMetadataStore;
  uint64_t v6 = [(DNDSIDSSyncEngineMetadataStore *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_deviceObsoletionDuration = a3;
    v6->_tombstoneObsoletionDuration = a4;
    [(DNDSIDSSyncEngineMetadataStore *)v6 _parseDictionary:0];
  }
  return v7;
}

- (id)unknownRecordIDsInRecordIDs:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_recordMetadataByRecordID, "objectForKeyedSubscript:", v11, (void)v14);
        if (!v12) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)modifiedRecordIDsForPairedDeviceIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F1CA48] array];
  long long v16 = v4;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(NSMutableDictionary *)self->_recordIDSyncDatesByPairedDeviceIdentifier objectForKeyedSubscript:v4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obj = self->_recordMetadataByRecordID;
  uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = [v5 objectForKeyedSubscript:v10];
        v12 = [(NSMutableDictionary *)self->_recordMetadataByRecordID objectForKeyedSubscript:v10];
        if (([v12 isDeleted] & 1) == 0)
        {
          if (!v11
            || ([v12 lastModified],
                v13 = objc_claimAutoreleasedReturnValue(),
                [v11 earlierDate:v13],
                long long v14 = objc_claimAutoreleasedReturnValue(),
                v14,
                v13,
                v14 == v11))
          {
            [v17 addObject:v10];
          }
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  return v17;
}

- (id)deletedRecordIDsForPairedDeviceIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F1CA48] array];
  long long v16 = v4;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(NSMutableDictionary *)self->_recordIDSyncDatesByPairedDeviceIdentifier objectForKeyedSubscript:v4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obj = self->_recordMetadataByRecordID;
  uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = [v5 objectForKeyedSubscript:v10];
        v12 = [(NSMutableDictionary *)self->_recordMetadataByRecordID objectForKeyedSubscript:v10];
        if ([v12 isDeleted])
        {
          if (!v11
            || ([v12 lastModified],
                v13 = objc_claimAutoreleasedReturnValue(),
                [v11 earlierDate:v13],
                long long v14 = objc_claimAutoreleasedReturnValue(),
                v14,
                v13,
                v14 == v11))
          {
            [v17 addObject:v10];
          }
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  return v17;
}

- (void)setLastModifiedDate:(id)a3 forRecordIDs:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
          long long v14 = [DNDSIDSRecordMetadata alloc];
          long long v15 = -[DNDSIDSRecordMetadata initWithRecordID:lastModified:deleted:](v14, "initWithRecordID:lastModified:deleted:", v13, v6, 0, (void)v16);
          [(NSMutableDictionary *)self->_recordMetadataByRecordID setObject:v15 forKeyedSubscript:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [(DNDSIDSSyncEngineMetadataStore *)self _write];
  }
}

- (void)setDeletedAtDate:(id)a3 forRecordIDs:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
          long long v14 = [DNDSIDSRecordMetadata alloc];
          long long v15 = -[DNDSIDSRecordMetadata initWithRecordID:lastModified:deleted:](v14, "initWithRecordID:lastModified:deleted:", v13, v6, 1, (void)v16);
          [(NSMutableDictionary *)self->_recordMetadataByRecordID setObject:v15 forKeyedSubscript:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [(DNDSIDSSyncEngineMetadataStore *)self _write];
  }
}

- (id)recordMetadataForRecordID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_recordMetadataByRecordID objectForKeyedSubscript:a3];
}

- (void)setSyncDate:(id)a3 forRecordIDs:(id)a4 forPairedDeviceIdentifier:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    uint64_t v11 = [(NSMutableDictionary *)self->_recordIDSyncDatesByPairedDeviceIdentifier objectForKeyedSubscript:v10];
    if (!v11)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)self->_recordIDSyncDatesByPairedDeviceIdentifier setObject:v11 forKeyedSubscript:v10];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, *(void *)(*((void *)&v17 + 1) + 8 * v16++), (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }

    [(DNDSIDSSyncEngineMetadataStore *)self garbageCollect];
    [(DNDSIDSSyncEngineMetadataStore *)self _write];
  }
}

- (void)setSyncDate:(id)a3 forRecordsMatchingMetadata:(id)a4 forPairedDeviceIdentifier:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    uint64_t v11 = [(NSMutableDictionary *)self->_recordIDSyncDatesByPairedDeviceIdentifier objectForKeyedSubscript:v10];
    if (!v11)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)self->_recordIDSyncDatesByPairedDeviceIdentifier setObject:v11 forKeyedSubscript:v10];
    }
    id v22 = v10;
    id v23 = v9;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          recordMetadataByRecordID = self->_recordMetadataByRecordID;
          long long v19 = objc_msgSend(v17, "recordID", v22, v23, (void)v24);
          long long v20 = [(NSMutableDictionary *)recordMetadataByRecordID objectForKeyedSubscript:v19];

          if ([v17 isEqual:v20])
          {
            uint64_t v21 = [v17 recordID];
            [v11 setObject:v8 forKeyedSubscript:v21];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v14);
    }

    [(DNDSIDSSyncEngineMetadataStore *)self garbageCollect];
    [(DNDSIDSSyncEngineMetadataStore *)self _write];

    id v10 = v22;
    id v9 = v23;
  }
}

- (void)purge
{
  v3 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1D3052000, v3, OS_LOG_TYPE_DEFAULT, "Purging metadata store", v10, 2u);
  }
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  recordIDSyncDatesByPairedDeviceIdentifier = self->_recordIDSyncDatesByPairedDeviceIdentifier;
  self->_recordIDSyncDatesByPairedDeviceIdentifier = v4;

  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  recordMetadataByRecordID = self->_recordMetadataByRecordID;
  self->_recordMetadataByRecordID = v6;

  id v8 = [MEMORY[0x1E4F1CA80] set];
  initialSyncPairedDeviceIdentifiers = self->_initialSyncPairedDeviceIdentifiers;
  self->_initialSyncPairedDeviceIdentifiers = v8;

  [(DNDSIDSSyncEngineMetadataStore *)self _write];
}

- (void)updateMetadata:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        recordMetadataByRecordID = self->_recordMetadataByRecordID;
        id v12 = [v10 recordID];
        uint64_t v13 = [(NSMutableDictionary *)recordMetadataByRecordID objectForKeyedSubscript:v12];

        if (v10 != v13)
        {
          BOOL v14 = !v10 || v13 == 0;
          if (v14 || ([v10 isEqual:v13] & 1) == 0)
          {
            uint64_t v15 = [v10 recordID];
            [(DNDSIDSSyncEngineMetadataStore *)self _forgetSyncDatesForRecordID:v15];

            uint64_t v16 = self->_recordMetadataByRecordID;
            long long v17 = [v10 recordID];
            [(NSMutableDictionary *)v16 setObject:v10 forKeyedSubscript:v17];

            char v7 = 1;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
    if (v7) {
      [(DNDSIDSSyncEngineMetadataStore *)self _write];
    }
  }
}

- (BOOL)hasMetadataForPairedDeviceIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_recordIDSyncDatesByPairedDeviceIdentifier objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)garbageCollect
{
  [(DNDSIDSSyncEngineMetadataStore *)self _forgetSyncDatesForDevicesWithoutInitialSync];
  [(DNDSIDSSyncEngineMetadataStore *)self _forgetSyncDatesForOutdatedDevices];
  [(DNDSIDSSyncEngineMetadataStore *)self _forgetObsoleteTombstones];
}

- (BOOL)isValidAtDate:(id)a3
{
  id v4 = a3;
  if ([(DNDSIDSSyncEngineMetadataStore *)self _isMetadataValidAtDate:v4]) {
    BOOL v5 = [(DNDSIDSSyncEngineMetadataStore *)self _areSyncDatesValidAtDate:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)removePairedDeviceIdentifier:(id)a3
{
  initialSyncPairedDeviceIdentifiers = self->_initialSyncPairedDeviceIdentifiers;
  id v5 = a3;
  [(NSMutableSet *)initialSyncPairedDeviceIdentifiers removeObject:v5];
  [(NSMutableDictionary *)self->_recordIDSyncDatesByPairedDeviceIdentifier removeObjectForKey:v5];

  [(DNDSIDSSyncEngineMetadataStore *)self _write];
}

- (BOOL)hasPerformedInitialSyncForPairedDeviceIdentifier:(id)a3
{
  return [(NSMutableSet *)self->_initialSyncPairedDeviceIdentifiers containsObject:a3];
}

- (void)setPerformedInitialSyncForPairedDeviceIdentifier:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_initialSyncPairedDeviceIdentifiers, "containsObject:") & 1) == 0)
  {
    [(NSMutableSet *)self->_initialSyncPairedDeviceIdentifiers addObject:v4];
    [(DNDSIDSSyncEngineMetadataStore *)self _write];
  }
}

- (void)_read
{
  p_url = (uint64_t *)&self->_url;
  url = self->_url;
  if (!url) {
    goto LABEL_6;
  }
  id v8 = 0;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:url error:&v8];
  id v6 = v8;
  if (v6)
  {
    char v7 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
      [(DNDSSyncEngineMetadataStore *)p_url _read];
    }
  }

  if (!v5)
  {
LABEL_6:
    id v5 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  [(DNDSIDSSyncEngineMetadataStore *)self _parseDictionary:v5];
}

- (void)_parseDictionary:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:1 partitionType:3 redactSensitiveData:0 contactProvider:0 applicationIdentifierMapper:0];
  id v6 = [v4 objectForKeyedSubscript:@"metadata"];
  char v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v47 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = +[DNDSIDSRecordMetadata newWithDictionaryRepresentation:*(void *)(*((void *)&v46 + 1) + 8 * i) context:v5];
        uint64_t v13 = v12;
        if (v12)
        {
          BOOL v14 = [v12 recordID];
          [v7 setObject:v13 forKeyedSubscript:v14];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v9);
  }

  v37 = v7;
  v38 = self;
  objc_storeStrong((id *)&self->_recordMetadataByRecordID, v7);
  v39 = v4;
  uint64_t v15 = [v4 objectForKeyedSubscript:@"syncDates"];
  uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v40 = v15;
  uint64_t v17 = [v40 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v43 != v19) {
          objc_enumerationMutation(v40);
        }
        long long v21 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        id v22 = (void *)MEMORY[0x1E4F1C9C8];
        uint64_t v23 = [v21 objectForKeyedSubscript:@"syncDate"];
        [v23 doubleValue];
        long long v24 = objc_msgSend(v22, "dateWithTimeIntervalSinceReferenceDate:");

        long long v25 = [v21 objectForKeyedSubscript:@"recordID"];
        id v26 = +[DNDSIDSRecordID newWithDictionaryRepresentation:v25 context:v5];

        uint64_t v27 = [v21 objectForKeyedSubscript:@"pairedDeviceIdentifier"];
        v28 = (void *)v27;
        if (v24) {
          BOOL v29 = v26 == 0;
        }
        else {
          BOOL v29 = 1;
        }
        if (!v29 && v27 != 0)
        {
          v31 = [(NSMutableDictionary *)v16 objectForKeyedSubscript:v27];
          if (!v31)
          {
            v31 = [MEMORY[0x1E4F1CA60] dictionary];
            [(NSMutableDictionary *)v16 setObject:v31 forKeyedSubscript:v28];
          }
          [v31 setObject:v24 forKeyedSubscript:v26];
        }
      }
      uint64_t v18 = [v40 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v18);
  }

  recordIDSyncDatesByPairedDeviceIdentifier = v38->_recordIDSyncDatesByPairedDeviceIdentifier;
  v38->_recordIDSyncDatesByPairedDeviceIdentifier = v16;
  v33 = v16;

  v34 = [v39 objectForKeyedSubscript:@"initialSyncs"];
  if (v34) {
    [MEMORY[0x1E4F1CA80] setWithArray:v34];
  }
  else {
  uint64_t v35 = [MEMORY[0x1E4F1CA80] set];
  }
  initialSyncPairedDeviceIdentifiers = v38->_initialSyncPairedDeviceIdentifiers;
  v38->_initialSyncPairedDeviceIdentifiers = (NSMutableSet *)v35;
}

- (void)_write
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (self->_url)
  {
    v2 = self;
    v37 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:1 partitionType:3 redactSensitiveData:0 contactProvider:0 applicationIdentifierMapper:0];
    v3 = [MEMORY[0x1E4F1CA48] array];
    v36 = [MEMORY[0x1E4F1CA48] array];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v4 = v2->_recordMetadataByRecordID;
    uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v47 objects:v57 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v48 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [(NSMutableDictionary *)v2->_recordMetadataByRecordID objectForKeyedSubscript:*(void *)(*((void *)&v47 + 1) + 8 * i)];
          uint64_t v10 = [v9 dictionaryRepresentationWithContext:v37];
          [v3 addObject:v10];
        }
        uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v47 objects:v57 count:16];
      }
      while (v6);
    }
    v30 = v3;

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    obuint64_t j = v2->_recordIDSyncDatesByPairedDeviceIdentifier;
    uint64_t v34 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v43 objects:v56 count:16];
    if (v34)
    {
      uint64_t v32 = *(void *)v44;
      v33 = v2;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v44 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v35 = v11;
          uint64_t v12 = *(void *)(*((void *)&v43 + 1) + 8 * v11);
          uint64_t v13 = [(NSMutableDictionary *)v2->_recordIDSyncDatesByPairedDeviceIdentifier objectForKeyedSubscript:v12];
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v55 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v40;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v40 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void **)(*((void *)&v39 + 1) + 8 * j);
                uint64_t v19 = [v13 objectForKeyedSubscript:v18];
                v53[0] = @"recordID";
                long long v20 = [v18 dictionaryRepresentationWithContext:v37];
                v54[0] = v20;
                v54[1] = v12;
                v53[1] = @"pairedDeviceIdentifier";
                v53[2] = @"syncDate";
                long long v21 = NSNumber;
                [v19 timeIntervalSinceReferenceDate];
                id v22 = objc_msgSend(v21, "numberWithDouble:");
                v54[2] = v22;
                uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:3];
                [v36 addObject:v23];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v55 count:16];
            }
            while (v15);
          }

          uint64_t v11 = v35 + 1;
          v2 = v33;
        }
        while (v35 + 1 != v34);
        uint64_t v34 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v43 objects:v56 count:16];
      }
      while (v34);
    }

    long long v24 = [(NSMutableSet *)v2->_initialSyncPairedDeviceIdentifiers allObjects];
    v51[0] = @"metadata";
    v51[1] = @"syncDates";
    v52[0] = v30;
    v52[1] = v36;
    v51[2] = @"initialSyncs";
    v52[2] = v24;
    long long v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:3];
    url = v2->_url;
    id v38 = 0;
    char v27 = [v25 writeToURL:url error:&v38];
    id v28 = v38;
    if ((v27 & 1) == 0)
    {
      BOOL v29 = DNDSLogIDSSyncEngine;
      if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR)) {
        [(DNDSSyncEngineMetadataStore *)(uint64_t)v28 _write];
      }
    }
  }
}

- (void)_forgetSyncDatesForDevicesWithoutInitialSync
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = self->_recordIDSyncDatesByPairedDeviceIdentifier;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if (([(NSMutableSet *)self->_initialSyncPairedDeviceIdentifiers containsObject:v9] & 1) == 0) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v6);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v20;
    *(void *)&long long v12 = 138543362;
    long long v18 = v12;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * j);
        uint64_t v17 = DNDSLogIDSSyncEngine;
        if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          uint64_t v28 = v16;
          _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_DEFAULT, "Forgetting device without initial sync data: %{public}@", buf, 0xCu);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordIDSyncDatesByPairedDeviceIdentifier, "setObject:forKeyedSubscript:", 0, v16, v18, (void)v19);
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v13);
  }
}

- (void)_forgetSyncDatesForOutdatedDevices
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = self->_initialSyncPairedDeviceIdentifiers;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if ([(DNDSIDSSyncEngineMetadataStore *)self _isPairedDeviceOutdated:v9]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v6);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v20;
    *(void *)&long long v12 = 138543362;
    long long v18 = v12;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * j);
        uint64_t v17 = DNDSLogIDSSyncEngine;
        if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          uint64_t v28 = v16;
          _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_DEFAULT, "Forgetting outdated device: %{public}@", buf, 0xCu);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordIDSyncDatesByPairedDeviceIdentifier, "setObject:forKeyedSubscript:", 0, v16, v18, (void)v19);
        [(NSMutableSet *)self->_initialSyncPairedDeviceIdentifiers removeObject:v16];
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v13);
  }
}

- (BOOL)_isPairedDeviceOutdated:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = [(NSMutableDictionary *)self->_recordIDSyncDatesByPairedDeviceIdentifier objectForKeyedSubscript:a3];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = self->_recordMetadataByRecordID;
  uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
    while (2)
    {
      uint64_t v7 = 0;
      uint64_t v18 = v5;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * v7);
        uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_recordMetadataByRecordID, "objectForKeyedSubscript:", v8, v18);
        id v10 = [v4 objectForKeyedSubscript:v8];
        if (!v10)
        {
          [v9 lastModified];
          uint64_t v11 = v6;
          v13 = long long v12 = v4;
          uint64_t v14 = [v13 dateByAddingTimeInterval:self->_deviceObsoletionDuration];
          uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
          uint64_t v16 = [v14 laterDate:v15];

          id v4 = v12;
          uint64_t v6 = v11;
          uint64_t v5 = v18;
          if (v16 == v15)
          {

            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v5;
}

- (void)_forgetObsoleteTombstones
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = self->_recordMetadataByRecordID;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v10 = [(NSMutableDictionary *)self->_recordMetadataByRecordID objectForKeyedSubscript:v9];
        if ([v10 isDeleted]
          && [(DNDSIDSSyncEngineMetadataStore *)self _canTombstoneBeRemovedWithRecordID:v9])
        {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v3;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[DNDSIDSSyncEngineMetadataStore _forgetRecordID:](self, "_forgetRecordID:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)_forgetSyncDatesForRecordID:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v30 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Forgetting sync dates for record: %{public}@", buf, 0xCu);
  }
  uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = self->_recordIDSyncDatesByPairedDeviceIdentifier;
  uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v13 = [(NSMutableDictionary *)self->_recordIDSyncDatesByPairedDeviceIdentifier objectForKeyedSubscript:v12];
        [v13 setObject:0 forKeyedSubscript:v4];
        if (![v13 count]) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordIDSyncDatesByPairedDeviceIdentifier, "setObject:forKeyedSubscript:", 0, *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (void)_forgetMetadataForRecordID:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Forgetting metadata for record: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(NSMutableDictionary *)self->_recordMetadataByRecordID setObject:0 forKeyedSubscript:v4];
}

- (void)_forgetRecordID:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Forgetting record: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(DNDSIDSSyncEngineMetadataStore *)self _forgetSyncDatesForRecordID:v4];
  [(DNDSIDSSyncEngineMetadataStore *)self _forgetMetadataForRecordID:v4];
}

- (BOOL)_canTombstoneBeRemovedWithRecordID:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_recordMetadataByRecordID objectForKeyedSubscript:v4];
  int v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [v5 lastModified];
  uint64_t v8 = [v7 dateByAddingTimeInterval:self->_tombstoneObsoletionDuration];

  uint64_t v9 = [v6 laterDate:v8];

  if (v9 == v6)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = self->_initialSyncPairedDeviceIdentifiers;
    uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      long long v19 = v5;
      uint64_t v14 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = [(NSMutableDictionary *)self->_recordIDSyncDatesByPairedDeviceIdentifier objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          uint64_t v17 = [v16 objectForKeyedSubscript:v4];

          if (!v17)
          {
            BOOL v10 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      BOOL v10 = 1;
LABEL_13:
      uint64_t v5 = v19;
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_isMetadataValidAtDate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->_recordMetadataByRecordID;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_recordMetadataByRecordID, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        id v11 = [v10 lastModified];
        id v12 = [v11 earlierDate:v4];

        if (v12 == v4)
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)_areSyncDatesValidAtDate:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v20 = self;
  obuint64_t j = self->_recordIDSyncDatesByPairedDeviceIdentifier;
  uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    char v19 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [(NSMutableDictionary *)v20->_recordIDSyncDatesByPairedDeviceIdentifier objectForKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = [v10 objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * j)];
              id v16 = [v15 earlierDate:v4];

              if (v16 == v4)
              {
                char v19 = 0;
                goto LABEL_16;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }
  else
  {
    char v19 = 1;
  }

  return v19 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_initialSyncPairedDeviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_recordIDSyncDatesByPairedDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_recordMetadataByRecordID, 0);
}

@end