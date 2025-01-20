@interface AVAssetWriterInputConfigurationState
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredMediaChunkDuration;
- (AVOutputSettings)outputSettings;
- (BOOL)expectsMediaDataInRealTime;
- (BOOL)marksOutputTrackAsEnabled;
- (BOOL)maximizePowerEfficiency;
- (BOOL)performsMultiPassEncodingIfSupported;
- (CGAffineTransform)transform;
- (CGSize)naturalSize;
- (NSArray)metadataItems;
- (NSDictionary)sourcePixelBufferAttributes;
- (NSDictionary)trackReferences;
- (NSString)extendedLanguageTag;
- (NSString)languageCode;
- (NSString)mediaDataLocation;
- (NSString)mediaType;
- (NSURL)sampleReferenceBaseURL;
- (float)preferredVolume;
- (int)mediaTimeScale;
- (int)trackID;
- (int64_t)layer;
- (int64_t)preferredMediaChunkAlignment;
- (int64_t)preferredMediaChunkSize;
- (opaqueCMFormatDescription)sourceFormatHint;
- (signed)alternateGroupID;
- (signed)provisionalAlternateGroupID;
- (void)dealloc;
- (void)setAlternateGroupID:(signed __int16)a3;
- (void)setExpectsMediaDataInRealTime:(BOOL)a3;
- (void)setExtendedLanguageTag:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLayer:(int64_t)a3;
- (void)setMarksOutputTrackAsEnabled:(BOOL)a3;
- (void)setMaximizePowerEfficiency:(BOOL)a3;
- (void)setMediaDataLocation:(id)a3;
- (void)setMediaTimeScale:(int)a3;
- (void)setMediaType:(id)a3;
- (void)setMetadataItems:(id)a3;
- (void)setNaturalSize:(CGSize)a3;
- (void)setOutputSettings:(id)a3;
- (void)setPerformsMultiPassEncodingIfSupported:(BOOL)a3;
- (void)setPreferredMediaChunkAlignment:(int64_t)a3;
- (void)setPreferredMediaChunkDuration:(id *)a3;
- (void)setPreferredMediaChunkSize:(int64_t)a3;
- (void)setPreferredVolume:(float)a3;
- (void)setProvisionalAlternateGroupID:(signed __int16)a3;
- (void)setSampleReferenceBaseURL:(id)a3;
- (void)setSourceFormatHint:(opaqueCMFormatDescription *)a3;
- (void)setSourcePixelBufferAttributes:(id)a3;
- (void)setTrackID:(int)a3;
- (void)setTrackReferences:(id)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation AVAssetWriterInputConfigurationState

- (void)dealloc
{
  sourceFormatHint = self->_sourceFormatHint;
  if (sourceFormatHint) {
    CFRelease(sourceFormatHint);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVAssetWriterInputConfigurationState;
  [(AVAssetWriterInputConfigurationState *)&v4 dealloc];
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
}

- (AVOutputSettings)outputSettings
{
  return self->_outputSettings;
}

- (void)setOutputSettings:(id)a3
{
}

- (opaqueCMFormatDescription)sourceFormatHint
{
  return self->_sourceFormatHint;
}

- (void)setSourceFormatHint:(opaqueCMFormatDescription *)a3
{
}

- (int)trackID
{
  return self->_trackID;
}

- (void)setTrackID:(int)a3
{
  self->_trackID = a3;
}

- (NSDictionary)sourcePixelBufferAttributes
{
  return self->_sourcePixelBufferAttributes;
}

- (void)setSourcePixelBufferAttributes:(id)a3
{
}

- (NSArray)metadataItems
{
  return self->_metadataItems;
}

- (void)setMetadataItems:(id)a3
{
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].ty;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (int)mediaTimeScale
{
  return self->_mediaTimeScale;
}

- (void)setMediaTimeScale:(int)a3
{
  self->_mediaTimeScale = a3;
}

- (BOOL)expectsMediaDataInRealTime
{
  return self->_expectsMediaDataInRealTime;
}

- (void)setExpectsMediaDataInRealTime:(BOOL)a3
{
  self->_expectsMediaDataInRealTime = a3;
}

- (CGSize)naturalSize
{
  double width = self->_naturalSize.width;
  double height = self->_naturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  self->_naturalSize = a3;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)extendedLanguageTag
{
  return self->_extendedLanguageTag;
}

- (void)setExtendedLanguageTag:(id)a3
{
}

- (BOOL)marksOutputTrackAsEnabled
{
  return self->_marksOutputTrackAsEnabled;
}

- (void)setMarksOutputTrackAsEnabled:(BOOL)a3
{
  self->_marksOutputTrackAsEnabled = a3;
}

- (float)preferredVolume
{
  return self->_preferredVolume;
}

- (void)setPreferredVolume:(float)a3
{
  self->_preferredVolume = a3;
}

- (int64_t)layer
{
  return self->_layer;
}

- (void)setLayer:(int64_t)a3
{
  self->_layer = a3;
}

- (signed)alternateGroupID
{
  return self->_alternateGroupID;
}

- (void)setAlternateGroupID:(signed __int16)a3
{
  self->_alternateGroupID = a3;
}

- (signed)provisionalAlternateGroupID
{
  return self->_provisionalAlternateGroupID;
}

- (void)setProvisionalAlternateGroupID:(signed __int16)a3
{
  self->_provisionalAlternateGroupID = a3;
}

- (NSDictionary)trackReferences
{
  return self->_trackReferences;
}

- (void)setTrackReferences:(id)a3
{
}

- (BOOL)performsMultiPassEncodingIfSupported
{
  return self->_performsMultiPassEncodingIfSupported;
}

- (void)setPerformsMultiPassEncodingIfSupported:(BOOL)a3
{
  self->_performsMultiPassEncodingIfSupported = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredMediaChunkDuration
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[7].var2;
  retstr->var3 = *(int64_t *)((char *)&self[8].var0 + 4);
  return self;
}

- (void)setPreferredMediaChunkDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_chunkDuration.flags = a3->var3;
  *(_OWORD *)(&self->_performsMultiPassEncodingIfSupported + 4) = v3;
}

- (int64_t)preferredMediaChunkAlignment
{
  return self->_chunkAlignment;
}

- (void)setPreferredMediaChunkAlignment:(int64_t)a3
{
  self->_chunkAlignment = a3;
}

- (int64_t)preferredMediaChunkSize
{
  return self->_chunkSize;
}

- (void)setPreferredMediaChunkSize:(int64_t)a3
{
  self->_chunkSize = a3;
}

- (NSString)mediaDataLocation
{
  return self->_mediaDataLocation;
}

- (void)setMediaDataLocation:(id)a3
{
}

- (NSURL)sampleReferenceBaseURL
{
  return self->_sampleReferenceBaseURL;
}

- (void)setSampleReferenceBaseURL:(id)a3
{
}

- (BOOL)maximizePowerEfficiency
{
  return self->_maximizePowerEfficiency;
}

- (void)setMaximizePowerEfficiency:(BOOL)a3
{
  self->_maximizePowerEfficiency = a3;
}

@end