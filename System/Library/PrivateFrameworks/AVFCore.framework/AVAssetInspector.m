@interface AVAssetInspector
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumTimeOffsetFromLive;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)overallDurationHint;
- (AVDisplayCriteria)preferredDisplayCriteria;
- (AVMetadataItem)creationDate;
- (BOOL)_isDefunct;
- (BOOL)canContainFragments;
- (BOOL)containsFragments;
- (BOOL)hasProtectedContent;
- (BOOL)isCompatibleWithAirPlayVideo;
- (BOOL)isCompatibleWithPhotosTranscodingServiceWithOptions:(id)a3;
- (BOOL)isCompatibleWithSavedPhotosAlbum;
- (BOOL)isComposable;
- (BOOL)isExportable;
- (BOOL)isPlayable;
- (BOOL)isReadable;
- (BOOL)providesPreciseDurationAndTiming;
- (BOOL)supportsAnalysisReporting;
- (CGAffineTransform)preferredTransform;
- (CGSize)maximumVideoResolution;
- (CGSize)naturalSize;
- (NSArray)_assetAnalysisMessages;
- (NSArray)_mediaSelectionGroupDictionaries;
- (NSArray)alternateTrackGroups;
- (NSArray)availableMetadataFormats;
- (NSArray)availableVideoDynamicRanges;
- (NSArray)commonMetadata;
- (NSArray)trackIDs;
- (NSData)SHA1Digest;
- (NSDictionary)_localizedMediaSelectionOptionDisplayNames;
- (NSDictionary)trackReferences;
- (NSString)identifyingTag;
- (NSString)identifyingTagClass;
- (NSString)lyrics;
- (NSUUID)httpSessionIdentifier;
- (float)preferredRate;
- (float)preferredSoundCheckVolumeNormalization;
- (float)preferredVolume;
- (id)makePropertyListForProxyWithOptions:(id)a3;
- (id)metadataForFormat:(id)a3;
- (id)propertyListForProxy;
- (int)naturalTimeScale;
- (int64_t)_moovAtomSize;
- (int64_t)firstFragmentSequenceNumber;
- (int64_t)fragmentCount;
- (int64_t)trackCount;
@end

@implementation AVAssetInspector

- (NSArray)trackIDs
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  v6 = (objc_class *)objc_opt_class();
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)AVRequestConcreteImplementation((objc_class *)self, a3, v6);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  return result;
}

- (float)preferredRate
{
  return 1.0;
}

- (float)preferredVolume
{
  return 1.0;
}

- (float)preferredSoundCheckVolumeNormalization
{
  return 0.0;
}

- (CGAffineTransform)preferredTransform
{
  uint64_t v3 = MEMORY[0x1E4F1DAB8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumTimeOffsetFromLive
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  return self;
}

- (CGSize)naturalSize
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int)naturalTimeScale
{
  return 600;
}

- (BOOL)providesPreciseDurationAndTiming
{
  return 0;
}

- (int64_t)trackCount
{
  return 0;
}

- (NSArray)alternateTrackGroups
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (NSDictionary)trackReferences
{
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionary];
}

- (NSArray)_mediaSelectionGroupDictionaries
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (NSDictionary)_localizedMediaSelectionOptionDisplayNames
{
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionary];
}

- (AVMetadataItem)creationDate
{
  return 0;
}

- (NSString)lyrics
{
  return 0;
}

- (NSArray)commonMetadata
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (NSArray)availableMetadataFormats
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (id)metadataForFormat:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "array", a3);
}

- (NSString)identifyingTagClass
{
  return 0;
}

- (NSString)identifyingTag
{
  return 0;
}

- (NSUUID)httpSessionIdentifier
{
  return 0;
}

- (BOOL)hasProtectedContent
{
  return 0;
}

- (BOOL)isPlayable
{
  return 0;
}

- (BOOL)isCompatibleWithPhotosTranscodingServiceWithOptions:(id)a3
{
  return 0;
}

- (BOOL)isExportable
{
  return 0;
}

- (BOOL)isReadable
{
  return 0;
}

- (BOOL)isComposable
{
  return 0;
}

- (BOOL)isCompatibleWithSavedPhotosAlbum
{
  return 0;
}

- (BOOL)isCompatibleWithAirPlayVideo
{
  return 0;
}

- (NSData)SHA1Digest
{
  return 0;
}

- (BOOL)canContainFragments
{
  return 0;
}

- (BOOL)containsFragments
{
  return 0;
}

- (int64_t)firstFragmentSequenceNumber
{
  return 0;
}

- (int64_t)fragmentCount
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)overallDurationHint
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  return self;
}

- (BOOL)supportsAnalysisReporting
{
  return 0;
}

- (NSArray)_assetAnalysisMessages
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (int64_t)_moovAtomSize
{
  return 0;
}

- (id)propertyListForProxy
{
  return 0;
}

- (id)makePropertyListForProxyWithOptions:(id)a3
{
  return 0;
}

- (BOOL)_isDefunct
{
  return 0;
}

- (CGSize)maximumVideoResolution
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSArray)availableVideoDynamicRanges
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (AVDisplayCriteria)preferredDisplayCriteria
{
  double v2 = [[AVDisplayCriteria alloc] initWithRefreshRate:0 videoDynamicRange:0.0];
  return v2;
}

@end