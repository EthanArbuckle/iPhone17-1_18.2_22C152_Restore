@interface MOVStreamVideoEncoderInterface
+ (__CVBuffer)createHEVCCompatiblePixelBuffer:(__CVBuffer *)a3;
- (BOOL)configureSessionOverride:(OpaqueVTCompressionSession *)a3;
- (BOOL)customEncoderConfig;
- (BOOL)formatDescriptionHasChanged:(opaqueCMFormatDescription *)a3;
- (BOOL)frameReorderingEnabled;
- (BOOL)preSetupWithFormatDescription:(opaqueCMFormatDescription *)a3;
- (BOOL)processFrame:(__CVBuffer *)a3 pts:(id *)a4 frameProperties:(__CFDictionary *)a5 metadata:(id)a6;
- (BOOL)shouldEnableInProcessEncoding;
- (BOOL)useLegacyVTController;
- (MOVStreamVideoEncoderInterface)init;
- (MOVStreamVideoEncoderInterface)initWithExpectedFrameRate:(double)a3 forStream:(id)a4 delegate:(id)a5 enableAVEHighPerformanceProfile:(BOOL)a6;
- (id)initForStream:(id)a3 configuration:(id)a4 delegate:(id)a5;
- (id)overrideVideoEncoderSpecification;
- (int64_t)encodingQueueDepth;
- (int64_t)pendingFrames;
- (unsigned)codecTypeOverride;
- (unsigned)lastEncodingInfoFlags;
- (unsigned)lastEncodingStatus;
- (void)awaitEncoderClosed;
- (void)closeEncoder;
- (void)closeEncoderInDispatchGroup:(id)a3;
- (void)dealloc;
- (void)encodeFrame:(__CVBuffer *)a3 pts:(id *)a4 frameProperties:(__CFDictionary *)a5 metadata:(id)a6;
- (void)setCustomEncoderConfig:(BOOL)a3;
- (void)setEncodingQueueDepth:(int64_t)a3;
- (void)setPendingFrames:(int64_t)a3;
- (void)setUseLegacyVTController:(BOOL)a3;
- (void)setupEncoderWithWidth:(int)a3 andHeight:(int)a4 imageFormat:(int)a5 formatDescription:(opaqueCMFormatDescription *)a6 andFramerate:(double)a7;
- (void)skipFrameWithStatus:(int)a3 andFlags:(unsigned int)a4;
- (void)writeSampleBuffer:(opaqueCMSampleBuffer *)a3 pts:(id *)a4 metadata:(id)a5 withStatus:(int)a6 andFlags:(unsigned int)a7;
@end

@implementation MOVStreamVideoEncoderInterface

- (MOVStreamVideoEncoderInterface)init
{
  v3.receiver = self;
  v3.super_class = (Class)MOVStreamVideoEncoderInterface;
  if ([(MOVStreamVideoEncoderInterface *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (MOVStreamVideoEncoderInterface)initWithExpectedFrameRate:(double)a3 forStream:(id)a4 delegate:(id)a5 enableAVEHighPerformanceProfile:(BOOL)a6
{
  id v11 = a4;
  id v12 = a5;
  v13 = [(MOVStreamVideoEncoderInterface *)self init];
  v14 = v13;
  if (v13)
  {
    v13->m_expectedFrameRate = a3;
    objc_storeStrong((id *)&v13->m_stream, a4);
    objc_storeWeak((id *)&v14->m_delegate, v12);
    v14->m_enableAVEHighPerformanceProfile = a6;
  }

  return v14;
}

- (id)initForStream:(id)a3 configuration:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(MOVStreamVideoEncoderInterface *)self init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->m_config, a4);
    objc_storeStrong(p_isa + 4, a3);
    objc_storeWeak(p_isa + 5, v11);
  }

  return p_isa;
}

- (void)dealloc
{
  m_encoder = self->m_encoder;
  if (m_encoder)
  {
    MOVStreamHEVCLosslessEncoder::~MOVStreamHEVCLosslessEncoder(m_encoder);
    MEMORY[0x21D492190]();
  }
  m_preSetupFormatDescription = self->m_preSetupFormatDescription;
  if (m_preSetupFormatDescription) {
    CFRelease(m_preSetupFormatDescription);
  }
  v5.receiver = self;
  v5.super_class = (Class)MOVStreamVideoEncoderInterface;
  [(MOVStreamVideoEncoderInterface *)&v5 dealloc];
}

- (BOOL)shouldEnableInProcessEncoding
{
  p_m_delegate = &self->m_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_delegate);
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = objc_loadWeakRetained((id *)p_m_delegate);
  char v6 = [v5 shouldEnableInProcessEncoding];

  return v6;
}

