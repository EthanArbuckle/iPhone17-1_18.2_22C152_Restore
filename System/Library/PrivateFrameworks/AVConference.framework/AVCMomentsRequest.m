@interface AVCMomentsRequest
+ (id)invalidDelegateInstanceError;
- (AVCMediaRecorderRequestDelegate)delegate;
- (AVCMomentsRequest)initWithConfiguration:(id)a3 requesterID:(id)a4;
- (AVCMomentsRequest)initWithConfiguration:(id)a3 requesterID:(id)a4 transactionID:(id)a5;
- (BOOL)endWithError:(id *)a3;
- (BOOL)hasDirectoryURL;
- (BOOL)rejectWithError:(id *)a3;
- (BOOL)setUpDirectoryURLWithConfiguration:(id)a3;
- (BOOL)setUpMovieFragmentIntervalWithConfiguration:(id)a3;
- (BOOL)startWithError:(id *)a3;
- (BOOL)validateWithError:(id *)a3;
- (NSString)requesteeID;
- (NSString)requesterID;
- (NSString)transactionID;
- (id)description;
- (id)serialize;
- (unsigned)mediaType;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation AVCMomentsRequest

- (BOOL)startWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = [(AVCMomentsRequest *)self delegate];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCMediaRecorderRequest-startWithError");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316418;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      v13 = "-[AVCMomentsRequest startWithError:]";
      __int16 v14 = 1024;
      int v15 = 40;
      __int16 v16 = 2112;
      v17 = self;
      __int16 v18 = 2112;
      v19 = v5;
      __int16 v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCMediaRecorderRequest-startWithError self=%@ delegate=%@ error=%p", (uint8_t *)&v10, 0x3Au);
    }
  }
  if (v5) {
    return [(AVCMediaRecorderRequestDelegate *)v5 avcMediaRecorderRequestDidStartRequest:self withError:a3];
  }
  if (!a3) {
    return 0;
  }
  id v9 = +[AVCMomentsRequest invalidDelegateInstanceError];
  BOOL result = 0;
  *a3 = v9;
  return result;
}

- (BOOL)endWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = [(AVCMomentsRequest *)self delegate];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCMediaRecorderRequest-endWithError");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316418;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      v13 = "-[AVCMomentsRequest endWithError:]";
      __int16 v14 = 1024;
      int v15 = 51;
      __int16 v16 = 2112;
      v17 = self;
      __int16 v18 = 2112;
      v19 = v5;
      __int16 v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCMediaRecorderRequest-endWithError self=%@ delegate=%@ error=%p", (uint8_t *)&v10, 0x3Au);
    }
  }
  if (v5) {
    return [(AVCMediaRecorderRequestDelegate *)v5 avcMediaRecorderRequestDidEndRequest:self withError:a3];
  }
  if (!a3) {
    return 0;
  }
  id v9 = +[AVCMomentsRequest invalidDelegateInstanceError];
  BOOL result = 0;
  *a3 = v9;
  return result;
}

- (BOOL)rejectWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = [(AVCMomentsRequest *)self delegate];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCMediaRecorderRequest-rejectWithError");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316418;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      v13 = "-[AVCMomentsRequest rejectWithError:]";
      __int16 v14 = 1024;
      int v15 = 61;
      __int16 v16 = 2112;
      v17 = self;
      __int16 v18 = 2112;
      v19 = v5;
      __int16 v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCMediaRecorderRequest-rejectWithError self=%@ delegate=%@ error=%p", (uint8_t *)&v10, 0x3Au);
    }
  }
  if (v5) {
    return [(AVCMediaRecorderRequestDelegate *)v5 avcMediaRecorderRequestDidRejectRequest:self withError:a3];
  }
  if (!a3) {
    return 0;
  }
  id v9 = +[AVCMomentsRequest invalidDelegateInstanceError];
  BOOL result = 0;
  *a3 = v9;
  return result;
}

