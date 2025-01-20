@interface SKDownload
- (BOOL)isEqual:(id)a3;
- (NSError)error;
- (NSNumber)_downloadID;
- (NSString)contentIdentifier;
- (NSString)contentVersion;
- (NSTimeInterval)timeRemaining;
- (NSURL)contentURL;
- (SKDownload)init;
- (SKDownloadState)downloadState;
- (SKDownloadState)state;
- (SKPaymentTransaction)transaction;
- (float)progress;
- (uint64_t)contentLength;
- (uint64_t)expectedContentLength;
- (void)_applyChangeset:(id)a3;
- (void)_setContentIdentifier:(id)a3;
- (void)_setContentLength:(id)a3;
- (void)_setContentURL:(id)a3;
- (void)_setDownloadID:(id)a3;
- (void)_setDownloadState:(int64_t)a3;
- (void)_setError:(id)a3;
- (void)_setProgress:(float)a3;
- (void)_setTimeRemaining:(double)a3;
- (void)_setTransaction:(id)a3;
- (void)_setVersion:(id)a3;
@end

@implementation SKDownload

- (SKDownload)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKDownload;
  v2 = [(SKDownload *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKDownloadInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;

    *((NSTimeInterval *)v2->_internal + 7) = SKDownloadTimeRemainingUnknown;
  }
  return v2;
}

- (NSNumber)_downloadID
{
  return (NSNumber *)*((id *)self->_internal + 1);
}

- (NSString)contentIdentifier
{
  return (NSString *)*((id *)self->_internal + 2);
}

- (SKDownloadState)state
{
  return *((void *)self->_internal + 3);
}

- (SKDownloadState)downloadState
{
  return *((void *)self->_internal + 3);
}

- (NSURL)contentURL
{
  return (NSURL *)*((id *)self->_internal + 6);
}

- (float)progress
{
  return *((float *)self->_internal + 8);
}

- (uint64_t)contentLength
{
  return [*((id *)self->_internal + 8) longLongValue];
}

- (uint64_t)expectedContentLength
{
  return [*((id *)self->_internal + 8) longLongValue];
}

- (NSString)contentVersion
{
  return (NSString *)*((id *)self->_internal + 9);
}

- (NSError)error
{
  return (NSError *)*((id *)self->_internal + 5);
}

- (NSTimeInterval)timeRemaining
{
  return *((double *)self->_internal + 7);
}

- (SKPaymentTransaction)transaction
{
  id WeakRetained = objc_loadWeakRetained((id *)self->_internal + 10);

  return (SKPaymentTransaction *)WeakRetained;
}

- (void)_applyChangeset:(id)a3
{
  id v10 = a3;
  v4 = [v10 contentLength];
  if (v4) {
    [(SKDownload *)self _setContentLength:v4];
  }
  v5 = [v10 contentURL];

  if (v5) {
    [(SKDownload *)self _setContentURL:v5];
  }
  objc_super v6 = [v10 downloadState];

  if (v6) {
    -[SKDownload _setDownloadState:](self, "_setDownloadState:", [v6 integerValue]);
  }
  v7 = [v10 error];

  if (v7) {
    [(SKDownload *)self _setError:v7];
  }
  v8 = [v10 progress];

  if (v8)
  {
    [v8 floatValue];
    -[SKDownload _setProgress:](self, "_setProgress:");
  }
  v9 = [v10 timeRemaining];

  if (v9)
  {
    [v9 doubleValue];
    -[SKDownload _setTimeRemaining:](self, "_setTimeRemaining:");
  }
}

- (void)_setDownloadID:(id)a3
{
  *((void *)self->_internal + 1) = [a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setContentIdentifier:(id)a3
{
  *((void *)self->_internal + 2) = [a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setContentLength:(id)a3
{
  objc_storeStrong((id *)self->_internal + 8, a3);
  id v4 = a3;
}

- (void)_setContentURL:(id)a3
{
  *((void *)self->_internal + 6) = [a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setDownloadState:(int64_t)a3
{
  *((void *)self->_internal + 3) = a3;
}

- (void)_setError:(id)a3
{
  *((void *)self->_internal + 5) = [a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setProgress:(float)a3
{
  *((float *)self->_internal + 8) = a3;
}

- (void)_setTimeRemaining:(double)a3
{
  *((double *)self->_internal + 7) = a3;
}

- (void)_setTransaction:(id)a3
{
  id v4 = (id *)((char *)self->_internal + 80);
  id v5 = a3;
  objc_storeWeak(v4, v5);
  id v7 = [v5 payment];

  objc_super v6 = [v7 productIdentifier];
  [(SKDownload *)self _setContentIdentifier:v6];
}

- (void)_setVersion:(id)a3
{
  *((void *)self->_internal + 9) = [a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    objc_super v6 = [(SKDownload *)self _downloadID];
    id v7 = [v5 _downloadID];
    if ([v6 isEqual:v7])
    {
      v8 = [(SKDownload *)self contentIdentifier];
      v9 = [v5 contentIdentifier];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
}

@end