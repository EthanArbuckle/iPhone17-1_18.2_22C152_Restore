@interface VCFigAssetWriter
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval;
- (BOOL)finishWritingInvoked;
- (BOOL)shouldAppendSampleBuffer:(opaqueCMSampleBuffer *)a3 RTPtimeStamp:(unsigned int)a4 mediaType:(unsigned __int8)a5;
- (BOOL)shouldFinishWritingSampleBuffer:(opaqueCMSampleBuffer *)a3 RTPtimeStamp:(unsigned int)a4 mediaType:(unsigned __int8)a5;
- (NSString)transactionID;
- (NSURL)outputURL;
- (OpaqueVTCompressionSession)compressionSessionWithWidth:(unsigned int)a3 height:(unsigned int)a4;
- (VCFigAssetWriter)initWithOutputURL:(id)a3 transactionID:(id)a4 videoCodec:(unsigned int)a5 keyFrameIntervalDuration:(double)a6;
- (VCSandboxedURL)directoryURL;
- (int)_setupWriter;
- (int)encodeAndAppendSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (int)trackIDForMediaType:(unsigned __int8)a3;
- (int)trackIDForWriterMode:(unsigned __int8)a3;
- (unsigned)endRTPTimeStamp;
- (unsigned)startRTPTimeStamp;
- (unsigned)writerMode;
- (void)_setupWriter;
- (void)appendAudioBufferList:(__CFArray *)a3 type:(unsigned __int8)a4;
- (void)appendAudioSampleBuffer:(opaqueCMSampleBuffer *)a3 mediaType:(unsigned __int8)a4;
- (void)appendEarlyAudioBuffers;
- (void)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 cameraStatus:(unsigned __int8)a4 mediaType:(unsigned __int8)a5;
- (void)collectEarlyAudioBuffer:(opaqueCMSampleBuffer *)a3 type:(unsigned __int8)a4;
- (void)dealloc;
- (void)finishWritingWithHandler:(id)a3;
- (void)setDirectoryURL:(id)a3;
- (void)setEndRTPTimeStamp:(unsigned int)a3;
- (void)setEndRTPTimestampWithTimestamp:(unsigned int)a3;
- (void)setMovieFragmentInterval:(id *)a3;
- (void)setOutputURL:(id)a3;
- (void)setStartRTPTimeStamp:(unsigned int)a3;
- (void)setStillImageTime:(id *)a3;
- (void)setStillImageTimeInternal;
- (void)setupLivePhotoStillImageCameraStatusBit:(unsigned __int8)a3 resize:(BOOL)a4 imageSize:(CGSize)a5;
- (void)setupWriterWithMode:(unsigned __int8)a3;
- (void)writeIdentifierMetadata:(id)a3;
@end

@implementation VCFigAssetWriter

- (VCFigAssetWriter)initWithOutputURL:(id)a3 transactionID:(id)a4 videoCodec:(unsigned int)a5 keyFrameIntervalDuration:(double)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)VCFigAssetWriter;
  v10 = [(VCObject *)&v28 init];
  if (!v10) {
    return (VCFigAssetWriter *)v10;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCFigAssetWriter initWithOutputURL:transactionID:videoCodec:keyFrameIntervalDuration:]();
      }
    }
    goto LABEL_15;
  }
  *((void *)v10 + 26) = [a3 copy];
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCFigAssetWriter initWithOutputURL:transactionID:videoCodec:keyFrameIntervalDuration:]();
      }
    }
    goto LABEL_15;
  }
  *((void *)v10 + 25) = [a4 copy];
  uint64_t v11 = MEMORY[0x1E4F1F9F8];
  long long v27 = *MEMORY[0x1E4F1F9F8];
  *((_OWORD *)v10 + 11) = *MEMORY[0x1E4F1F9F8];
  uint64_t v12 = *(void *)(v11 + 16);
  *((void *)v10 + 24) = v12;
  *((_DWORD *)v10 + 56) = 0;
  *((_DWORD *)v10 + 55) = 0;
  *((_DWORD *)v10 + 54) = 0;
  int v13 = FigSandboxRegisterURLWithProcess();
  if (v13) {
    int v14 = 3;
  }
  else {
    int v14 = 7;
  }
  if (v14 <= (int)VRTraceGetErrorLogLevelForModule())
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E4F47A50];
    v21 = *MEMORY[0x1E4F47A50];
    if (v13)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)*((void *)v10 + 26);
        if (v25) {
          v26 = (const char *)objc_msgSend((id)objc_msgSend(v25, "description"), "UTF8String");
        }
        else {
          v26 = "<nil>";
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v30 = v19;
        __int16 v31 = 2080;
        v32 = "-[VCFigAssetWriter initWithOutputURL:transactionID:videoCodec:keyFrameIntervalDuration:]";
        __int16 v33 = 1024;
        int v34 = 88;
        __int16 v35 = 1024;
        *(_DWORD *)v36 = v13;
        *(_WORD *)&v36[4] = 2080;
        *(void *)&v36[6] = v26;
        _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d FigSandboxRegisterURLWithProcess returned err=%d for outputURL=%s", buf, 0x2Cu);
      }
      goto LABEL_15;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)*((void *)v10 + 26);
      if (v23) {
        v24 = (const char *)objc_msgSend((id)objc_msgSend(v23, "description"), "UTF8String");
      }
      else {
        v24 = "<nil>";
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v30 = v19;
      __int16 v31 = 2080;
      v32 = "-[VCFigAssetWriter initWithOutputURL:transactionID:videoCodec:keyFrameIntervalDuration:]";
      __int16 v33 = 1024;
      int v34 = 88;
      __int16 v35 = 1024;
      *(_DWORD *)v36 = 0;
      *(_WORD *)&v36[4] = 2080;
      *(void *)&v36[6] = v24;
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d FigSandboxRegisterURLWithProcess returned err=%d for outputURL=%s", buf, 0x2Cu);
    }
  }
  else if (v13)
  {
LABEL_15:

    return 0;
  }
  v10[256] = 2;
  *((_DWORD *)v10 + 65) = 0;
  *((_DWORD *)v10 + 66) = 0;
  *((_DWORD *)v10 + 81) = 0;
  v10[257] = 0;
  *((_DWORD *)v10 + 80) = a5;
  *((double *)v10 + 41) = a6;
  *(_OWORD *)(v10 + 344) = v27;
  *((void *)v10 + 45) = v12;
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  *((void *)v10 + 34) = Mutable;
  if (!Mutable)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCFigAssetWriter initWithOutputURL:transactionID:videoCodec:keyFrameIntervalDuration:]();
      }
    }
    goto LABEL_15;
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCFigAssetWriter-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      v18 = FourccToCStr(*((_DWORD *)v10 + 80));
      *(_DWORD *)buf = 136316162;
      uint64_t v30 = v16;
      __int16 v31 = 2080;
      v32 = "-[VCFigAssetWriter initWithOutputURL:transactionID:videoCodec:keyFrameIntervalDuration:]";
      __int16 v33 = 1024;
      int v34 = 102;
      __int16 v35 = 2048;
      *(void *)v36 = v10;
      *(_WORD *)&v36[8] = 2080;
      *(void *)&v36[10] = v18;
      _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCFigAssetWriter-init (%p) codec=%s", buf, 0x30u);
    }
  }
  return (VCFigAssetWriter *)v10;
}

- (void)setupWriterWithMode:(unsigned __int8)a3
{
  self->_writerMode = a3;
  [(VCFigAssetWriter *)self _setupWriter];
}

