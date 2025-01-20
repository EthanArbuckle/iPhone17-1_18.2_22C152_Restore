@interface AVCMediaRecorderRequestConfiguration
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval;
- (AVCMediaRecorderRequestConfiguration)init;
- (NSString)requesteeID;
- (NSURL)directoryURL;
- (id)description;
- (unsigned)mediaType;
- (unsigned)requestMode;
- (void)dealloc;
- (void)setDirectoryURL:(id)a3;
- (void)setMediaType:(unsigned __int8)a3;
- (void)setMovieFragmentInterval:(id *)a3;
- (void)setRequestMode:(unsigned __int8)a3;
- (void)setRequesteeID:(id)a3;
@end

@implementation AVCMediaRecorderRequestConfiguration

- (AVCMediaRecorderRequestConfiguration)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)AVCMediaRecorderRequestConfiguration;
  v2 = [(AVCMediaRecorderRequestConfiguration *)&v6 init];
  if (v2)
  {
    CMTimeMakeWithSeconds(&v7, 10.0, 1);
    *(CMTime *)(v2 + 32) = v7;
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCMediaRecorderRequestConfiguration-init");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v7.value) = 136315906;
        *(CMTimeValue *)((char *)&v7.value + 4) = v3;
        LOWORD(v7.flags) = 2080;
        *(void *)((char *)&v7.flags + 2) = "-[AVCMediaRecorderRequestConfiguration init]";
        HIWORD(v7.epoch) = 1024;
        int v8 = 29;
        __int16 v9 = 2048;
        v10 = v2;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCMediaRecorderRequestConfiguration-init (%p)", (uint8_t *)&v7, 0x26u);
      }
    }
  }
  return (AVCMediaRecorderRequestConfiguration *)v2;
}

- (id)description
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v4 = VCMediaRecorderUtil_CopyDescriptionForMediaType((const __CFAllocator *)*MEMORY[0x1E4F1CF80], self->_mediaType);
  CMTime time = (CMTime)self->_movieFragmentInterval;
  CFStringRef v5 = CMTimeCopyDescription(v3, &time);
  v8.receiver = self;
  v8.super_class = (Class)AVCMediaRecorderRequestConfiguration;
  objc_super v6 = (void *)[NSString stringWithFormat:@"{ %@ mediaType=%@ requestMode=%hhu requesteeID=%@ directoryURL=%@ movieFragmentInterval=%@ }", -[AVCMediaRecorderRequestConfiguration description](&v8, sel_description), v4, self->_requestMode, self->_requesteeID, self->_directoryURL, v5];
  if (v5) {
    CFRelease(v5);
  }
  if (v4) {
    CFRelease(v4);
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCMediaRecorderRequestConfiguration-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    CFStringRef v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "-[AVCMediaRecorderRequestConfiguration dealloc]";
      __int16 v10 = 1024;
      int v11 = 61;
      __int16 v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCMediaRecorderRequestConfiguration-dealloc (%p)", buf, 0x26u);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVCMediaRecorderRequestConfiguration;
  [(AVCMediaRecorderRequestConfiguration *)&v5 dealloc];
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (void)setDirectoryURL:(id)a3
{
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unsigned __int8)a3
{
  self->_mediaType = a3;
}

- (unsigned)requestMode
{
  return self->_requestMode;
}

- (void)setRequestMode:(unsigned __int8)a3
{
  self->_requestMode = a3;
}

- (NSString)requesteeID
{
  return self->_requesteeID;
}

- (void)setRequesteeID:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setMovieFragmentInterval:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_movieFragmentInterval.epoch = a3->var3;
  *(_OWORD *)&self->_movieFragmentInterval.value = v3;
}

@end