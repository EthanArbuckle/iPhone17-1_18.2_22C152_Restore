@interface ETMessageFrameRenderer
- (BOOL)finishedRendering;
- (CGImage)_createSceneImageForTime:(double)a3;
- (CGImage)_createSketchImageForTime:(double)a3;
- (CGImage)createImageForTime:(double)a3;
- (ETMessageFrameRenderer)initWithMessage:(id)a3 videoFrame:(CGRect)a4;
- (double)startTime;
- (void)messageDidStopPlaying:(id)a3;
- (void)setFinishedRendering:(BOOL)a3;
- (void)setStartTime:(double)a3;
@end

@implementation ETMessageFrameRenderer

- (ETMessageFrameRenderer)initWithMessage:(id)a3 videoFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ETMessageFrameRenderer;
  v11 = [(ETMessageFrameRenderer *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_message, a3);
    v12->_videoFrame.origin.CGFloat x = x;
    v12->_videoFrame.origin.CGFloat y = y;
    v12->_videoFrame.size.CGFloat width = width;
    v12->_videoFrame.size.CGFloat height = height;
    [v10 startDelay];
    v12->_startTime = v13;
    v14 = v12;
  }

  return v12;
}

- (CGImage)createImageForTime:(double)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_15798;
  v8[3] = &unk_24D00;
  v8[4] = self;
  v8[5] = &v9;
  *(double *)&v8[6] = a3;
  v3 = objc_retainBlock(v8);
  v4 = +[NSThread currentThread];
  unsigned int v5 = [v4 isMainThread];

  if (v5) {
    ((void (*)(void *))v3[2])(v3);
  }
  else {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v3);
  }
  v6 = (CGImage *)v10[3];

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (CGImage)_createSketchImageForTime:(double)a3
{
  if (self->_startTime > a3 || self->_finishedRendering) {
    return 0;
  }
  sketchView = self->_sketchView;
  if (!sketchView)
  {
    v7 = (ETGLSketchView *)objc_msgSend(objc_alloc((Class)ETGLSketchView), "initWithFrame:", self->_videoFrame.origin.x, self->_videoFrame.origin.y, self->_videoFrame.size.width, self->_videoFrame.size.height);
    v8 = self->_sketchView;
    self->_sketchView = v7;

    [(ETMessage *)self->_message setRenderingOffscreen:1];
    [(ETGLSketchView *)self->_sketchView setMessageData:self->_message];
    sketchView = self->_sketchView;
  }

  return (CGImage *)[(ETGLSketchView *)sketchView createImageForTime:a3];
}

- (CGImage)_createSceneImageForTime:(double)a3
{
  if (self->_startTime > a3 || self->_finishedRendering) {
    return 0;
  }
  scene = self->_scene;
  if (scene)
  {
    [(SKScene *)scene setPaused:0];
    v7 = self->_scene;
    double v8 = a3 - self->_startTime;
  }
  else
  {
    uint64_t v9 = (SKScene *)objc_msgSend(objc_alloc((Class)SKScene), "initWithSize:", self->_videoFrame.size.width, self->_videoFrame.size.height);
    id v10 = self->_scene;
    self->_scene = v9;

    if (([(ETMessage *)self->_message isRenderingOffscreenOpaque] & 1) == 0)
    {
      uint64_t v11 = self->_scene;
      uint64_t v12 = +[UIColor clearColor];
      double v13 = [v12 colorSpaceConvertedColor];
      [(SKScene *)v11 setBackgroundColor:v13];
    }
    -[SKScene setAnchorPoint:](self->_scene, "setAnchorPoint:", 0.5, 0.5);
    v14 = (SKView *)objc_msgSend(objc_alloc((Class)SKView), "initWithFrame:", self->_videoFrame.origin.x, self->_videoFrame.origin.y, self->_videoFrame.size.width, self->_videoFrame.size.height);
    sceneView = self->_sceneView;
    self->_sceneView = v14;

    [(SKView *)self->_sceneView presentScene:self->_scene];
    [(SKView *)self->_sceneView setPaused:1];
    [(ETMessage *)self->_message displayInScene:self->_scene];
    [(ETMessage *)self->_message setDelegate:self];
    [(SKScene *)self->_scene setPaused:0];
    v7 = self->_scene;
    double v8 = 0.0;
  }
  [(SKScene *)v7 _update:v8];
  [(SKScene *)self->_scene setPaused:1];
  objc_super v16 = [(SKView *)self->_sceneView textureFromNode:self->_scene];
  v17 = (CGImage *)[v16 _createCGImage];

  return v17;
}

- (void)messageDidStopPlaying:(id)a3
{
  [(SKView *)self->_sceneView presentScene:0];
  sceneView = self->_sceneView;
  self->_sceneView = 0;

  scene = self->_scene;
  self->_scene = 0;

  self->_finishedRendering = 1;
  sketchView = self->_sketchView;
  self->_sketchView = 0;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (BOOL)finishedRendering
{
  return self->_finishedRendering;
}

- (void)setFinishedRendering:(BOOL)a3
{
  self->_finishedRendering = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sketchView, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end