- (int)_setupWriter
{
  *(void *)&v75[13] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F32558], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFRunLoopGetCurrent();
  p_assetWriter = &self->_assetWriter;
  int v7 = FigAssetWriterCreateWithURL();
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v7)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCFigAssetWriter _setupWriter].cold.5();
      }
    }
    goto LABEL_89;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      outputURL = self->_outputURL;
      if (outputURL) {
        uint64_t v12 = (const char *)objc_msgSend((id)-[NSURL description](outputURL, "description"), "UTF8String");
      }
      else {
        uint64_t v12 = "<nil>";
      }
      LODWORD(buf.value) = 136315906;
      *(CMTimeValue *)((char *)&buf.value + 4) = v9;
      LOWORD(buf.flags) = 2080;
      *(void *)((char *)&buf.flags + 2) = "-[VCFigAssetWriter _setupWriter]";
      HIWORD(buf.epoch) = 1024;
      int v73 = 127;
      __int16 v74 = 2080;
      *(void *)v75 = v12;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d created FigAssetWriter for outputPath=%s", (uint8_t *)&buf, 0x26u);
    }
  }
  p_movieFragmentInterval = &self->_movieFragmentInterval;
  if ((self->_movieFragmentInterval.flags & 1) == 0) {
    goto LABEL_21;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_OWORD *)&buf.value = *(_OWORD *)&p_movieFragmentInterval->value;
      buf.epoch = self->_movieFragmentInterval.epoch;
      Float64 Seconds = CMTimeGetSeconds(&buf);
      LODWORD(buf.value) = 136315906;
      *(CMTimeValue *)((char *)&buf.value + 4) = v14;
      LOWORD(buf.flags) = 2080;
      *(void *)((char *)&buf.flags + 2) = "-[VCFigAssetWriter _setupWriter]";
      HIWORD(buf.epoch) = 1024;
      int v73 = 131;
      __int16 v74 = 2048;
      *(Float64 *)v75 = Seconds;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting movieFragmentInterval=%f", (uint8_t *)&buf, 0x26u);
    }
  }
  *(_OWORD *)&buf.value = *(_OWORD *)&p_movieFragmentInterval->value;
  buf.epoch = self->_movieFragmentInterval.epoch;
  CFDictionaryRef v17 = CMTimeCopyAsDictionary(&buf, v4);
  v18 = *p_assetWriter;
  uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v19) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = 0;
  }
  v21 = *(uint64_t (**)(OpaqueFigAssetWriter *, void, CFDictionaryRef))(v20 + 56);
  if (!v21)
  {
    int v22 = -12782;
    if (!v17) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  int v22 = v21(v18, *MEMORY[0x1E4F32D00], v17);
  if (v17) {
LABEL_19:
  }
    CFRelease(v17);
LABEL_20:
  if (v22)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCFigAssetWriter _setupWriter].cold.4();
      }
    }
    goto LABEL_89;
  }
LABEL_21:
  if (!VCMediaWriterUtil_IsMediaExpected(1, self->_writerMode)) {
    goto LABEL_28;
  }
  v23 = *p_assetWriter;
  uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v24) {
    uint64_t v25 = v24;
  }
  else {
    uint64_t v25 = 0;
  }
  v26 = *(uint64_t (**)(OpaqueFigAssetWriter *, void, void, int *))(v25 + 24);
  if (!v26)
  {
    int v31 = -12782;
    goto LABEL_32;
  }
  int v27 = v26(v23, *MEMORY[0x1E4F32650], 0, &self->_localAudioTrackID);
  if (v27)
  {
    int v31 = v27;
LABEL_32:
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_89;
    }
    uint64_t v32 = VRTraceErrorLogLevelToCSTR();
    __int16 v33 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_89;
    }
    int v34 = self->_outputURL;
    if (v34) {
      __int16 v35 = (const char *)objc_msgSend((id)-[NSURL description](v34, "description"), "UTF8String");
    }
    else {
      __int16 v35 = "<nil>";
    }
    LODWORD(buf.value) = 136316162;
    *(CMTimeValue *)((char *)&buf.value + 4) = v32;
    LOWORD(buf.flags) = 2080;
    *(void *)((char *)&buf.flags + 2) = "-[VCFigAssetWriter _setupWriter]";
    HIWORD(buf.epoch) = 1024;
    int v73 = 140;
    __int16 v74 = 1024;
    *(_DWORD *)v75 = v31;
    v75[2] = 2080;
    *(void *)&v75[3] = v35;
    v70 = " [%s] %s:%d FigAssetWriterAddAudioTrackWithPresetCompression local audio error=%d outputURL=%s";
    goto LABEL_88;
  }
  objc_msgSend(v3, "appendFormat:", @"localAudioTrackID=%d", self->_localAudioTrackID);
LABEL_28:
  if (!VCMediaWriterUtil_IsMediaExpected(2, self->_writerMode)) {
    goto LABEL_42;
  }
  objc_super v28 = *p_assetWriter;
  uint64_t v29 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v29) {
    uint64_t v30 = v29;
  }
  else {
    uint64_t v30 = 0;
  }
  v36 = *(uint64_t (**)(OpaqueFigAssetWriter *, void, void, int *))(v30 + 24);
  if (!v36)
  {
    int v43 = -12782;
    goto LABEL_46;
  }
  int v37 = v36(v28, *MEMORY[0x1E4F32650], 0, &self->_remoteAudioTrackID);
  if (v37)
  {
    int v43 = v37;
LABEL_46:
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_89;
    }
    uint64_t v44 = VRTraceErrorLogLevelToCSTR();
    __int16 v33 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_89;
    }
    v45 = self->_outputURL;
    if (v45) {
      v46 = (const char *)objc_msgSend((id)-[NSURL description](v45, "description"), "UTF8String");
    }
    else {
      v46 = "<nil>";
    }
    LODWORD(buf.value) = 136316162;
    *(CMTimeValue *)((char *)&buf.value + 4) = v44;
    LOWORD(buf.flags) = 2080;
    *(void *)((char *)&buf.flags + 2) = "-[VCFigAssetWriter _setupWriter]";
    HIWORD(buf.epoch) = 1024;
    int v73 = 145;
    __int16 v74 = 1024;
    *(_DWORD *)v75 = v43;
    v75[2] = 2080;
    *(void *)&v75[3] = v46;
    v70 = " [%s] %s:%d FigAssetWriterAddAudioTrackWithPresetCompression remote audio error=%d outputURL=%s";
    goto LABEL_88;
  }
  uint64_t v38 = [v3 length];
  v39 = @", ";
  if (!v38) {
    v39 = &stru_1F3D3E450;
  }
  [v3 appendFormat:@"%@remoteAudioTrackID=%d", v39, self->_remoteAudioTrackID];
LABEL_42:
  if (self->_writerMode - 1 > 1) {
    goto LABEL_75;
  }
  v40 = *p_assetWriter;
  uint64_t v41 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v41) {
    uint64_t v42 = v41;
  }
  else {
    uint64_t v42 = 0;
  }
  v47 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, int *))(v42 + 8);
  if (!v47)
  {
    int v54 = -12782;
    goto LABEL_56;
  }
  p_metadataTrackID = &self->_metadataTrackID;
  int v49 = v47(v40, 1835365473, &self->_metadataTrackID);
  if (v49)
  {
    int v54 = v49;
LABEL_56:
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_89;
    }
    uint64_t v55 = VRTraceErrorLogLevelToCSTR();
    __int16 v33 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_89;
    }
    v56 = self->_outputURL;
    if (v56) {
      v57 = (const char *)objc_msgSend((id)-[NSURL description](v56, "description"), "UTF8String");
    }
    else {
      v57 = "<nil>";
    }
    LODWORD(buf.value) = 136316162;
    *(CMTimeValue *)((char *)&buf.value + 4) = v55;
    LOWORD(buf.flags) = 2080;
    *(void *)((char *)&buf.flags + 2) = "-[VCFigAssetWriter _setupWriter]";
    HIWORD(buf.epoch) = 1024;
    int v73 = 150;
    __int16 v74 = 1024;
    *(_DWORD *)v75 = v54;
    v75[2] = 2080;
    *(void *)&v75[3] = v57;
    v70 = " [%s] %s:%d FigAssetWriterAddNativeTrack metadata error=%d outputURL=%s";
LABEL_88:
    _os_log_error_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_ERROR, v70, (uint8_t *)&buf, 0x2Cu);
LABEL_89:
    int v69 = 4;
    goto LABEL_90;
  }
  v50 = *p_assetWriter;
  uint64_t v51 = *p_metadataTrackID;
  uint64_t v52 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v52) {
    uint64_t v53 = v52;
  }
  else {
    uint64_t v53 = 0;
  }
  v58 = *(unsigned int (**)(OpaqueFigAssetWriter *, uint64_t, void, void *))(v53 + 64);
  if (!v58 || v58(v50, v51, *MEMORY[0x1E4F32E60], &unk_1F3DC6678))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCFigAssetWriter _setupWriter]();
      }
    }
    goto LABEL_89;
  }
  v59 = *p_assetWriter;
  uint64_t v60 = *p_metadataTrackID;
  uint64_t v61 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v61) {
    uint64_t v62 = v61;
  }
  else {
    uint64_t v62 = 0;
  }
  v63 = *(unsigned int (**)(OpaqueFigAssetWriter *, uint64_t, void, void))(v62 + 64);
  if (!v63 || v63(v59, v60, *MEMORY[0x1E4F32E20], *MEMORY[0x1E4F1CFC8]))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCFigAssetWriter _setupWriter]();
      }
    }
    goto LABEL_89;
  }
  [(VCFigAssetWriter *)self writeIdentifierMetadata:self->_transactionID];
  v64 = CFArrayCreateMutable(v4, 0, MEMORY[0x1E4F1D510]);
  self->_earlyRemoteAudioBuffers = v64;
  if (!v64)
  {
    int v69 = 3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCFigAssetWriter _setupWriter]();
      }
    }
    goto LABEL_90;
  }
  uint64_t v65 = [v3 length];
  v66 = @", ";
  if (!v65) {
    v66 = &stru_1F3D3E450;
  }
  [v3 appendFormat:@"%@metadataTrackID=%d", v66, *p_metadataTrackID];
