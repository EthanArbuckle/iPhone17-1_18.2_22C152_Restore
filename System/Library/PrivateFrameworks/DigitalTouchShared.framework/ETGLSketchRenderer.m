@interface ETGLSketchRenderer
+ (void)warmupShaders;
- ($8EF4127CF77ECA3DDB612FCF233DC3A8)allVertices;
- (BOOL)isDying;
- (BOOL)renderingOffscreen;
- (BOOL)resizeFromCachedLayer;
- (BOOL)resizeFromLayer:(id)a3;
- (BOOL)useFastVerticalWisp;
- (CAEAGLLayer)cachedLayer;
- (CGImage)createRenderedFrameImageUsingAlpha:(BOOL)a3;
- (EAGLContext)context;
- (ETGLSketchRenderer)initWithContext:(id)a3 andDrawable:(id)a4;
- (ETGLSketchRendererDelegate)delegate;
- (__n128)brushColorForFinalColor;
- (__n128)brushColorForInitialColor;
- (double)cometScaleFactor;
- (double)lineWidthScaleFactor;
- (double)wispDelay;
- (float)currentTimeClock;
- (float)currentTimeIndex;
- (float)deathTime;
- (float)lastBirth;
- (id)completionBlock;
- (int)linkProgramWithVShader:(int)a3 FShader:(int)a4;
- (int)loadOneShaderOfType:(unsigned int)a3 withCString:(const char *)a4 length:(int)a5;
- (int)vertexBufferBegin;
- (int)vertexBufferCount;
- (unint64_t)vertexCount;
- (unsigned)allocatedHeight;
- (unsigned)allocatedWidth;
- (unsigned)backingHeight;
- (unsigned)backingWidth;
- (unsigned)shaderProgram;
- (unsigned)vaoLineID;
- (unsigned)vboVertLineId;
- (unsigned)viewFramebuffer;
- (unsigned)viewRenderbuffer;
- (void)_warmupShaders;
- (void)animateOutWithCompletion:(id)a3;
- (void)appendDualPointArray:(ETGLSketchRenderer *)self length:(SEL)a2 controlPoint:alternatePoints:alternateLength:alternateControlPoint:unitSize:segmentIndex:segmentCount:;
- (void)appendPointArray:(ETGLSketchRenderer *)self length:(SEL)a2;
- (void)dealloc;
- (void)erase;
- (void)render;
- (void)reset;
- (void)setAllVertices:(id *)a3;
- (void)setAllocatedHeight:(unsigned int)a3;
- (void)setAllocatedWidth:(unsigned int)a3;
- (void)setBackingHeight:(unsigned int)a3;
- (void)setBackingWidth:(unsigned int)a3;
- (void)setBrushColorForFinalColor:(ETGLSketchRenderer *)self;
- (void)setBrushColorForInitialColor:(ETGLSketchRenderer *)self;
- (void)setCachedLayer:(id)a3;
- (void)setCometScaleFactor:(double)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setContext:(id)a3;
- (void)setDeathTime:(float)a3;
- (void)setDelegate:(id)a3;
- (void)setFinalDrawingColor:(ETGLSketchRenderer *)self;
- (void)setInitialDrawingColor:(ETGLSketchRenderer *)self;
- (void)setIsDying:(BOOL)a3;
- (void)setLastBirth:(float)a3;
- (void)setLineWidthScaleFactor:(double)a3;
- (void)setRenderingOffscreen:(BOOL)a3;
- (void)setShaderProgram:(unsigned int)a3;
- (void)setUseFastVerticalWisp:(BOOL)a3;
- (void)setVaoLineID:(unsigned int)a3;
- (void)setVboVertLineId:(unsigned int)a3;
- (void)setVertexBufferBegin:(int)a3;
- (void)setVertexBufferCount:(int)a3;
- (void)setVertexCount:(unint64_t)a3;
- (void)setViewFramebuffer:(unsigned int)a3;
- (void)setViewRenderbuffer:(unsigned int)a3;
- (void)setWispDelay:(double)a3;
- (void)setupFBOs:(id)a3;
- (void)setupShaders;
- (void)setupTexture;
- (void)setupVAOs;
- (void)updateGLWithCurrentTime;
- (void)updateGLWithTime:(float)a3;
- (void)updateVertexBufferWithVertexCount:(unint64_t)a3;
@end

@implementation ETGLSketchRenderer

- (ETGLSketchRenderer)initWithContext:(id)a3 andDrawable:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v6 = (EAGLContext *)a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ETGLSketchRenderer;
  v8 = [(ETGLSketchRenderer *)&v14 init];
  v9 = v8;
  if (v8)
  {
    [(ETGLSketchRenderer *)v8 setIsDying:0];
    *(void *)&v9->_allocatedWidth = 0;
    v9->_lineWidthScaleFactor = 1.0;
    v9->_cometScaleFactor = 1.0;
    v9->_context = v6;
    if (v7)
    {
      [(ETGLSketchRenderer *)v9 setupFBOs:v7];
      [(ETGLSketchRenderer *)v9 setupVAOs];
    }
    [(ETGLSketchRenderer *)v9 setupShaders];
    [(ETGLSketchRenderer *)v9 setupTexture];
    glEnable(0xBE2u);
    glBlendFunc(1u, 0x303u);
    GLenum Error = glGetError();
    if (Error && IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[ETGLSketchRenderer initWithContext:andDrawable:]";
        __int16 v17 = 1024;
        GLenum v18 = Error;
        _os_log_impl(&dword_23B55A000, v11, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", buf, 0x12u);
      }
    }
    *(void *)&v9->_vertexBufferCount = 0;
    *(void *)&v9->_currentTimeClock = 0;
    v12 = v9;
  }

  return v9;
}

- (void)dealloc
{
  allVertices = self->_allVertices;
  if (allVertices)
  {
    free(allVertices);
    self->_allVertices = 0;
  }
  v4 = [MEMORY[0x263F146E8] currentContext];
  context = self->_context;

  if (v4 == context) {
    [MEMORY[0x263F146E8] setCurrentContext:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)ETGLSketchRenderer;
  [(ETGLSketchRenderer *)&v6 dealloc];
}

- (void)animateOutWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__ETGLSketchRenderer_animateOutWithCompletion___block_invoke;
  v12[3] = &unk_264DECAE8;
  objc_copyWeak(&v14, &location);
  id v5 = v4;
  id v13 = v5;
  uint64_t v6 = MEMORY[0x23ECC8210](v12);
  id v7 = (void *)v6;
  double wispDelay = self->_wispDelay;
  if (wispDelay == 0.0)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
  else
  {
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(wispDelay * 1000000000.0));
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__ETGLSketchRenderer_animateOutWithCompletion___block_invoke_2;
    v10[3] = &unk_264DECA18;
    id v11 = v7;
    dispatch_after(v9, MEMORY[0x263EF83A0], v10);
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __47__ETGLSketchRenderer_animateOutWithCompletion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setIsDying:1];

  id v5 = (id)[*(id *)(a1 + 32) copy];
  id v4 = objc_loadWeakRetained(v2);
  [v4 setCompletionBlock:v5];
}

