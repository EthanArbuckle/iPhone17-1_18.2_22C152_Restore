@interface DYEAGLDebugPlaybackEngine
- (BOOL)enableDrawCallPresent;
- (BOOL)enableOutlinePresent;
- (BOOL)enableWireframePresent;
- (BOOL)shouldPerformPlaybackLoopIteration:(unsigned int)a3;
- (DYEAGLDebugPlaybackEngine)initWithCaptureStore:(id)a3;
- (DYEAGLDebugPlaybackEngineDelegate)delegate;
- (DYEAGLDebugPlaybackEngineDelegate)strongDelegate;
- (NSMutableIndexSet)disabledFunctions;
- (float)tessellationWireframeLineWidth;
- (float)wireframeLineWidth;
- (id)newFunctionPlayer;
- (id)playbackOptions;
- (unsigned)executedDrawCallCount;
- (unsigned)playbackMode;
- (unsigned)wireframeLineColor;
- (void)performPlaybackLoopIterationPostCaptureActions:(unsigned int)a3;
- (void)performPlaybackLoopIterationPreCaptureActions:(unsigned int)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableDrawCallPresent:(BOOL)a3;
- (void)setEnableOutlinePresent:(BOOL)a3;
- (void)setEnableWireframePresent:(BOOL)a3;
- (void)setExecutedDrawCallCount:(unsigned int)a3;
- (void)setPlaybackMode:(unsigned int)a3;
- (void)setTessellationWireframeLineWidth:(float)a3;
- (void)setWireframeLineColor:(unsigned int)a3;
- (void)setWireframeLineWidth:(float)a3;
@end

@implementation DYEAGLDebugPlaybackEngine

- (DYEAGLDebugPlaybackEngine)initWithCaptureStore:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DYEAGLDebugPlaybackEngine;
  v5 = [(DYEAGLDebugPlaybackEngine *)&v12 initWithCaptureStore:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    disabledFunctions = v5->_disabledFunctions;
    v5->_disabledFunctions = (NSMutableIndexSet *)v6;

    LODWORD(v8) = 1.0;
    [(DYEAGLDebugPlaybackEngine *)v5 setWireframeLineWidth:v8];
    LODWORD(v9) = 1.0;
    [(DYEAGLDebugPlaybackEngine *)v5 setTessellationWireframeLineWidth:v9];
    [(DYEAGLDebugPlaybackEngine *)v5 setWireframeLineColor:16711935];
    v5->_enableDrawCallPresent = 1;
    [(DYEAGLDebugPlaybackEngine *)v5 setEnableWireframePresent:1];
    v10 = v5;
  }

  return v5;
}

- (id)playbackOptions
{
  return 0;
}

- (DYEAGLDebugPlaybackEngineDelegate)strongDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DYEAGLDebugPlaybackEngineDelegate *)WeakRetained;
}

- (id)newFunctionPlayer
{
  v3 = [DYEAGLDebugFunctionPlayer alloc];
  id v4 = [(DYEAGLDebugPlaybackEngine *)self captureStore];
  v5 = [(DYEAGLDebugFunctionPlayer *)v3 initWithCaptureStore:v4];

  [(DYEAGLFunctionPlayer *)v5 setLayerManager:self];
  return v5;
}

- (void)setDelegate:(id)a3
{
}

- (void)performPlaybackLoopIterationPreCaptureActions:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v6 = [(DYEAGLDebugPlaybackEngine *)self strongDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(DYEAGLDebugPlaybackEngine *)self strongDelegate];
    [v7 performPlaybackLoopIterationPreCaptureActions:v3];

    id v8 = [(DYEAGLDebugPlaybackEngine *)self strongDelegate];
    [v8 shouldReturn];
  }
}

- (void)performPlaybackLoopIterationPostCaptureActions:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v6 = [(DYEAGLDebugPlaybackEngine *)self strongDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(DYEAGLDebugPlaybackEngine *)self strongDelegate];
    [v7 performPlaybackLoopIterationPostCaptureActions:v3];

    id v8 = [(DYEAGLDebugPlaybackEngine *)self strongDelegate];
    [v8 shouldReturn];
  }
}

- (BOOL)shouldPerformPlaybackLoopIteration:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  char v5 = [(DYEAGLDebugPlaybackEngine *)self strongDelegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 1;
  }
  id v7 = [(DYEAGLDebugPlaybackEngine *)self strongDelegate];
  unsigned __int8 v8 = [v7 shouldPerformPlaybackLoopIteration:v3];

  double v9 = [(DYEAGLDebugPlaybackEngine *)self strongDelegate];
  unsigned __int8 v10 = [v9 shouldReturn];

  if ((v10 & 1) == 0) {
    return 1;
  }
  return v8;
}

- (NSMutableIndexSet)disabledFunctions
{
  return self->_disabledFunctions;
}

- (BOOL)enableDrawCallPresent
{
  return self->_enableDrawCallPresent;
}

- (void)setEnableDrawCallPresent:(BOOL)a3
{
  self->_enableDrawCallPresent = a3;
}

- (DYEAGLDebugPlaybackEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DYEAGLDebugPlaybackEngineDelegate *)WeakRetained;
}

- (unsigned)playbackMode
{
  return self->_playbackMode;
}

- (void)setPlaybackMode:(unsigned int)a3
{
  self->_playbackMode = a3;
}

- (unsigned)executedDrawCallCount
{
  return self->_executedDrawCallCount;
}

- (void)setExecutedDrawCallCount:(unsigned int)a3
{
  self->_executedDrawCallCount = a3;
}

- (unsigned)wireframeLineColor
{
  return self->_wireframeLineColor;
}

- (void)setWireframeLineColor:(unsigned int)a3
{
  self->_wireframeLineColor = a3;
}

- (float)wireframeLineWidth
{
  return self->_wireframeLineWidth;
}

- (void)setWireframeLineWidth:(float)a3
{
  self->_wireframeLineWidth = a3;
}

- (float)tessellationWireframeLineWidth
{
  return self->_tessellationWireframeLineWidth;
}

- (void)setTessellationWireframeLineWidth:(float)a3
{
  self->_tessellationWireframeLineWidth = a3;
}

- (BOOL)enableWireframePresent
{
  return self->_enableWireframePresent;
}

- (void)setEnableWireframePresent:(BOOL)a3
{
  self->_enableWireframePresent = a3;
}

- (BOOL)enableOutlinePresent
{
  return self->_enableOutlinePresent;
}

- (void)setEnableOutlinePresent:(BOOL)a3
{
  self->_enableOutlinePresent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_disabledFunctions, 0);
}

@end