LABEL_75:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v67 = VRTraceErrorLogLevelToCSTR();
    v68 = *MEMORY[0x1E4F47A50];
    int v69 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_90;
    }
    LODWORD(buf.value) = 136315906;
    *(CMTimeValue *)((char *)&buf.value + 4) = v67;
    LOWORD(buf.flags) = 2080;
    *(void *)((char *)&buf.flags + 2) = "-[VCFigAssetWriter _setupWriter]";
    HIWORD(buf.epoch) = 1024;
    int v73 = 162;
    __int16 v74 = 2112;
    *(void *)v75 = v3;
    _os_log_impl(&dword_1E1EA4000, v68, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", (uint8_t *)&buf, 0x26u);
  }
  int v69 = 0;
LABEL_90:

  if (Mutable) {
    CFRelease(Mutable);
  }
  return v69;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(VCFigAssetWriter *)self finishWritingWithHandler:0];

  earlyLocalAudioBuffers = self->_earlyLocalAudioBuffers;
  if (earlyLocalAudioBuffers) {
    CFRelease(earlyLocalAudioBuffers);
  }
  earlyRemoteAudioBuffers = self->_earlyRemoteAudioBuffers;
  if (earlyRemoteAudioBuffers) {
    CFRelease(earlyRemoteAudioBuffers);
  }
  transferSession = self->_transferSession;
  if (transferSession)
  {
    VTPixelTransferSessionInvalidate(transferSession);
    v6 = self->_transferSession;
    if (v6)
    {
      CFRelease(v6);
      self->_transferSession = 0;
    }
  }
  compressionSession = self->_compressionSession;
  if (compressionSession)
  {
    VTCompressionSessionInvalidate(compressionSession);
    v8 = self->_compressionSession;
    if (v8)
    {
      CFRelease(v8);
      self->_compressionSession = 0;
    }
  }
  bufferPool = self->_bufferPool;
  if (bufferPool)
  {
    CVPixelBufferPoolRelease(bufferPool);
    self->_bufferPool = 0;
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCFigAssetWriter-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 136315906;
      uint64_t v14 = v10;
      __int16 v15 = 2080;
      uint64_t v16 = "-[VCFigAssetWriter dealloc]";
      __int16 v17 = 1024;
      int v18 = 190;
      __int16 v19 = 2048;
      uint64_t v20 = self;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCFigAssetWriter-dealloc (%p)", buf, 0x26u);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)VCFigAssetWriter;
  [(VCObject *)&v12 dealloc];
}

- (void)setupLivePhotoStillImageCameraStatusBit:(unsigned __int8)a3 resize:(BOOL)a4 imageSize:(CGSize)a5
{
  self->_stillImageCameraStatusBit = a3;
  self->_resize = a4;
  if (a4)
  {
    double height = a5.height;
    double width = a5.width;
    self->_transferSession = (OpaqueVTPixelTransferSession *)VCMediaRecorderUtil_AllocTransferSession();
    VCMediaRecorderUtil_SetupBufferPool(@"AVConference:FigAssetWriter", &self->_bufferPool, width, height);
  }
}

- (void)finishWritingWithHandler:(id)a3
{
  *(void *)&v42[13] = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  self->_finishWritingInvoked = 1;
  compressionSession = self->_compressionSession;
  if (compressionSession)
  {
    CMTime v39 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    VTCompressionSessionCompleteFrames(compressionSession, &v39);
    VTCompressionSessionInvalidate(self->_compressionSession);
    v6 = self->_compressionSession;
    if (v6)
    {
      CFRelease(v6);
      self->_compressionSession = 0;
    }
  }
  assetWriter = self->_assetWriter;
  if (!assetWriter) {
    goto LABEL_39;
  }
  self->_state = 2;
  [(VCFigAssetWriter *)self setStillImageTimeInternal];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      outputURL = self->_outputURL;
      if (outputURL) {
        uint64_t v11 = (const char *)objc_msgSend((id)-[NSURL description](outputURL, "description"), "UTF8String");
      }
      else {
        uint64_t v11 = "<nil>";
      }
      LODWORD(v39.value) = 136315906;
      *(CMTimeValue *)((char *)&v39.value + 4) = v8;
      LOWORD(v39.flags) = 2080;
      *(void *)((char *)&v39.flags + 2) = "-[VCFigAssetWriter finishWritingWithHandler:]";
      HIWORD(v39.epoch) = 1024;
      int v40 = 218;
      __int16 v41 = 2080;
      *(void *)uint64_t v42 = v11;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d finishWritingWithHandler for path=%s", (uint8_t *)&v39, 0x26u);
    }
  }
  objc_super v12 = self->_assetWriter;
  uint64_t v13 = [(VCFigAssetWriter *)self trackIDForWriterMode:self->_writerMode];
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t))(v15 + 104);
  if (!v16)
  {
    int v17 = -12782;
    goto LABEL_19;
  }
  int v17 = v16(v12, v13);
  if (v17)
  {
LABEL_19:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      int v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        v23 = self->_outputURL;
        if (v23) {
          uint64_t v24 = (const char *)objc_msgSend((id)-[NSURL description](v23, "description"), "UTF8String");
        }
        else {
          uint64_t v24 = "<nil>";
        }
        LODWORD(v39.value) = 136316162;
        *(CMTimeValue *)((char *)&v39.value + 4) = v21;
        LOWORD(v39.flags) = 2080;
        *(void *)((char *)&v39.flags + 2) = "-[VCFigAssetWriter finishWritingWithHandler:]";
        HIWORD(v39.epoch) = 1024;
        int v40 = 220;
        __int16 v41 = 1024;
        *(_DWORD *)uint64_t v42 = v17;
        v42[2] = 2080;
        *(void *)&v42[3] = v24;
        uint64_t v38 = " [%s] %s:%d FigAssetWriterMarkEndOfDataForTrack error=%d outputURL=%s";
        goto LABEL_55;
      }
    }
    goto LABEL_56;
  }
  int v18 = self->_assetWriter;
  uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v19) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v25 = *(uint64_t (**)(OpaqueFigAssetWriter *))(v20 + 120);
  if (v25)
  {
    int v26 = v25(v18);
    if (!v26)
    {
      uint64_t FigBaseObject = FigAssetWriterGetFigBaseObject();
      if (FigBaseObject)
      {
        uint64_t v28 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v28) {
          uint64_t v29 = v28;
        }
        else {
          uint64_t v29 = 0;
        }
        int v34 = *(uint64_t (**)(uint64_t))(v29 + 24);
        if (v34)
        {
          int v33 = v34(FigBaseObject);
          if (!v33)
          {
            CFRelease(self->_assetWriter);
            self->_assetWriter = 0;
LABEL_39:
            if (a3) {
              (*((void (**)(id, NSURL *, void))a3 + 2))(a3, self->_outputURL, 0);
            }
            if (assetWriter) {
              VCMediaRecorderUtil_PrintMediaURL((uint64_t)self->_outputURL, 7);
            }
            objc_sync_exit(self);
            return;
          }
        }
        else
        {
          int v33 = -12782;
        }
      }
      else
      {
        int v33 = -12780;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v35 = VRTraceErrorLogLevelToCSTR();
        int v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          v36 = self->_outputURL;
          if (v36) {
            int v37 = (const char *)objc_msgSend((id)-[NSURL description](v36, "description"), "UTF8String");
          }
          else {
            int v37 = "<nil>";
          }
          LODWORD(v39.value) = 136316162;
          *(CMTimeValue *)((char *)&v39.value + 4) = v35;
          LOWORD(v39.flags) = 2080;
          *(void *)((char *)&v39.flags + 2) = "-[VCFigAssetWriter finishWritingWithHandler:]";
          HIWORD(v39.epoch) = 1024;
          int v40 = 224;
          __int16 v41 = 1024;
          *(_DWORD *)uint64_t v42 = v33;
          v42[2] = 2080;
          *(void *)&v42[3] = v37;
          uint64_t v38 = " [%s] %s:%d FigAssetWriterInvalidate error=%d outputURL=%s";
LABEL_55:
          _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, v38, (uint8_t *)&v39, 0x2Cu);
          goto LABEL_56;
        }
      }
      goto LABEL_56;
    }
  }
  else
  {
    int v26 = -12782;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    int v22 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      int v31 = self->_outputURL;
      if (v31) {
        uint64_t v32 = (const char *)objc_msgSend((id)-[NSURL description](v31, "description"), "UTF8String");
      }
      else {
        uint64_t v32 = "<nil>";
      }
      LODWORD(v39.value) = 136316162;
      *(CMTimeValue *)((char *)&v39.value + 4) = v30;
      LOWORD(v39.flags) = 2080;
      *(void *)((char *)&v39.flags + 2) = "-[VCFigAssetWriter finishWritingWithHandler:]";
      HIWORD(v39.epoch) = 1024;
      int v40 = 222;
      __int16 v41 = 1024;
      *(_DWORD *)uint64_t v42 = v26;
      v42[2] = 2080;
      *(void *)&v42[3] = v32;
      uint64_t v38 = " [%s] %s:%d FigAssetWriterFinish error=%d outputURL=%s";
      goto LABEL_55;
    }
  }