uint64_t __47__ETGLSketchRenderer_animateOutWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateGLWithTime:(float)a3
{
  self->_currentTimeClock = a3;
  if (![(ETGLSketchRenderer *)self isDying]) {
    self->_deathTime = self->_currentTimeClock;
  }
}

- (void)updateGLWithCurrentTime
{
  self->_currentTimeClock = self->_currentTimeClock + 0.016667;
  if (![(ETGLSketchRenderer *)self isDying]) {
    self->_deathTime = self->_currentTimeClock;
  }
}

- (void)setInitialDrawingColor:(ETGLSketchRenderer *)self
{
  *(_OWORD *)self->_brushColorForInitialColor = *v2;
}

- (void)setFinalDrawingColor:(ETGLSketchRenderer *)self
{
  *(_OWORD *)self->_brushColorForFinalColor = *v2;
}

- (void)setupFBOs:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  glGenFramebuffers(1, &self->_viewFramebuffer);
  glGenRenderbuffers(1, &self->_viewRenderbuffer);
  glBindFramebuffer(0x8D40u, self->_viewFramebuffer);
  glBindRenderbuffer(0x8D41u, self->_viewRenderbuffer);
  [(EAGLContext *)self->_context renderbufferStorage:36161 fromDrawable:v4];
  glFramebufferRenderbuffer(0x8D40u, 0x8CE0u, 0x8D41u, self->_viewRenderbuffer);
  *(void *)params = 0;
  glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &params[1]);
  glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, params);
  unsigned int v5 = params[0];
  self->_backingWidth = params[1];
  self->_backingHeight = v5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      GLint v11 = params[1];
      __int16 v12 = 1024;
      GLint v13 = params[0];
      _os_log_impl(&dword_23B55A000, v6, OS_LOG_TYPE_INFO, "w and h -  %i %i", buf, 0xEu);
    }
  }
  if (self->_backingWidth && self->_backingHeight)
  {
    if (glCheckFramebufferStatus(0x8D40u) != 36053 && IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        GLenum v8 = glCheckFramebufferStatus(0x8D40u);
        *(_DWORD *)buf = 67109120;
        GLint v11 = v8;
        _os_log_impl(&dword_23B55A000, v7, OS_LOG_TYPE_INFO, "failed to make complete framebuffer object %x", buf, 8u);
      }
    }
    glViewport(0, 0, self->_backingWidth, self->_backingHeight);
  }
}

- (void)setupTexture
{
  GLuint textures = 0;
  if ((setupTexture_alreadyGeneratedStaticPixelsData & 1) == 0)
  {
    int v3 = 0;
    id v4 = &setupTexture_pixels;
    __asm
    {
      FMOV            V3.4S, #4.0
      FMOV            V4.4S, #1.0
    }
    float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    do
    {
      *(float *)v2.i32 = (float)((float)((float)v3 / 7.0) + -0.5) * (float)((float)((float)v3 / 7.0) + -0.5);
      float32x4_t v12 = (float32x4_t)vdupq_lane_s32(v2, 0);
      float32x4_t v13 = vmlsq_f32(_Q4, _Q3, vaddq_f32(v12, (float32x4_t)xmmword_23B58D990));
      float32x4_t v14 = vaddq_f32(v12, (float32x4_t)xmmword_23B58D9A0);
      float32x4_t v15 = vmlsq_f32(_Q4, _Q3, v14);
      *(int8x8_t *)v14.f32 = vand_s8(vorr_s8((int8x8_t)vmovn_s32(vcvtq_s32_f32(vmulq_f32(v13, v11))), (int8x8_t)vmovn_s32(vcgeq_f32(v13, _Q4))), (int8x8_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vclezq_f32(v13))));
      int16x8_t v16 = (int16x8_t)vmvnq_s8((int8x16_t)vclezq_f32(v15));
      v2.i32[0] = vmovn_s16((int16x8_t)v14).u32[0];
      *(int8x8_t *)v16.i8 = vand_s8(vorr_s8((int8x8_t)vmovn_s32(vcvtq_s32_f32(vmulq_f32(v15, v11))), (int8x8_t)vmovn_s32(vcgeq_f32(v15, _Q4))), (int8x8_t)vmovn_s32((int32x4_t)v16));
      v2.i32[1] = vmovn_s16(v16).u32[0];
      *v4++ = (uint64_t)v2;
      ++v3;
    }
    while (v3 != 8);
    setupTexture_alreadyGeneratedStaticPixelsData = 1;
  }
  glGenTextures(1, &textures);
  glBindTexture(0xDE1u, textures);
  glPixelStorei(0xCF5u, 1);
  glTexParameteri(0xDE1u, 0x2801u, 9729);
  glTexParameteri(0xDE1u, 0x2800u, 9729);
  glTexParameteri(0xDE1u, 0x2802u, 33071);
  glTexParameteri(0xDE1u, 0x2803u, 33071);
  glTexImage2D(0xDE1u, 0, 6403, 8, 8, 0, 0x1903u, 0x1401u, &setupTexture_pixels);
}

