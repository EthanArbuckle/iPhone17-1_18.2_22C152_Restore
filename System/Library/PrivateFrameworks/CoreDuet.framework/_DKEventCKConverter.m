@interface _DKEventCKConverter
- (_DKEventCKConverter)initWithZoneID:(id)a3;
- (id)eventDataFromRecord:(uint64_t)a1;
- (id)eventIDsFromRecordIDsAndTypes:(id)a3;
- (id)eventsFromRecords:(id)a3;
- (id)recordFromEventData:(void *)a3 event:;
- (id)recordIDsFromEventIDs:(id)a3;
- (id)recordsFromEvents:(id)a3;
@end

@implementation _DKEventCKConverter

- (id)recordIDsFromEventIDs:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = objc_alloc(MEMORY[0x1E4F1A2F8]);
        v14 = objc_msgSend(v12, "UUIDString", (void)v17);
        v15 = (void *)[v13 initWithRecordName:v14 zoneID:self->_zoneID];

        if (v15) {
          [v6 addObject:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v6;
}

- (_DKEventCKConverter)initWithZoneID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DKEventCKConverter;
  v6 = [(_DKEventCKConverter *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_zoneID, a3);
  }

  return v7;
}

- (id)eventsFromRecords:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
  context = (void *)MEMORY[0x192FB2F20]();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v42;
    v37 = self;
    v38 = v6;
    uint64_t v39 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x192FB2F20]();
        uint64_t v13 = -[_DKEventCKConverter eventDataFromRecord:]((uint64_t)self, v11);
        v14 = (void *)v13;
        if (v13)
        {
          if (-[_DKEventData version](v13) == 2)
          {
            -[_DKSyncWindow startDate]((uint64_t)v14);
            v15 = (_DKPREvent *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = -[_DKSyncType urgency]((uint64_t)v14);
            if (v16) {
              BOOL v17 = v15 == 0;
            }
            else {
              BOOL v17 = 1;
            }
            if (v17 || ![(_DKPREvent *)v15 length])
            {
              v26 = +[_CDLogging syncChannel];
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                v29 = [(id)objc_opt_class() description];
                v30 = [NSNumber numberWithUnsignedInt:v16];
                v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKPREvent length](v15, "length"));
                *(_DWORD *)buf = 138543874;
                v46 = v29;
                __int16 v47 = 2112;
                v48 = v30;
                __int16 v49 = 2112;
                v50 = v31;
                _os_log_error_impl(&dword_18ECEB000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Dropping event, unexpected uncompressed length of %@ or compressedData length of %@", buf, 0x20u);

                v6 = v38;
              }

              v23 = 0;
            }
            else
            {
              long long v18 = (uint8_t *)malloc_type_malloc(v16 + 32, 0x6C4234E2uLL);
              v15 = v15;
              size_t v19 = compression_decode_buffer(v18, v16 + 32, (const uint8_t *)[(_DKPREvent *)v15 bytes], [(_DKPREvent *)v15 length], 0, COMPRESSION_LZFSE);
              if (v19 == v16)
              {
                uint64_t v20 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v18 length:v16 freeWhenDone:1];
                if (v20)
                {
                  v21 = (void *)v20;
                  uint64_t v22 = [[_DKPREvent alloc] initWithData:v20];
                  v23 = +[_DKEvent fromPBCodable:v22];

                  goto LABEL_24;
                }
              }
              else
              {
                size_t v27 = v19;
                v28 = +[_CDLogging syncChannel];
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  v32 = [(id)objc_opt_class() description];
                  v33 = [NSNumber numberWithUnsignedLong:v27];
                  v34 = [NSNumber numberWithUnsignedInt:v16];
                  *(_DWORD *)buf = 138543874;
                  v46 = v32;
                  __int16 v47 = 2112;
                  v48 = v33;
                  __int16 v49 = 2112;
                  v50 = v34;
                  _os_log_error_impl(&dword_18ECEB000, v28, OS_LOG_TYPE_ERROR, "%{public}@: Dropping event, uncompressed size %@ does not match uncompressed length %@", buf, 0x20u);
                }
                free(v18);
              }
              v23 = 0;
