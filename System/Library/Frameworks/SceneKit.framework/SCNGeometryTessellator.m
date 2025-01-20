@interface SCNGeometryTessellator
+ (BOOL)supportsSecureCoding;
- ($7338CD085D135657D9A3115DAE7B9BC3)_tessellatorValueForGeometry:(SEL)a3;
- (BOOL)isAdaptive;
- (BOOL)isScreenSpace;
- (CGFloat)edgeTessellationFactor;
- (CGFloat)insideTessellationFactor;
- (CGFloat)maximumEdgeLength;
- (CGFloat)tessellationFactorScale;
- (MTLTessellationPartitionMode)tessellationPartitionMode;
- (SCNGeometryTessellator)init;
- (SCNGeometryTessellator)initWithCoder:(id)a3;
- (SCNTessellationSmoothingMode)smoothingMode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)addClient:(id)a3;
- (void)clientWillDie:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeClient:(id)a3;
- (void)setAdaptive:(BOOL)adaptive;
- (void)setEdgeTessellationFactor:(CGFloat)edgeTessellationFactor;
- (void)setInsideTessellationFactor:(CGFloat)insideTessellationFactor;
- (void)setMaximumEdgeLength:(CGFloat)maximumEdgeLength;
- (void)setScreenSpace:(BOOL)screenSpace;
- (void)setSmoothingMode:(SCNTessellationSmoothingMode)smoothingMode;
- (void)setTessellationFactorScale:(CGFloat)tessellationFactorScale;
- (void)setTessellationPartitionMode:(MTLTessellationPartitionMode)tessellationPartitionMode;
- (void)tessellatorValueDidChange;
- (void)tessellatorValueDidChangeForClient:(id)a3;
@end

@implementation SCNGeometryTessellator

- (SCNGeometryTessellator)init
{
  v9.receiver = self;
  v9.super_class = (Class)SCNGeometryTessellator;
  v2 = [(SCNGeometryTessellator *)&v9 init];
  if (v2)
  {
    *((void *)v2 + 1) = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0);
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)(v2 + 20) = _Q0;
    *(_OWORD *)(v2 + 40) = xmmword_20B5CC140;
  }
  return (SCNGeometryTessellator *)v2;
}

