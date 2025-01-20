@interface NFCISO15693ReaderSessionTag
+ (BOOL)decodeIdentifier:(id)a3 manufacturerCode:(unint64_t *)a4 serialNumber:(id *)a5;
+ (id)reverseByteOrder:(id)a3;
- (BOOL)_transceiveWithData:(id)a3 receivedData:(id *)a4 commandConfig:(id)a5 error:(id *)a6;
- (NSData)icSerialNumber;
- (NSData)identifier;
- (id)_parseResponseData:(id)a3 outError:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_parseResponseErrorWithData:(id)a3;
- (unint64_t)icManufacturerCode;
- (void)authenticateWithRequestFlags:(unsigned __int8)a3 cryptoSuiteIdentifier:(int64_t)a4 message:(id)a5 completionHandler:(id)a6;
- (void)challengeWithRequestFlags:(unsigned __int8)a3 cryptoSuiteIdentifier:(int64_t)a4 message:(id)a5 completionHandler:(id)a6;
- (void)customCommandWithRequestFlag:(unsigned __int8)a3 customCommandCode:(int64_t)a4 customRequestParameters:(id)a5 completionHandler:(id)a6;
- (void)extendedFastReadMultipleBlocksWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5;
- (void)extendedGetMultipleBlockSecurityStatusWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5;
- (void)extendedLockBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(int64_t)a4 completionHandler:(id)a5;
- (void)extendedReadMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5;
- (void)extendedReadSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(int64_t)a4 completionHandler:(id)a5;
- (void)extendedWriteMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 dataBlocks:(id)a5 completionHandler:(id)a6;
- (void)extendedWriteSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(int64_t)a4 dataBlock:(id)a5 completionHandler:(id)a6;
- (void)fastReadMultipleBlocksWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5;
- (void)getMultipleBlockSecurityStatusWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5;
- (void)getSystemInfoAndUIDWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4;
- (void)getSystemInfoWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4;
- (void)keyUpdateWithRequestFlags:(unsigned __int8)a3 keyIdentifier:(int64_t)a4 message:(id)a5 completionHandler:(id)a6;
- (void)lockAFIWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4;
- (void)lockBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(unsigned __int8)a4 completionHandler:(id)a5;
- (void)lockDFSIDWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4;
- (void)lockDSFIDWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4;
- (void)readBufferWithRequestFlags:(unsigned __int8)a3 completionHandler:(id)a4;
- (void)readMultipleBlocksWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)readMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5;
- (void)readSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(unsigned __int8)a4 completionHandler:(id)a5;
- (void)resetToReadyWithRequestFlags:(unsigned __int8)a3 completionHandler:(id)a4;
- (void)selectWithRequestFlags:(unsigned __int8)a3 completionHandler:(id)a4;
- (void)sendCustomCommandWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)sendRequestWithFlag:(int64_t)a3 commandCode:(int64_t)a4 data:(id)a5 completionHandler:(id)a6;
- (void)stayQuietWithCompletionHandler:(id)a3;
- (void)writeAFIWithRequestFlag:(unsigned __int8)a3 afi:(unsigned __int8)a4 completionHandler:(id)a5;
- (void)writeDSFIDWithRequestFlag:(unsigned __int8)a3 dsfid:(unsigned __int8)a4 completionHandler:(id)a5;
- (void)writeMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 dataBlocks:(id)a5 completionHandler:(id)a6;
- (void)writeSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(unsigned __int8)a4 dataBlock:(id)a5 completionHandler:(id)a6;
@end

@implementation NFCISO15693ReaderSessionTag

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NFCISO15693ReaderSessionTag;
  return [(NFCTag *)&v4 copyWithZone:a3];
}

