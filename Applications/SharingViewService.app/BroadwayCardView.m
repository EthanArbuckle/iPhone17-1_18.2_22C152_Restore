@interface BroadwayCardView
- (BOOL)isPaused;
- (BroadwayCardView)initWithCoder:(id)a3;
- (CGSize)videoSizePoints;
- (id)materialPropertyWithContents:(id)a3;
- (id)playerForMovieAtURL:(id)a3 pointsSize:(CGSize *)a4 nominalFrameRate:(float *)a5;
- (void)addAnimationObserver:(id)a3;
- (void)configureModelGeometry;
- (void)configureVideo;
- (void)configureVideoGeometry;
- (void)dealloc;
- (void)notifyObserversWithCommandBuffer:(id)a3;
- (void)removeAnimationObserver:(id)a3;
- (void)renderer:(id)a3 updateAtTime:(double)a4;
- (void)renderer:(id)a3 willRenderScene:(id)a4 atTime:(double)a5;
- (void)setModelContents:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setVideoURL:(id)a3 sceneURL:(id)a4;
@end

@implementation BroadwayCardView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blackTexture, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_videoOutput, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_videoMaterialProperty, 0);
  objc_storeStrong((id *)&self->_videoMaterial, 0);
  objc_storeStrong((id *)&self->_videoGeometry, 0);
  objc_storeStrong((id *)&self->_modelMaterial, 0);
  objc_storeStrong((id *)&self->_modelGeometry, 0);
  objc_storeStrong((id *)&self->_modelNode, 0);
  objc_storeStrong((id *)&self->_cameraNode, 0);
  objc_storeStrong((id *)&self->_modelContents, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);

  objc_storeStrong((id *)&self->_animationObservers, 0);
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (CGSize)videoSizePoints
{
  double width = self->_videoSizePoints.width;
  double height = self->_videoSizePoints.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)materialPropertyWithContents:(id)a3
{
  v3 = +[SCNMaterialProperty materialPropertyWithContents:a3];
  [v3 setMipFilter:2];
  [v3 setMinificationFilter:2];
  [v3 setMagnificationFilter:2];

  return v3;
}

- (id)playerForMovieAtURL:(id)a3 pointsSize:(CGSize *)a4 nominalFrameRate:(float *)a5
{
  v7 = +[AVURLAsset URLAssetWithURL:a3 options:0];
  v8 = +[AVPlayerItem playerItemWithAsset:v7];
  v9 = +[AVPlayer playerWithPlayerItem:v8];
  [v9 setAllowsExternalPlayback:0];
  [v9 _setDisallowsAutoPauseOnRouteRemovalIfNoAudio:1];
  v10 = +[UIScreen mainScreen];
  [v10 scale];

  v11 = [v9 currentItem];
  v12 = [v11 asset];
  v13 = [v12 tracksWithMediaType:AVMediaTypeVideo];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (a4)
        {
          [*(id *)(*((void *)&v24 + 1) + 8 * i) naturalSize:v24];
          [v19 naturalSize];
          UISizeRoundToScale();
          a4->double width = v20;
          a4->double height = v21;
        }
        if (a5)
        {
          [v19 nominalFrameRate];
          *(_DWORD *)a5 = v22;
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }

  return v9;
}

- (void)configureModelGeometry
{
  v3 = +[SCNMaterial material];
  modelMaterial = self->_modelMaterial;
  self->_modelMaterial = v3;

  [(SCNMaterial *)self->_modelMaterial setLightingModelName:SCNLightingModelConstant];
  modelContents = self->_modelContents;
  v6 = [(SCNMaterial *)self->_modelMaterial diffuse];
  [v6 setContents:modelContents];

  [(SCNMaterial *)self->_modelMaterial setTransparency:0.0];
  v8 = self->_modelMaterial;
  v7 = +[NSArray arrayWithObjects:&v8 count:1];
  [(SCNGeometry *)self->_modelGeometry setMaterials:v7];
}

