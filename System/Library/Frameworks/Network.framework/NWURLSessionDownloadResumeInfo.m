@interface NWURLSessionDownloadResumeInfo
+ (BOOL)supportsSecureCoding;
+ (NWURLSessionDownloadResumeInfo)infoWithTask:(uint64_t)a1;
+ (void)infoWithResumeData:(uint64_t)a1;
- (NWURLSessionDownloadResumeInfo)initWithCoder:(id)a3;
- (id)serialize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NWURLSessionDownloadResumeInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseConsumerResumeInfo, 0);
  objc_storeStrong((id *)&self->_taskDescription, 0);
  objc_storeStrong((id *)&self->_earliestBeginDate, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);

  objc_storeStrong((id *)&self->_originalRequest, 0);
}

- (NWURLSessionDownloadResumeInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NWURLSessionDownloadResumeInfo;
  v5 = [(NWURLSessionDownloadResumeInfo *)&v24 init];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalRequest"];
  if (!v6)
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    v7 = (id)gurlLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1830D4000, v7, OS_LOG_TYPE_ERROR, "Cannot init download resume info without original request", v23, 2u);
    }
    goto LABEL_15;
  }
  v7 = v6;
  objc_storeStrong((id *)&v5->_originalRequest, v6);
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentRequest"];
  if (!v8)
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    v21 = (id)gurlLogObj;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1830D4000, v21, OS_LOG_TYPE_ERROR, "Cannot init download resume info without current request", v23, 2u);
    }

LABEL_15:
    v20 = 0;
    goto LABEL_16;
  }
  currentRequest = v5->_currentRequest;
  v5->_currentRequest = v8;
  v10 = v8;

  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"response"];
  response = v5->_response;
  v5->_response = (NSHTTPURLResponse *)v11;

  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"earliestBeginDate"];
  earliestBeginDate = v5->_earliestBeginDate;
  v5->_earliestBeginDate = (NSDate *)v13;

  v5->_countOfBytesClientExpectsToSend = [v4 decodeInt64ForKey:@"countOfBytesClientExpectsToSend"];
  v5->_countOfBytesClientExpectsToReceive = [v4 decodeInt64ForKey:@"countOfBytesClientExpectsToReceive"];
  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"taskDescription"];
  taskDescription = v5->_taskDescription;
  v5->_taskDescription = (NSString *)v15;

  [v4 decodeFloatForKey:@"priority"];
  v5->_priority = v17;
  v5->_prefersIncrementalDelivery = [v4 decodeBoolForKey:@"prefersIncrementalDelivery"];
  v5->__keepDownloadTaskFile = [v4 decodeBoolForKey:@"_keepDownloadTaskFile"];
  uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"responseConsumerResumeInfo"];
  responseConsumerResumeInfo = v5->_responseConsumerResumeInfo;
  v5->_responseConsumerResumeInfo = (NWURLSessionResponseConsumerResumeInfo *)v18;

LABEL_5:
  v20 = v5;
