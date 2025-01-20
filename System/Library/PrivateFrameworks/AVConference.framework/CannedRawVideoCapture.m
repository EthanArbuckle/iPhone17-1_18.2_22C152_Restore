@interface CannedRawVideoCapture
- (CannedRawVideoCapture)initWithPath:(id)a3;
- (NSArray)allResolutions;
- (NSDictionary)currentResolution;
- (VideoScaler)videoScaler;
- (__CVBuffer)createPixelBufferForFrameIndex:(int)a3;
- (double)allFrameRate;
- (int)allFrameCount;
- (int)height;
- (int)initializeFrameResolutionArrayFromFolder:(id)a3;
- (int)setWidth:(int)a3 height:(int)a4;
- (int)width;
- (void)dealloc;
- (void)getFrameRate:(double *)a3 frameCount:(int *)a4;
- (void)setAllFrameCount:(int)a3;
- (void)setAllFrameRate:(double)a3;
- (void)setAllResolutions:(id)a3;
- (void)setCurrentResolution:(id)a3;
- (void)setHeight:(int)a3;
- (void)setVideoScaler:(id)a3;
- (void)setWidth:(int)a3;
@end

@implementation CannedRawVideoCapture

- (CannedRawVideoCapture)initWithPath:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)CannedRawVideoCapture;
  v5 = [(CannedRawVideoCapture *)&v14 init];
  v6 = v5;
  if (v5)
  {
    pthread_mutex_init(&v5->_inputMutex, 0);
    pthread_mutex_init(&v6->_attributeMutex, 0);
    int v7 = [(CannedRawVideoCapture *)v6 initializeFrameResolutionArrayFromFolder:a3];
    v6->_videoScaler = objc_alloc_init(VideoScaler);
    if (v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          v11 = (objc_class *)objc_opt_class();
          Name = class_getName(v11);
          v13 = sel_getName(a2);
          *(_DWORD *)buf = 136316162;
          uint64_t v16 = v8;
          __int16 v17 = 2080;
          v18 = "-[CannedRawVideoCapture initWithPath:]";
          __int16 v19 = 1024;
          int v20 = 93;
          __int16 v21 = 2080;
          v22 = Name;
          __int16 v23 = 2080;
          v24 = v13;
          _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s %s failed!", buf, 0x30u);
        }
      }

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  pthread_mutex_destroy(&self->_inputMutex);
  pthread_mutex_destroy(&self->_attributeMutex);

  currentInputFile = self->_currentInputFile;
  if (currentInputFile) {
    fclose(currentInputFile);
  }
  currentPixelBufferPool = self->_currentPixelBufferPool;
  if (currentPixelBufferPool) {
    CFRelease(currentPixelBufferPool);
  }
  rotatedPixelBufferPool = self->_rotatedPixelBufferPool;
  if (rotatedPixelBufferPool) {
    CFRelease(rotatedPixelBufferPool);
  }
  v6.receiver = self;
  v6.super_class = (Class)CannedRawVideoCapture;
  [(CannedRawVideoCapture *)&v6 dealloc];
}

