@interface FigCaptureMovieFileSinkMiddlePipelineConfiguration
- (BWPipelineStage)movieFilePipelineStage;
- (FigCaptureMovieFileSinkMiddlePipelineConfiguration)init;
- (FigCaptureMovieFileSinkPipelineConfiguration)movieFileSinkPipelineConfiguration;
- (void)dealloc;
- (void)setMovieFilePipelineStage:(id)a3;
- (void)setMovieFileSinkPipelineConfiguration:(id)a3;
@end

@implementation FigCaptureMovieFileSinkMiddlePipelineConfiguration

- (void)setMovieFileSinkPipelineConfiguration:(id)a3
{
}

- (void)setMovieFilePipelineStage:(id)a3
{
}

- (BWPipelineStage)movieFilePipelineStage
{
  return self->_movieFilePipelineStage;
}

- (FigCaptureMovieFileSinkMiddlePipelineConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkMiddlePipelineConfiguration;
  return [(FigCaptureMovieFileSinkMiddlePipelineConfiguration *)&v3 init];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkMiddlePipelineConfiguration;
  [(FigCaptureMovieFileSinkMiddlePipelineConfiguration *)&v3 dealloc];
}

- (FigCaptureMovieFileSinkPipelineConfiguration)movieFileSinkPipelineConfiguration
{
  return self->_movieFileSinkPipelineConfiguration;
}

@end