- (void)setupShaders
{
  self->_shaderProgram = -[ETGLSketchRenderer linkProgramWithVShader:FShader:](self, "linkProgramWithVShader:FShader:", -[ETGLSketchRenderer loadOneShaderOfType:withCString:length:](self, "loadOneShaderOfType:withCString:length:", 35633, "#version 100\n#extension GL_EXT_separate_shader_objects : enable\n\nlayout(id location = 0) attribute vec4 in_Vertex;\n"
                             "layout(id location = 1) attribute vec4 in_InitialColor;\n"
                             "layout(id location = 2) attribute vec4 in_FinalColor;\n"
                             "layout(id location = 3) attribute vec4 in_TimesAndNoise;\n"
                             "layout(id location = 4) attribute vec4 in_PointSize;\n"
                             "\n"
                             "layout(id location = 5) attribute float in_CurrentTime;\n"
                             "layout(id location = 6) attribute float in_DeathTime;\n"
                             "layout(id location = 7) attribute float in_LastBirthTime;\n"
                             "layout(id location = 8) attribute float in_DeathPerPoint;\n"
                             "layout(id location = 9) attribute float in_DeathUntilKill;\n"
                             "\n"
                             "varying mediump vec4  out_Color;\n"
                             "\n"
                             "void main(void)\n"
                             "{\n"
                             "mediump float cometLife = 0.3;\n"
                             "mediump float colorChangeTime = 5.25;\n"
                             "mediump float relaxationTime = 5.0;\n"
                             "mediump float life = (in_CurrentTime - in_TimesAndNoise.x);\n"
                             "mediump float birthToDeathRatio = in_TimesAndNoise.y/in_LastBirthTime;\n"
                             "mediump float kTimeIndexIncrement = 0.016666666667;\n"
                             "mediump float cometLifeRatio;\n"
                             "mediump float deathRatio;\n"
                             "mediump float deathRatioTriangle;\n"
                             "mediump float tailRatio;\n"
                             "deathRatio = (in_CurrentTime - in_DeathTime);\n"
                             "deathRatio = clamp(deathRatio - birthToDeathRatio * (in_DeathUntilKill - in_DeathPerPoint),"
                             " 0.0, in_DeathPerPoint) / in_DeathPerPoint;\n"
                             "tailRatio = step((in_LastBirthTime - 500.0 * kTimeIndexIncrement)/in_LastBirthTime, birthTo"
                             "DeathRatio) * step(0.01, deathRatio) * birthToDeathRatio * deathRatio;\n"
                             "cometLifeRatio = 1.0 - clamp(life, 0.0, cometLife) / cometLife;\n"
                             "cometLifeRatio = smoothstep(0.0, 1.0, cometLifeRatio);\n"
                             "mediump float relaxationRatio = clamp(life, 0.0, relaxationTime) / relaxationTime;\n"
                             "mediump float colorChangeRatio = clamp(life, 0.0, colorChangeTime) / colorChangeTime;\n"
                             "deathRatioTriangle = 1.0 - clamp(abs((deathRatio - 0.25) * 4.0), 0.0, 1.0);\n"
                             "vec2 pos = vec2(in_Vertex.xy + (in_Vertex.zw - in_Vertex.xy) * relaxationRatio * relaxation"
                             "Ratio * relaxationRatio * (relaxationRatio * (relaxationRatio * 6. - 15.) + 10.));\n"
                             "pos = pos + ((1.0+in_PointSize.z) * in_TimesAndNoise.zw * deathRatio * deathRatio * (1.0 + "
                             "(tailRatio * tailRatio * tailRatio * 1.25)));\n"
                             "mediump float deathTime = in_CurrentTime - in_DeathTime;\n"
                             "pos = (pos * (1.0-(in_PointSize.z*0.3)*deathTime*deathTime)) + vec2(0.0, in_PointSize.z*dea"
                             "thTime*deathTime*deathTime);\n"
                             "gl_Position = vec4(pos, 0.0, 1.0);\n"
                             "gl_PointSize = (1.0 + 7.0 * cometLifeRatio * in_PointSize.y) * in_PointSize.x;\n"
                             "gl_PointSize -= (gl_PointSize-1.0) * deathRatio * deathRatio * deathRatio;\n"
                             "gl_PointSize += 31.0 * tailRatio * tailRatio * tailRatio * in_PointSize.y;\n"
                             "out_Color = mix(in_InitialColor, in_FinalColor, colorChangeRatio);\n"
                             "out_Color.rgb = mix(out_Color.rgb, vec3(1.0), cometLifeRatio + deathRatioTriangle * 0.3);\n"
                             "out_Color.a = (1.0 - deathRatio) * (1.0 - tailRatio) * (0.15 + 0.85 * (1.0 - cometLifeRatio));\n}\n",
                             2760),
                           -[ETGLSketchRenderer loadOneShaderOfType:withCString:length:](self, "loadOneShaderOfType:withCString:length:", 35632, "#version 100\n\nuniform mediump sampler2D theTex;\n"
                             "varying mediump vec4  out_Color;\n"
                             "\n"
                             "void main(void)\n"
                             "{\n"
                             "gl_FragColor = out_Color;\n"
                             "gl_FragColor.a *= texture2D(theTex, gl_PointCoord).r;\n"
                             "gl_FragColor.rgb *= gl_FragColor.a;\n"
                             "}\n",
                             218));
}

- (int)loadOneShaderOfType:(unsigned int)a3 withCString:(const char *)a4 length:(int)a5
{
  string = (GLchar *)a4;
  GLint v8 = 0;
  GLint length = a5;
  GLint params = 0;
  GLuint Shader = glCreateShader(a3);
  glShaderSource(Shader, 1, (const GLchar *const *)&string, &length);
  glCompileShader(Shader);
  glGetShaderiv(Shader, 0x8B81u, &params);
  glGetShaderiv(Shader, 0x8B84u, &v8);
  return Shader;
}

- (int)linkProgramWithVShader:(int)a3 FShader:(int)a4
{
  *(void *)GLint params = 0;
  GLuint Program = glCreateProgram();
  glAttachShader(Program, a3);
  glAttachShader(Program, a4);
  glLinkProgram(Program);
  glGetProgramiv(Program, 0x8B82u, params);
  glGetProgramiv(Program, 0x8B84u, &params[1]);
  glDetachShader(Program, a3);
  glDetachShader(Program, a4);
  glDeleteShader(a3);
  glDeleteShader(a4);
  return Program;
}

- (void)setupVAOs
{
  glGenVertexArraysOES();
  glBindVertexArrayOES();
  glGenBuffers(1, &self->_vboVertLineId);
  glBindBuffer(0x8892u, self->_vboVertLineId);
  self->_allVertices = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(0x5000uLL, 0x50uLL, 0x10000404247E4FDuLL);
  glBufferData(0x8892u, 1638400, 0, 0x88E8u);
  glEnableVertexAttribArray(0);
  glVertexAttribPointer(0, 4, 0x1406u, 0, 80, 0);
  glEnableVertexAttribArray(1u);
  glVertexAttribPointer(1u, 4, 0x1406u, 0, 80, (const GLvoid *)0x10);
  glEnableVertexAttribArray(2u);
  glVertexAttribPointer(2u, 4, 0x1406u, 0, 80, (const GLvoid *)0x20);
  glEnableVertexAttribArray(3u);
  glVertexAttribPointer(3u, 4, 0x1406u, 0, 80, (const GLvoid *)0x30);
  glEnableVertexAttribArray(4u);

  glVertexAttribPointer(4u, 4, 0x1406u, 0, 80, (const GLvoid *)0x40);
}