- (BOOL)_transceiveWithData:(id)a3 receivedData:(id *)a4 commandConfig:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  unint64_t v12 = [v11 maximumRetries];
  if (v12 <= +[NFCTag _MaxRetry]
    && ([v11 retryInterval],
        double v14 = v13,
        +[NFCTag _MaxRetryInterval],
        v14 <= v15)
    && ([v11 retryInterval], v16 >= 0.0))
  {
    unint64_t v18 = [v11 maximumRetries];
    v25 = [(NFCTag *)self _getInternalReaderSession];
    if (v25)
    {
      unint64_t v19 = 0;
      id v20 = 0;
      unint64_t v21 = v18 + 1;
      if (v18 != -1)
      {
        while (1)
        {
          v22 = v20;
          id v26 = v20;
          -[NFCTag _transceiveWithSession:sendData:receivedData:error:](self, "_transceiveWithSession:sendData:receivedData:error:", v25, v10, a4, &v26, v25);
          id v20 = v26;

          if (a6) {
            *a6 = v20;
          }
          if (!v20 || [v20 code] == 202) {
            break;
          }
          if (v19 < v18)
          {
            [v11 retryInterval];
            usleep((v23 * 1000000.0));
          }
          if (v21 == ++v19)
          {
            unint64_t v19 = v18 + 1;
            break;
          }
        }
      }
      if (a6 && v19 == v21)
      {
        *a6 = +[NFCError errorWithCode:101];
      }
      BOOL v17 = v20 == 0;
    }
    else if (a6)
    {
      +[NFCError errorWithCode:103];
      BOOL v17 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else if (a6)
  {
    +[NFCError errorWithCode:300];
    BOOL v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (unint64_t)_parseResponseErrorWithData:(id)a3
{
  v3 = (unsigned char *)[a3 bytes];
  if (*v3) {
    return v3[1];
  }
  else {
    return 0;
  }
}

+ (id)reverseByteOrder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 bytes];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithCapacity:", objc_msgSend(v3, "length"));
  uint64_t v6 = [v3 length];
  if (v6 - 1 >= 0)
  {
    uint64_t v7 = v6;
    uint64_t v8 = v4 - 1;
    do
      [v5 appendBytes:v8 + v7-- length:1];
    while (v7);
  }

  return v5;
}

+ (BOOL)decodeIdentifier:(id)a3 manufacturerCode:(unint64_t *)a4 serialNumber:(id *)a5
{
  id v9 = a3;
  if ([v9 length] != 8)
  {
    unint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"NFCISO15693ReaderSessionTag.m" lineNumber:242 description:@"Invalid UID length"];
  }
  uint64_t v10 = [v9 length];
  if (v10 == 8)
  {
    if (a4) {
      *a4 = *(unsigned __int8 *)([v9 bytes] + 1);
    }
    if (a5)
    {
      objc_msgSend(v9, "subdataWithRange:", 2, 6);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v10 == 8;
}

- (NSData)identifier
{
  v5.receiver = self;
  v5.super_class = (Class)NFCISO15693ReaderSessionTag;
  v2 = [(NFCTag *)&v5 identifier];
  id v3 = +[NFCISO15693ReaderSessionTag reverseByteOrder:v2];

  return (NSData *)v3;
}

- (unint64_t)icManufacturerCode
{
  unint64_t v5 = 0;
  v2 = [(NFCISO15693ReaderSessionTag *)self identifier];
  BOOL v3 = +[NFCISO15693ReaderSessionTag decodeIdentifier:v2 manufacturerCode:&v5 serialNumber:0];

  if (v3) {
    return v5;
  }
  else {
    return 0;
  }
}

- (NSData)icSerialNumber
{
  v2 = [(NFCISO15693ReaderSessionTag *)self identifier];
  id v8 = 0;
  BOOL v3 = +[NFCISO15693ReaderSessionTag decodeIdentifier:v2 manufacturerCode:0 serialNumber:&v8];
  id v4 = v8;

  if (v3) {
    id v5 = v4;
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  uint64_t v6 = v5;

  return (NSData *)v6;
}

- (id)_parseResponseData:(id)a3 outError:(id *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = [(NFCISO15693ReaderSessionTag *)self _parseResponseErrorWithData:v6];
  if (v7)
  {
    if (a4)
    {
      double v13 = @"ISO15693TagResponseErrorCode";
      id v8 = [NSNumber numberWithUnsignedInteger:v7];
      v14[0] = v8;
      id v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
      *a4 = +[NFCError errorWithCode:102 userInfo:v9];
    }
    uint64_t v10 = objc_opt_new();
  }
  else
  {
    if (a4) {
      *a4 = 0;
    }
    uint64_t v10 = objc_msgSend(v6, "subdataWithRange:", 1, objc_msgSend(v6, "length") - 1);
  }
  id v11 = (void *)v10;

  return v11;
}

- (void)sendCustomCommandWithConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = _os_activity_create(&dword_2214B8000, "NFCISO15693ReaderSessionTag sendCustomCommandWithConfiguration:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v9, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v15 = 45;
    if (isMetaClass) {
      uint64_t v15 = 43;
    }
    v11(6, "%c[%{public}s %{public}s]:%i ", v15, ClassName, Name, 303);
  }
  double v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v17 = object_getClass(self);
    if (class_isMetaClass(v17)) {
      int v18 = 43;
    }
    else {
      int v18 = 45;
    }
    unint64_t v19 = object_getClassName(self);
    id v20 = sel_getName(a2);
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v18;
    *(_WORD *)&state[8] = 2082;
    *(void *)&state[10] = v19;
    __int16 v71 = 2082;
    v72 = v20;
    __int16 v73 = 1024;
    int v74 = 303;
    _os_log_impl(&dword_2214B8000, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", state, 0x22u);
  }

  id v69 = 0;
  unint64_t v21 = [v7 asNSDataWithError:&v69];
  id v22 = v69;
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = NFLogGetLogger();
    if (v24)
    {
      v25 = (void (*)(uint64_t, const char *, ...))v24;
      id v26 = object_getClass(self);
      BOOL v27 = class_isMetaClass(v26);
      v56 = object_getClassName(self);
      v59 = sel_getName(a2);
      uint64_t v28 = 45;
      if (v27) {
        uint64_t v28 = 43;
      }
      v25(3, "%c[%{public}s %{public}s]:%i %@ in commandConfiguration asNSDataWithError", v28, v56, v59, 320, v23);
    }
    v29 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = object_getClass(self);
      if (class_isMetaClass(v30)) {
        int v31 = 43;
      }
      else {
        int v31 = 45;
      }
      v32 = object_getClassName(self);
      v33 = sel_getName(a2);
      *(_DWORD *)state = 67110146;
      *(_DWORD *)&state[4] = v31;
      *(_WORD *)&state[8] = 2082;
      *(void *)&state[10] = v32;
      __int16 v71 = 2082;
      v72 = v33;
      __int16 v73 = 1024;
      int v74 = 320;
      __int16 v75 = 2112;
      id v76 = v23;
      _os_log_impl(&dword_2214B8000, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@ in commandConfiguration asNSDataWithError", state, 0x2Cu);
    }

    v34 = 0;
    id v35 = 0;
  }
  else
  {
    id v67 = 0;
    id v68 = 0;
    [(NFCISO15693ReaderSessionTag *)self _transceiveWithData:v21 receivedData:&v68 commandConfig:v7 error:&v67];
    id v35 = v68;
    id v36 = v67;
    if (v36 || (unint64_t)[v35 length] < 2)
    {
      sel = a2;
      id v23 = +[NFCError errorWithCode:100];

      uint64_t v37 = NFLogGetLogger();
      if (v37)
      {
        v38 = (void (*)(uint64_t, const char *, ...))v37;
        v39 = object_getClass(self);
        BOOL v40 = class_isMetaClass(v39);
        id v41 = v7;
        v42 = v21;
        id v43 = v8;
        v44 = object_getClassName(self);
        v45 = sel_getName(sel);
        uint64_t v60 = [v35 length];
        uint64_t v46 = 45;
        if (v40) {
          uint64_t v46 = 43;
        }
        v57 = v44;
        id v8 = v43;
        unint64_t v21 = v42;
        id v7 = v41;
        v38(3, "%c[%{public}s %{public}s]:%i %@ with response length = %lu", v46, v57, v45, 316, v23, v60);
      }
      v47 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = object_getClass(self);
        if (class_isMetaClass(v48)) {
          int v49 = 43;
        }
        else {
          int v49 = 45;
        }
        v50 = object_getClassName(self);
        v51 = sel_getName(sel);
        uint64_t v52 = [v35 length];
        *(_DWORD *)state = 67110402;
        *(_DWORD *)&state[4] = v49;
        *(_WORD *)&state[8] = 2082;
        *(void *)&state[10] = v50;
        __int16 v71 = 2082;
        v72 = v51;
        __int16 v73 = 1024;
        int v74 = 316;
        __int16 v75 = 2112;
        id v76 = v23;
        __int16 v77 = 2048;
        uint64_t v78 = v52;
        _os_log_impl(&dword_2214B8000, v47, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@ with response length = %lu", state, 0x36u);
      }

      v34 = 0;
    }
    else
    {
      id v66 = 0;
      v34 = [(NFCISO15693ReaderSessionTag *)self _parseResponseData:v35 outError:&v66];
      id v23 = v66;
    }
  }
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __84__NFCISO15693ReaderSessionTag_sendCustomCommandWithConfiguration_completionHandler___block_invoke;
  v62[3] = &unk_2645B4330;
  id v64 = v23;
  id v65 = v8;
  id v63 = v34;
  id v53 = v23;
  id v54 = v34;
  id v55 = v8;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v62];
}

