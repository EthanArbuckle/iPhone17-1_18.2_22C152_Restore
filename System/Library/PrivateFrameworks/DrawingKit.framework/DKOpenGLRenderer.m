@interface DKOpenGLRenderer
- (BOOL)allowWetComposite;
- (BOOL)canvasIsEmpty;
- (BOOL)detectCollision:(DKOpenGLRenderer *)self :(SEL)a2;
- (BOOL)drawingEnabled;
- (BOOL)ignoreFirstUndoItem;
- (BOOL)initGL;
- (BOOL)isUndoEnabled;
- (CGRect)bounds;
- (CGRect)getVertexBounds;
- (CGRect)regionWithVertices:()vector<Vertex withInflationAmount:(std:(float)a4 :allocator<Vertex>> *)a3;
- (CGSize)contentSize;
- (DKOpenGLRenderer)init;
- (DKOpenGLRenderer)initWithBounds:(CGRect)a3 scale:(double)a4;
- (DKOpenGLRenderer)initWithBounds:(CGRect)a3 scale:(double)a4 bufferSize:(int)a5 sharedContext:(BOOL)a6;
- (DKOpenGLRendererDelegate)delegate;
- (UIColor)inkColor;
- (double)backingScale;
- (double)lineWidthScale;
- (id).cxx_construct;
- (id)snapshotImage;
- (int64_t)numPages;
- (void)addPoints:(id)a3 withSegmentLength:(unint64_t)a4;
- (void)appendVertexHistoryElement;
- (void)clear;
- (void)clearComposite;
- (void)clearDryPaintBuffer;
- (void)clearWetPaintBuffer;
- (void)dealloc;
- (void)destroyFrameBuffers;
- (void)didBeginNewStroke;
- (void)didResize;
- (void)draw;
- (void)drawComposite;
- (void)drawContiguousVertexStorageImmediatelyWithLayeredBlending:(BOOL)a3;
- (void)initializeFrameBuffers;
- (void)removeVertexHistoryElement;
- (void)renderToComposite:(BOOL)a3;
- (void)renderToDryPaintBuffer;
- (void)renderToWetPaintBufferWithRange:(_NSRange)a3;
- (void)resetRendererState;
- (void)setAllowWetComposite:(BOOL)a3;
- (void)setBackingScale:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setDrawingEnabled:(BOOL)a3;
- (void)setIgnoreFirstUndoItem:(BOOL)a3;
- (void)setInkColor:(id)a3;
- (void)setLineWidthScale:(double)a3;
- (void)setNumPages:(int64_t)a3;
- (void)setUndoEnabled:(BOOL)a3;
- (void)teardown;
- (void)undo;
- (void)update;
- (void)updateDryCycleIncludingComposite:(BOOL)a3;
- (void)updateDryForcefully;
- (void)updateVertexControllerWithData:()vector<Vertex range:(std:(_NSRange)a4 :(BOOL)a5 allocator<Vertex>> *)a3 allowWet:;
- (void)updateVertexControllerWithDataRange:(_NSRange)a3 allowWet:(BOOL)a4;
- (void)updateWet;
@end

@implementation DKOpenGLRenderer

- (DKOpenGLRenderer)initWithBounds:(CGRect)a3 scale:(double)a4 bufferSize:(int)a5 sharedContext:(BOOL)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)DKOpenGLRenderer;
  v13 = [(DKOpenGLRenderer *)&v17 init];
  v14 = v13;
  if (v13)
  {
    v13->_bounds.origin.CGFloat x = x;
    v13->_bounds.origin.CGFloat y = y;
    v13->_bounds.size.CGFloat width = width;
    v13->_bounds.size.CGFloat height = height;
    v13->_backingScale = a4;
    v13->_lineWidthScale = 1.0;
    v13->_didNotifyRendererDelegate = 0;
    v13->mSharedContext = a6;
    if (a5 <= 8000) {
      unsigned int v15 = 8000;
    }
    else {
      unsigned int v15 = a5;
    }
    if (v15 >= 0xFFFE) {
      unsigned int v15 = 65534;
    }
    v13->mBufferSize = v15;
    [(DKOpenGLRenderer *)v13 initGL];
  }
  return v14;
}

