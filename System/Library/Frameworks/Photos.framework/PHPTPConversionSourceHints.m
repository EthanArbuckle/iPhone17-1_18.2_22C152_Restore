@interface PHPTPConversionSourceHints
+ (id)hintsForPTPAsset:(id)a3 isVideo:(BOOL)a4 isRender:(BOOL)a5;
- (BOOL)isLivePhoto;
- (BOOL)isRender;
- (BOOL)isVideo;
- (BOOL)livePhotoImageIsHEIC;
- (PHPTPConversionSourceHints)initWithPTPAsset:(id)a3 isVideo:(BOOL)a4 isRender:(BOOL)a5;
@end

@implementation PHPTPConversionSourceHints

- (void).cxx_destruct
{
}

- (BOOL)isLivePhoto
{
  return self->_isLivePhoto;
}

- (BOOL)isRender
{
  return self->_isRender;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (BOOL)livePhotoImageIsHEIC
{
  return self->_isLivePhoto
      && [(UTType *)self->_livePhotoImageContentType conformsToType:*MEMORY[0x1E4F443E0]];
}

- (PHPTPConversionSourceHints)initWithPTPAsset:(id)a3 isVideo:(BOOL)a4 isRender:(BOOL)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PHPTPConversionSourceHints;
  v9 = [(PHPTPConversionSourceHints *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_isVideo = a4;
    v9->_isRender = a5;
    if ([v8 isPhoto])
    {
      if ([v8 isPartOfLivePhoto])
      {
        v10->_isLivePhoto = 1;
        uint64_t v11 = [v8 contentType];
        livePhotoImageContentType = v10->_livePhotoImageContentType;
        v10->_livePhotoImageContentType = (UTType *)v11;
      }
    }
  }

  return v10;
}

+ (id)hintsForPTPAsset:(id)a3 isVideo:(BOOL)a4 isRender:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithPTPAsset:v8 isVideo:v6 isRender:v5];

  return v9;
}

@end