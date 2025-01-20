@interface PKMetalParticleRenderCacheBuffer
- (uint64_t)lockPurgeableResourcesAddToSet:(uint64_t)a1;
- (void)initWithUniforms:(uint64_t)a3 points:(uint64_t)a4 numPoints:(void *)a5 resourceHandler:;
@end

@implementation PKMetalParticleRenderCacheBuffer

- (void)initWithUniforms:(uint64_t)a3 points:(uint64_t)a4 numPoints:(void *)a5 resourceHandler:
{
  id v9 = a5;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)PKMetalParticleRenderCacheBuffer;
    v10 = objc_msgSendSuper2(&v17, sel_init);
    a1 = v10;
    if (v10)
    {
      v10[7] = a4;
      id v11 = -[PKMetalResourceHandler newPurgeableBufferWithLength:bytes:outOffset:](v9, 56, a2, (uint64_t)(v10 + 3));
      v12 = (void *)a1[1];
      a1[1] = v11;

      id v13 = -[PKMetalResourceHandler newPurgeableBufferWithLength:bytes:outOffset:](v9, 32 * a4, a3, (uint64_t)(a1 + 4));
      v14 = (void *)a1[2];
      a1[2] = v13;

      unint64_t v15 = *(_DWORD *)(a3 + 32 * a4 - 24) + 4 * *(unsigned __int16 *)(a3 + 32 * a4 - 4);
      a1[5] = v15;
      a1[6] = v15 >> 2;
    }
  }

  return a1;
}

- (uint64_t)lockPurgeableResourcesAddToSet:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 count];
    [v4 addObject:*(void *)(a1 + 16)];
    if ([v4 count] == v5 || (objc_msgSend(*(id *)(a1 + 16), "lock"))
      && (*(void *)(a1 + 8) == *(void *)(a1 + 16)
       || (uint64_t v6 = [v4 count],
           [v4 addObject:*(void *)(a1 + 8)],
           [v4 count] == v6)
       || [*(id *)(a1 + 8) lock])
      && ([*(id *)(a1 + 16) isPurged] & 1) == 0)
    {
      a1 = [*(id *)(a1 + 8) isPurged] ^ 1;
    }
    else
    {
      a1 = 0;
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