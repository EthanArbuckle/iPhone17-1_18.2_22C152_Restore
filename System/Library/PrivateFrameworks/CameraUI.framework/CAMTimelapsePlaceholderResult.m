@interface CAMTimelapsePlaceholderResult
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)irisStillDisplayTime;
- (BOOL)isExpectingPairedVideo;
- (BOOL)isTransientAssetTemporaryPlaceholder;
- (CAMTimelapsePlaceholderResult)initWithAssetUUID:(id)a3 captureSession:(unsigned __int16)a4 creationDate:(id)a5 captureOrientation:(int64_t)a6 captureDevice:(int64_t)a7 videoDimensions:(CGSize)a8 duration:(double)a9 previewImageSurface:(void *)a10 localPrivateMetadataFileURL:(id)a11;
- (CGSize)finalExpectedPixelSize;
- (CGSize)videoDimensions;
- (NSDate)creationDate;
- (NSDictionary)stillImageMetadata;
- (NSString)assetUUID;
- (NSString)burstIdentifier;
- (NSString)irisStillImageUUID;
- (NSURL)irisVideoPersistenceURL;
- (NSURL)localPrivateMetadataFileURL;
- (NSURL)persistenceURL;
- (UIImage)placeholderImage;
- (double)timelapseDuration;
- (int64_t)captureDevice;
- (int64_t)captureOrientation;
- (unint64_t)mediaSubtypes;
- (unint64_t)mediaType;
- (unint64_t)numberOfRepresentedAssets;
- (unsigned)sessionIdentifier;
- (void)dealloc;
- (void)previewImageSurface;
@end

@implementation CAMTimelapsePlaceholderResult

- (CAMTimelapsePlaceholderResult)initWithAssetUUID:(id)a3 captureSession:(unsigned __int16)a4 creationDate:(id)a5 captureOrientation:(int64_t)a6 captureDevice:(int64_t)a7 videoDimensions:(CGSize)a8 duration:(double)a9 previewImageSurface:(void *)a10 localPrivateMetadataFileURL:(id)a11
{
  CGFloat height = a8.height;
  CGFloat width = a8.width;
  id v20 = a3;
  id v21 = a5;
  id v22 = a11;
  v30.receiver = self;
  v30.super_class = (Class)CAMTimelapsePlaceholderResult;
  v23 = [(CAMTimelapsePlaceholderResult *)&v30 init];
  if (v23)
  {
    uint64_t v24 = [v20 copy];
    assetUUID = v23->_assetUUID;
    v23->_assetUUID = (NSString *)v24;

    v23->_sessionIdentifier = a4;
    objc_storeStrong((id *)&v23->_creationDate, a5);
    v23->_captureOrientation = a6;
    v23->_captureDevice = a7;
    v23->_videoDimensions.CGFloat width = width;
    v23->_videoDimensions.CGFloat height = height;
    v23->_timelapseDuration = a9;
    if (a10)
    {
      v23->_previewImageSurface = a10;
      CFRetain(a10);
    }
    uint64_t v26 = [v22 copy];
    localPrivateMetadataFileURL = v23->_localPrivateMetadataFileURL;
    v23->_localPrivateMetadataFileURL = (NSURL *)v26;

    v28 = v23;
  }

  return v23;
}

- (void)dealloc
{
  previewImageSurface = self->_previewImageSurface;
  if (previewImageSurface)
  {
    CFRelease(previewImageSurface);
    self->_previewImageSurface = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CAMTimelapsePlaceholderResult;
  [(CAMTimelapsePlaceholderResult *)&v4 dealloc];
}

- (unint64_t)mediaType
{
  return 2;
}

- (unint64_t)mediaSubtypes
{
  return 0x40000;
}

- (NSURL)persistenceURL
{
  return 0;
}

- (UIImage)placeholderImage
{
  v2 = [(CAMTimelapsePlaceholderResult *)self previewImageSurface];
  if (v2) {
    v2 = (void *)[objc_alloc(MEMORY[0x263F827E8]) _initWithIOSurface:v2 scale:0 orientation:1.0];
  }
  return (UIImage *)v2;
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

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x263F010E0];
  return self;
}

- (CGSize)finalExpectedPixelSize
{
  double width = self->_videoDimensions.width;
  double height = self->_videoDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)irisStillImageUUID
{
  return 0;
}

- (BOOL)isExpectingPairedVideo
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
  return 1;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (int64_t)captureOrientation
{
  return self->_captureOrientation;
}

- (int64_t)captureDevice
{
  return self->_captureDevice;
}

- (CGSize)videoDimensions
{
  double width = self->_videoDimensions.width;
  double height = self->_videoDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)timelapseDuration
{
  return self->_timelapseDuration;
}

- (void)previewImageSurface
{
  return self->_previewImageSurface;
}

- (NSURL)localPrivateMetadataFileURL
{
  return self->_localPrivateMetadataFileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localPrivateMetadataFileURL, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
}

@end