- (DKOpenGLRenderer)initWithBounds:(CGRect)a3 scale:(double)a4
{
  return -[DKOpenGLRenderer initWithBounds:scale:bufferSize:sharedContext:](self, "initWithBounds:scale:bufferSize:sharedContext:", 8000, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

- (DKOpenGLRenderer)init
{
  v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 scale];
  double v5 = v4;

  return -[DKOpenGLRenderer initWithBounds:scale:](self, "initWithBounds:scale:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), v5);
}

- (void)dealloc
{
  if (+[DKGLUtilities gpuAvailable]) {
    [(DKOpenGLRenderer *)self teardown];
  }
  self->mPages.__end_ = self->mPages.__begin_;
  self->mContiguousVertexStorage.__end_ = self->mContiguousVertexStorage.__begin_;
  self->mVertexHistory.__end_ = self->mVertexHistory.__begin_;
  v3.receiver = self;
  v3.super_class = (Class)DKOpenGLRenderer;
  [(DKOpenGLRenderer *)&v3 dealloc];
}

- (void)teardown
{
  [(DKOpenGLRenderer *)self destroyFrameBuffers];
  if (self->mVbo) {
    +[DKGLUtilities deleteVBO:&self->mVbo];
  }
  if (!self->mPaperTexIsShared)
  {
    mPaperTeCGFloat x = self->mPaperTex;
    p_mPaperTeCGFloat x = &self->mPaperTex;
    if (mPaperTex) {
      +[DKGLUtilities deleteTexture:p_mPaperTex];
    }
  }
  glFinish();
}

- (BOOL)initGL
{
  *(_OWORD *)self->U_COLOR = xmmword_22AF74750;
  U_COLOR = self->U_COLOR;
  *(int32x2_t *)self->mWinSize = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_bounds.size));
  [(DKOpenGLRenderer *)self setNumPages:1];
  *(void *)self->mCanvasSize = *(void *)self->mWinSize;
  *(void *)self->mCanvasOffset = 0;
  int64_t v4 = [(DKOpenGLRenderer *)self numPages];
  uint64_t v5 = *(void *)self->mCanvasSize;
  self->_contentSize.CGFloat width = (double)(v4 * (int)v5);
  self->_contentSize.CGFloat height = (double)SHIDWORD(v5);
  self->mTime = 0.0;
  [(DKOpenGLRenderer *)self setDrawingEnabled:1];
  [(DKOpenGLRenderer *)self setAllowWetComposite:1];
  glDisable(0xBE2u);
  glDisable(0xB71u);
  glDepthMask(0);
  if (!self->mSharedContext)
  {
    if (self->mPaperTex) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  +[DKGLUtilities createSharedRepeatableTexture:&self->mPaperTex withImageName:@"paper_texture" ofType:@"jpg"];
  mPaperTeCGFloat x = self->mPaperTex;
  self->mPaperTexIsShared = mPaperTex != 0;
  if (!mPaperTex)
  {
LABEL_3:
    +[DKGLUtilities createRepeatableTexture:&self->mPaperTex withImageName:@"paper_texture" ofType:@"jpg"];
    self->mPaperTexIsShared = 0;
  }
LABEL_4:
  self->mParticleLifespan = 2.0;
  glGenBuffers(1, &self->mVbo);
  glBindBuffer(0x8892u, self->mVbo);
  glBufferData(0x8892u, 24 * self->mBufferSize, 0, 0x88E8u);
  glGenVertexArraysOES();
  glBindVertexArrayOES();
  glBindBuffer(0x8892u, self->mVbo);
  glEnableVertexAttribArray(0);
  glEnableVertexAttribArray(1u);
  glEnableVertexAttribArray(2u);
  glEnableVertexAttribArray(3u);
  glEnableVertexAttribArray(4u);
  glVertexAttribPointer(0, 2, 0x1406u, 0, 24, 0);
  glVertexAttribPointer(1u, 1, 0x1406u, 0, 24, (const GLvoid *)8);
  glVertexAttribPointer(2u, 1, 0x1406u, 0, 24, (const GLvoid *)0xC);
  glVertexAttribPointer(3u, 1, 0x1406u, 0, 24, (const GLvoid *)0x10);
  glVertexAttribPointer(4u, 1, 0x1406u, 0, 24, (const GLvoid *)0x14);
  glGetError();
  GLuint Program = glCreateProgram();
  self->mWetPaintProg = Program;
  glAttachShader(Program, +[DKGLUtilities compileShader:@"wet_paint" ofType:@"vert"]);
  glAttachShader(self->mWetPaintProg, +[DKGLUtilities compileShader:@"wet_paint" ofType:@"frag"]);
  glBindAttribLocation(self->mWetPaintProg, 0, "iPosition");
  glBindAttribLocation(self->mWetPaintProg, 1u, "iSpeed");
  glBindAttribLocation(self->mWetPaintProg, 2u, "iBirth");
  glBindAttribLocation(self->mWetPaintProg, 3u, "iForce");
  glBindAttribLocation(self->mWetPaintProg, 4u, "iEndPoint");
  glLinkProgram(self->mWetPaintProg);
  GLint params = 0;
  glGetProgramiv(self->mWetPaintProg, 0x8B82u, &params);
  if (!params) {
    goto LABEL_10;
  }
  glUseProgram(self->mWetPaintProg);
  self->mWetPaintProgTimeGLint UniformLocation = glGetUniformLocation(self->mWetPaintProg, "uTime");
  self->mWetPaintProgSubtractEndPointsOnlyGLint UniformLocation = glGetUniformLocation(self->mWetPaintProg, "uSubtractEndPointsOnly");
  self->mWetPaintProgLifespanGLint UniformLocation = glGetUniformLocation(self->mWetPaintProg, "uLifespan");
  GLint UniformLocation = glGetUniformLocation(self->mWetPaintProg, "uSize");
  float backingScale = self->_backingScale;
  glUniform1f(UniformLocation, backingScale * 10.0);
  glUniform1f(self->mWetPaintProgTimeUniformLocation, 0.0);
  glUniform1f(self->mWetPaintProgLifespanUniformLocation, self->mParticleLifespan);
  glUniform1i(self->mWetPaintProgSubtractEndPointsOnlyUniformLocation, 0);
  float v10 = self->_backingScale;
  *(float32x2_t *)v = vmul_n_f32(vcvt_f32_s32(*(int32x2_t *)self->mCanvasSize), v10);
  GLuint v11 = glCreateProgram();
  self->mDryPaintProg = v11;
  glAttachShader(v11, +[DKGLUtilities compileShader:@"dry_paint" ofType:@"vert"]);
  glAttachShader(self->mDryPaintProg, +[DKGLUtilities compileShader:@"dry_paint" ofType:@"frag"]);
  glBindAttribLocation(self->mDryPaintProg, 0, "iPosition");
  glBindAttribLocation(self->mDryPaintProg, 1u, "iTexCoord0");
  glLinkProgram(self->mDryPaintProg);
  glGetProgramiv(self->mDryPaintProg, 0x8B82u, &params);
  if (!params) {
    goto LABEL_10;
  }
  glUseProgram(self->mDryPaintProg);
  self->mDryPaintProgXCoordOffsetGLint UniformLocation = glGetUniformLocation(self->mDryPaintProg, "uXCoordOffset");
  GLint v12 = glGetUniformLocation(self->mDryPaintProg, "texture_src");
  glUniform1i(v12, 0);
  GLint v13 = glGetUniformLocation(self->mDryPaintProg, "texture_dest");
  glUniform1i(v13, 1);
  GLint v14 = glGetUniformLocation(self->mDryPaintProg, "uTargetMultiple");
  glUniform1f(v14, 0.5);
  glUniform1f(self->mDryPaintProgXCoordOffsetUniformLocation, 0.0);
  GLuint v15 = glCreateProgram();
  self->mCompositeProg = v15;
  glAttachShader(v15, +[DKGLUtilities compileShader:@"dry_composite" ofType:@"vert"]);
  glAttachShader(self->mCompositeProg, +[DKGLUtilities compileShader:@"dry_composite" ofType:@"frag"]);
  glBindAttribLocation(self->mCompositeProg, 0, "iPosition");
  glBindAttribLocation(self->mCompositeProg, 1u, "iTexCoord0");
  glLinkProgram(self->mCompositeProg);
  glGetProgramiv(self->mCompositeProg, 0x8B82u, &params);
  if (!params) {
    goto LABEL_10;
  }
  glUseProgram(self->mCompositeProg);
  self->mCompositeColorGLint UniformLocation = glGetUniformLocation(self->mCompositeProg, "uColor");
  GLint v16 = glGetUniformLocation(self->mCompositeProg, "texture_dest");
  glUniform1i(v16, 0);
  GLint v17 = glGetUniformLocation(self->mCompositeProg, "texture_paper");
  glUniform1i(v17, 1);
  glUniform4fv(self->mCompositeColorUniformLocation, 1, (const GLfloat *)U_COLOR);
  GLint v18 = glGetUniformLocation(self->mCompositeProg, "uTargetMultiple");
  glUniform1f(v18, 0.5);
  GLint v19 = glGetUniformLocation(self->mCompositeProg, "uXCoordOffset");
  glUniform1f(v19, 0.0);
  GLint v20 = glGetUniformLocation(self->mCompositeProg, "uIncludeWetPass");
  glUniform1i(v20, 1);
  int v21 = glGetUniformLocation(self->mCompositeProg, "uViewport");
  self->mCompositeProgViewportGLint UniformLocation = v21;
  glUniform2fv(v21, 1, v);
  GLuint v22 = glCreateProgram();
  self->mTextureProg = v22;
  glAttachShader(v22, +[DKGLUtilities compileShader:@"texture" ofType:@"vert"]);
  glAttachShader(self->mTextureProg, +[DKGLUtilities compileShader:@"texture" ofType:@"frag"]);
  glBindAttribLocation(self->mTextureProg, 0, "iPosition");
  glBindAttribLocation(self->mTextureProg, 1u, "iTexCoord");
  glLinkProgram(self->mTextureProg);
  glGetProgramiv(self->mTextureProg, 0x8B82u, &params);
  if (!params) {
    goto LABEL_10;
  }
  glUseProgram(self->mTextureProg);
  GLint v23 = glGetUniformLocation(self->mTextureProg, "texture_src");
  glUniform1i(v23, 0);
  self->mTextureProgModelViewProjectionGLint UniformLocation = glGetUniformLocation(self->mTextureProg, "uModelViewProjection");
  GLuint v24 = glCreateProgram();
  self->mColorProg = v24;
  glAttachShader(v24, +[DKGLUtilities compileShader:@"color" ofType:@"vert"]);
  glAttachShader(self->mColorProg, +[DKGLUtilities compileShader:@"color" ofType:@"frag"]);
  glBindAttribLocation(self->mColorProg, 0, "iPosition");
  glBindAttribLocation(self->mColorProg, 1u, "iTexCoord");
  glLinkProgram(self->mColorProg);
  glGetProgramiv(self->mColorProg, 0x8B82u, &params);
  if (params)
  {
    glUseProgram(self->mColorProg);
    long long v27 = xmmword_22AF74760;
    self->mColorProgColorGLint UniformLocation = glGetUniformLocation(self->mColorProg, "uColor");
    self->mColorProgModelViewProjectionGLint UniformLocation = glGetUniformLocation(self->mColorProg, "uModelViewProjection");
    BOOL v25 = 1;
    glUniform4fv(self->mColorProgColorUniformLocation, 1, (const GLfloat *)&v27);
    [(DKOpenGLRenderer *)self initializeFrameBuffers];
  }
  else
  {
LABEL_10:
    NSLog(&cfstr_ErrorLinkingPr.isa);
    return 0;
  }
  return v25;
}

- (void)setInkColor:(id)a3
{
  objc_storeStrong((id *)&self->_inkColor, a3);
  id v5 = a3;
  float64_t v10 = 0.0;
  float64_t v11 = 0.0;
  float64_t v8 = 0.0;
  float64_t v9 = 0.0;
  [v5 getRed:&v11 green:&v10 blue:&v9 alpha:&v8];

  v6.f64[0] = v11;
  v6.f64[1] = v10;
  v7.f64[0] = v9;
  v7.f64[1] = v8;
  *(float32x4_t *)self->U_COLOR = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v6), v7);
}

- (void)setNumPages:(int64_t)a3
{
  if (self->_numPages != a3)
  {
    std::vector<Page>::resize((uint64_t)&self->mPages, a3);
    self->_numPages = a3;
  }
}

- (void)setBounds:(CGRect)a3
{
  if (self->_bounds.size.width != a3.size.width || self->_bounds.size.height != a3.size.height)
  {
    self->_bounds = a3;
    [(DKOpenGLRenderer *)self didResize];
  }
}

- (void)setBackingScale:(double)a3
{
  if (self->_backingScale != a3)
  {
    self->_float backingScale = a3;
    [(DKOpenGLRenderer *)self didResize];
  }
}

- (void)didResize
{
  [(DKOpenGLRenderer *)self destroyFrameBuffers];
  int32x2_t v3 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_bounds.size));
  *(int32x2_t *)self->mWinSize = v3;
  *(int32x2_t *)self->mCanvasSize = v3;
  *(void *)self->mCanvasOffset = 0;
  [(DKOpenGLRenderer *)self initializeFrameBuffers];
  float backingScale = self->_backingScale;
  float32x2_t v5 = vcvt_f32_s32(*(int32x2_t *)self->mCanvasSize);
  self->_contentSize.CGFloat width = (float)((float)(0xCCCCCCCCCCCCCCCDLL * ((self->mPages.__end_ - self->mPages.__begin_) >> 3))
                                   * v5.f32[0]);
  self->_contentSize.CGFloat height = v5.f32[1];
  *(float32x2_t *)v = vmul_n_f32(v5, backingScale);
  glUseProgram(self->mCompositeProg);
  glUniform2fv(self->mCompositeProgViewportUniformLocation, 1, v);
  [(DKOpenGLRenderer *)self drawContiguousVertexStorageImmediatelyWithLayeredBlending:1];
}

