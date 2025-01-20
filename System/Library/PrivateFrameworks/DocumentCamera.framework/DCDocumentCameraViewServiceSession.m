@interface DCDocumentCameraViewServiceSession
+ (BOOL)supportsSecureCoding;
- (DCDocumentCameraViewServiceSession)initWithCoder:(id)a3;
- (DCDocumentCameraViewServiceSession)initWithSessionRequest:(id)a3;
- (DCDocumentCameraViewServiceSessionRequest)sessionRequest;
- (ICDocCamImageCache)docCamImageCache;
- (int)viewServicePid;
- (void)encodeWithCoder:(id)a3;
- (void)setup;
@end

@implementation DCDocumentCameraViewServiceSession

- (DCDocumentCameraViewServiceSession)initWithSessionRequest:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DCDocumentCameraViewServiceSession;
  v6 = [(DCDocumentCameraViewServiceSession *)&v8 init];
  if (v6)
  {
    v6->_viewServicePid = getpid();
    objc_storeStrong((id *)&v6->_sessionRequest, a3);
    [(DCDocumentCameraViewServiceSession *)v6 setup];
  }

  return v6;
}

- (void)setup
{
  v3 = [(DCDocumentCameraViewServiceSession *)self sessionRequest];
  v4 = [v3 cachesDirectorySandboxExtension];
  id v7 = [v4 fileURL];

  id v5 = [[ICDocCamImageCache alloc] initWithDataCryptorDelegate:0 cachesDirectoryURL:v7];
  docCamImageCache = self->_docCamImageCache;
  self->_docCamImageCache = v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DCDocumentCameraViewServiceSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DCDocumentCameraViewServiceSession;
  id v5 = [(DCDocumentCameraViewServiceSession *)&v9 init];
  if (v5)
  {
    v5->_viewServicePid = [v4 decodeInt32ForKey:@"kPIDFieldCodingKey"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSessionRequestFieldCodingKey"];
    sessionRequest = v5->_sessionRequest;
    v5->_sessionRequest = (DCDocumentCameraViewServiceSessionRequest *)v6;

    [(DCDocumentCameraViewServiceSession *)v5 setup];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[DCDocumentCameraViewServiceSession viewServicePid](self, "viewServicePid"), @"kPIDFieldCodingKey");
  id v5 = [(DCDocumentCameraViewServiceSession *)self sessionRequest];
  [v4 encodeObject:v5 forKey:@"kSessionRequestFieldCodingKey"];
}

- (DCDocumentCameraViewServiceSessionRequest)sessionRequest
{
  return self->_sessionRequest;
}

- (int)viewServicePid
{
  return self->_viewServicePid;
}

- (ICDocCamImageCache)docCamImageCache
{
  return self->_docCamImageCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_docCamImageCache, 0);

  objc_storeStrong((id *)&self->_sessionRequest, 0);
}

@end