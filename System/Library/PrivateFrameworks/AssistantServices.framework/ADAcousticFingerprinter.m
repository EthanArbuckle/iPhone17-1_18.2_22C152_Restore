@interface ADAcousticFingerprinter
- (ADAcousticFingerprinter)init;
- (ADAcousticFingerprinterDelegate)delegate;
- (BOOL)_needsConversion;
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

@implementation ADAcousticFingerprinter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asxConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (ADAcousticFingerprinterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ADAcousticFingerprinterDelegate *)WeakRetained;
}

- (void)reset
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013AEDC;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)flush
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013AFC8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)appendPCMData:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013B2BC;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_convertPCMDataForFingerprinting:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && self->_fingerprinterConverter)
  {
    unint64_t v6 = 2 * (uint64_t)[v4 length] / (unint64_t)self->_sourceASBD.mBytesPerPacket;
    unint64_t v7 = (unint64_t)[v5 length] / self->_sourceASBD.mBytesPerPacket;
    id v8 = [objc_alloc((Class)NSMutableData) initWithLength:v6];
    UInt32 ioOutputDataPacketSize = v7;
    *(void *)&outOutputData.mNumberBuffers = 1;
    outOutputData.mBuffers[0].mNumberChannels = 1;
    outOutputData.mBuffers[0].mDataByteSize = [v8 length];
    id v9 = v8;
    outOutputData.mBuffers[0].mData = [v9 mutableBytes];
    fingerprinterConverter = self->_fingerprinterConverter;
    inInputDataProcUserData[0] = _NSConcreteStackBlock;
    inInputDataProcUserData[1] = 3221225472;
    inInputDataProcUserData[2] = sub_10013B9AC;
    inInputDataProcUserData[3] = &unk_100503680;
    int v17 = v7;
    id v16 = v5;
    OSStatus v11 = AudioConverterFillComplexBuffer(fingerprinterConverter, (AudioConverterComplexInputDataProc)sub_10013BA04, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, 0);
    [v9 setLength:2 * ioOutputDataPacketSize];
    if (v11)
    {
      unsigned int v14 = bswap32(v11);
      v12 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v21 = "-[ADAcousticFingerprinter _convertPCMDataForFingerprinting:]";
        __int16 v22 = 1042;
        int v23 = 4;
        __int16 v24 = 2082;
        v25 = &v14;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Error during conversion for fingerprinter %{public}.4s", buf, 0x1Cu);
      }
    }
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

- (BOOL)_needsConversion
{
  return self->_sourceASBD.mFormatFlags != 12 || self->_sourceASBD.mBytesPerPacket != 2;
}

- (void)_configureWithCurrentASBD
{
  self->_nextFingerprintSampleNumber = [(ADAcousticFingerprinter *)self _samplesPerInterval];
  v3 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int mSampleRate = (int)self->_sourceASBD.mSampleRate;
    LODWORD(buf.mSampleRate) = 136315394;
    *(void *)((char *)&buf.mSampleRate + 4) = "-[ADAcousticFingerprinter _configureWithCurrentASBD]";
    LOWORD(buf.mFormatFlags) = 1024;
    *(AudioFormatFlags *)((char *)&buf.mFormatFlags + 2) = mSampleRate;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Setting sample rate to %d", (uint8_t *)&buf, 0x12u);
  }
  uint64_t v5 = sub_10013B4E4((uint64_t)self->_sourceASBD.mSampleRate);
  unint64_t v6 = [(ADAcousticFingerprinter *)self _service];
  [v6 setSampleRate:v5];

  fingerprinterConverter = self->_fingerprinterConverter;
  if (fingerprinterConverter)
  {
    AudioConverterDispose(fingerprinterConverter);
    self->_fingerprinterConverter = 0;
  }
  if ([(ADAcousticFingerprinter *)self _needsConversion])
  {
    *(_OWORD *)&buf.int mSampleRate = xmmword_1003E2AF8;
    *(_OWORD *)&buf.mBytesPerPacket = unk_1003E2B08;
    *(void *)&buf.mBitsPerChannel = 16;
    buf.int mSampleRate = self->_sourceASBD.mSampleRate;
    OSStatus v8 = AudioConverterNew(&self->_sourceASBD, &buf, &self->_fingerprinterConverter);
    if (v8)
    {
      unsigned int v10 = bswap32(v8);
      id v9 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)OSStatus v11 = 136315650;
        v12 = "-[ADAcousticFingerprinter _configureWithCurrentASBD]";
        __int16 v13 = 1042;
        int v14 = 4;
        __int16 v15 = 2082;
        id v16 = &v10;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Could not make Fingerprinter decoder: %{public}.4s", v11, 0x1Cu);
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
    [(ADAcousticFingerprinter *)self _configureWithCurrentASBD];
  }
}

- (void)setFingerprintInterval:(double)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10013BCF4;
  v4[3] = &unk_10050D8C0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (unint64_t)_samplesPerInterval
{
  return (unint64_t)(self->_sourceASBD.mSampleRate * self->_interval);
}

- (id)_serviceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ADAcousticFingerprinter *)self _connection];
  unint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_service
{
  v2 = [(ADAcousticFingerprinter *)self _connection];
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
  long long v3 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[ADAcousticFingerprinter _connectionInvalidated]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(ADAcousticFingerprinter *)self _cleanUpConnection];
}

- (void)_connectionInterrupted
{
  long long v3 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[ADAcousticFingerprinter _connectionInterrupted]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(ADAcousticFingerprinter *)self _cleanUpConnection];
}

- (id)_connection
{
  asxConnection = self->_asxConnection;
  if (!asxConnection)
  {
    int v4 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.siri.acousticsignature"];
    uint64_t v5 = self->_asxConnection;
    self->_asxConnection = v4;

    [(NSXPCConnection *)self->_asxConnection _setQueue:self->_queue];
    unint64_t v6 = self->_asxConnection;
    unint64_t v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ASXSignatureExtracting];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    objc_initWeak(&location, self);
    OSStatus v8 = self->_asxConnection;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10013C160;
    v13[3] = &unk_10050B790;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v8 setInterruptionHandler:v13];
    id v9 = self->_asxConnection;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10013C1A0;
    v11[3] = &unk_10050B790;
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

- (void)dealloc
{
  fingerprinterConverter = self->_fingerprinterConverter;
  if (fingerprinterConverter) {
    AudioConverterDispose(fingerprinterConverter);
  }
  [(ADAcousticFingerprinter *)self _cleanUpConnection];
  v4.receiver = self;
  v4.super_class = (Class)ADAcousticFingerprinter;
  [(ADAcousticFingerprinter *)&v4 dealloc];
}

- (ADAcousticFingerprinter)init
{
  v7.receiver = self;
  v7.super_class = (Class)ADAcousticFingerprinter;
  v2 = [(ADAcousticFingerprinter *)&v7 init];
  if (v2)
  {
    long long v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ADAcousticFingerprinter", v3);
    uint64_t v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    *((void *)v2 + 6) = 0x40CF400000000000;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *((void *)v2 + 11) = 0x3FF0000000000000;
    *((void *)v2 + 5) = [v2 _samplesPerInterval];
  }
  return (ADAcousticFingerprinter *)v2;
}

@end