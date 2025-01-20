@interface MLOutputBackingsVerifier
- (BOOL)_verifyMultiArrayOutputBacking:(id)a3 forFeature:(id)a4 error:(id *)a5;
- (BOOL)_verifyOutputBacking:(id)a3 forFeature:(id)a4 error:(id *)a5;
- (BOOL)_verifyPixelBufferOutputBacking:(__CVBuffer *)a3 forFeature:(id)a4 error:(id *)a5;
- (BOOL)verifyOutputBackings:(id)a3 predictionUsesBatch:(BOOL)a4 error:(id *)a5;
- (MLOutputBackingsVerifier)initWithOutputDescriptions:(id)a3;
- (NSDictionary)outputDescriptions;
@end

@implementation MLOutputBackingsVerifier

- (MLOutputBackingsVerifier)initWithOutputDescriptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLOutputBackingsVerifier;
  v6 = [(MLOutputBackingsVerifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_outputDescriptions, a3);
  }

  return v7;
}

- (BOOL)verifyOutputBackings:(id)a3 predictionUsesBatch:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v6) {
    goto LABEL_9;
  }
  if (!dyld_program_sdk_at_least())
  {
    LOBYTE(a5) = 1;
    goto LABEL_20;
  }
  if (![v8 count])
  {
LABEL_9:
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v8;
    uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (!v13)
    {
LABEL_17:
      LOBYTE(a5) = 1;
      goto LABEL_18;
    }
    uint64_t v14 = *(void *)v22;
LABEL_11:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * v15);
      uint64_t v17 = [(MLOutputBackingsVerifier *)self outputDescriptions];
      v18 = [(id)v17 objectForKeyedSubscript:v16];

      v19 = [v11 objectForKeyedSubscript:v16];
      LOBYTE(v17) = [(MLOutputBackingsVerifier *)self _verifyOutputBacking:v19 forFeature:v18 error:a5];

      if ((v17 & 1) == 0) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v13) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_8:
    LOBYTE(a5) = 0;
LABEL_18:

    goto LABEL_20;
  }
  objc_super v9 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19E58B000, v9, OS_LOG_TYPE_ERROR, "The output backing is not supported in a batch prediction.", buf, 2u);
  }

  if (a5)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    id v11 = [NSString stringWithFormat:@"The output backing is not supported in a batch prediction."];
    v28[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    *a5 = [v10 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v12];

    goto LABEL_8;
  }
LABEL_20:

  return (char)a5;
}

- (void).cxx_destruct
{
}

- (NSDictionary)outputDescriptions
{
  return self->_outputDescriptions;
}

- (BOOL)_verifyPixelBufferOutputBacking:(__CVBuffer *)a3 forFeature:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = [v7 imageConstraint];
  if (v8)
  {
    if (CVPixelBufferGetPixelFormatType(a3) == 32
      && ([v8 pixelType] == 20 || objc_msgSend(v8, "pixelType") == 30))
    {
      objc_super v9 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        long long v22 = +[MLImageConstraint stringForImagePixelType:](MLImageConstraint, "stringForImagePixelType:", [v8 pixelType]);
        *(_DWORD *)buf = 138412290;
        v29 = v22;
        _os_log_error_impl(&dword_19E58B000, v9, OS_LOG_TYPE_ERROR, "%@ image output feature must use a pixel buffer of kCVPixelFormatType_32BGRA as the output backing, but kCVPixelFormatType_32ARGB pixel buffer was specified.", buf, 0xCu);
      }
      if (a5)
      {
        v10 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v24 = *MEMORY[0x1E4F28568];
        id v11 = NSString;
        v12 = +[MLImageConstraint stringForImagePixelType:](MLImageConstraint, "stringForImagePixelType:", [v8 pixelType]);
        uint64_t v13 = [v11 stringWithFormat:@"%@ image output feature must use a pixel buffer of kCVPixelFormatType_32BGRA as the output backing, but kCVPixelFormatType_32ARGB pixel buffer was specified.", v12];
        v25 = v13;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        *a5 = [v10 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v14];

LABEL_17:
        LOBYTE(a5) = 0;
      }
    }
    else
    {
      if (([v8 allowsPixelBuffer:a3 error:a5] & 1) == 0)
      {
        v12 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          long long v23 = [v7 name];
          *(_DWORD *)buf = 138412290;
          v29 = v23;
          _os_log_error_impl(&dword_19E58B000, v12, OS_LOG_TYPE_ERROR, "Output backing for %@ is not compatible with the model's output feature description.", buf, 0xCu);
        }
        goto LABEL_17;
      }
      LOBYTE(a5) = 1;
    }
  }
  else
  {
    uint64_t v15 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v21 = [v7 name];
      *(_DWORD *)buf = 138412290;
      v29 = v21;
      _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "Output feature %@ doesn't have a description for the image constraints.", buf, 0xCu);
    }
    if (a5)
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      uint64_t v17 = NSString;
      v12 = [v7 name];
      v18 = [v17 stringWithFormat:@"Output feature %@ doesn't have a description for the image constraints.", v12];
      uint64_t v27 = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      *a5 = [v16 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v19];

      goto LABEL_17;
    }
  }

  return (char)a5;
}

