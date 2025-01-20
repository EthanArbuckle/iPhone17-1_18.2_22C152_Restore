@interface CAMVideoCaptureResponse
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)irisStillDisplayTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillDisplayTime;
- (BOOL)isExpectingPairedVideo;
- (BOOL)isTransientAssetTemporaryPlaceholder;
- (BOOL)slowWriterFrameDrops;
- (BOOL)stoppedUnexpectedly;
- (CAMVideoCaptureResponse)initWithUUID:(id)a3 captureMode:(int64_t)a4 captureSession:(unsigned __int16)a5 url:(id)a6 captureDate:(id)a7 duration:(id *)a8 stillPersistenceUUID:(id)a9 stillDisplayTime:(id *)a10 reason:(int64_t)a11 videoZoomFactor:(double)a12 finalExpectedPixelSize:(CGSize)a13 imageWellImage:(id)a14 previewImage:(id)a15 coordinationInfo:(id)a16 slowWriterFrameDrops:(BOOL)a17;
- (CGSize)finalExpectedPixelSize;
- (NSDate)captureDate;
- (NSDictionary)stillImageMetadata;
- (NSString)burstIdentifier;
- (NSString)description;
- (NSString)irisStillImageUUID;
- (NSString)persistenceUUID;
- (NSString)stillPersistenceUUID;
- (NSString)uuid;
- (NSURL)irisVideoPersistenceURL;
- (NSURL)localPersistenceURL;
- (NSURL)persistenceURL;
- (UIImage)imageWellImage;
- (UIImage)placeholderImage;
- (UIImage)previewImage;
- (double)videoZoomFactor;
- (int64_t)captureMode;
- (int64_t)reason;
- (unint64_t)mediaSubtypes;
- (unint64_t)mediaType;
- (unint64_t)numberOfRepresentedAssets;
@end

@implementation CAMVideoCaptureResponse

- (CAMVideoCaptureResponse)initWithUUID:(id)a3 captureMode:(int64_t)a4 captureSession:(unsigned __int16)a5 url:(id)a6 captureDate:(id)a7 duration:(id *)a8 stillPersistenceUUID:(id)a9 stillDisplayTime:(id *)a10 reason:(int64_t)a11 videoZoomFactor:(double)a12 finalExpectedPixelSize:(CGSize)a13 imageWellImage:(id)a14 previewImage:(id)a15 coordinationInfo:(id)a16 slowWriterFrameDrops:(BOOL)a17
{
  CGFloat height = a13.height;
  CGFloat width = a13.width;
  uint64_t v23 = a5;
  id v43 = a3;
  id v26 = a6;
  id v42 = a7;
  id v27 = a9;
  id v41 = a14;
  id v40 = a15;
  v44.receiver = self;
  v44.super_class = (Class)CAMVideoCaptureResponse;
  v28 = [(CAMCaptureResponse *)&v44 initWithType:1 captureSession:v23 coordinationInfo:a16];
  v29 = v28;
  if (v28)
  {
    v28->_captureMode = a4;
    uint64_t v30 = [v43 copy];
    persistenceUUID = v29->_persistenceUUID;
    v29->_persistenceUUID = (NSString *)v30;

    uint64_t v32 = [v26 copy];
    localPersistenceURL = v29->_localPersistenceURL;
    v29->_localPersistenceURL = (NSURL *)v32;

    objc_storeStrong((id *)&v29->_captureDate, a7);
    int64_t var3 = a8->var3;
    *(_OWORD *)&v29->_duration.value = *(_OWORD *)&a8->var0;
    v29->_duration.epoch = var3;
    uint64_t v35 = [v27 copy];
    stillPersistenceUUID = v29->_stillPersistenceUUID;
    v29->_stillPersistenceUUID = (NSString *)v35;

    int64_t v37 = a10->var3;
    *(_OWORD *)&v29->_stillDisplayTime.value = *(_OWORD *)&a10->var0;
    v29->_stillDisplayTime.epoch = v37;
    v29->_reason = a11;
    v29->_videoZoomFactor = a12;
    v29->_finalExpectedPixelSize.CGFloat width = width;
    v29->_finalExpectedPixelSize.CGFloat height = height;
    objc_storeStrong((id *)&v29->_imageWellImage, a14);
    objc_storeStrong((id *)&v29->_previewImage, a15);
    v29->_slowWriterFrameDrops = a17;
    v38 = v29;
  }

  return v29;
}

- (BOOL)stoppedUnexpectedly
{
  return [(CAMVideoCaptureResponse *)self reason] != 0;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CAMVideoCaptureResponse *)self persistenceUUID];
  unsigned int v6 = [(CAMCaptureResponse *)self sessionIdentifier];
  v7 = [(CAMVideoCaptureResponse *)self captureDate];
  v8 = [(CAMVideoCaptureResponse *)self captureDate];
  [v8 timeIntervalSince1970];
  uint64_t v10 = v9;
  v11 = [(CAMVideoCaptureResponse *)self localPersistenceURL];
  v12 = [v3 stringWithFormat:@"<%@ persistenceUUID:%@ sessionIdentifier:%d, captureDate:%@ (%.3f), localPersistenceURL:%@>", v4, v5, v6, v7, v10, v11];

  return (NSString *)v12;
}

- (unint64_t)mediaType
{
  return 2;
}

- (unint64_t)mediaSubtypes
{
  return 0;
}

- (NSString)uuid
{
  return self->_persistenceUUID;
}

- (NSURL)persistenceURL
{
  return self->_localPersistenceURL;
}

- (UIImage)placeholderImage
{
  return self->_imageWellImage;
}

- (NSDictionary)stillImageMetadata
{
  return 0;
}

- (NSString)burstIdentifier
{
  return 0;
}

- (unint64_t)numberOfRepresentedAssets
{
  return 0;
}

- (BOOL)isTransientAssetTemporaryPlaceholder
{
  return [(CAMVideoCaptureResponse *)self captureMode] == 7;
}

- (NSString)irisStillImageUUID
{
  return self->_stillPersistenceUUID;
}

- (BOOL)isExpectingPairedVideo
{
  return 0;
}

- (NSURL)irisVideoPersistenceURL
{
  return self->_localPersistenceURL;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)irisStillDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 152);
  return self;
}

- (CGSize)finalExpectedPixelSize
{
  double width = self->_finalExpectedPixelSize.width;
  double height = self->_finalExpectedPixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)captureMode
{
  return self->_captureMode;
}

- (NSString)persistenceUUID
{
  return self->_persistenceUUID;
}

- (NSURL)localPersistenceURL
{
  return self->_localPersistenceURL;
}

- (NSDate)captureDate
{
  return self->_captureDate;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 128);
  return self;
}

- (int64_t)reason
{
  return self->_reason;
}

- (BOOL)slowWriterFrameDrops
{
  return self->_slowWriterFrameDrops;
}

- (double)videoZoomFactor
{
  return self->_videoZoomFactor;
}

- (UIImage)imageWellImage
{
  return self->_imageWellImage;
}

- (UIImage)previewImage
{
  return self->_previewImage;
}

- (NSString)stillPersistenceUUID
{
  return self->_stillPersistenceUUID;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 152);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stillPersistenceUUID, 0);
  objc_storeStrong((id *)&self->_previewImage, 0);
  objc_storeStrong((id *)&self->_imageWellImage, 0);
  objc_storeStrong((id *)&self->_captureDate, 0);
  objc_storeStrong((id *)&self->_localPersistenceURL, 0);
  objc_storeStrong((id *)&self->_persistenceUUID, 0);
}

@end