- (BOOL)resizeFromCachedLayer
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (self->_allocatedWidth)
  {
    [(CAEAGLLayer *)self->_cachedLayer bounds];
    if (*(void *)&self->_backingWidth == __PAIR64__((int)v4, (int)v3))
    {
      if (IMOSLoggingEnabled())
      {
        unsigned int v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23B55A000, v5, OS_LOG_TYPE_INFO, "Redundantly resizing Sketch renderer", buf, 2u);
        }
      }
    }
  }
  glBindFramebuffer(0x8D40u, self->_viewFramebuffer);
  glBindRenderbuffer(0x8D41u, self->_viewRenderbuffer);
  [(EAGLContext *)self->_context renderbufferStorage:36161 fromDrawable:self->_cachedLayer];
  *(void *)GLint params = 0;
  glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &params[1]);
  glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, params);
  unsigned int v6 = params[0];
  self->_GLsizei backingWidth = params[1];
  self->_GLsizei backingHeight = v6;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)GLenum v18 = params[1];
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = params[0];
      _os_log_impl(&dword_23B55A000, v7, OS_LOG_TYPE_INFO, "resizing layer -  %i %i", buf, 0xEu);
    }
  }
  GLsizei backingWidth = self->_backingWidth;
  if (!backingWidth) {
    goto LABEL_24;
  }
  GLsizei backingHeight = self->_backingHeight;
  if (!backingHeight) {
    goto LABEL_24;
  }
  glViewport(0, 0, backingWidth, backingHeight);
  if (glCheckFramebufferStatus(0x8D40u) != 36053)
  {
    int v12 = IMOSLoggingEnabled();
    if (!v12) {
      return v12;
    }
    float32x4_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      GLenum v14 = glCheckFramebufferStatus(0x8D40u);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)GLenum v18 = v14;
      _os_log_impl(&dword_23B55A000, v13, OS_LOG_TYPE_INFO, "failed to make complete framebuffer object %x", buf, 8u);
    }

LABEL_24:
    LOBYTE(v12) = 0;
    return v12;
  }
  GLenum Error = glGetError();
  if (Error && IMOSLoggingEnabled())
  {
    float32x4_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)GLenum v18 = "-[ETGLSketchRenderer resizeFromCachedLayer]";
      *(_WORD *)&v18[8] = 1024;
      GLenum v19 = Error;
      _os_log_impl(&dword_23B55A000, v11, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", buf, 0x12u);
    }
  }
  *(void *)&self->_allocatedWidth = *(void *)&self->_backingWidth;
  LOBYTE(v12) = 1;
  return v12;
}

- (BOOL)resizeFromLayer:(id)a3
{
  self->_cachedLayer = (CAEAGLLayer *)a3;
  return [(ETGLSketchRenderer *)self resizeFromCachedLayer];
}

- (void)reset
{
  p_viewFramebuffer = &self->_viewFramebuffer;
  if (self->_viewFramebuffer)
  {
    glDeleteFramebuffers(1, p_viewFramebuffer);
    unsigned int *p_viewFramebuffer = 0;
  }
  if (self->_viewRenderbuffer)
  {
    glDeleteRenderbuffers(1, &self->_viewRenderbuffer);
    self->_viewRenderbuffer = 0;
  }
  if (self->_vboVertLineId)
  {
    glDeleteBuffers(1, &self->_vboVertLineId);
    self->_vboVertLineId = 0;
  }
  unsigned int vaoLineID = self->_vaoLineID;
  p_unsigned int vaoLineID = &self->_vaoLineID;
  if (vaoLineID)
  {
    glDeleteVertexArraysOES();
    unsigned int *p_vaoLineID = 0;
  }
}

- (void)erase
{
  *(void *)&self->_vertexBufferCount = 0;
  *(void *)&self->_currentTimeClock = 0;
  *(void *)&self->_deathTime = 0;
}