uint64_t __84__NFCISO15693ReaderSessionTag_sendCustomCommandWithConfiguration_completionHandler___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)readMultipleBlocksWithConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = _os_activity_create(&dword_2214B8000, "NFCISO15693ReaderSessionTag readMultipleBlocksWithConfiguration:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v9, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  uint64_t v10 = objc_opt_new();
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    unint64_t v12 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v16 = 45;
    if (isMetaClass) {
      uint64_t v16 = 43;
    }
    v12(6, "%c[%{public}s %{public}s]:%i ", v16, ClassName, Name, 336);
  }
  BOOL v17 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = object_getClass(self);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    id v20 = object_getClassName(self);
    unint64_t v21 = sel_getName(a2);
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v19;
    *(_WORD *)&state[8] = 2082;
    *(void *)&state[10] = v20;
    __int16 v82 = 2082;
    v83 = v21;
    __int16 v84 = 1024;
    int v85 = 336;
    _os_log_impl(&dword_2214B8000, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", state, 0x22u);
  }

  v80.receiver = self;
  v80.super_class = (Class)NFCISO15693ReaderSessionTag;
  id v22 = [(NFCTag *)&v80 identifier];
  id v79 = 0;
  id v23 = [v7 asNSDataArrayWithUID:v22 error:&v79];
  id v24 = v79;

  id v68 = v7;
  if (v24)
  {
    uint64_t v25 = NFLogGetLogger();
    if (v25)
    {
      id v26 = (void (*)(uint64_t, const char *, ...))v25;
      BOOL v27 = object_getClass(self);
      BOOL v28 = class_isMetaClass(v27);
      v59 = object_getClassName(self);
      v62 = sel_getName(a2);
      uint64_t v29 = 45;
      if (v28) {
        uint64_t v29 = 43;
      }
      v26(3, "%c[%{public}s %{public}s]:%i %@ in readConfiguration asNSDataArrayWithUID", v29, v59, v62, 366, v24);
    }
    v30 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      int v31 = object_getClass(self);
      v32 = v23;
      if (class_isMetaClass(v31)) {
        int v33 = 43;
      }
      else {
        int v33 = 45;
      }
      v34 = object_getClassName(self);
      id v35 = sel_getName(a2);
      *(_DWORD *)state = 67110146;
      *(_DWORD *)&state[4] = v33;
      id v23 = v32;
      *(_WORD *)&state[8] = 2082;
      *(void *)&state[10] = v34;
      __int16 v82 = 2082;
      v83 = v35;
      __int16 v84 = 1024;
      int v85 = 366;
      __int16 v86 = 2112;
      id v87 = v24;
      _os_log_impl(&dword_2214B8000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@ in readConfiguration asNSDataArrayWithUID", state, 0x2Cu);
    }
  }
  else
  {
    sel = a2;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v30 = v23;
    uint64_t v36 = [v30 countByEnumeratingWithState:&v75 objects:v90 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      id v64 = v23;
      id v65 = v8;
      id v67 = v10;
      uint64_t v38 = *(void *)v76;
      while (2)
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v76 != v38) {
            objc_enumerationMutation(v30);
          }
          uint64_t v40 = *(void *)(*((void *)&v75 + 1) + 8 * i);
          id v73 = 0;
          id v74 = 0;
          [(NFCISO15693ReaderSessionTag *)self _transceiveWithData:v40 receivedData:&v74 commandConfig:v7 error:&v73];
          id v41 = v74;
          id v24 = v73;
          if ((unint64_t)[v41 length] >= 2)
          {
            unint64_t v42 = [(NFCISO15693ReaderSessionTag *)self _parseResponseErrorWithData:v41];
            if (v42)
            {
              v88 = @"ISO15693TagResponseErrorCode";
              id v43 = [NSNumber numberWithUnsignedInteger:v42];
              v89 = v43;
              v44 = [NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
              uint64_t v45 = +[NFCError errorWithCode:102 userInfo:v44];

              id v7 = v68;
              id v24 = (id)v45;
            }
            else
            {
              id v43 = objc_msgSend(v41, "subdataWithRange:", 1, objc_msgSend(v41, "length") - 1);
              [v67 appendData:v43];
            }
          }
          if (v24)
          {
            uint64_t v46 = NFLogGetLogger();
            if (v46)
            {
              v47 = (void (*)(uint64_t, const char *, ...))v46;
              v48 = object_getClass(self);
              BOOL v49 = class_isMetaClass(v48);
              uint64_t v60 = object_getClassName(self);
              id v63 = sel_getName(sel);
              uint64_t v50 = 45;
              if (v49) {
                uint64_t v50 = 43;
              }
              v47(3, "%c[%{public}s %{public}s]:%i %@", v50, v60, v63, 360, v24);
            }
            v51 = NFSharedLogGetLogger();
            uint64_t v10 = v67;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              uint64_t v52 = object_getClass(self);
              if (class_isMetaClass(v52)) {
                int v53 = 43;
              }
              else {
                int v53 = 45;
              }
              id v54 = object_getClassName(self);
              id v55 = sel_getName(sel);
              *(_DWORD *)state = 67110146;
              *(_DWORD *)&state[4] = v53;
              *(_WORD *)&state[8] = 2082;
              *(void *)&state[10] = v54;
              __int16 v82 = 2082;
              v83 = v55;
              __int16 v84 = 1024;
              int v85 = 360;
              __int16 v86 = 2112;
              id v87 = v24;
              _os_log_impl(&dword_2214B8000, v51, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", state, 0x2Cu);
            }

            id v23 = v64;
            id v8 = v65;
            goto LABEL_45;
          }
        }
        uint64_t v37 = [v30 countByEnumeratingWithState:&v75 objects:v90 count:16];
        if (v37) {
          continue;
        }
        break;
      }
      id v24 = 0;
      id v23 = v64;
      id v8 = v65;
      uint64_t v10 = v67;
    }
    else
    {
      id v24 = 0;
    }
  }
