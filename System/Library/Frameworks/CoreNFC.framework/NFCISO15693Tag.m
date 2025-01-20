@interface NFCISO15693Tag
- (NSData)icSerialNumber;
- (NSData)identifier;
- (id)_generateRequestHeader:(unsigned __int8)a3 flags:(unsigned __int8)a4;
- (id)_parseResponseErrorWithData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)icManufacturerCode;
- (void)_wtxRetryWithCommnand:(id)a3 maxRetry:(int64_t)a4 completionHandler:(id)a5;
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

@implementation NFCISO15693Tag

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NFCISO15693Tag;
  return [(NFCTag *)&v4 copyWithZone:a3];
}

- (id)_generateRequestHeader:(unsigned __int8)a3 flags:(unsigned __int8)a4
{
  unsigned int v4 = a3;
  v13[0] = a4;
  v13[1] = a3;
  int v6 = 1;
  if (a3 <= 0x9Fu && a3 != 57)
  {
    if ((a4 & 0x10) != 0)
    {
      int v6 = 0;
      char v7 = a4 & 0xDF;
    }
    else
    {
      char v7 = a4 | 0x20;
    }
    v13[0] = v7;
  }
  v8 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithBytes:v13 length:2];
  if (v4 == 57 || v4 > 0x9F || !v6)
  {
    if ((v4 + 96) <= 0x3Fu)
    {
      char v11 = [(NFCISO15693Tag *)self icManufacturerCode];
      [v8 appendBytes:&v11 length:1];
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NFCISO15693Tag;
    v9 = [(NFCTag *)&v12 identifier];
    [v8 appendData:v9];
  }

  return v8;
}

- (NSData)identifier
{
  v5.receiver = self;
  v5.super_class = (Class)NFCISO15693Tag;
  v2 = [(NFCTag *)&v5 identifier];
  v3 = +[NFCISO15693ReaderSessionTag reverseByteOrder:v2];

  return (NSData *)v3;
}

- (unint64_t)icManufacturerCode
{
  unint64_t v5 = 0;
  v2 = [(NFCISO15693Tag *)self identifier];
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
  v2 = [(NFCISO15693Tag *)self identifier];
  id v8 = 0;
  BOOL v3 = +[NFCISO15693ReaderSessionTag decodeIdentifier:v2 manufacturerCode:0 serialNumber:&v8];
  id v4 = v8;

  if (v3) {
    id v5 = v4;
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  int v6 = v5;

  return (NSData *)v6;
}

- (id)_parseResponseErrorWithData:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (unsigned char *)[v3 bytes];
  if (![v3 length])
  {
    v16 = @"TagResponseInvalidLength";
    v17[0] = MEMORY[0x263EFFA88];
    int v6 = NSDictionary;
    char v7 = v17;
    id v8 = &v16;
LABEL_8:
    v9 = [v6 dictionaryWithObjects:v7 forKeys:v8 count:1];
    id v5 = +[NFCError errorWithCode:102 userInfo:v9];
    goto LABEL_9;
  }
  if ((*v4 & 1) == 0)
  {
    id v5 = 0;
    goto LABEL_10;
  }
  if ([v3 length] != 2)
  {
    objc_super v12 = @"TagResponseInvalidLength";
    uint64_t v13 = MEMORY[0x263EFFA88];
    int v6 = NSDictionary;
    char v7 = &v13;
    id v8 = &v12;
    goto LABEL_8;
  }
  v14 = @"ISO15693TagResponseErrorCode";
  v9 = [NSNumber numberWithUnsignedChar:v4[1]];
  v15 = v9;
  v10 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v5 = +[NFCError errorWithCode:102 userInfo:v10];

LABEL_9:
LABEL_10:

  return v5;
}

- (void)readMultipleBlocksWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__NFCISO15693Tag_readMultipleBlocksWithConfiguration_completionHandler___block_invoke;
  v7[3] = &unk_2645B4308;
  id v8 = v5;
  id v6 = v5;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v7];
}

void __72__NFCISO15693Tag_readMultipleBlocksWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)objc_opt_new();
  v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);
}

- (void)sendCustomCommandWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__NFCISO15693Tag_sendCustomCommandWithConfiguration_completionHandler___block_invoke;
  v7[3] = &unk_2645B4308;
  id v8 = v5;
  id v6 = v5;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v7];
}

void __71__NFCISO15693Tag_sendCustomCommandWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)objc_opt_new();
  v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);
}

- (void)stayQuietWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag stayQuietWithCompletionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = [(NFCISO15693Tag *)self _generateRequestHeader:2 flags:32];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__NFCISO15693Tag_stayQuietWithCompletionHandler___block_invoke;
  v8[3] = &unk_2645B42E0;
  id v9 = v4;
  id v7 = v4;
  [(NFCTag *)self _transceiveWithData:v6 completionHandler:v8];
}

void __49__NFCISO15693Tag_stayQuietWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([v5 code] == 100)
  {

    id v4 = 0;
  }
  else
  {
    id v4 = v5;
  }
  id v6 = v4;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)readSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(unsigned __int8)a4 completionHandler:(id)a5
{
  uint64_t v5 = a3;
  unsigned __int8 v14 = a4;
  id v7 = a5;
  id v8 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag readSingleBlockWithRequestFlags:blockNumber:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  id v9 = [(NFCISO15693Tag *)self _generateRequestHeader:32 flags:v5];
  [v9 appendBytes:&v14 length:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__NFCISO15693Tag_readSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke;
  v11[3] = &unk_2645B4620;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [(NFCTag *)self _transceiveWithData:v9 completionHandler:v11];
}

void __80__NFCISO15693Tag_readSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5
    || ([*(id *)(a1 + 32) _parseResponseErrorWithData:v8],
        (id v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = objc_opt_new();
  }
  else
  {
    uint64_t v6 = objc_msgSend(v8, "subdataWithRange:", 1, objc_msgSend(v8, "length") - 1);
  }
  id v7 = (void *)v6;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)writeSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(unsigned __int8)a4 dataBlock:(id)a5 completionHandler:(id)a6
{
  uint64_t v7 = a3;
  unsigned __int8 v21 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag writeSingleBlockWithRequestFlags:blockNumber:dataBlock:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  if ([v10 length])
  {
    id v13 = [(NFCISO15693Tag *)self _generateRequestHeader:33 flags:v7];
    [v13 appendBytes:&v21 length:1];
    [v13 appendData:v10];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __91__NFCISO15693Tag_writeSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke_20;
    v15[3] = &unk_2645B4620;
    v15[4] = self;
    id v16 = v11;
    id v14 = v11;
    [(NFCTag *)self _transceiveWithData:v13 completionHandler:v15];
  }
  else
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    void v17[2] = __91__NFCISO15693Tag_writeSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke;
    v17[3] = &unk_2645B42B8;
    v17[4] = self;
    id v18 = v11;
    SEL v19 = a2;
    id v13 = v11;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v17];
    id v14 = v18;
  }
}

void __91__NFCISO15693Tag_writeSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[NFCError errorWithCode:4];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Data block length must be greater than 0", v9, ClassName, Name, 183);
  }
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    SEL v19 = v13;
    __int16 v20 = 2082;
    unsigned __int8 v21 = v14;
    __int16 v22 = 1024;
    int v23 = 183;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Data block length must be greater than 0", buf, 0x22u);
  }
}

