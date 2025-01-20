@interface DYEAGLOverridingFunctionPlayer
- (void)executeGraphicsFunction;
- (void)executePlatformFunction;
- (void)performNewFrameActions;
- (void)performPostDispatchFrameBoundaryActions;
- (void)setEngine:(id)a3;
@end

@implementation DYEAGLOverridingFunctionPlayer

- (void)setEngine:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DYEAGLOverridingFunctionPlayer;
  [(DYEAGLOverridingFunctionPlayer *)&v7 setEngine:v4];
  v5 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__engine] experimentResultsGenerator];
  experimentResultsGenerator = self->_experimentResultsGenerator;
  self->_experimentResultsGenerator = v5;
}

- (void)executeGraphicsFunction
{
  v3.receiver = self;
  v3.super_class = (Class)DYEAGLOverridingFunctionPlayer;
  [(DYEAGLOverridingFunctionPlayer *)&v3 executeGraphicsFunction];
  [(DYGLExperimentResultsGenerator *)self->_experimentResultsGenerator onGraphicsFunctionEnd];
}

- (void)executePlatformFunction
{
  if (**(_DWORD **)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function] == -12271)
  {
    DYHarvestRenderbuffer();
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)DYEAGLOverridingFunctionPlayer;
    [(DYEAGLFunctionPlayer *)&v3 executePlatformFunction];
  }
  [(DYGLExperimentResultsGenerator *)self->_experimentResultsGenerator onPlatformFunctionEnd];
}

- (void)performNewFrameActions
{
  v3.receiver = self;
  v3.super_class = (Class)DYEAGLOverridingFunctionPlayer;
  [(DYEAGLOverridingFunctionPlayer *)&v3 performNewFrameActions];
  [(DYGLExperimentResultsGenerator *)self->_experimentResultsGenerator onFrameStart];
}

- (void)performPostDispatchFrameBoundaryActions
{
  [(DYGLExperimentResultsGenerator *)self->_experimentResultsGenerator onFrameEnd];
  v3.receiver = self;
  v3.super_class = (Class)DYEAGLOverridingFunctionPlayer;
  [(DYEAGLOverridingFunctionPlayer *)&v3 performPostDispatchFrameBoundaryActions];
}

- (void).cxx_destruct
{
}

@end