- (void)destroyFrameBuffers
{
  for (i = self->mPages.__begin_; i != self->mPages.__end_; i = (Page *)((char *)i + 40))
  {
    +[DKGLUtilities deleteFBO:i depthRB:0 texture:(char *)i + 4];
    +[DKGLUtilities deleteFBO:(char *)i + 16 depthRB:0 texture:(char *)i + 20];
  }
  +[DKGLUtilities deleteFBO:&self->mWetPaintBufferFBO depthRB:0 texture:&self->mWetPaintBufferT];
}

- (void)initializeFrameBuffers
{
  *(float *)&long long v2 = self->_backingScale;
  *(int32x2_t *)&long long v2 = vcvt_s32_f32(vmul_n_f32(vcvt_f32_s32(*(int32x2_t *)self->mCanvasSize), *(float *)&v2));
  long long v20 = v2;
  begin = self->mPages.__begin_;
  if (begin != self->mPages.__end_)
  {
    uint64_t v5 = v2;
    uint64_t v6 = DWORD1(v2);
    float64x2_t v7 = (char *)begin + 16;
    do
    {
      *((void *)v7 - 1) = v20;
      +[DKGLUtilities createFBO:depthRB:texture:width:height:format:](DKGLUtilities, "createFBO:depthRB:texture:width:height:format:", v7 - 16, 0, v7 - 12, v5, v6, 32849, v20);
      *((void *)v7 + 1) = v20;
      +[DKGLUtilities createFBO:v7 depthRB:0 texture:v7 + 4 width:v5 height:v6 format:32856];
      float64_t v8 = (Page *)(v7 + 24);
      v7 += 40;
    }
    while (v8 != self->mPages.__end_);
  }
  *(void *)self->mWetPaintBufferSize = v20;
  int v9 = v20;
  int v10 = DWORD1(v20);
  +[DKGLUtilities createFBO:depthRB:texture:width:height:format:](DKGLUtilities, "createFBO:depthRB:texture:width:height:format:", &self->mWetPaintBufferFBO, 0, &self->mWetPaintBufferT, v20, DWORD1(v20), 32849, v20);
  double backingScale = self->_backingScale;
  double v12 = (double)v9 / backingScale;
  *(float *)&double v12 = v12;
  double v13 = (double)v10 / backingScale;
  *(float *)&double v13 = v13;
  +[DKGLUtilities setProjectionMatrixForWidth:0 height:value flipped:v12 matrix:v13];
  double v14 = *(double *)self->mCanvasOffset;
  *(float *)&double v14 = (float)-*(_DWORD *)self->mCanvasOffset;
  +[DKGLUtilities translateMatrix:value byX:value Y:v14 result:0.0];
  glUseProgram(self->mWetPaintProg);
  GLint UniformLocation = glGetUniformLocation(self->mWetPaintProg, "uModelViewProjection");
  glUniformMatrix4fv(UniformLocation, 1, 0, value);
  *(float *)&double v16 = (float)v9;
  *(float *)&double v17 = (float)v10;
  +[DKGLUtilities setProjectionMatrixForWidth:0 height:value flipped:v16 matrix:v17];
  glUseProgram(self->mDryPaintProg);
  GLint v18 = glGetUniformLocation(self->mDryPaintProg, "uModelViewProjection");
  glUniformMatrix4fv(v18, 1, 0, value);
  glUseProgram(self->mCompositeProg);
  GLint v19 = glGetUniformLocation(self->mCompositeProg, "uModelViewProjection");
  glUniformMatrix4fv(v19, 1, 0, value);
}

- (void)setDrawingEnabled:(BOOL)a3
{
  if (self->_drawingEnabled != a3)
  {
    if (!a3) {
      [(DKOpenGLRenderer *)self updateDryForcefully];
    }
    self->_drawingEnabled = a3;
  }
}

- (void)setAllowWetComposite:(BOOL)a3
{
  if (self->_allowWetComposite != a3)
  {
    unsigned int v3 = a3;
    glUseProgram(self->mCompositeProg);
    GLint UniformLocation = glGetUniformLocation(self->mCompositeProg, "uIncludeWetPass");
    glUniform1f(UniformLocation, (float)v3);
    self->_allowWetComposite = v3;
  }
}

- (void)appendVertexHistoryElement
{
  p_mVertexHistorCGFloat y = &self->mVertexHistory;
  begin = self->mVertexHistory.__begin_;
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((p_mVertexHistory[-1].__end_ - p_mVertexHistory[-1].__begin_) >> 3);
  end = p_mVertexHistory->__end_;
  uint64_t v7 = (end - begin) >> 4;
  if (end == begin)
  {
    value = self->mVertexHistory.__end_cap_.__value_;
    if (end >= value)
    {
      uint64_t v16 = value - begin;
      if (v16 >> 3 <= (unint64_t)(v7 + 1)) {
        uint64_t v17 = v7 + 1;
      }
      else {
        uint64_t v17 = v16 >> 3;
      }
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v18 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v18 = v17;
      }
      GLint v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<VertexGroup>>((uint64_t)&self->mVertexHistory.__end_cap_, v18);
      long long v20 = &v19[16 * v7];
      GLuint v22 = (VertexGroup *)&v19[16 * v21];
      *(void *)long long v20 = v5;
      *((void *)v20 + 1) = 0;
      GLuint v15 = (VertexGroup *)(v20 + 16);
      GLint v23 = self->mVertexHistory.__begin_;
      begin = self->mVertexHistory.__end_;
      if (begin != v23)
      {
        do
        {
          *((_OWORD *)v20 - 1) = *((_OWORD *)begin - 1);
          v20 -= 16;
          begin = (VertexGroup *)((char *)begin - 16);
        }
        while (begin != v23);
        begin = p_mVertexHistory->__begin_;
      }
      self->mVertexHistory.__begin_ = (VertexGroup *)v20;
      goto LABEL_30;
    }
  }
  else
  {
    float64_t v8 = (char *)begin + 16 * v7;
    if (!*((void *)v8 - 1))
    {
      *((void *)v8 - 2) = v5;
      *((void *)v8 - 1) = 0;
      return;
    }
    int v9 = self->mVertexHistory.__end_cap_.__value_;
    if (end >= v9)
    {
      unint64_t v10 = v7 + 1;
      if ((unint64_t)(v7 + 1) >> 60) {
        std::vector<Page>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v11 = v9 - begin;
      if (v11 >> 3 > v10) {
        unint64_t v10 = v11 >> 3;
      }
      if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v12 = v10;
      }
      if (v12)
      {
        double v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<VertexGroup>>((uint64_t)&self->mVertexHistory.__end_cap_, v12);
        begin = self->mVertexHistory.__begin_;
        end = self->mVertexHistory.__end_;
      }
      else
      {
        double v13 = 0;
      }
      GLuint v24 = &v13[16 * v7];
      GLuint v22 = (VertexGroup *)&v13[16 * v12];
      *(void *)GLuint v24 = v5;
      *((void *)v24 + 1) = 0;
      GLuint v15 = (VertexGroup *)(v24 + 16);
      if (end != begin)
      {
        do
        {
          *((_OWORD *)v24 - 1) = *((_OWORD *)end - 1);
          v24 -= 16;
          end = (VertexGroup *)((char *)end - 16);
        }
        while (end != begin);
        begin = p_mVertexHistory->__begin_;
      }
      self->mVertexHistory.__begin_ = (VertexGroup *)v24;
LABEL_30:
      self->mVertexHistory.__end_ = v15;
      self->mVertexHistory.__end_cap_.__value_ = v22;
      if (begin) {
        operator delete(begin);
      }
      goto LABEL_32;
    }
  }
  *(void *)end = v5;
  *((void *)end + 1) = 0;
  GLuint v15 = (VertexGroup *)((char *)end + 16);
LABEL_32:
  self->mVertexHistory.__end_ = v15;
}

- (void)removeVertexHistoryElement
{
  begin = self->mVertexHistory.__begin_;
  end = self->mVertexHistory.__end_;
  self->mVertexHistory.__end_ = (VertexGroup *)((char *)end - 16);
  if ((VertexGroup *)((char *)end - 16) == begin) {
    self->mContiguousVertexStorage.__end_ = self->mContiguousVertexStorage.__begin_;
  }
  else {
    std::vector<Vertex>::resize((uint64_t)&self->mContiguousVertexStorage, *((void *)end - 3) + *((void *)end - 4));
  }
}

