@interface _DPDediscoBackgroundDownloaderService
- (NSData)data;
- (NSURL)url;
- (NSURLSession)backgroundSession;
- (OS_dispatch_semaphore)wait;
- (_DPDediscoBackgroundDownloaderService)initWithURL:(id)a3;
- (id)downloadConfigSynchronously;
- (unint64_t)maxRetries;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)setData:(id)a3;
- (void)setMaxRetries:(unint64_t)a3;
- (void)setWait:(id)a3;
- (void)startDownload;
@end

@implementation _DPDediscoBackgroundDownloaderService

- (_DPDediscoBackgroundDownloaderService)initWithURL:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_DPDediscoBackgroundDownloaderService;
  v6 = [(_DPDediscoBackgroundDownloaderService *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = +[NSString stringWithFormat:@"%@%ld", @"com.apple.DPSubmissionService.BackgroundDownload", ++qword_100082B70];
    v9 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:v8];
    v10 = +[NSOperationQueue currentQueue];
    uint64_t v11 = +[NSURLSession sessionWithConfiguration:v9 delegate:v7 delegateQueue:v10];
    backgroundSession = v7->_backgroundSession;
    v7->_backgroundSession = (NSURLSession *)v11;

    data = v7->_data;
    v7->_data = 0;

    v7->_maxRetries = 3;
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    wait = v7->_wait;
    v7->_wait = (OS_dispatch_semaphore *)v14;
  }
  return v7;
}

- (id)downloadConfigSynchronously
{
  [(_DPDediscoBackgroundDownloaderService *)self startDownload];
  v3 = [(_DPDediscoBackgroundDownloaderService *)self wait];
  dispatch_time_t v4 = dispatch_time(0, 15000000000);
  intptr_t v5 = dispatch_semaphore_wait(v3, v4);

  if (v5)
  {
    v6 = +[_DPLog service];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100056BA0(v6);
    }
  }
  v7 = [(_DPDediscoBackgroundDownloaderService *)self backgroundSession];
  [v7 invalidateAndCancel];

  v8 = [(_DPDediscoBackgroundDownloaderService *)self data];
  return v8;
}

- (void)startDownload
{
  v3 = +[_DPLog service];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    dispatch_time_t v4 = [(_DPDediscoBackgroundDownloaderService *)self url];
    int v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Downloading config file from url %@ ...", (uint8_t *)&v8, 0xCu);
  }
  intptr_t v5 = [(_DPDediscoBackgroundDownloaderService *)self backgroundSession];
  v6 = [(_DPDediscoBackgroundDownloaderService *)self url];
  v7 = [v5 downloadTaskWithURL:v6];

  [v7 resume];
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [v7 error];
  if (v9)
  {
    if ([(_DPDediscoBackgroundDownloaderService *)self maxRetries])
    {
      v10 = [v7 response];
      uint64_t v11 = +[_DPLog service];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        id v19 = [v10 statusCode];
        __int16 v20 = 2112;
        v21 = v9;
        __int16 v22 = 2048;
        unint64_t v23 = [(_DPDediscoBackgroundDownloaderService *)self maxRetries];
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Client failed to download config file with status code %ld and error: %@. %ld retries left.", buf, 0x20u);
      }

      [(_DPDediscoBackgroundDownloaderService *)self setMaxRetries:(char *)[(_DPDediscoBackgroundDownloaderService *)self maxRetries] - 1];
      [(_DPDediscoBackgroundDownloaderService *)self startDownload];
    }
    else
    {
      v10 = +[_DPLog service];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100056CB8(v10);
      }
    }
  }
  else
  {
    v12 = +[_DPLog service];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Download finished successfully.", buf, 2u);
    }

    v13 = [v8 path];
    id v17 = 0;
    dispatch_semaphore_t v14 = +[NSData dataWithContentsOfFile:v13 options:0 error:&v17];
    v10 = v17;
    [(_DPDediscoBackgroundDownloaderService *)self setData:v14];

    if (v10)
    {
      v15 = +[_DPLog service];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100056C20(v10, v15);
      }
    }
    v16 = [(_DPDediscoBackgroundDownloaderService *)self wait];
    dispatch_semaphore_signal(v16);
  }
}

- (NSURLSession)backgroundSession
{
  return self->_backgroundSession;
}

- (NSURL)url
{
  return self->_url;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (unint64_t)maxRetries
{
  return self->_maxRetries;
}

- (void)setMaxRetries:(unint64_t)a3
{
  self->_maxRetries = a3;
}

- (OS_dispatch_semaphore)wait
{
  return self->_wait;
}

- (void)setWait:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wait, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_backgroundSession, 0);
}

@end