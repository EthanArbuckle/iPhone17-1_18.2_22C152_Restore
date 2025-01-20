@interface SCNBezierCurveGeometry
+ (BOOL)supportsSecureCoding;
- (CGPath)CGPath;
- (SCNBezierCurveGeometry)initWithCGPath:(CGPath *)a3;
- (SCNBezierCurveGeometry)initWithCGPath:(__n128)a3 transform:(__n128)a4;
- (SCNBezierCurveGeometry)initWithCoder:(id)a3;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)geometryElementAtIndex:(int64_t)a3;
- (id)geometryElements;
- (id)geometrySourceChannels;
- (id)geometrySources;
- (id)geometrySourcesForSemantic:(id)a3;
- (id)presentationGeometry;
- (int64_t)geometryElementCount;
- (int64_t)primitiveType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCNBezierCurveGeometry

- (SCNBezierCurveGeometry)initWithCGPath:(CGPath *)a3
{
  return -[SCNBezierCurveGeometry initWithCGPath:transform:](self, "initWithCGPath:transform:", a3, *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48));
}

- (SCNBezierCurveGeometry)initWithCGPath:(__n128)a3 transform:(__n128)a4
{
  v9 = (const void *)C3DBezierCurveGeometryCreate();
  v16.receiver = a1;
  v16.super_class = (Class)SCNBezierCurveGeometry;
  v10 = [(SCNGeometry *)&v16 initWithGeometryRef:v9];
  if (v10)
  {
    v10->_cgPath = (CGPath *)MEMORY[0x2105347F0](a7);
    *(__n128 *)&v10[1].super.super.isa = a2;
    *((__n128 *)&v10[1].super + 1) = a3;
    *(__n128 *)&v10[1].super._elements = a4;
    *(__n128 *)&v10[1].super._materials = a5;
    C3DBezierCurveGeometrySetPath((uint64_t)v9, v10->_cgPath);
  }
  CFRelease(v9);
  return v10;
}

- (void)dealloc
{
  cgPath = self->_cgPath;
  if (cgPath)
  {
    CFRelease(cgPath);
    self->_cgPath = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNBezierCurveGeometry;
  [(SCNGeometry *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCGPath:self->_cgPath];
  [v4 _setupObjCModelFrom:self];
  return v4;
}

- (CGPath)CGPath
{
  return self->_cgPath;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SCNBezierCurveGeometry;
  -[SCNGeometry encodeWithCoder:](&v9, sel_encodeWithCoder_);
  SCNEncodeCGPathForKey((uint64_t)a3, self->_cgPath, @"path");
  long long v5 = *((_OWORD *)&self[1].super + 1);
  long long v6 = *(_OWORD *)&self[1].super._elements;
  long long v7 = *(_OWORD *)&self[1].super._materials;
  v8[0] = *(_OWORD *)&self[1].super.super.isa;
  v8[1] = v5;
  v8[2] = v6;
  v8[3] = v7;
  SCNEncodeSCNMatrix4(a3, (const char *)@"transform", (uint64_t)v8);
}

- (SCNBezierCurveGeometry)initWithCoder:(id)a3
{
  v27.receiver = self;
  v27.super_class = (Class)SCNBezierCurveGeometry;
  objc_super v4 = -[SCNGeometry initWithCoder:](&v27, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    long long v6 = SCNDecodeCGPathForKey(a3, @"path");
    SCNDecodeSCNMatrix4(a3, @"transform", v26);
    long long v15 = v26[1];
    long long v17 = v26[0];
    long long v11 = v26[3];
    long long v13 = v26[2];
    if (v6) {
      long long v7 = (CGPath *)CFRetain(v6);
    }
    else {
      long long v7 = 0;
    }
    v4->_cgPath = v7;
    *(_OWORD *)&v4[1].super.super.isa = v17;
    *((_OWORD *)&v4[1].super + 1) = v15;
    *(_OWORD *)&v4[1].super._elements = v13;
    *(_OWORD *)&v4[1].super._materials = v11;
    uint64_t v8 = [(SCNGeometry *)v4 geometryRef];
    uint64_t v9 = [(SCNGeometry *)v4 sceneRef];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __40__SCNBezierCurveGeometry_initWithCoder___block_invoke;
    v19[3] = &__block_descriptor_112_e8_v16__0d8l;
    uint64_t v24 = v8;
    v25 = v6;
    long long v20 = v18;
    long long v21 = v16;
    long long v22 = v14;
    long long v23 = v12;
    +[SCNTransaction postCommandWithContext:v9 object:v4 applyBlock:v19];
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

__n128 *__40__SCNBezierCurveGeometry_initWithCoder___block_invoke(uint64_t a1)
{
  C3DBezierCurveGeometrySetPath(*(void *)(a1 + 96), *(CFTypeRef *)(a1 + 104));
  v2 = *(__n128 **)(a1 + 96);
  __n128 v3 = *(__n128 *)(a1 + 64);
  __n128 v4 = *(__n128 *)(a1 + 80);
  __n128 v5 = *(__n128 *)(a1 + 32);
  __n128 v6 = *(__n128 *)(a1 + 48);

  return C3DBezierCurveGeometrySetTransform(v2, v5, v6, v3, v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)geometrySources
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)geometrySourceChannels
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)geometrySourcesForSemantic:(id)a3
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)geometryElements
{
  return (id)MEMORY[0x263EFFA68];
}

- (int64_t)geometryElementCount
{
  return 0;
}

- (id)geometryElementAtIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)primitiveType
{
  return 2;
}

- (id)presentationGeometry
{
  v2 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initPresentationGeometryWithGeometryRef:", -[SCNGeometry geometryRef](self, "geometryRef"));

  return v2;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

@end