LABEL_45:

  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __85__NFCISO15693ReaderSessionTag_readMultipleBlocksWithConfiguration_completionHandler___block_invoke;
  v69[3] = &unk_2645B4330;
  id v71 = v24;
  id v72 = v8;
  id v70 = v10;
  id v56 = v24;
  id v57 = v10;
  id v58 = v8;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v69];
}

void __85__NFCISO15693ReaderSessionTag_readMultipleBlocksWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

- (void)stayQuietWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__NFCISO15693ReaderSessionTag_stayQuietWithCompletionHandler___block_invoke;
  v6[3] = &unk_2645B4308;
  id v7 = v4;
  id v5 = v4;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v6];
}

void __62__NFCISO15693ReaderSessionTag_stayQuietWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)readSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(unsigned __int8)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __93__NFCISO15693ReaderSessionTag_readSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke;
  v8[3] = &unk_2645B4308;
  id v9 = v6;
  id v7 = v6;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v8];
}

void __93__NFCISO15693ReaderSessionTag_readSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)objc_opt_new();
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);
}

- (void)writeSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(unsigned __int8)a4 dataBlock:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __104__NFCISO15693ReaderSessionTag_writeSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke;
  v9[3] = &unk_2645B4308;
  id v10 = v7;
  id v8 = v7;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v9];
}