LABEL_16:

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (self)
  {
    [v6 encodeObject:self->_originalRequest forKey:@"originalRequest"];
    [v6 encodeObject:self->_currentRequest forKey:@"currentRequest"];
    [v6 encodeObject:self->_response forKey:@"response"];
    [v6 encodeObject:self->_earliestBeginDate forKey:@"earliestBeginDate"];
    [v6 encodeInt64:self->_countOfBytesClientExpectsToSend forKey:@"countOfBytesClientExpectsToSend"];
    [v6 encodeInt64:self->_countOfBytesClientExpectsToReceive forKey:@"countOfBytesClientExpectsToReceive"];
    [v6 encodeObject:self->_taskDescription forKey:@"taskDescription"];
    *(float *)&double v4 = self->_priority;
    [v6 encodeFloat:@"priority" forKey:v4];
    [v6 encodeBool:self->_prefersIncrementalDelivery forKey:@"prefersIncrementalDelivery"];
    [v6 encodeBool:self->__keepDownloadTaskFile forKey:@"_keepDownloadTaskFile"];
    responseConsumerResumeInfo = self->_responseConsumerResumeInfo;
  }
  else
  {
    [v6 encodeObject:0 forKey:@"originalRequest"];
    [v6 encodeObject:0 forKey:@"currentRequest"];
    [v6 encodeObject:0 forKey:@"response"];
    [v6 encodeObject:0 forKey:@"earliestBeginDate"];
    [v6 encodeInt64:0 forKey:@"countOfBytesClientExpectsToSend"];
    [v6 encodeInt64:0 forKey:@"countOfBytesClientExpectsToReceive"];
    [v6 encodeObject:0 forKey:@"taskDescription"];
    [v6 encodeFloat:@"priority" forKey:0.0];
    [v6 encodeBool:0 forKey:@"prefersIncrementalDelivery"];
    [v6 encodeBool:0 forKey:@"_keepDownloadTaskFile"];
    responseConsumerResumeInfo = 0;
  }
  [v6 encodeObject:responseConsumerResumeInfo forKey:@"responseConsumerResumeInfo"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NWURLSessionDownloadResumeInfo)infoWithTask:(uint64_t)a1
{
  v2 = a2;
  self;
  v3 = objc_alloc_init(NWURLSessionDownloadResumeInfo);
  double v4 = [v2 originalRequest];
  if (v3) {
    objc_storeStrong((id *)&v3->_originalRequest, v4);
  }

  v5 = [v2 currentRequest];
  if (v3) {
    objc_storeStrong((id *)&v3->_currentRequest, v5);
  }

  id v6 = [v2 response];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [v2 response];
    if (v3) {
      objc_storeStrong((id *)&v3->_response, v8);
    }
  }
  v9 = [v2 earliestBeginDate];
  if (v3)
  {
    earliestBeginDate = v3->_earliestBeginDate;
    v3->_earliestBeginDate = v9;

    v3->_countOfBytesClientExpectsToSend = [v2 countOfBytesClientExpectsToSend];
    v3->_countOfBytesClientExpectsToReceive = [v2 countOfBytesExpectedToReceive];
    uint64_t v11 = [v2 taskDescription];
    taskDescription = v3->_taskDescription;
    v3->_taskDescription = (NSString *)v11;

    [v2 priority];
    v3->_priority = v13;
    v3->_prefersIncrementalDelivery = [v2 prefersIncrementalDelivery];
    v3->__keepDownloadTaskFile = [v2 _keepDownloadTaskFile];
  }
  else
  {

    [v2 countOfBytesClientExpectsToSend];
    [v2 countOfBytesExpectedToReceive];
    [v2 taskDescription];

    [v2 priority];
    [v2 prefersIncrementalDelivery];
    [v2 _keepDownloadTaskFile];
  }
  id v14 = v2[53];
  uint64_t v15 = [v14 createResumeInfo];
  if (v3) {
    objc_storeStrong((id *)&v3->_responseConsumerResumeInfo, v15);
  }

  return v3;
}

+ (void)infoWithResumeData:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  self;
  if (v2)
  {
    if (isWebKitNetworking_onceToken[0] != -1) {
      dispatch_once(isWebKitNetworking_onceToken, &__block_literal_global_202);
    }
    if (isWebKitNetworking_result != 1)
    {
      id v6 = 0;
      goto LABEL_15;
    }
    id v28 = 0;
    v3 = [MEMORY[0x1E4F28F98] propertyListWithData:v2 options:0 format:0 error:&v28];
    double v4 = v28;
    v5 = [v3 objectForKeyedSubscript:@"$archiver"];

    if (v5)
    {
      id v6 = [v3 objectForKeyedSubscript:@"NSURLSessionResumeInfoLocalPath"];
      v27 = v4;
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v2 error:&v27];
      v8 = v27;

      v9 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
      uint64_t v13 = [v7 decodeObjectOfClasses:v12 forKey:@"NSKeyedArchiveRootObjectKey"];

      [v7 finishDecoding];
      if (v13)
      {
        v3 = v13;
        if (v6) {
          goto LABEL_41;
        }
        goto LABEL_40;
      }
      double v4 = v8;
    }
    else
    {
      if (v3)
      {
        v8 = v4;
LABEL_40:
        id v6 = [v3 objectForKeyedSubscript:@"NSURLSessionResumeInfoLocalPath"];
        if (!v6)
        {
LABEL_42:
          uint64_t v22 = [v3 objectForKeyedSubscript:@"data"];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (__nwlog_url_log::onceToken != -1) {
              dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
            }
            objc_super v24 = (id)gurlLogObj;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1830D4000, v24, OS_LOG_TYPE_ERROR, "URLSessionDownloadTask: resume data has no data", buf, 2u);
            }

            id v14 = 0;
            v2 = v22;
            goto LABEL_61;
          }

          v2 = v22;
