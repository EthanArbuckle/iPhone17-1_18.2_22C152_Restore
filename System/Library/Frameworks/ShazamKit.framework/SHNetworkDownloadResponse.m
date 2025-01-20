@interface SHNetworkDownloadResponse
- (NSError)error;
- (NSURL)downloadedFileLocation;
- (NSURLResponse)urlResponse;
- (SHNetworkDownloadResponse)initWithDownloadedFileLocation:(id)a3 urlResponse:(id)a4 error:(id)a5;
@end

@implementation SHNetworkDownloadResponse

- (SHNetworkDownloadResponse)initWithDownloadedFileLocation:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SHNetworkDownloadResponse;
  v12 = [(SHNetworkDownloadResponse *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_downloadedFileLocation, a3);
    objc_storeStrong((id *)&v13->_urlResponse, a4);
    objc_storeStrong((id *)&v13->_error, a5);
  }

  return v13;
}

- (NSURL)downloadedFileLocation
{
  return self->_downloadedFileLocation;
}

- (NSURLResponse)urlResponse
{
  return self->_urlResponse;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_urlResponse, 0);

  objc_storeStrong((id *)&self->_downloadedFileLocation, 0);
}

@end