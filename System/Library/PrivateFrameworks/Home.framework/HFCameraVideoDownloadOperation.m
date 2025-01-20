@interface HFCameraVideoDownloadOperation
+ (id)downloadOperationForClip:(id)a3;
- (BOOL)fileAlreadyExists;
- (HFCameraAnalyticsCameraTimelapseLoadEvent)timelapseLoadEvent;
- (HFCameraVideoDownloadOperation)init;
- (HFCameraVideoDownloaderDelegate)delegate;
- (HMCameraClip)clip;
- (NSURL)destinationURL;
- (id)description;
- (id)downloadBlock;
- (void)fileDownloadFailedWithError:(id)a3;
- (void)fileDownloadFinishedWithElapsedTime:(double)a3;
- (void)fileDownloadNotNeeded;
- (void)fileDownloadProgress:(unint64_t)a3;
- (void)setClip:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinationURL:(id)a3;
- (void)setDownloadBlock:(id)a3;
- (void)setFileAlreadyExists:(BOOL)a3;
- (void)setTimelapseLoadEvent:(id)a3;
@end

@implementation HFCameraVideoDownloadOperation

- (HFCameraVideoDownloadOperation)init
{
  v5.receiver = self;
  v5.super_class = (Class)HFCameraVideoDownloadOperation;
  v2 = [(NSBlockOperation *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(HFCameraAnalyticsCameraTimelapseLoadEvent);
    [(HFCameraVideoDownloadOperation *)v2 setTimelapseLoadEvent:v3];
  }
  return v2;
}

- (BOOL)fileAlreadyExists
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(HFCameraVideoDownloadOperation *)self destinationURL];
  objc_super v5 = [v4 path];
  char v6 = [v3 fileExistsAtPath:v5];

  return v6;
}

+ (id)downloadOperationForClip:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setClip:v4];
  char v6 = +[HFCameraUtilities videoDestinationURLForCameraClip:v4];
  [v5 setDestinationURL:v6];

  objc_initWeak(&location, v5);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__HFCameraVideoDownloadOperation_downloadOperationForClip___block_invoke;
  v8[3] = &unk_26408E550;
  objc_copyWeak(&v9, &location);
  [v5 addExecutionBlock:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v5;
}

void __59__HFCameraVideoDownloadOperation_downloadOperationForClip___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained fileAlreadyExists])
  {
    [WeakRetained fileDownloadNotNeeded];
  }
  else
  {
    v1 = [WeakRetained downloadBlock];
    v1[2]();
  }
}

- (void)fileDownloadNotNeeded
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = HFLogForCategory(0x1DuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v13 = [(HFCameraVideoDownloadOperation *)self clip];
    v14 = objc_msgSend(v13, "hf_prettyDescription");
    int v15 = 136315394;
    v16 = "-[HFCameraVideoDownloadOperation fileDownloadNotNeeded]";
    __int16 v17 = 2112;
    v18 = v14;
    _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v15, 0x16u);
  }
  id v4 = [(HFCameraVideoDownloadOperation *)self clip];
  uint64_t v5 = [v4 quality];

  if (v5 == 1)
  {
    char v6 = [(HFCameraVideoDownloadOperation *)self timelapseLoadEvent];
    id v7 = (id)[v6 sendEventForState:1];
  }
  v8 = [(HFCameraVideoDownloadOperation *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(HFCameraVideoDownloadOperation *)self delegate];
    v11 = [(HFCameraVideoDownloadOperation *)self clip];
    v12 = [(HFCameraVideoDownloadOperation *)self destinationURL];
    [v10 foundVideoFileForClip:v11 atURL:v12];
  }
}