void __91__NFCISO15693Tag_writeSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    id v5 = [*(id *)(a1 + 32) _parseResponseErrorWithData:a2];
  }
  id v6 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)lockBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(unsigned __int8)a4 completionHandler:(id)a5
{
  uint64_t v5 = a3;
  unsigned __int8 v14 = a4;
  id v7 = a5;
  id v8 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag lockBlockWithRequestFlags:blockNumber:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  uint64_t v9 = [(NFCISO15693Tag *)self _generateRequestHeader:34 flags:v5];
  [v9 appendBytes:&v14 length:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__NFCISO15693Tag_lockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke;
  v11[3] = &unk_2645B4620;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [(NFCTag *)self _transceiveWithData:v9 completionHandler:v11];
}

void __74__NFCISO15693Tag_lockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    id v5 = [*(id *)(a1 + 32) _parseResponseErrorWithData:a2];
  }
  id v6 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)readMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v7 = a3;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag readMultipleBlocksWithRequestFlags:blockRange:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if (length && location + length < 0x101)
  {
    id v12 = [(NFCISO15693Tag *)self _generateRequestHeader:35 flags:v7];
    LOBYTE(state.opaque[0]) = location;
    BYTE1(state.opaque[0]) = length - 1;
    [v12 appendBytes:&state length:2];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __82__NFCISO15693Tag_readMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke_23;
    v14[3] = &unk_2645B4648;
    char v19 = v7;
    NSUInteger v16 = location;
    NSUInteger v17 = length;
    SEL v18 = a2;
    v14[4] = self;
    id v15 = v10;
    id v13 = v10;
    [(NFCTag *)self _transceiveWithData:v12 completionHandler:v14];
  }
  else
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __82__NFCISO15693Tag_readMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke;
    v20[3] = &unk_2645B42B8;
    v20[4] = self;
    id v21 = v10;
    SEL v22 = a2;
    id v12 = v10;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v20];
  }
}

void __82__NFCISO15693Tag_readMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = objc_opt_new();
  id v4 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v10, ClassName, Name, 228);
  }
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    unsigned __int8 v14 = object_getClassName(*(id *)(a1 + 32));
    id v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v18 = v13;
    __int16 v19 = 2082;
    __int16 v20 = v14;
    __int16 v21 = 2082;
    SEL v22 = v15;
    __int16 v23 = 1024;
    int v24 = 228;
    _os_log_impl(&dword_2214B8000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }
}

void __82__NFCISO15693Tag_readMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  v38[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = objc_opt_new();
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) _parseResponseErrorWithData:v5];
    id v8 = objc_opt_new();
    if (!v7)
    {
      unsigned int v9 = *(unsigned __int8 *)(a1 + 72);
      uint64_t v10 = [v5 length];
      unint64_t v11 = *(void *)(a1 + 56);
      if (v11 <= v10 - 1)
      {
        if (v11)
        {
          unint64_t v24 = 0;
          unint64_t v25 = (v10 - 1) / v11 - ((v9 >> 6) & 1);
          if ((v9 & 0x40) != 0) {
            uint64_t v26 = 2;
          }
          else {
            uint64_t v26 = 1;
          }
          do
          {
            v27 = objc_msgSend(v5, "subdataWithRange:", v26, v25);
            [v8 addObject:v27];

            v26 += v25;
            ++v24;
          }
          while (*(void *)(a1 + 56) > v24);
        }
        uint64_t v7 = 0;
      }
      else
      {
        v37 = @"TagResponseInvalidLength";
        v38[0] = MEMORY[0x263EFFA88];
        id v12 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
        uint64_t v7 = +[NFCError errorWithCode:102 userInfo:v12];

        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          unsigned __int8 v14 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(*(id *)(a1 + 32));
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(*(id *)(a1 + 32));
          Name = sel_getName(*(SEL *)(a1 + 64));
          uint64_t v18 = 45;
          if (isMetaClass) {
            uint64_t v18 = 43;
          }
          v14(3, "%c[%{public}s %{public}s]:%i Unexpected block size of 0", v18, ClassName, Name, 249);
        }
        __int16 v19 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          __int16 v20 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v20)) {
            int v21 = 43;
          }
          else {
            int v21 = 45;
          }
          SEL v22 = object_getClassName(*(id *)(a1 + 32));
          __int16 v23 = sel_getName(*(SEL *)(a1 + 64));
          *(_DWORD *)buf = 67109890;
          int v30 = v21;
          __int16 v31 = 2082;
          v32 = v22;
          __int16 v33 = 2082;
          v34 = v23;
          __int16 v35 = 1024;
          int v36 = 249;
          _os_log_impl(&dword_2214B8000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected block size of 0", buf, 0x22u);
        }
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)writeMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 dataBlocks:(id)a5 completionHandler:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = a3;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a6;
  unsigned __int8 v14 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag writeMultipleBlocksWithRequestFlags:blockRange:dataBlocks:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  if (location + length < 0x101)
  {
    if ([v12 count] == length)
    {
      if (length)
      {
        SEL v24 = a2;
        id v15 = [(NFCISO15693Tag *)self _generateRequestHeader:36 flags:v9];
        LOBYTE(state.opaque[0]) = location;
        BYTE1(state.opaque[0]) = length - 1;
        [v15 appendBytes:&state length:2];
        NSUInteger v16 = [v12 firstObject];
        uint64_t v17 = [v16 length];

        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v18 = v12;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v44 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v31;
          while (2)
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v31 != v21) {
                objc_enumerationMutation(v18);
              }
              __int16 v23 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              if (v17 != [v23 length])
              {
                v27[0] = MEMORY[0x263EF8330];
                v27[1] = 3221225472;
                v27[2] = __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_29;
                v27[3] = &unk_2645B42B8;
                v27[4] = self;
                id v28 = v13;
                SEL v29 = v24;
                [(NFCTag *)self dispatchOnDelegateQueueAsync:v27];

                goto LABEL_17;
              }
              [v15 appendData:v23];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v44 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }

        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_31;
        v25[3] = &unk_2645B4620;
        v25[4] = self;
        id v26 = v13;
        [(NFCTag *)self _transceiveWithData:v15 completionHandler:v25];
      }
      else
      {
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_28;
        v34[3] = &unk_2645B42B8;
        v34[4] = self;
        id v35 = v13;
        SEL v36 = a2;
        [(NFCTag *)self dispatchOnDelegateQueueAsync:v34];
        id v15 = v35;
      }
    }
    else
    {
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_26;
      v37[3] = &unk_2645B42B8;
      v37[4] = self;
      id v38 = v13;
      SEL v39 = a2;
      [(NFCTag *)self dispatchOnDelegateQueueAsync:v37];
      id v15 = v38;
    }
  }
  else
  {
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke;
    v40[3] = &unk_2645B42B8;
    v40[4] = self;
    id v41 = v13;
    SEL v42 = a2;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v40];
    id v15 = v41;
  }
LABEL_17:
}

void __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v9, ClassName, Name, 275);
  }
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    unint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    unsigned __int8 v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    uint64_t v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 1024;
    int v23 = 275;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }
}