- (int)initializeFrameResolutionArrayFromFolder:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v26 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v27 = a3;
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "contentsOfDirectoryAtPath:error:", a3, 0);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v28 = 0x7FFFFFFF;
    uint64_t v7 = *(void *)v35;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([v10 hasSuffix:objc_msgSend(NSString, "stringWithFormat:", @".%s", "420v")])
        {
          uint64_t v30 = 0;
          float v29 = 0.0;
          BOOL v12 = sscanf((const char *)[v10 UTF8String], "%dx%dx%f", (char *)&v30 + 4, &v30, &v29) != 3
             || SHIDWORD(v30) < 1;
          if (!v12 && (int)v30 >= 1)
          {
            *(float *)&double v11 = v29;
            if (v29 > 0.0)
            {
              uint64_t v14 = [NSString stringWithFormat:@"%@/%@", v11, v27, v10];
              unint64_t v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", v14, 0), "fileSize");
              unint64_t v16 = v15 / ((uint64_t)(int)(12 * HIDWORD(v30) * v30 + (12 * HIDWORD(v30) * (int)v30 < 0 ? 7 : 0)) >> 3);
              if (v16)
              {
                v31[0] = @"width";
                v32[0] = objc_msgSend(NSNumber, "numberWithInt:");
                v31[1] = @"height";
                uint64_t v17 = [NSNumber numberWithInt:v30];
                v31[2] = @"path";
                v32[1] = v17;
                v32[2] = v14;
                objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v32, v31, 3));
                int v18 = v28 >= (int)v16 ? v16 : v28;
                int v28 = v18;
                double v11 = v29;
                if (v8 < v29) {
                  double v8 = v29;
                }
              }
            }
          }
        }
      }
      uint64_t v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v33, 16, v11);
    }
    while (v6);
  }
  else
  {
    int v28 = 0x7FFFFFFF;
    double v8 = 0.0;
  }
  if ([v26 count])
  {
    pthread_mutex_lock(&self->_inputMutex);

    self->_allResolutions = (NSArray *)v26;
    int v19 = v28;
    if (v28 <= 1) {
      int v19 = 1;
    }
    self->_allFrameCount = v19;
    double v20 = 10.0;
    if (v8 > 0.0) {
      double v20 = v8;
    }
    self->_allFrameRate = v20;
    pthread_mutex_unlock(&self->_inputMutex);
    objc_msgSend(+[VCCannedAVSync sharedCannedAVSync](VCCannedAVSync, "sharedCannedAVSync"), "addStreamWithCount:rate:", self->_allFrameCount, self->_allFrameRate);
    return 0;
  }
  else
  {
    int v21 = -2142633974;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      __int16 v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        [(CannedRawVideoCapture *)v22 initializeFrameResolutionArrayFromFolder:v23];
      }
    }
  }
  return v21;
}

- (int)setWidth:(int)a3 height:(int)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  p_attributeMutex = &self->_attributeMutex;
  pthread_mutex_lock(&self->_attributeMutex);
  if (*(void *)&self->_width == __PAIR64__(a4, a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    {
LABEL_45:
      int v10 = 0;
      goto LABEL_46;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E4F47A50];
    int v10 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v46 = v8;
      __int16 v47 = 2080;
      v48 = "-[CannedRawVideoCapture setWidth:height:]";
      __int16 v49 = 1024;
      int v50 = 200;
      __int16 v51 = 1024;
      int v52 = a3;
      __int16 v53 = 1024;
      int v54 = a4;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No width/height change (%dx%d). Skipping re-initialization.", buf, 0x28u);
      goto LABEL_45;
    }
  }
  else
  {
    self->_width = a3;
    self->_height = a4;
    p_inputMutex = &self->_inputMutex;
    pthread_mutex_lock(&self->_inputMutex);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    allResolutions = self->_allResolutions;
    uint64_t v12 = [(NSArray *)allResolutions countByEnumeratingWithState:&v56 objects:v55 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      int v14 = 0;
      long long v34 = 0;
      uint64_t v15 = *(void *)v57;
      unsigned int v35 = 160;
      unsigned int v36 = 120;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v57 != v15) {
            objc_enumerationMutation(allResolutions);
          }
          uint64_t v17 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          int v18 = objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", @"width", p_inputMutex), "intValue");
          int v19 = objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", @"height"), "intValue");
          if (v18 <= self->_width && v19 <= self->_height && v19 * v18 > v14)
          {
            unsigned int v35 = v18;
            unsigned int v36 = v19;
            int v14 = v19 * v18;
            long long v34 = v17;
          }
        }
        uint64_t v13 = [(NSArray *)allResolutions countByEnumeratingWithState:&v56 objects:v55 count:16];
      }
      while (v13);
    }
    else
    {
      long long v34 = 0;
      unsigned int v35 = 160;
      unsigned int v36 = 120;
    }

    currentResolution = v34;
    self->_currentResolution = currentResolution;
    currentInputFile = self->_currentInputFile;
    if (currentInputFile)
    {
      fclose(currentInputFile);
      self->_currentInputFile = 0;
      currentResolution = self->_currentResolution;
    }
    if (currentResolution)
    {
      bzero(buf, 0x400uLL);
      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](currentResolution, "objectForKeyedSubscript:", @"path"), "getCString:maxLength:encoding:", buf, 1024, 4);
      self->_currentInputFile = fopen((const char *)buf, "rb");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          if ([v34 objectForKey:@"path"]) {
            uint64_t v25 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v34, "objectForKey:", @"path"), "description"), "UTF8String");
          }
          else {
            uint64_t v25 = "<nil>";
          }
          *(_DWORD *)long long v37 = 136315906;
          uint64_t v38 = v23;
          __int16 v39 = 2080;
          v40 = "-[CannedRawVideoCapture setWidth:height:]";
          __int16 v41 = 1024;
          int v42 = 252;
          __int16 v43 = 2080;
          v44 = v25;
          _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Reading from %s", v37, 0x26u);
        }
      }
    }
    p_currentPixelBufferPool = (CFTypeRef *)&self->_currentPixelBufferPool;
    currentPixelBufferPool = self->_currentPixelBufferPool;
    if (currentPixelBufferPool)
    {
      CFRelease(currentPixelBufferPool);
      CFTypeRef *p_currentPixelBufferPool = 0;
    }
    rotatedPixelBufferPool = self->_rotatedPixelBufferPool;
    p_rotatedPixelBufferPool = &self->_rotatedPixelBufferPool;
    int v28 = rotatedPixelBufferPool;
    if (rotatedPixelBufferPool)
    {
      CFRelease(v28);
      *p_rotatedPixelBufferPool = 0;
    }
    if (+[CannedVideoCapture createPixelBufferPool:withWidth:height:](CannedVideoCapture, "createPixelBufferPool:withWidth:height:", p_currentPixelBufferPool, v35, v36, p_inputMutex))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[CannedRawVideoCapture setWidth:height:]();
        }
      }
    }
    else
    {
      if (!+[CannedVideoCapture createPixelBufferPool:p_rotatedPixelBufferPool withWidth:v36 height:v35])
      {
        pthread_mutex_unlock(v33);
        goto LABEL_45;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[CannedRawVideoCapture setWidth:height:]();
        }
      }
      if (*p_currentPixelBufferPool)
      {
        CFRelease(*p_currentPixelBufferPool);
        CFTypeRef *p_currentPixelBufferPool = 0;
      }
    }
    int v10 = -2142633980;
    pthread_mutex_unlock(v33);
  }
