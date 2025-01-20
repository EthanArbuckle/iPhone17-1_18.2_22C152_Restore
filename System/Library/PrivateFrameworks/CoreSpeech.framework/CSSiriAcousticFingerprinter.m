@interface CSSiriAcousticFingerprinter
- (BOOL)_needsConversion;
- (CSSiriAcousticFingerprinter)init;
- (CSSiriAcousticFingerprinterDelegate)delegate;
- (id)_connection;
- (id)_convertPCMDataForFingerprinting:(id)a3;
- (id)_service;
- (id)_serviceWithErrorHandler:(id)a3;
- (unint64_t)_samplesPerInterval;
- (void)_cleanUpConnection;
- (void)_configureWithCurrentASBD;
- (void)_connectionInterrupted;
- (void)_connectionInvalidated;
- (void)appendPCMData:(id)a3;
- (void)dealloc;
- (void)flush;
- (void)reset;
- (void)setASBD:(AudioStreamBasicDescription *)a3;
- (void)setDelegate:(id)a3;
- (void)setFingerprintInterval:(double)a3;
@end

@implementation CSSiriAcousticFingerprinter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asxConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (CSSiriAcousticFingerprinterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSSiriAcousticFingerprinterDelegate *)WeakRetained;
}

- (void)reset
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CSSiriAcousticFingerprinter_reset__block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __36__CSSiriAcousticFingerprinter_reset__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[4])
  {
    id v3 = [v2 _service];
    [v3 reset];
    [*(id *)(a1 + 32) _configureWithCurrentASBD];
    *(void *)(*(void *)(a1 + 32) + 32) = 0;
  }
}

- (void)flush
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CSSiriAcousticFingerprinter_flush__block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __36__CSSiriAcousticFingerprinter_flush__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = (double)*(unint64_t *)(v2 + 32) / *(double *)(v2 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__CSSiriAcousticFingerprinter_flush__block_invoke_2;
  v6[3] = &unk_1E658C470;
  v6[4] = v2;
  *(double *)&v6[5] = v3;
  v4 = [(id)v2 _serviceWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__CSSiriAcousticFingerprinter_flush__block_invoke_62;
  v5[3] = &unk_1E658C498;
  v5[4] = *(void *)(a1 + 32);
  *(double *)&v5[5] = v3;
  [v4 getSignature:v5];
}

void __36__CSSiriAcousticFingerprinter_flush__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    v7 = "-[CSSiriAcousticFingerprinter flush]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1C9338000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained acousticFingerprinter:*(void *)(a1 + 32) hasFingerprint:0 duration:*(double *)(a1 + 40)];
}

void __36__CSSiriAcousticFingerprinter_flush__block_invoke_62(uint64_t a1, void *a2)
{
  id v3 = (id *)(*(void *)(a1 + 32) + 24);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained acousticFingerprinter:*(void *)(a1 + 32) hasFingerprint:v4 duration:*(double *)(a1 + 40)];
}

- (void)appendPCMData:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__CSSiriAcousticFingerprinter_appendPCMData___block_invoke;
  v7[3] = &unk_1E658D4B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __45__CSSiriAcousticFingerprinter_appendPCMData___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 32) length] / (unint64_t)*(unsigned int *)(*(void *)(a1 + 40) + 64);
  id v3 = [*(id *)(a1 + 40) _convertPCMDataForFingerprinting:*(void *)(a1 + 32)];
  id v4 = [*(id *)(a1 + 40) _service];
  [v4 appendAcousticData:v3 sampleCount:v2 sampleRate:ASXSampleRateFromInt((uint64_t)*(double *)(*(void *)(a1 + 40) + 48))];

  *(void *)(*(void *)(a1 + 40) + 32) += (int)v2;
  v5 = *(void **)(a1 + 40);
  if (v5[4] > v5[5])
  {
    *(void *)(*(void *)(a1 + 40) + 40) += [v5 _samplesPerInterval];
    uint64_t v6 = *(void *)(a1 + 40);
    double v7 = (double)*(unint64_t *)(v6 + 32) / *(double *)(v6 + 48);
    id v8 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[CSSiriAcousticFingerprinter appendPCMData:]_block_invoke";
      __int16 v14 = 2048;
      double v15 = v7;
      _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s Getting signature for duration %lf", buf, 0x16u);
      uint64_t v6 = *(void *)(a1 + 40);
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__CSSiriAcousticFingerprinter_appendPCMData___block_invoke_58;
    v11[3] = &unk_1E658C470;
    v11[4] = v6;
    *(double *)&v11[5] = v7;
    id v9 = [(id)v6 _serviceWithErrorHandler:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__CSSiriAcousticFingerprinter_appendPCMData___block_invoke_60;
    v10[3] = &unk_1E658C498;
    v10[4] = *(void *)(a1 + 40);
    *(double *)&v10[5] = v7;
    [v9 getSignature:v10];
  }
}

