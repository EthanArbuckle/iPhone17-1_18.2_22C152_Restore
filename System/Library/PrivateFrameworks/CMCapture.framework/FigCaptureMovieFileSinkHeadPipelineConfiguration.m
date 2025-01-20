@interface FigCaptureMovieFileSinkHeadPipelineConfiguration
- (BWPipelineStage)movieFilePipelineStage;
- (BWPipelineStage)transferPipelineStage;
- (FigCaptureMovieFileSinkPipelineConfiguration)movieFileSinkPipelineConfiguration;
- (int)visMotionMetadataPreloadingMode;
- (void)dealloc;
- (void)setMovieFilePipelineStage:(id)a3;
- (void)setMovieFileSinkPipelineConfiguration:(id)a3;
- (void)setTransferPipelineStage:(id)a3;
- (void)setVisMotionMetadataPreloadingMode:(int)a3;
@end

@implementation FigCaptureMovieFileSinkHeadPipelineConfiguration

- (FigCaptureMovieFileSinkPipelineConfiguration)movieFileSinkPipelineConfiguration
{
  return self->_movieFileSinkPipelineConfiguration;
}

- (BWPipelineStage)movieFilePipelineStage
{
  return self->_movieFilePipelineStage;
}

- (void)setTransferPipelineStage:(id)a3
{
}

- (void)setMovieFileSinkPipelineConfiguration:(id)a3
{
}

- (void)setMovieFilePipelineStage:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkHeadPipelineConfiguration;
  [(FigCaptureMovieFileSinkHeadPipelineConfiguration *)&v3 dealloc];
}

- (BWPipelineStage)transferPipelineStage
{
  return self->_transferPipelineStage;
}

- (int)visMotionMetadataPreloadingMode
{
  return self->_visMotionMetadataPreloadingMode;
}

- (void)setVisMotionMetadataPreloadingMode:(int)a3
{
  self->_visMotionMetadataPreloadingMode = a3;
}

@end