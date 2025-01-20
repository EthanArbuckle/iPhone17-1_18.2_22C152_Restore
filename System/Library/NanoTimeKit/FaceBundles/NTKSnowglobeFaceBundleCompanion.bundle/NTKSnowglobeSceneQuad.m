@interface NTKSnowglobeSceneQuad
- (BOOL)prepareForTime:(double)a3;
- (NTKSnowglobeSceneQuad)initWithScene:(id)a3 delegate:(id)a4 device:(id)a5 screenScale:(double)a6;
- (SCNRenderer)renderer;
- (void)renderWithCommandBuffer:(id)a3 passDescriptor:(id)a4;
- (void)setupForQuadView:(id)a3;
@end

@implementation NTKSnowglobeSceneQuad

- (NTKSnowglobeSceneQuad)initWithScene:(id)a3 delegate:(id)a4 device:(id)a5 screenScale:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v27.receiver = self;
  v27.super_class = (Class)NTKSnowglobeSceneQuad;
  v14 = [(CLKUIQuad *)&v27 init];
  v15 = v14;
  if (v14)
  {
    p_device = &v14->_device;
    objc_storeStrong((id *)&v14->_device, a5);
    v17 = *p_device;
    if (qword_1EA8FCF00 != -1) {
      dispatch_once(&qword_1EA8FCF00, &unk_1F3527F58);
    }
    id v18 = (id)qword_1EA8FCEF8;
    uint64_t v19 = [(MTLDevice *)v17 newDefaultLibraryWithBundle:v18 error:0];
    library = v15->_library;
    v15->_library = (MTLLibrary *)v19;

    uint64_t v21 = [MEMORY[0x1E4F3B260] rendererWithDevice:*p_device options:0];
    renderer = v15->_renderer;
    v15->_renderer = (SCNRenderer *)v21;

    v23 = [MEMORY[0x1E4F428B8] redColor];
    [(SCNRenderer *)v15->_renderer setBackgroundColor:v23];

    [(SCNRenderer *)v15->_renderer setScene:v11];
    [(SCNRenderer *)v15->_renderer setPlaying:1];
    [(SCNRenderer *)v15->_renderer setDelegate:v12];
    v24 = [v11 rootNode];
    v25 = [v24 childNodeWithName:@"NTKPointOfView" recursively:1];

    [(SCNRenderer *)v15->_renderer setPointOfView:v25];
    objc_storeStrong((id *)&v15->_scene, a3);
    v15->_screenScale = a6;
  }
  return v15;
}

- (void)setupForQuadView:(id)a3
{
  id v7 = a3;
  self->_pixelFormat = [v7 colorPixelFormat];
  [v7 bounds];
  double screenScale = self->_screenScale;
  self->_size.width = v5 * screenScale;
  self->_size.height = v6 * screenScale;
  [v7 setOpaque:1];
}

- (BOOL)prepareForTime:(double)a3
{
  double v5 = [(SCNRenderer *)self->_renderer delegate];
  if (v5)
  {
    [(SCNRenderer *)self->_renderer updateAtTime:a3];

    double v6 = [(SCNScene *)self->_scene background];
    id v7 = [v6 contents];
    backgroundColor = self->_backgroundColor;

    if (v7 != backgroundColor)
    {
      v9 = [(SCNScene *)self->_scene background];
      v10 = [v9 contents];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v12 = [(SCNScene *)self->_scene background];
        id v13 = [v12 contents];
      }
      else
      {
        id v13 = [MEMORY[0x1E4F428B8] blackColor];
      }
      v14 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE0]);
      v15 = v13;
      CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v14, kCGRenderingIntentDefault, [(UIColor *)v15 CGColor], 0);
      Components = CGColorGetComponents(CopyByMatchingToColorSpace);
      double v18 = Components[2];
      *(_OWORD *)&self->_backgroundClearColor.red = *(_OWORD *)Components;
      self->_backgroundClearColor.blue = v18;
      self->_backgroundClearColor.alpha = 1.0;
      uint64_t v19 = self->_backgroundColor;
      self->_backgroundColor = v15;

      CGColorRelease(CopyByMatchingToColorSpace);
      CGColorSpaceRelease(v14);
    }
  }
  return v5 != 0;
}

- (void)renderWithCommandBuffer:(id)a3 passDescriptor:(id)a4
{
  double v6 = (void *)MEMORY[0x1E4F3B280];
  id v7 = a4;
  id v14 = a3;
  [v6 flush];
  double red = self->_backgroundClearColor.red;
  double green = self->_backgroundClearColor.green;
  double blue = self->_backgroundClearColor.blue;
  double alpha = self->_backgroundClearColor.alpha;
  id v12 = [v7 colorAttachments];
  id v13 = [v12 objectAtIndexedSubscript:0];
  objc_msgSend(v13, "setClearColor:", red, green, blue, alpha);

  -[SCNRenderer renderWithViewport:commandBuffer:passDescriptor:](self->_renderer, "renderWithViewport:commandBuffer:passDescriptor:", v14, v7, 0.0, 0.0, self->_size.width, self->_size.height);
}

- (SCNRenderer)renderer
{
  return (SCNRenderer *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end