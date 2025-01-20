@interface PKMetalPaintRenderCacheBuffer
- (PKMetalPaintRenderCacheBuffer)init;
- (void)initWithUniforms:(uint64_t)a3 points:(uint64_t)a4 numPoints:(uint64_t)a5 numVertices:(void *)a6 resourceHandler:;
@end

@implementation PKMetalPaintRenderCacheBuffer

- (PKMetalPaintRenderCacheBuffer)init
{
}

- (void)initWithUniforms:(uint64_t)a3 points:(uint64_t)a4 numPoints:(uint64_t)a5 numVertices:(void *)a6 resourceHandler:
{
  id v11 = a6;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)PKMetalPaintRenderCacheBuffer;
    v12 = objc_msgSendSuper2(&v18, sel_init);
    a1 = v12;
    if (v12)
    {
      v12[5] = a5;
      v12[6] = a4;
      id v13 = -[PKMetalResourceHandler newPurgeableBufferWithLength:bytes:outOffset:](v11, 128, a2, (uint64_t)(v12 + 3));
      v14 = (void *)a1[1];
      a1[1] = v13;

      id v15 = -[PKMetalResourceHandler newPurgeableBufferWithLength:bytes:outOffset:](v11, 24 * a4, a3, (uint64_t)(a1 + 4));
      v16 = (void *)a1[2];
      a1[2] = v15;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pkStrokePointBuffer, 0);

  objc_storeStrong((id *)&self->_pkUniformsBuffer, 0);
}

@end