LABEL_46:
  pthread_mutex_unlock(p_attributeMutex);
  return v10;
}

- (__CVBuffer)createPixelBufferForFrameIndex:(int)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int valuePtr = a3;
  p_inputMutex = &self->_inputMutex;
  pthread_mutex_lock(&self->_inputMutex);
  int v5 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_currentResolution, "objectForKeyedSubscript:", @"width"), "intValue");
  int v6 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_currentResolution, "objectForKeyedSubscript:", @"height"), "intValue");
  BOOL v8 = v5 < 1 || v6 < 1;
  if (v8) {
    size_t v9 = 160;
  }
  else {
    size_t v9 = v5;
  }
  if (v8) {
    size_t v10 = 120;
  }
  else {
    size_t v10 = v6;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], self->_currentPixelBufferPool, &pixelBufferOut))
  {
    pthread_mutex_unlock(p_inputMutex);
    return 0;
  }
  else
  {
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24A90], (CFTypeRef)*MEMORY[0x1E4F24AB0], kCVAttachmentMode_ShouldPropagate);
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24BC8], (CFTypeRef)*MEMORY[0x1E4F24BE0], kCVAttachmentMode_ShouldPropagate);
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24C18], (CFTypeRef)*MEMORY[0x1E4F24C48], kCVAttachmentMode_ShouldPropagate);
    CFNumberRef v13 = CFNumberCreate(v11, kCFNumberIntType, &valuePtr);
    if (v13)
    {
      CFNumberRef v14 = v13;
      CVBufferSetAttachment(pixelBufferOut, @"FrameIndex", v13, kCVAttachmentMode_ShouldPropagate);
      CFRelease(v14);
    }
    currentInputFile = self->_currentInputFile;
    if (currentInputFile) {
      fseeko(currentInputFile, valuePtr * (uint64_t)(12 * (int)v9 * (int)v10) / 8, 0);
    }
    CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, 0);
    if (BaseAddressOfPlane)
    {
      uint64_t v17 = BaseAddressOfPlane;
      int BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, 0);
      if (v9 == BytesPerRowOfPlane)
      {
        int v19 = self->_currentInputFile;
        if (v19) {
          fread(v17, v10, v9, v19);
        }
        else {
          bzero(v17, (int)v10 * (int)v9);
        }
      }
      else
      {
        uint64_t v20 = BytesPerRowOfPlane;
        if ((int)v10 <= 1) {
          uint64_t v21 = 1;
        }
        else {
          uint64_t v21 = v10;
        }
        do
        {
          uint64_t v22 = self->_currentInputFile;
          if (v22) {
            fread(v17, 1uLL, v9, v22);
          }
          else {
            bzero(v17, v9);
          }
          v17 += v20;
          --v21;
        }
        while (v21);
      }
    }
    uint64_t v23 = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, 1uLL);
    if (v23)
    {
      v24 = v23;
      unsigned int v25 = CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, 1uLL);
      size_t v26 = v9 & 0xFFFFFFFE;
      if (v26 == v25)
      {
        id v27 = self->_currentInputFile;
        size_t v28 = v10 >> 1;
        if (v27) {
          fread(v24, v28, v25, v27);
        }
        else {
          bzero(v24, v28 * v25);
        }
      }
      else if (v10 >= 2)
      {
        uint64_t v29 = v10 >> 1;
        uint64_t v30 = (int)v25;
        do
        {
          v31 = self->_currentInputFile;
          if (v31) {
            fread(v24, 1uLL, v26, v31);
          }
          else {
            bzero(v24, v26);
          }
          v24 += v30;
          --v29;
        }
        while (v29);
      }
    }
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    pthread_mutex_unlock(p_inputMutex);
    return pixelBufferOut;
  }
}

