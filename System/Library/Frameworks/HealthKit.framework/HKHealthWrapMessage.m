@interface HKHealthWrapMessage
+ (id)newOutputFileURL;
+ (id)newOutputFileURLInDirectory:(id)a3;
- (BOOL)_run:(id)a3 error:(id *)a4;
- (BOOL)appendData:(id)a3 error:(id *)a4;
- (BOOL)appendDataFromFileURL:(id)a3 error:(id *)a4;
- (BOOL)startWithError:(id *)a3;
- (BOOL)startWithOutputFileURL:(id)a3 error:(id *)a4;
- (HKHealthWrapMessage)initWithConfiguration:(id)a3;
- (HKHealthWrapMessage)initWithSenderUUID:(id)a3 studyUUID:(id)a4 channel:(id)a5 payloadType:(id)a6 startDate:(id)a7 endDate:(id)a8 payloadIdentifier:(id)a9 applicationData:(id)a10 certificate:(__SecCertificate *)cf;
- (HKHealthWrapMessageConfiguration)configuration;
- (id)_codableKeyValuePairsFromDictionary:(id)a3;
- (id)finalizeWithError:(id *)a3;
- (void)_cleanup;
- (void)_finalize;
- (void)_writeDataToCompressor:(id)a3;
- (void)dealloc;
- (void)receiveSinkContent:(id)a3;
- (void)sinkContentFinished;
@end

@implementation HKHealthWrapMessage

- (HKHealthWrapMessage)initWithSenderUUID:(id)a3 studyUUID:(id)a4 channel:(id)a5 payloadType:(id)a6 startDate:(id)a7 endDate:(id)a8 payloadIdentifier:(id)a9 applicationData:(id)a10 certificate:(__SecCertificate *)cf
{
  id v17 = a3;
  id v38 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v39.receiver = self;
  v39.super_class = (Class)HKHealthWrapMessage;
  v24 = [(HKHealthWrapMessage *)&v39 init];
  v25 = v24;
  if (v24)
  {
    v24->_compressionEnabled = 1;
    objc_storeStrong((id *)&v24->_studyUUID, a4);
    v26 = objc_alloc_init(HKHealthWrapCodablePayloadHeader);
    payloadHeader = v25->_payloadHeader;
    v25->_payloadHeader = v26;

    v28 = (void *)[v22 copy];
    [(HKHealthWrapCodablePayloadHeader *)v25->_payloadHeader setPayloadIdentifier:v28];

    v29 = objc_msgSend(v17, "hk_dataForUUIDBytes");
    [(HKHealthWrapCodablePayloadHeader *)v25->_payloadHeader setSubjectUUID:v29];

    v30 = (void *)[v18 copy];
    [(HKHealthWrapCodablePayloadHeader *)v25->_payloadHeader setChannel:v30];

    v31 = (void *)[v19 copy];
    [(HKHealthWrapCodablePayloadHeader *)v25->_payloadHeader setPayloadType:v31];

    if (v20)
    {
      [v20 timeIntervalSinceReferenceDate];
      [(HKHealthWrapCodablePayloadHeader *)v25->_payloadHeader setStartDate:(uint64_t)v32];
    }
    if (v21)
    {
      [v21 timeIntervalSinceReferenceDate];
      [(HKHealthWrapCodablePayloadHeader *)v25->_payloadHeader setEndDate:(uint64_t)v33];
    }
    if (v23)
    {
      v34 = (void *)[v23 copy];
      [(HKHealthWrapCodablePayloadHeader *)v25->_payloadHeader setApplicationData:v34];
    }
    CFRetain(cf);
    v25->_certificate = cf;
    uint64_t v35 = HKCreateSerialDispatchQueue(v25, @"stream");
    encryptQueue = v25->_encryptQueue;
    v25->_encryptQueue = (OS_dispatch_queue *)v35;
  }
  return v25;
}

- (HKHealthWrapMessage)initWithConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HKHealthWrapMessage.m", 135, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  v6 = [v5 subjectUUID];
  v7 = [v5 studyUUID];
  v8 = [v5 channel];
  v9 = [v5 payloadType];
  v10 = [v5 startDate];
  v11 = [v5 endDate];
  v12 = [v5 payloadIdentifier];
  v13 = [v5 applicationData];
  v14 = -[HKHealthWrapMessage initWithSenderUUID:studyUUID:channel:payloadType:startDate:endDate:payloadIdentifier:applicationData:certificate:](self, "initWithSenderUUID:studyUUID:channel:payloadType:startDate:endDate:payloadIdentifier:applicationData:certificate:", v6, v7, v8, v9, v10, v11, v12, v13, [v5 certificate]);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_configuration, a3);
    if ([(HKHealthWrapMessageConfiguration *)v14->_configuration disableCompression]) {
      v14->_compressionEnabled = 0;
    }
    v15 = [v5 keyValuePairs];
    v16 = [(HKHealthWrapMessage *)v14 _codableKeyValuePairsFromDictionary:v15];
    [(HKHealthWrapCodablePayloadHeader *)v14->_payloadHeader setKeyValuePairs:v16];
  }
  return v14;
}