void __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_26(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Specified range length does not match the number of elements in the data block list", v9, ClassName, Name, 281);
  }
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    unint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    unsigned __int8 v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    uint64_t v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 1024;
    int v23 = 281;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Specified range length does not match the number of elements in the data block list", buf, 0x22u);
  }
}

void __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_28(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v9, ClassName, Name, 287);
  }
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    unint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    unsigned __int8 v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    uint64_t v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 1024;
    int v23 = 287;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }
}

void __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_29(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[NFCError errorWithCode:4];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Elements in the data block list are inconsistent in size", v9, ClassName, Name, 300);
  }
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    unint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    unsigned __int8 v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    uint64_t v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 1024;
    int v23 = 300;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Elements in the data block list are inconsistent in size", buf, 0x22u);
  }
}

void __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_31(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    id v5 = [*(id *)(a1 + 32) _parseResponseErrorWithData:a2];
  }
  id v6 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)selectWithRequestFlags:(unsigned __int8)a3 completionHandler:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  uint64_t v7 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag selectWithRequestFlags:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  id v8 = [(NFCISO15693Tag *)self _generateRequestHeader:37 flags:v4 & 0xFFFFFFCF | 0x20];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__NFCISO15693Tag_selectWithRequestFlags_completionHandler___block_invoke;
  v10[3] = &unk_2645B4620;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(NFCTag *)self _transceiveWithData:v8 completionHandler:v10];
}

void __59__NFCISO15693Tag_selectWithRequestFlags_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    id v5 = [*(id *)(a1 + 32) _parseResponseErrorWithData:a2];
  }
  id v6 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resetToReadyWithRequestFlags:(unsigned __int8)a3 completionHandler:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  uint64_t v7 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag resetToReadyWithRequestFlags:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  id v8 = [(NFCISO15693Tag *)self _generateRequestHeader:38 flags:v4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__NFCISO15693Tag_resetToReadyWithRequestFlags_completionHandler___block_invoke;
  v10[3] = &unk_2645B4620;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(NFCTag *)self _transceiveWithData:v8 completionHandler:v10];
}

void __65__NFCISO15693Tag_resetToReadyWithRequestFlags_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    id v5 = [*(id *)(a1 + 32) _parseResponseErrorWithData:a2];
  }
  id v6 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)writeAFIWithRequestFlag:(unsigned __int8)a3 afi:(unsigned __int8)a4 completionHandler:(id)a5
{
  uint64_t v5 = a3;
  unsigned __int8 v14 = a4;
  id v7 = a5;
  id v8 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag writeAFIWithRequestFlag:afi:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  id v9 = [(NFCISO15693Tag *)self _generateRequestHeader:39 flags:v5];
  [v9 appendBytes:&v14 length:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__NFCISO15693Tag_writeAFIWithRequestFlag_afi_completionHandler___block_invoke;
  v11[3] = &unk_2645B4620;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [(NFCTag *)self _transceiveWithData:v9 completionHandler:v11];
}

void __64__NFCISO15693Tag_writeAFIWithRequestFlag_afi_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    id v5 = [*(id *)(a1 + 32) _parseResponseErrorWithData:a2];
  }
  id v6 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)lockAFIWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag lockAFIWithRequestFlag:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  id v8 = [(NFCISO15693Tag *)self _generateRequestHeader:40 flags:v4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__NFCISO15693Tag_lockAFIWithRequestFlag_completionHandler___block_invoke;
  v10[3] = &unk_2645B4620;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(NFCTag *)self _transceiveWithData:v8 completionHandler:v10];
}

void __59__NFCISO15693Tag_lockAFIWithRequestFlag_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    id v5 = [*(id *)(a1 + 32) _parseResponseErrorWithData:a2];
  }
  id v6 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)writeDSFIDWithRequestFlag:(unsigned __int8)a3 dsfid:(unsigned __int8)a4 completionHandler:(id)a5
{
  uint64_t v5 = a3;
  unsigned __int8 v14 = a4;
  id v7 = a5;
  id v8 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag writeDSFIDWithRequestFlag:dsfid:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  id v9 = [(NFCISO15693Tag *)self _generateRequestHeader:41 flags:v5];
  [v9 appendBytes:&v14 length:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__NFCISO15693Tag_writeDSFIDWithRequestFlag_dsfid_completionHandler___block_invoke;
  v11[3] = &unk_2645B4620;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [(NFCTag *)self _transceiveWithData:v9 completionHandler:v11];
}

void __68__NFCISO15693Tag_writeDSFIDWithRequestFlag_dsfid_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    id v5 = [*(id *)(a1 + 32) _parseResponseErrorWithData:a2];
  }
  id v6 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)lockDSFIDWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = [(NFCISO15693Tag *)self _generateRequestHeader:42 flags:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__NFCISO15693Tag_lockDSFIDWithRequestFlag_completionHandler___block_invoke;
  v9[3] = &unk_2645B4620;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(NFCTag *)self _transceiveWithData:v7 completionHandler:v9];
}

void __61__NFCISO15693Tag_lockDSFIDWithRequestFlag_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    id v5 = [*(id *)(a1 + 32) _parseResponseErrorWithData:a2];
  }
  id v6 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getSystemInfoWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__NFCISO15693Tag_getSystemInfoWithRequestFlag_completionHandler___block_invoke;
  v8[3] = &unk_2645B4670;
  id v9 = v6;
  id v7 = v6;
  [(NFCISO15693Tag *)self getSystemInfoAndUIDWithRequestFlag:v4 completionHandler:v8];
}

uint64_t __65__NFCISO15693Tag_getSystemInfoWithRequestFlag_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSystemInfoAndUIDWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag getSystemInfoAndUIDWithRequestFlag:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  id v8 = [(NFCISO15693Tag *)self _generateRequestHeader:43 flags:v4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__NFCISO15693Tag_getSystemInfoAndUIDWithRequestFlag_completionHandler___block_invoke;
  v10[3] = &unk_2645B4620;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(NFCTag *)self _transceiveWithData:v8 completionHandler:v10];
}

void __71__NFCISO15693Tag_getSystemInfoAndUIDWithRequestFlag_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6
    || ([*(id *)(a1 + 32) _parseResponseErrorWithData:v5],
        (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = v6;
LABEL_4:
    id v8 = 0;
    goto LABEL_5;
  }
  if ((unint64_t)[v5 length] <= 9)
  {
    id v13 = @"TagResponseInvalidLength";
    v14[0] = MEMORY[0x263EFFA88];
    id v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v7 = +[NFCError errorWithCode:102 userInfo:v9];

    goto LABEL_4;
  }
  id v8 = objc_msgSend(v5, "subdataWithRange:", 2, 8);
  id v10 = v5;
  char v11 = *(unsigned char *)([v10 bytes] + 1);
  if ((v11 & 1) != 0 && (unint64_t)[v10 length] >= 0xB) {
    unsigned int v12 = 11;
  }
  else {
    unsigned int v12 = 10;
  }
  if ((v11 & 2) != 0 && [v10 length] > (unint64_t)v12) {
    ++v12;
  }
  if ((v11 & 4) != 0 && [v10 length] > (unint64_t)v12 + 1) {
    v12 += 2;
  }
  if ((v11 & 8) != 0 && [v10 length] > (unint64_t)v12) {
    id v7 = 0;
  }
  else {
    id v7 = 0;
  }
LABEL_5:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getMultipleBlockSecurityStatusWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v7 = a3;
  id v10 = a5;
  char v11 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag getMultipleBlockSecurityStatusWithRequestFlag:blockRange:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if (location + length < 0x101)
  {
    id v12 = [(NFCISO15693Tag *)self _generateRequestHeader:44 flags:v7];
    LOBYTE(state.opaque[0]) = location;
    BYTE1(state.opaque[0]) = length - 1;
    [v12 appendBytes:&state length:2];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __93__NFCISO15693Tag_getMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke_33;
    v14[3] = &unk_2645B4698;
    NSUInteger v16 = location;
    NSUInteger v17 = length;
    v14[4] = self;
    id v15 = v10;
    id v13 = v10;
    [(NFCTag *)self _transceiveWithData:v12 completionHandler:v14];
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __93__NFCISO15693Tag_getMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke;
    v18[3] = &unk_2645B42B8;
    v18[4] = self;
    id v19 = v10;
    SEL v20 = a2;
    id v12 = v10;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v18];
  }
}

