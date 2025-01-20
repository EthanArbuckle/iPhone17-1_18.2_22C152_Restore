@interface VCMediaRecorderHistoryRequestContext
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval;
- (BOOL)hasDirectoryURL;
- (NSString)transactionID;
- (VCMediaRecorderHistoryRequestContext)initWithSerializedRequest:(id)a3;
- (id)description;
- (id)deserializeDirectoryURL;
- (id)directoryURLDescription;
- (unsigned)mediaType;
- (unsigned)timestamp;
- (void)dealloc;
@end

@implementation VCMediaRecorderHistoryRequestContext

- (VCMediaRecorderHistoryRequestContext)initWithSerializedRequest:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCMediaRecorderHistoryRequestContext;
  v4 = [(VCMediaRecorderHistoryRequestContext *)&v11 init];
  if (v4)
  {
    v4[24] = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsMediaType"), "intValue");
    *((void *)v4 + 4) = (id)[a3 objectForKeyedSubscript:@"vcMomentsTransactionID"];
    *((_DWORD *)v4 + 7) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestTimestamp"), "integerValue");
    uint64_t v5 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v4 + 40) = *MEMORY[0x1E4F1F9F8];
    *((void *)v4 + 7) = *(void *)(v5 + 16);
    CFDictionaryRef v6 = (const __CFDictionary *)[a3 objectForKeyedSubscript:@"vcMediaRecorderMovieFragmentInterval"];
    if (v6)
    {
      CMTimeMakeFromDictionary(&v10, v6);
      *(CMTime *)(v4 + 40) = v10;
    }
    *((void *)v4 + 1) = (id)[a3 objectForKeyedSubscript:@"vcMediaRecorderDirectoryURL"];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaRecorderHistoryRequestContext initWithSerializedRequest:](v8, v9);
    }
  }
  return (VCMediaRecorderHistoryRequestContext *)v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaRecorderHistoryRequestContext;
  [(VCMediaRecorderHistoryRequestContext *)&v3 dealloc];
}

- (id)directoryURLDescription
{
  v2 = NSString;
  if (self->_directoryURL) {
    return (id)[NSString stringWithFormat:@"directoryURL=%@", self->_directoryURL];
  }
  BOOL v4 = [(VCMediaRecorderHistoryRequestContext *)self hasDirectoryURL];
  uint64_t v5 = "NO";
  if (v4) {
    uint64_t v5 = "YES";
  }
  return (id)objc_msgSend(v2, "stringWithFormat:", @"hasDirectoryURL=%s", v5);
}

- (id)description
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v4 = VCMediaRecorderUtil_CopyDescriptionForMediaType((const __CFAllocator *)*MEMORY[0x1E4F1CF80], self->_mediaType);
  CMTime time = (CMTime)self->_movieFragmentInterval;
  CFStringRef v5 = CMTimeCopyDescription(v3, &time);
  v8.receiver = self;
  v8.super_class = (Class)VCMediaRecorderHistoryRequestContext;
  CFDictionaryRef v6 = (void *)[NSString stringWithFormat:@"{ %@ mediaType=%@ transactionID=%@ timestamp=%u movieFragmentInterval=%@ %@ }", -[VCMediaRecorderHistoryRequestContext description](&v8, sel_description), v4, self->_transactionID, self->_timestamp, v5, -[VCMediaRecorderHistoryRequestContext directoryURLDescription](self, "directoryURLDescription")];
  if (v5) {
    CFRelease(v5);
  }
  if (v4) {
    CFRelease(v4);
  }
  return v6;
}

- (BOOL)hasDirectoryURL
{
  return self->_serializedDirectoryURL != 0;
}

- (id)deserializeDirectoryURL
{
  directoryURL = self->_directoryURL;
  if (!directoryURL)
  {
    if (self->_serializedDirectoryURL)
    {
      directoryURL = (VCSandboxedURL *)(id)objc_msgSend(+[VCSandboxedURL deserialize:](VCSandboxedURL, "deserialize:"), "consumeToken");
      self->_directoryURL = directoryURL;
    }
    else
    {
      directoryURL = 0;
    }
  }
  CFStringRef v4 = directoryURL;

  return v4;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (unsigned)timestamp
{
  return self->_timestamp;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (void)initWithSerializedRequest:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  CFStringRef v5 = "-[VCMediaRecorderHistoryRequestContext initWithSerializedRequest:]";
  __int16 v6 = 1024;
  int v7 = 29;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to super init VCMediaRecorderHistoryRequestContext", (uint8_t *)&v2, 0x1Cu);
}

@end