- (void)dealloc
{
  certificate = self->_certificate;
  if (certificate)
  {
    CFRelease(certificate);
    self->_certificate = 0;
  }
  [(NSOutputStream *)self->_outputStream close];
  v4.receiver = self;
  v4.super_class = (Class)HKHealthWrapMessage;
  [(HKHealthWrapMessage *)&v4 dealloc];
}

- (id)_codableKeyValuePairsFromDictionary:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F1CA48];
    id v4 = a3;
    id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__HKHealthWrapMessage__codableKeyValuePairsFromDictionary___block_invoke;
    v8[3] = &unk_1E58C0D48;
    id v6 = v5;
    id v9 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __59__HKHealthWrapMessage__codableKeyValuePairsFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = objc_alloc_init(HKHealthWrapCodableKeyValue);
  v7 = objc_alloc_init(HKHealthWrapCodableValue);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(HKHealthWrapCodableValue *)v7 setType:1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(HKHealthWrapCodableValue *)v7 setType:3];
      [(HKHealthWrapCodableValue *)v7 setString:v5];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(HKHealthWrapCodableValue *)v7 setType:4];
        -[HKHealthWrapCodableValue setInteger:](v7, "setInteger:", [v5 longLongValue]);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(HKHealthWrapCodableValue *)v7 setType:2];
          [(HKHealthWrapCodableValue *)v7 setBytes:v5];
        }
        else
        {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Invalid value type for key: %@", v8 format];
        }
      }
    }
  }
  [(HKHealthWrapCodableKeyValue *)v6 setValue:v7];
  [(HKHealthWrapCodableKeyValue *)v6 setKey:v8];
  [*(id *)(a1 + 32) addObject:v6];
}

- (BOOL)startWithError:(id *)a3
{
  id v5 = (void *)[(id)objc_opt_class() newOutputFileURL];
  LOBYTE(a3) = [(HKHealthWrapMessage *)self startWithOutputFileURL:v5 error:a3];

  return (char)a3;
}

+ (id)newOutputFileURL
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = NSTemporaryDirectory();
  id v5 = [v3 fileURLWithPath:v4];
  id v6 = (void *)[a1 newOutputFileURLInDirectory:v5];

  return v6;
}

+ (id)newOutputFileURLInDirectory:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F29128];
  id v4 = a3;
  id v5 = [v3 UUID];
  id v6 = NSString;
  v7 = [v5 UUIDString];
  id v8 = [v6 stringWithFormat:@"%@-%@", @"HealthWrap-", v7];

  id v9 = [v4 URLByAppendingPathComponent:v8];

  return v9;
}

- (BOOL)startWithOutputFileURL:(id)a3 error:(id *)a4
{
  id v7 = a3;
  self->_lastSuccess = 1;
  id v8 = [MEMORY[0x1E4F29128] UUID];
  objc_storeStrong((id *)&self->_outputURL, a3);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA8]) initWithURL:v7 append:0];
  objc_storeStrong((id *)&self->_outputStream, v9);
  MEMORY[0x19F394CA0](v9, self->_encryptQueue);
  v10 = [HKHealthWrapEncryptor alloc];
  LOBYTE(v17) = self->_compressionEnabled;
  v11 = [(HKHealthWrapEncryptor *)v10 initWithOutputStream:v9 certificate:self->_certificate algorithm:0 options:1 keySize:32 uuid:v8 studyUUID:self->_studyUUID compressionEnabled:v17];
  encryptor = self->_encryptor;
  self->_encryptor = v11;

  BOOL v13 = 0;
  if ([(HKHealthWrapEncryptor *)self->_encryptor startWithError:a4])
  {
    if (self->_compressionEnabled)
    {
      v14 = [[_HKCompressionEngine alloc] initWithFunction:0 algorithm:1 destination:self];
      compressionEngine = self->_compressionEngine;
      self->_compressionEngine = v14;
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__HKHealthWrapMessage_startWithOutputFileURL_error___block_invoke;
    v18[3] = &unk_1E58BBA00;
    v18[4] = self;
    BOOL v13 = [(HKHealthWrapMessage *)self _run:v18 error:a4];
  }

  return v13;
}

void __52__HKHealthWrapMessage_startWithOutputFileURL_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HKHealthWrapMessage_startWithOutputFileURL_error___block_invoke_2;
  block[3] = &unk_1E58BBA00;
  block[4] = v1;
  dispatch_sync(v2, block);
}

void __52__HKHealthWrapMessage_startWithOutputFileURL_error___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(id **)(a1 + 32);
  id v2 = [v1[1] data];
  [v1 _writeDataToCompressor:v2];
}