void __45__CSSiriAcousticFingerprinter_appendPCMData___block_invoke_58(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    double v7 = "-[CSSiriAcousticFingerprinter appendPCMData:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1C9338000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained acousticFingerprinter:*(void *)(a1 + 32) hasFingerprint:0 duration:*(double *)(a1 + 40)];
}

void __45__CSSiriAcousticFingerprinter_appendPCMData___block_invoke_60(uint64_t a1, void *a2)
{
  id v3 = (id *)(*(void *)(a1 + 32) + 24);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained acousticFingerprinter:*(void *)(a1 + 32) hasFingerprint:v4 duration:*(double *)(a1 + 40)];
}

- (id)_convertPCMDataForFingerprinting:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4 && self->_fingerprinterConverter)
  {
    unint64_t v6 = 2 * [v4 length] / (unint64_t)self->_sourceASBD.mBytesPerPacket;
    unint64_t v7 = [v5 length] / (unint64_t)self->_sourceASBD.mBytesPerPacket;
    __int16 v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v6];
    UInt32 ioOutputDataPacketSize = v7;
    *(void *)&outOutputData.mNumberBuffers = 1;
    outOutputData.mBuffers[0].mNumberChannels = 1;
    outOutputData.mBuffers[0].mDataByteSize = [v8 length];
    id v9 = v8;
    outOutputData.mBuffers[0].mData = (void *)[v9 mutableBytes];
    fingerprinterConverter = self->_fingerprinterConverter;
    inInputDataProcUserData[0] = MEMORY[0x1E4F143A8];
    inInputDataProcUserData[1] = 3221225472;
    inInputDataProcUserData[2] = __64__CSSiriAcousticFingerprinter__convertPCMDataForFingerprinting___block_invoke;
    inInputDataProcUserData[3] = &unk_1E658C448;
    int v17 = v7;
    id v16 = v5;
    OSStatus v11 = AudioConverterFillComplexBuffer(fingerprinterConverter, (AudioConverterComplexInputDataProc)AudioConverterFillComplexBuffer_BlockInvoke, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, 0);
    [v9 setLength:2 * ioOutputDataPacketSize];
    if (v11)
    {
      unsigned int v14 = bswap32(v11);
      v12 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v21 = "-[CSSiriAcousticFingerprinter _convertPCMDataForFingerprinting:]";
        __int16 v22 = 1042;
        int v23 = 4;
        __int16 v24 = 2082;
        v25 = &v14;
        _os_log_error_impl(&dword_1C9338000, v12, OS_LOG_TYPE_ERROR, "%s Error during conversion for fingerprinter %{public}.4s", buf, 0x1Cu);
      }
    }
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

uint64_t __64__CSSiriAcousticFingerprinter__convertPCMDataForFingerprinting___block_invoke(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  *a2 = *(_DWORD *)(a1 + 40);
  *(_DWORD *)a3 = 1;
  *(_DWORD *)(a3 + 8) = 1;
  *(void *)(a3 + 16) = [*(id *)(a1 + 32) bytes];
  *(_DWORD *)(a3 + 12) = [*(id *)(a1 + 32) length];
  return 0;
}

- (BOOL)_needsConversion
{
  return self->_sourceASBD.mFormatFlags != 12 || self->_sourceASBD.mBytesPerPacket != 2;
}

- (void)_configureWithCurrentASBD
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self->_nextFingerprintSampleNumber = [(CSSiriAcousticFingerprinter *)self _samplesPerInterval];
  id v3 = (os_log_t *)MEMORY[0x1E4F4E380];
  id v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int mSampleRate = (int)self->_sourceASBD.mSampleRate;
    LODWORD(buf.mSampleRate) = 136315394;
    *(void *)((char *)&buf.mSampleRate + 4) = "-[CSSiriAcousticFingerprinter _configureWithCurrentASBD]";
    LOWORD(buf.mFormatFlags) = 1024;
    *(AudioFormatFlags *)((char *)&buf.mFormatFlags + 2) = mSampleRate;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, "%s Setting sample rate to %d", (uint8_t *)&buf, 0x12u);
  }
  uint64_t v6 = ASXSampleRateFromInt((uint64_t)self->_sourceASBD.mSampleRate);
  unint64_t v7 = [(CSSiriAcousticFingerprinter *)self _service];
  [v7 setSampleRate:v6];

  fingerprinterConverter = self->_fingerprinterConverter;
  if (fingerprinterConverter)
  {
    AudioConverterDispose(fingerprinterConverter);
    self->_fingerprinterConverter = 0;
  }
  if ([(CSSiriAcousticFingerprinter *)self _needsConversion])
  {
    *(_OWORD *)&buf.int mSampleRate = FingerprinterASBD;
    *(_OWORD *)&buf.mBytesPerPacket = unk_1C94A6F78;
    *(void *)&buf.mBitsPerChannel = 16;
    buf.int mSampleRate = self->_sourceASBD.mSampleRate;
    OSStatus v9 = AudioConverterNew(&self->_sourceASBD, &buf, &self->_fingerprinterConverter);
    if (v9)
    {
      unsigned int v11 = bswap32(v9);
      uint64_t v10 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v12 = 136315650;
        v13 = "-[CSSiriAcousticFingerprinter _configureWithCurrentASBD]";
        __int16 v14 = 1042;
        int v15 = 4;
        __int16 v16 = 2082;
        int v17 = &v11;
        _os_log_error_impl(&dword_1C9338000, v10, OS_LOG_TYPE_ERROR, "%s Could not make Fingerprinter decoder: %{public}.4s", v12, 0x1Cu);
      }
    }
  }
}

