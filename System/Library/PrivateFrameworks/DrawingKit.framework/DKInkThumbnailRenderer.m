@interface DKInkThumbnailRenderer
+ (BOOL)_drawDebugPatternInGLContext:(id)a3 inSize:(CGSize)a4;
+ (CGPath)_newStrokedInterpolatedPathWithDrawing:(id)a3 inSize:(CGSize)a4 displayScale:(double)a5;
+ (CGSize)sizeForDrawing:(id)a3 inSize:(CGSize)a4;
+ (double)scaleToFitDrawing:(id)a3 inSize:(CGSize)a4;
+ (id)_imageForDrawingUsingCG:(id)a3 fittingInSize:(CGSize)a4 displayScale:(double)a5 color:(id)a6;
+ (id)_imageForDrawingUsingGL:(id)a3 fittingInSize:(CGSize)a4 displayScale:(double)a5 color:(id)a6;
+ (id)imageForDrawing:(id)a3 fittingInSize:(CGSize)a4 backingScale:(double)a5 color:(id)a6 highFidelity:(BOOL)a7;
+ (id)imageForDrawing:(id)a3 fittingInSize:(CGSize)a4 color:(id)a5 highFidelity:(BOOL)a6;
+ (void)_drawPath:(id)a3 atScale:(double)a4 inRect:(CGRect)a5 inkColor:(id)a6 backgroundColor:(id)a7 inContext:(CGContext *)a8;
+ (void)_interpolateDrawing:(id)a3 inSize:(CGSize)a4 displayScale:(double)a5 ellipseHandler:(id)a6;
@end

@implementation DKInkThumbnailRenderer

+ (CGSize)sizeForDrawing:(id)a3 inSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  if (DKDrawingIsValid(v6))
  {
    objc_msgSend((id)objc_opt_class(), "scaleToFitDrawing:inSize:", v6, width, height);
    memset(&v17, 0, sizeof(v17));
    CGAffineTransformMakeScale(&v17, v7, v7);
    [v6 strokesFrame];
    CGAffineTransform v16 = v17;
    CGRect v20 = CGRectApplyAffineTransform(v19, &v16);
    CGFloat x = v20.origin.x;
    CGFloat y = v20.origin.y;
    CGFloat v10 = v20.size.width;
    CGFloat v11 = v20.size.height;
    double v12 = fmax(CGRectGetWidth(v20), 0.0);
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.double width = v10;
    v21.size.double height = v11;
    double v13 = fmax(CGRectGetHeight(v21), 0.0);
  }
  else
  {
    double v12 = *MEMORY[0x263F001B0];
    double v13 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v14 = v12;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

+ (id)imageForDrawing:(id)a3 fittingInSize:(CGSize)a4 color:(id)a5 highFidelity:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.height;
  double width = a4.width;
  id v10 = a5;
  id v11 = a3;
  double v12 = objc_msgSend((id)objc_opt_class(), "imageForDrawing:fittingInSize:backingScale:color:highFidelity:", v11, v10, v6, width, height, 0.0);

  return v12;
}

