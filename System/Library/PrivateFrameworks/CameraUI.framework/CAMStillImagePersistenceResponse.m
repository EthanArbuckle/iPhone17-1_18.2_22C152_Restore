@interface CAMStillImagePersistenceResponse
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)irisStillDisplayTime;
- (BOOL)isExpectingPairedVideo;
- (BOOL)isTransientAssetTemporaryPlaceholder;
- (CAMStillImagePersistenceResponse)initWithUUID:(id)a3 captureSession:(unsigned __int16)a4 url:(id)a5 creationDate:(id)a6 scrubberImage:(id)a7 finalExpectedPixelSize:(CGSize)a8 metadata:(id)a9 burstIdentifier:(id)a10 burstRepresentedCount:(unint64_t)a11 expectingPairedVideo:(BOOL)a12 coordinationInfo:(id)a13;
- (NSDictionary)metadata;
- (NSDictionary)stillImageMetadata;
- (NSString)burstIdentifier;
- (NSString)description;
- (NSString)irisStillImageUUID;
- (NSURL)irisVideoPersistenceURL;
- (unint64_t)burstRepresentedCount;
- (unint64_t)mediaSubtypes;
- (unint64_t)mediaType;
- (unint64_t)numberOfRepresentedAssets;
@end

@implementation CAMStillImagePersistenceResponse

- (NSString)burstIdentifier
{
  return self->_burstIdentifier;
}

- (NSDictionary)stillImageMetadata
{
  return self->_metadata;
}

- (unint64_t)numberOfRepresentedAssets
{
  return self->_burstRepresentedCount;
}

- (unint64_t)mediaSubtypes
{
  return 0;
}

- (BOOL)isExpectingPairedVideo
{
  return self->_expectingPairedVideo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_burstIdentifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (CAMStillImagePersistenceResponse)initWithUUID:(id)a3 captureSession:(unsigned __int16)a4 url:(id)a5 creationDate:(id)a6 scrubberImage:(id)a7 finalExpectedPixelSize:(CGSize)a8 metadata:(id)a9 burstIdentifier:(id)a10 burstRepresentedCount:(unint64_t)a11 expectingPairedVideo:(BOOL)a12 coordinationInfo:(id)a13
{
  double height = a8.height;
  double width = a8.width;
  uint64_t v18 = a4;
  id v21 = a9;
  id v22 = a10;
  v30.receiver = self;
  v30.super_class = (Class)CAMStillImagePersistenceResponse;
  v23 = -[CAMPersistenceResponse initWithUUID:captureSession:url:creationDate:scrubberImage:pixelSize:coordinationInfo:](&v30, sel_initWithUUID_captureSession_url_creationDate_scrubberImage_pixelSize_coordinationInfo_, a3, v18, a5, a6, a7, a13, width, height);
  if (v23)
  {
    uint64_t v24 = [v21 copy];
    metadata = v23->_metadata;
    v23->_metadata = (NSDictionary *)v24;

    uint64_t v26 = [v22 copy];
    burstIdentifier = v23->_burstIdentifier;
    v23->_burstIdentifier = (NSString *)v26;

    v23->_burstRepresentedCount = a11;
    v23->_expectingPairedVideo = a12;
    v28 = v23;
  }

  return v23;
}

- (NSString)description
{
  v3 = [(CAMStillImagePersistenceResponse *)self burstIdentifier];
  if (v3)
  {
    v4 = [NSString stringWithFormat:@"YES, %ld frames", -[CAMStillImagePersistenceResponse burstRepresentedCount](self, "burstRepresentedCount")];
  }
  else
  {
    v4 = @"NO";
  }

  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  v7 = [(CAMPersistenceResponse *)self persistenceUUID];
  unsigned int v8 = [(CAMPersistenceResponse *)self sessionIdentifier];
  v9 = [(CAMPersistenceResponse *)self creationDate];
  v10 = [(CAMPersistenceResponse *)self creationDate];
  [v10 timeIntervalSince1970];
  uint64_t v12 = v11;
  v13 = [(CAMPersistenceResponse *)self persistenceURL];
  v14 = [(CAMPersistenceResponse *)self coordinationInfo];
  v15 = [v5 stringWithFormat:@"<%@ persistenceUUID:%@ sessionIdentifier:%d burst:%@ creationDate:%@ (%.3f) persistenceURL:%@ coordinationInfo:%@>", v6, v7, v8, v4, v9, v12, v13, v14];

  return (NSString *)v15;
}

- (unint64_t)mediaType
{
  return 1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x263F01090];
  return self;
}

- (NSString)irisStillImageUUID
{
  return 0;
}

- (NSURL)irisVideoPersistenceURL
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)irisStillDisplayTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x263F01090];
  return self;
}

- (BOOL)isTransientAssetTemporaryPlaceholder
{
  return 0;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (unint64_t)burstRepresentedCount
{
  return self->_burstRepresentedCount;
}

@end