- (void)setupEncoderWithWidth:(int)a3 andHeight:(int)a4 imageFormat:(int)a5 formatDescription:(opaqueCMFormatDescription *)a6 andFramerate:(double)a7
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ([(MOVStreamVideoEncoderInterface *)self useLegacyVTController])
  {
    m_encoder = self->m_encoder;
    m_encoder->var0 = self->m_enableAVEHighPerformanceProfile;
    if (MOVStreamHEVCLosslessEncoder::Open((uint64_t)m_encoder, a3, a4, a5, [(MOVStreamVideoEncoderInterface *)self shouldEnableInProcessEncoding], a6, (void (__cdecl *)(void *, void *, OSStatus, VTEncodeInfoFlags, CMSampleBufferRef))VTCompressionOutputCallbackImpl, self, a7))
    {
      self->m_failedState = 1;
      self->m_encoderInitialized = 0;
      v14 = self->m_encoder;
      MOVStreamHEVCLosslessEncoder::invalidateSession(v14);
      return;
    }
    goto LABEL_8;
  }
  v15 = [[MIOVideoEncoderController alloc] initWithEncoderConfig:self->m_config formtDescription:a6 inProcessEncoding:[(MOVStreamVideoEncoderInterface *)self shouldEnableInProcessEncoding] frameRate:self->m_enableAVEHighPerformanceProfile aveHighPerfMode:VTCompressionOutputCallbackImpl outputCallback:self delegate:a7];
  encoderCtrl = self->_encoderCtrl;
  self->_encoderCtrl = v15;

  v17 = self->_encoderCtrl;
  id v26 = 0;
  BOOL v18 = [(MIOVideoEncoderController *)v17 openEncoderWithContext:self error:&v26];
  id v19 = v26;
  v20 = v19;
  if (v18)
  {

LABEL_8:
    v21 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      m_stream = self->m_stream;
      BOOL v23 = MOVStreamHEVCLosslessEncoder::frameReorderingEnabled(self->m_encoder);
      *(_DWORD *)buf = 138543618;
      v28 = m_stream;
      __int16 v29 = 1024;
      LODWORD(v30) = v23;
      _os_log_impl(&dword_21B5ED000, v21, OS_LOG_TYPE_INFO, "%{public}@: Encoder frame reordering enabled: %d.", buf, 0x12u);
    }

    self->m_encoderInitialized = 1;
    return;
  }
  v24 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = self->m_stream;
    *(_DWORD *)buf = 138412546;
    v28 = v25;
    __int16 v29 = 2112;
    v30 = v20;
    _os_log_impl(&dword_21B5ED000, v24, OS_LOG_TYPE_ERROR, "Error opening encoding session '%@': %@", buf, 0x16u);
  }

  self->m_failedState = 1;
  self->m_encoderInitialized = 0;
  MOVStreamHEVCLosslessEncoder::invalidateSession(self->m_encoder);
}

- (BOOL)preSetupWithFormatDescription:(opaqueCMFormatDescription *)a3
{
  if (!a3) {
    return 0;
  }
  signed int MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3);
  uint64_t v7 = 11;
  if (MediaSubType <= 1278226487)
  {
    if (MediaSubType == 875704422 || MediaSubType == 875704438) {
      uint64_t v7 = 0;
    }
  }
  else
  {
    if (MediaSubType == 1278226742) {
      int v8 = 9;
    }
    else {
      int v8 = 11;
    }
    if (MediaSubType == 1278226736) {
      unsigned int v9 = 9;
    }
    else {
      unsigned int v9 = v8;
    }
    if (MediaSubType == 1278226488) {
      uint64_t v7 = 10;
    }
    else {
      uint64_t v7 = v9;
    }
  }
  [(MOVStreamVideoEncoderInterface *)self setupEncoderWithWidth:Dimensions andHeight:HIDWORD(Dimensions) imageFormat:v7 formatDescription:a3 andFramerate:self->m_expectedFrameRate];
  self->m_failedState = 0;
  if (!self->m_encoderInitialized) {
    return 0;
  }
  self->m_preSetupFormatDescription = a3;
  CFRetain(a3);
  return self->m_encoderInitialized;
}

