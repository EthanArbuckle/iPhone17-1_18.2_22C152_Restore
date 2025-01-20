@interface CAMVideoPersistenceResponse
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillDisplayTime;
- (BOOL)isExpectingPairedVideo;
- (BOOL)isTransientAssetTemporaryPlaceholder;
- (CAMVideoPersistenceResponse)initWithUUID:(id)a3 captureMode:(int64_t)a4 captureSession:(unsigned __int16)a5 url:(id)a6 creationDate:(id)a7 scrubberImage:(id)a8 finalExpectedPixelSize:(CGSize)a9 duration:(id *)a10 stillPersistenceUUID:(id)a11 stillDisplayTime:(id *)a12 coordinationInfo:(id)a13;
- (NSDictionary)stillImageMetadata;
- (NSString)burstIdentifier;
- (NSString)stillPersistenceUUID;
- (int64_t)captureMode;
- (unint64_t)mediaSubtypes;
- (unint64_t)mediaType;
- (unint64_t)numberOfRepresentedAssets;
@end

@implementation CAMVideoPersistenceResponse

- (CAMVideoPersistenceResponse)initWithUUID:(id)a3 captureMode:(int64_t)a4 captureSession:(unsigned __int16)a5 url:(id)a6 creationDate:(id)a7 scrubberImage:(id)a8 finalExpectedPixelSize:(CGSize)a9 duration:(id *)a10 stillPersistenceUUID:(id)a11 stillDisplayTime:(id *)a12 coordinationInfo:(id)a13
{
  double height = a9.height;
  double width = a9.width;
  uint64_t v18 = a5;
  id v22 = a11;
  v31.receiver = self;
  v31.super_class = (Class)CAMVideoPersistenceResponse;
  v23 = -[CAMPersistenceResponse initWithUUID:captureSession:url:creationDate:scrubberImage:pixelSize:coordinationInfo:](&v31, sel_initWithUUID_captureSession_url_creationDate_scrubberImage_pixelSize_coordinationInfo_, a3, v18, a6, a7, a8, a13, width, height);
  v24 = (CAMVideoPersistenceResponse *)v23;
  if (v23)
  {
    *((void *)v23 + 9) = a4;
    long long v25 = *(_OWORD *)&a10->var0;
    *((void *)v23 + 13) = a10->var3;
    *(_OWORD *)(v23 + 88) = v25;
    uint64_t v26 = [v22 copy];
    stillPersistenceUUID = v24->_stillPersistenceUUID;
    v24->_stillPersistenceUUID = (NSString *)v26;

    int64_t var3 = a12->var3;
    *(_OWORD *)&v24->_stillDisplayTime.value = *(_OWORD *)&a12->var0;
    v24->_stillDisplayTime.epoch = var3;
    v29 = v24;
  }

  return v24;
}

- (unint64_t)mediaType
{
  return 2;
}

- (unint64_t)mediaSubtypes
{
  return 0;
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
  return [(CAMVideoPersistenceResponse *)self captureMode] == 7;
}

- (BOOL)isExpectingPairedVideo
{
  return 0;
}

- (int64_t)captureMode
{
  return self->_captureMode;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 88);
  return self;
}

- (NSString)stillPersistenceUUID
{
  return self->_stillPersistenceUUID;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 112);
  return self;
}

- (void).cxx_destruct
{
}

@end