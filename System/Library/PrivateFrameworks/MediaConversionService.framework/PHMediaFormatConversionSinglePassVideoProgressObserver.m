@interface PHMediaFormatConversionSinglePassVideoProgressObserver
- (NSFileHandle)observedFileHandle;
- (NSProgress)progress;
- (NSURL)observedFileURL;
- (PHMediaFormatConversionRequest)request;
- (unint64_t)lastFileSize;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setLastFileSize:(unint64_t)a3;
- (void)setObservedFileHandle:(id)a3;
- (void)setObservedFileURL:(id)a3;
- (void)setProgress:(id)a3;
- (void)setRequest:(id)a3;
- (void)startObservingProgress:(id)a3 forRequest:(id)a4;
- (void)stopObserving;
@end

@implementation PHMediaFormatConversionSinglePassVideoProgressObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedFileHandle, 0);
  objc_storeStrong((id *)&self->_observedFileURL, 0);
  objc_destroyWeak((id *)&self->_request);
  objc_destroyWeak((id *)&self->_progress);
}

- (void)setLastFileSize:(unint64_t)a3
{
  self->_lastFileSize = a3;
}

- (unint64_t)lastFileSize
{
  return self->_lastFileSize;
}

- (void)setObservedFileHandle:(id)a3
{
}

- (NSFileHandle)observedFileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObservedFileURL:(id)a3
{
}

- (NSURL)observedFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRequest:(id)a3
{
}

- (PHMediaFormatConversionRequest)request
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  return (PHMediaFormatConversionRequest *)WeakRetained;
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progress);
  return (NSProgress *)WeakRetained;
}

- (void)stopObserving
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progress);
  [WeakRetained removeObserver:self forKeyPath:@"fractionCompleted" context:&PHMediaFormatConversionSinglePassVideoProgressObserverContext];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a6 == &PHMediaFormatConversionSinglePassVideoProgressObserverContext)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
    if (!WeakRetained)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        observedFileURL = self->_observedFileURL;
        *(_DWORD *)buf = 138412290;
        v22 = observedFileURL;
        _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Ignoring progress update for deallocated request for URL %@", buf, 0xCu);
      }
      [(PHMediaFormatConversionSinglePassVideoProgressObserver *)self stopObserving];
      goto LABEL_18;
    }
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    observedFileHandle = self->_observedFileHandle;
    if (!observedFileHandle)
    {
      v12 = [(NSURL *)self->_observedFileURL path];
      char v13 = [v8 fileExistsAtPath:v12];

      if ((v13 & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          v18 = [(NSURL *)self->_observedFileURL path];
          *(_DWORD *)buf = 138412290;
          v22 = v18;
          _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Ignoring progress update for output file %@ that doesn't exist", buf, 0xCu);
        }
        goto LABEL_17;
      }
      v14 = self->_observedFileURL;
      id v20 = 0;
      v15 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:v14 error:&v20];
      id v16 = v20;
      if (!v15)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v19 = [(NSURL *)self->_observedFileURL path];
          *(_DWORD *)buf = 138412546;
          v22 = v19;
          __int16 v23 = 2112;
          id v24 = v16;
          _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to open file handle for output file %@: %@", buf, 0x16u);
        }
        goto LABEL_17;
      }
      v17 = self->_observedFileHandle;
      self->_observedFileHandle = v15;

      observedFileHandle = self->_observedFileHandle;
    }
    unint64_t v10 = [(NSFileHandle *)observedFileHandle seekToEndOfFile];
    if (v10 != self->_lastFileSize)
    {
      self->_lastFileSize = v10;
      objc_msgSend(WeakRetained, "updateSinglePassVideoConversionStatus:addedRange:error:", 2);
    }
LABEL_17:

LABEL_18:
  }
}

- (void)startObservingProgress:(id)a3 forRequest:(id)a4
{
  id obj = a3;
  id v7 = a4;
  if (obj)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PHMediaFormatConversionSinglePassVideoProgressObserver.m", 22, @"Invalid parameter not satisfying: %@", @"progress" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PHMediaFormatConversionSinglePassVideoProgressObserver.m", 23, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

LABEL_3:
  v8 = [v7 singlePassVideoConversionUpdateHandler];

  if (!v8)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PHMediaFormatConversionSinglePassVideoProgressObserver.m", 24, @"Invalid parameter not satisfying: %@", @"request.singlePassVideoConversionUpdateHandler" object file lineNumber description];
  }
  v9 = [v7 destination];
  unint64_t v10 = [v9 fileURL];

  if (!v10)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PHMediaFormatConversionSinglePassVideoProgressObserver.m", 25, @"Invalid parameter not satisfying: %@", @"request.destination.fileURL" object file lineNumber description];
  }
  objc_storeWeak((id *)&self->_progress, obj);
  objc_storeWeak((id *)&self->_request, v7);
  v11 = [v7 destination];
  v12 = [v11 fileURL];
  observedFileURL = self->_observedFileURL;
  self->_observedFileURL = v12;

  [obj addObserver:self forKeyPath:@"fractionCompleted" options:0 context:&PHMediaFormatConversionSinglePassVideoProgressObserverContext];
}

@end