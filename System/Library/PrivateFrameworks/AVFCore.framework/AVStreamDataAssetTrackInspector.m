@interface AVStreamDataAssetTrackInspector
- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange;
- (BOOL)isEnabled;
- (CGSize)dimensions;
- (CGSize)naturalSize;
- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5;
- (id)formatDescriptions;
- (id)mediaCharacteristics;
- (id)mediaType;
- (int)trackID;
- (unsigned)figMediaType;
- (void)dealloc;
@end

@implementation AVStreamDataAssetTrackInspector

- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)AVStreamDataAssetTrackInspector;
  id v7 = [(AVAssetTrackInspector *)&v10 _initWithAsset:a3 trackID:*(void *)&a4 trackIndex:a5];
  v8 = v7;
  if (v7)
  {
    *((_DWORD *)v7 + 10) = a4;
    *((void *)v7 + 4) = (id)[a3 _weakReference];
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVStreamDataAssetTrackInspector;
  [(AVAssetTrackInspector *)&v3 dealloc];
}

- (int)trackID
{
  return self->_trackID;
}

- (unsigned)figMediaType
{
  id v2 = [(AVStreamDataAssetTrackInspector *)self mediaType];
  return AVOSTypeForString(v2);
}

- (id)mediaType
{
  id v3 = [(AVWeakReference *)self->_weakReferenceToAsset referencedObject];
  uint64_t trackID = self->_trackID;
  return (id)[v3 mediaTypeForTrackID:trackID];
}

- (BOOL)isEnabled
{
  id v3 = objc_msgSend(-[AVWeakReference referencedObject](self->_weakReferenceToAsset, "referencedObject"), "parser");
  uint64_t trackID = self->_trackID;
  return [v3 shouldProvideMediaDataForTrackID:trackID];
}

- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange
{
  CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CMTime v4 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F0];
  return ($1CE2C3FC342086196D07C2B4E8C70800 *)CMTimeRangeMake((CMTimeRange *)retstr, &start, &v4);
}

- (CGSize)naturalSize
{
  id v3 = [(AVStreamDataAssetTrackInspector *)self formatDescriptions];
  if ([v3 count]
    && objc_msgSend(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"), "isEqual:", @"vide"))
  {
    CGSize PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions((CMVideoFormatDescriptionRef)[v3 firstObject], 1u, 1u);
    double height = PresentationDimensions.height;
    double width = PresentationDimensions.width;
  }
  else
  {
    double width = *MEMORY[0x1E4F1DB30];
    double height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)dimensions
{
  id v3 = [(AVStreamDataAssetTrackInspector *)self formatDescriptions];
  if ([v3 count]
    && objc_msgSend(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"), "isEqual:", @"vide"))
  {
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v3 firstObject]);
    double width = (double)Dimensions.width;
    double height = (double)Dimensions.height;
  }
  else
  {
    double width = *MEMORY[0x1E4F1DB30];
    double height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)formatDescriptions
{
  id v3 = [(AVWeakReference *)self->_weakReferenceToAsset referencedObject];
  uint64_t trackID = self->_trackID;
  return (id)[v3 formatDescriptionsForTrackID:trackID];
}

- (id)mediaCharacteristics
{
  if (objc_msgSend(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"), "isEqualToString:", @"vide"))
  {
    id v3 = (void *)MEMORY[0x1E4F1C978];
    CMTime v4 = &AVMediaCharacteristicFrameBased;
LABEL_3:
    v5 = (__CFString *)*v4;
    objc_super v10 = 0;
    return (id)objc_msgSend(v3, "arrayWithObjects:", @"AVMediaCharacteristicVisual", v5, v10, v11);
  }
  if (objc_msgSend(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"), "isEqualToString:", @"soun"))
  {
    v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = &AVMediaCharacteristicAudible;
    return (id)objc_msgSend(v6, "arrayWithObjects:", *v7, 0, v9, v11);
  }
  if (objc_msgSend(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"), "isEqualToString:", @"text"))goto LABEL_11; {
  if (objc_msgSend(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"), "isEqualToString:", @"clcp"))
  }
  {
    id v3 = (void *)MEMORY[0x1E4F1C978];
    CMTime v4 = &AVMediaCharacteristicLegible;
    goto LABEL_3;
  }
  if (objc_msgSend(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"), "isEqualToString:", @"sbtl"))
  {
LABEL_11:
    id v3 = (void *)MEMORY[0x1E4F1C978];
    v5 = @"AVMediaCharacteristicLegible";
    objc_super v10 = @"AVMediaCharacteristicFrameBased";
    uint64_t v11 = 0;
    return (id)objc_msgSend(v3, "arrayWithObjects:", @"AVMediaCharacteristicVisual", v5, v10, v11);
  }
  if (objc_msgSend(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"), "isEqualToString:", @"tmcd"))
  {
    v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = &AVMediaCharacteristicVisual;
    return (id)objc_msgSend(v6, "arrayWithObjects:", *v7, 0, v9, v11);
  }
  if (objc_msgSend(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"), "isEqualToString:", @"meta"))
  {
    v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = &AVMediaCharacteristicFrameBased;
    return (id)objc_msgSend(v6, "arrayWithObjects:", *v7, 0, v9, v11);
  }
  return 0;
}

@end