- (void)getFrameRate:(double *)a3 frameCount:(int *)a4
{
  p_inputMutex = &self->_inputMutex;
  pthread_mutex_lock(&self->_inputMutex);
  if (a3) {
    *a3 = self->_allFrameRate;
  }
  if (a4) {
    *a4 = self->_allFrameCount;
  }

  pthread_mutex_unlock(p_inputMutex);
}

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (int)height
{
  return self->_height;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

- (NSArray)allResolutions
{
  return self->_allResolutions;
}

- (void)setAllResolutions:(id)a3
{
}

- (int)allFrameCount
{
  return self->_allFrameCount;
}

- (void)setAllFrameCount:(int)a3
{
  self->_allFrameCount = a3;
}

- (double)allFrameRate
{
  return self->_allFrameRate;
}

- (void)setAllFrameRate:(double)a3
{
  self->_allFrameRate = a3;
}

- (NSDictionary)currentResolution
{
  return self->_currentResolution;
}

- (void)setCurrentResolution:(id)a3
{
}

- (VideoScaler)videoScaler
{
  return self->_videoScaler;
}

- (void)setVideoScaler:(id)a3
{
}

- (void)initializeFrameResolutionArrayFromFolder:(os_log_t)log .cold.1(uint64_t a1, void *a2, os_log_t log)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2) {
    int v5 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  }
  else {
    int v5 = "<nil>";
  }
  int v6 = 136315906;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  size_t v9 = "-[CannedRawVideoCapture initializeFrameResolutionArrayFromFolder:]";
  __int16 v10 = 1024;
  int v11 = 172;
  __int16 v12 = 2080;
  CFNumberRef v13 = v5;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d There are no valid raw video files in the specified folder %s", (uint8_t *)&v6, 0x26u);
}

- (void)setWidth:height:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[CannedRawVideoCapture setWidth:height:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Rotated PixelBuffer pool creation failed(%d)", v2, *(const char **)v3, (unint64_t)"-[CannedRawVideoCapture setWidth:height:]" >> 16, 276);
}

- (void)setWidth:height:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[CannedRawVideoCapture setWidth:height:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d PixelBuffer pool creation failed(%d)", v2, *(const char **)v3, (unint64_t)"-[CannedRawVideoCapture setWidth:height:]" >> 16, 264);
}

@end