LABEL_56:
  objc_sync_exit(self);
  if (a3) {
    (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, [MEMORY[0x1E4F28C58] errorWithDomain:@"VCMovieWriter" code:-1 userInfo:0]);
  }
}

- (int)trackIDForMediaType:(unsigned __int8)a3
{
  if ((a3 - 1) > 2) {
    return 0;
  }
  else {
    return *(_DWORD *)((char *)&self->super.super.isa + *off_1E6DB9770[(char)(a3 - 1)]);
  }
}

- (int)trackIDForWriterMode:(unsigned __int8)a3
{
  if (self->_writerMode - 3 >= 2) {
    id v3 = &OBJC_IVAR___VCFigAssetWriter__videoTrackID;
  }
  else {
    id v3 = &OBJC_IVAR___VCFigAssetWriter__localAudioTrackID;
  }
  return *(_DWORD *)((char *)&self->super.super.isa + *v3);
}

- (void)setEndRTPTimestampWithTimestamp:(unsigned int)a3
{
  self->_endRTPTimeStamp = a3;
  self->_isEndRTPTimestampSet = 1;
}

- (BOOL)shouldAppendSampleBuffer:(opaqueCMSampleBuffer *)a3 RTPtimeStamp:(unsigned int)a4 mediaType:(unsigned __int8)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL IsMediaExpected = VCMediaWriterUtil_IsMediaExpected(a5, self->_writerMode);
  if (IsMediaExpected)
  {
    if (self->_writerMode - 2 > 2)
    {
      if ((self->_startTime.flags & 1) == 0)
      {
        CMTime time = (CMTime)self->_stillImageTime;
        double Seconds = CMTimeGetSeconds(&time);
        CMSampleBufferGetPresentationTimeStamp(&v17, a3);
        if (Seconds - CMTimeGetSeconds(&v17) <= 1.0)
        {
LABEL_10:
          LOBYTE(IsMediaExpected) = 1;
          return IsMediaExpected;
        }
      }
      CMSampleBufferGetPresentationTimeStamp(&v16, a3);
      double v11 = CMTimeGetSeconds(&v16);
      CMTime time = (CMTime)self->_startTime;
      LOBYTE(IsMediaExpected) = v11 - CMTimeGetSeconds(&time) < 3.0;
    }
    else
    {
      unsigned int state = self->_state;
      if (state - 1 < 2)
      {
        if (self->_isEndRTPTimestampSet && self->_endRTPTimeStamp < a4)
        {
LABEL_20:
          LOBYTE(IsMediaExpected) = 0;
          return IsMediaExpected;
        }
        goto LABEL_10;
      }
      if (state) {
        goto LABEL_20;
      }
      unsigned int startRTPTimeStamp = self->_startRTPTimeStamp;
      BOOL v13 = a4 - startRTPTimeStamp < 0x7FFFFFFF && a4 < startRTPTimeStamp;
      if (a4 <= startRTPTimeStamp && !v13) {
        goto LABEL_20;
      }
      LOBYTE(IsMediaExpected) = 1;
      self->_unsigned int state = 1;
    }
  }
  return IsMediaExpected;
}

- (BOOL)shouldFinishWritingSampleBuffer:(opaqueCMSampleBuffer *)a3 RTPtimeStamp:(unsigned int)a4 mediaType:(unsigned __int8)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL IsMediaExpected = VCMediaWriterUtil_IsMediaExpected(a5, self->_writerMode);
  if (IsMediaExpected)
  {
    if (self->_writerMode - 2 > 2)
    {
      if (a3)
      {
        CMSampleBufferGetPresentationTimeStamp(&time, a3);
        double Seconds = CMTimeGetSeconds(&time);
        $95D729B680665BEAEFA1D6FCA8238556 startTime = self->_startTime;
        if (Seconds - CMTimeGetSeconds((CMTime *)&startTime) > 3.0)
        {
LABEL_14:
          LOBYTE(IsMediaExpected) = 1;
          return IsMediaExpected;
        }
      }
    }
    else if (self->_state == 1 && self->_isEndRTPTimestampSet)
    {
      unsigned int endRTPTimeStamp = self->_endRTPTimeStamp;
      BOOL v10 = a4 >= endRTPTimeStamp;
      unsigned int v11 = a4 - endRTPTimeStamp;
      if (v11 != 0 && v10) {
        goto LABEL_14;
      }
      if (!v10 && v11 < 0x7FFFFFFF) {
        goto LABEL_14;
      }
    }
    LOBYTE(IsMediaExpected) = 0;
  }
  return IsMediaExpected;
}

