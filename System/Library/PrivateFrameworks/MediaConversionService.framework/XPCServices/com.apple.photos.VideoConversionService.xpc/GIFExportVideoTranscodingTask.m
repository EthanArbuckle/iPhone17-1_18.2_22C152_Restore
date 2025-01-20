@interface GIFExportVideoTranscodingTask
- (BOOL)hasProgress;
- (NSProgress)progress;
- (PFExportGIFRequest)exportGIFRequest;
- (double)currentFractionCompleted;
- (void)cancelTranscode;
- (void)performExport;
- (void)setExportGIFRequest:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation GIFExportVideoTranscodingTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportGIFRequest, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

- (void)setExportGIFRequest:(id)a3
{
}

- (PFExportGIFRequest)exportGIFRequest
{
  return (PFExportGIFRequest *)objc_getProperty(self, a2, 160, 1);
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 152, 1);
}

- (void)cancelTranscode
{
  v4 = [(GIFExportVideoTranscodingTask *)self progress];

  if (!v4)
  {
    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"VideoConversionService.m" lineNumber:1318 description:@"Unexpected missing GIF export progress with job in running state"];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(VideoConversionTask *)self identifier];
    int v8 = 138543362;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cancelling GIF export conversion task %{public}@", (uint8_t *)&v8, 0xCu);
  }
  v6 = [(GIFExportVideoTranscodingTask *)self progress];
  [v6 cancel];
}

- (double)currentFractionCompleted
{
  v3 = [(GIFExportVideoTranscodingTask *)self progress];
  [v3 fractionCompleted];
  double v5 = v4;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v6 = [(VideoConversionTask *)self identifier];
    int v8 = 138543618;
    v9 = v6;
    __int16 v10 = 2048;
    double v11 = v5 * 100.0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "GIF export progress for conversion task %{public}@: %.1f", (uint8_t *)&v8, 0x16u);
  }
  return v5;
}

- (BOOL)hasProgress
{
  v2 = [(GIFExportVideoTranscodingTask *)self progress];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)performExport
{
  id v3 = objc_alloc((Class)PFExportGIFRequest);
  double v4 = [(VideoConversionTask *)self sourceMainResourceURL];
  id v5 = [v3 initWithVideoURL:v4];

  [(GIFExportVideoTranscodingTask *)self setExportGIFRequest:v5];
  v6 = [(VideoConversionTask *)self outputMainResourceURL];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000209A4;
  v8[3] = &unk_100041740;
  v8[4] = self;
  v7 = +[PFExportGIFRequest runExport:v5 toURL:v6 completion:v8];
  [(GIFExportVideoTranscodingTask *)self setProgress:v7];
}

@end