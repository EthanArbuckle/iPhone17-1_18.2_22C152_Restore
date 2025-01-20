@interface MLPixelBufferPool
- (MLPixelBufferPool)init;
- (NSMutableDictionary)pixelBufferPoolCache;
- (__CVBuffer)createPixelBufferWithSize:(CGSize)a3 pixelFormatType:(unsigned int)a4 error:(id *)a5;
- (__CVPixelBufferPool)_pixelBufferPoolWithSize:(CGSize)a3 pixelFormatType:(unsigned int)a4 error:(id *)a5;
@end

@implementation MLPixelBufferPool

- (MLPixelBufferPool)init
{
  v6.receiver = self;
  v6.super_class = (Class)MLPixelBufferPool;
  v2 = [(MLPixelBufferPool *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pixelBufferPoolCache = v2->_pixelBufferPoolCache;
    v2->_pixelBufferPoolCache = v3;

    v2->_cacheLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
}

- (NSMutableDictionary)pixelBufferPoolCache
{
  return self->_pixelBufferPoolCache;
}

- (__CVBuffer)createPixelBufferWithSize:(CGSize)a3 pixelFormatType:(unsigned int)a4 error:(id *)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  result = -[MLPixelBufferPool _pixelBufferPoolWithSize:pixelFormatType:error:](self, "_pixelBufferPoolWithSize:pixelFormatType:error:");
  if (result)
  {
    CVPixelBufferRef pixelBufferOut = 0;
    uint64_t v10 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], result, &pixelBufferOut);
    if (v10)
    {
      v11 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110656;
        int v19 = (int)width;
        __int16 v20 = 1024;
        int v21 = (int)height;
        __int16 v22 = 1024;
        unsigned int v23 = HIBYTE(a4);
        __int16 v24 = 1024;
        int v25 = BYTE2(a4);
        __int16 v26 = 1024;
        int v27 = BYTE1(a4);
        __int16 v28 = 1024;
        int v29 = a4;
        __int16 v30 = 1024;
        int v31 = v10;
        _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "Faield to create a CVPixelBuffer for frame size %d x %d with pixel format type %c%c%c%c because CVPixelBufferPoolCreatePixelBuffer returned %d.", buf, 0x2Cu);
      }

      if (a5)
      {
        v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = *MEMORY[0x1E4F28568];
        v13 = objc_msgSend(NSString, "stringWithFormat:", @"Faield to create a CVPixelBuffer for frame size %d x %d with pixel format type %c%c%c%c because CVPixelBufferPoolCreatePixelBuffer returned %d.", (int)width, (int)height, HIBYTE(a4), BYTE2(a4), BYTE1(a4), a4, v10);
        v17 = v13;
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
        *a5 = [v12 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v14];
      }
    }
    return pixelBufferOut;
  }
  return result;
}

- (__CVPixelBufferPool)_pixelBufferPoolWithSize:(CGSize)a3 pixelFormatType:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  double height = a3.height;
  double width = a3.width;
  v44[5] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = [(MLPixelBufferPool *)self pixelBufferPoolCache];
  v11 = -[PixelBufferPoolKey initWithSize:pixelFormatType:]([PixelBufferPoolKey alloc], "initWithSize:pixelFormatType:", v6, width, height);
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(p_cacheLock);
  CVPixelBufferPoolRef poolOut = (CVPixelBufferPoolRef)[v10 objectForKey:v11];
  if (!poolOut)
  {
    v43[0] = *MEMORY[0x1E4F24D70];
    v13 = [NSNumber numberWithUnsignedInt:v6];
    v44[0] = v13;
    v43[1] = *MEMORY[0x1E4F24E10];
    v14 = [NSNumber numberWithDouble:width];
    v44[1] = v14;
    v43[2] = *MEMORY[0x1E4F24D08];
    v15 = [NSNumber numberWithDouble:height];
    uint64_t v16 = *MEMORY[0x1E4F24D20];
    v44[2] = v15;
    v44[3] = MEMORY[0x1E4F1CC08];
    uint64_t v17 = *MEMORY[0x1E4F24C98];
    v43[3] = v16;
    v43[4] = v17;
    v44[4] = &unk_1EF11A4F0;
    CFDictionaryRef v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:5];

    uint64_t v19 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v18, &poolOut);
    if (v19)
    {
      __int16 v20 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110656;
        int v30 = (int)width;
        __int16 v31 = 1024;
        int v32 = (int)height;
        __int16 v33 = 1024;
        unsigned int v34 = BYTE3(v6);
        __int16 v35 = 1024;
        int v36 = BYTE2(v6);
        __int16 v37 = 1024;
        int v38 = BYTE1(v6);
        __int16 v39 = 1024;
        int v40 = v6;
        __int16 v41 = 1024;
        int v42 = v19;
        _os_log_error_impl(&dword_19E58B000, v20, OS_LOG_TYPE_ERROR, "Faield to create a CVPixelBufferPool for frame size %d x %d with pixel format type %c%c%c%c because CVPixelBufferPoolCreate returned %d.", buf, 0x2Cu);
      }

      if (!a5) {
        goto LABEL_9;
      }
      int v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      __int16 v22 = objc_msgSend(NSString, "stringWithFormat:", @"Faield to create a CVPixelBufferPool for frame size %d x %d with pixel format type %c%c%c%c because CVPixelBufferPoolCreate returned %d.", (int)width, (int)height, BYTE3(v6), BYTE2(v6), BYTE1(v6), v6, v19);
      __int16 v28 = v22;
      unsigned int v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      *a5 = [v21 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v23];
    }
    else
    {
      __int16 v22 = poolOut;
      [v10 setObject:poolOut forKeyedSubscript:v11];
    }

LABEL_9:
  }
  os_unfair_lock_unlock(p_cacheLock);
  __int16 v24 = poolOut;

  return v24;
}

@end