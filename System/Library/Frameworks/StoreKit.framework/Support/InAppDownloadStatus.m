@interface InAppDownloadStatus
- (InAppDownloadStatus)initWithDownloadID:(id)a3;
- (NSError)error;
- (NSNumber)downloadID;
- (NSString)installPath;
- (double)progress;
- (double)timeRemaining;
- (int64_t)state;
- (void)setDownloadID:(id)a3;
- (void)setError:(id)a3;
- (void)setInstallPath:(id)a3;
- (void)setProgress:(double)a3;
- (void)setState:(int64_t)a3;
- (void)setTimeRemaining:(double)a3;
@end

@implementation InAppDownloadStatus

- (InAppDownloadStatus)initWithDownloadID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)InAppDownloadStatus;
  v6 = [(InAppDownloadStatus *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_downloadID, a3);
    error = v7->_error;
    v7->_error = 0;

    installPath = v7->_installPath;
    v7->_installPath = 0;

    v7->_progress = 0.0;
    v7->_state = 0;
    v7->_timeRemaining = -1.0;
  }

  return v7;
}

- (NSNumber)downloadID
{
  return self->_downloadID;
}

- (void)setDownloadID:(id)a3
{
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(double)a3
{
  self->_timeRemaining = a3;
}

- (NSString)installPath
{
  return self->_installPath;
}

- (void)setInstallPath:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_installPath, 0);

  objc_storeStrong((id *)&self->_downloadID, 0);
}

@end