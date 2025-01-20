@interface PKMetalLiveStrokePaintRenderCacheBuffer
- (PKMetalLiveStrokePaintRenderCacheBuffer)init;
- (void)initWithPoints:(uint64_t)a3 liveStrokePoints:(uint64_t)a4 numPoints:(uint64_t)a5 numVertices:(void *)a6 resourceHandler:;
@end

@implementation PKMetalLiveStrokePaintRenderCacheBuffer

- (PKMetalLiveStrokePaintRenderCacheBuffer)init
{
}

- (void)initWithPoints:(uint64_t)a3 liveStrokePoints:(uint64_t)a4 numPoints:(uint64_t)a5 numVertices:(void *)a6 resourceHandler:
{
  id v11 = a6;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)PKMetalLiveStrokePaintRenderCacheBuffer;
    v12 = objc_msgSendSuper2(&v18, sel_init);
    a1 = v12;
    if (v12)
    {
      v12[5] = a5;
      v12[6] = a4;
      id v13 = -[PKMetalResourceHandler newBufferWithLength:bytes:outOffset:](v11, 24 * a4, a2, (uint64_t)(v12 + 2));
      v14 = (void *)a1[1];
      a1[1] = v13;

      id v15 = -[PKMetalResourceHandler newBufferWithLength:bytes:outOffset:](v11, 16 * a4, a3, (uint64_t)(a1 + 4));
      v16 = (void *)a1[3];
      a1[3] = v15;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveStrokePointBuffer, 0);

  objc_storeStrong((id *)&self->_strokePointBuffer, 0);
}

@end