- (OpaqueVTCompressionSession)compressionSessionWithWidth:(unsigned int)a3 height:(unsigned int)a4
{
  session[1] = *(VTSessionRef *)MEMORY[0x1E4F143B8];
  session[0] = 0;
  int32_t v36 = a4;
  int32_t valuePtr = a3;
  int v35 = VCVideoUtil_DefaultCameraCapturePixelFormat();
  double keyFrameIntervalDuration = self->_keyFrameIntervalDuration;
  p_codec = &self->_codec;
  if (self->_codec == 1752589105) {
    unsigned int v6 = 3000000;
  }
  else {
    unsigned int v6 = 4000000;
  }
  unsigned int v33 = v6;
  if (VCDefaults_GetManagedBoolValueForKey(@"enableLocalVideoRecording", 0))
  {
    if (*p_codec == 1752589105) {
      unsigned int v6 = 12000000;
    }
    else {
      unsigned int v6 = 20000000;
    }
    unsigned int v33 = v6;
  }
  int v26 = p_codec;
  int v31 = 1;
  unsigned int v32 = v6 >> 3;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFNumberRef v8 = CFNumberCreate(v7, kCFNumberIntType, &valuePtr);
  CFNumberRef v9 = CFNumberCreate(v7, kCFNumberIntType, &v36);
  CFNumberRef v27 = CFNumberCreate(v7, kCFNumberIntType, &v35);
  CFNumberRef v10 = CFNumberCreate(v7, kCFNumberFloat64Type, &keyFrameIntervalDuration);
  CFNumberRef v11 = CFNumberCreate(v7, kCFNumberIntType, &v33);
  CFNumberRef v12 = CFNumberCreate(v7, kCFNumberIntType, &v32);
  CFNumberRef v13 = CFNumberCreate(v7, kCFNumberIntType, &v31);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  CFNumberRef v15 = v12;
  CFNumberRef v16 = v12;
  CFNumberRef v17 = v13;
  CFArrayAppendValue(Mutable, v16);
  CFArrayAppendValue(Mutable, v13);
  CFNumberRef propertyValue = v11;
  CFNumberRef value = v8;
  if (v8)
  {
    CFNumberRef v18 = v9;
    if (!v9)
    {
      CFNumberRef v19 = v10;
      CFNumberRef v20 = v27;
      uint64_t v21 = theDict;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter compressionSessionWithWidth:height:]();
        }
      }
      goto LABEL_41;
    }
    CFNumberRef v19 = v10;
    CFNumberRef v20 = v27;
    if (!v27)
    {
      uint64_t v21 = theDict;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter compressionSessionWithWidth:height:]();
        }
      }
      goto LABEL_41;
    }
    uint64_t v21 = theDict;
    if (!v19)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.4();
        }
      }
      goto LABEL_41;
    }
    if (!v11)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.5();
        }
      }
      goto LABEL_41;
    }
    if (!v15)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.6();
        }
      }
      goto LABEL_41;
    }
    if (!v17)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.7();
        }
      }
      goto LABEL_41;
    }
    if (!Mutable)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.8();
        }
      }
      goto LABEL_41;
    }
    CFDictionaryAddValue(theDict, (const void *)*MEMORY[0x1E4F24E10], value);
    CFDictionaryAddValue(theDict, (const void *)*MEMORY[0x1E4F24D08], v18);
    CFDictionaryAddValue(theDict, (const void *)*MEMORY[0x1E4F24D70], v27);
    if (VTCompressionSessionCreate(v7, valuePtr, v36, *v26, 0, theDict, 0, 0, 0, (VTCompressionSessionRef *)session))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter compressionSessionWithWidth:height:]2();
        }
      }
      goto LABEL_41;
    }
    int v22 = (const void *)*MEMORY[0x1E4F1CFD0];
    if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E4F44AC0], (CFTypeRef)*MEMORY[0x1E4F1CFD0]))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter compressionSessionWithWidth:height:]1();
        }
      }
      goto LABEL_41;
    }
    if (*v26 == 1752589105)
    {
      if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E4F44AA0], (CFTypeRef)*MEMORY[0x1E4F452D0]))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCFigAssetWriter compressionSessionWithWidth:height:]0();
          }
        }
        goto LABEL_41;
      }
    }
    else
    {
      if (*v26 != 1635148593)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v23 = VRTraceErrorLogLevelToCSTR();
          uint64_t v24 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.9(v23, (int *)v26, v24);
          }
        }
        goto LABEL_41;
      }
      if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E4F44920], (CFTypeRef)*MEMORY[0x1E4F44F98]))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCFigAssetWriter compressionSessionWithWidth:height:]9();
          }
        }
        goto LABEL_41;
      }
      if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E4F44AA0], (CFTypeRef)*MEMORY[0x1E4F45250]))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCFigAssetWriter compressionSessionWithWidth:height:]8();
          }
        }
LABEL_41:
        CFRelease(value);
        goto LABEL_42;
      }
    }
    if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E4F447D0], (CFTypeRef)*MEMORY[0x1E4F1CFC8]))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter compressionSessionWithWidth:height:]7();
        }
      }
    }
    else if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E4F447E8], v22))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter compressionSessionWithWidth:height:]6();
        }
      }
    }
    else if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E4F449D0], v19))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter compressionSessionWithWidth:height:]5();
        }
      }
    }
    else if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E4F44810], v11))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter compressionSessionWithWidth:height:]4();
        }
      }
    }
    else if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E4F44898], Mutable))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter compressionSessionWithWidth:height:]3();
        }
      }
    }
    else if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E4F44868], (CFTypeRef)*MEMORY[0x1E4F24AB0]))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter compressionSessionWithWidth:height:]2();
        }
      }
    }
    else if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E4F44B58], (CFTypeRef)*MEMORY[0x1E4F24BE0]))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter compressionSessionWithWidth:height:]1();
        }
      }
    }
    else if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E4F44BB0], (CFTypeRef)*MEMORY[0x1E4F24C48]))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter compressionSessionWithWidth:height:]0();
        }
      }
    }
    goto LABEL_41;
  }
  CFNumberRef v19 = v10;
  CFNumberRef v18 = v9;
  CFNumberRef v20 = v27;
  uint64_t v21 = theDict;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCFigAssetWriter compressionSessionWithWidth:height:]();
    }
  }
LABEL_42:
  if (v18) {
    CFRelease(v18);
  }
  if (v20) {
    CFRelease(v20);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v21) {
    CFRelease(v21);
  }
  if (propertyValue) {
    CFRelease(propertyValue);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v17) {
    CFRelease(v17);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return (OpaqueVTCompressionSession *)session[0];
}

- (int)encodeAndAppendSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      -[VCFigAssetWriter encodeAndAppendSampleBuffer:]();
    }
    return 0;
  }
  if (!self->_compressionSession)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      -[VCFigAssetWriter encodeAndAppendSampleBuffer:]();
    }
    return 0;
  }
  if (!self->_assetWriter)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      -[VCFigAssetWriter encodeAndAppendSampleBuffer:]();
    }
    return 0;
  }
  if (!self->_videoTrackID)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      -[VCFigAssetWriter encodeAndAppendSampleBuffer:].cold.4();
    }
    return 0;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      -[VCFigAssetWriter encodeAndAppendSampleBuffer:].cold.5();
    }
    return 0;
  }
  unsigned int v6 = ImageBuffer;
  memset(&v16, 170, sizeof(v16));
  CMSampleBufferGetPresentationTimeStamp(&v16, a3);
  memset(&v15, 170, sizeof(v15));
  CMSampleBufferGetDuration(&v15, a3);
  compressionSession = self->_compressionSession;
  outputHandler[0] = MEMORY[0x1E4F143A8];
  outputHandler[1] = 3221225472;
  outputHandler[2] = __48__VCFigAssetWriter_encodeAndAppendSampleBuffer___block_invoke;
  outputHandler[3] = &unk_1E6DB9750;
  outputHandler[4] = self;
  int v13 = 0;
  CMTime v14 = v16;
  CMTime presentationTimeStamp = v16;
  CMTime v10 = v15;
  OSStatus v8 = VTCompressionSessionEncodeFrameWithOutputHandler(compressionSession, v6, &presentationTimeStamp, &v10, 0, 0, outputHandler);
  int result = 0;
  if (v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCFigAssetWriter encodeAndAppendSampleBuffer:].cold.6();
      }
    }
    return v8;
  }
  return result;
}

void __48__VCFigAssetWriter_encodeAndAppendSampleBuffer___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__VCFigAssetWriter_encodeAndAppendSampleBuffer___block_invoke_cold_1();
      }
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 168);
  uint64_t v8 = *(unsigned int *)(v6 + 216);
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  CFNumberRef v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 80);
  if ((!v11 || v11(v7, v8, a4)) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    int v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      int v14 = *(_DWORD *)(a1 + 40);
      CMTime v16 = *(CMTime *)(a1 + 44);
      Float64 Seconds = CMTimeGetSeconds(&v16);
      LODWORD(v16.value) = 136316162;
      *(CMTimeValue *)((char *)&v16.value + 4) = v12;
      LOWORD(v16.flags) = 2080;
      *(void *)((char *)&v16.flags + 2) = "-[VCFigAssetWriter encodeAndAppendSampleBuffer:]_block_invoke";
      HIWORD(v16.epoch) = 1024;
      int v17 = 448;
      __int16 v18 = 1024;
      int v19 = v14;
      __int16 v20 = 2048;
      Float64 v21 = Seconds;
      _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d FigAssetWriterAddSampleBuffer failed with err=%d timestamp=%f", (uint8_t *)&v16, 0x2Cu);
    }
  }
}

- (void)collectEarlyAudioBuffer:(opaqueCMSampleBuffer *)a3 type:(unsigned __int8)a4
{
  if (a4 == 2)
  {
    earlyRemoteAudioBuffers = self->_earlyRemoteAudioBuffers;
    if (earlyRemoteAudioBuffers)
    {
LABEL_8:
      CFArrayAppendValue(earlyRemoteAudioBuffers, a3);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCFigAssetWriter collectEarlyAudioBuffer:type:]();
      }
    }
  }
  else
  {
    if (a4 == 1)
    {
      earlyRemoteAudioBuffers = self->_earlyLocalAudioBuffers;
      if (!earlyRemoteAudioBuffers)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCFigAssetWriter collectEarlyAudioBuffer:type:]();
          }
        }
        return;
      }
      goto LABEL_8;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCFigAssetWriter collectEarlyAudioBuffer:type:]();
      }
    }
  }
}

