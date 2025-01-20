@interface ARUIRingsStaticBufferFactory
+ (id)ringIndexBufferWithDevice:(id)a3;
+ (id)ringVertexPositionsBufferWithDevice:(id)a3;
+ (unint64_t)circleSegments;
+ (void)clearCaches;
@end

@implementation ARUIRingsStaticBufferFactory

+ (id)ringVertexPositionsBufferWithDevice:(id)a3
{
  v3 = (void *)__ringVertexPositionsBuffer;
  if (!__ringVertexPositionsBuffer)
  {
    id v4 = a3;
    v5 = objc_alloc_init(ARUIRingsGeometry);
    [(ARUIRingsGeometry *)v5 setCircleSegments:30];
    size_t v6 = 32 * [(ARUIRingsGeometry *)v5 vertexCount];
    v7 = malloc_type_malloc(v6, 0x64A3D2AuLL);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __68__ARUIRingsStaticBufferFactory_ringVertexPositionsBufferWithDevice___block_invoke;
    v11[3] = &__block_descriptor_40_e23_v32__0I8I12f16f20f24f28l;
    v11[4] = v7;
    [(ARUIRingsGeometry *)v5 enumerateVertexGeometryWithBlock:v11];
    uint64_t v8 = [v4 newBufferWithBytes:v7 length:v6 options:0];

    v9 = (void *)__ringVertexPositionsBuffer;
    __ringVertexPositionsBuffer = v8;

    [(id)__ringVertexPositionsBuffer setLabel:@"Verticies"];
    free(v7);

    v3 = (void *)__ringVertexPositionsBuffer;
  }

  return v3;
}

+ (id)ringIndexBufferWithDevice:(id)a3
{
  v3 = (void *)__ringIndexBuffer;
  if (!__ringIndexBuffer)
  {
    id v4 = a3;
    v5 = objc_alloc_init(ARUIRingsGeometry);
    [(ARUIRingsGeometry *)v5 setCircleSegments:30];
    uint64_t v6 = 2 * [(ARUIRingsGeometry *)v5 indexCount];
    v7 = [(ARUIRingsGeometry *)v5 connectedIndiciesGeometry];
    uint64_t v8 = [v4 newBufferWithBytes:v7 length:v6 options:0];

    v9 = (void *)__ringIndexBuffer;
    __ringIndexBuffer = v8;

    [(id)__ringIndexBuffer setLabel:@"Indicies"];
    free(v7);

    v3 = (void *)__ringIndexBuffer;
  }

  return v3;
}

float __68__ARUIRingsStaticBufferFactory_ringVertexPositionsBufferWithDevice___block_invoke(uint64_t a1, double a2, float a3, __n128 a4, float a5, uint64_t a6, unsigned int a7)
{
  v7 = (__n128 *)(*(void *)(a1 + 32) + 32 * a7);
  a4.n128_f32[1] = a5;
  a4.n128_u32[2] = 0;
  float result = 1.0;
  a4.n128_u32[3] = 1.0;
  __n128 *v7 = a4;
  v7[1].n128_f32[0] = a3;
  v7[1].n128_u32[1] = 0;
  v9 = (__n128 *)(*(void *)(a1 + 32) + 32 * (a7 + 1));
  __n128 *v9 = a4;
  v9[1].n128_f32[0] = a3;
  v9[1].n128_u32[1] = 1;
  return result;
}

+ (unint64_t)circleSegments
{
  return 30;
}

+ (void)clearCaches
{
  v2 = (void *)__ringVertexPositionsBuffer;
  if (__ringVertexPositionsBuffer)
  {
    __ringVertexPositionsBuffer = 0;
  }
  v3 = (void *)__ringIndexBuffer;
  if (__ringIndexBuffer)
  {
    __ringIndexBuffer = 0;
  }
}

@end