- (void)configureVideoGeometry
{
  v3 = +[SCNProgram program];
  [v3 setLibrary:self->_library];
  [v3 setVertexFunctionName:@"broadway_video_vert"];
  [v3 setFragmentFunctionName:@"broadway_video_frag"];
  [v3 setOpaque:0];
  v4 = +[SCNMaterial material];
  [(SCNMaterial *)v4 setValue:self->_videoMaterialProperty forKey:@"videoTexture"];
  [(SCNMaterial *)v4 setProgram:v3];
  [(SCNMaterial *)v4 setBlendMode:0];
  [(SCNMaterial *)v4 setReadsFromDepthBuffer:0];
  [(SCNMaterial *)v4 setWritesToDepthBuffer:0];
  v5 = +[SCNPlane planeWithWidth:1.0 height:1.0];
  v11 = v4;
  v6 = +[NSArray arrayWithObjects:&v11 count:1];
  [(SCNGeometry *)v5 setMaterials:v6];

  v7 = +[SCNNode nodeWithGeometry:v5];
  [v7 setName:@"Video mapping"];
  [v7 setRenderingOrder:-1];
  [(SCNNode *)self->_cameraNode addChildNode:v7];
  videoGeometry = self->_videoGeometry;
  self->_videoGeometry = v5;
  v9 = v5;

  videoMaterial = self->_videoMaterial;
  self->_videoMaterial = v4;
}

- (void)configureVideo
{
  v7[0] = kCVPixelBufferMetalCompatibilityKey;
  v7[1] = kCVPixelBufferPixelFormatTypeKey;
  v8[0] = &__kCFBooleanTrue;
  v8[1] = &off_1001A7220;
  v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v4 = (AVPlayerItemVideoOutput *)[objc_alloc((Class)AVPlayerItemVideoOutput) initWithPixelBufferAttributes:v3];
  videoOutput = self->_videoOutput;
  self->_videoOutput = v4;

  v6 = [(AVPlayer *)self->_videoPlayer currentItem];
  [v6 addOutput:self->_videoOutput];
}

