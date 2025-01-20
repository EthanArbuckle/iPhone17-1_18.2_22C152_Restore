@interface PHAsset(MediaAnalysisPhoto)
- (BOOL)mad_isNonLivePhotoImage;
- (uint64_t)vcp_isPano;
- (unint64_t)vcp_isLivePhoto;
- (unint64_t)vcp_isSdofPhoto;
@end

@implementation PHAsset(MediaAnalysisPhoto)

- (BOOL)mad_isNonLivePhotoImage
{
  return [a1 mediaType] == 1 && (objc_msgSend(a1, "mediaSubtypes") & 8) == 0;
}

- (uint64_t)vcp_isPano
{
  return [a1 mediaSubtypes] & 1;
}

- (unint64_t)vcp_isLivePhoto
{
  return ((unint64_t)[a1 mediaSubtypes] >> 3) & 1;
}

- (unint64_t)vcp_isSdofPhoto
{
  return ((unint64_t)[a1 mediaSubtypes] >> 4) & 1;
}

@end