- (void)appendPointArray:(ETGLSketchRenderer *)self length:(SEL)a2
{
  uint64_t vertexBufferCount = self->_vertexBufferCount;
  unint64_t v6 = vertexBufferCount + v3;
  unint64_t v7 = 20479 - vertexBufferCount;
  if (v6 >> 12 <= 4) {
    unint64_t v8 = v3;
  }
  else {
    unint64_t v8 = v7;
  }
  if (v8)
  {
    uint64_t v9 = v2;
    unint64_t v10 = 0;
    __asm { FMOV            V0.2S, #6.0 }
    float32x2_t v37 = _D0;
    float32x2_t v38 = (float32x2_t)vdup_n_s32(0x2F800000u);
    __asm
    {
      FMOV            V12.2S, #-15.0
      FMOV            V13.2S, #10.0
    }
    float32x2_t v18 = (float32x2_t)vdup_n_s32(0x3E19999Au);
    float32x2_t v19 = (float32x2_t)vdup_n_s32(0x3C23D70Au);
    __asm { FMOV            V8.2S, #1.0 }
    do
    {
      *(void *)&long long v21 = *(void *)(v9 + 8 * v10);
      allVertices = self->_allVertices;
      uint64_t v23 = 80 * ((int)v10 + self->_vertexBufferCount);
      *((void *)&v21 + 1) = vextq_s8(*(int8x16_t *)((char *)allVertices + v23), *(int8x16_t *)((char *)allVertices + v23), 8uLL).u64[0];
      *(_OWORD *)((char *)allVertices + v23) = v21;
      v24 = self->_allVertices;
      uint64_t v25 = 80 * ((int)v10 + self->_vertexBufferCount);
      long long v26 = *(_OWORD *)((char *)v24 + v25);
      *((void *)&v26 + 1) = *(void *)(v9 + 8 * v10);
      *(_OWORD *)((char *)v24 + v25) = v26;
      float v27 = self->_currentTimeClock + (float)((float)((float)(int)v10 / (float)v8) * 0.016667);
      uint32_t v28 = arc4random();
      float32x2_t v29 = vmul_f32(vcvt_f32_u32((uint32x2_t)__PAIR64__(arc4random(), v28)), v38);
      float32x2_t v30 = vmla_f32(v19, v18, vmul_f32(vmla_f32(_D13, vmla_f32(_D12, v37, v29), v29), vmul_f32(v29, vmul_f32(v29, vmul_f32(v29, vmul_f32(v29, v29))))));
      srdnoise2();
      v31 = (char *)self->_allVertices + 80 * (int)v10 + 80 * self->_vertexBufferCount;
      long long v32 = *((_OWORD *)v31 + 3);
      *((float32x2_t *)&v32 + 1) = vmul_f32(v30, 0);
      *((_OWORD *)v31 + 3) = v32;
      *((float *)self->_allVertices + 20 * (int)v10 + 20 * self->_vertexBufferCount + 12) = v27;
      float v33 = self->_currentTimeIndex + 0.016667;
      self->_currentTimeIndex = v33;
      *((float *)self->_allVertices + 20 * (int)v10 + 20 * self->_vertexBufferCount + 13) = v33;
      float v34 = self->_lineWidthScaleFactor * 8.0;
      *((float *)self->_allVertices + 20 * (int)v10 + 20 * self->_vertexBufferCount + 16) = v34;
      float cometScaleFactor = self->_cometScaleFactor;
      *((float *)self->_allVertices + 20 * (int)v10 + 20 * self->_vertexBufferCount + 17) = cometScaleFactor;
      float v36 = 3.0;
      if (!self->_useFastVerticalWisp) {
        float v36 = 0.0;
      }
      *((float *)self->_allVertices + 20 * (int)v10 + 20 * self->_vertexBufferCount + 18) = v36;
      *((_OWORD *)self->_allVertices + 5 * (int)v10 + 5 * self->_vertexBufferCount + 1) = *(_OWORD *)self->_brushColorForInitialColor;
      *((_OWORD *)self->_allVertices + 5 * (int)v10++ + 5 * self->_vertexBufferCount + 2) = *(_OWORD *)self->_brushColorForFinalColor;
    }
    while (v8 > v10);
  }
  self->_lastBirth = self->_currentTimeIndex;
  self->_vertexCount = v8;
  -[ETGLSketchRenderer updateVertexBufferWithVertexCount:](self, "updateVertexBufferWithVertexCount:", v8, *(void *)&v37, *(void *)&v38);
}

- (void)appendDualPointArray:(ETGLSketchRenderer *)self length:(SEL)a2 controlPoint:alternatePoints:alternateLength:alternateControlPoint:unitSize:segmentIndex:segmentCount:
{
  uint64_t v12 = v5 - 1;
  if (v5 == 1)
  {
    self->_currentTimeIndex = fmaxf(self->_currentTimeIndex + -0.83333, 0.0);
  }
  else if (v3 >= 2 && v5)
  {
    float32x2_t v13 = v9;
    GLenum v14 = v4;
    float32x2_t v15 = v8;
    int16x8_t v16 = v2;
    float32x2_t v17 = vsub_f32(*v2, v8);
    int32x2_t v18 = (int32x2_t)vmul_f32(v17, v17);
    unint64_t v19 = v3 - 1;
    float32x2_t v20 = vsub_f32(v15, v2[v3 - 1]);
    int32x2_t v21 = (int32x2_t)vmul_f32(v20, v20);
    float32x2_t v22 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v18, v21), (float32x2_t)vzip2_s32(v18, v21)));
    float32x2_t v23 = vsub_f32(*v4, v13);
    int32x2_t v24 = (int32x2_t)vmul_f32(v23, v23);
    float32x2_t v25 = vsub_f32(v13, v4[v12]);
    int32x2_t v26 = (int32x2_t)vmul_f32(v25, v25);
    int v27 = (int)(float)(vaddv_f32(v22) / v10);
    int v28 = (int)(float)(vaddv_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v24, v26), (float32x2_t)vzip2_s32(v24, v26))))
                     / v10);
    if (v27 <= v28) {
      uint64_t v29 = v28;
    }
    else {
      uint64_t v29 = v27;
    }
    if ((int)v29 < 1)
    {
      uint64_t v30 = 0;
    }
    else
    {
      uint64_t v30 = 0;
      float v31 = 1.0 / (float)v7;
      float v62 = (float)v6;
      __asm { FMOV            V1.2S, #1.0 }
      float32x2_t v60 = (float32x2_t)vdup_n_s32(0x3DCCCCCDu);
      uint64_t v61 = _D1;
      while (1)
      {
        uint64_t vertexBufferCount = self->_vertexBufferCount;
        if ((unint64_t)(v30 - 20479 + vertexBufferCount) <= 0xFFFFFFFFFFFFAFFFLL) {
          break;
        }
        float v38 = (float)(int)v30 / (float)(int)v29;
        allVertices = self->_allVertices;
        uint64_t v40 = 80 * ((int)v30 + (int)vertexBufferCount);
        *(float32x2_t *)&long long v41 = vmla_n_f32(vmla_n_f32(vmul_n_f32(v15, v38 * (float)((float)(1.0 - v38) + (float)(1.0 - v38))), *v16, (float)(1.0 - v38) * (float)(1.0 - v38)), v16[v19], v38 * v38);
        *((void *)&v41 + 1) = vextq_s8(*(int8x16_t *)((char *)allVertices + v40), *(int8x16_t *)((char *)allVertices + v40), 8uLL).u64[0];
        *(_OWORD *)((char *)allVertices + v40) = v41;
        float v42 = (float)(v31 * v38) + (float)(v31 * v62);
        v43 = self->_allVertices;
        uint64_t v44 = 80 * ((int)v30 + self->_vertexBufferCount);
        long long v45 = *(_OWORD *)((char *)v43 + v44);
        *((float32x2_t *)&v45 + 1) = vmla_n_f32(vmla_n_f32(vmul_n_f32(v13, v42 * (float)((float)(1.0 - v42) + (float)(1.0 - v42))), *v14, (float)(1.0 - v42) * (float)(1.0 - v42)), v14[v12], v42 * v42);
        *(_OWORD *)((char *)v43 + v44) = v45;
        float currentTimeClock = self->_currentTimeClock;
        uint32_t v47 = arc4random();
        int v48 = self->_vertexBufferCount;
        if ((int)v30 + v48 < 1)
        {
          float32x2_t v53 = 0;
        }
        else
        {
          float32x4_t v49 = vsubq_f32(*((float32x4_t *)self->_allVertices + 5 * (v30 + v48)), *((float32x4_t *)self->_allVertices + 5 * (v30 + v48 - 1)));
          float32x2_t v50 = (float32x2_t)vextq_s8((int8x16_t)v49, (int8x16_t)v49, 8uLL).u64[0];
          int32x4_t v51 = (int32x4_t)vmulq_f32(v49, v49);
          int8x16_t v52 = (int8x16_t)vdupq_laneq_s32(v51, 3);
          v51.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v51, (int8x16_t)v51, 8uLL), (float32x2_t)*(_OWORD *)&vextq_s8(v52, v52, 8uLL)).u32[0];
          *(float32x2_t *)v52.i8 = vrsqrte_f32((float32x2_t)v51.u32[0]);
          *(float32x2_t *)v52.i8 = vmul_f32(*(float32x2_t *)v52.i8, vrsqrts_f32((float32x2_t)v51.u32[0], vmul_f32(*(float32x2_t *)v52.i8, *(float32x2_t *)v52.i8)));
          float32x2_t v53 = vmul_n_f32(v50, vmul_f32(*(float32x2_t *)v52.i8, vrsqrts_f32((float32x2_t)v51.u32[0], vmul_f32(*(float32x2_t *)v52.i8, *(float32x2_t *)v52.i8))).f32[0]);
        }
        float v54 = (float)((float)v47 * 2.3283e-10) * 0.1 + 0.9;
        float v55 = v54 * 0.1;
        float v63 = v55;
        srdnoise2();
        v56 = (char *)self->_allVertices + 80 * (int)v30 + 80 * self->_vertexBufferCount;
        long long v57 = *((_OWORD *)v56 + 3);
        *((float32x2_t *)&v57 + 1) = vmla_n_f32(vmul_f32(v53, v60), 0, v63);
        *((_OWORD *)v56 + 3) = v57;
        *((float *)self->_allVertices + 20 * (int)v30 + 20 * self->_vertexBufferCount + 12) = currentTimeClock
                                                                                            + (float)(v38 * 0.016667);
        *(float *)&long long v57 = self->_currentTimeIndex + 0.016667;
        LODWORD(self->_currentTimeIndex) = v57;
        *((_DWORD *)self->_allVertices + 20 * (int)v30 + 20 * self->_vertexBufferCount + 13) = v57;
        *(float *)&long long v57 = self->_lineWidthScaleFactor * 5.0;
        *((_DWORD *)self->_allVertices + 20 * (int)v30 + 20 * self->_vertexBufferCount + 16) = v57;
        *(float *)&long long v57 = self->_cometScaleFactor;
        *((_DWORD *)self->_allVertices + 20 * (int)v30 + 20 * self->_vertexBufferCount + 17) = v57;
        float v58 = 3.0;
        if (!self->_useFastVerticalWisp) {
          float v58 = 0.0;
        }
        *((float *)self->_allVertices + 20 * (int)v30 + 20 * self->_vertexBufferCount + 18) = v58;
        *((_OWORD *)self->_allVertices + 5 * (int)v30 + 5 * self->_vertexBufferCount + 1) = *(_OWORD *)self->_brushColorForInitialColor;
        *((_OWORD *)self->_allVertices + 5 * (int)v30++ + 5 * self->_vertexBufferCount + 2) = *(_OWORD *)self->_brushColorForFinalColor;
        if (v29 == v30)
        {
          uint64_t v30 = v29;
          goto LABEL_20;
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained sketchRendererDidReachVertexLimit:self];
    }