- (void)notifyObserversWithCommandBuffer:(id)a3
{
  id v4 = a3;
  id v5 = [(NSHashTable *)self->_animationObservers copy];
  if (!self->_didUpdateForFirstCommandBuffer)
  {
    self->_didUpdateForFirstCommandBuffer = 1;
    self->_firstFrameTimestamp = CACurrentMediaTime();
  }
  if (self->_didNotifyFirstFrameRendered || !self->_videoCurrentFrame)
  {
    char v6 = 0;
  }
  else
  {
    char v6 = 1;
    self->_didNotifyFirstFrameRendered = 1;
    if (dword_1001CC3A8 <= 50 && (dword_1001CC3A8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  if (self->_videoCurrentFrame >= 0x31)
  {
    [(SCNMaterial *)self->_modelMaterial transparency];
    if (v7 == 0.0) {
      [(SCNMaterial *)self->_modelMaterial setTransparency:1.0];
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100108D58;
  block[3] = &unk_1001A1848;
  char v14 = v6;
  id v8 = v5;
  id v12 = v8;
  v13 = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (!self->_didNotifyLastFrameRendered && self->_videoCurrentFrame == self->_videoFrameCount - 1)
  {
    if (dword_1001CC3A8 <= 50 && (dword_1001CC3A8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_didNotifyLastFrameRendered = 1;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100108ED0;
    v9[3] = &unk_1001A0F78;
    id v10 = v8;
    [v4 addCompletedHandler:v9];
  }
}

- (void)removeAnimationObserver:(id)a3
{
}

- (void)addAnimationObserver:(id)a3
{
}

- (void)renderer:(id)a3 willRenderScene:(id)a4 atTime:(double)a5
{
  double v7 = (SCNView *)a3;
  id v8 = a4;
  sceneView = self->_sceneView;
  if (sceneView == v7)
  {
    id v10 = [(SCNView *)v7 renderer];
  }
  else
  {
    id v10 = v7;
  }
  v11 = v10;
  id v12 = [(SCNView *)v10 currentCommandBuffer];
  v13 = v12;
  texture = self->_texture;
  if (texture)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100109178;
    v15[3] = &unk_1001A0F50;
    v15[4] = texture;
    [v12 addCompletedHandler:v15];
    self->_texture = 0;
  }
  if (sceneView == v7) {
    [(BroadwayCardView *)self notifyObserversWithCommandBuffer:v13];
  }
}

- (void)renderer:(id)a3 updateAtTime:(double)a4
{
  id v5 = a3;
  char v6 = v5;
  if (!self->_textureCache)
  {
    double v7 = [v5 device];
    CVMetalTextureCacheCreate(0, 0, v7, 0, &self->_textureCache);
  }
  id v8 = [(AVPlayer *)self->_videoPlayer currentItem];
  v9 = v8;
  memset(&v18[1], 0, sizeof(CMTime));
  if (v8) {
    [v8 currentTime];
  }
  videoOutput = self->_videoOutput;
  v18[0] = v18[1];
  unsigned int v11 = [(AVPlayerItemVideoOutput *)videoOutput hasNewPixelBufferForItemTime:v18];
  if (dword_1001CC3A8 <= 10 && (dword_1001CC3A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v11)
  {
    v18[0] = kCMTimeInvalid;
    id v12 = self->_videoOutput;
    CMTime time = v18[1];
    v13 = [(AVPlayerItemVideoOutput *)v12 copyPixelBufferForItemTime:&time itemTimeForDisplay:v18];
    if (v13)
    {
      char v14 = v13;
      self->_textureWidth = CVPixelBufferGetWidth(v13);
      size_t Height = CVPixelBufferGetHeight(v14);
      self->_texturesize_t Height = Height;
      if (!CVMetalTextureCacheCreateTextureFromImage(kCFAllocatorDefault, self->_textureCache, v14, 0, MTLPixelFormatBGRA8Unorm_sRGB, self->_textureWidth, Height, 0, &self->_texture))
      {
        id v16 = CVMetalTextureGetTexture(self->_texture);
        if (v16)
        {
          [(SCNMaterialProperty *)self->_videoMaterialProperty setContents:v16];
          CMTime time = v18[0];
          self->_videoCurrentFrame = (unint64_t)(CMTimeGetSeconds(&time) * self->_videoFrameRate);
          [v6 setSceneTime:];
        }
      }
      CFRelease(v14);
    }
  }
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
  LODWORD(v3) = 1.0;
  if (a3) {
    *(float *)&double v3 = 0.0;
  }
  [(AVPlayer *)self->_videoPlayer setRate:v3];
}

- (void)setModelContents:(id)a3
{
  objc_storeStrong((id *)&self->_modelContents, a3);

  [(BroadwayCardView *)self configureModelGeometry];
}

- (void)setVideoURL:(id)a3 sceneURL:(id)a4
{
  id v6 = a4;
  double v7 = [(BroadwayCardView *)self playerForMovieAtURL:a3 pointsSize:&self->_videoSizePoints nominalFrameRate:&self->_videoFrameRate];
  videoPlayer = self->_videoPlayer;
  self->_videoPlayer = v7;

  v9 = [(AVPlayer *)self->_videoPlayer currentItem];
  id v10 = [v9 asset];
  unsigned int v11 = v10;
  if (v10) {
    [v10 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  self->_videoDuration = CMTimeGetSeconds(&time);

  self->_videoFrameCount = (unint64_t)(self->_videoDuration * self->_videoFrameRate);
  [(BroadwayCardView *)self configureVideo];
  +[SCNTransaction begin];
  +[SCNTransaction setAnimationDuration:0.0];
  SCNSceneSourceLoadingOption v22 = SCNSceneSourceAnimationImportPolicyKey;
  SCNSceneSourceAnimationImportPolicy v23 = SCNSceneSourceAnimationImportPolicyPlayUsingSceneTimeBase;
  id v12 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  id v20 = 0;
  v13 = +[SCNScene sceneWithURL:v6 options:v12 error:&v20];
  id v14 = v20;

  if (v13)
  {
    id v15 = [v13 background];
    [v15 setContents:0];

    [v13 setAttribute:&off_1001A7208 forKey:SCNSceneEndTimeAttributeKey];
    id v16 = +[NSNumber numberWithDouble:self->_videoDuration];
    [v13 setAttribute:v16 forKey:SCNSceneEndTimeAttributeKey];

    uint64_t v17 = [v13 rootNode];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001097B8;
    v19[3] = &unk_1001A0F30;
    v19[4] = self;
    [v17 enumerateChildNodesUsingBlock:v19];

    [(SCNView *)self->_sceneView setScene:v13];
    [(BroadwayCardView *)self configureVideoGeometry];
    +[SCNTransaction commit];
  }
  else if (dword_1001CC3A8 <= 90 && (dword_1001CC3A8 != -1 || _LogCategory_Initialize()))
  {
    v18 = [v6 path];
    LogPrintF();
  }
}

- (void)dealloc
{
  [(SCNView *)self->_sceneView setDelegate:0];
  textureCache = self->_textureCache;
  if (textureCache) {
    CFRelease(textureCache);
  }
  v4.receiver = self;
  v4.super_class = (Class)BroadwayCardView;
  [(BroadwayCardView *)&v4 dealloc];
}

- (BroadwayCardView)initWithCoder:(id)a3
{
  v43.receiver = self;
  v43.super_class = (Class)BroadwayCardView;
  double v3 = [(BroadwayCardView *)&v43 initWithCoder:a3];
  if (v3)
  {
    objc_super v4 = +[UIColor clearColor];
    [(BroadwayCardView *)v3 setBackgroundColor:v4];

    uint64_t v5 = +[NSHashTable weakObjectsHashTable];
    animationObservers = v3->_animationObservers;
    v3->_animationObservers = (NSHashTable *)v5;

    double v7 = [objc_alloc((Class)SCNView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    sceneView = v3->_sceneView;
    v3->_sceneView = v7;

    v9 = +[UIColor clearColor];
    [(SCNView *)v3->_sceneView setBackgroundColor:v9];

    [(SCNView *)v3->_sceneView setAntialiasingMode:2];
    id v10 = [(SCNView *)v3->_sceneView layer];
    [v10 setMinificationFilter:kCAFilterTrilinear];

    [(SCNView *)v3->_sceneView setLoops:0];
    [(SCNView *)v3->_sceneView setRendersContinuously:1];
    [(SCNView *)v3->_sceneView setPreferredFramesPerSecond:60];
    [(SCNView *)v3->_sceneView setDelegate:v3];
    [(BroadwayCardView *)v3 addSubview:v3->_sceneView];
    [(SCNView *)v3->_sceneView setTranslatesAutoresizingMaskIntoConstraints:0];
    unsigned int v11 = [(SCNView *)v3->_sceneView topAnchor];
    id v12 = [(BroadwayCardView *)v3 topAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    id v14 = [(SCNView *)v3->_sceneView bottomAnchor];
    id v15 = [(BroadwayCardView *)v3 bottomAnchor];
    id v16 = [v14 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    uint64_t v17 = [(SCNView *)v3->_sceneView leadingAnchor];
    v18 = [(BroadwayCardView *)v3 leadingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    [v19 setActive:1];

    id v20 = [(SCNView *)v3->_sceneView trailingAnchor];
    CGFloat v21 = [(BroadwayCardView *)v3 trailingAnchor];
    SCNSceneSourceLoadingOption v22 = [v20 constraintEqualToAnchor:v21];
    [v22 setActive:1];

    SCNSceneSourceAnimationImportPolicy v23 = [(SCNView *)v3->_sceneView device];
    long long v24 = +[NSBundle bundleForClass:objc_opt_class()];
    id v42 = 0;
    long long v25 = (MTLLibrary *)[v23 newDefaultLibraryWithBundle:v24 error:&v42];
    id v26 = v42;
    library = v3->_library;
    v3->_library = v25;

    if (!v3->_library
      && v26
      && dword_1001CC3A8 <= 90
      && (dword_1001CC3A8 != -1 || _LogCategory_Initialize()))
    {
      v36 = "-[BroadwayCardView initWithCoder:]";
      id v37 = v26;
      LogPrintF();
    }
    int v41 = 0x1000000;
    v28 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:width:height:mipmapped:](MTLTextureDescriptor, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 70, 1, 1, 0, v36, v37);
    [v28 setUsage:1];
    v29 = [(SCNView *)v3->_sceneView device];
    v30 = (MTLTexture *)[v29 newTextureWithDescriptor:v28];
    blackTexture = v3->_blackTexture;
    v3->_blackTexture = v30;

    v32 = v3->_blackTexture;
    memset(v38, 0, sizeof(v38));
    int64x2_t v39 = vdupq_n_s64(1uLL);
    uint64_t v40 = 1;
    [(MTLTexture *)v32 replaceRegion:v38 mipmapLevel:0 withBytes:&v41 bytesPerRow:4];
    uint64_t v33 = +[SCNMaterialProperty materialPropertyWithContents:v3->_blackTexture];
    videoMaterialProperty = v3->_videoMaterialProperty;
    v3->_videoMaterialProperty = (SCNMaterialProperty *)v33;
  }
  return v3;
}

@end