+ (id)imageForDrawing:(id)a3 fittingInSize:(CGSize)a4 backingScale:(double)a5 color:(id)a6 highFidelity:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a4.height;
  double width = a4.width;
  id v12 = a3;
  id v13 = a6;
  if (a5 <= 0.0)
  {
    +[DKInkView windowBackingScaleFactor:0];
    a5 = v14;
  }
  if (v7)
  {
    double v15 = [MEMORY[0x263F1C5C0] currentDevice];
    if (objc_msgSend(v15, "dk_deviceSupportsGL"))
    {
      BOOL v16 = +[DKInkView gpuAvailable];

      if (v16)
      {
        uint64_t v17 = objc_msgSend((id)objc_opt_class(), "_imageForDrawingUsingGL:fittingInSize:displayScale:color:", v12, v13, width, height, a5);
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  uint64_t v17 = objc_msgSend((id)objc_opt_class(), "_imageForDrawingUsingCG:fittingInSize:displayScale:color:", v12, v13, width, height, a5);
LABEL_9:
  v18 = (void *)v17;

  return v18;
}

+ (double)scaleToFitDrawing:(id)a3 inSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  [v6 canvasBounds];
  double v8 = *MEMORY[0x263F001B0];
  double v9 = *(double *)(MEMORY[0x263F001B0] + 8);
  double v10 = 1.0;
  if (v11 != *MEMORY[0x263F001B0] || v7 != v9)
  {
    [v6 strokesFrame];
    if (v14 != v8 || v13 != v9)
    {
      [v6 strokesFrame];
      CGFloat x = v23.origin.x;
      CGFloat y = v23.origin.y;
      CGFloat v18 = v23.size.width;
      CGFloat v19 = v23.size.height;
      double v20 = height / CGRectGetHeight(v23);
      v24.origin.CGFloat x = x;
      v24.origin.CGFloat y = y;
      v24.size.double width = v18;
      v24.size.double height = v19;
      double v21 = width / CGRectGetWidth(v24);
      if (v20 < v21) {
        double v21 = v20;
      }
      double v10 = fmin(v21, 2.0);
    }
  }

  return v10;
}

+ (id)_imageForDrawingUsingCG:(id)a3 fittingInSize:(CGSize)a4 displayScale:(double)a5 color:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  id v11 = a6;
  if (DKDrawingIsValid(v10))
  {
    objc_msgSend((id)objc_opt_class(), "scaleToFitDrawing:inSize:", v10, width, height);
    CGFloat v13 = v12;
    memset(&v28, 0, sizeof(v28));
    CGAffineTransformMakeScale(&v28, v12, v12);
    [v10 strokesFrame];
    CGAffineTransform v27 = v28;
    CGRect v32 = CGRectApplyAffineTransform(v31, &v27);
    CGFloat x = v32.origin.x;
    CGFloat y = v32.origin.y;
    CGFloat v16 = v32.size.width;
    CGFloat v17 = v32.size.height;
    double v25 = height;
    CGFloat v18 = ceil(CGRectGetWidth(v32));
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.double width = v16;
    v33.size.double height = v17;
    CGFloat v19 = ceil(CGRectGetHeight(v33));
    id v20 = +[DKDrawing copyOfDrawing:toFitInBounds:](DKDrawing, "copyOfDrawing:toFitInBounds:", v10, 0.0, 0.0, v18, v19);
    v30.double width = v18;
    v30.double height = v19;
    UIGraphicsBeginImageContextWithOptions(v30, 0, a5);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v11 CGColor]);
    v22 = objc_opt_class();
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __83__DKInkThumbnailRenderer__imageForDrawingUsingCG_fittingInSize_displayScale_color___block_invoke;
    v26[3] = &__block_descriptor_56_e7_v24__08l;
    *(double *)&v26[4] = a5;
    *(CGFloat *)&v26[5] = v13;
    v26[6] = CurrentContext;
    objc_msgSend(v22, "_interpolateDrawing:inSize:displayScale:ellipseHandler:", v20, v26, width, v25, a5);
    CGRect v23 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    CGRect v23 = 0;
  }

  return v23;
}

void __83__DKInkThumbnailRenderer__imageForDrawingUsingCG_fittingInSize_displayScale_color___block_invoke(uint64_t a1, float32x4_t a2)
{
  unint64_t v11 = a2.i64[0];
  float v3 = *(double *)(a1 + 32);
  double v4 = DKRenderPointWidthForPoint(a2, v3);
  double v5 = *(double *)(a1 + 40);
  if (v5 < 0.26) {
    double v5 = 0.26;
  }
  double v6 = ClampToMinWidthCG(v5 * v4, 0.75);
  double v9 = *(CGContext **)(a1 + 48);
  double v10 = v6;
  double v7 = *(float *)&v11 - v6 * 0.5;
  double v8 = *((float *)&v11 + 1) - v6 * 0.5;
  CGContextFillEllipseInRect(v9, *(CGRect *)(&v6 - 2));
}

