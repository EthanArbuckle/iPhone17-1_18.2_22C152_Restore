@interface CAMStillImageCaptureResponse
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)irisStillDisplayTime;
- (BOOL)flashFired;
- (BOOL)isExpectingPairedVideo;
- (BOOL)isTransientAssetTemporaryPlaceholder;
- (CAMStillImageCaptureResponse)initWithUUID:(id)a3 captureSession:(unsigned __int16)a4 captureDate:(id)a5 metadata:(id)a6 burstIdentifier:(id)a7 burstRepresentedCount:(unint64_t)a8 imageWellImage:(id)a9 textAnalysisImage:(id)a10 coordinationInfo:(id)a11 finalExpectedPixelSize:(CGSize)a12 expectingPairedVideo:(BOOL)a13 captureID:(int64_t)a14 semanticEnhanceScene:(int64_t)a15;
- (CGSize)finalExpectedPixelSize;
- (NSDate)captureDate;
- (NSDictionary)metadata;
- (NSDictionary)stillImageMetadata;
- (NSString)burstIdentifier;
- (NSString)description;
- (NSString)irisStillImageUUID;
- (NSString)persistenceUUID;
- (NSString)uuid;
- (NSURL)irisVideoPersistenceURL;
- (NSURL)persistenceURL;
- (UIImage)imageWellImage;
- (UIImage)placeholderImage;
- (UIImage)textAnalysisImage;
- (int64_t)captureID;
- (int64_t)semanticEnhanceScene;
- (unint64_t)burstRepresentedCount;
- (unint64_t)mediaSubtypes;
- (unint64_t)mediaType;
- (unint64_t)numberOfRepresentedAssets;
@end

@implementation CAMStillImageCaptureResponse

- (UIImage)imageWellImage
{
  return self->_imageWellImage;
}

- (NSString)persistenceUUID
{
  return self->_persistenceUUID;
}

- (NSString)uuid
{
  return self->_persistenceUUID;
}

- (NSString)burstIdentifier
{
  return self->_burstIdentifier;
}

- (unint64_t)mediaType
{
  return 1;
}

- (NSDictionary)stillImageMetadata
{
  return self->_metadata;
}

- (NSDate)captureDate
{
  return self->_captureDate;
}

- (unint64_t)numberOfRepresentedAssets
{
  return self->_burstRepresentedCount;
}

- (unint64_t)mediaSubtypes
{
  v3 = [(CAMCaptureResponse *)self coordinationInfo];
  int v4 = [v3 isHDR];

  if (v4) {
    unint64_t v5 = 2;
  }
  else {
    unint64_t v5 = 0;
  }
  if ([(CAMStillImageCaptureResponse *)self isExpectingPairedVideo]) {
    return v5 | 8;
  }
  else {
    return v5;
  }
}

- (BOOL)isExpectingPairedVideo
{
  return self->_expectingPairedVideo;
}

- (UIImage)placeholderImage
{
  return self->_imageWellImage;
}

- (BOOL)flashFired
{
  v2 = [(CAMStillImageCaptureResponse *)self metadata];
  v3 = [v2 objectForKey:*MEMORY[0x263F0F248]];
  int v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 objectForKey:*MEMORY[0x263F0F280]];
    v6 = v5;
    if (v5) {
      BOOL v7 = [v5 unsignedShortValue] & 1;
    }
    else {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textAnalysisImage, 0);
  objc_storeStrong((id *)&self->_imageWellImage, 0);
  objc_storeStrong((id *)&self->_burstIdentifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_captureDate, 0);
  objc_storeStrong((id *)&self->_persistenceUUID, 0);
}

- (CAMStillImageCaptureResponse)initWithUUID:(id)a3 captureSession:(unsigned __int16)a4 captureDate:(id)a5 metadata:(id)a6 burstIdentifier:(id)a7 burstRepresentedCount:(unint64_t)a8 imageWellImage:(id)a9 textAnalysisImage:(id)a10 coordinationInfo:(id)a11 finalExpectedPixelSize:(CGSize)a12 expectingPairedVideo:(BOOL)a13 captureID:(int64_t)a14 semanticEnhanceScene:(int64_t)a15
{
  CGFloat height = a12.height;
  CGFloat width = a12.width;
  uint64_t v20 = a4;
  id v22 = a3;
  id v37 = a5;
  id v23 = a6;
  id v24 = a7;
  id v36 = a9;
  id v25 = a10;
  v38.receiver = self;
  v38.super_class = (Class)CAMStillImageCaptureResponse;
  v26 = [(CAMCaptureResponse *)&v38 initWithType:0 captureSession:v20 coordinationInfo:a11];
  if (v26)
  {
    uint64_t v27 = [v22 copy];
    persistenceUUID = v26->_persistenceUUID;
    v26->_persistenceUUID = (NSString *)v27;

    objc_storeStrong((id *)&v26->_captureDate, a5);
    uint64_t v29 = [v23 copy];
    metadata = v26->_metadata;
    v26->_metadata = (NSDictionary *)v29;

    uint64_t v31 = [v24 copy];
    burstIdentifier = v26->_burstIdentifier;
    v26->_burstIdentifier = (NSString *)v31;

    v26->_burstRepresentedCount = a8;
    objc_storeStrong((id *)&v26->_imageWellImage, a9);
    objc_storeStrong((id *)&v26->_textAnalysisImage, a10);
    v26->_expectingPairedVideo = a13;
    v26->_finalExpectedPixelSize.CGFloat width = width;
    v26->_finalExpectedPixelSize.CGFloat height = height;
    v26->_captureID = a14;
    v26->_semanticEnhanceScene = a15;
    v33 = v26;
  }

  return v26;
}

- (NSString)description
{
  if (self->_burstIdentifier)
  {
    v3 = [NSString stringWithFormat:@"YES, %ld frames", self->_burstRepresentedCount];
  }
  else
  {
    v3 = @"NO";
  }
  int v4 = NSString;
  uint64_t v5 = objc_opt_class();
  int64_t v6 = [(CAMStillImageCaptureResponse *)self captureID];
  BOOL v7 = [(CAMStillImageCaptureResponse *)self persistenceUUID];
  unsigned int v8 = [(CAMCaptureResponse *)self sessionIdentifier];
  v9 = [(CAMStillImageCaptureResponse *)self captureDate];
  v10 = [(CAMStillImageCaptureResponse *)self captureDate];
  [v10 timeIntervalSince1970];
  uint64_t v12 = v11;
  v13 = [(CAMStillImageCaptureResponse *)self burstIdentifier];
  v14 = [v4 stringWithFormat:@"<%@ captureID:%lld persistenceUUID:%@ sessionIdentifier:%d, captureDate:%@ (%.3f), burst:%@, burstIdentifier:%@>", v5, v6, v7, v8, v9, v12, v3, v13];

  return (NSString *)v14;
}

- (NSURL)persistenceURL
{
  return 0;
}

- (CGSize)finalExpectedPixelSize
{
  double width = self->_finalExpectedPixelSize.width;
  double height = self->_finalExpectedPixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
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

- (unint64_t)burstRepresentedCount
{
  return self->_burstRepresentedCount;
}

- (UIImage)textAnalysisImage
{
  return self->_textAnalysisImage;
}

- (int64_t)captureID
{
  return self->_captureID;
}

- (int64_t)semanticEnhanceScene
{
  return self->_semanticEnhanceScene;
}

@end