- (BOOL)formatDescriptionHasChanged:(opaqueCMFormatDescription *)a3
{
  return CMFormatDescriptionEqual(a3, self->m_preSetupFormatDescription) == 0;
}

- (BOOL)processFrame:(__CVBuffer *)a3 pts:(id *)a4 frameProperties:(__CFDictionary *)a5 metadata:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a6;
  if (self->m_preSetupFormatDescription && self->m_encoderInitialized)
  {
    unsigned int v9 = +[MOVStreamIOUtility createFormatDescriptionFromPixelBuffer:a3];
    if ([(MOVStreamVideoEncoderInterface *)self formatDescriptionHasChanged:v9])
    {
      id v10 = [NSString stringWithFormat:@"Orig fd: %@  New fd: %@", v9, self->m_preSetupFormatDescription];
      id v11 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        m_stream = self->m_stream;
        *(_DWORD *)buf = 138543618;
        v24 = m_stream;
        __int16 v25 = 2114;
        id v26 = v10;
        _os_log_impl(&dword_21B5ED000, v11, OS_LOG_TYPE_INFO, "Format description changed for stream '%{public}@' failed (%{public}@)! Try re-initlialize encoder.", buf, 0x16u);
      }

      MOVStreamHEVCLosslessEncoder::InvalidateEncoder(self->m_encoder);
      self->m_encoderInitialized = 0;
    }
    CFRelease(v9);
    CFRelease(self->m_preSetupFormatDescription);
    self->m_preSetupFormatDescription = 0;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (self->m_encoderInitialized)
  {
LABEL_9:
    if (self->m_convertL016toL010) {
      +[MOVStreamVideoEncoderInterface createHEVCCompatiblePixelBuffer:a3];
    }
    operator new();
  }
  int v14 = PixelFormatType;
  v15 = +[MOVStreamIOUtility createFormatDescriptionFromPixelBuffer:a3];
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  if (v14 <= 1278226487)
  {
    uint64_t v18 = 0;
    if (v14 == 875704422 || v14 == 875704438) {
      goto LABEL_23;
    }
  }
  else
  {
    if (v14 == 1278226488)
    {
      uint64_t v18 = 10;
      goto LABEL_23;
    }
    if (v14 == 1278226736 || v14 == 1278226742)
    {
      uint64_t v18 = 9;
LABEL_23:
      double m_expectedFrameRate = self->m_expectedFrameRate;
      goto LABEL_24;
    }
  }
  BOOL v19 = [(MOVStreamVideoEncoderInterface *)self customEncoderConfig];
  double m_expectedFrameRate = 0.0;
  if (v19 || self->m_config)
  {
    uint64_t v18 = 11;
LABEL_24:
    [(MOVStreamVideoEncoderInterface *)self setupEncoderWithWidth:Width andHeight:Height imageFormat:v18 formatDescription:v15 andFramerate:m_expectedFrameRate];
  }
  if (v15) {
    CFRelease(v15);
  }
  if (self->m_encoderInitialized)
  {
    if (v14 == 1278226742)
    {
      unsigned int v21 = [(MOVStreamEncoderConfig *)self->m_config codecType];
      if (v21 == 1752589105 || !v21) {
        self->m_convertL016toL010 = 1;
      }
    }
    goto LABEL_9;
  }

  return 0;
}

- (void)encodeFrame:(__CVBuffer *)a3 pts:(id *)a4 frameProperties:(__CFDictionary *)a5 metadata:(id)a6
{
  id v10 = a6;
  if (!self->m_failedState)
  {
    CVPixelBufferRetain(a3);
    objc_initWeak(&location, self);
    m_encodingQueue = self->m_encodingQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __75__MOVStreamVideoEncoderInterface_encodeFrame_pts_frameProperties_metadata___block_invoke;
    v12[3] = &unk_2643AFAB8;
    objc_copyWeak(v14, &location);
    long long v15 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    v14[1] = a3;
    v14[2] = a5;
    id v13 = v10;
    dispatch_async(m_encodingQueue, v12);

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }
}

void __75__MOVStreamVideoEncoderInterface_encodeFrame_pts_frameProperties_metadata___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21D4924B0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    long long v7 = *(_OWORD *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 80);
    char v5 = [WeakRetained processFrame:*(void *)(a1 + 48) pts:&v7 frameProperties:*(void *)(a1 + 56) metadata:*(void *)(a1 + 32)];
    CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
    if ((v5 & 1) == 0)
    {
      *((unsigned char *)v4 + 65) = 1;
      MOVStreamHEVCLosslessEncoder::invalidateSession(*((MOVStreamHEVCLosslessEncoder **)v4 + 1));
      id v6 = objc_loadWeakRetained((id *)v4 + 5);
      [v6 encoder:v4 encodingFailedForStream:*((void *)v4 + 4)];
    }
  }
}