+ (void)_interpolateDrawing:(id)a3 inSize:(CGSize)a4 displayScale:(double)a5 ellipseHandler:(id)a6
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a6;
  if ([v7 totalPoints] >= 1)
  {
    [v7 strokes];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v39 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v39)
    {
      uint64_t v38 = *(void *)v56;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v56 != v38) {
            objc_enumerationMutation(obj);
          }
          uint64_t v40 = v9;
          double v10 = [*(id *)(*((void *)&v55 + 1) + 8 * v9) strokePoints];
          uint64_t v11 = [v10 count];
          unint64_t v12 = v11 - 2;
          if (v11 != 2)
          {
            unint64_t v13 = 0;
            do
            {
              double v14 = [v10 objectAtIndexedSubscript:v13];
              unint64_t v15 = v13 + 2;
              CGFloat v16 = [v10 objectAtIndexedSubscript:v13 + 2];
              CGFloat v17 = [v10 objectAtIndexedSubscript:v13 + 1];
              [v14 location];
              float64_t v51 = v18;
              [v14 location];
              float64_t v48 = v19;
              [v14 velocity];
              float64_t v44 = v20;
              [v14 force];
              v21.f64[0] = v44;
              v21.f64[1] = v22;
              v23.f64[0] = v51;
              v23.f64[1] = v48;
              *(void *)&double v52 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v23), v21).u64[0];
              [v16 location];
              float64_t v49 = v24;
              [v16 location];
              float64_t v45 = v25;
              [v16 velocity];
              float64_t v42 = v26;
              [v16 force];
              v27.f64[0] = v42;
              v27.f64[1] = v28;
              v29.f64[0] = v49;
              v29.f64[1] = v45;
              *(void *)&double v50 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v29), v27).u64[0];
              [v17 location];
              float64_t v46 = v30;
              [v17 location];
              float64_t v43 = v31;
              [v17 velocity];
              float64_t v41 = v32;
              [v17 force];
              v33.f64[0] = v41;
              v33.f64[1] = v34;
              v35.f64[0] = v46;
              v35.f64[1] = v43;
              *(void *)&double v47 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v35), v33).u64[0];
              v53[0] = MEMORY[0x263EF8330];
              v53[1] = 3221225472;
              v53[2] = __81__DKInkThumbnailRenderer__interpolateDrawing_inSize_displayScale_ellipseHandler___block_invoke;
              v53[3] = &unk_2648858B0;
              id v54 = v8;
              LODWORD(v36) = 1059761370;
              +[DKPointSmoothing _interpolateFromPoint:v53 toPoint:v52 withControlPoint:v50 atUnitScale:v47 emissionHandler:v36];

              unint64_t v13 = v15;
            }
            while (v15 < v12);
          }

          ++v9;
        }
        while (v40 + 1 != v39);
        uint64_t v39 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
      }
      while (v39);
    }
  }
}

uint64_t __81__DKInkThumbnailRenderer__interpolateDrawing_inSize_displayScale_ellipseHandler___block_invoke(uint64_t result, __n128 *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    uint64_t v5 = result;
    do
    {
      CGSize result = *(void *)(v5 + 32);
      if (result) {
        CGSize result = (*(uint64_t (**)(__n128))(result + 16))(*a2);
      }
      ++a2;
      --v3;
    }
    while (v3);
  }
  return result;
}

+ (CGPath)_newStrokedInterpolatedPathWithDrawing:(id)a3 inSize:(CGSize)a4 displayScale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  Mutable = CGPathCreateMutable();
  double v10 = objc_opt_class();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __85__DKInkThumbnailRenderer__newStrokedInterpolatedPathWithDrawing_inSize_displayScale___block_invoke;
  v12[3] = &__block_descriptor_48_e7_v24__08l;
  *(double *)&v12[4] = a5;
  v12[5] = Mutable;
  objc_msgSend(v10, "_interpolateDrawing:inSize:displayScale:ellipseHandler:", v8, v12, width, height, a5);

  return Mutable;
}

void __85__DKInkThumbnailRenderer__newStrokedInterpolatedPathWithDrawing_inSize_displayScale___block_invoke(uint64_t a1, float32x4_t a2)
{
  unint64_t v10 = a2.i64[0];
  float v3 = *(double *)(a1 + 32);
  float v4 = DKRenderPointWidthForPoint(a2, v3);
  double v5 = (float)(*((float *)&v10 + 1) - (float)(v4 * 0.5));
  double v6 = v4;
  id v7 = *(CGPath **)(a1 + 40);
  double v8 = (float)(*(float *)&v10 - (float)(v4 * 0.5));
  double v9 = v6;
  CGPathAddEllipseInRect(v7, 0, *(CGRect *)&v8);
}