void __93__NFCISO15693Tag_getMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = objc_opt_new();
  uint64_t v4 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v10, ClassName, Name, 505);
  }
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    unsigned __int8 v14 = object_getClassName(*(id *)(a1 + 32));
    id v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v18 = v13;
    __int16 v19 = 2082;
    SEL v20 = v14;
    __int16 v21 = 2082;
    __int16 v22 = v15;
    __int16 v23 = 1024;
    int v24 = 505;
    _os_log_impl(&dword_2214B8000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }
}

void __93__NFCISO15693Tag_getMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = objc_opt_new();
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) _parseResponseErrorWithData:v5];
    id v8 = objc_opt_new();
    if (!v7)
    {
      uint64_t v9 = *(void *)(a1 + 56);
      if (v9 == [v5 length] - 1)
      {
        id v10 = v5;
        uint64_t v11 = [v10 bytes];
        if ((unint64_t)[v10 length] >= 2)
        {
          unint64_t v12 = 1;
          do
          {
            int v13 = [NSNumber numberWithChar:*(char *)(v11 + v12)];
            [v8 addObject:v13];

            ++v12;
          }
          while ([v10 length] > v12);
        }
        uint64_t v7 = 0;
      }
      else
      {
        id v15 = @"TagResponseInvalidLength";
        v16[0] = MEMORY[0x263EFFA88];
        unsigned __int8 v14 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
        uint64_t v7 = +[NFCError errorWithCode:102 userInfo:v14];
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fastReadMultipleBlocksWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v7 = a3;
  id v10 = a5;
  uint64_t v11 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag fastReadMultipleBlocksWithRequestFlag:blockRange:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if (location + length < 0x101)
  {
    id v12 = [(NFCISO15693Tag *)self _generateRequestHeader:45 flags:v7];
    LOBYTE(state.opaque[0]) = location;
    BYTE1(state.opaque[0]) = length - 1;
    [v12 appendBytes:&state length:2];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __85__NFCISO15693Tag_fastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke_34;
    v14[3] = &unk_2645B46C0;
    NSUInteger v16 = location;
    NSUInteger v17 = length;
    SEL v18 = a2;
    v14[4] = self;
    id v15 = v10;
    id v13 = v10;
    [(NFCTag *)self _transceiveWithData:v12 completionHandler:v14];
  }
  else
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __85__NFCISO15693Tag_fastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke;
    v19[3] = &unk_2645B42B8;
    v19[4] = self;
    id v20 = v10;
    SEL v21 = a2;
    id v12 = v10;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v19];
  }
}

void __85__NFCISO15693Tag_fastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = objc_opt_new();
  uint64_t v4 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v10, ClassName, Name, 544);
  }
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    unsigned __int8 v14 = object_getClassName(*(id *)(a1 + 32));
    id v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v18 = v13;
    __int16 v19 = 2082;
    id v20 = v14;
    __int16 v21 = 2082;
    __int16 v22 = v15;
    __int16 v23 = 1024;
    int v24 = 544;
    _os_log_impl(&dword_2214B8000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }
}

void __85__NFCISO15693Tag_fastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  v37[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = objc_opt_new();
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) _parseResponseErrorWithData:v5];
    id v8 = objc_opt_new();
    if (!v7)
    {
      unint64_t v9 = [v5 length] - 1;
      unint64_t v10 = *(void *)(a1 + 56);
      if (v10 > v9 || (unint64_t v11 = v9 / v10, v9 % v10))
      {
        SEL v36 = @"TagResponseInvalidLength";
        v37[0] = MEMORY[0x263EFFA88];
        id v12 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
        uint64_t v7 = +[NFCError errorWithCode:102 userInfo:v12];

        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          unsigned __int8 v14 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(*(id *)(a1 + 32));
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(*(id *)(a1 + 32));
          Name = sel_getName(*(SEL *)(a1 + 64));
          uint64_t v18 = 45;
          if (isMetaClass) {
            uint64_t v18 = 43;
          }
          v14(3, "%c[%{public}s %{public}s]:%i Unexpected block size of 0", v18, ClassName, Name, 565);
        }
        __int16 v19 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v20 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v20)) {
            int v21 = 43;
          }
          else {
            int v21 = 45;
          }
          __int16 v22 = object_getClassName(*(id *)(a1 + 32));
          __int16 v23 = sel_getName(*(SEL *)(a1 + 64));
          *(_DWORD *)buf = 67109890;
          int v29 = v21;
          __int16 v30 = 2082;
          long long v31 = v22;
          __int16 v32 = 2082;
          long long v33 = v23;
          __int16 v34 = 1024;
          int v35 = 565;
          _os_log_impl(&dword_2214B8000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected block size of 0", buf, 0x22u);
        }
      }
      else
      {
        unint64_t v24 = 0;
        uint64_t v25 = 1;
        do
        {
          id v26 = objc_msgSend(v5, "subdataWithRange:", v25, v11);
          [v8 addObject:v26];

          v25 += v11;
          ++v24;
        }
        while (*(void *)(a1 + 56) > v24);
        uint64_t v7 = 0;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)customCommandWithRequestFlag:(unsigned __int8)a3 customCommandCode:(int64_t)a4 customRequestParameters:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = a3;
  id v11 = a5;
  id v12 = a6;
  int v13 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag customCommandWithRequestFlag:customCommandCode:customRequestParameters:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  os_activity_scope_leave(&state);

  if ((unint64_t)(a4 - 224) > 0xFFFFFFFFFFFFFFBFLL)
  {
    id v14 = [(NFCISO15693Tag *)self _generateRequestHeader:a4 flags:v8];
    if ([v11 length]) {
      [v14 appendData:v11];
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    void v16[2] = __107__NFCISO15693Tag_customCommandWithRequestFlag_customCommandCode_customRequestParameters_completionHandler___block_invoke_36;
    v16[3] = &unk_2645B4620;
    v16[4] = self;
    id v17 = v12;
    id v15 = v12;
    [(NFCTag *)self _transceiveWithData:v14 completionHandler:v16];
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __107__NFCISO15693Tag_customCommandWithRequestFlag_customCommandCode_customRequestParameters_completionHandler___block_invoke;
    v18[3] = &unk_2645B42B8;
    v18[4] = self;
    id v19 = v12;
    SEL v20 = a2;
    id v14 = v12;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v18];
    id v15 = v19;
  }
}