+ (__CVBuffer)createHEVCCompatiblePixelBuffer:(__CVBuffer *)a3
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  id v6 = +[MIOPixelBufferUtility createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:](MIOPixelBufferUtility, "createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:", Width, Height, 0, (CVPixelBufferGetBytesPerRow(a3) >> 1) - Width, 1278226736, 1, 1);
  if (!+[MIOPixelBufferUtility copyFromPixelBuffer:a3 toPixelBuffer:v6 andShiftBits:2])return 0; {
  +[MIOPixelBufferUtility transferAttachmentForKey:*MEMORY[0x263F03FC0] fromBuffer:a3 toBuffer:v6];
  }
  +[MIOPixelBufferUtility transferAttachmentForKey:*MEMORY[0x263F04020] fromBuffer:a3 toBuffer:v6];
  +[MIOPixelBufferUtility transferAttachmentForKey:*MEMORY[0x263F03ED8] fromBuffer:a3 toBuffer:v6];
  +[MIOPixelBufferUtility transferAttachmentForKey:*MEMORY[0x263F03E48] fromBuffer:a3 toBuffer:v6];
  +[MIOPixelBufferUtility transferAttachmentForKey:*MEMORY[0x263F03E58] fromBuffer:a3 toBuffer:v6];
  return v6;
}

- (BOOL)frameReorderingEnabled
{
  if ([(MOVStreamVideoEncoderInterface *)self useLegacyVTController])
  {
    m_encoder = self->m_encoder;
    if (!m_encoder)
    {
      id v6 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Encoder not configured yet." userInfo:0];
      objc_exception_throw(v6);
    }
    return MOVStreamHEVCLosslessEncoder::frameReorderingEnabled(m_encoder);
  }
  else
  {
    encoderCtrl = self->_encoderCtrl;
    return [(MIOVideoEncoderController *)encoderCtrl frameReorderingEnabled];
  }
}

- (void)awaitEncoderClosed
{
  m_encodingQueue = self->m_encodingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__MOVStreamVideoEncoderInterface_awaitEncoderClosed__block_invoke;
  block[3] = &unk_2643AF6E8;
  block[4] = self;
  dispatch_sync(m_encodingQueue, block);
}

uint64_t __52__MOVStreamVideoEncoderInterface_awaitEncoderClosed__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeEncoder];
}

- (void)closeEncoder
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  self->m_encoderInitialized = 0;
  if ([(MOVStreamVideoEncoderInterface *)self useLegacyVTController])
  {
    m_encoder = self->m_encoder;
    id var2 = m_encoder->var2;
    m_encoder->id var2 = 0;

    char v5 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      m_stream = self->m_stream;
      *(_DWORD *)buf = 138543362;
      int v14 = m_stream;
      _os_log_impl(&dword_21B5ED000, v5, OS_LOG_TYPE_INFO, "[FINISH] %{public}@: Encoder complete session...", buf, 0xCu);
    }

    MOVStreamHEVCLosslessEncoder::Close(self->m_encoder);
  }
  else
  {
    encoderCtrl = self->_encoderCtrl;
    id v12 = 0;
    BOOL v8 = [(MIOVideoEncoderController *)encoderCtrl closeEncoderError:&v12];
    id v9 = v12;
    if (!v8)
    {
      id v10 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = self->m_stream;
        *(_DWORD *)buf = 138412546;
        int v14 = v11;
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_impl(&dword_21B5ED000, v10, OS_LOG_TYPE_ERROR, "Error closing encoding session for stream '%@': %@", buf, 0x16u);
      }
    }
  }
}

- (void)closeEncoderInDispatchGroup:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    m_stream = self->m_stream;
    *(_DWORD *)buf = 138543362;
    id v12 = m_stream;
    _os_log_impl(&dword_21B5ED000, v5, OS_LOG_TYPE_INFO, "[FINISH] %{public}@: Encoder close...", buf, 0xCu);
  }

  dispatch_group_enter(v4);
  m_encodingQueue = self->m_encodingQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__MOVStreamVideoEncoderInterface_closeEncoderInDispatchGroup___block_invoke;
  v9[3] = &unk_2643AF670;
  v9[4] = self;
  id v10 = v4;
  BOOL v8 = v4;
  dispatch_async(m_encodingQueue, v9);
}