LABEL_20:
    self->_lastBirth = self->_currentTimeIndex;
    -[ETGLSketchRenderer updateVertexBufferWithVertexCount:](self, "updateVertexBufferWithVertexCount:", v30, *(void *)&v60, v61);
  }
}

- (void)updateVertexBufferWithVertexCount:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  glBufferSubData(0x8892u, 80 * self->_vertexBufferCount, 80 * a3, (char *)self->_allVertices + 80 * self->_vertexBufferCount);
  GLenum Error = glGetError();
  if (Error)
  {
    GLenum v6 = Error;
    if (IMOSLoggingEnabled())
    {
      unint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = 136315394;
        float32x2_t v9 = "-[ETGLSketchRenderer updateVertexBufferWithVertexCount:]";
        __int16 v10 = 1024;
        GLenum v11 = v6;
        _os_log_impl(&dword_23B55A000, v7, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", (uint8_t *)&v8, 0x12u);
      }
    }
  }
  self->_vertexBufferCount += v3;
}

- (void)_warmupShaders
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  GLuint framebuffers = 0;
  glGenFramebuffers(1, &framebuffers);
  glBindFramebuffer(0x8D40u, framebuffers);
  GLuint renderbuffers = 0;
  glGenRenderbuffers(1, &renderbuffers);
  glBindRenderbuffer(0x8D41u, renderbuffers);
  GLenum Error = glGetError();
  if (Error && IMOSLoggingEnabled())
  {
    double v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int16x8_t v16 = "-[ETGLSketchRenderer _warmupShaders]";
      __int16 v17 = 1024;
      GLenum v18 = Error;
      _os_log_impl(&dword_23B55A000, v4, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", buf, 0x12u);
    }
  }
  glRenderbufferStorage(0x8D41u, 0x8058u, 32, 32);
  GLenum v5 = glGetError();
  if (v5 && IMOSLoggingEnabled())
  {
    GLenum v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int16x8_t v16 = "-[ETGLSketchRenderer _warmupShaders]";
      __int16 v17 = 1024;
      GLenum v18 = v5;
      _os_log_impl(&dword_23B55A000, v6, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", buf, 0x12u);
    }
  }
  glFramebufferRenderbuffer(0x8D40u, 0x8CE0u, 0x8D41u, renderbuffers);
  glViewport(0, 0, 32, 32);
  if (glCheckFramebufferStatus(0x8D40u) != 36053 && IMOSLoggingEnabled())
  {
    unint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      GLenum v8 = glCheckFramebufferStatus(0x8D40u);
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = v8;
      _os_log_impl(&dword_23B55A000, v7, OS_LOG_TYPE_INFO, "Unexpected failure to make complete framebuffer object during warmup (0x%04x)", buf, 8u);
    }
  }
  glClear(0x4000u);
  glBindVertexArrayOES();
  glUseProgram(self->_shaderProgram);
  GLenum v9 = glGetError();
  if (v9 && IMOSLoggingEnabled())
  {
    __int16 v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int16x8_t v16 = "-[ETGLSketchRenderer _warmupShaders]";
      __int16 v17 = 1024;
      GLenum v18 = v9;
      _os_log_impl(&dword_23B55A000, v10, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", buf, 0x12u);
    }
  }
  glDrawArrays(0, 0, 1);
  GLenum v11 = glGetError();
  if (v11 && IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int16x8_t v16 = "-[ETGLSketchRenderer _warmupShaders]";
      __int16 v17 = 1024;
      GLenum v18 = v11;
      _os_log_impl(&dword_23B55A000, v12, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", buf, 0x12u);
    }
  }
  glDiscardFramebufferEXT();
}