void __104__NFCISO15693ReaderSessionTag_writeSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)lockBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(unsigned __int8)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __87__NFCISO15693ReaderSessionTag_lockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke;
  v8[3] = &unk_2645B4308;
  id v9 = v6;
  id v7 = v6;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v8];
}

void __87__NFCISO15693ReaderSessionTag_lockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)readMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __95__NFCISO15693ReaderSessionTag_readMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke;
  v8[3] = &unk_2645B4308;
  id v9 = v6;
  id v7 = v6;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v8];
}

void __95__NFCISO15693ReaderSessionTag_readMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)objc_opt_new();
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);
}

- (void)writeMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 dataBlocks:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __107__NFCISO15693ReaderSessionTag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke;
  v9[3] = &unk_2645B4308;
  id v10 = v7;
  id v8 = v7;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v9];
}

void __107__NFCISO15693ReaderSessionTag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)selectWithRequestFlags:(unsigned __int8)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__NFCISO15693ReaderSessionTag_selectWithRequestFlags_completionHandler___block_invoke;
  v7[3] = &unk_2645B4308;
  id v8 = v5;
  id v6 = v5;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v7];
}

void __72__NFCISO15693ReaderSessionTag_selectWithRequestFlags_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)resetToReadyWithRequestFlags:(unsigned __int8)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__NFCISO15693ReaderSessionTag_resetToReadyWithRequestFlags_completionHandler___block_invoke;
  v7[3] = &unk_2645B4308;
  id v8 = v5;
  id v6 = v5;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v7];
}