void __62__MOVStreamVideoEncoderInterface_closeEncoderInDispatchGroup___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x21D4924B0]();
  [*(id *)(a1 + 32) closeEncoder];
  objc_super v3 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl(&dword_21B5ED000, v3, OS_LOG_TYPE_INFO, "[FINISH] %{public}@: Encoder closed.", (uint8_t *)&v5, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)skipFrameWithStatus:(int)a3 andFlags:(unsigned int)a4
{
  [(MOVStreamVideoEncoderInterface *)self setPendingFrames:[(MOVStreamVideoEncoderInterface *)self pendingFrames] - 1];
  self->_lastEncodingStatus = a3;
  self->_lastEncodingInfoFlags = a4;
  self->m_failedState = 1;
  MOVStreamHEVCLosslessEncoder::invalidateSession(self->m_encoder);
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_delegate);
  [WeakRetained encoder:self encodingFailedForStream:self->m_stream];
}

- (void)writeSampleBuffer:(opaqueCMSampleBuffer *)a3 pts:(id *)a4 metadata:(id)a5 withStatus:(int)a6 andFlags:(unsigned int)a7
{
  id v12 = a5;
  [(MOVStreamVideoEncoderInterface *)self setPendingFrames:[(MOVStreamVideoEncoderInterface *)self pendingFrames] - 1];
  CFRetain(a3);
  self->_lastEncodingStatus = a6;
  self->_lastEncodingInfoFlags = a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_delegate);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a4;
  [WeakRetained encoder:self encodedSampleBuffer:a3 metadata:v12 presentationTime:&v14 streamId:self->m_stream];
}

- (BOOL)configureSessionOverride:(OpaqueVTCompressionSession *)a3
{
  if (![(MOVStreamVideoEncoderInterface *)self customEncoderConfig]) {
    return 0;
  }
  m_config = self->m_config;
  if (!m_config)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->m_delegate);
    char v7 = [WeakRetained encoder:self configureSessionOverride:a3 streamId:self->m_stream];

    return v7;
  }

  return [(MOVStreamEncoderConfig *)m_config applySessionProperties:a3];
}

- (id)overrideVideoEncoderSpecification
{
  if ([(MOVStreamVideoEncoderInterface *)self customEncoderConfig])
  {
    m_config = self->m_config;
    if (m_config)
    {
      uint64_t v4 = [(MOVStreamEncoderConfig *)m_config encoderSpecification];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->m_delegate);
      uint64_t v4 = [WeakRetained encoder:self overrideVideoEncoderSpecificationForStreamId:self->m_stream];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (unsigned)codecTypeOverride
{
  if (![(MOVStreamVideoEncoderInterface *)self customEncoderConfig]) {
    return 0;
  }
  m_config = self->m_config;
  if (!m_config)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->m_delegate);
    unsigned int v5 = [WeakRetained encoder:self codecTypeOverrideForstreamId:self->m_stream];

    return v5;
  }

  return [(MOVStreamEncoderConfig *)m_config codecType];
}

- (unsigned)lastEncodingStatus
{
  return self->_lastEncodingStatus;
}

- (unsigned)lastEncodingInfoFlags
{
  return self->_lastEncodingInfoFlags;
}

- (int64_t)pendingFrames
{
  return self->_pendingFrames;
}

- (void)setPendingFrames:(int64_t)a3
{
  self->_pendingFrames = a3;
}

- (int64_t)encodingQueueDepth
{
  return self->_encodingQueueDepth;
}

- (void)setEncodingQueueDepth:(int64_t)a3
{
  self->_encodingQueueDepth = a3;
}

- (BOOL)customEncoderConfig
{
  return self->_customEncoderConfig;
}

- (void)setCustomEncoderConfig:(BOOL)a3
{
  self->_customEncoderConfig = a3;
}

- (BOOL)useLegacyVTController
{
  return self->_useLegacyVTController;
}

- (void)setUseLegacyVTController:(BOOL)a3
{
  self->_useLegacyVTController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoderCtrl, 0);
  objc_storeStrong((id *)&self->m_encodingQueue, 0);
  objc_storeStrong((id *)&self->m_config, 0);
  objc_destroyWeak((id *)&self->m_delegate);

  objc_storeStrong((id *)&self->m_stream, 0);
}

@end