- (BOOL)_verifyMultiArrayOutputBacking:(id)a3 forFeature:(id)a4 error:(id *)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [v8 multiArrayConstraint];
  if (v9)
  {
    v10 = [v7 shape];
    char v11 = [v9 isAllowedShape:v10 error:a5];

    if ((v11 & 1) == 0)
    {
      uint64_t v16 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = [v8 name];
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = (uint64_t)v26;
        _os_log_error_impl(&dword_19E58B000, v16, OS_LOG_TYPE_ERROR, "Output backing for %@ is not compatible with the model's output feature description.", buf, 0xCu);
      }
      goto LABEL_15;
    }
    uint64_t v12 = [v7 pixelBuffer];
    if (!v12 || ![v7 backingPixelBufferWasLocked])
    {
      LOBYTE(a5) = 1;
      goto LABEL_17;
    }
    uint64_t v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = [v8 name];
      *(_DWORD *)buf = 134218242;
      uint64_t v31 = v12;
      __int16 v32 = 2112;
      v33 = v27;
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "The underlying pixel buffer (%p) used in the output backing MLMultiArray object for feature %@ has been locked. The output backing cannot use such an object. Typically, the error occurs when the caller has invoked MLMultiArray's data accessing properties before the inference, or they used a locked pixel buffer to initialize the multi array. Use a newly created pixel buffer and MLMultiArray to avoid this error.", buf, 0x16u);
    }
    if (a5)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F28568];
      uint64_t v15 = NSString;
      uint64_t v16 = [v8 name];
      uint64_t v17 = [v15 stringWithFormat:@"The underlying pixel buffer (%p) used in the output backing MLMultiArray object for feature %@ has been locked. The output backing cannot use such an object. Typically, the error occurs when the caller has invoked MLMultiArray's data accessing properties before the inference, or they used a locked pixel buffer to initialize the multi array. Use a newly created pixel buffer and MLMultiArray to avoid this error.", v12, v16];
      v29 = v17;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      *a5 = [v14 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v18];

LABEL_15:
      LOBYTE(a5) = 0;
    }
  }
  else
  {
    v19 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v25 = [v8 name];
      *(_DWORD *)buf = 138412290;
      uint64_t v31 = (uint64_t)v25;
      _os_log_error_impl(&dword_19E58B000, v19, OS_LOG_TYPE_ERROR, "Output feature %@ doesn't support output backing because it doesn't have a MultiArray constraints.", buf, 0xCu);
    }
    if (a5)
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      long long v21 = NSString;
      uint64_t v16 = [v8 name];
      long long v22 = [v21 stringWithFormat:@"Output feature %@ doesn't support output backing because it doesn't have a MultiArray constraints.", v16];
      v35[0] = v22;
      long long v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      *a5 = [v20 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v23];

      goto LABEL_15;
    }
  }
LABEL_17:

  return (char)a5;
}

- (BOOL)_verifyOutputBacking:(id)a3 forFeature:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v10 = [(MLOutputBackingsVerifier *)self _verifyMultiArrayOutputBacking:v8 forFeature:v9 error:a5];
LABEL_3:
    LOBYTE(a5) = v10;
    goto LABEL_13;
  }
  CFTypeID v11 = CFGetTypeID(v8);
  if (v11 == CVPixelBufferGetTypeID())
  {
    if (dyld_program_sdk_at_least())
    {
      BOOL v10 = [(MLOutputBackingsVerifier *)self _verifyPixelBufferOutputBacking:v8 forFeature:v9 error:a5];
      goto LABEL_3;
    }
LABEL_12:
    LOBYTE(a5) = 1;
    goto LABEL_13;
  }
  if (!dyld_program_sdk_at_least()) {
    goto LABEL_12;
  }
  uint64_t v12 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v19 = [v9 name];
    *(_DWORD *)buf = 138412290;
    long long v23 = v19;
    _os_log_error_impl(&dword_19E58B000, v12, OS_LOG_TYPE_ERROR, "The output backing object for %@ must be either CVPixelBuffer or MLMultiArray.", buf, 0xCu);
  }
  if (a5)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    uint64_t v14 = NSString;
    uint64_t v15 = [v9 name];
    uint64_t v16 = [v14 stringWithFormat:@"The output backing object for %@ must be either CVPixelBuffer or MLMultiArray.", v15];
    long long v21 = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    *a5 = [v13 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v17];

    LOBYTE(a5) = 0;
  }
LABEL_13:

  return (char)a5;
}

@end