void __78__NFCISO15693ReaderSessionTag_resetToReadyWithRequestFlags_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)writeAFIWithRequestFlag:(unsigned __int8)a3 afi:(unsigned __int8)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__NFCISO15693ReaderSessionTag_writeAFIWithRequestFlag_afi_completionHandler___block_invoke;
  v8[3] = &unk_2645B4308;
  id v9 = v6;
  id v7 = v6;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v8];
}

void __77__NFCISO15693ReaderSessionTag_writeAFIWithRequestFlag_afi_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)lockAFIWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__NFCISO15693ReaderSessionTag_lockAFIWithRequestFlag_completionHandler___block_invoke;
  v7[3] = &unk_2645B4308;
  id v8 = v5;
  id v6 = v5;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v7];
}

void __72__NFCISO15693ReaderSessionTag_lockAFIWithRequestFlag_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)writeDSFIDWithRequestFlag:(unsigned __int8)a3 dsfid:(unsigned __int8)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__NFCISO15693ReaderSessionTag_writeDSFIDWithRequestFlag_dsfid_completionHandler___block_invoke;
  v8[3] = &unk_2645B4308;
  id v9 = v6;
  id v7 = v6;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v8];
}

void __81__NFCISO15693ReaderSessionTag_writeDSFIDWithRequestFlag_dsfid_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)lockDFSIDWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__NFCISO15693ReaderSessionTag_lockDFSIDWithRequestFlag_completionHandler___block_invoke;
  v7[3] = &unk_2645B4308;
  id v8 = v5;
  id v6 = v5;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v7];
}

