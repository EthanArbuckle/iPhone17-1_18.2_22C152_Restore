@interface DYEAGLPlaybackEngine
- (BOOL)layerHasSameProperties:(id)a3 layer:(id)a4;
- (id)newFunctionPlayer;
- (id)newLayer;
- (void)setProperties:(id)a3 forLayer:(id)a4;
@end

@implementation DYEAGLPlaybackEngine

- (id)newFunctionPlayer
{
  v3 = [DYEAGLFunctionPlayer alloc];
  v4 = [(DYEAGLPlaybackEngine *)self captureStore];
  v5 = [(DYEAGLFunctionPlayer *)v3 initWithCaptureStore:v4];

  [(DYEAGLFunctionPlayer *)v5 setLayerManager:self];
  return v5;
}

- (id)newLayer
{
  return (id)objc_opt_new();
}

- (BOOL)layerHasSameProperties:(id)a3 layer:(id)a4
{
  id v5 = a3;
  v6 = [a4 drawableProperties];
  unsigned __int8 v7 = [v6 isEqualToDictionary:v5];

  return v7;
}

- (void)setProperties:(id)a3 forLayer:(id)a4
{
}

@end