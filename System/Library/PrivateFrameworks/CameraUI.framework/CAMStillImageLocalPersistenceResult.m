@interface CAMStillImageLocalPersistenceResult
- (CAMStillImageCaptureResult)captureResult;
- (CAMStillImageLocalPersistenceResult)initWithCaptureResult:(id)a3 atURL:(id)a4 linkedURL:(id)a5 localAdjustmentsURL:(id)a6 diagnosticsPath:(id)a7 filteredPreviewPath:(id)a8 withUUID:(id)a9 creationDate:(id)a10 uniformTypeIdentifier:(id)a11 orientation:(int64_t)a12 metadata:(id)a13 adjustmentsData:(id)a14 localPrivateMetadataFileURL:(id)a15 error:(id)a16;
- (NSData)adjustmentsData;
- (NSDate)creationDate;
- (NSDictionary)metadata;
- (NSError)error;
- (NSString)localDiagnosticsPath;
- (NSString)localFilteredPreviewPath;
- (NSString)localPersistenceUUID;
- (NSString)uniformTypeIdentifier;
- (NSURL)linkedDestinationURL;
- (NSURL)localAdjustmentsURL;
- (NSURL)localDestinationURL;
- (NSURL)localPrivateMetadataFileURL;
- (int64_t)imageOrientation;
@end

@implementation CAMStillImageLocalPersistenceResult

- (NSError)error
{
  return self->_error;
}

- (NSString)localPersistenceUUID
{
  return self->_localPersistenceUUID;
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (NSURL)localDestinationURL
{
  return self->_localDestinationURL;
}

- (NSURL)localAdjustmentsURL
{
  return self->_localAdjustmentsURL;
}

- (CAMStillImageCaptureResult)captureResult
{
  return self->_captureResult;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSString)localFilteredPreviewPath
{
  return self->_localFilteredPreviewPath;
}

- (NSString)localDiagnosticsPath
{
  return self->_localDiagnosticsPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_localPrivateMetadataFileURL, 0);
  objc_storeStrong((id *)&self->_adjustmentsData, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_localPersistenceUUID, 0);
  objc_storeStrong((id *)&self->_localFilteredPreviewPath, 0);
  objc_storeStrong((id *)&self->_localDiagnosticsPath, 0);
  objc_storeStrong((id *)&self->_localAdjustmentsURL, 0);
  objc_storeStrong((id *)&self->_linkedDestinationURL, 0);
  objc_storeStrong((id *)&self->_localDestinationURL, 0);
  objc_storeStrong((id *)&self->_captureResult, 0);
}

- (CAMStillImageLocalPersistenceResult)initWithCaptureResult:(id)a3 atURL:(id)a4 linkedURL:(id)a5 localAdjustmentsURL:(id)a6 diagnosticsPath:(id)a7 filteredPreviewPath:(id)a8 withUUID:(id)a9 creationDate:(id)a10 uniformTypeIdentifier:(id)a11 orientation:(int64_t)a12 metadata:(id)a13 adjustmentsData:(id)a14 localPrivateMetadataFileURL:(id)a15 error:(id)a16
{
  id v57 = a3;
  id v58 = a4;
  id v21 = a5;
  id v22 = a6;
  id v59 = a7;
  id v23 = a8;
  id v24 = a9;
  id v56 = a10;
  id v25 = a11;
  id v26 = a13;
  id v55 = a14;
  v27 = v21;
  id v28 = a15;
  v29 = v24;
  id v30 = a16;
  v60.receiver = self;
  v60.super_class = (Class)CAMStillImageLocalPersistenceResult;
  v31 = [(CAMStillImageLocalPersistenceResult *)&v60 init];
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_captureResult, a3);
    objc_storeStrong((id *)&v32->_creationDate, a10);
    uint64_t v33 = [v58 copy];
    localDestinationURL = v32->_localDestinationURL;
    v32->_localDestinationURL = (NSURL *)v33;

    uint64_t v35 = [v27 copy];
    linkedDestinationURL = v32->_linkedDestinationURL;
    v32->_linkedDestinationURL = (NSURL *)v35;

    uint64_t v37 = [v22 copy];
    localAdjustmentsURL = v32->_localAdjustmentsURL;
    v32->_localAdjustmentsURL = (NSURL *)v37;

    uint64_t v39 = [v59 copy];
    localDiagnosticsPath = v32->_localDiagnosticsPath;
    v32->_localDiagnosticsPath = (NSString *)v39;

    uint64_t v41 = [v23 copy];
    localFilteredPreviewPath = v32->_localFilteredPreviewPath;
    v32->_localFilteredPreviewPath = (NSString *)v41;

    uint64_t v43 = [v29 copy];
    localPersistenceUUID = v32->_localPersistenceUUID;
    v32->_localPersistenceUUID = (NSString *)v43;

    uint64_t v45 = [v25 copy];
    uniformTypeIdentifier = v32->_uniformTypeIdentifier;
    v32->_uniformTypeIdentifier = (NSString *)v45;

    v32->_imageOrientation = a12;
    uint64_t v47 = [v26 copy];
    metadata = v32->_metadata;
    v32->_metadata = (NSDictionary *)v47;

    objc_storeStrong((id *)&v32->_adjustmentsData, a14);
    uint64_t v49 = [v28 copy];
    localPrivateMetadataFileURL = v32->_localPrivateMetadataFileURL;
    v32->_localPrivateMetadataFileURL = (NSURL *)v49;

    objc_storeStrong((id *)&v32->_error, a16);
    v51 = v32;
  }

  return v32;
}

- (NSURL)linkedDestinationURL
{
  return self->_linkedDestinationURL;
}

- (NSData)adjustmentsData
{
  return self->_adjustmentsData;
}

- (NSURL)localPrivateMetadataFileURL
{
  return self->_localPrivateMetadataFileURL;
}

@end