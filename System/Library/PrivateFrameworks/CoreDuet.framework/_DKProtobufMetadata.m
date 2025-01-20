@interface _DKProtobufMetadata
+ (id)createFromData:(id)a3;
+ (id)fromPBCodable:(id)a3;
- (NSDictionary)dictionary;
- (_DKProtobufMetadata)initWithDictionary:(id)a3;
- (id)asData;
- (id)toPBCodable;
@end

@implementation _DKProtobufMetadata

- (id)toPBCodable
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(_DKProtobufMetadata *)self dictionary];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v18 = objc_alloc_init(_DKPRMetadata);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v5 = [(_DKProtobufMetadata *)self dictionary];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      v17 = &v24;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
          v11 = [(_DKProtobufMetadata *)self dictionary];
          v12 = [v11 objectForKeyedSubscript:v10];

          v13 = objc_alloc_init(_DKPRMetadataEntry);
          -[_DKPRMetadataEntry setKey:]((uint64_t)v13, v10);
          v14 = [v12 toPBCodable];
          -[_DKPRMetadataEntry setValue:]((uint64_t)v13, v14);

          v15 = -[_DKPRMetadataEntry value]((uint64_t)v13);

          if (v15)
          {
            -[_DKPRMetadata addEntry:]((uint64_t)v18, v13);
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
          {
            [(_DKEvent(Protobuf) *)buf toPBCodableUseStructuredMetadata:v17];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

+ (id)fromPBCodable:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = -[_DKPRMetadata entrys]((uint64_t)v4);
    uint64_t v6 = (_DKProtobufMetadata *)[v5 count];

    if (v6)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F1CA60];
      uint64_t v8 = -[_DKPRMetadata entrys]((uint64_t)v4);
      uint64_t v9 = objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v21 = v4;
      v10 = -[_DKPRMetadata entrys]((uint64_t)v4);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            v16 = (void *)MEMORY[0x1E4FBA8A8];
            v17 = -[_DKPRMetadataEntry value](v15);
            v18 = [v16 fromPBCodable:v17];
            long long v19 = -[_DKPRMetadataEntry key](v15);
            [v9 setObject:v18 forKeyedSubscript:v19];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v12);
      }

      uint64_t v6 = [[_DKProtobufMetadata alloc] initWithDictionary:v9];
      id v4 = v21;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (_DKProtobufMetadata)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DKProtobufMetadata;
  uint64_t v6 = [(_DKProtobufMetadata *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dictionary, a3);
  }

  return v7;
}

+ (id)createFromData:(id)a3
{
  id v3 = a3;
  id v4 = [[_DKPRMetadata alloc] initWithData:v3];

  id v5 = +[_DKProtobufMetadata fromPBCodable:v4];

  return v5;
}

- (id)asData
{
  v2 = [(_DKProtobufMetadata *)self toPBCodable];
  id v3 = [v2 data];

  return v3;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
}

@end