- (void)appendAudioBufferList:(__CFArray *)a3 type:(unsigned __int8)a4
{
  if (a3)
  {
    uint64_t v4 = a4;
    if (CFArrayGetCount(a3) >= 1)
    {
      CFIndex v7 = 0;
      do
        [(VCFigAssetWriter *)self appendAudioSampleBuffer:CFArrayGetValueAtIndex(a3, v7++) mediaType:v4];
      while (v7 < CFArrayGetCount(a3));
    }
    CFArrayRemoveAllValues(a3);
  }
}

- (void)appendEarlyAudioBuffers
{
  [(VCFigAssetWriter *)self appendAudioBufferList:self->_earlyLocalAudioBuffers type:1];
  earlyRemoteAudioBuffers = self->_earlyRemoteAudioBuffers;

  [(VCFigAssetWriter *)self appendAudioBufferList:earlyRemoteAudioBuffers type:2];
}

- (void)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 cameraStatus:(unsigned __int8)a4 mediaType:(unsigned __int8)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5 = (CGAffineTransform *)a4;
    if (self->_writerMode != 1 || self->_stillImageCameraStatusBit == a4)
    {
      if (self->_resize)
      {
        CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
        memset(v50, 170, 24);
        CMSampleBufferGetPresentationTimeStamp((CMTime *)v50, a3);
        ResizeFrame = VCMediaRecorderUtil_CreateResizeFrame(ImageBuffer, self->_transferSession, self->_bufferPool);
        long long v47 = *(_OWORD *)v50;
        *(void *)&long long v48 = *(void *)&v50[16];
        uint64_t v10 = createSampleBufferWithPixelBuffer(ResizeFrame, &v47);
      }
      else
      {
        uint64_t v10 = (opaqueCMSampleBuffer *)FigSampleBufferRetain();
        ResizeFrame = 0;
      }
      objc_sync_enter(self);
      p_videoTrackID = &self->_videoTrackID;
      if (!self->_videoTrackID)
      {
        CMTime v16 = CMSampleBufferGetImageBuffer(v10);
        size_t Width = CVPixelBufferGetWidth(v16);
        __int16 v18 = CMSampleBufferGetImageBuffer(v10);
        int v19 = [(VCFigAssetWriter *)self compressionSessionWithWidth:Width height:CVPixelBufferGetHeight(v18)];
        self->_compressionSession = v19;
        if (!v19)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:]();
            }
          }
          goto LABEL_41;
        }
        assetWriter = self->_assetWriter;
        uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v21) {
          uint64_t v22 = v21;
        }
        else {
          uint64_t v22 = 0;
        }
        unsigned int v33 = *(unsigned int (**)(OpaqueFigAssetWriter *, uint64_t, int *))(v22 + 8);
        if (!v33 || v33(assetWriter, 1986618469, &self->_videoTrackID))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:]();
            }
          }
          goto LABEL_41;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v34 = VRTraceErrorLogLevelToCSTR();
          int v35 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v36 = *p_videoTrackID;
            outputURL = self->_outputURL;
            if (outputURL) {
              uint64_t v38 = (const char *)objc_msgSend((id)-[NSURL description](outputURL, "description"), "UTF8String");
            }
            else {
              uint64_t v38 = "<nil>";
            }
            *(_DWORD *)v50 = 136316162;
            *(void *)&v50[4] = v34;
            *(_WORD *)&v50[12] = 2080;
            *(void *)&v50[14] = "-[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:]";
            *(_WORD *)&v50[22] = 1024;
            *(_DWORD *)&v50[24] = 513;
            *(_WORD *)&v50[28] = 1024;
            *(_DWORD *)&v50[30] = v36;
            *(_WORD *)&v50[34] = 2080;
            *(void *)&v50[36] = v38;
            _os_log_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Added native video trackID=%d for output path=%s", v50, 0x2Cu);
          }
        }
        *(void *)&long long v39 = -1;
        *((void *)&v39 + 1) = -1;
        *(_OWORD *)&v50[16] = v39;
        *(_OWORD *)&v50[32] = v39;
        *(_OWORD *)v50 = v39;
        videoOrientationInRadiansForCameraStatusBits(v5, (uint64_t)v50);
        long long v47 = *(_OWORD *)v50;
        long long v48 = *(_OWORD *)&v50[16];
        long long v49 = *(_OWORD *)&v50[32];
        int v40 = (const void *)FigCreate3x3MatrixArrayFromCGAffineTransform();
        if (!v40)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.4();
            }
          }
          goto LABEL_41;
        }
        __int16 v41 = self->_assetWriter;
        uint64_t v42 = *p_videoTrackID;
        uint64_t v43 = *(void *)(CMBaseObjectGetVTable() + 16);
        uint64_t v44 = v43 ? v43 : 0;
        v45 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, void, const void *))(v44 + 64);
        int v46 = v45 ? v45(v41, v42, *MEMORY[0x1E4F32F00], v40) : -12782;
        CFRelease(v40);
        if (v46)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.8();
            }
          }
          goto LABEL_41;
        }
      }
      p_$95D729B680665BEAEFA1D6FCA8238556 startTime = &self->_startTime;
      if (self->_startTime.flags) {
        goto LABEL_38;
      }
      CMSampleBufferGetPresentationTimeStamp((CMTime *)v50, v10);
      *(_OWORD *)&p_startTime->CFNumberRef value = *(_OWORD *)v50;
      self->_startTime.epoch = *(void *)&v50[16];
      int v13 = self->_assetWriter;
      long long v47 = *(_OWORD *)&p_startTime->value;
      *(void *)&long long v48 = self->_startTime.epoch;
      uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v14) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 0;
      }
      uint64_t v23 = *(uint64_t (**)(OpaqueFigAssetWriter *, unsigned char *))(v15 + 72);
      if (v23)
      {
        *(_OWORD *)v50 = v47;
        *(void *)&v50[16] = v48;
        int v24 = v23(v13, v50);
        if (!v24)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v25 = VRTraceErrorLogLevelToCSTR();
            int v26 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              long long v47 = *(_OWORD *)&p_startTime->value;
              *(void *)&long long v48 = self->_startTime.epoch;
              Float64 Seconds = CMTimeGetSeconds((CMTime *)&v47);
              uint64_t v28 = self->_outputURL;
              if (v28) {
                uint64_t v29 = (const char *)objc_msgSend((id)-[NSURL description](v28, "description"), "UTF8String");
              }
              else {
                uint64_t v29 = "<nil>";
              }
              *(_DWORD *)v50 = 136316162;
              *(void *)&v50[4] = v25;
              *(_WORD *)&v50[12] = 2080;
              *(void *)&v50[14] = "-[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:]";
              *(_WORD *)&v50[22] = 1024;
              *(_DWORD *)&v50[24] = 528;
              *(_WORD *)&v50[28] = 2048;
              *(Float64 *)&v50[30] = Seconds;
              *(_WORD *)&v50[38] = 2080;
              *(void *)&v50[40] = v29;
              _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d FigAssetWriterBeginSession start time=%f path=%s", v50, 0x30u);
            }
          }
          [(VCFigAssetWriter *)self appendEarlyAudioBuffers];
LABEL_38:
          if (*p_videoTrackID)
          {
            if (self->_compressionSession)
            {
              if ([(VCFigAssetWriter *)self encodeAndAppendSampleBuffer:v10])
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.7();
                  }
                }
              }
            }
            else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.6();
              }
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.5();
            }
          }
LABEL_41:
          objc_sync_exit(self);
          if (ResizeFrame) {
            CVPixelBufferRelease(ResizeFrame);
          }
          goto LABEL_43;
        }
      }
      else
      {
        int v24 = -12782;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v30 = VRTraceErrorLogLevelToCSTR();
        int v31 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          long long v47 = *(_OWORD *)&p_startTime->value;
          *(void *)&long long v48 = self->_startTime.epoch;
          Float64 v32 = CMTimeGetSeconds((CMTime *)&v47);
          *(_DWORD *)v50 = 136316162;
          *(void *)&v50[4] = v30;
          *(_WORD *)&v50[12] = 2080;
          *(void *)&v50[14] = "-[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:]";
          *(_WORD *)&v50[22] = 1024;
          *(_DWORD *)&v50[24] = 527;
          *(_WORD *)&v50[28] = 1024;
          *(_DWORD *)&v50[30] = v24;
          *(_WORD *)&v50[34] = 2048;
          *(Float64 *)&v50[36] = v32;
          _os_log_error_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_ERROR, " [%s] %s:%d FigAssetWriterBeginSession failed with err=%d start time=%f", v50, 0x2Cu);
        }
      }
      goto LABEL_41;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.9();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:]();
    }
  }