+ (void)_drawPath:(id)a3 atScale:(double)a4 inRect:(CGRect)a5 inkColor:(id)a6 backgroundColor:(id)a7 inContext:(CGContext *)a8
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v20 = a7;
  id v16 = a6;
  id v17 = a3;
  CGContextSaveGState(a8);
  if (v20)
  {
    [v20 set];
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGContextFillRect(a8, v22);
  }
  [v17 bounds];
  double v19 = v18;
  CGContextScaleCTM(a8, a4, a4);
  CGContextTranslateCTM(a8, -(v19 + -10.0), 0.0);
  [v16 set];

  [v17 fill];
  CGContextRestoreGState(a8);
}

+ (id)_imageForDrawingUsingGL:(id)a3 fittingInSize:(CGSize)a4 displayScale:(double)a5 color:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  id v11 = a6;
  if (+[DKGLUtilities gpuAvailable] && DKDrawingIsValid(v10))
  {
    objc_msgSend((id)objc_opt_class(), "scaleToFitDrawing:inSize:", v10, width, height);
    double v13 = v12;
    memset(&v32, 0, sizeof(v32));
    CGAffineTransformMakeScale(&v32, v12, v12);
    [v10 strokesFrame];
    CGAffineTransform v31 = v32;
    CGRect v35 = CGRectApplyAffineTransform(v34, &v31);
    CGFloat x = v35.origin.x;
    CGFloat y = v35.origin.y;
    CGFloat v16 = v35.size.width;
    CGFloat v17 = v35.size.height;
    double v18 = ceil(CGRectGetWidth(v35));
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.double width = v16;
    v36.size.double height = v17;
    double v19 = ceil(CGRectGetHeight(v36));
    id v20 = [MEMORY[0x263F146E8] currentContext];
    float64x2_t v21 = +[DKGLUtilities createSharedGLContext];
    if (v21) {
      +[DKGLUtilities setCurrentGLContext:v21];
    }
    id v22 = +[DKDrawing copyOfDrawing:toFitInBounds:](DKDrawing, "copyOfDrawing:toFitInBounds:", v10, 0.0, 0.0, v18, v19);
    float64x2_t v23 = [MEMORY[0x263EFF980] array];
    double v24 = objc_opt_class();
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __83__DKInkThumbnailRenderer__imageForDrawingUsingGL_fittingInSize_displayScale_color___block_invoke;
    v29[3] = &unk_2648858F8;
    id v25 = v23;
    id v30 = v25;
    objc_msgSend(v24, "_interpolateDrawing:inSize:displayScale:ellipseHandler:", v22, v29, v18, v19, a5);

    if (+[DKGLUtilities gpuAvailable])
    {
      double v26 = -[DKOpenGLRenderer initWithBounds:scale:bufferSize:sharedContext:]([DKOpenGLRenderer alloc], "initWithBounds:scale:bufferSize:sharedContext:", [v25 count], 1, 0.0, 0.0, v18, v19, a5);
      [(DKOpenGLRenderer *)v26 setLineWidthScale:v13];
      [(DKOpenGLRenderer *)v26 setInkColor:v11];
      [(DKOpenGLRenderer *)v26 setDrawingEnabled:0];
      [(DKOpenGLRenderer *)v26 addPoints:v25 withSegmentLength:25];
      [(DKOpenGLRenderer *)v26 setDrawingEnabled:1];
      [(DKOpenGLRenderer *)v26 redrawEntireDrawingImmediatelyWithLayeredBlending:0];
      float64x2_t v27 = [(DKOpenGLRenderer *)v26 snapshotImage];
    }
    else
    {
      float64x2_t v27 = 0;
    }
    +[DKGLUtilities setCurrentGLContext:v20];
  }
  else
  {
    float64x2_t v27 = 0;
  }

  return v27;
}