- (void)addPoints:(id)a3 withSegmentLength:(unint64_t)a4
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v5 = a3;
  begin = self->mContiguousVertexStorage.__begin_;
  end = self->mContiguousVertexStorage.__end_;
  p_mContiguousVertexStorage = &self->mContiguousVertexStorage;
  id v62 = v5;
  if ([v5 count])
  {
    v63 = end;
    v64 = begin;
    NSUInteger location = self->mVertexRange.location;
    NSUInteger length = self->mVertexRange.length;
    float mTime = self->mTime;
    self->_didNotifyRendererDelegate = 0;
    if (self->_drawingEnabled) {
      float v10 = mTime;
    }
    else {
      float v10 = 0.0;
    }
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id obj = v62;
    uint64_t v11 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v71 != v12) {
            objc_enumerationMutation(obj);
          }
          double v14 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          if (v14)
          {
            objc_msgSend(v14, "dk_renderPointValue");
            float64x2_t v15 = 0u;
          }
          else
          {
            float64x2_t v15 = 0uLL;
          }
          float32x2_t v16 = vcvt_f32_f64(v15);
          float lineWidthScale = self->_lineWidthScale;
          float v18 = fminf(fmaxf(0.0, 0.0), lineWidthScale);
          float v19 = 0.0;
          long long v20 = self->mContiguousVertexStorage.__end_;
          value = self->mContiguousVertexStorage.__end_cap_.__value_;
          if (v20 >= value)
          {
            unint64_t v23 = 0xAAAAAAAAAAAAAAABLL * ((v20 - p_mContiguousVertexStorage->__begin_) >> 3);
            unint64_t v24 = v23 + 1;
            if (v23 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<Page>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((value - p_mContiguousVertexStorage->__begin_) >> 3);
            if (2 * v25 > v24) {
              unint64_t v24 = 2 * v25;
            }
            if (v25 >= 0x555555555555555) {
              unint64_t v26 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v26 = v24;
            }
            if (v26) {
              long long v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Vertex>>((uint64_t)&self->mContiguousVertexStorage.__end_cap_, v26);
            }
            else {
              long long v27 = 0;
            }
            v28 = &v27[24 * v23];
            *(float32x2_t *)v28 = v16;
            *((float *)v28 + 2) = v18;
            *((float *)v28 + 3) = v10;
            *((float *)v28 + 4) = v19;
            *((_DWORD *)v28 + 5) = 0;
            v30 = self->mContiguousVertexStorage.__begin_;
            v29 = self->mContiguousVertexStorage.__end_;
            v31 = (Vertex *)v28;
            if (v29 != v30)
            {
              do
              {
                long long v32 = *(_OWORD *)((char *)v29 - 24);
                *((void *)v31 - 1) = *((void *)v29 - 1);
                *(_OWORD *)((char *)v31 - 24) = v32;
                v31 = (Vertex *)((char *)v31 - 24);
                v29 = (Vertex *)((char *)v29 - 24);
              }
              while (v29 != v30);
              v29 = p_mContiguousVertexStorage->__begin_;
            }
            GLuint v22 = (Vertex *)(v28 + 24);
            self->mContiguousVertexStorage.__begin_ = v31;
            self->mContiguousVertexStorage.__end_ = (Vertex *)(v28 + 24);
            self->mContiguousVertexStorage.__end_cap_.__value_ = (Vertex *)&v27[24 * v26];
            if (v29) {
              operator delete(v29);
            }
          }
          else
          {
            *(float32x2_t *)long long v20 = v16;
            *((float *)v20 + 2) = v18;
            *((float *)v20 + 3) = v10;
            *((float *)v20 + 4) = v19;
            GLuint v22 = (Vertex *)((char *)v20 + 24);
            *((_DWORD *)v20 + 5) = 0;
          }
          self->mContiguousVertexStorage.__end_ = v22;
          if (self->_undoEnabled)
          {
            v33 = self->mVertexHistory.__end_;
            if (v33 == self->mVertexHistory.__begin_)
            {
              [(DKOpenGLRenderer *)self appendVertexHistoryElement];
              v33 = self->mVertexHistory.__end_;
            }
            ++*((void *)v33 - 1);
          }
          ++self->mVertexRange.length;
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
      }
      while (v11);
    }

    unint64_t v65 = vcvtas_u32_f32((float)(unint64_t)[obj count] / (float)a4);
    if (v65)
    {
      uint64_t v34 = 0;
      unsigned int v35 = -1431655765 * ((unint64_t)(v63 - v64) >> 3) - a4 - 20;
      do
      {
        int v36 = v34 * a4;
        int v37 = objc_msgSend(obj, "count", location) - v34 * a4;
        if (v37 >= (int)a4) {
          int v38 = a4;
        }
        else {
          int v38 = v37;
        }
        long long v69 = 0u;
        v39 = [obj objectAtIndexedSubscript:v36];
        v40 = v39;
        if (v39) {
          objc_msgSend(v39, "dk_renderPointValue");
        }
        else {
          long long v69 = 0u;
        }

        long long v68 = 0u;
        v41 = [obj objectAtIndexedSubscript:v36 + v38 - 1];
        v42 = v41;
        if (v41) {
          objc_msgSend(v41, "dk_renderPointValue");
        }
        else {
          long long v68 = 0u;
        }

        *(float *)&double v43 = *(double *)&v69;
        float v44 = *((double *)&v69 + 1);
        *((float *)&v43 + 1) = v44;
        *(float *)&double v45 = *(double *)&v68;
        float v46 = *((double *)&v68 + 1);
        *((float *)&v45 + 1) = v46;
        if ([(DKOpenGLRenderer *)self detectCollision:v43 :v45]) {
          BOOL v47 = (int)(-1431655765 * ((unint64_t)(v63 - v64) >> 3) - a4 - 20 + v36) < 1;
        }
        else {
          BOOL v47 = 1;
        }
        if (!v47 && a4 << 32)
        {
          v48 = (_DWORD *)((char *)p_mContiguousVertexStorage->__begin_ + 24 * v35 + 20);
          uint64_t v49 = 24 * (int)a4;
          do
          {
            _DWORD *v48 = 1065353216;
            v48 += 6;
            v49 -= 24;
          }
          while (v49);
        }
        ++v34;
        v35 += a4;
      }
      while (v34 != v65);
    }
    if (self->_drawingEnabled)
    {
      NSUInteger v50 = self->mVertexRange.length;
      int v51 = v50 - length;
      if (v50 > length)
      {
        self->mTimeWetBecameDirtCGFloat y = self->mTime;
        int v52 = length + location;
        int mBufferSize = self->mBufferSize;
        int v54 = ((int)length + (int)location) % mBufferSize;
        GLuint mVbo = self->mVbo;
        if (v54 + v51 <= mBufferSize)
        {
          glBindBuffer(0x8892u, mVbo);
          GLintptr v56 = 24 * v54;
          unint64_t v58 = v51;
          uint64_t v59 = v52;
        }
        else
        {
          glBindBuffer(0x8892u, mVbo);
          glBufferSubData(0x8892u, 24 * v54, 24 * (self->mBufferSize - v54), (char *)self->mContiguousVertexStorage.__begin_ + 24 * v52);
          GLintptr v56 = 0;
          unint64_t v57 = self->mBufferSize;
          unint64_t v58 = (v54 + v51) % v57;
          uint64_t v59 = v52 + (uint64_t)((int)v57 - v54);
        }
        glBufferSubData(0x8892u, v56, 24 * v58, (char *)p_mContiguousVertexStorage->__begin_ + 24 * v59);
      }
    }
    else
    {
      self->float mTime = (float)(v10 + self->mParticleLifespan) + 1.0;
      glUseProgram(self->mWetPaintProg);
      glUniform1f(self->mWetPaintProgTimeUniformLocation, self->mTime);
    }
  }
}

