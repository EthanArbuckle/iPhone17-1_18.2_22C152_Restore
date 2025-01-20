@interface CoreDAVCopyOrMoveTask
+ (id)stringFromOverwriteValue:(int)a3;
- (CoreDAVCopyOrMoveTask)initWithSourceURL:(id)a3 destinationURL:(id)a4;
- (CoreDAVCopyOrMoveTask)initWithSourceURL:(id)a3 destinationURL:(id)a4 andOverwrite:(int)a5;
- (CoreDAVCopyOrMoveTask)initWithURL:(id)a3;
- (NSURL)destinationURL;
- (NSURL)priorOrderedURL;
- (id)additionalHeaderValues;
- (id)description;
- (id)requestBody;
- (int)overwrite;
- (void)_callBackToDelegateWithResponses:(id)a3 error:(id)a4;
- (void)finishCoreDAVTaskWithError:(id)a3;
- (void)setDestinationURL:(id)a3;
- (void)setOverwrite:(int)a3;
- (void)setPriorOrderedURL:(id)a3;
@end

@implementation CoreDAVCopyOrMoveTask

- (CoreDAVCopyOrMoveTask)initWithURL:(id)a3
{
}

- (CoreDAVCopyOrMoveTask)initWithSourceURL:(id)a3 destinationURL:(id)a4
{
  return [(CoreDAVCopyOrMoveTask *)self initWithSourceURL:a3 destinationURL:a4 andOverwrite:0];
}

- (CoreDAVCopyOrMoveTask)initWithSourceURL:(id)a3 destinationURL:(id)a4 andOverwrite:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8
    || (v10 = v9,
        [v8 CDVRawPath],
        v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 length],
        v11,
        !v12))
  {
    v18 = (void *)MEMORY[0x263EFF940];
    uint64_t v19 = *MEMORY[0x263EFF4A0];
    v20 = @"Non-nil and non-zero length sourceURL required.";
    goto LABEL_12;
  }
  if (!v10
    || ([v10 CDVRawPath],
        v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 length],
        v13,
        !v14))
  {
    v18 = (void *)MEMORY[0x263EFF940];
    uint64_t v19 = *MEMORY[0x263EFF4A0];
    v20 = @"Non-nil and non-zero length destinationURL required.";
    goto LABEL_12;
  }
  if ([v8 isEqual:v10])
  {
    v18 = (void *)MEMORY[0x263EFF940];
    uint64_t v19 = *MEMORY[0x263EFF4A0];
    v20 = @"The value for sourceURL and the value for destinationURL must not be the same.";
LABEL_12:
    id v21 = [v18 exceptionWithName:v19 reason:v20 userInfo:0];
    objc_exception_throw(v21);
  }
  v22.receiver = self;
  v22.super_class = (Class)CoreDAVCopyOrMoveTask;
  v15 = [(CoreDAVTask *)&v22 initWithURL:v8];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_destinationURL, a4);
    *(&v16->_overwrite + 1) = a5;
  }

  return v16;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v11.receiver = self;
  v11.super_class = (Class)CoreDAVCopyOrMoveTask;
  v4 = [(CoreDAVTask *)&v11 description];
  [v3 appendFormat:@"[%@ ", v4];

  v5 = [(CoreDAVTask *)self url];
  v6 = [v5 absoluteString];
  [v3 appendFormat:@"| Source URL: [%@]", v6];

  v7 = [(CoreDAVCopyOrMoveTask *)self destinationURL];
  id v8 = [v7 absoluteString];
  [v3 appendFormat:@"| Destination URL: [%@]", v8];

  id v9 = objc_msgSend((id)objc_opt_class(), "stringFromOverwriteValue:", -[CoreDAVCopyOrMoveTask overwrite](self, "overwrite"));
  [v3 appendFormat:@"| Overwrite: [%@]", v9];

  [v3 appendFormat:@"]"];
  return v3;
}

- (id)requestBody
{
  return 0;
}

- (id)additionalHeaderValues
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v14.receiver = self;
  v14.super_class = (Class)CoreDAVCopyOrMoveTask;
  v4 = [(CoreDAVTask *)&v14 additionalHeaderValues];
  [v3 addEntriesFromDictionary:v4];

  v5 = [(CoreDAVCopyOrMoveTask *)self destinationURL];
  v6 = [v5 absoluteString];

  if (v6) {
    [v3 setObject:v6 forKey:@"Destination"];
  }
  int v7 = [(CoreDAVCopyOrMoveTask *)self overwrite];
  if (v7 == 1)
  {
    id v8 = @"T";
  }
  else
  {
    if (v7 != 2) {
      goto LABEL_8;
    }
    id v8 = @"F";
  }
  [v3 setObject:v8 forKey:@"Overwrite"];
LABEL_8:
  if (self->_shouldSendOrder)
  {
    id v9 = [(NSURL *)self->_priorOrderedURL CDVRawLastPathComponent];
    if ([v9 length])
    {
      v10 = NSString;
      objc_super v11 = CDVRelativeOrderHeaderString();
      uint64_t v12 = [v10 stringWithFormat:@"%@%@", v11, v9];

      [v3 setObject:v12 forKey:@"Position"];
    }
  }
  return v3;
}

- (void)setPriorOrderedURL:(id)a3
{
  p_priorOrderedURL = &self->_priorOrderedURL;
  objc_storeStrong((id *)&self->_priorOrderedURL, a3);
  if (*p_priorOrderedURL) {
    self->_shouldSendOrder = 1;
  }
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 code];
    int v7 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    id v9 = [v7 logHandleForAccountInfoProvider:WeakRetained];

    if (v6 == 1)
    {
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v26 = (id)objc_opt_class();
          id v11 = v26;
          uint64_t v12 = "%{public}@ cancelled";
          v13 = v10;
          os_log_type_t v14 = OS_LOG_TYPE_INFO;
          uint32_t v15 = 12;
LABEL_11:
          _os_log_impl(&dword_213BFC000, v13, v14, v12, buf, v15);

          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    else if (v9)
    {
      objc_super v22 = v9;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v26 = (id)objc_opt_class();
        __int16 v27 = 2112;
        v28 = v5;
        id v11 = v26;
        uint64_t v12 = "%{public}@ failed: %@";
        v13 = v22;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        uint32_t v15 = 22;
        goto LABEL_11;
      }
LABEL_12:
    }
    id v23 = v5;
    goto LABEL_14;
  }
  v16 = [(CoreDAVTask *)self responseBodyParser];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_14:
    id v21 = 0;
    goto LABEL_15;
  }
  v18 = [(CoreDAVTask *)self responseBodyParser];
  uint64_t v19 = [v18 rootElement];
  v20 = [v19 responses];
  id v21 = [v20 allObjects];

LABEL_15:
  self->super._numDownloadedElements = [v21 count];
  [(CoreDAVCopyOrMoveTask *)self _callBackToDelegateWithResponses:v21 error:v5];
  v24.receiver = self;
  v24.super_class = (Class)CoreDAVCopyOrMoveTask;
  [(CoreDAVTask *)&v24 finishCoreDAVTaskWithError:v5];
}

- (void)_callBackToDelegateWithResponses:(id)a3 error:(id)a4
{
}

+ (id)stringFromOverwriteValue:(int)a3
{
  if (a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_2641E0150[a3];
  }
}

- (int)overwrite
{
  return *(&self->_overwrite + 1);
}

- (void)setOverwrite:(int)a3
{
  *(&self->_overwrite + 1) = a3;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void)setDestinationURL:(id)a3
{
}

- (NSURL)priorOrderedURL
{
  return self->_priorOrderedURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorOrderedURL, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
}

@end