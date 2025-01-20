@interface CAMPersistenceResponse
- (CAMCaptureCoordinationInfo)coordinationInfo;
- (CAMPersistenceResponse)initWithUUID:(id)a3 captureSession:(unsigned __int16)a4 url:(id)a5 creationDate:(id)a6 scrubberImage:(id)a7 pixelSize:(CGSize)a8 coordinationInfo:(id)a9;
- (CGSize)pixelSize;
- (NSDate)creationDate;
- (NSString)persistenceUUID;
- (NSURL)persistenceURL;
- (UIImage)scrubberImage;
- (id)description;
- (unsigned)sessionIdentifier;
@end

@implementation CAMPersistenceResponse

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)persistenceUUID
{
  return self->_persistenceUUID;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (UIImage)scrubberImage
{
  return self->_scrubberImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinationInfo, 0);
  objc_storeStrong((id *)&self->_scrubberImage, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_persistenceURL, 0);
  objc_storeStrong((id *)&self->_persistenceUUID, 0);
}

- (CAMPersistenceResponse)initWithUUID:(id)a3 captureSession:(unsigned __int16)a4 url:(id)a5 creationDate:(id)a6 scrubberImage:(id)a7 pixelSize:(CGSize)a8 coordinationInfo:(id)a9
{
  CGFloat height = a8.height;
  CGFloat width = a8.width;
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  v29.receiver = self;
  v29.super_class = (Class)CAMPersistenceResponse;
  v22 = [(CAMPersistenceResponse *)&v29 init];
  if (v22)
  {
    uint64_t v23 = [v17 copy];
    persistenceUUID = v22->_persistenceUUID;
    v22->_persistenceUUID = (NSString *)v23;

    v22->_sessionIdentifier = a4;
    uint64_t v25 = [v18 copy];
    persistenceURL = v22->_persistenceURL;
    v22->_persistenceURL = (NSURL *)v25;

    objc_storeStrong((id *)&v22->_creationDate, a6);
    objc_storeStrong((id *)&v22->_scrubberImage, a7);
    v22->_pixelSize.CGFloat width = width;
    v22->_pixelSize.CGFloat height = height;
    objc_storeStrong((id *)&v22->_coordinationInfo, a9);
    v27 = v22;
  }

  return v22;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CAMPersistenceResponse *)self persistenceUUID];
  unsigned int v6 = [(CAMPersistenceResponse *)self sessionIdentifier];
  v7 = [(CAMPersistenceResponse *)self creationDate];
  v8 = [(CAMPersistenceResponse *)self creationDate];
  [v8 timeIntervalSince1970];
  uint64_t v10 = v9;
  v11 = [(CAMPersistenceResponse *)self persistenceURL];
  v12 = [(CAMPersistenceResponse *)self coordinationInfo];
  v13 = [v3 stringWithFormat:@"<%@ persistenceUUID:%@ sessionIdentifier:%d creationDate:%@ (%.3f) persistenceURL:%@ coordinationInfo:%@>", v4, v5, v6, v7, v10, v11, v12];

  return v13;
}

- (NSURL)persistenceURL
{
  return self->_persistenceURL;
}

- (CGSize)pixelSize
{
  double width = self->_pixelSize.width;
  double height = self->_pixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CAMCaptureCoordinationInfo)coordinationInfo
{
  return self->_coordinationInfo;
}

@end