- (BOOL)detectCollision:(DKOpenGLRenderer *)self :(SEL)a2
{
  float32x2_t v5 = v2;
  int32x2_t v6 = vceq_f32(v2, v3);
  if (vand_s8((int8x8_t)v6, (int8x8_t)vdup_lane_s32(v6, 1)).u8[0]) {
    return 0;
  }
  float32x2_t v9 = vsub_f32(v3, v5);
  begin = (float32x2_t *)self->mNonCollisionSegments.__begin_;
  end = (float32x2_t *)self->mNonCollisionSegments.__end_;
  p_mNonCollisionSegments = &self->mNonCollisionSegments;
  if (end == begin)
  {
LABEL_7:
    BOOL v7 = 0;
  }
  else
  {
    _S1 = -v9.f32[0];
    int32x2_t v14 = vdup_lane_s32((int32x2_t)v9, 0);
    float32x2_t v15 = vneg_f32(v9);
    float32x2_t v16 = (float32x2_t *)self->mNonCollisionSegments.__begin_;
    while (1)
    {
      _D6 = v16[1];
      __asm { FMLA            S16, S1, V6.S[1] }
      *(float *)&unsigned int v22 = -_D6.f32[1];
      float32x2_t v23 = vsub_f32(*v16, v5);
      _D6.i32[1] = v15.i32[1];
      *(float32x2_t *)v24.i8 = vdiv_f32(vmla_f32(vmul_f32((float32x2_t)vrev64_s32((int32x2_t)v23), _D6), v23, (float32x2_t)__PAIR64__(v14.u32[1], v22)), (float32x2_t)vdup_lane_s32(_D16, 0));
      v24.i64[1] = v24.i64[0];
      float32x4_t v25 = (float32x4_t)vrev64q_s32(v24);
      _D6.i32[0] = vmovn_s32(vcgeq_f32((float32x4_t)xmmword_22AF74770, v25)).u32[0];
      _D6.i32[1] = vmovn_s32(vcgeq_f32(v25, (float32x4_t)xmmword_22AF74770)).i32[1];
      if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16((int16x4_t)_D6, 0xFuLL)))) {
        break;
      }
      v16 += 2;
      if (v16 == end) {
        goto LABEL_7;
      }
    }
    self->mNonCollisionSegments.__end_ = begin;
    BOOL v7 = 1;
    end = begin;
  }
  p_end_cap = &self->mNonCollisionSegments.__end_cap_;
  value = (float32x2_t *)self->mNonCollisionSegments.__end_cap_.__value_;
  if (end >= value)
  {
    uint64_t v29 = ((char *)end - (char *)begin) >> 4;
    unint64_t v30 = v29 + 1;
    if ((unint64_t)(v29 + 1) >> 60) {
      std::vector<Page>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v31 = (char *)value - (char *)begin;
    if (v31 >> 3 > v30) {
      unint64_t v30 = v31 >> 3;
    }
    if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v32 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v32 = v30;
    }
    if (v32)
    {
      float32x2_t v39 = v9;
      v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<VertexGroup>>((uint64_t)p_end_cap, v32);
      float32x2_t v9 = v39;
    }
    else
    {
      v33 = 0;
    }
    uint64_t v34 = (float32x2_t *)&v33[16 * v29];
    unsigned int v35 = &v33[16 * v32];
    *uint64_t v34 = v5;
    v34[1] = v9;
    v28 = v34 + 2;
    int v37 = (char *)self->mNonCollisionSegments.__begin_;
    int v36 = (char *)self->mNonCollisionSegments.__end_;
    if (v36 != v37)
    {
      do
      {
        *(_OWORD *)v34[-2].f32 = *((_OWORD *)v36 - 1);
        v34 -= 2;
        v36 -= 16;
      }
      while (v36 != v37);
      int v36 = (char *)p_mNonCollisionSegments->__begin_;
    }
    self->mNonCollisionSegments.__begin_ = v34;
    self->mNonCollisionSegments.__end_ = v28;
    self->mNonCollisionSegments.__end_cap_.__value_ = v35;
    if (v36) {
      operator delete(v36);
    }
  }
  else
  {
    float32x2_t *end = v5;
    end[1] = v9;
    v28 = end + 2;
  }
  self->mNonCollisionSegments.__end_ = v28;
  return v7;
}

- (void)update
{
  self->float mTime = self->mTime + 0.016667;
  glUseProgram(self->mWetPaintProg);
  glUniform1f(self->mWetPaintProgTimeUniformLocation, self->mTime);
  if ((float)(self->mTime - self->mTimeWetBecameDirty) >= self->mParticleLifespan)
  {
    if (self->mVertexRange.location && !self->_didNotifyRendererDelegate)
    {
      self->_didNotifyRendererDelegate = 1;
      float32x2_t v3 = [(DKOpenGLRenderer *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v3 rendererDidFinishAnimatingDrawing:self];
      }
    }
  }
  else
  {
    [(DKOpenGLRenderer *)self updateWet];
  }
  NSUInteger length = self->mVertexRange.length;
  if (length)
  {
    NSUInteger location = self->mVertexRange.location;
    float mTime = self->mTime;
    begin = self->mContiguousVertexStorage.__begin_;
    float mParticleLifespan = self->mParticleLifespan;
    NSUInteger v9 = location + 1;
    float v10 = (float *)((char *)begin + 24 * location + 12);
    NSUInteger v11 = length - 1;
    do
    {
      if ((float)(mTime - *v10) < mParticleLifespan) {
        break;
      }
      self->mVertexRange.NSUInteger location = v9;
      self->mVertexRange.NSUInteger length = v11;
      ++v9;
      v10 += 6;
      --v11;
    }
    while (v11 != -1);
    end = self->mContiguousVertexStorage.__end_;
    float32x2_t v23 = 0;
    uint64_t v24 = 0;
    __p = 0;
    std::vector<Vertex>::__init_with_size[abi:ne180100]<std::__wrap_iter<Vertex*>,std::__wrap_iter<Vertex*>>(&__p, (char *)begin + 24 * location, (uint64_t)end, 0xAAAAAAAAAAAAAAABLL * ((end - (Vertex *)((char *)begin + 24 * location)) >> 3));
    LODWORD(v13) = 10.0;
    [(DKOpenGLRenderer *)self regionWithVertices:&__p withInflationAmount:v13];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    if (__p)
    {
      float32x2_t v23 = __p;
      operator delete(__p);
    }
    v25.origin.CGFloat x = v15;
    v25.origin.CGFloat y = v17;
    v25.size.CGFloat width = v19;
    v25.size.CGFloat height = v21;
    self->mDirtyCanvasRegion = CGRectUnion(self->mDirtyCanvasRegion, v25);
    [(DKOpenGLRenderer *)self updateDryCycleIncludingComposite:1];
    self->mDirtyCanvasRegion.origin.CGFloat x = v15;
    self->mDirtyCanvasRegion.origin.CGFloat y = v17;
    self->mDirtyCanvasRegion.size.CGFloat width = v19;
    self->mDirtyCanvasRegion.size.CGFloat height = v21;
  }
}

- (CGRect)regionWithVertices:()vector<Vertex withInflationAmount:(std:(float)a4 :allocator<Vertex>> *)a3
{
  float v4 = a4;
  CGFloat v6 = *MEMORY[0x263F001A0];
  CGFloat v5 = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat v8 = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat v7 = *(double *)(MEMORY[0x263F001A0] + 24);
  __p = 0;
  v41 = 0;
  v42 = 0;
  begin = a3->__begin_;
  if (a3->__begin_ == a3->__end_)
  {
    double v25 = v6;
    double v26 = v5;
    CGFloat v27 = v8;
  }
  else
  {
    do
    {
      if (v41 >= v42)
      {
        uint64_t v12 = (v41 - __p) >> 3;
        if ((unint64_t)(v12 + 1) >> 61) {
          std::vector<Page>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v13 = (v42 - __p) >> 2;
        if (v13 <= v12 + 1) {
          unint64_t v13 = v12 + 1;
        }
        if ((unint64_t)(v42 - __p) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v14 = v13;
        }
        if (v14) {
          CGFloat v15 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v42, v14);
        }
        else {
          CGFloat v15 = 0;
        }
        double v16 = &v15[8 * v12];
        *(void *)double v16 = *(void *)begin;
        NSUInteger v11 = v16 + 8;
        CGFloat v17 = v41;
        if (v41 != __p)
        {
          do
          {
            uint64_t v18 = *((void *)v17 - 1);
            v17 -= 8;
            *((void *)v16 - 1) = v18;
            v16 -= 8;
          }
          while (v17 != __p);
          CGFloat v17 = __p;
        }
        __p = v16;
        v42 = &v15[8 * v14];
        if (v17) {
          operator delete(v17);
        }
      }
      else
      {
        *(void *)v41 = *(void *)begin;
        NSUInteger v11 = v41 + 8;
      }
      v41 = v11;
      *(void *)&long long v19 = *(void *)begin;
      long long v39 = v19;
      *(CGFloat *)&long long v19 = v6;
      CGFloat v20 = v5;
      CGFloat v21 = v8;
      CGFloat v22 = v7;
      BOOL IsNull = CGRectIsNull(*(CGRect *)&v19);
      uint64_t v24 = *((void *)&v39 + 1);
      double v25 = *(float *)&v39;
      double v26 = *((float *)&v39 + 1);
      CGFloat v27 = 0.0;
      if (IsNull)
      {
        CGFloat v7 = 0.0;
      }
      else
      {
        v43.size.CGFloat width = 0.0;
        v43.size.CGFloat height = 0.0;
        v43.origin.CGFloat x = *(float *)&v39;
        v43.origin.CGFloat y = *((float *)&v39 + 1);
        v48.origin.CGFloat x = v6;
        v48.origin.CGFloat y = v5;
        v48.size.CGFloat width = v8;
        v48.size.CGFloat height = v7;
        *(CGRect *)&a4 = CGRectUnion(v43, v48);
        double v25 = *(double *)&a4;
        double v26 = v28;
        CGFloat v27 = v29;
        CGFloat v7 = v30;
      }
      begin = (Vertex *)((char *)begin + 24);
      CGFloat v8 = v27;
      CGFloat v5 = v26;
      CGFloat v6 = v25;
    }
    while (begin != a3->__end_);
  }
  v44.origin.CGFloat x = v25;
  v44.origin.CGFloat y = v26;
  v44.size.CGFloat width = v27;
  v44.size.CGFloat height = v7;
  if (CGRectIsNull(v44))
  {
    CGFloat x = *MEMORY[0x263F001A8];
    CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    v45.origin.CGFloat x = v25;
    v45.origin.CGFloat y = v26;
    v45.size.CGFloat width = v27;
    v45.size.CGFloat height = v7;
    CGRect v46 = CGRectInset(v45, (float)-v4, (float)-v4);
    CGFloat x = v46.origin.x;
    CGFloat y = v46.origin.y;
    CGFloat width = v46.size.width;
    CGFloat height = v46.size.height;
  }
  if (__p) {
    operator delete(__p);
  }
  double v35 = x;
  double v36 = y;
  double v37 = width;
  double v38 = height;
  result.size.CGFloat height = v38;
  result.size.CGFloat width = v37;
  result.origin.CGFloat y = v36;
  result.origin.CGFloat x = v35;
  return result;
}