+ (void)warmupShaders
{
  if ((warmupShaders_alreadyWarmedUp & 1) == 0)
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F146E8]) initWithAPI:2];
    if (v2 && ([MEMORY[0x263F146E8] setCurrentContext:v2] & 1) != 0)
    {
      int v3 = [[ETGLSketchRenderer alloc] initWithContext:v2 andDrawable:0];
      v3->_useThisRendererOnlyForWarmup = 1;
      [(ETGLSketchRenderer *)v3 _warmupShaders];
      warmupShaders_alreadyWarmedUp = 1;
      [MEMORY[0x263F146E8] setCurrentContext:0];

      uint64_t v2 = 0;
    }
    else if (IMOSLoggingEnabled())
    {
      double v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)GLenum v5 = 0;
        _os_log_impl(&dword_23B55A000, v4, OS_LOG_TYPE_INFO, "Unexpected failure to create context during shader warmup", v5, 2u);
      }
    }
  }
}

- (CGImage)createRenderedFrameImageUsingAlpha:(BOOL)a3
{
  BOOL v3 = a3;
  signed int v5 = 4 * self->_backingWidth;
  size_t v6 = self->_backingHeight * v5;
  unint64_t v7 = (char *)malloc_type_malloc(v6, 0x4664C990uLL);
  GLenum v8 = (char *)malloc_type_malloc(v6, 0xFE04531FuLL);
  glReadPixels(0, 0, self->_backingWidth, self->_backingHeight, 0x1908u, 0x1401u, v7);
  unsigned int backingHeight = self->_backingHeight;
  if (backingHeight)
  {
    unsigned int v10 = 0;
    int v11 = -1;
    uint64_t v12 = v8;
    do
    {
      memcpy(v12, &v7[(backingHeight + v11) * v5], v5);
      unsigned int backingHeight = self->_backingHeight;
      --v11;
      v12 += v5;
      ++v10;
    }
    while (backingHeight > v10);
  }
  free(v7);
  float32x2_t v13 = CGDataProviderCreateWithData(0, v8, v6, (CGDataProviderReleaseDataCallback)releasePixels);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (v3) {
    CGBitmapInfo v15 = 1;
  }
  else {
    CGBitmapInfo v15 = 5;
  }
  int16x8_t v16 = CGImageCreate(self->_backingWidth, self->_backingHeight, 8uLL, 0x20uLL, v5, DeviceRGB, v15, v13, 0, 0, kCGRenderingIntentDefault);
  if (v13) {
    CFRelease(v13);
  }
  CGColorSpaceRelease(DeviceRGB);
  return v16;
}

- (void)render
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (self->_backingWidth && self->_backingHeight) {
    goto LABEL_45;
  }
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_23B55A000, v3, OS_LOG_TYPE_INFO, "Error: GLSketch being asked to -render into a 0x0 viewport!", (uint8_t *)&v21, 2u);
    }
  }
  [(ETGLSketchRenderer *)self resizeFromCachedLayer];
  if (self->_backingWidth)
  {
    if (self->_backingHeight)
    {
LABEL_45:
      glClear(0x4000u);
      if (self->_vertexBufferBegin < self->_vertexBufferCount - 1)
      {
        [(ETGLSketchRenderer *)self updateGLWithCurrentTime];
        GLenum Error = glGetError();
        if (Error && IMOSLoggingEnabled())
        {
          signed int v5 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
          {
            int v21 = 136315394;
            float32x2_t v22 = "-[ETGLSketchRenderer render]";
            __int16 v23 = 1024;
            GLenum v24 = Error;
            _os_log_impl(&dword_23B55A000, v5, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", (uint8_t *)&v21, 0x12u);
          }
        }
        glUseProgram(self->_shaderProgram);
        GLenum v6 = glGetError();
        if (v6 && IMOSLoggingEnabled())
        {
          unint64_t v7 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            int v21 = 136315394;
            float32x2_t v22 = "-[ETGLSketchRenderer render]";
            __int16 v23 = 1024;
            GLenum v24 = v6;
            _os_log_impl(&dword_23B55A000, v7, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", (uint8_t *)&v21, 0x12u);
          }
        }
        glVertexAttrib1f(5u, self->_currentTimeClock);
        glVertexAttrib1f(6u, self->_deathTime);
        glVertexAttrib1f(7u, self->_lastBirth);
        glVertexAttrib1f(8u, 1.75);
        glVertexAttrib1f(9u, 3.0);
        GLenum v8 = glGetError();
        if (v8 && IMOSLoggingEnabled())
        {
          GLenum v9 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            int v21 = 136315394;
            float32x2_t v22 = "-[ETGLSketchRenderer render]";
            __int16 v23 = 1024;
            GLenum v24 = v8;
            _os_log_impl(&dword_23B55A000, v9, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", (uint8_t *)&v21, 0x12u);
          }
        }
        glDrawArrays(0, self->_vertexBufferBegin, self->_vertexBufferCount - self->_vertexBufferBegin);
        GLenum v10 = glGetError();
        if (v10 && IMOSLoggingEnabled())
        {
          int v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            int v21 = 136315394;
            float32x2_t v22 = "-[ETGLSketchRenderer render]";
            __int16 v23 = 1024;
            GLenum v24 = v10;
            _os_log_impl(&dword_23B55A000, v11, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", (uint8_t *)&v21, 0x12u);
          }
        }
        if (!self->_renderingOffscreen) {
          [(EAGLContext *)self->_context presentRenderbuffer:36161];
        }
        if ([(ETGLSketchRenderer *)self isDying])
        {
          float lastBirth = self->_lastBirth;
          double v13 = (float)(self->_currentTimeClock - self->_deathTime);
          int vertexBufferBegin = self->_vertexBufferBegin;
          CGBitmapInfo v15 = (float *)((char *)self->_allVertices + 80 * vertexBufferBegin + 52);
          int v16 = vertexBufferBegin - 1;
          while ((v13 + (float)(*v15 / lastBirth) * -1.25) / 1.75 > 1.0)
          {
            self->_int vertexBufferBegin = v16 + 2;
            v15 += 20;
            if (++v16 == self->_vertexBufferCount - 2)
            {
              completionBlock = (void (**)(void))self->_completionBlock;
              if (completionBlock)
              {
                completionBlock[2]();
                id v18 = self->_completionBlock;
                self->_completionBlock = 0;
              }
              break;
            }
          }
        }
        GLenum v19 = glGetError();
        if (v19 && IMOSLoggingEnabled())
        {
          float32x2_t v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            int v21 = 136315394;
            float32x2_t v22 = "-[ETGLSketchRenderer render]";
            __int16 v23 = 1024;
            GLenum v24 = v19;
            _os_log_impl(&dword_23B55A000, v20, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", (uint8_t *)&v21, 0x12u);
          }
        }
      }
    }
  }
}