void __83__DKInkThumbnailRenderer__imageForDrawingUsingGL_fittingInSize_displayScale_color___block_invoke(uint64_t a1, int8x16_t a2)
{
  float v3 = 1.0;
  if (*(float *)&a2.i32[2] < 3.0) {
    float v3 = *(float *)&a2.i32[2] / 3.0;
  }
  float64x2_t v6 = vcvtq_f64_f32(*(float32x2_t *)a2.i8);
  uint64_t v7 = 0;
  int8x16_t v4 = vextq_s8(a2, a2, 8uLL);
  *(float *)v4.i32 = v3;
  float64x2_t v8 = vcvtq_f64_f32(*(float32x2_t *)v4.i8);
  double v5 = objc_msgSend(MEMORY[0x263F08D40], "dk_valueWithRenderPoint:", &v6);
  [*(id *)(a1 + 32) addObject:v5];
}

+ (BOOL)_drawDebugPatternInGLContext:(id)a3 inSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  glViewport(0, 0, (int)a4.width, (int)a4.height);
  +[DKGLUtilities setCurrentClearColor];
  glClear(0x4000u);
  GLuint Program = glCreateProgram();
  glAttachShader(Program, +[DKGLUtilities compileShader:@"color" ofType:@"vert"]);
  glAttachShader(Program, +[DKGLUtilities compileShader:@"color" ofType:@"frag"]);
  glBindAttribLocation(Program, 0, "iPosition");
  glBindAttribLocation(Program, 1u, "iTexCoord");
  glLinkProgram(Program);
  GLint params = 0;
  glGetProgramiv(Program, 0x8B82u, &params);
  GLint v7 = params;
  if (params)
  {
    glUseProgram(Program);
    long long v36 = 0u;
    long long v37 = 0u;
    *(_OWORD *)value = 0u;
    long long v35 = 0u;
    *(float *)&unsigned int v8 = width;
    float v9 = height;
    *(float *)&double v10 = v9;
    +[DKGLUtilities setProjectionMatrixForWidth:1 height:value flipped:COERCE_DOUBLE((unint64_t)v8) matrix:v10];
    GLint UniformLocation = glGetUniformLocation(Program, "uModelViewProjection");
    glUniformMatrix4fv(UniformLocation, 1, 0, value);
    *(_OWORD *)v = xmmword_22AF74810;
    GLint v12 = glGetUniformLocation(Program, "uColor");
    glUniform4fv(v12, 1, v);
    *(float *)&double v13 = *(float *)&v8 * 0.5;
    *(float *)&double v14 = v9 * 0.5;
    +[DKGLUtilities drawQuadAtX:0.0 Y:0.0 width:v13 height:v14];
    *(_OWORD *)CGAffineTransform v32 = xmmword_22AF74820;
    GLint v15 = glGetUniformLocation(Program, "uColor");
    glUniform4fv(v15, 1, v32);
    *(float *)&double v16 = *(float *)&v8 * 0.5;
    *(float *)&double v17 = *(float *)&v8 * 0.5;
    *(float *)&double v18 = v9 * 0.5;
    +[DKGLUtilities drawQuadAtX:v16 Y:0.0 width:v17 height:v18];
    *(_OWORD *)CGAffineTransform v31 = xmmword_22AF74830;
    GLint v19 = glGetUniformLocation(Program, "uColor");
    glUniform4fv(v19, 1, v31);
    *(float *)&double v20 = v9 * 0.5;
    *(float *)&double v21 = *(float *)&v8 * 0.5;
    *(float *)&double v22 = v9 * 0.5;
    +[DKGLUtilities drawQuadAtX:0.0 Y:v20 width:v21 height:v22];
    *(_OWORD *)id v30 = xmmword_22AF74840;
    GLint v23 = glGetUniformLocation(Program, "uColor");
    glUniform4fv(v23, 1, v30);
    *(float *)&double v24 = *(float *)&v8 * 0.5;
    *(float *)&double v25 = v9 * 0.5;
    *(float *)&double v26 = *(float *)&v8 * 0.5;
    *(float *)&double v27 = v9 * 0.5;
    +[DKGLUtilities drawQuadAtX:v24 Y:v25 width:v26 height:v27];
  }
  else
  {
    NSLog(&cfstr_ErrorLinkingCo.isa);
    GLenum Error = glGetError();
    if (Error) {
      printf("glError: %04x caught at %s:%u\n", Error, "/Library/Caches/com.apple.xbs/Sources/DrawingKit/DrawingKit/Source/Shared/DKInkThumbnailRenderer.m", 449);
    }
  }
  return v7 != 0;
}

@end