- (CGRect)getVertexBounds
{
  __p = 0;
  CGFloat v17 = 0;
  uint64_t v18 = 0;
  std::vector<Vertex>::__init_with_size[abi:ne180100]<Vertex*,Vertex*>(&__p, self->mContiguousVertexStorage.__begin_, (uint64_t)self->mContiguousVertexStorage.__end_, 0xAAAAAAAAAAAAAAABLL * ((self->mContiguousVertexStorage.__end_ - self->mContiguousVertexStorage.__begin_) >> 3));
  LODWORD(v3) = 10.0;
  [(DKOpenGLRenderer *)self regionWithVertices:&__p withInflationAmount:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if (__p)
  {
    CGFloat v17 = __p;
    operator delete(__p);
  }
  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)updateWet
{
}

- (void)updateDryCycleIncludingComposite:(BOOL)a3
{
  BOOL v3 = a3;
  [(DKOpenGLRenderer *)self renderToDryPaintBuffer];
  if (v3)
  {
    [(DKOpenGLRenderer *)self renderToComposite:1];
  }
}

- (void)renderToWetPaintBufferWithRange:(_NSRange)a3
{
  GLsizei length = a3.length;
  GLint v5 = SLODWORD(a3.location) % self->mBufferSize;
  GLint params = 0;
  glGetIntegerv(0x8CA6u, &params);
  glBindFramebuffer(0x8D40u, self->mWetPaintBufferFBO);
  glEnable(0xBE2u);
  glBlendFunc(1u, 0x303u);
  glViewport(0, 0, *(void *)self->mWetPaintBufferSize, HIDWORD(*(void *)self->mWetPaintBufferSize));
  glUseProgram(self->mWetPaintProg);
  glBindVertexArrayOES();
  glBindBuffer(0x8892u, self->mVbo);
  glEnableVertexAttribArray(0);
  glEnableVertexAttribArray(1u);
  glEnableVertexAttribArray(2u);
  glEnableVertexAttribArray(3u);
  glEnableVertexAttribArray(4u);
  glClearColor(0.0, 0.0, 0.0, 0.0);
  glClear(0x4000u);
  int mBufferSize = self->mBufferSize;
  if (v5 + length <= mBufferSize)
  {
    GLint v8 = v5;
    GLsizei v7 = length;
  }
  else
  {
    glDrawArrays(0, v5, mBufferSize - v5);
    GLsizei v7 = (v5 + length) % self->mBufferSize;
    GLint v8 = 0;
  }
  glDrawArrays(0, v8, v7);
  glDisable(0xBE2u);
  glBindFramebuffer(0x8D40u, params);
}

- (void)renderToDryPaintBuffer
{
  begin = self->mPages.__begin_;
  if ((int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)) >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    do
    {
      double v6 = (char *)begin + v4;
      *(float *)((char *)begin + v4 + 32) = (float)((float)(int)v5 * (float)(int)*(void *)self->mCanvasSize)
                                          / (float)(int)*(void *)self->mCanvasSize;
      GLint params = 0;
      glGetIntegerv(0x8CA6u, &params);
      glBindFramebuffer(0x8D40u, *(_DWORD *)v6);
      glViewport(0, 0, *((void *)v6 + 1), HIDWORD(*((void *)v6 + 1)));
      glEnable(0xC11u);
      float backingScale = self->_backingScale;
      double v8 = backingScale;
      CGRect mDirtyCanvasRegion = self->mDirtyCanvasRegion;
      GLint v9 = (int)(mDirtyCanvasRegion.origin.x * v8);
      GLint v10 = (int)(mDirtyCanvasRegion.origin.y * v8);
      GLsizei v11 = (int)(CGRectGetWidth(mDirtyCanvasRegion) * v8);
      CGFloat Height = CGRectGetHeight(self->mDirtyCanvasRegion);
      glScissor(v9, v10, v11, (int)(Height * v8));
      glUseProgram(self->mDryPaintProg);
      glUniform1f(self->mDryPaintProgXCoordOffsetUniformLocation, *((GLfloat *)v6 + 8));
      glActiveTexture(0x84C0u);
      glBindTexture(0xDE1u, *((_DWORD *)v6 + 1));
      glActiveTexture(0x84C1u);
      glBindTexture(0xDE1u, self->mWetPaintBufferT);
      uint64_t v13 = *((void *)v6 + 1);
      *(float *)&double v14 = (float)(int)v13;
      *(float *)&double v15 = (float)SHIDWORD(v13);
      +[DKGLUtilities drawQuadAtX:0.0 Y:0.0 width:v14 height:v15];
      glDisable(0xC11u);
      glBindFramebuffer(0x8D40u, params);
      ++v5;
      begin = self->mPages.__begin_;
      v4 += 40;
    }
    while (v5 < (int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)));
  }
}

- (void)renderToComposite:(BOOL)a3
{
  begin = self->mPages.__begin_;
  if ((int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)) >= 1)
  {
    BOOL v4 = a3;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    U_COLOR = self->U_COLOR;
    unint64_t v9 = 0x26B6C4000uLL;
    BOOL v23 = a3;
    do
    {
      GLint v10 = (char *)begin + v6;
      *(float *)((char *)begin + v6 + 32) = (float)((float)(int)v7 * (float)(int)*(void *)self->mCanvasSize)
                                          / (float)(int)*(void *)self->mCanvasSize;
      GLint params = 0;
      glGetIntegerv(0x8CA6u, &params);
      glBindFramebuffer(0x8D40u, *(_DWORD *)((char *)begin + v6 + 16));
      if (!v4)
      {
        glClearColor(0.0, 0.0, 0.0, 0.0);
        glClear(0x4000u);
      }
      glViewport(0, 0, *((void *)v10 + 3), HIDWORD(*((void *)v10 + 3)));
      if (v4)
      {
        glEnable(0xC11u);
        float backingScale = self->_backingScale;
        double v12 = backingScale;
        CGRect mDirtyCanvasRegion = self->mDirtyCanvasRegion;
        GLint v13 = (int)(mDirtyCanvasRegion.origin.x * v12);
        double v14 = U_COLOR;
        unint64_t v15 = v9;
        int v16 = (int)(mDirtyCanvasRegion.origin.y * v12);
        GLsizei v17 = (int)(CGRectGetWidth(mDirtyCanvasRegion) * v12);
        CGFloat Height = CGRectGetHeight(self->mDirtyCanvasRegion);
        GLint v19 = v16;
        unint64_t v9 = v15;
        U_COLOR = v14;
        BOOL v4 = v23;
        glScissor(v13, v19, v17, (int)(Height * v12));
      }
      glUseProgram(self->mCompositeProg);
      glUniform4fv(self->mCompositeColorUniformLocation, 1, (const GLfloat *)U_COLOR);
      glActiveTexture(0x84C0u);
      glBindTexture(0xDE1u, *(_DWORD *)((char *)begin + v6 + 4));
      glActiveTexture(0x84C1u);
      glBindTexture(0xDE1u, self->mPaperTex);
      uint64_t v20 = *((void *)v10 + 3);
      *(float *)&double v21 = (float)(int)v20;
      *(float *)&double v22 = (float)SHIDWORD(v20);
      [(id)(v9 + 3320) drawQuadAtX:0.0 Y:0.0 width:v21 height:v22];
      if (v4) {
        glDisable(0xC11u);
      }
      glBindFramebuffer(0x8D40u, params);
      ++v7;
      begin = self->mPages.__begin_;
      v6 += 40;
    }
    while (v7 < (int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)));
  }
}

- (void)updateDryForcefully
{
  if (self->mVertexRange.length)
  {
    self->float mTime = self->mParticleLifespan + self->mTime;
    glUseProgram(self->mWetPaintProg);
    glUniform1f(self->mWetPaintProgTimeUniformLocation, self->mTime);
    [(DKOpenGLRenderer *)self updateWet];
    NSUInteger length = self->mVertexRange.length;
    begin = self->mContiguousVertexStorage.__begin_;
    NSUInteger location = self->mVertexRange.location;
    double v12 = 0;
    uint64_t v13 = 0;
    __p = 0;
    std::vector<Vertex>::__init_with_size[abi:ne180100]<std::__wrap_iter<Vertex*>,std::__wrap_iter<Vertex*>>(&__p, (char *)begin + 24 * location, (uint64_t)begin + 24 * length + 24 * location, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(24 * length) >> 3));
    LODWORD(v6) = 10.0;
    [(DKOpenGLRenderer *)self regionWithVertices:&__p withInflationAmount:v6];
    self->mDirtyCanvasRegion.origin.CGFloat x = v7;
    self->mDirtyCanvasRegion.origin.CGFloat y = v8;
    self->mDirtyCanvasRegion.size.CGFloat width = v9;
    self->mDirtyCanvasRegion.size.CGFloat height = v10;
    if (__p)
    {
      double v12 = __p;
      operator delete(__p);
    }
    [(DKOpenGLRenderer *)self updateDryCycleIncludingComposite:1];
    [(DKOpenGLRenderer *)self clearWetPaintBuffer];
  }
}