LABEL_24:
              self = v37;
              v6 = v38;
            }
            uint64_t v9 = v39;
          }
          else
          {
            v24 = [_DKPREvent alloc];
            v25 = -[_DKSyncWindow startDate]((uint64_t)v14);
            v15 = [(_DKPREvent *)v24 initWithData:v25];

            v23 = +[_DKEvent fromPBCodable:v15];
          }

          if (v23) {
            [v6 addObject:v23];
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)eventDataFromRecord:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 recordType];
    char v6 = [v5 isEqualToString:@"DKEvent"];

    if (v6)
    {
      uint64_t v7 = [v4 encryptedValuesByKey];
      uint64_t v8 = [v7 objectForKey:@"encryptedEvent"];

      if (v8)
      {
        uint64_t v9 = [[_DKPREventData alloc] initWithData:v8];
        uint64_t v10 = +[_DKEventData fromPBCodable:v9];
        v11 = v10;
        if (v10)
        {
          id v12 = v10;
        }
        else
        {
          uint64_t v13 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[_DKEventCKConverter eventDataFromRecord:]();
          }
        }
      }
      else
      {
        uint64_t v9 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_ERROR)) {
          -[_DKEventCKConverter eventDataFromRecord:]();
        }
        v11 = 0;
      }
    }
    else
    {
      uint64_t v8 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[_DKEventCKConverter eventDataFromRecord:](a1, v4);
      }
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)recordsFromEvents:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  id v31 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
  context = (void *)MEMORY[0x192FB2F20]();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v4;
  uint64_t v34 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v37;
    v30 = self;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v37 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v36 + 1) + 8 * v6);
        uint64_t v8 = (void *)MEMORY[0x192FB2F20]();
        uint64_t v9 = [v7 toPBCodable];
        uint64_t v10 = [v9 data];
        if (v10)
        {
          v35 = v8;
          v11 = +[_CDSizeMetricFamily sizeMetricFamilyWithName:]((uint64_t)_CDSizeMetricFamily, @"Cloud");
          id v12 = -[_CDSizeMetricFamily sizeMetricWithName:string:scale:]((uint64_t)v11, @"bytes to send", 0, 1024);
          CDSizeMetricAddSize((uint64_t)v12, [v10 length]);
          if ((unint64_t)[v10 length] >= 0x401
            && !((unint64_t)[v10 length] >> 13))
          {
            size_t v13 = [v10 length];
            v14 = (uint8_t *)malloc_type_malloc(v13, 0x68BF4A00uLL);
            id v15 = v10;
            size_t v16 = compression_encode_buffer(v14, v13, (const uint8_t *)[v15 bytes], objc_msgSend(v15, "length"), 0, COMPRESSION_LZFSE);
            if (v16 && (size_t v17 = v16, (double)(unint64_t)[v15 length] * 0.75 > (double)v16))
            {
              uint64_t v18 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v14 length:v17 freeWhenDone:1];
              self = v30;
              if (v18)
              {
                size_t v19 = (void *)v18;
                uint64_t v20 = +[_CDLogging syncChannel];
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                {
                  v28 = [(id)objc_opt_class() description];
                  v29 = v20;
                  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "length"));
                  v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "length"));
                  *(_DWORD *)buf = 138543874;
                  long long v41 = v28;
                  __int16 v42 = 2112;
                  long long v43 = v24;
                  __int16 v44 = 2112;
                  v45 = v25;
                  _os_log_debug_impl(&dword_18ECEB000, v29, OS_LOG_TYPE_DEBUG, "%{public}@: Event compressed to %@ (from %@)", buf, 0x20u);

                  uint64_t v20 = v29;
                }

                v21 = -[_CDSizeMetricFamily sizeMetricWithName:string:scale:]((uint64_t)v11, @"compressed bytes sent", 0, 1024);
                CDSizeMetricAddSize((uint64_t)v21, [v19 length]);
                uint64_t v22 = -[_DKEventData initWithCompressedData:uncompressedLength:version:]((id *)[_DKEventData alloc], v19, (void *)[v15 length], (void *)2);

                self = v30;
                goto LABEL_17;
              }
            }
            else
            {
              free(v14);
              self = v30;
            }
          }
          size_t v19 = -[_CDSizeMetricFamily sizeMetricWithName:string:scale:]((uint64_t)v11, @"uncompressed bytes sent", 0, 1024);
          CDSizeMetricAddSize((uint64_t)v19, [v10 length]);
          uint64_t v22 = -[_DKEventData initWithData:version:]((id *)[_DKEventData alloc], v10, (void *)1);
LABEL_17:

          v23 = -[_DKEventCKConverter recordFromEventData:event:]((uint64_t)self, v22, v7);
          if (v23) {
            [v31 addObject:v23];
          }

          uint64_t v8 = v35;
        }

        ++v6;
      }
      while (v34 != v6);
      uint64_t v34 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v34);
  }

  return v31;
}