- (void)fileDownloadFailedWithError:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HFLogForCategory(0x1DuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v14 = [(HFCameraVideoDownloadOperation *)self clip];
    int v15 = objc_msgSend(v14, "hf_prettyDescription");
    int v16 = 136315650;
    __int16 v17 = "-[HFCameraVideoDownloadOperation fileDownloadFailedWithError:]";
    __int16 v18 = 2112;
    id v19 = v4;
    __int16 v20 = 2112;
    v21 = v15;
    _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "%s %@ fetching clip: %@", (uint8_t *)&v16, 0x20u);
  }
  char v6 = [(HFCameraVideoDownloadOperation *)self clip];
  uint64_t v7 = [v6 quality];

  if (v7 == 1)
  {
    v8 = [(HFCameraVideoDownloadOperation *)self timelapseLoadEvent];
    id v9 = (id)[v8 sendEventForState:0];
  }
  v10 = [(HFCameraVideoDownloadOperation *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(HFCameraVideoDownloadOperation *)self delegate];
    v13 = [(HFCameraVideoDownloadOperation *)self clip];
    [v12 failedToDownloadVideoFileForClip:v13];
  }
}

- (void)fileDownloadFinishedWithElapsedTime:(double)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v5 = HFLogForCategory(0x1DuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = [(HFCameraVideoDownloadOperation *)self clip];
    uint64_t v7 = objc_msgSend(v6, "hf_prettyDescription");
    v8 = [(HFCameraVideoDownloadOperation *)self clip];
    [v8 duration];
    int v19 = 136315906;
    __int16 v20 = "-[HFCameraVideoDownloadOperation fileDownloadFinishedWithElapsedTime:]";
    __int16 v21 = 2112;
    uint64_t v22 = v7;
    __int16 v23 = 2048;
    uint64_t v24 = v9;
    __int16 v25 = 2048;
    double v26 = a3;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%s %@; duration: %.2f in %.2f", (uint8_t *)&v19, 0x2Au);
  }
  v10 = [(HFCameraVideoDownloadOperation *)self clip];
  uint64_t v11 = [v10 quality];

  if (v11 == 1)
  {
    v12 = [(HFCameraVideoDownloadOperation *)self timelapseLoadEvent];
    id v13 = (id)[v12 sendEventForState:2];
  }
  v14 = [(HFCameraVideoDownloadOperation *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    int v16 = [(HFCameraVideoDownloadOperation *)self delegate];
    __int16 v17 = [(HFCameraVideoDownloadOperation *)self clip];
    __int16 v18 = [(HFCameraVideoDownloadOperation *)self destinationURL];
    [v16 didDownloadVideoFileForClip:v17 toURL:v18];
  }
}

- (void)fileDownloadProgress:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = HFLogForCategory(0x1DuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = [(HFCameraVideoDownloadOperation *)self clip];
    uint64_t v7 = objc_msgSend(v6, "hf_prettyDescription");
    v8 = [NSNumber numberWithUnsignedInteger:a3];
    int v13 = 136315650;
    v14 = "-[HFCameraVideoDownloadOperation fileDownloadProgress:]";
    __int16 v15 = 2112;
    int v16 = v7;
    __int16 v17 = 2112;
    __int16 v18 = v8;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%s %@; download progress: %@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v9 = [(HFCameraVideoDownloadOperation *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(HFCameraVideoDownloadOperation *)self delegate];
    v12 = [(HFCameraVideoDownloadOperation *)self clip];
    [v11 downloadProgress:a3 forClip:v12];
  }
}

- (id)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFCameraVideoDownloadOperation *)self clip];
  uint64_t v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  [v3 appendString:v6 withName:@"clipUUID"];

  id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFCameraVideoDownloadOperation isFinished](self, "isFinished"), @"isFinished");
  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFCameraVideoDownloadOperation isCancelled](self, "isCancelled"), @"isCancelled");
  id v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFCameraVideoDownloadOperation isExecuting](self, "isExecuting"), @"isExecuting");
  char v10 = [v3 build];

  return v10;
}

- (HFCameraVideoDownloaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HFCameraVideoDownloaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)downloadBlock
{
  return self->_downloadBlock;
}

- (void)setDownloadBlock:(id)a3
{
}

- (HMCameraClip)clip
{
  return self->_clip;
}

- (void)setClip:(id)a3
{
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void)setDestinationURL:(id)a3
{
}

- (void)setFileAlreadyExists:(BOOL)a3
{
  self->_fileAlreadyExists = a3;
}

- (HFCameraAnalyticsCameraTimelapseLoadEvent)timelapseLoadEvent
{
  return self->_timelapseLoadEvent;
}

- (void)setTimelapseLoadEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelapseLoadEvent, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_clip, 0);
  objc_storeStrong(&self->_downloadBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end