- (void)draw
{
  glEnable(0xBE2u);
  glBlendFunc(0x302u, 0x303u);
  +[DKGLUtilities setCurrentClearColor];
  glClear(0x4000u);
  float width = self->_bounds.size.width;
  float backingScale = self->_backingScale;
  GLsizei v5 = (int)(float)(width * backingScale);
  float height = self->_bounds.size.height;
  glViewport(0, 0, v5, (int)(float)(backingScale * height));
  [(DKOpenGLRenderer *)self drawComposite];
  glDisable(0xBE2u);
}

- (void)drawComposite
{
  uint64_t v3 = (int)*(void *)self->mCanvasSize;
  double v4 = (double)([(DKOpenGLRenderer *)self numPages] * v3);
  double v5 = (double)*(int *)&self->mCanvasSize[4];
  uint64_t v6 = *(void *)self->mCanvasOffset;
  double v7 = (double)(int)v6;
  double v8 = (double)SHIDWORD(v6);
  glUseProgram(self->mColorProg);
  __asm { FMOV            V0.4S, #1.0 }
  *(_OWORD *)v = _Q0;
  if (DKIsDarkMode()) {
    *(_OWORD *)v = xmmword_22AF74780;
  }
  glUniform4fv(self->mColorProgColorUniformLocation, 1, v);
  CGFloat width = self->_bounds.size.width;
  CGFloat height = self->_bounds.size.height;
  *(float *)&CGFloat width = width;
  *(float *)&CGFloat height = height;
  +[DKGLUtilities setProjectionMatrixForWidth:1 height:value flipped:width matrix:height];
  glUniformMatrix4fv(self->mColorProgModelViewProjectionUniformLocation, 1, 0, value);
  double backingScale = self->_backingScale;
  double v17 = backingScale * v7;
  double v18 = backingScale * v8;
  double v19 = backingScale * v4;
  double v20 = backingScale * v5;
  *(float *)&double backingScale = backingScale * v7;
  *(float *)&double v17 = v18;
  *(float *)&double v18 = v19;
  *(float *)&double v19 = v20;
  +[DKGLUtilities drawQuadAtX:backingScale Y:v17 width:v18 height:v19];
  begin = self->mPages.__begin_;
  if ((int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)) >= 1)
  {
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    do
    {
      int v24 = HIDWORD(*(void *)self->mCanvasSize);
      float v25 = (float)(int)*(void *)self->mCanvasSize;
      int v26 = HIDWORD(*(void *)self->mCanvasOffset);
      double v27 = (double)(int)*(void *)self->mCanvasOffset + (float)((float)(int)v23 * v25);
      glActiveTexture(0x84C0u);
      double v28 = (char *)begin + v22;
      glBindTexture(0xDE1u, *((_DWORD *)v28 + 5));
      glUseProgram(self->mTextureProg);
      double v29 = self->_backingScale;
      double v30 = (double)(int)*((void *)v28 + 3) / v29;
      *(float *)&double v30 = v30;
      double v31 = (double)(int)HIDWORD(*((void *)v28 + 3)) / v29;
      *(float *)&double v31 = v31;
      +[DKGLUtilities setProjectionMatrixForWidth:1 height:v36 flipped:v30 matrix:v31];
      glUniformMatrix4fv(self->mTextureProgModelViewProjectionUniformLocation, 1, 0, v36);
      *(float *)&double v32 = v27;
      *(float *)&double v33 = (float)v26;
      *(float *)&double v34 = (float)v24;
      *(float *)&double v35 = v25;
      +[DKGLUtilities drawQuadAtX:v32 Y:v33 width:v35 height:v34];
      ++v23;
      begin = self->mPages.__begin_;
      v22 += 40;
    }
    while (v23 < (int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)));
  }
}

- (void)undo
{
  if (self->mVertexHistory.__end_ != self->mVertexHistory.__begin_ && self->_undoEnabled)
  {
    [(DKOpenGLRenderer *)self removeVertexHistoryElement];
    [(DKOpenGLRenderer *)self drawContiguousVertexStorageImmediatelyWithLayeredBlending:1];
  }
}

- (void)drawContiguousVertexStorageImmediatelyWithLayeredBlending:(BOOL)a3
{
  BOOL v3 = a3;
  glEnable(0xBE2u);
  glBlendFunc(1u, 0x303u);
  +[DKGLUtilities setCurrentClearColor];
  glClear(0x4000u);
  glViewport(0, 0, (int)self->_backingScale * (int)self->_bounds.size.width, (int)self->_bounds.size.height * (int)self->_backingScale);
  [(DKOpenGLRenderer *)self clear];
  self->mNonCollisionSegments.__end_ = self->mNonCollisionSegments.__begin_;
  BOOL v5 = self->mContiguousVertexStorage.__end_ == self->mContiguousVertexStorage.__begin_;
  int64_t v6 = (self->mContiguousVertexStorage.__end_ - self->mContiguousVertexStorage.__begin_) >> 3;
  unsigned int v7 = -1431655765 * v6;
  self->mVertexRange.NSUInteger location = 0xAAAAAAAAAAAAAAABLL * v6;
  self->mVertexRange.NSUInteger length = 0;
  if (!v5)
  {
    unsigned int v8 = vcvtps_u32_f32((float)v7 / (float)self->mBufferSize);
    if (v3)
    {
      glUseProgram(self->mWetPaintProg);
      glUniform1i(self->mWetPaintProgSubtractEndPointsOnlyUniformLocation, 1);
    }
    if (v8)
    {
      int v9 = 0;
      while (1)
      {
        unsigned int mBufferSize = self->mBufferSize;
        unsigned int v11 = v7 - mBufferSize * v9;
        if (v11 >= mBufferSize) {
          unint64_t v12 = mBufferSize;
        }
        else {
          unint64_t v12 = v11;
        }
        uint64_t v13 = (char *)self->mContiguousVertexStorage.__begin_ + 24 * mBufferSize * v9;
        double v33 = 0;
        uint64_t v34 = 0;
        double v32 = 0;
        std::vector<Vertex>::__init_with_size[abi:ne180100]<std::__wrap_iter<Vertex*>,std::__wrap_iter<Vertex*>>(&v32, v13, (uint64_t)&v13[24 * v12], v12);
        __p = 0;
        double v30 = 0;
        uint64_t v31 = 0;
        std::vector<Vertex>::__init_with_size[abi:ne180100]<Vertex*,Vertex*>(&__p, v32, (uint64_t)v33, 0xAAAAAAAAAAAAAAABLL * (((char *)v33 - (unsigned char *)v32) >> 3));
        -[DKOpenGLRenderer updateVertexControllerWithData:range:allowWet:](self, "updateVertexControllerWithData:range:allowWet:", &__p, 0, v12, 0);
        if (__p)
        {
          double v30 = __p;
          operator delete(__p);
        }
        double v14 = (float *)v32;
        unint64_t v15 = v33;
        if (v32 != v33) {
          break;
        }
LABEL_25:
        if (v14)
        {
          double v33 = v14;
          operator delete(v14);
        }
        if (++v9 == v8) {
          goto LABEL_28;
        }
      }
      LODWORD(v16) = 0;
      LODWORD(v17) = 0;
      double v18 = (float *)((char *)v32 + 24);
      while (1)
      {
        uint64_t v16 = (v16 + 1);
        if (v18 == v15 || !v3)
        {
          if (v18 == v15) {
            goto LABEL_19;
          }
        }
        else if (v18[5] == 0.0 && *(v18 - 1) == 1.0)
        {
LABEL_19:
          uint64_t v19 = v17;
          -[DKOpenGLRenderer renderToWetPaintBufferWithRange:](self, "renderToWetPaintBufferWithRange:", v17, v16);
          double v20 = (char *)v32 + 24 * v17;
          uint64_t v17 = (v16 + v17);
          double v27 = 0;
          uint64_t v28 = 0;
          int v26 = 0;
          std::vector<Vertex>::__init_with_size[abi:ne180100]<std::__wrap_iter<Vertex*>,std::__wrap_iter<Vertex*>>(&v26, v20, (uint64_t)v32 + 24 * v17, v17 - v19);
          LODWORD(v21) = 10.0;
          [(DKOpenGLRenderer *)self regionWithVertices:&v26 withInflationAmount:v21];
          self->mDirtyCanvasRegion.origin.CGFloat x = v22;
          self->mDirtyCanvasRegion.origin.CGFloat y = v23;
          self->mDirtyCanvasRegion.size.CGFloat width = v24;
          self->mDirtyCanvasRegion.size.CGFloat height = v25;
          if (v26)
          {
            double v27 = v26;
            operator delete(v26);
          }
          [(DKOpenGLRenderer *)self updateDryCycleIncludingComposite:0];
          LODWORD(v16) = 0;
          unint64_t v15 = v33;
        }
        BOOL v5 = v18 == v15;
        v18 += 6;
        if (v5)
        {
          double v14 = (float *)v32;
          goto LABEL_25;
        }
      }
    }
LABEL_28:
    [(DKOpenGLRenderer *)self renderToComposite:0];
  }
  if (v3)
  {
    glUseProgram(self->mWetPaintProg);
    glUniform1i(self->mWetPaintProgSubtractEndPointsOnlyUniformLocation, 0);
  }
  glFinish();
}