void __107__NFCISO15693Tag_customCommandWithRequestFlag_customCommandCode_customRequestParameters_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = objc_opt_new();
  uint64_t v4 = +[NFCError errorWithCode:3];
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Custom command code must be between 0xA0 to 0xDF inclusively", v10, ClassName, Name, 589);
  }
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    id v14 = object_getClassName(*(id *)(a1 + 32));
    id v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v18 = v13;
    __int16 v19 = 2082;
    SEL v20 = v14;
    __int16 v21 = 2082;
    __int16 v22 = v15;
    __int16 v23 = 1024;
    int v24 = 589;
    _os_log_impl(&dword_2214B8000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Custom command code must be between 0xA0 to 0xDF inclusively", buf, 0x22u);
  }
}

void __107__NFCISO15693Tag_customCommandWithRequestFlag_customCommandCode_customRequestParameters_completionHandler___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5
    || ([*(id *)(a1 + 32) _parseResponseErrorWithData:v8],
        (id v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = objc_opt_new();
  }
  else
  {
    uint64_t v6 = objc_msgSend(v8, "subdataWithRange:", 1, objc_msgSend(v8, "length") - 1);
  }
  uint64_t v7 = (void *)v6;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)extendedReadSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v6 = a3;
  id v9 = a5;
  uint64_t v10 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag extendedReadSingleBlockWithRequestFlags:blockNumber:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  if ((unint64_t)a4 < 0x10000)
  {
    id v11 = [(NFCISO15693Tag *)self _generateRequestHeader:48 flags:v6];
    LOWORD(state.opaque[0]) = a4;
    [v11 appendBytes:&state length:2];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    unsigned char v13[2] = __88__NFCISO15693Tag_extendedReadSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke_37;
    v13[3] = &unk_2645B4620;
    v13[4] = self;
    id v14 = v9;
    id v12 = v9;
    [(NFCTag *)self _transceiveWithData:v11 completionHandler:v13];
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __88__NFCISO15693Tag_extendedReadSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke;
    v15[3] = &unk_2645B42B8;
    v15[4] = self;
    id v16 = v9;
    SEL v17 = a2;
    id v11 = v9;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v15];
  }
}

void __88__NFCISO15693Tag_extendedReadSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = objc_opt_new();
  uint64_t v4 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v10, ClassName, Name, 625);
  }
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    id v14 = object_getClassName(*(id *)(a1 + 32));
    id v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v18 = v13;
    __int16 v19 = 2082;
    SEL v20 = v14;
    __int16 v21 = 2082;
    __int16 v22 = v15;
    __int16 v23 = 1024;
    int v24 = 625;
    _os_log_impl(&dword_2214B8000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }
}

void __88__NFCISO15693Tag_extendedReadSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5
    || ([*(id *)(a1 + 32) _parseResponseErrorWithData:v8],
        (id v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = objc_opt_new();
  }
  else
  {
    uint64_t v6 = objc_msgSend(v8, "subdataWithRange:", 1, objc_msgSend(v8, "length") - 1);
  }
  uint64_t v7 = (void *)v6;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)extendedWriteSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(int64_t)a4 dataBlock:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = a3;
  id v11 = a5;
  id v12 = a6;
  int v13 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag extendedWriteSingleBlockWithRequestFlags:blockNumber:dataBlock:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  os_activity_scope_leave(&state);

  if ((unint64_t)a4 < 0x10000)
  {
    if ([v11 length])
    {
      id v14 = [(NFCISO15693Tag *)self _generateRequestHeader:49 flags:v8];
      LOWORD(state.opaque[0]) = a4;
      [v14 appendBytes:&state length:2];
      [v14 appendData:v11];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __99__NFCISO15693Tag_extendedWriteSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke_39;
      v15[3] = &unk_2645B4620;
      v15[4] = self;
      id v16 = v12;
      [(NFCTag *)self _transceiveWithData:v14 completionHandler:v15];
    }
    else
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      void v17[2] = __99__NFCISO15693Tag_extendedWriteSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke_38;
      v17[3] = &unk_2645B42B8;
      v17[4] = self;
      id v18 = v12;
      SEL v19 = a2;
      [(NFCTag *)self dispatchOnDelegateQueueAsync:v17];
      id v14 = v18;
    }
  }
  else
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __99__NFCISO15693Tag_extendedWriteSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke;
    v20[3] = &unk_2645B42B8;
    v20[4] = self;
    id v21 = v12;
    SEL v22 = a2;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v20];
    id v14 = v21;
  }
}

void __99__NFCISO15693Tag_extendedWriteSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v9, ClassName, Name, 661);
  }
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    SEL v19 = v13;
    __int16 v20 = 2082;
    id v21 = v14;
    __int16 v22 = 1024;
    int v23 = 661;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }
}

void __99__NFCISO15693Tag_extendedWriteSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke_38(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[NFCError errorWithCode:4];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Data block length must be greater than 0", v9, ClassName, Name, 669);
  }
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    SEL v19 = v13;
    __int16 v20 = 2082;
    id v21 = v14;
    __int16 v22 = 1024;
    int v23 = 669;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Data block length must be greater than 0", buf, 0x22u);
  }
}

void __99__NFCISO15693Tag_extendedWriteSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke_39(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    id v5 = [*(id *)(a1 + 32) _parseResponseErrorWithData:a2];
  }
  id v6 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)extendedLockBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v6 = a3;
  id v9 = a5;
  uint64_t v10 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag extendedLockBlockWithRequestFlags:blockNumber:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  if ((unint64_t)a4 < 0x10000)
  {
    id v11 = [(NFCISO15693Tag *)self _generateRequestHeader:50 flags:v6];
    LOWORD(state.opaque[0]) = a4;
    [v11 appendBytes:&state length:2];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    unsigned char v13[2] = __82__NFCISO15693Tag_extendedLockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke_40;
    v13[3] = &unk_2645B4620;
    v13[4] = self;
    id v14 = v9;
    id v12 = v9;
    [(NFCTag *)self _transceiveWithData:v11 completionHandler:v13];
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __82__NFCISO15693Tag_extendedLockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke;
    v15[3] = &unk_2645B42B8;
    v15[4] = self;
    id v16 = v9;
    SEL v17 = a2;
    id v11 = v9;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v15];
  }
}

void __82__NFCISO15693Tag_extendedLockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v9, ClassName, Name, 698);
  }
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    SEL v19 = v13;
    __int16 v20 = 2082;
    id v21 = v14;
    __int16 v22 = 1024;
    int v23 = 698;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }
}