- (id)recordFromEventData:(void *)a3 event:
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = -[_DKEventData asData](a2);
    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F1A2F8]);
      uint64_t v8 = [v5 UUID];
      uint64_t v9 = [v8 UUIDString];
      uint64_t v10 = [v7 initWithRecordName:v9 zoneID:*(void *)(a1 + 8)];

      v11 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"DKEvent" recordID:v10];
      id v12 = [v11 encryptedValuesByKey];
      [v12 setObject:v6 forKey:@"encryptedEvent"];

      size_t v13 = [v5 creationDate];

      if (v13)
      {
        v14 = [v5 creationDate];
        [v11 setObject:v14 forKey:@"eventCreationDate"];
      }
      else
      {
        id v15 = [MEMORY[0x1E4F1C9C8] date];
        [v11 setObject:v15 forKey:@"eventCreationDate"];

        size_t v16 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[_DKEventCKConverter recordFromEventData:event:](a1, v5, v16);
        }
      }
      size_t v17 = [v5 stream];
      uint64_t v18 = [v17 name];
      [v11 setObject:v18 forKey:@"streamName"];
    }
    else
    {
      uint64_t v10 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_DKEventCKConverter recordFromEventData:event:]();
      }
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)eventIDsFromRecordIDsAndTypes:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 count];
  id v25 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v40 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v27;
    unint64_t v10 = 0x1E4F29000uLL;
    *(void *)&long long v7 = 138544386;
    long long v19 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        size_t v13 = objc_msgSend(v5, "objectForKeyedSubscript:", v12, v19);
        if ([v13 isEqualToString:@"DKEvent"])
        {
          v14 = [v12 recordName];
          id v15 = (void *)[objc_alloc(*(Class *)(v10 + 296)) initWithUUIDString:v14];
          if (v15)
          {
            [v25 addObject:v15];
          }
          else
          {
            size_t v16 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v24 = [(id)objc_opt_class() description];
              v23 = [v12 recordName];
              v21 = [v12 zoneID];
              uint64_t v22 = [v21 zoneName];
              uint64_t v20 = [v12 zoneID];
              size_t v17 = [v20 ownerName];
              *(_DWORD *)buf = v19;
              id v31 = v24;
              __int16 v32 = 2114;
              uint64_t v33 = @"DKEvent";
              __int16 v34 = 2114;
              v35 = v23;
              __int16 v36 = 2114;
              long long v37 = v22;
              __int16 v38 = 2114;
              long long v39 = v17;
              _os_log_error_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_ERROR, "%{public}@: CKRecordID of type %{public}@ has an invalid UUIDString recordName:%{public}@ (zoneName:%{public}@ ownerName:%{public}@)", buf, 0x34u);
            }
            unint64_t v10 = 0x1E4F29000;
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v26 objects:v40 count:16];
    }
    while (v8);
  }

  return v25;
}

- (void).cxx_destruct
{
}

- (void)eventDataFromRecord:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "%{public}@: Dropping event record: Missing value '%@'", v3, v4, v5, v6, 2u);
}

- (void)eventDataFromRecord:.cold.2()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_9(&dword_18ECEB000, v1, v2, "%{public}@: Dropping event record: Unable to decode event", v3, v4, v5, v6, 2u);
}

- (void)eventDataFromRecord:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  uint64_t v3 = [(id)objc_opt_class() description];
  unint64_t v10 = [a2 recordType];
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v4, v5, "%{public}@: Dropping event record: Unexpected record type: %{public}@", v6, v7, v8, v9, 2u);
}

- (void)recordFromEventData:event:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_9(&dword_18ECEB000, v1, v2, "%{public}@: Dropping event: Unable to encode event", v3, v4, v5, v6, 2u);
}

- (void)recordFromEventData:(NSObject *)a3 event:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(id)objc_opt_class() description];
  uint64_t v6 = [a2 UUID];
  uint64_t v7 = [v6 UUIDString];
  uint64_t v8 = [a2 creationDate];
  uint64_t v9 = -[NSDate dk_localtimeString](v8);
  int v10 = 138543874;
  v11 = v5;
  __int16 v12 = 2114;
  size_t v13 = v7;
  __int16 v14 = 2114;
  id v15 = v9;
  _os_log_error_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Faking creation date on event %{public}@ (created %{public}@)", (uint8_t *)&v10, 0x20u);
}

@end