- (BOOL)setUpDirectoryURLWithConfiguration:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 directoryURL];
  if (!v4) {
    goto LABEL_8;
  }
  v5 = (void *)v4;
  if (!VCFeatureFlagManager_RecordingResiliencyEnabled()) {
    goto LABEL_8;
  }
  if (self->_mode == 1)
  {
    char v14 = 0;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:isDirectory:", objc_msgSend(v5, "path"), &v14))
    {
      if (v14)
      {
        if (access((const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "URLByStandardizingPath"), "path"), "UTF8String"), 6))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v11 = VRTraceErrorLogLevelToCSTR();
            __int16 v12 = *MEMORY[0x1E4F47A50];
            BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v7) {
              return v7;
            }
            [(AVCMomentsRequest *)v11 setUpDirectoryURLWithConfiguration:v12];
          }
        }
        else
        {
          uint64_t v6 = [[VCSandboxedURL alloc] initWithURL:v5 accessType:2];
          self->_directoryURL = v6;
          if (v6)
          {
LABEL_8:
            LOBYTE(v7) = 1;
            return v7;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v7) {
              return v7;
            }
            -[AVCMomentsRequest setUpDirectoryURLWithConfiguration:]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v7) {
          return v7;
        }
        -[AVCMomentsRequest setUpDirectoryURLWithConfiguration:]();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v7) {
        return v7;
      }
      -[AVCMomentsRequest setUpDirectoryURLWithConfiguration:].cold.4();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    id v9 = *MEMORY[0x1E4F47A50];
    BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    int mode = self->_mode;
    *(_DWORD *)buf = 136316162;
    uint64_t v16 = v8;
    __int16 v17 = 2080;
    __int16 v18 = "-[AVCMomentsRequest setUpDirectoryURLWithConfiguration:]";
    __int16 v19 = 1024;
    int v20 = 85;
    __int16 v21 = 2112;
    uint64_t v22 = v5;
    __int16 v23 = 1024;
    int v24 = mode;
    _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d Providing a directoryURL=%@ is unsupported with a non-local request mode=%hhu", buf, 0x2Cu);
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (BOOL)setUpMovieFragmentIntervalWithConfiguration:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  self->_movieFragmentInterval = *($95D729B680665BEAEFA1D6FCA8238556 *)*(void *)&MEMORY[0x1E4F1F9F8];
  memset(&v10, 170, sizeof(v10));
  if (!a3) {
    goto LABEL_6;
  }
  [a3 movieFragmentInterval];
  if ((v10.flags & 1) == 0 || !VCFeatureFlagManager_RecordingResiliencyEnabled()) {
    goto LABEL_6;
  }
  if (self->_mode == 1)
  {
    self->_movieFragmentInterval = ($95D729B680665BEAEFA1D6FCA8238556)v10;
LABEL_6:
    LOBYTE(v4) = 1;
    return v4;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v4) {
      return v4;
    }
    CMTime time = v10;
    Float64 Seconds = CMTimeGetSeconds(&time);
    int mode = self->_mode;
    LODWORD(time.value) = 136316162;
    *(CMTimeValue *)((char *)&time.value + 4) = v5;
    LOWORD(time.flags) = 2080;
    *(void *)((char *)&time.flags + 2) = "-[AVCMomentsRequest setUpMovieFragmentIntervalWithConfiguration:]";
    HIWORD(time.epoch) = 1024;
    int v12 = 114;
    __int16 v13 = 2048;
    Float64 v14 = Seconds;
    __int16 v15 = 1024;
    int v16 = mode;
    _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d Providing a movieFragmentInterval=%f is unsupported with a non-local request mode=%hhu", (uint8_t *)&time, 0x2Cu);
  }
  LOBYTE(v4) = 0;
  return v4;
}

- (AVCMomentsRequest)initWithConfiguration:(id)a3 requesterID:(id)a4 transactionID:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)AVCMomentsRequest;
  uint64_t v8 = [(AVCMomentsRequest *)&v10 init];
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMomentsRequest initWithConfiguration:requesterID:transactionID:]();
      }
    }
    goto LABEL_18;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMomentsRequest initWithConfiguration:requesterID:transactionID:]();
      }
    }
    goto LABEL_18;
  }
  v8->_transactionID = (NSString *)[a5 copy];
  v8->_requesterID = (NSString *)[a4 copy];
  v8->_requesteeID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "requesteeID"), "copy");
  v8->_mediaType = [a3 mediaType];
  v8->_int mode = [a3 requestMode];
  if (![(AVCMomentsRequest *)v8 setUpDirectoryURLWithConfiguration:a3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMomentsRequest initWithConfiguration:requesterID:transactionID:].cold.4();
      }
    }
    goto LABEL_18;
  }
  if (![(AVCMomentsRequest *)v8 setUpMovieFragmentIntervalWithConfiguration:a3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMomentsRequest initWithConfiguration:requesterID:transactionID:]();
      }
    }
LABEL_18:

    return 0;
  }
  return v8;
}

- (AVCMomentsRequest)initWithConfiguration:(id)a3 requesterID:(id)a4
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");

  return [(AVCMomentsRequest *)self initWithConfiguration:a3 requesterID:a4 transactionID:v7];
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    BOOL v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      id v9 = "-[AVCMomentsRequest dealloc]";
      __int16 v10 = 1024;
      int v11 = 151;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  objc_storeWeak(&self->_weakDelegate, 0);

  v5.receiver = self;
  v5.super_class = (Class)AVCMomentsRequest;
  [(AVCMomentsRequest *)&v5 dealloc];
}

- (id)description
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v4 = VCMediaRecorderUtil_CopyDescriptionForMediaType((const __CFAllocator *)*MEMORY[0x1E4F1CF80], self->_mediaType);
  CMTime time = (CMTime)self->_movieFragmentInterval;
  CFStringRef v5 = CMTimeCopyDescription(v3, &time);
  v8.receiver = self;
  v8.super_class = (Class)AVCMomentsRequest;
  uint64_t v6 = (void *)[NSString stringWithFormat:@"{ %@ transactionID=%@ mediaType=%@ requesterID=%@ requesteeID=%@ directoryURL=%@ movieFragmentInterval=%@ }", -[AVCMomentsRequest description](&v8, sel_description), self->_transactionID, v4, self->_requesterID, self->_requesteeID, self->_directoryURL, v5];
  if (v5) {
    CFRelease(v5);
  }
  if (v4) {
    CFRelease(v4);
  }
  return v6;
}