void __82__NFCISO15693Tag_extendedLockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke_40(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    id v5 = [*(id *)(a1 + 32) _parseResponseErrorWithData:a2];
  }
  id v6 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)extendedReadMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v7 = a3;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag extendedReadMultipleBlocksWithRequestFlags:blockRange:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if (location + length <= 0x10000)
  {
    id v12 = [(NFCISO15693Tag *)self _generateRequestHeader:51 flags:v7];
    LOWORD(state.opaque[0]) = location;
    WORD1(state.opaque[0]) = length - 1;
    [v12 appendBytes:&state length:4];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __90__NFCISO15693Tag_extendedReadMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke_41;
    v14[3] = &unk_2645B4698;
    NSUInteger v16 = location;
    NSUInteger v17 = length;
    v14[4] = self;
    id v15 = v10;
    id v13 = v10;
    [(NFCTag *)self _transceiveWithData:v12 completionHandler:v14];
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __90__NFCISO15693Tag_extendedReadMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke;
    v18[3] = &unk_2645B42B8;
    v18[4] = self;
    id v19 = v10;
    SEL v20 = a2;
    id v12 = v10;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v18];
  }
}

void __90__NFCISO15693Tag_extendedReadMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = objc_opt_new();
  uint64_t v4 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v10, ClassName, Name, 725);
  }
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    id v14 = object_getClassName(*(id *)(a1 + 32));
    id v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v18 = v13;
    __int16 v19 = 2082;
    SEL v20 = v14;
    __int16 v21 = 2082;
    __int16 v22 = v15;
    __int16 v23 = 1024;
    int v24 = 725;
    _os_log_impl(&dword_2214B8000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }
}

void __90__NFCISO15693Tag_extendedReadMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = objc_opt_new();
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) _parseResponseErrorWithData:v5];
    uint64_t v8 = objc_opt_new();
    if (!v7)
    {
      uint64_t v9 = [v5 length];
      unint64_t v10 = *(void *)(a1 + 56);
      unint64_t v11 = (v9 - 1) / v10;
      if ((v9 - 1) % v10)
      {
        id v15 = @"TagResponseInvalidLength";
        v16[0] = MEMORY[0x263EFFA88];
        id v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
        uint64_t v7 = +[NFCError errorWithCode:102 userInfo:v12];
      }
      else
      {
        unint64_t v13 = 0;
        do
        {
          id v14 = objc_msgSend(v5, "subdataWithRange:", v13 * v11 + 1, v11);
          [v8 addObject:v14];

          ++v13;
        }
        while (*(void *)(a1 + 56) > v13);
        uint64_t v7 = 0;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)extendedWriteMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 dataBlocks:(id)a5 completionHandler:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = a3;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a6;
  id v14 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag extendedWriteMultipleBlocksWithRequestFlags:blockRange:dataBlock:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  if (location + length <= 0x10000)
  {
    if ([v12 count] == length)
    {
      if (length)
      {
        SEL v24 = a2;
        id v15 = [(NFCISO15693Tag *)self _generateRequestHeader:52 flags:v9];
        LOWORD(state.opaque[0]) = location;
        WORD1(state.opaque[0]) = length - 1;
        [v15 appendBytes:&state length:4];
        NSUInteger v16 = [v12 firstObject];
        uint64_t v17 = [v16 length];

        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v18 = v12;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v44 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v31;
          while (2)
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v31 != v21) {
                objc_enumerationMutation(v18);
              }
              __int16 v23 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              if (v17 != [v23 length])
              {
                v27[0] = MEMORY[0x263EF8330];
                v27[1] = 3221225472;
                v27[2] = __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_44;
                v27[3] = &unk_2645B42B8;
                v27[4] = self;
                id v28 = v13;
                SEL v29 = v24;
                [(NFCTag *)self dispatchOnDelegateQueueAsync:v27];

                goto LABEL_17;
              }
              [v15 appendData:v23];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v44 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }

        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_45;
        v25[3] = &unk_2645B4620;
        v25[4] = self;
        id v26 = v13;
        [(NFCTag *)self _transceiveWithData:v15 completionHandler:v25];
      }
      else
      {
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_43;
        v34[3] = &unk_2645B42B8;
        v34[4] = self;
        id v35 = v13;
        SEL v36 = a2;
        [(NFCTag *)self dispatchOnDelegateQueueAsync:v34];
        id v15 = v35;
      }
    }
    else
    {
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      void v37[2] = __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_42;
      v37[3] = &unk_2645B42B8;
      v37[4] = self;
      id v38 = v13;
      SEL v39 = a2;
      [(NFCTag *)self dispatchOnDelegateQueueAsync:v37];
      id v15 = v38;
    }
  }
  else
  {
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke;
    v40[3] = &unk_2645B42B8;
    v40[4] = self;
    id v41 = v13;
    SEL v42 = a2;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v40];
    id v15 = v41;
  }
LABEL_17:
}

void __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v9, ClassName, Name, 769);
  }
  unint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    unint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    uint64_t v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 1024;
    int v23 = 769;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }
}

void __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_42(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Specified range length does not match the number of elements in the data block list", v9, ClassName, Name, 775);
  }
  unint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    unint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    uint64_t v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 1024;
    int v23 = 775;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Specified range length does not match the number of elements in the data block list", buf, 0x22u);
  }
}

void __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_43(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v9, ClassName, Name, 781);
  }
  unint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    unint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    uint64_t v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 1024;
    int v23 = 781;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }
}

void __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_44(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[NFCError errorWithCode:4];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Elements in the data block list are inconsistent in size", v9, ClassName, Name, 795);
  }
  unint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    unint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    uint64_t v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 1024;
    int v23 = 795;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Elements in the data block list are inconsistent in size", buf, 0x22u);
  }
}

