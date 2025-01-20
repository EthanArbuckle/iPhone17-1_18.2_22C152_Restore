@interface BLTPBProtobuf
- (BLTPBProtobuf)initWithIDSProtobuf:(id)a3 sequenceNumberManager:(id)a4;
- (BLTPBProtobuf)initWithProtobuf:(id)a3 type:(unsigned __int16)a4 isResponse:(BOOL)a5 sequenceNumberManager:(id)a6;
- (IDSProtobuf)idsProtobuf;
- (PBCodable)protobuf;
- (int64_t)sequenceNumberError;
- (unint64_t)sessionState;
- (void)setIdsProtobuf:(id)a3;
- (void)setProtobuf:(id)a3;
@end

@implementation BLTPBProtobuf

- (BLTPBProtobuf)initWithProtobuf:(id)a3 type:(unsigned __int16)a4 isResponse:(BOOL)a5 sequenceNumberManager:(id)a6
{
  unsigned int v43 = a4;
  BOOL v44 = a5;
  id v7 = a3;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a6;
  id v10 = objc_alloc_init(MEMORY[0x263F62230]);
  [v8 writeTo:v10];
  v11 = [v10 data];
  if (!v11)
  {
    v12 = blt_ids_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[BLTPBProtobuf initWithProtobuf:type:isResponse:sequenceNumberManager:]((uint64_t)v8, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  v19 = +[BLTPBTransportData transportDataWithSequenceNumberManager:v9];
  if (BLTIsDebugOrInternalBuild())
  {
    [v11 MD5:buf];
    v20 = [MEMORY[0x263EFF8F8] dataWithBytes:buf length:16];
    [v19 setMd5:v20];
  }
  v21 = [v19 data];
  unint64_t v22 = [v21 length];

  __int16 v46 = v22;
  unint64_t v23 = v22 >> 16;
  if (v22 >> 16)
  {
    __int16 v46 = 0;
  }
  else
  {
    v24 = [v19 data];
    [v11 appendData:v24];
  }
  [v11 appendBytes:&v46 length:2];
  v25 = blt_ids_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    id v26 = [v9 serviceName];
    if (v23)
    {
      v32 = @"not added";
    }
    else
    {
      v38 = NSString;
      id v39 = v7;
      uint64_t v27 = [v19 sequenceNumber];
      v41 = [v9 currentSessionIdentifier];
      [v41 UUIDString];
      v29 = id v28 = v8;
      int v30 = [v19 sessionState];
      v31 = "startAck";
      if (v30 == 1) {
        v31 = "start";
      }
      if (!v30) {
        v31 = "normal";
      }
      v40 = (void *)v29;
      uint64_t v36 = v27;
      uint64_t v37 = v29;
      id v8 = v28;
      id v7 = v39;
      v32 = [v38 stringWithFormat:@"%llu session: %@ state: %s", v36, v37, v31];
    }
    *(_DWORD *)buf = 138412546;
    id v48 = v26;
    __int16 v49 = 2112;
    v50 = v32;
    _os_log_impl(&dword_222F4C000, v25, OS_LOG_TYPE_INFO, "Sequence number attached to outgoing protobuf on service %@: %@", buf, 0x16u);
    if (!v23)
    {
    }
  }

  v45.receiver = self;
  v45.super_class = (Class)BLTPBProtobuf;
  v33 = [(BLTPBProtobuf *)&v45 initWithProtobufData:v11 type:v43 isResponse:v44];
  v34 = v33;
  if (v33) {
    objc_storeStrong((id *)&v33->_protobuf, v7);
  }

  return v34;
}

- (BLTPBProtobuf)initWithIDSProtobuf:(id)a3 sequenceNumberManager:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v17 = blt_ids_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222F4C000, v17, OS_LOG_TYPE_ERROR, "IDSProtobuf is nil", buf, 2u);
    }

    uint64_t v16 = @"BLTPBProtobufNilIDSProtobuf";
    goto LABEL_13;
  }
  id v9 = [v7 data];

  if (!v9)
  {
    uint64_t v18 = blt_ids_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [v7 extendedDescription];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v19;
      _os_log_impl(&dword_222F4C000, v18, OS_LOG_TYPE_ERROR, "IDSProtobuf contains nil data: %@", buf, 0xCu);
    }
    uint64_t v16 = @"BLTPBProtobufNilIDSProtobufData";
    goto LABEL_13;
  }
  id v10 = [v7 data];
  unint64_t v11 = [v10 length];

  if (v11 > 1)
  {
    unint64_t v22 = [v7 data];
    unint64_t v23 = [v22 length] - 2;
    id v24 = v22;
    unint64_t v25 = *(unsigned __int16 *)([v24 bytes] + v23);
    if (v23 < v25)
    {
      id v26 = blt_ids_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = [v7 extendedDescription];
        *(_DWORD *)buf = 134218498;
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v25;
        __int16 v55 = 2112;
        uint64_t v56 = (uint64_t)v27;
        _os_log_impl(&dword_222F4C000, v26, OS_LOG_TYPE_ERROR, "IDSProtobuf transport data length is too big. Message data length: %lu transport data length: %lu protobof: %@", buf, 0x20u);
      }
      _BLTCaptureBug(@"BLTPBProtobufTransportDataLengthTooBig");
      goto LABEL_19;
    }
    id v28 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v24, "bytes"), v23 - v25, 0);
    v53.receiver = self;
    v53.super_class = (Class)BLTPBProtobuf;
    uint64_t v29 = -[BLTPBProtobuf initWithProtobufData:type:isResponse:](&v53, sel_initWithProtobufData_type_isResponse_, v28, [v7 type], objc_msgSend(v7, "isResponse"));

    if (v29)
    {
      int v30 = [v7 context];
      [(BLTPBProtobuf *)v29 setContext:v30];

      objc_storeStrong((id *)&v29->_idsProtobuf, a3);
      if (v25)
      {
        v31 = [v7 transportData];
        v32 = v31;
        if (!v31)
        {

          __int16 v49 = blt_ids_log();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            v50 = [v7 extendedDescription];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v50;
            _os_log_impl(&dword_222F4C000, v49, OS_LOG_TYPE_ERROR, "No transport data.  Protobuf: %@", buf, 0xCu);
          }
          v40 = @"BLTPBProtobufTransportDataDecodeFail";
          goto LABEL_46;
        }
        if ([v31 hasMd5])
        {
          v33 = [(BLTPBProtobuf *)v29 data];
          [v33 MD5:buf];

          id v34 = [v32 md5];
          v35 = (void *)[v34 bytes];
          BOOL v36 = *(void *)buf == *v35 && *(void *)&buf[8] == v35[1];
          BOOL v37 = !v36;

          if (v37)
          {

            v38 = blt_ids_log();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              id v39 = [v7 extendedDescription];
              *(_DWORD *)v59 = 138412290;
              v60 = v39;
              _os_log_impl(&dword_222F4C000, v38, OS_LOG_TYPE_ERROR, "IDSProtobuf contains bad data.  Protobuf: %@", v59, 0xCu);
            }
            v40 = @"BLTPBProtobufTransportDataBad";
LABEL_46:
            _BLTCaptureBug(v40);

            self = 0;
LABEL_19:
            v20 = 0;
LABEL_52:

            goto LABEL_14;
          }
        }
        if ([v32 hasSequenceNumber])
        {
          v29->_unint64_t sessionState = [v32 backwardsCompatibleSessionState];
          v41 = blt_ids_log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v52 = [v8 serviceName];
            uint64_t v42 = [v32 sequenceNumber];
            unsigned int v43 = [v32 sessionUUID];
            uint64_t v44 = [v43 UUIDString];
            objc_super v45 = (void *)v44;
            unint64_t sessionState = v29->_sessionState;
            v47 = "startAck";
            if (sessionState == 1) {
              v47 = "start";
            }
            *(_DWORD *)buf = 138413058;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&uint8_t buf[4] = v52;
            *(void *)&buf[14] = v42;
            if (sessionState) {
              id v48 = v47;
            }
            else {
              id v48 = "normal";
            }
            __int16 v55 = 2112;
            uint64_t v56 = v44;
            __int16 v57 = 2080;
            v58 = v48;
            _os_log_impl(&dword_222F4C000, v41, OS_LOG_TYPE_INFO, "Sequence number attached to incoming protobuf on service %@: %llu session: %@ state: %s", buf, 0x2Au);
          }
          v29->_sequenceNumberError = [v32 setSequenceNumberOnManager:v8];
        }
        else
        {
          uint64_t v51 = blt_ids_log();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_222F4C000, v51, OS_LOG_TYPE_INFO, "Received message without sequence number", buf, 2u);
          }
        }
      }
    }
    self = v29;
    v20 = self;
    goto LABEL_52;
  }
  v12 = blt_ids_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = [v7 data];
    uint64_t v14 = [v13 length];
    uint64_t v15 = [v7 extendedDescription];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    _os_log_impl(&dword_222F4C000, v12, OS_LOG_TYPE_ERROR, "IDSProtobuf missing transport data. Protobuf length: %lu protobof: %@", buf, 0x16u);
  }
  uint64_t v16 = @"BLTPBProtobufMissingTransportData";
LABEL_13:
  _BLTCaptureBug(v16);
  v20 = 0;
LABEL_14:

  return v20;
}

- (PBCodable)protobuf
{
  return self->_protobuf;
}

- (void)setProtobuf:(id)a3
{
}

- (int64_t)sequenceNumberError
{
  return self->_sequenceNumberError;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (IDSProtobuf)idsProtobuf
{
  return self->_idsProtobuf;
}

- (void)setIdsProtobuf:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsProtobuf, 0);
  objc_storeStrong((id *)&self->_protobuf, 0);
}

- (void)initWithProtobuf:(uint64_t)a3 type:(uint64_t)a4 isResponse:(uint64_t)a5 sequenceNumberManager:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end