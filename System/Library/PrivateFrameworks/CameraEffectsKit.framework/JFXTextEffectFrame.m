@interface JFXTextEffectFrame
+ (id)frameWithEffect:(id)a3 relativeToSize:(CGSize)a4 origin:(int)a5 time:(id *)a6 forcePosterFrame:(BOOL)a7 includeDropShadow:(BOOL)a8 includeTextFrames:(BOOL)a9;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (BOOL)forcePosterFrame;
- (CGPath)expandedHitAreaPath;
- (CGPath)hitAreaPath;
- (CGPoint)center;
- (CGRect)objectBounds;
- (CGRect)outputROI;
- (CGRect)viewSpaceObjectBounds;
- (CGSize)effectSize;
- (CGSize)relativeToSize;
- (JFXTextEffectTransforms)transforms;
- (NSArray)hitAreaPoints;
- (NSArray)textFrames;
- (PVCGPointQuad)cornerPoints;
- (__n128)setTransform:(long long *)a3;
- (__n128)setTransformInfo:(long long *)a3;
- (__n128)transform;
- (__n128)transformInfo;
- (id)description;
- (int)effectOrigin;
- (int)origin;
- (void)dealloc;
- (void)setCornerPoints:(PVCGPointQuad *)a3;
- (void)setEffectOrigin:(int)a3;
- (void)setEffectSize:(CGSize)a3;
- (void)setExpandedHitAreaPath:(CGPath *)a3;
- (void)setForcePosterFrame:(BOOL)a3;
- (void)setHitAreaPath:(CGPath *)a3;
- (void)setHitAreaPoints:(id)a3;
- (void)setObjectBounds:(CGRect)a3;
- (void)setOrigin:(int)a3;
- (void)setOutputROI:(CGRect)a3;
- (void)setRelativeToSize:(CGSize)a3;
- (void)setTextFrames:(id)a3;
- (void)setTime:(id *)a3;
- (void)setTransforms:(id)a3;
@end

@implementation JFXTextEffectFrame

- (void)dealloc
{
  CGPathRelease(self->_hitAreaPath);
  CGPathRelease(self->_expandedHitAreaPath);
  v3.receiver = self;
  v3.super_class = (Class)JFXTextEffectFrame;
  [(JFXTextEffectFrame *)&v3 dealloc];
}

+ (id)frameWithEffect:(id)a3 relativeToSize:(CGSize)a4 origin:(int)a5 time:(id *)a6 forcePosterFrame:(BOOL)a7 includeDropShadow:(BOOL)a8 includeTextFrames:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  BOOL v11 = a7;
  uint64_t v13 = *(void *)&a5;
  double height = a4.height;
  double width = a4.width;
  id v17 = a3;
  id v18 = objc_alloc((Class)a1);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21 = *a6;
  v19 = objc_msgSend(v18, "initWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v17, v13, &v21, v11, v10, v9, width, height);

  return v19;
}

- (CGRect)viewSpaceObjectBounds
{
  CGPoint v52 = (CGPoint)0;
  CGPoint v53 = (CGPoint)0;
  CGPoint v50 = (CGPoint)0;
  CGPoint v51 = (CGPoint)0;
  [(JFXTextEffectFrame *)self objectBounds];
  PVCGPointQuad_from_CGRect((uint64_t *)&v50, v55);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  [(JFXTextEffectFrame *)self transform];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x6010000000;
  v37 = &unk_234D77F97;
  long long v3 = *(_OWORD *)(MEMORY[0x263F61320] + 16);
  long long v38 = *MEMORY[0x263F61320];
  long long v39 = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x263F61320] + 48);
  long long v40 = *(_OWORD *)(MEMORY[0x263F61320] + 32);
  long long v41 = v4;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v23 = __43__JFXTextEffectFrame_viewSpaceObjectBounds__block_invoke;
  v24 = &unk_264C0CCC0;
  long long v27 = v44;
  long long v28 = v45;
  long long v25 = v42;
  long long v26 = v43;
  long long v31 = v48;
  long long v32 = v49;
  long long v29 = v46;
  long long v30 = v47;
  v33 = &v34;
  v21.a = v50;
  v21.b = v51;
  v21.c = v52;
  v21.d = v53;
  v5 = v22;
  uint64_t v6 = 0;
  do
  {
    PVCGPointQuad v54 = v21;
    PVCGPointQuad_get_point_at_index(&v54);
    ((void (*)(void *, uint64_t))v23)(v5, v6);
    uint64_t v6 = (v6 + 1);
  }
  while (v6 != 4);

  CGPoint v7 = (CGPoint)*((_OWORD *)v35 + 3);
  v54.a = (CGPoint)*((_OWORD *)v35 + 2);
  v54.b = v7;
  CGPoint v8 = (CGPoint)*((_OWORD *)v35 + 5);
  v54.c = (CGPoint)*((_OWORD *)v35 + 4);
  v54.d = v8;
  pv_bounding_CGRect(&v54);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  _Block_object_dispose(&v34, 8);
  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