- (SCNGeometryTessellator)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SCNGeometryTessellator;
  v4 = [(SCNGeometryTessellator *)&v10 init];
  if (v4)
  {
    v4->_clients = (NSMutableSet *)CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0);
    [a3 decodeFloatForKey:@"tessellationFactorScale"];
    v4->_tessellationFactorScale = v5;
    [a3 decodeFloatForKey:@"maximumEdgeLength"];
    v4->_maximumEdgeLength = v6;
    [a3 decodeFloatForKey:@"edgeTessellationFactor"];
    v4->_edgeTessellationFactor = v7;
    [a3 decodeFloatForKey:@"insideTessellationFactor"];
    v4->_insideTessellationFactor = v8;
    v4->_adaptive = [a3 decodeBoolForKey:@"adaptive"];
    v4->_screenSpace = [a3 decodeBoolForKey:@"screenSpace"];
    v4->_partitionMode = [a3 decodeIntegerForKey:@"tessellationPartitionMode"];
    v4->_smoothingMode = [a3 decodeIntegerForKey:@"smoothingMode"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  *(float *)&double v3 = self->_tessellationFactorScale;
  [a3 encodeFloat:@"tessellationFactorScale" forKey:v3];
  *(float *)&double v6 = self->_maximumEdgeLength;
  [a3 encodeFloat:@"maximumEdgeLength" forKey:v6];
  *(float *)&double v7 = self->_edgeTessellationFactor;
  [a3 encodeFloat:@"edgeTessellationFactor" forKey:v7];
  *(float *)&double v8 = self->_insideTessellationFactor;
  [a3 encodeFloat:@"insideTessellationFactor" forKey:v8];
  [a3 encodeBool:self->_adaptive forKey:@"adaptive"];
  [a3 encodeBool:self->_screenSpace forKey:@"screenSpace"];
  [a3 encodeInteger:self->_partitionMode forKey:@"tessellationPartitionMode"];
  int64_t smoothingMode = self->_smoothingMode;

  [a3 encodeInteger:smoothingMode forKey:@"smoothingMode"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNGeometryTessellator;
  [(SCNGeometryTessellator *)&v3 dealloc];
}

- (id)description
{
  if (self->_adaptive)
  {
    BOOL screenSpace = self->_screenSpace;
    v4 = NSString;
    float v5 = (objc_class *)objc_opt_class();
    double v6 = NSStringFromClass(v5);
    double maximumEdgeLength = self->_maximumEdgeLength;
    if (screenSpace) {
      return (id)[v4 stringWithFormat:@"<%@: %p, screen space (maximum edge length: %.3f px)>", maximumEdgeLength, v6, self, self->_maximumEdgeLength, v11];
    }
    else {
      return (id)[v4 stringWithFormat:@"<%@: %p, local space (maximum edge length: %.3f)>", maximumEdgeLength, v6, self, self->_maximumEdgeLength, v11];
    }
  }
  else
  {
    objc_super v9 = NSString;
    objc_super v10 = (objc_class *)objc_opt_class();
    return (id)[v9 stringWithFormat:@"<%@: %p, uniform (inside: %.3f, edge: %.3f)>", self->_insideTessellationFactor, NSStringFromClass(v10), self, self->_insideTessellationFactor, self->_edgeTessellationFactor];
  }
}

- (void)addClient:(id)a3
{
  -[NSMutableSet addObject:](self->_clients, "addObject:");

  [(SCNGeometryTessellator *)self tessellatorValueDidChangeForClient:a3];
}

- (void)removeClient:(id)a3
{
  uint64_t v5 = [a3 geometryRef];
  uint64_t v6 = [a3 sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SCNGeometryTessellator_removeClient___block_invoke;
  v7[3] = &__block_descriptor_40_e8_v16__0d8l;
  v7[4] = v5;
  +[SCNTransaction postCommandWithContext:v6 object:a3 applyBlock:v7];
  [(NSMutableSet *)self->_clients removeObject:a3];
}

void __39__SCNGeometryTessellator_removeClient___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  memset(v2, 0, sizeof(v2));
  C3DGeometrySetTessellator(v1, (unsigned __int8 *)v2);
}

- (void)clientWillDie:(id)a3
{
}

- (void)tessellatorValueDidChange
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  clients = self->_clients;
  uint64_t v4 = [(NSMutableSet *)clients countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(clients);
        }
        [(SCNGeometryTessellator *)self tessellatorValueDidChangeForClient:*(void *)(*((void *)&v8 + 1) + 8 * i)];
      }
      uint64_t v5 = [(NSMutableSet *)clients countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- ($7338CD085D135657D9A3115DAE7B9BC3)_tessellatorValueForGeometry:(SEL)a3
{
  uint64_t v6 = (void *)[a4 tessellator];
  *(void *)&retstr->var2 = 0;
  retstr->var4 = 0;
  *(void *)&retstr->var0 = 0;
  if ([a4 subdivisionLevel])
  {
    unsigned __int8 v7 = 4;
  }
  else if ([v6 isAdaptive])
  {
    if ([v6 isScreenSpace]) {
      unsigned __int8 v7 = 2;
    }
    else {
      unsigned __int8 v7 = 3;
    }
  }
  else
  {
    unsigned __int8 v7 = 1;
  }
  retstr->var0 = v7;
  [v6 tessellationFactorScale];
  if (v8 < 0.00100000005) {
    double v8 = 0.00100000005;
  }
  float v9 = v8;
  retstr->var1 = v9;
  retstr->var2 = [v6 tessellationPartitionMode];
  result = ($7338CD085D135657D9A3115DAE7B9BC3 *)[v6 smoothingMode];
  retstr->var3 = result;
  switch(v7)
  {
    case 1u:
      [v6 edgeTessellationFactor];
      *(float *)&double v12 = v12;
      retstr->var4.var0.var0 = *(float *)&v12;
      result = ($7338CD085D135657D9A3115DAE7B9BC3 *)[v6 insideTessellationFactor];
      *(float *)&double v13 = v13;
      retstr->var4.var0.var1 = *(float *)&v13;
      break;
    case 2u:
    case 3u:
      result = ($7338CD085D135657D9A3115DAE7B9BC3 *)[v6 maximumEdgeLength];
      *(float *)&double v11 = v11;
      retstr->var4.var0.var0 = *(float *)&v11;
      break;
    case 4u:
      [v6 tessellationFactorScale];
      retstr->var4.var3.var0 = (int)v14;
      BYTE1(retstr->var4.var0.var0) = 1;
      result = ($7338CD085D135657D9A3115DAE7B9BC3 *)[v6 isScreenSpace];
      if (result) {
        char v15 = 3;
      }
      else {
        char v15 = 1;
      }
      BYTE1(retstr->var4.var0.var0) = v15;
      break;
    default:
      return result;
  }
  return result;
}

- (void)tessellatorValueDidChangeForClient:(id)a3
{
  long long v8 = 0uLL;
  uint64_t v9 = 0;
  if (self) {
    [(SCNGeometryTessellator *)self _tessellatorValueForGeometry:a3];
  }
  uint64_t v4 = [a3 sceneRef];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__SCNGeometryTessellator_tessellatorValueDidChangeForClient___block_invoke;
  v5[3] = &unk_264009A50;
  v5[4] = a3;
  long long v6 = v8;
  uint64_t v7 = v9;
  +[SCNTransaction postCommandWithContext:v4 object:a3 applyBlock:v5];
}

void __61__SCNGeometryTessellator_tessellatorValueDidChangeForClient___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  long long v3 = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  C3DGeometrySetTessellator(v2, (unsigned __int8 *)&v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init((Class)objc_opt_class());
  [(SCNGeometryTessellator *)self tessellationFactorScale];
  *(float *)&double v5 = v5;
  v4[8] = LODWORD(v5);
  [(SCNGeometryTessellator *)self maximumEdgeLength];
  *(float *)&double v6 = v6;
  v4[5] = LODWORD(v6);
  [(SCNGeometryTessellator *)self edgeTessellationFactor];
  *(float *)&double v7 = v7;
  v4[6] = LODWORD(v7);
  [(SCNGeometryTessellator *)self insideTessellationFactor];
  *(float *)&double v8 = v8;
  v4[7] = LODWORD(v8);
  *((unsigned char *)v4 + 16) = [(SCNGeometryTessellator *)self isAdaptive];
  *((unsigned char *)v4 + 17) = [(SCNGeometryTessellator *)self isScreenSpace];
  *((void *)v4 + 5) = [(SCNGeometryTessellator *)self smoothingMode];
  return v4;
}

- (SCNTessellationSmoothingMode)smoothingMode
{
  return self->_smoothingMode;
}

- (void)setSmoothingMode:(SCNTessellationSmoothingMode)smoothingMode
{
  if (self->_smoothingMode != smoothingMode)
  {
    self->_int64_t smoothingMode = smoothingMode;
    [(SCNGeometryTessellator *)self tessellatorValueDidChange];
  }
}

- (BOOL)isAdaptive
{
  return self->_adaptive;
}

- (void)setAdaptive:(BOOL)adaptive
{
  if (self->_adaptive != adaptive)
  {
    self->_adaptive = adaptive;
    [(SCNGeometryTessellator *)self tessellatorValueDidChange];
  }
}

- (BOOL)isScreenSpace
{
  return self->_screenSpace;
}

- (void)setScreenSpace:(BOOL)screenSpace
{
  if (self->_screenSpace != screenSpace)
  {
    self->_BOOL screenSpace = screenSpace;
    [(SCNGeometryTessellator *)self tessellatorValueDidChange];
  }
}

- (CGFloat)tessellationFactorScale
{
  return self->_tessellationFactorScale;
}

- (void)setTessellationFactorScale:(CGFloat)tessellationFactorScale
{
  if (self->_tessellationFactorScale != tessellationFactorScale)
  {
    float v3 = tessellationFactorScale;
    self->_tessellationFactorScale = v3;
    [(SCNGeometryTessellator *)self tessellatorValueDidChange];
  }
}

- (CGFloat)edgeTessellationFactor
{
  return self->_edgeTessellationFactor;
}

- (void)setEdgeTessellationFactor:(CGFloat)edgeTessellationFactor
{
  if (self->_edgeTessellationFactor != edgeTessellationFactor)
  {
    float v3 = edgeTessellationFactor;
    self->_edgeTessellationFactor = v3;
    [(SCNGeometryTessellator *)self tessellatorValueDidChange];
  }
}

- (CGFloat)insideTessellationFactor
{
  return self->_insideTessellationFactor;
}

- (void)setInsideTessellationFactor:(CGFloat)insideTessellationFactor
{
  if (self->_insideTessellationFactor != insideTessellationFactor)
  {
    float v3 = insideTessellationFactor;
    self->_insideTessellationFactor = v3;
    [(SCNGeometryTessellator *)self tessellatorValueDidChange];
  }
}

- (CGFloat)maximumEdgeLength
{
  return self->_maximumEdgeLength;
}

- (void)setMaximumEdgeLength:(CGFloat)maximumEdgeLength
{
  if (self->_maximumEdgeLength != maximumEdgeLength)
  {
    float v3 = maximumEdgeLength;
    self->_double maximumEdgeLength = v3;
    [(SCNGeometryTessellator *)self tessellatorValueDidChange];
  }
}

- (MTLTessellationPartitionMode)tessellationPartitionMode
{
  return self->_partitionMode;
}

- (void)setTessellationPartitionMode:(MTLTessellationPartitionMode)tessellationPartitionMode
{
  if (self->_partitionMode != tessellationPartitionMode)
  {
    self->_partitionMode = tessellationPartitionMode;
    [(SCNGeometryTessellator *)self tessellatorValueDidChange];
  }
}

@end