void __74__NFCISO15693ReaderSessionTag_lockDFSIDWithRequestFlag_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)lockDSFIDWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__NFCISO15693ReaderSessionTag_lockDSFIDWithRequestFlag_completionHandler___block_invoke;
  v7[3] = &unk_2645B4308;
  id v8 = v5;
  id v6 = v5;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v7];
}

void __74__NFCISO15693ReaderSessionTag_lockDSFIDWithRequestFlag_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)getSystemInfoWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__NFCISO15693ReaderSessionTag_getSystemInfoWithRequestFlag_completionHandler___block_invoke;
  v7[3] = &unk_2645B4308;
  id v8 = v5;
  id v6 = v5;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v7];
}

void __78__NFCISO15693ReaderSessionTag_getSystemInfoWithRequestFlag_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))(v1 + 16))(v1, -1, -1, -1, -1, -1, v2);
}

- (void)getSystemInfoAndUIDWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__NFCISO15693ReaderSessionTag_getSystemInfoAndUIDWithRequestFlag_completionHandler___block_invoke;
  v7[3] = &unk_2645B4308;
  id v8 = v5;
  id v6 = v5;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v7];
}

void __84__NFCISO15693ReaderSessionTag_getSystemInfoAndUIDWithRequestFlag_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))(v1 + 16))(v1, 0, -1, -1, -1, -1, -1, v2);
}

- (void)getMultipleBlockSecurityStatusWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __106__NFCISO15693ReaderSessionTag_getMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke;
  v8[3] = &unk_2645B4308;
  id v9 = v6;
  id v7 = v6;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v8];
}

void __106__NFCISO15693ReaderSessionTag_getMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)objc_opt_new();
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);
}

- (void)fastReadMultipleBlocksWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __98__NFCISO15693ReaderSessionTag_fastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke;
  v8[3] = &unk_2645B4308;
  id v9 = v6;
  id v7 = v6;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v8];
}

void __98__NFCISO15693ReaderSessionTag_fastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)objc_opt_new();
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);
}

- (void)customCommandWithRequestFlag:(unsigned __int8)a3 customCommandCode:(int64_t)a4 customRequestParameters:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __120__NFCISO15693ReaderSessionTag_customCommandWithRequestFlag_customCommandCode_customRequestParameters_completionHandler___block_invoke;
  v9[3] = &unk_2645B4308;
  id v10 = v7;
  id v8 = v7;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v9];
}

void __120__NFCISO15693ReaderSessionTag_customCommandWithRequestFlag_customCommandCode_customRequestParameters_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)objc_opt_new();
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);
}

- (void)extendedReadSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(int64_t)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __101__NFCISO15693ReaderSessionTag_extendedReadSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke;
  v8[3] = &unk_2645B4308;
  id v9 = v6;
  id v7 = v6;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v8];
}

void __101__NFCISO15693ReaderSessionTag_extendedReadSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)objc_opt_new();
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);
}

- (void)extendedWriteSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(int64_t)a4 dataBlock:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __112__NFCISO15693ReaderSessionTag_extendedWriteSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke;
  v9[3] = &unk_2645B4308;
  id v10 = v7;
  id v8 = v7;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v9];
}

void __112__NFCISO15693ReaderSessionTag_extendedWriteSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)extendedLockBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(int64_t)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __95__NFCISO15693ReaderSessionTag_extendedLockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke;
  v8[3] = &unk_2645B4308;
  id v9 = v6;
  id v7 = v6;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v8];
}