uint64_t __43__JFXTextEffectFrame_viewSpaceObjectBounds__block_invoke(uint64_t a1)
{
  pv_simd_matrix_transform_vector();
  return PVCGPointQuad_set_point_at_index((PVCGPointQuad *)(*(void *)(*(void *)(a1 + 160) + 8) + 32), v3);
}

- (CGPoint)center
{
  [(JFXTextEffectFrame *)self cornerPoints];
  pv_CGPoint_get_quad_center(&v4);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setHitAreaPath:(CGPath *)a3
{
  self->_hitAreaPath = a3;
}

- (void)setExpandedHitAreaPath:(CGPath *)a3
{
  self->_expandedHitAreaPath = a3;
}

- (id)description
{
  id v19 = (id)NSString;
  v22.receiver = self;
  v22.super_class = (Class)JFXTextEffectFrame;
  double v18 = [(JFXTextEffectFrame *)&v22 description];
  [(JFXTextEffectFrame *)self time];
  double v17 = (__CFString *)CMTimeCopyDescription(0, &time);
  double v14 = objc_msgSend(NSNumber, "numberWithBool:", -[JFXTextEffectFrame forcePosterFrame](self, "forcePosterFrame"));
  double v16 = objc_msgSend(NSString, "stringWithUTF8String:", PVCoordinateSystemOriginNames[-[JFXTextEffectFrame effectOrigin](self, "effectOrigin")]);
  [(JFXTextEffectFrame *)self effectSize];
  double v15 = NSStringFromCGSize(v24);
  [(JFXTextEffectFrame *)self center];
  double v13 = NSStringFromCGPoint(v25);
  double v12 = objc_msgSend(NSString, "stringWithUTF8String:", PVCoordinateSystemOriginNames[-[JFXTextEffectFrame origin](self, "origin")]);
  [(JFXTextEffectFrame *)self relativeToSize];
  double v11 = NSStringFromCGSize(v26);
  [(JFXTextEffectFrame *)self cornerPoints];
  double v3 = NSStringFromPVCGPointQuad();
  [(JFXTextEffectFrame *)self objectBounds];
  PVCGPointQuad v4 = NSStringFromCGRect(v27);
  v5 = [(JFXTextEffectFrame *)self hitAreaPoints];
  [(JFXTextEffectFrame *)self transform];
  uint64_t v6 = NSStringFromSIMDDouble4x4();
  CGPoint v7 = NSNumber;
  CGPoint v8 = [(JFXTextEffectFrame *)self textFrames];
  double v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  id v20 = [v19 stringWithFormat:@"%@\ntime: %@\nforcePosterFrame: %@\neffectOrigin: %@\neffectSize: %@\n\ncenter: %@\n\norigin: %@\nrelativeToSize: %@\n\ncornerPoints:\n%@\n\nobjectBounds: %@\n\nhitAreaPoints: %@\n\ntransform:\n%@\n\ntextFrames (count): %@", v18, v17, v14, v16, v15, v13, v12, v11, v3, v4, v5, v6, v9];

  return v20;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (void)setTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (BOOL)forcePosterFrame
{
  return self->_forcePosterFrame;
}

- (void)setForcePosterFrame:(BOOL)a3
{
  self->_forcePosterFrame = a3;
}

- (int)effectOrigin
{
  return self->_effectOrigin;
}

- (void)setEffectOrigin:(int)a3
{
  self->_effectOrigin = a3;
}

- (CGSize)effectSize
{
  double width = self->_effectSize.width;
  double height = self->_effectSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setEffectSize:(CGSize)a3
{
  self->_effectSize = a3;
}

- (int)origin
{
  return self->_origin;
}

- (void)setOrigin:(int)a3
{
  self->_origin = a3;
}

- (CGSize)relativeToSize
{
  double width = self->_relativeToSize.width;
  double height = self->_relativeToSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRelativeToSize:(CGSize)a3
{
  self->_relativeToSize = a3;
}

- (PVCGPointQuad)cornerPoints
{
  CGPoint v3 = *(CGPoint *)&self[3].a.y;
  retstr->a = *(CGPoint *)&self[2].d.y;
  retstr->b = v3;
  CGPoint v4 = *(CGPoint *)&self[3].c.y;
  retstr->c = *(CGPoint *)&self[3].b.y;
  retstr->d = v4;
  return self;
}

- (void)setCornerPoints:(PVCGPointQuad *)a3
{
  CGPoint a = a3->a;
  CGPoint b = a3->b;
  CGPoint c = a3->c;
  self->_cornerPoints.d = a3->d;
  self->_cornerPoints.CGPoint c = c;
  self->_cornerPoints.CGPoint b = b;
  self->_cornerPoints.CGPoint a = a;
}

- (CGRect)outputROI
{
  double x = self->_outputROI.origin.x;
  double y = self->_outputROI.origin.y;
  double width = self->_outputROI.size.width;
  double height = self->_outputROI.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOutputROI:(CGRect)a3
{
  self->_outputROI = a3;
}

- (CGRect)objectBounds
{
  double x = self->_objectBounds.origin.x;
  double y = self->_objectBounds.origin.y;
  double width = self->_objectBounds.size.width;
  double height = self->_objectBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setObjectBounds:(CGRect)a3
{
  self->_objectBounds = a3;
}

- (NSArray)hitAreaPoints
{
  return self->_hitAreaPoints;
}

- (void)setHitAreaPoints:(id)a3
{
}

- (CGPath)hitAreaPath
{
  return self->_hitAreaPath;
}

- (CGPath)expandedHitAreaPath
{
  return self->_expandedHitAreaPath;
}

- (__n128)transform
{
  long long v2 = *(_OWORD *)(a1 + 336);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 320);
  *(_OWORD *)(a2 + 80) = v2;
  long long v3 = *(_OWORD *)(a1 + 368);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 352);
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)(a1 + 272);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 256);
  *(_OWORD *)(a2 + 16) = v4;
  __n128 result = *(__n128 *)(a1 + 288);
  long long v6 = *(_OWORD *)(a1 + 304);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (__n128)setTransform:(long long *)a3
{
  long long v3 = *a3;
  long long v4 = a3[1];
  long long v5 = a3[3];
  *(_OWORD *)(a1 + 288) = a3[2];
  *(_OWORD *)(a1 + 304) = v5;
  *(_OWORD *)(a1 + 256) = v3;
  *(_OWORD *)(a1 + 272) = v4;
  __n128 result = (__n128)a3[4];
  long long v7 = a3[5];
  long long v8 = a3[7];
  *(_OWORD *)(a1 + 352) = a3[6];
  *(_OWORD *)(a1 + 368) = v8;
  *(__n128 *)(a1 + 320) = result;
  *(_OWORD *)(a1 + 336) = v7;
  return result;
}

- (__n128)transformInfo
{
  long long v2 = *(_OWORD *)(a1 + 464);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 448);
  *(_OWORD *)(a2 + 80) = v2;
  long long v3 = *(_OWORD *)(a1 + 496);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 480);
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)(a1 + 400);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 384);
  *(_OWORD *)(a2 + 16) = v4;
  __n128 result = *(__n128 *)(a1 + 416);
  long long v6 = *(_OWORD *)(a1 + 432);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (__n128)setTransformInfo:(long long *)a3
{
  long long v3 = *a3;
  long long v4 = a3[1];
  long long v5 = a3[3];
  *(_OWORD *)(a1 + 416) = a3[2];
  *(_OWORD *)(a1 + 432) = v5;
  *(_OWORD *)(a1 + 384) = v3;
  *(_OWORD *)(a1 + 400) = v4;
  __n128 result = (__n128)a3[4];
  long long v7 = a3[5];
  long long v8 = a3[7];
  *(_OWORD *)(a1 + 480) = a3[6];
  *(_OWORD *)(a1 + 496) = v8;
  *(__n128 *)(a1 + 448) = result;
  *(_OWORD *)(a1 + 464) = v7;
  return result;
}

- (JFXTextEffectTransforms)transforms
{
  return self->_transforms;
}

- (void)setTransforms:(id)a3
{
}

- (NSArray)textFrames
{
  return self->_textFrames;
}

- (void)setTextFrames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFrames, 0);
  objc_storeStrong((id *)&self->_transforms, 0);
  objc_storeStrong((id *)&self->_hitAreaPoints, 0);
}

@end