void __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_45(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    id v5 = [*(id *)(a1 + 32) _parseResponseErrorWithData:a2];
  }
  id v6 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)authenticateWithRequestFlags:(unsigned __int8)a3 cryptoSuiteIdentifier:(int64_t)a4 message:(id)a5 completionHandler:(id)a6
{
  char v7 = a4;
  uint64_t v8 = a3;
  id v10 = a5;
  id v11 = a6;
  int v12 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag authenticateWithRequestFlags:cryptoSuiteIdentifier:message:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  id v13 = [(NFCISO15693Tag *)self _generateRequestHeader:53 flags:v8];
  LOBYTE(state.opaque[0]) = v7;
  [v13 appendBytes:&state length:1];
  if ([v10 length]) {
    [v13 appendData:v10];
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __95__NFCISO15693Tag_authenticateWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler___block_invoke;
  v15[3] = &unk_2645B4620;
  v15[4] = self;
  id v16 = v11;
  id v14 = v11;
  [(NFCTag *)self _transceiveWithData:v13 completionHandler:v15];
}

void __95__NFCISO15693Tag_authenticateWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (!v5)
  {
    id v5 = [*(id *)(a1 + 32) _parseResponseErrorWithData:v8];
  }
  if ((unint64_t)[v8 length] < 2)
  {
    char v7 = objc_opt_new();
  }
  else
  {
    id v6 = v8;
    [v6 bytes];
    char v7 = objc_msgSend(v6, "subdataWithRange:", 1, objc_msgSend(v6, "length") - 1);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)keyUpdateWithRequestFlags:(unsigned __int8)a3 keyIdentifier:(int64_t)a4 message:(id)a5 completionHandler:(id)a6
{
  char v7 = a4;
  uint64_t v8 = a3;
  id v10 = a5;
  id v11 = a6;
  int v12 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag keyUpdateWithRequestFlags:keyIdentifier:message:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  id v13 = [(NFCISO15693Tag *)self _generateRequestHeader:54 flags:v8];
  LOBYTE(state.opaque[0]) = v7;
  [v13 appendBytes:&state length:1];
  if ([v10 length]) {
    [v13 appendData:v10];
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __84__NFCISO15693Tag_keyUpdateWithRequestFlags_keyIdentifier_message_completionHandler___block_invoke;
  v15[3] = &unk_2645B4620;
  v15[4] = self;
  id v16 = v11;
  id v14 = v11;
  [(NFCTag *)self _transceiveWithData:v13 completionHandler:v15];
}

void __84__NFCISO15693Tag_keyUpdateWithRequestFlags_keyIdentifier_message_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (!v5)
  {
    id v5 = [*(id *)(a1 + 32) _parseResponseErrorWithData:v8];
  }
  if ((unint64_t)[v8 length] < 2)
  {
    char v7 = objc_opt_new();
  }
  else
  {
    id v6 = v8;
    [v6 bytes];
    char v7 = objc_msgSend(v6, "subdataWithRange:", 1, objc_msgSend(v6, "length") - 1);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)challengeWithRequestFlags:(unsigned __int8)a3 cryptoSuiteIdentifier:(int64_t)a4 message:(id)a5 completionHandler:(id)a6
{
  char v7 = a4;
  uint64_t v8 = a3;
  id v10 = a5;
  id v11 = a6;
  int v12 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag challengeWithRequestFlags:cryptoSuiteIdentifier:message:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  id v13 = [(NFCISO15693Tag *)self _generateRequestHeader:57 flags:v8];
  LOBYTE(state.opaque[0]) = v7;
  [v13 appendBytes:&state length:1];
  if ([v10 length]) {
    [v13 appendData:v10];
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __92__NFCISO15693Tag_challengeWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler___block_invoke;
  v15[3] = &unk_2645B42E0;
  id v16 = v11;
  id v14 = v11;
  [(NFCTag *)self _transceiveWithData:v13 completionHandler:v15];
}

void __92__NFCISO15693Tag_challengeWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5 && [v5 code] == 100) {
    char v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else {
    char v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v7();
}

- (void)readBufferWithRequestFlags:(unsigned __int8)a3 completionHandler:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  char v7 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag readBufferWithRequestFlags:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  id v8 = [(NFCISO15693Tag *)self _generateRequestHeader:58 flags:v4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__NFCISO15693Tag_readBufferWithRequestFlags_completionHandler___block_invoke;
  v10[3] = &unk_2645B4620;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(NFCTag *)self _transceiveWithData:v8 completionHandler:v10];
}

void __63__NFCISO15693Tag_readBufferWithRequestFlags_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (!v5)
  {
    id v5 = [*(id *)(a1 + 32) _parseResponseErrorWithData:v8];
  }
  if ((unint64_t)[v8 length] < 2)
  {
    char v7 = objc_opt_new();
  }
  else
  {
    id v6 = v8;
    [v6 bytes];
    char v7 = objc_msgSend(v6, "subdataWithRange:", 1, objc_msgSend(v6, "length") - 1);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)extendedGetMultipleBlockSecurityStatusWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v7 = a3;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag extendedGetMultipleBlockSecurityStatusWithRequestFlag:blockRange:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if (location + length <= 0x10000)
  {
    id v12 = [(NFCISO15693Tag *)self _generateRequestHeader:60 flags:v7];
    LOWORD(state.opaque[0]) = location;
    WORD1(state.opaque[0]) = length - 1;
    [v12 appendBytes:&state length:4];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __101__NFCISO15693Tag_extendedGetMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke_46;
    v14[3] = &unk_2645B4698;
    NSUInteger v16 = location;
    NSUInteger v17 = length;
    v14[4] = self;
    id v15 = v10;
    id v13 = v10;
    [(NFCTag *)self _transceiveWithData:v12 completionHandler:v14];
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __101__NFCISO15693Tag_extendedGetMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke;
    v18[3] = &unk_2645B42B8;
    v18[4] = self;
    id v19 = v10;
    SEL v20 = a2;
    id v12 = v10;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v18];
  }
}

void __101__NFCISO15693Tag_extendedGetMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = objc_opt_new();
  uint64_t v4 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v10, ClassName, Name, 932);
  }
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    id v14 = object_getClassName(*(id *)(a1 + 32));
    id v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v18 = v13;
    __int16 v19 = 2082;
    SEL v20 = v14;
    __int16 v21 = 2082;
    __int16 v22 = v15;
    __int16 v23 = 1024;
    int v24 = 932;
    _os_log_impl(&dword_2214B8000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }
}

void __101__NFCISO15693Tag_extendedGetMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = objc_opt_new();
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) _parseResponseErrorWithData:v5];
    id v8 = objc_opt_new();
    if (!v7)
    {
      uint64_t v9 = *(void *)(a1 + 56);
      if (v9 == [v5 length] - 1)
      {
        id v10 = v5;
        uint64_t v11 = [v10 bytes];
        if ((unint64_t)[v10 length] >= 2)
        {
          unint64_t v12 = 1;
          do
          {
            int v13 = [NSNumber numberWithChar:*(char *)(v11 + v12)];
            [v8 addObject:v13];

            ++v12;
          }
          while ([v10 length] > v12);
        }
        uint64_t v7 = 0;
      }
      else
      {
        id v15 = @"TagResponseInvalidLength";
        v16[0] = MEMORY[0x263EFFA88];
        id v14 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
        uint64_t v7 = +[NFCError errorWithCode:102 userInfo:v14];
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_wtxRetryWithCommnand:(id)a3 maxRetry:(int64_t)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  unsigned char v13[2] = __67__NFCISO15693Tag__wtxRetryWithCommnand_maxRetry_completionHandler___block_invoke;
  v13[3] = &unk_2645B46E8;
  id v15 = v10;
  int64_t v16 = a4;
  SEL v17 = a2;
  v13[4] = self;
  id v14 = v9;
  id v11 = v9;
  id v12 = v10;
  [(NFCTag *)self _transceiveWithData:v11 completionHandler:v13];
}

void __67__NFCISO15693Tag__wtxRetryWithCommnand_maxRetry_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v6 = [*(id *)(a1 + 32) _parseResponseErrorWithData:v5];
  }
  id v7 = v5;
  uint64_t v8 = [v7 bytes];
  if ((unint64_t)[v7 length] < 2 || (*(unsigned char *)v8 & 0x40) == 0)
  {
    if (!v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  if ([v7 length] != 3)
  {
    int64_t v11 = 0;
    if (!v6) {
      goto LABEL_14;
    }
LABEL_6:
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = objc_opt_new();
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v6);
LABEL_7:

    goto LABEL_9;
  }
  int64_t v11 = 302000 * *(unsigned __int16 *)(v8 + 1);
  if (v6) {
    goto LABEL_6;
  }
LABEL_14:
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v13 = v12 > 0;
  uint64_t v14 = v12 - v13;
  if (v12 == v13)
  {
    uint64_t v29 = *(void *)(a1 + 48);
    id v10 = objc_opt_new();
    long long v30 = +[NFCError errorWithCode:101];
    (*(void (**)(uint64_t, void *, void *))(v29 + 16))(v29, v10, v30);

    goto LABEL_7;
  }
  if (!v11)
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int64_t v16 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 64));
      uint64_t v20 = 45;
      if (isMetaClass) {
        uint64_t v20 = 43;
      }
      v16(4, "%c[%{public}s %{public}s]:%i Forcing minimum 20ms delay", v20, ClassName, Name, 992);
    }
    __int16 v21 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v22)) {
        int v23 = 43;
      }
      else {
        int v23 = 45;
      }
      int v24 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v25 = sel_getName(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 67109890;
      int v37 = v23;
      __int16 v38 = 2082;
      SEL v39 = v24;
      __int16 v40 = 2082;
      id v41 = v25;
      __int16 v42 = 1024;
      int v43 = 992;
      _os_log_impl(&dword_2214B8000, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Forcing minimum 20ms delay", buf, 0x22u);
    }

    int64_t v11 = 20000000;
  }
  id v26 = [*(id *)(a1 + 32) _getInternalReaderSession];
  dispatch_time_t v27 = dispatch_time(0, v11);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __67__NFCISO15693Tag__wtxRetryWithCommnand_maxRetry_completionHandler___block_invoke_48;
  v32[3] = &unk_2645B4440;
  id v28 = *(void **)(a1 + 40);
  v32[4] = *(void *)(a1 + 32);
  id v33 = v28;
  uint64_t v35 = v14;
  id v34 = *(id *)(a1 + 48);
  [v26 submitBlockOnSessionQueueWithDelay:v27 block:v32];

