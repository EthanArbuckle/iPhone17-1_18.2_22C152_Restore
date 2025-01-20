@interface ARUISpritesParticleRenderer
- (ARUISpritesParticleRenderer)initWithDevice:(id)a3 library:(id)a4 bufferSize:(unint64_t)a5;
- (ARUISpritesParticleRenderer)initWithDeviceSPI:(id)a3 librarySPI:(id)a4 bufferSize:(unint64_t)a5;
- (void)_sharedInitWithDevice:(id)a3 bufferSize:(unint64_t)a4;
- (void)renderSpriteSheet:(id)a3 intoContext:(id)a4 withCommandEncoder:(id)a5;
@end

@implementation ARUISpritesParticleRenderer

- (ARUISpritesParticleRenderer)initWithDevice:(id)a3 library:(id)a4 bufferSize:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ARUISpritesParticleRenderer;
  v10 = [(ARUISpritesParticleRenderer *)&v14 init];
  if (v10)
  {
    v11 = [[ARUISpriteParticleRenderState alloc] initWithDevice:v8 library:v9];
    spriteRenderState = v10->_spriteRenderState;
    v10->_spriteRenderState = v11;

    [(ARUISpritesParticleRenderer *)v10 _sharedInitWithDevice:v8 bufferSize:a5];
  }

  return v10;
}

- (ARUISpritesParticleRenderer)initWithDeviceSPI:(id)a3 librarySPI:(id)a4 bufferSize:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ARUISpritesParticleRenderer;
  v10 = [(ARUISpritesParticleRenderer *)&v14 init];
  if (v10)
  {
    v11 = [[ARUISpriteParticleRenderState alloc] initWithPipelineLibrary:v9];
    spriteRenderState = v10->_spriteRenderState;
    v10->_spriteRenderState = v11;

    [(ARUISpritesParticleRenderer *)v10 _sharedInitWithDevice:v8 bufferSize:a5];
  }

  return v10;
}

- (void)_sharedInitWithDevice:(id)a3 bufferSize:(unint64_t)a4
{
  id v6 = a3;
  v7 = +[ARUISpritesStaticBufferFactory spritePositionsBufferWithDevice:v6];
  objc_storeWeak((id *)&self->_spriteVertexBuffer, v7);

  id v8 = +[ARUISpritesStaticBufferFactory spriteIndexBufferWithDevice:v6];
  objc_storeWeak((id *)&self->_spriteIndexBuffer, v8);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_spriteIndexBuffer);
  self->_numIndicies = (unint64_t)[WeakRetained length] >> 1;

  self->_bufferSize = a4;
  v10 = (MTLBuffer *)[v6 newBufferWithLength:a4 << 6 options:0];
  vertexAttributesBuffer = self->_vertexAttributesBuffer;
  self->_vertexAttributesBuffer = v10;

  v12 = (MTLBuffer *)[v6 newBufferWithLength:32 * self->_bufferSize options:0];
  uniformsBuffer = self->_uniformsBuffer;
  self->_uniformsBuffer = v12;
}

- (void)renderSpriteSheet:(id)a3 intoContext:(id)a4 withCommandEncoder:(id)a5
{
  id v42 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v42 sprites];
  unint64_t v11 = [v10 count];
  unint64_t bufferSize = self->_bufferSize;

  if (v11 > bufferSize && os_variant_has_internal_ui())
  {
    v13 = (void *)MEMORY[0x263EFF940];
    uint64_t v14 = *MEMORY[0x263EFF578];
    unint64_t v15 = self->_bufferSize;
    v16 = [v42 sprites];
    [v13 raise:v14, @"The sprite particle buffer should be resized, instantiated with buffer size %lu, but received particle count of: %lu", v15, objc_msgSend(v16, "count") format];
  }
  v17 = [(ARUISpriteParticleRenderState *)self->_spriteRenderState renderPipelineState];
  [v9 setRenderPipelineState:v17];

  v18 = [v42 texture];
  v19 = [v18 texture];
  [v9 setFragmentTexture:v19 atIndex:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_spriteVertexBuffer);
  v41 = v9;
  [v9 setVertexBuffer:WeakRetained offset:0 atIndex:0];

  v21 = [v42 sprites];
  unint64_t v22 = [v21 count];

  if (v22 >= self->_bufferSize) {
    unint64_t v23 = self->_bufferSize;
  }
  else {
    unint64_t v23 = v22;
  }
  if (v23)
  {
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    for (uint64_t i = 0; i != v23; ++i)
    {
      v27 = [v42 sprites];
      v28 = [v27 objectAtIndex:i];

      v29 = [[ARUISpriteUniforms alloc] initWithSprite:v28 inContext:v8];
      v30 = (_OWORD *)([(MTLBuffer *)self->_vertexAttributesBuffer contents] + v25);
      v31 = [(ARUISpriteUniforms *)v29 vertexAttributesBytes];
      long long v32 = v31[3];
      long long v34 = *v31;
      long long v33 = v31[1];
      v30[2] = v31[2];
      v30[3] = v32;
      _OWORD *v30 = v34;
      v30[1] = v33;
      v35 = (_OWORD *)([(MTLBuffer *)self->_uniformsBuffer contents] + v24);
      v36 = [(ARUISpriteUniforms *)v29 uniformsBytes];
      long long v37 = v36[1];
      _OWORD *v35 = *v36;
      v35[1] = v37;

      v25 += 64;
      v24 += 32;
    }
  }
  [v41 setVertexBuffer:self->_vertexAttributesBuffer offset:0 atIndex:1];
  [v41 setFragmentBuffer:self->_uniformsBuffer offset:0 atIndex:0];
  unint64_t numIndicies = self->_numIndicies;
  id v39 = objc_loadWeakRetained((id *)&self->_spriteIndexBuffer);
  v40 = [v42 sprites];
  objc_msgSend(v41, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:", 3, numIndicies, 0, v39, 0, objc_msgSend(v40, "count"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteRenderState, 0);
  objc_storeStrong((id *)&self->_uniformsBuffer, 0);
  objc_storeStrong((id *)&self->_vertexAttributesBuffer, 0);
  objc_destroyWeak((id *)&self->_spriteIndexBuffer);

  objc_destroyWeak((id *)&self->_spriteVertexBuffer);
}

@end