LABEL_43:
  FigSampleBufferRelease();
}

- (void)appendAudioSampleBuffer:(opaqueCMSampleBuffer *)a3 mediaType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (!self->_assetWriter)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCFigAssetWriter appendAudioSampleBuffer:mediaType:]();
      }
    }
    goto LABEL_31;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCFigAssetWriter appendAudioSampleBuffer:mediaType:]();
      }
    }
    goto LABEL_31;
  }
  memset(&v39, 170, sizeof(v39));
  CMSampleBufferGetPresentationTimeStamp(&v39, a3);
  p_$95D729B680665BEAEFA1D6FCA8238556 startTime = &self->_startTime;
  if (self->_startTime.flags) {
    goto LABEL_8;
  }
  if (!VCMediaWriterUtil_IsAudioOnly(self->_writerMode))
  {
    [(VCFigAssetWriter *)self collectEarlyAudioBuffer:a3 type:v4];
    goto LABEL_8;
  }
  long long v8 = *(_OWORD *)&v39.value;
  *(_OWORD *)&p_startTime->CFNumberRef value = *(_OWORD *)&v39.value;
  CMTimeEpoch epoch = v39.epoch;
  self->_startTime.CMTimeEpoch epoch = v39.epoch;
  assetWriter = self->_assetWriter;
  *(_OWORD *)&time2.CFNumberRef value = v8;
  time2.CMTimeEpoch epoch = epoch;
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v25 = *(uint64_t (**)(OpaqueFigAssetWriter *, CMTime *))(v12 + 72);
  if (!v25)
  {
    int v26 = -12782;
    goto LABEL_29;
  }
  CMTime time1 = time2;
  int v26 = v25(assetWriter, &time1);
  if (v26)
  {
LABEL_29:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v32 = VRTraceErrorLogLevelToCSTR();
      unsigned int v33 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_OWORD *)&time2.CFNumberRef value = *(_OWORD *)&p_startTime->value;
        time2.CMTimeEpoch epoch = self->_startTime.epoch;
        Float64 Seconds = CMTimeGetSeconds(&time2);
        LODWORD(time1.value) = 136316162;
        *(CMTimeValue *)((char *)&time1.value + 4) = v32;
        LOWORD(time1.flags) = 2080;
        *(void *)((char *)&time1.flags + 2) = "-[VCFigAssetWriter appendAudioSampleBuffer:mediaType:]";
        HIWORD(time1.epoch) = 1024;
        int v41 = 555;
        __int16 v42 = 1024;
        *(_DWORD *)uint64_t v43 = v26;
        *(_WORD *)&v43[4] = 2048;
        *(Float64 *)&v43[6] = Seconds;
        uint64_t v22 = " [%s] %s:%d FigAssetWriterBeginSession failed with err=%d start time=%f";
        uint64_t v23 = v33;
        uint32_t v24 = 44;
        goto LABEL_35;
      }
    }
    goto LABEL_31;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v27 = VRTraceErrorLogLevelToCSTR();
    uint64_t v28 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_OWORD *)&time2.CFNumberRef value = *(_OWORD *)&p_startTime->value;
      time2.CMTimeEpoch epoch = self->_startTime.epoch;
      Float64 v29 = CMTimeGetSeconds(&time2);
      outputURL = self->_outputURL;
      if (outputURL) {
        int v31 = (const char *)objc_msgSend((id)-[NSURL description](outputURL, "description"), "UTF8String");
      }
      else {
        int v31 = "<nil>";
      }
      LODWORD(time1.value) = 136316162;
      *(CMTimeValue *)((char *)&time1.value + 4) = v27;
      LOWORD(time1.flags) = 2080;
      *(void *)((char *)&time1.flags + 2) = "-[VCFigAssetWriter appendAudioSampleBuffer:mediaType:]";
      HIWORD(time1.epoch) = 1024;
      int v41 = 556;
      __int16 v42 = 2048;
      *(Float64 *)uint64_t v43 = v29;
      *(_WORD *)&v43[8] = 2080;
      *(void *)&v43[10] = v31;
      _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d FigAssetWriterBeginSession start time=%f path=%s", (uint8_t *)&time1, 0x30u);
    }
  }
LABEL_8:
  if (self->_startTime.flags)
  {
    *(_OWORD *)&time1.CFNumberRef value = *(_OWORD *)&p_startTime->value;
    time1.CMTimeEpoch epoch = self->_startTime.epoch;
    CMTime time2 = v39;
    if (CMTimeCompare(&time1, &time2) <= 0)
    {
      uint64_t v13 = [(VCFigAssetWriter *)self trackIDForMediaType:v4];
      if (v13)
      {
        uint64_t v14 = self->_assetWriter;
        uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v15) {
          uint64_t v16 = v15;
        }
        else {
          uint64_t v16 = 0;
        }
        int v17 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, opaqueCMSampleBuffer *))(v16 + 80);
        if (v17)
        {
          int v18 = v17(v14, v13, a3);
          if (!v18) {
            goto LABEL_31;
          }
        }
        else
        {
          int v18 = -12782;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v19 = VRTraceErrorLogLevelToCSTR();
          __int16 v20 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            CMSampleBufferGetPresentationTimeStamp(&time, a3);
            Float64 v21 = CMTimeGetSeconds(&time);
            LODWORD(time1.value) = 136316418;
            *(CMTimeValue *)((char *)&time1.value + 4) = v19;
            LOWORD(time1.flags) = 2080;
            *(void *)((char *)&time1.flags + 2) = "-[VCFigAssetWriter appendAudioSampleBuffer:mediaType:]";
            HIWORD(time1.epoch) = 1024;
            int v41 = 568;
            __int16 v42 = 1024;
            *(_DWORD *)uint64_t v43 = v18;
            *(_WORD *)&v43[4] = 2048;
            *(Float64 *)&v43[6] = v21;
            *(_WORD *)&v43[14] = 1024;
            *(_DWORD *)&v43[16] = v4;
            uint64_t v22 = " [%s] %s:%d FigAssetWriterAddSampleBuffer failed with err=%d timestamp=%f type=%d";
            uint64_t v23 = v20;
            uint32_t v24 = 50;
LABEL_35:
            _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&time1, v24);
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v35 = VRTraceErrorLogLevelToCSTR();
        int v36 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter appendAudioSampleBuffer:mediaType:](v35, v4, v36);
        }
      }
    }
  }
LABEL_31:
  objc_sync_exit(self);
}

- (void)writeIdentifierMetadata:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t MetaDataArrayWithIndentifier = VCMediaWriterUtil_GetMetaDataArrayWithIndentifier((uint64_t)a3);
    assetWriter = self->_assetWriter;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    long long v8 = *(unsigned int (**)(OpaqueFigAssetWriter *, void, uint64_t))(v7 + 56);
    if (!v8 || v8(assetWriter, *MEMORY[0x1E4F32CE8], MetaDataArrayWithIndentifier))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCFigAssetWriter writeIdentifierMetadata:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        outputURL = self->_outputURL;
        int v12 = 136316162;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCFigAssetWriter writeIdentifierMetadata:]";
        __int16 v16 = 1024;
        int v17 = 581;
        __int16 v18 = 2112;
        uint64_t v19 = MetaDataArrayWithIndentifier;
        __int16 v20 = 2112;
        Float64 v21 = outputURL;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Wrote metadata for FigAssetWriter %@ with URL %@", (uint8_t *)&v12, 0x30u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCFigAssetWriter writeIdentifierMetadata:]();
    }
  }
}

- (void)setStillImageTime:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  p_stillImageTime = &self->_stillImageTime;
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_stillImageTime.CFNumberRef value = *(_OWORD *)&a3->var0;
  self->_stillImageTime.CMTimeEpoch epoch = var3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      $95D729B680665BEAEFA1D6FCA8238556 v8 = *p_stillImageTime;
      Float64 Seconds = CMTimeGetSeconds((CMTime *)&v8);
      LODWORD(v8.value) = 136315906;
      *(int64_t *)((char *)&v8.value + 4) = v5;
      LOWORD(v8.flags) = 2080;
      *(void *)((char *)&v8.flags + 2) = "-[VCFigAssetWriter setStillImageTime:]";
      HIWORD(v8.epoch) = 1024;
      int v9 = 588;
      __int16 v10 = 2048;
      Float64 v11 = Seconds;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _stillImageTime=%f", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setStillImageTimeInternal
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d FigAssetWriterMarkEndOfDataForTrack failed with error=%d", v2, v3, v4, v5);
}

