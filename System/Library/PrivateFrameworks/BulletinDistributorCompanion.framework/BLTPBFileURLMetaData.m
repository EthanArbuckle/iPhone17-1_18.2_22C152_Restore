@interface BLTPBFileURLMetaData
- (BLTPBFileURLMetaData)initWithMetadata:(id)a3 sequenceNumberManager:(id)a4;
- (BLTPBFileURLMetaData)initWithSequenceNumberManager:(id)a3 extraMetadata:(id)a4;
- (NSDictionary)extraMetadata;
- (NSDictionary)metadata;
- (id)transportData;
- (int64_t)sequenceNumberError;
- (unint64_t)sessionState;
@end

@implementation BLTPBFileURLMetaData

- (BLTPBFileURLMetaData)initWithSequenceNumberManager:(id)a3 extraMetadata:(id)a4
{
  v28[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)BLTPBFileURLMetaData;
  v8 = [(BLTPBFileURLMetaData *)&v24 init];
  if (v8)
  {
    v9 = +[BLTPBTransportData transportDataWithSequenceNumberManager:v6];
    v10 = [v9 data];

    if (v7 && v10)
    {
      v27[0] = @"t";
      v27[1] = @"x";
      v28[0] = v10;
      v28[1] = v7;
      v11 = NSDictionary;
      v12 = (void **)v28;
      v13 = (__CFString **)v27;
      uint64_t v14 = 2;
    }
    else
    {
      if (!v10)
      {
        p_super = blt_ids_log();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          -[BLTPBFileURLMetaData initWithSequenceNumberManager:extraMetadata:]((uint64_t)v6, p_super, v18, v19, v20, v21, v22, v23);
        }
        goto LABEL_8;
      }
      v25 = @"t";
      v26 = v10;
      v11 = NSDictionary;
      v12 = &v26;
      v13 = &v25;
      uint64_t v14 = 1;
    }
    uint64_t v15 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:v14];
    p_super = &v8->_metadata->super;
    v8->_metadata = (NSDictionary *)v15;
LABEL_8:

    objc_storeStrong((id *)&v8->_extraMetadata, a4);
  }

  return v8;
}

- (BLTPBFileURLMetaData)initWithMetadata:(id)a3 sequenceNumberManager:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 objectForKeyedSubscript:@"t"];

  if (v9)
  {
    v10 = [BLTPBTransportData alloc];
    v11 = [v7 objectForKeyedSubscript:@"t"];
    v12 = [(BLTPBTransportData *)v10 initWithData:v11];

    if (v12)
    {
      v29.receiver = self;
      v29.super_class = (Class)BLTPBFileURLMetaData;
      v13 = [(BLTPBFileURLMetaData *)&v29 init];
      if (v13)
      {
        uint64_t v14 = [v7 objectForKeyedSubscript:@"x"];
        extraMetadata = v13->_extraMetadata;
        v13->_extraMetadata = (NSDictionary *)v14;

        objc_storeStrong((id *)&v13->_metadata, a3);
        if ([(BLTPBTransportData *)v12 hasSequenceNumber])
        {
          v13->_unint64_t sessionState = [(BLTPBTransportData *)v12 backwardsCompatibleSessionState];
          v16 = blt_ids_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = [v8 serviceName];
            uint64_t v18 = [(BLTPBTransportData *)v12 sequenceNumber];
            uint64_t v19 = [(BLTPBTransportData *)v12 sessionUUID];
            uint64_t v20 = [v19 UUIDString];
            uint64_t v21 = (void *)v20;
            uint64_t v22 = "startAck";
            unint64_t sessionState = v13->_sessionState;
            if (sessionState == 1) {
              uint64_t v22 = "start";
            }
            *(_DWORD *)buf = 138413058;
            __int16 v32 = 2048;
            id v31 = v17;
            uint64_t v33 = v18;
            if (!sessionState) {
              uint64_t v22 = "normal";
            }
            __int16 v34 = 2112;
            uint64_t v35 = v20;
            __int16 v36 = 2080;
            v37 = v22;
            _os_log_impl(&dword_222F4C000, v16, OS_LOG_TYPE_INFO, "Sequence number attached to incoming fileURL on service %@: %llu session: %@ state: %s", buf, 0x2Au);
          }
          v13->_sequenceNumberError = [(BLTPBTransportData *)v12 setSequenceNumberOnManager:v8];
        }
        else
        {
          v27 = blt_ids_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_222F4C000, v27, OS_LOG_TYPE_INFO, "Received message without sequence number", buf, 2u);
          }
        }
      }
      self = v13;
      v25 = self;
    }
    else
    {
      v26 = blt_ids_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v7;
        _os_log_impl(&dword_222F4C000, v26, OS_LOG_TYPE_ERROR, "No transport data. Metadata: %@", buf, 0xCu);
      }

      _BLTCaptureBug(@"BLTPBFileURLMetaDataMissingTransportData");
      v25 = 0;
    }
  }
  else
  {
    objc_super v24 = blt_ids_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v7;
      _os_log_impl(&dword_222F4C000, v24, OS_LOG_TYPE_ERROR, "No transport data. Metadata: %@", buf, 0xCu);
    }

    _BLTCaptureBug(@"BLTPBFileURLMetadataTransportDataKey is nil");
    v25 = 0;
  }

  return v25;
}

- (id)transportData
{
  v3 = [BLTPBTransportData alloc];
  v4 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"t"];
  v5 = [(BLTPBTransportData *)v3 initWithData:v4];

  return v5;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (int64_t)sequenceNumberError
{
  return self->_sequenceNumberError;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (NSDictionary)extraMetadata
{
  return self->_extraMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)initWithSequenceNumberManager:(uint64_t)a3 extraMetadata:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end