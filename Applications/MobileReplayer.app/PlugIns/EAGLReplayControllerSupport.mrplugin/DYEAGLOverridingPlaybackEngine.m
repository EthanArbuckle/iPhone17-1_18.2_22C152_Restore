@interface DYEAGLOverridingPlaybackEngine
- (BOOL)shouldPerformPlaybackLoopIteration:(unsigned int)a3;
- (DYEAGLOverridingPlaybackEngine)initWithCaptureStore:(id)a3 experimentResultsGenerator:(id)a4;
- (DYGLExperimentResultsGenerator)experimentResultsGenerator;
- (id)newFunctionPlayer;
- (void)performPlaybackLoopIterationPostCaptureActions:(unsigned int)a3;
- (void)performPlaybackLoopIterationPreCaptureActions:(unsigned int)a3;
@end

@implementation DYEAGLOverridingPlaybackEngine

- (DYEAGLOverridingPlaybackEngine)initWithCaptureStore:(id)a3 experimentResultsGenerator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DYEAGLOverridingPlaybackEngine;
  v8 = [(DYEAGLOverridingPlaybackEngine *)&v17 initWithCaptureStore:v6];
  v9 = v8;
  if (v8)
  {
    p_experimentResultsGenerator = (id *)&v8->_experimentResultsGenerator;
    objc_storeStrong((id *)&v8->_experimentResultsGenerator, a4);
    v11 = [(DYEAGLPlaybackEngine *)v9 eaglPlayer];
    [*p_experimentResultsGenerator setFunctionPlayer:v11];

    v12 = [*p_experimentResultsGenerator experiment];
    unsigned int v13 = [v12 warmupCount];
    v14 = [*p_experimentResultsGenerator experiment];
    -[DYEAGLOverridingPlaybackEngine setLoopCount:](v9, "setLoopCount:", [v14 repeatCount] + v13);

    v15 = v9;
  }

  return v9;
}

- (id)newFunctionPlayer
{
  v3 = [DYEAGLOverridingFunctionPlayer alloc];
  v4 = [(DYEAGLOverridingPlaybackEngine *)self captureStore];
  v5 = [(DYEAGLOverridingFunctionPlayer *)v3 initWithCaptureStore:v4];

  [(DYEAGLFunctionPlayer *)v5 setLayerManager:self];
  return v5;
}

- (void)performPlaybackLoopIterationPreCaptureActions:(unsigned int)a3
{
}

- (void)performPlaybackLoopIterationPostCaptureActions:(unsigned int)a3
{
}

- (BOOL)shouldPerformPlaybackLoopIteration:(unsigned int)a3
{
  return [(DYGLExperimentResultsGenerator *)self->_experimentResultsGenerator isDone] ^ 1;
}

- (DYGLExperimentResultsGenerator)experimentResultsGenerator
{
  return self->_experimentResultsGenerator;
}

- (void).cxx_destruct
{
}

@end