void __95__NFCISO15693ReaderSessionTag_extendedLockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)extendedReadMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __103__NFCISO15693ReaderSessionTag_extendedReadMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke;
  v8[3] = &unk_2645B4308;
  id v9 = v6;
  id v7 = v6;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v8];
}

void __103__NFCISO15693ReaderSessionTag_extendedReadMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)objc_opt_new();
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);
}

- (void)extendedWriteMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 dataBlocks:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __115__NFCISO15693ReaderSessionTag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke;
  v9[3] = &unk_2645B4308;
  id v10 = v7;
  id v8 = v7;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v9];
}

void __115__NFCISO15693ReaderSessionTag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)authenticateWithRequestFlags:(unsigned __int8)a3 cryptoSuiteIdentifier:(int64_t)a4 message:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __108__NFCISO15693ReaderSessionTag_authenticateWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler___block_invoke;
  v9[3] = &unk_2645B4308;
  id v10 = v7;
  id v8 = v7;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v9];
}

void __108__NFCISO15693ReaderSessionTag_authenticateWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)objc_opt_new();
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, void, id, void *))(v1 + 16))(v1, 0, v3, v2);
}

- (void)keyUpdateWithRequestFlags:(unsigned __int8)a3 keyIdentifier:(int64_t)a4 message:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __97__NFCISO15693ReaderSessionTag_keyUpdateWithRequestFlags_keyIdentifier_message_completionHandler___block_invoke;
  v9[3] = &unk_2645B4308;
  id v10 = v7;
  id v8 = v7;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v9];
}

void __97__NFCISO15693ReaderSessionTag_keyUpdateWithRequestFlags_keyIdentifier_message_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)objc_opt_new();
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, void, id, void *))(v1 + 16))(v1, 0, v3, v2);
}

- (void)challengeWithRequestFlags:(unsigned __int8)a3 cryptoSuiteIdentifier:(int64_t)a4 message:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __105__NFCISO15693ReaderSessionTag_challengeWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler___block_invoke;
  v9[3] = &unk_2645B4308;
  id v10 = v7;
  id v8 = v7;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v9];
}

void __105__NFCISO15693ReaderSessionTag_challengeWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)readBufferWithRequestFlags:(unsigned __int8)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__NFCISO15693ReaderSessionTag_readBufferWithRequestFlags_completionHandler___block_invoke;
  v7[3] = &unk_2645B4308;
  id v8 = v5;
  id v6 = v5;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v7];
}

void __76__NFCISO15693ReaderSessionTag_readBufferWithRequestFlags_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)objc_opt_new();
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, void, id, void *))(v1 + 16))(v1, 0, v3, v2);
}

- (void)extendedGetMultipleBlockSecurityStatusWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __114__NFCISO15693ReaderSessionTag_extendedGetMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke;
  v8[3] = &unk_2645B4308;
  id v9 = v6;
  id v7 = v6;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v8];
}

void __114__NFCISO15693ReaderSessionTag_extendedGetMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)objc_opt_new();
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);
}

- (void)extendedFastReadMultipleBlocksWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __106__NFCISO15693ReaderSessionTag_extendedFastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke;
  v8[3] = &unk_2645B4308;
  id v9 = v6;
  id v7 = v6;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v8];
}

void __106__NFCISO15693ReaderSessionTag_extendedFastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)objc_opt_new();
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);
}

- (void)sendRequestWithFlag:(int64_t)a3 commandCode:(int64_t)a4 data:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __86__NFCISO15693ReaderSessionTag_sendRequestWithFlag_commandCode_data_completionHandler___block_invoke;
  v9[3] = &unk_2645B4308;
  id v10 = v7;
  id v8 = v7;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v9];
}

void __86__NFCISO15693ReaderSessionTag_sendRequestWithFlag_commandCode_data_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

@end