LABEL_9:
}

uint64_t __67__NFCISO15693Tag__wtxRetryWithCommnand_maxRetry_completionHandler___block_invoke_48(uint64_t a1)
{
  return [*(id *)(a1 + 32) _wtxRetryWithCommnand:*(void *)(a1 + 40) maxRetry:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
}

- (void)extendedFastReadMultipleBlocksWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v7 = a3;
  id v10 = a5;
  int64_t v11 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag extendedFastReadMultipleBlocksWithRequestFlag:blockRange:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if (location + length <= 0x10000)
  {
    uint64_t v13 = [(NFCISO15693Tag *)self _generateRequestHeader:61 flags:v7];
    LOWORD(state.opaque[0]) = location;
    WORD1(state.opaque[0]) = length - 1;
    [v13 appendBytes:&state length:4];
    uint64_t v14 = [(NFCTag *)self _getInternalReaderSession];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    void v16[2] = __93__NFCISO15693Tag_extendedFastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke_49;
    v16[3] = &unk_2645B4710;
    v16[4] = self;
    id v17 = v13;
    NSUInteger v20 = length;
    SEL v21 = a2;
    id v18 = v10;
    NSUInteger v19 = location;
    id v15 = v10;
    id v12 = v13;
    [v14 submitBlockOnSessionQueue:v16];
  }
  else
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __93__NFCISO15693Tag_extendedFastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke;
    v22[3] = &unk_2645B42B8;
    v22[4] = self;
    id v23 = v10;
    SEL v24 = a2;
    id v12 = v10;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v22];
  }
}

void __93__NFCISO15693Tag_extendedFastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = objc_opt_new();
  uint64_t v4 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v10, ClassName, Name, 1020);
  }
  int64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    id v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v18 = v13;
    __int16 v19 = 2082;
    NSUInteger v20 = v14;
    __int16 v21 = 2082;
    __int16 v22 = v15;
    __int16 v23 = 1024;
    int v24 = 1020;
    _os_log_impl(&dword_2214B8000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }
}

void __93__NFCISO15693Tag_extendedFastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke_49(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __93__NFCISO15693Tag_extendedFastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke_2;
  v3[3] = &unk_2645B46C0;
  long long v5 = *(_OWORD *)(a1 + 56);
  v3[4] = v1;
  uint64_t v6 = *(void *)(a1 + 72);
  id v4 = *(id *)(a1 + 48);
  [v1 _wtxRetryWithCommnand:v2 maxRetry:1 completionHandler:v3];
}

void __93__NFCISO15693Tag_extendedFastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v36[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  if (!v6)
  {
    unint64_t v8 = [v5 length] - 1;
    unint64_t v9 = *(void *)(a1 + 56);
    if (v9 > v8 || (unint64_t v10 = v8 / v9, v8 % v9))
    {
      uint64_t v35 = @"TagResponseInvalidLength";
      v36[0] = MEMORY[0x263EFFA88];
      int64_t v11 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
      id v6 = +[NFCError errorWithCode:102 userInfo:v11];

      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        int v13 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(*(id *)(a1 + 32));
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 64));
        uint64_t v17 = 45;
        if (isMetaClass) {
          uint64_t v17 = 43;
        }
        v13(3, "%c[%{public}s %{public}s]:%i Unexpected block size of 0", v17, ClassName, Name, 1039);
      }
      int v18 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v19)) {
          int v20 = 43;
        }
        else {
          int v20 = 45;
        }
        __int16 v21 = object_getClassName(*(id *)(a1 + 32));
        __int16 v22 = sel_getName(*(SEL *)(a1 + 64));
        *(_DWORD *)buf = 67109890;
        int v28 = v20;
        __int16 v29 = 2082;
        long long v30 = v21;
        __int16 v31 = 2082;
        long long v32 = v22;
        __int16 v33 = 1024;
        int v34 = 1039;
        _os_log_impl(&dword_2214B8000, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected block size of 0", buf, 0x22u);
      }
    }
    else
    {
      unint64_t v23 = 0;
      uint64_t v24 = 1;
      do
      {
        uint64_t v25 = objc_msgSend(v5, "subdataWithRange:", v24, v10);
        [v7 addObject:v25];

        v24 += v10;
        ++v23;
      }
      while (*(void *)(a1 + 56) > v23);
      id v6 = 0;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sendRequestWithFlag:(int64_t)a3 commandCode:(int64_t)a4 data:(id)a5 completionHandler:(id)a6
{
  char v7 = a4;
  char v8 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = _os_activity_create(&dword_2214B8000, "NFCISO15693Tag sendRequestWithFlag:commandCode:data:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  LOBYTE(state.opaque[0]) = v8;
  BYTE1(state.opaque[0]) = v7;
  int v13 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithBytes:&state length:2];
  uint64_t v14 = v13;
  if (v10) {
    [v13 appendData:v10];
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __73__NFCISO15693Tag_sendRequestWithFlag_commandCode_data_completionHandler___block_invoke;
  v16[3] = &unk_2645B42E0;
  id v17 = v11;
  id v15 = v11;
  [(NFCTag *)self _transceiveWithData:v14 completionHandler:v16];
}

void __73__NFCISO15693Tag_sendRequestWithFlag_commandCode_data_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    char v7 = v6;
LABEL_3:
    char v8 = 0;
    goto LABEL_10;
  }
  if (![v5 length])
  {
    id v11 = @"TagResponseInvalidLength";
    v12[0] = MEMORY[0x263EFFA88];
    id v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    char v7 = +[NFCError errorWithCode:102 userInfo:v10];

    goto LABEL_3;
  }
  id v9 = v5;
  [v9 bytes];
  if ((unint64_t)[v9 length] < 2)
  {
    char v8 = 0;
  }
  else
  {
    char v8 = objc_msgSend(v9, "subdataWithRange:", 1, objc_msgSend(v9, "length") - 1);
  }
  char v7 = 0;
LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end