- (id)serialize
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v13[0] = self->_transactionID;
  v12[0] = @"vcMomentsTransactionID";
  v12[1] = @"vcMomentsMediaType";
  v13[1] = [NSNumber numberWithUnsignedChar:self->_mediaType];
  v12[2] = @"vcMomentsRequestMode";
  v13[2] = [NSNumber numberWithUnsignedChar:self->_mode];
  CFAllocatorRef v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, v12, 3), "mutableCopy");
  CFStringRef v4 = v3;
  requesterID = self->_requesterID;
  if (requesterID) {
    [v3 setObject:requesterID forKeyedSubscript:@"vcMomentsRequesterID"];
  }
  requesteeID = self->_requesteeID;
  if (requesteeID) {
    [v4 setObject:requesteeID forKeyedSubscript:@"vcMomentsRequesteeID"];
  }
  directoryURL = self->_directoryURL;
  if (directoryURL) {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[VCSandboxedURL serialize](directoryURL, "serialize"), @"vcMediaRecorderDirectoryURL");
  }
  if (self->_movieFragmentInterval.flags)
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    $95D729B680665BEAEFA1D6FCA8238556 movieFragmentInterval = self->_movieFragmentInterval;
    CFDictionaryRef v9 = CMTimeCopyAsDictionary((CMTime *)&movieFragmentInterval, v8);
    [v4 setObject:v9 forKeyedSubscript:@"vcMediaRecorderMovieFragmentInterval"];
    if (v9) {
      CFRelease(v9);
    }
  }
  return v4;
}

- (BOOL)hasDirectoryURL
{
  return self->_directoryURL != 0;
}

- (BOOL)validateWithError:(id *)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (self->_transactionID)
  {
    if (self->_mediaType)
    {
      if (self->_mode)
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      uint64_t v6 = "mode is invalid";
      uint64_t v7 = -4;
    }
    else
    {
      uint64_t v6 = "media type is invalid";
      uint64_t v7 = -3;
    }
  }
  else
  {
    uint64_t v6 = "transactionID is nil";
    uint64_t v7 = -1;
  }
  if (a3)
  {
    CFAllocatorRef v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23[0] = [NSString stringWithUTF8String:v6];
    *a3 = (id)objc_msgSend(v8, "errorWithDomain:code:userInfo:", @"AVCMomentsRequest", v7, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1));
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v5) {
      return v5;
    }
    int v12 = 136316162;
    uint64_t v13 = v9;
    __int16 v14 = 2080;
    __int16 v15 = "-[AVCMomentsRequest validateWithError:]";
    __int16 v16 = 1024;
    int v17 = 215;
    __int16 v18 = 2048;
    __int16 v19 = self;
    __int16 v20 = 2080;
    __int16 v21 = v6;
    _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %p failed validation: %s", (uint8_t *)&v12, 0x30u);
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (AVCMediaRecorderRequestDelegate)delegate
{
  return (AVCMediaRecorderRequestDelegate *)objc_loadWeak(&self->_weakDelegate);
}

- (void)setDelegate:(id)a3
{
}

+ (id)invalidDelegateInstanceError
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v5[0] = @"Attempting to invoke on request with no valid parent class";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"AVCMomentsRequest" code:-5 userInfo:v2];
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (NSString)requesterID
{
  return self->_requesterID;
}

- (NSString)requesteeID
{
  return self->_requesteeID;
}

- (void)setUpDirectoryURLWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d directoryURL=%@ is NOT a directory");
}

- (void)setUpDirectoryURLWithConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate sandboxedURL for directoryURL=%@");
}

- (void)setUpDirectoryURLWithConfiguration:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = __error();
  uint64_t v7 = strerror(*v6);
  int v8 = 136316162;
  uint64_t v9 = a1;
  __int16 v10 = 2080;
  int v11 = "-[AVCMomentsRequest setUpDirectoryURLWithConfiguration:]";
  __int16 v12 = 1024;
  int v13 = 92;
  __int16 v14 = 2112;
  uint64_t v15 = a2;
  __int16 v16 = 2080;
  int v17 = v7;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed access check for directoryURL=%@, with error=%s", (uint8_t *)&v8, 0x30u);
}

- (void)setUpDirectoryURLWithConfiguration:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d directoryURL=%@ is NOT present on disk");
}

- (void)initWithConfiguration:requesterID:transactionID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to super init request", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:requesterID:transactionID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid configuration passed", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:requesterID:transactionID:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Fsiled to set up movieFragmentInterval", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:requesterID:transactionID:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to set up directoryURL", v2, v3, v4, v5, v6);
}

@end