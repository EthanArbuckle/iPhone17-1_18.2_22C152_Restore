@interface FigCaptureMovieFileSinkTailPipelineConfiguration
- (BOOL)delayedCompressorCleanupEnabled;
- (BOOL)vitalityScoringEnabled;
- (BWNodeOutput)audioSourceOutput;
- (BWNodeOutput)cinematicAudioSourceOutput;
- (BWNodeOutput)videoSourceOutput;
- (BWPhotoDecompressorNode)irisIntermediateJPEGPhotoDecompressorNode;
- (BWPipelineStage)movieFilePipelineStage;
- (FigCaptureMovieFileSinkPipelineConfiguration)movieFileSinkPipelineConfiguration;
- (FigCaptureMovieFileSinkTailPipelineConfiguration)init;
- (NSArray)indexesOfDetectedObjectsInMetadataOutputs;
- (NSArray)metadataSourceOutputs;
- (int)indexOfAudioRemixInMetadataOutputs;
- (int)indexOfVideoOrientationInMetadataOutputs;
- (void)dealloc;
- (void)setAudioSourceOutput:(id)a3;
- (void)setCinematicAudioSourceOutput:(id)a3;
- (void)setDelayedCompressorCleanupEnabled:(BOOL)a3;
- (void)setIndexOfAudioRemixInMetadataOutputs:(int)a3;
- (void)setIndexOfVideoOrientationInMetadataOutputs:(int)a3;
- (void)setIndexesOfDetectedObjectsInMetadataOutputs:(id)a3;
- (void)setIrisIntermediateJPEGPhotoDecompressorNode:(id)a3;
- (void)setMetadataSourceOutputs:(id)a3;
- (void)setMovieFilePipelineStage:(id)a3;
- (void)setMovieFileSinkPipelineConfiguration:(id)a3;
- (void)setVideoSourceOutput:(id)a3;
- (void)setVitalityScoringEnabled:(BOOL)a3;
@end

@implementation FigCaptureMovieFileSinkTailPipelineConfiguration

- (void)setVitalityScoringEnabled:(BOOL)a3
{
  self->_vitalityScoringEnabled = a3;
}

- (void)setVideoSourceOutput:(id)a3
{
}

- (void)setMovieFileSinkPipelineConfiguration:(id)a3
{
}

- (void)setMovieFilePipelineStage:(id)a3
{
}

- (void)setMetadataSourceOutputs:(id)a3
{
}

- (void)setIrisIntermediateJPEGPhotoDecompressorNode:(id)a3
{
}

- (void)setIndexesOfDetectedObjectsInMetadataOutputs:(id)a3
{
}

- (void)setIndexOfVideoOrientationInMetadataOutputs:(int)a3
{
  self->_indexOfVideoOrientationInMetadataOutputs = a3;
}

- (void)setDelayedCompressorCleanupEnabled:(BOOL)a3
{
  self->_delayedCompressorCleanupEnabled = a3;
}

- (void)setCinematicAudioSourceOutput:(id)a3
{
}

- (void)setAudioSourceOutput:(id)a3
{
}

- (FigCaptureMovieFileSinkTailPipelineConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkTailPipelineConfiguration;
  result = [(FigCaptureMovieFileSinkTailPipelineConfiguration *)&v3 init];
  if (result) {
    result->_indexOfVideoOrientationInMetadataOutputs = -1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkTailPipelineConfiguration;
  [(FigCaptureMovieFileSinkTailPipelineConfiguration *)&v3 dealloc];
}

- (FigCaptureMovieFileSinkPipelineConfiguration)movieFileSinkPipelineConfiguration
{
  return self->_movieFileSinkPipelineConfiguration;
}

- (BWNodeOutput)videoSourceOutput
{
  return self->_videoSourceOutput;
}

- (BWPipelineStage)movieFilePipelineStage
{
  return self->_movieFilePipelineStage;
}

- (int)indexOfVideoOrientationInMetadataOutputs
{
  return self->_indexOfVideoOrientationInMetadataOutputs;
}

- (BWNodeOutput)cinematicAudioSourceOutput
{
  return self->_cinematicAudioSourceOutput;
}

- (BWNodeOutput)audioSourceOutput
{
  return self->_audioSourceOutput;
}

- (BOOL)vitalityScoringEnabled
{
  return self->_vitalityScoringEnabled;
}

- (NSArray)metadataSourceOutputs
{
  return self->_metadataSourceOutputs;
}

- (BWPhotoDecompressorNode)irisIntermediateJPEGPhotoDecompressorNode
{
  return self->_irisIntermediateJPEGPhotoDecompressorNode;
}

- (NSArray)indexesOfDetectedObjectsInMetadataOutputs
{
  return self->_indexesOfDetectedObjectsInMetadataOutputs;
}

- (BOOL)delayedCompressorCleanupEnabled
{
  return self->_delayedCompressorCleanupEnabled;
}

- (int)indexOfAudioRemixInMetadataOutputs
{
  return self->_indexOfAudioRemixInMetadataOutputs;
}

- (void)setIndexOfAudioRemixInMetadataOutputs:(int)a3
{
  self->_indexOfAudioRemixInMetadataOutputs = a3;
}

@end