- (void)setLineWidthScaleFactor:(double)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  double lineWidthScaleFactor = self->_lineWidthScaleFactor;
  self->_double lineWidthScaleFactor = a3;
  self->_float cometScaleFactor = 1.0 / a3;
  if (self->_vertexBufferCount >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    double v6 = a3 / lineWidthScaleFactor;
    do
    {
      unint64_t v7 = (float *)((char *)self->_allVertices + v4);
      float v8 = v6 * v7[16];
      v7[16] = v8;
      float cometScaleFactor = self->_cometScaleFactor;
      *(float *)((char *)self->_allVertices + v4 + 68) = cometScaleFactor;
      if (self->_useFastVerticalWisp) {
        float v10 = 3.0;
      }
      else {
        float v10 = 0.0;
      }
      *(float *)((char *)self->_allVertices + v4 + 72) = v10;
      ++v5;
      uint64_t vertexBufferCount = self->_vertexBufferCount;
      v4 += 80;
    }
    while (v5 < vertexBufferCount);
    glBufferSubData(0x8892u, 0, 80 * vertexBufferCount, self->_allVertices);
    GLenum Error = glGetError();
    if (Error)
    {
      GLenum v13 = Error;
      if (IMOSLoggingEnabled())
      {
        GLenum v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v15 = 136315394;
          int v16 = "-[ETGLSketchRenderer setLineWidthScaleFactor:]";
          __int16 v17 = 1024;
          GLenum v18 = v13;
          _os_log_impl(&dword_23B55A000, v14, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", (uint8_t *)&v15, 0x12u);
        }
      }
    }
  }
}

- (float)currentTimeClock
{
  return self->_currentTimeClock;
}

- (float)currentTimeIndex
{
  return self->_currentTimeIndex;
}

- (BOOL)isDying
{
  return self->_isDying;
}

- (void)setIsDying:(BOOL)a3
{
  self->_isDying = a3;
}

- (double)wispDelay
{
  return self->_wispDelay;
}

- (void)setWispDelay:(double)a3
{
  self->_double wispDelay = a3;
}

- (ETGLSketchRendererDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ETGLSketchRendererDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)renderingOffscreen
{
  return self->_renderingOffscreen;
}

- (void)setRenderingOffscreen:(BOOL)a3
{
  self->_renderingOffscreen = a3;
}

- (double)lineWidthScaleFactor
{
  return self->_lineWidthScaleFactor;
}

- (BOOL)useFastVerticalWisp
{
  return self->_useFastVerticalWisp;
}

- (void)setUseFastVerticalWisp:(BOOL)a3
{
  self->_useFastVerticalWisp = a3;
}

- ($8EF4127CF77ECA3DDB612FCF233DC3A8)allVertices
{
  return self->_allVertices;
}

- (void)setAllVertices:(id *)a3
{
  self->_allVertices = a3;
}

- (int)vertexBufferCount
{
  return self->_vertexBufferCount;
}

- (void)setVertexBufferCount:(int)a3
{
  self->_uint64_t vertexBufferCount = a3;
}

- (int)vertexBufferBegin
{
  return self->_vertexBufferBegin;
}

- (void)setVertexBufferBegin:(int)a3
{
  self->_int vertexBufferBegin = a3;
}

- (unint64_t)vertexCount
{
  return self->_vertexCount;
}

- (void)setVertexCount:(unint64_t)a3
{
  self->_vertexCount = a3;
}

- (float)deathTime
{
  return self->_deathTime;
}

- (void)setDeathTime:(float)a3
{
  self->_deathTime = a3;
}

- (float)lastBirth
{
  return self->_lastBirth;
}

- (void)setLastBirth:(float)a3
{
  self->_float lastBirth = a3;
}

- (__n128)brushColorForInitialColor
{
  return a1[9];
}

- (void)setBrushColorForInitialColor:(ETGLSketchRenderer *)self
{
  *(_OWORD *)self->_brushColorForInitialColor = v2;
}

- (__n128)brushColorForFinalColor
{
  return a1[10];
}

- (void)setBrushColorForFinalColor:(ETGLSketchRenderer *)self
{
  *(_OWORD *)self->_brushColorForFinalColor = v2;
}

- (unsigned)shaderProgram
{
  return self->_shaderProgram;
}

- (void)setShaderProgram:(unsigned int)a3
{
  self->_shaderGLuint Program = a3;
}

- (unsigned)vboVertLineId
{
  return self->_vboVertLineId;
}

- (void)setVboVertLineId:(unsigned int)a3
{
  self->_vboVertLineId = a3;
}

- (unsigned)vaoLineID
{
  return self->_vaoLineID;
}

- (void)setVaoLineID:(unsigned int)a3
{
  self->_unsigned int vaoLineID = a3;
}

- (unsigned)viewRenderbuffer
{
  return self->_viewRenderbuffer;
}

- (void)setViewRenderbuffer:(unsigned int)a3
{
  self->_viewRenderbuffer = a3;
}

- (unsigned)viewFramebuffer
{
  return self->_viewFramebuffer;
}

- (void)setViewFramebuffer:(unsigned int)a3
{
  self->_viewFramebuffer = a3;
}

- (unsigned)backingWidth
{
  return self->_backingWidth;
}

- (void)setBackingWidth:(unsigned int)a3
{
  self->_GLsizei backingWidth = a3;
}

- (unsigned)backingHeight
{
  return self->_backingHeight;
}

- (void)setBackingHeight:(unsigned int)a3
{
  self->_unsigned int backingHeight = a3;
}

- (double)cometScaleFactor
{
  return self->_cometScaleFactor;
}

- (void)setCometScaleFactor:(double)a3
{
  self->_float cometScaleFactor = a3;
}

- (unsigned)allocatedWidth
{
  return self->_allocatedWidth;
}

- (void)setAllocatedWidth:(unsigned int)a3
{
  self->_allocatedWidth = a3;
}

- (unsigned)allocatedHeight
{
  return self->_allocatedHeight;
}

- (void)setAllocatedHeight:(unsigned int)a3
{
  self->_allocatedHeight = a3;
}

- (EAGLContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  self->_context = (EAGLContext *)a3;
}

- (CAEAGLLayer)cachedLayer
{
  return self->_cachedLayer;
}

- (void)setCachedLayer:(id)a3
{
  self->_cachedLayer = (CAEAGLLayer *)a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end