LABEL_15:
          v8 = [v2 mutableCopy];
          uint64_t v15 = (unsigned char *)[v8 mutableBytes];
          if ([v8 length])
          {
            *v15 ^= 0x54u;
            if ((unint64_t)[v8 length] >= 2)
            {
              v15[1] ^= 0x65u;
              if ((unint64_t)[v8 length] >= 3)
              {
                v15[2] ^= 0x64u;
                if ((unint64_t)[v8 length] >= 4)
                {
                  v15[3] ^= 0x4Cu;
                  if ((unint64_t)[v8 length] >= 5)
                  {
                    v15[4] ^= 0x61u;
                    if ((unint64_t)[v8 length] >= 6)
                    {
                      v15[5] ^= 0x73u;
                      if ((unint64_t)[v8 length] >= 7)
                      {
                        v15[6] ^= 0x73u;
                        if ((unint64_t)[v8 length] >= 8) {
                          v15[7] ^= 0x6Fu;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          id v26 = 0;
          id v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v26];
          v3 = v26;
          if (v14)
          {
            if (v6)
            {
              v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
              uint64_t v17 = v14[9];
              if (v17) {
                objc_storeStrong((id *)(v17 + 8), v16);
              }

              uint64_t v18 = v14[9];
              if (v18)
              {
                v19 = *(void **)(v18 + 16);
                *(void *)(v18 + 16) = 0;
              }
            }
            v20 = v14;
          }
          else
          {
            if (__nwlog_url_log::onceToken != -1) {
              dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
            }
            v21 = (id)gurlLogObj;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v30 = v3;
              _os_log_impl(&dword_1830D4000, v21, OS_LOG_TYPE_ERROR, "URLSessionDownloadTask: resume data unarchiver returned nil, error: %@", buf, 0xCu);
            }
          }
LABEL_61:

          goto LABEL_62;
        }
LABEL_41:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (__nwlog_url_log::onceToken != -1) {
            dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
          }
          v23 = (id)gurlLogObj;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1830D4000, v23, OS_LOG_TYPE_ERROR, "URLSessionDownloadTask: resume data local path is not string", buf, 2u);
          }

          id v14 = 0;
          goto LABEL_61;
        }
        goto LABEL_42;
      }
      id v6 = 0;
    }
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    v3 = (id)gurlLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v4;
      _os_log_impl(&dword_1830D4000, v3, OS_LOG_TYPE_ERROR, "URLSessionDownloadTask: resume data deserialization returned nil, error: %@", buf, 0xCu);
    }
    id v14 = 0;
    v8 = v4;
    goto LABEL_61;
  }
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  v2 = (id)gurlLogObj;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1830D4000, v2, OS_LOG_TYPE_ERROR, "URLSessionDownloadTask: cannot init with nil resume data", buf, 2u);
  }
  id v14 = 0;
LABEL_62:

  return v14;
}

- (id)serialize
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v16 = 0;
    v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v16];
    id v3 = v16;
    double v4 = (void *)[v2 mutableCopy];

    if (v4)
    {
      v5 = (unsigned char *)[v4 mutableBytes];
      if ([v4 length])
      {
        *v5 ^= 0x54u;
        if ((unint64_t)[v4 length] >= 2)
        {
          v5[1] ^= 0x65u;
          if ((unint64_t)[v4 length] >= 3)
          {
            v5[2] ^= 0x64u;
            if ((unint64_t)[v4 length] >= 4)
            {
              v5[3] ^= 0x4Cu;
              if ((unint64_t)[v4 length] >= 5)
              {
                v5[4] ^= 0x61u;
                if ((unint64_t)[v4 length] >= 6)
                {
                  v5[5] ^= 0x73u;
                  if ((unint64_t)[v4 length] >= 7)
                  {
                    v5[6] ^= 0x73u;
                    if ((unint64_t)[v4 length] >= 8) {
                      v5[7] ^= 0x6Fu;
                    }
                  }
                }
              }
            }
          }
        }
      }
      id v6 = (void *)[v4 copy];
      if (isWebKitNetworking_onceToken[0] != -1) {
        dispatch_once(isWebKitNetworking_onceToken, &__block_literal_global_202);
      }
      if ((isWebKitNetworking_result & 1) == 0) {
        goto LABEL_24;
      }
      v7 = (void *)MEMORY[0x1E4F1C9E8];
      v8 = *(void **)(a1 + 72);
      if (v8) {
        v9 = (void *)v8[1];
      }
      else {
        v9 = 0;
      }
      uint64_t v10 = v8;
      uint64_t v11 = [v9 path];
      v12 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v6, @"data", v11, @"NSURLSessionResumeInfoLocalPath", 0);

      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
      [v13 encodeObject:v12 forKey:@"NSKeyedArchiveRootObjectKey"];
      uint64_t v14 = [v13 encodedData];

      id v6 = (void *)v14;
    }
    else
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      v12 = (id)gurlLogObj;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v3;
        _os_log_impl(&dword_1830D4000, v12, OS_LOG_TYPE_ERROR, "URLSessionDownloadTask: resume data archiver returned nil, error: %@", buf, 0xCu);
      }
      id v6 = 0;
    }

LABEL_24:
    goto LABEL_25;
  }
  id v6 = 0;
LABEL_25:

  return v6;
}

@end