- (BOOL)canvasIsEmpty
{
  return self->mContiguousVertexStorage.__end_ == self->mContiguousVertexStorage.__begin_;
}

- (void)resetRendererState
{
  self->mVertexRange.NSUInteger location = 0;
  self->mVertexRange.NSUInteger length = 0;
  *(void *)&self->float mTime = 0x3C23D70A3F822225;
  glUseProgram(self->mWetPaintProg);
  glUniform1f(self->mWetPaintProgTimeUniformLocation, self->mTime);
  self->float mParticleLifespan = 2.0;
  glUseProgram(self->mWetPaintProg);
  glUniform1f(self->mWetPaintProgLifespanUniformLocation, self->mParticleLifespan);
  CGSize v3 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->mDirtyCanvasRegion.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->mDirtyCanvasRegion.size = v3;
  self->mContiguousVertexStorage.__end_ = self->mContiguousVertexStorage.__begin_;
  self->mVertexHistory.__end_ = self->mVertexHistory.__begin_;
  self->_ignoreFirstUndoItem = 0;
  [(DKOpenGLRenderer *)self clear];
}

- (void)clear
{
  [(DKOpenGLRenderer *)self clearWetPaintBuffer];
  [(DKOpenGLRenderer *)self clearDryPaintBuffer];
  [(DKOpenGLRenderer *)self clearComposite];
}

- (void)clearWetPaintBuffer
{
  GLint params = 0;
  glGetIntegerv(0x8CA6u, &params);
  glBindFramebuffer(0x8D40u, self->mWetPaintBufferFBO);
  glClearColor(0.0, 0.0, 0.0, 0.0);
  glClear(0x4000u);
  glBindFramebuffer(0x8D40u, params);
}

- (void)clearDryPaintBuffer
{
  begin = self->mPages.__begin_;
  if ((int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)) >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    do
    {
      GLint params = 0;
      glGetIntegerv(0x8CA6u, &params);
      glBindFramebuffer(0x8D40u, *(_DWORD *)((char *)begin + v4));
      glClearColor(0.0, 0.0, 0.0, 0.0);
      glClear(0x4000u);
      glBindFramebuffer(0x8D40u, params);
      ++v5;
      begin = self->mPages.__begin_;
      v4 += 40;
    }
    while (v5 < (int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)));
  }
}

- (void)clearComposite
{
  begin = self->mPages.__begin_;
  if ((int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)) >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 16;
    do
    {
      GLint params = 0;
      glGetIntegerv(0x8CA6u, &params);
      glBindFramebuffer(0x8D40u, *(_DWORD *)((char *)begin + v5));
      glClearColor(0.0, 0.0, 0.0, 0.0);
      glClear(0x4000u);
      glBindFramebuffer(0x8D40u, params);
      ++v4;
      begin = self->mPages.__begin_;
      v5 += 40;
    }
    while (v4 < (int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)));
  }
}

- (void)didBeginNewStroke
{
  if ([(DKOpenGLRenderer *)self drawingEnabled] && self->_undoEnabled)
  {
    [(DKOpenGLRenderer *)self appendVertexHistoryElement];
  }
}

- (void)updateVertexControllerWithDataRange:(_NSRange)a3 allowWet:(BOOL)a4
{
  BOOL v4 = a4;
  int length = a3.length;
  NSUInteger v7 = a3.location % self->mBufferSize;
  float mTime = self->mTime;
  int v9 = (char *)self->mContiguousVertexStorage.__begin_ + 24 * a3.location;
  double v14 = 0;
  uint64_t v15 = 0;
  data = 0;
  std::vector<Vertex>::__init_with_size[abi:ne180100]<std::__wrap_iter<Vertex*>,std::__wrap_iter<Vertex*>>(&data, v9, (uint64_t)&v9[24 * a3.length], a3.length);
  if (v4)
  {
    CGFloat v10 = (float *)data;
    unsigned int v11 = v14;
    while (v10 != v11)
    {
      v10[3] = mTime;
      v10 += 6;
    }
  }
  GLuint mVbo = self->mVbo;
  if ((v7 + length) <= self->mBufferSize)
  {
    glBindBuffer(0x8892u, mVbo);
    glBufferSubData(0x8892u, 24 * (int)v7, 24 * length, data);
  }
  else
  {
    glBindBuffer(0x8892u, mVbo);
    glBufferSubData(0x8892u, 24 * (int)v7, 24 * (self->mBufferSize - v7), data);
    glBufferSubData(0x8892u, 0, 24 * (((int)v7 + length) % (unint64_t)self->mBufferSize), (char *)data + 24 * (int)v7 + 24 * (unint64_t)(self->mBufferSize - v7));
  }
  if (data)
  {
    double v14 = (float *)data;
    operator delete(data);
  }
}

- (void)updateVertexControllerWithData:()vector<Vertex range:(std:(_NSRange)a4 :(BOOL)a5 allocator<Vertex>> *)a3 allowWet:
{
  BOOL v5 = a5;
  int length = a4.length;
  NSUInteger v8 = a4.location % self->mBufferSize;
  float mTime = self->mTime;
  CGFloat v10 = (char *)a3->__begin_ + 24 * a4.location;
  unsigned int v11 = (char *)a3->__begin_ + 24 * a4.location + 24 * a4.length;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  data = 0;
  std::vector<Vertex>::__init_with_size[abi:ne180100]<std::__wrap_iter<Vertex*>,std::__wrap_iter<Vertex*>>(&data, v10, (uint64_t)v11, 0xAAAAAAAAAAAAAAABLL * ((int64_t)(24 * a4.length) >> 3));
  if (v5)
  {
    unint64_t v12 = (float *)data;
    uint64_t v13 = v16;
    while (v12 != v13)
    {
      v12[3] = mTime;
      v12 += 6;
    }
  }
  GLuint mVbo = self->mVbo;
  if ((v8 + length) <= self->mBufferSize)
  {
    glBindBuffer(0x8892u, mVbo);
    glBufferSubData(0x8892u, 24 * (int)v8, 24 * length, data);
  }
  else
  {
    glBindBuffer(0x8892u, mVbo);
    glBufferSubData(0x8892u, 24 * (int)v8, 24 * (self->mBufferSize - v8), data);
    glBufferSubData(0x8892u, 0, 24 * (((int)v8 + length) % (unint64_t)self->mBufferSize), (char *)data + 24 * (int)v8 + 24 * (unint64_t)(self->mBufferSize - v8));
  }
  if (data)
  {
    uint64_t v16 = (float *)data;
    operator delete(data);
  }
}

- (id)snapshotImage
{
  if (!+[DKGLUtilities gpuAvailable]
    || self->mPages.__end_ == self->mPages.__begin_)
  {
    CGSize v3 = 0;
  }
  else
  {
    [(DKOpenGLRenderer *)self update];
    [(DKOpenGLRenderer *)self draw];
    CGSize v3 = +[DKGLUtilities snapshotImageOfFrameBufferWithID:bufferSize:displayScale:](DKGLUtilities, "snapshotImageOfFrameBufferWithID:bufferSize:displayScale:", *((unsigned int *)self->mPages.__begin_ + 4), self->_bounds.size.width, self->_bounds.size.height, self->_backingScale);
  }
  return v3;
}

- (DKOpenGLRendererDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DKOpenGLRendererDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)inkColor
{
  return self->_inkColor;
}

- (double)lineWidthScale
{
  return self->_lineWidthScale;
}

- (void)setLineWidthScale:(double)a3
{
  self->_float lineWidthScale = a3;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isUndoEnabled
{
  return self->_undoEnabled;
}

- (void)setUndoEnabled:(BOOL)a3
{
  self->_undoEnabled = a3;
}

- (BOOL)ignoreFirstUndoItem
{
  return self->_ignoreFirstUndoItem;
}

- (void)setIgnoreFirstUndoItem:(BOOL)a3
{
  self->_ignoreFirstUndoItem = a3;
}

- (double)backingScale
{
  return self->_backingScale;
}

- (BOOL)drawingEnabled
{
  return self->_drawingEnabled;
}

- (BOOL)allowWetComposite
{
  return self->_allowWetComposite;
}

- (int64_t)numPages
{
  return self->_numPages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inkColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  begin = self->mPages.__begin_;
  if (begin)
  {
    self->mPages.__end_ = begin;
    operator delete(begin);
  }
  BOOL v4 = self->mNonCollisionSegments.__begin_;
  if (v4)
  {
    self->mNonCollisionSegments.__end_ = v4;
    operator delete(v4);
  }
  BOOL v5 = self->mVertexHistory.__begin_;
  if (v5)
  {
    self->mVertexHistory.__end_ = v5;
    operator delete(v5);
  }
  int64_t v6 = self->mContiguousVertexStorage.__begin_;
  if (v6)
  {
    self->mContiguousVertexStorage.__end_ = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *((void *)self + 20) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 22) = 0;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((void *)self + 16) = 0;
  return self;
}

@end