- (unsigned)startRTPTimeStamp
{
  return self->_startRTPTimeStamp;
}

- (void)setStartRTPTimeStamp:(unsigned int)a3
{
  self->_unsigned int startRTPTimeStamp = a3;
}

- (unsigned)endRTPTimeStamp
{
  return self->_endRTPTimeStamp;
}

- (void)setEndRTPTimeStamp:(unsigned int)a3
{
  self->_unsigned int endRTPTimeStamp = a3;
}

- (unsigned)writerMode
{
  return self->_writerMode;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
}

- (BOOL)finishWritingInvoked
{
  return self->_finishWritingInvoked;
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 344);
  return self;
}

- (void)setMovieFragmentInterval:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_movieFragmentInterval.CFNumberRef value = *(_OWORD *)&a3->var0;
  self->_movieFragmentInterval.CMTimeEpoch epoch = var3;
}

- (VCSandboxedURL)directoryURL
{
  return self->_directoryURL;
}

- (void)setDirectoryURL:(id)a3
{
}

- (void)initWithOutputURL:transactionID:videoCodec:keyFrameIntervalDuration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d no url", v2, v3, v4, v5, v6);
}

- (void)initWithOutputURL:transactionID:videoCodec:keyFrameIntervalDuration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d no transaction id", v2, v3, v4, v5, v6);
}

- (void)initWithOutputURL:transactionID:videoCodec:keyFrameIntervalDuration:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create early local audio buffer array", v2, v3, v4, v5, v6);
}

- (void)_setupWriter
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d FigAssetWriterCreateWithURL failed with err=%d", v2, v3, v4, v5);
}

- (void)compressionSessionWithWidth:height:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not create pixel width for compression session dictionary", v2, v3, v4, v5, v6);
}

- (void)compressionSessionWithWidth:height:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not create pixel height for compression session dictionary", v2, v3, v4, v5, v6);
}

- (void)compressionSessionWithWidth:height:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not create pixel format for compression session dictionary", v2, v3, v4, v5, v6);
}

- (void)compressionSessionWithWidth:height:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not create key frame interval duration for compression session", v2, v3, v4, v5, v6);
}

- (void)compressionSessionWithWidth:height:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not create bitrate for compression session", v2, v3, v4, v5, v6);
}

- (void)compressionSessionWithWidth:height:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not create bytes for compression session", v2, v3, v4, v5, v6);
}

- (void)compressionSessionWithWidth:height:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not create bytes limit duration for compression", v2, v3, v4, v5, v6);
}

- (void)compressionSessionWithWidth:height:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not create bytes limit array for compression", v2, v3, v4, v5, v6);
}

- (void)compressionSessionWithWidth:(NSObject *)a3 height:.cold.9(uint64_t a1, int *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = FourccToCStr(*a2);
  int v6 = 136315906;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  int v9 = "-[VCFigAssetWriter compressionSessionWithWidth:height:]";
  __int16 v10 = 1024;
  int v11 = 394;
  __int16 v12 = 2080;
  uint64_t v13 = v5;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot set VTSessionSetProperty kVTCompressionPropertyKey_ProfileLevel for unsupported codec=%s", (uint8_t *)&v6, 0x26u);
}

- (void)compressionSessionWithWidth:height:.cold.10()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_YCbCrMatrix failed with err=%d", v2, v3, v4, v5);
}

- (void)compressionSessionWithWidth:height:.cold.11()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_TransferFunction failed with err=%d", v2, v3, v4, v5);
}

- (void)compressionSessionWithWidth:height:.cold.12()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_ColorPrimaries failed with err=%d", v2, v3, v4, v5);
}

- (void)compressionSessionWithWidth:height:.cold.13()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_DataRateLimits failed with err=%d", v2, v3, v4, v5);
}

- (void)compressionSessionWithWidth:height:.cold.14()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_AverageBitRate failed with err=%d", v2, v3, v4, v5);
}

- (void)compressionSessionWithWidth:height:.cold.15()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_MaxKeyFrameIntervalDuration failed with err=%d", v2, v3, v4, v5);
}

- (void)compressionSessionWithWidth:height:.cold.16()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_AllowTemporalCompression failed with err=%d", v2, v3, v4, v5);
}

- (void)compressionSessionWithWidth:height:.cold.17()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_AllowFrameReordering failed with err=%d", v2, v3, v4, v5);
}

- (void)compressionSessionWithWidth:height:.cold.18()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_ProfileLevel failed with err=%d", v2, v3, v4, v5);
}

- (void)compressionSessionWithWidth:height:.cold.19()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_H264EntropyMode failed with err=%d", v2, v3, v4, v5);
}

- (void)compressionSessionWithWidth:height:.cold.20()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_ProfileLevel failed with err=%d", v2, v3, v4, v5);
}

- (void)compressionSessionWithWidth:height:.cold.21()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_RealTime failed with err=%d", v2, v3, v4, v5);
}

- (void)compressionSessionWithWidth:height:.cold.22()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTCompressionSessionCreate failed with err=%d", v2, v3, v4, v5);
}

- (void)encodeAndAppendSampleBuffer:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Cannot encode and append NULL sampleBuffer", v2, v3, v4, v5, v6);
}

- (void)encodeAndAppendSampleBuffer:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Cannot encode. VTCompressionSession is NULL", v2, v3, v4, v5, v6);
}

- (void)encodeAndAppendSampleBuffer:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Cannot append. Asset Writer is NULL", v2, v3, v4, v5, v6);
}

- (void)encodeAndAppendSampleBuffer:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Cannot append to invalid video track ID", v2, v3, v4, v5, v6);
}

- (void)encodeAndAppendSampleBuffer:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d FigAssetWriter cannot append NULL image buffer", v2, v3, v4, v5, v6);
}

- (void)encodeAndAppendSampleBuffer:.cold.6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTCompressionSessionEncodeFrame failed with err=%d", v2, v3, v4, v5);
}

void __48__VCFigAssetWriter_encodeAndAppendSampleBuffer___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTCompressionSessionEncodeFrame handler status=%d", v2, v3, v4, v5);
}

- (void)collectEarlyAudioBuffer:type:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Attempting to append early audio buffer with type=%d", v2, v3, v4, v5);
}

- (void)collectEarlyAudioBuffer:type:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d NULL early local audio buffer array", v2, v3, v4, v5, v6);
}

- (void)collectEarlyAudioBuffer:type:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d NULL early remote audio buffer array", v2, v3, v4, v5, v6);
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d appendVideoSampleBuffer failed. null sample buffer", v2, v3, v4, v5, v6);
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTCompressionSession not created", v2, v3, v4, v5, v6);
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d FigAssetWriterAddNativeTrack failed with err=%d", v2, v3, v4, v5);
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not create 3x3 matrix array", v2, v3, v4, v5, v6);
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d video track ID was invalid", v2, v3, v4, v5, v6);
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTCompressionSession not ready", v2, v3, v4, v5, v6);
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to encode and append sample buffer with err=%d", v2, v3, v4, v5);
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d FigAssetWriterSetFormatWriterTrackProperty kFigFormatWriterTrackProperty_TrackMatrix failed with err=%d", v2, v3, v4, v5);
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d appendVideoSampleBuffer failed. cameraStatusBit does not match", v2, v3, v4, v5, v6);
}

- (void)appendAudioSampleBuffer:mediaType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d fail to append audio sample buffer. asset writer is NULL", v2, v3, v4, v5, v6);
}

- (void)appendAudioSampleBuffer:mediaType:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d fail to append audio sample buffer. sample buffer is NULL", v2, v3, v4, v5, v6);
}

- (void)appendAudioSampleBuffer:(NSObject *)a3 mediaType:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = "-[VCFigAssetWriter appendAudioSampleBuffer:mediaType:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, a2, a3, " [%s] %s:%d invalid track id for type=%d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCFigAssetWriter appendAudioSampleBuffer:mediaType:]" >> 16, 566);
}

- (void)writeIdentifierMetadata:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d invalid identifer for FigAssetWriter metadata", v2, v3, v4, v5, v6);
}

- (void)writeIdentifierMetadata:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d FigAssetWriterSetProperty metadata failed with err=%d", v2, v3, v4, v5);
}

@end