- (void)setASBD:(AudioStreamBasicDescription *)a3
{
  if (a3)
  {
    long long v3 = *(_OWORD *)&a3->mSampleRate;
    long long v4 = *(_OWORD *)&a3->mBytesPerPacket;
    *(void *)&self->_sourceASBD.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
    *(_OWORD *)&self->_sourceASBD.int mSampleRate = v3;
    *(_OWORD *)&self->_sourceASBD.mBytesPerPacket = v4;
    [(CSSiriAcousticFingerprinter *)self _configureWithCurrentASBD];
  }
}

- (void)setFingerprintInterval:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__CSSiriAcousticFingerprinter_setFingerprintInterval___block_invoke;
  v4[3] = &unk_1E658D3C8;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

double __54__CSSiriAcousticFingerprinter_setFingerprintInterval___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 88) = result;
  return result;
}

- (unint64_t)_samplesPerInterval
{
  return (unint64_t)(self->_sourceASBD.mSampleRate * self->_interval);
}

- (id)_serviceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(CSSiriAcousticFingerprinter *)self _connection];
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_service
{
  unint64_t v2 = [(CSSiriAcousticFingerprinter *)self _connection];
  long long v3 = [v2 remoteObjectProxy];

  return v3;
}

- (void)_cleanUpConnection
{
  asxConnection = self->_asxConnection;
  if (asxConnection)
  {
    [(NSXPCConnection *)asxConnection setExportedObject:0];
    [(NSXPCConnection *)self->_asxConnection invalidate];
    id v4 = self->_asxConnection;
    self->_asxConnection = 0;
  }
}

- (void)_connectionInvalidated
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  long long v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[CSSiriAcousticFingerprinter _connectionInvalidated]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(CSSiriAcousticFingerprinter *)self _cleanUpConnection];
}

- (void)_connectionInterrupted
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  long long v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[CSSiriAcousticFingerprinter _connectionInterrupted]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(CSSiriAcousticFingerprinter *)self _cleanUpConnection];
}

- (id)_connection
{
  asxConnection = self->_asxConnection;
  if (!asxConnection)
  {
    int v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.siri.acousticsignature"];
    v5 = self->_asxConnection;
    self->_asxConnection = v4;

    [(NSXPCConnection *)self->_asxConnection _setQueue:self->_queue];
    uint64_t v6 = self->_asxConnection;
    unint64_t v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2405D98];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    objc_initWeak(&location, self);
    __int16 v8 = self->_asxConnection;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __42__CSSiriAcousticFingerprinter__connection__block_invoke;
    v13[3] = &unk_1E658C420;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v8 setInterruptionHandler:v13];
    OSStatus v9 = self->_asxConnection;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42__CSSiriAcousticFingerprinter__connection__block_invoke_2;
    v11[3] = &unk_1E658C420;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)v9 setInvalidationHandler:v11];
    [(NSXPCConnection *)self->_asxConnection resume];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    asxConnection = self->_asxConnection;
  }
  return asxConnection;
}

void __42__CSSiriAcousticFingerprinter__connection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInterrupted];
}

void __42__CSSiriAcousticFingerprinter__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidated];
}

- (void)dealloc
{
  fingerprinterConverter = self->_fingerprinterConverter;
  if (fingerprinterConverter) {
    AudioConverterDispose(fingerprinterConverter);
  }
  [(CSSiriAcousticFingerprinter *)self _cleanUpConnection];
  v4.receiver = self;
  v4.super_class = (Class)CSSiriAcousticFingerprinter;
  [(CSSiriAcousticFingerprinter *)&v4 dealloc];
}

- (CSSiriAcousticFingerprinter)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSSiriAcousticFingerprinter;
  unint64_t v2 = [(CSSiriAcousticFingerprinter *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("ADAcousticFingerprinter", 0);
    objc_super v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    *((void *)v2 + 6) = 0x40CF400000000000;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *((void *)v2 + 11) = 0x3FF0000000000000;
    *((void *)v2 + 5) = [v2 _samplesPerInterval];
  }
  return (CSSiriAcousticFingerprinter *)v2;
}

@end