- (BOOL)appendDataFromFileURL:(id)a3 error:(id *)a4
{
  id v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:1 error:a4];
  if (v6) {
    BOOL v7 = [(HKHealthWrapMessage *)self appendData:v6 error:a4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)appendData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__HKHealthWrapMessage_appendData_error___block_invoke;
  v9[3] = &unk_1E58BBBD0;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  LOBYTE(a4) = [(HKHealthWrapMessage *)self _run:v9 error:a4];

  return (char)a4;
}

uint64_t __40__HKHealthWrapMessage_appendData_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _writeDataToCompressor:*(void *)(a1 + 40)];
}

- (void)_finalize
{
  if (self->_compressionEnabled)
  {
    compressionEngine = self->_compressionEngine;
    [(_HKCompressionEngine *)compressionEngine sourceContentFinished];
  }
  else
  {
    encryptor = self->_encryptor;
    id obj = 0;
    BOOL v5 = [(HKHealthWrapEncryptor *)encryptor finalizeWithError:&obj];
    id v6 = obj;
    self->_lastSuccess = v5;
    objc_storeStrong((id *)&self->_lastError, v6);
  }
}

- (id)finalizeWithError:(id *)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__HKHealthWrapMessage_finalizeWithError___block_invoke;
  v6[3] = &unk_1E58BBA00;
  v6[4] = self;
  if ([(HKHealthWrapMessage *)self _run:v6 error:a3]) {
    outputURL = self->_outputURL;
  }
  else {
    outputURL = 0;
  }
  return outputURL;
}

uint64_t __41__HKHealthWrapMessage_finalizeWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finalize];
}

- (BOOL)_run:(id)a3 error:(id *)a4
{
  self->_BOOL lastSuccess = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  BOOL lastSuccess = self->_lastSuccess;
  if (!self->_lastSuccess)
  {
    [(HKHealthWrapMessage *)self _cleanup];
    id v7 = self->_lastError;
    id v8 = v7;
    if (v7)
    {
      if (a4) {
        *a4 = v7;
      }
      else {
        _HKLogDroppedError(v7);
      }
    }
  }
  return lastSuccess;
}

- (void)_writeDataToCompressor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  if (v5)
  {
    unint64_t v16 = bswap64(v5);
    id v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v16 length:8];
    if (self->_compressionEnabled)
    {
      [(_HKCompressionEngine *)self->_compressionEngine writeSourceContent:v6];
      [(_HKCompressionEngine *)self->_compressionEngine writeSourceContent:v4];
    }
    else
    {
      encryptor = self->_encryptor;
      id v15 = 0;
      BOOL v8 = [(HKHealthWrapEncryptor *)encryptor appendData:v6 error:&v15];
      id v9 = v15;
      self->_BOOL lastSuccess = v8;
      id v10 = self->_encryptor;
      id v14 = v9;
      BOOL v11 = [(HKHealthWrapEncryptor *)v10 appendData:v4 error:&v14];
      v12 = (NSError *)v14;

      self->_BOOL lastSuccess = v11;
      lastError = self->_lastError;
      self->_lastError = v12;
    }
  }
}

- (void)_cleanup
{
  compressionEngine = self->_compressionEngine;
  self->_compressionEngine = 0;

  [(HKHealthWrapEncryptor *)self->_encryptor finalizeWithError:0];
  encryptor = self->_encryptor;
  self->_encryptor = 0;

  [(NSOutputStream *)self->_outputStream close];
  outputStream = self->_outputStream;
  self->_outputStream = 0;

  if (self->_outputURL)
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v6 removeItemAtURL:self->_outputURL error:0];

    outputURL = self->_outputURL;
    self->_outputURL = 0;
  }
}

- (void)receiveSinkContent:(id)a3
{
  id v4 = a3;
  encryptQueue = self->_encryptQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__HKHealthWrapMessage_receiveSinkContent___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(encryptQueue, v7);
}

void __42__HKHealthWrapMessage_receiveSinkContent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 40);
  id obj = 0;
  char v4 = [v3 appendData:v2 error:&obj];
  id v5 = obj;
  *(unsigned char *)(*(void *)(a1 + 32) + 73) = v4;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), v5);
}

- (void)sinkContentFinished
{
  encryptQueue = self->_encryptQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__HKHealthWrapMessage_sinkContentFinished__block_invoke;
  block[3] = &unk_1E58BBA00;
  block[4] = self;
  dispatch_sync(encryptQueue, block);
}

void __42__HKHealthWrapMessage_sinkContentFinished__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id obj = 0;
  char v3 = [v2 finalizeWithError:&obj];
  id v4 = obj;
  *(unsigned char *)(*(void *)(a1 + 32) + 73) = v3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), v4);
}

- (HKHealthWrapMessageConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_encryptQueue, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_encryptor, 0);
  objc_storeStrong((id *)&self->_compressionEngine, 0);
  objc_storeStrong((id *)&self->_studyUUID, 0);

  objc_storeStrong((id *)&self->_payloadHeader, 0);
}

@end