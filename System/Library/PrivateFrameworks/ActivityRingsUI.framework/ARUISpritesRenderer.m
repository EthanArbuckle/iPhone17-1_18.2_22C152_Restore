@interface ARUISpritesRenderer
+ (void)clearCaches;
- (ARUISpritesRenderer)initWithDevice:(id)a3 library:(id)a4;
- (ARUISpritesRenderer)initWithDeviceSPI:(id)a3 librarySPI:(id)a4;
- (void)_sharedInitWithDevice:(id)a3;
- (void)renderSpriteSheet:(id)a3 intoContext:(id)a4 withCommandEncoder:(id)a5;
@end

@implementation ARUISpritesRenderer

- (void)renderSpriteSheet:(id)a3 intoContext:(id)a4 withCommandEncoder:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(ARUISpriteRenderState *)self->_spriteRenderState renderPipelineState];
  [v10 setRenderPipelineState:v11];

  v12 = [v8 texture];
  v13 = [v12 texture];
  [v10 setFragmentTexture:v13 atIndex:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_spriteVertexBuffer);
  [v10 setVertexBuffer:WeakRetained offset:0 atIndex:0];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v22 = v8;
  id obj = [v8 sprites];
  uint64_t v15 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = [(ARUISpriteUniformsCache *)self->_cache uniformsForSprite:*(void *)(*((void *)&v24 + 1) + 8 * v18) renderedInContext:v9];
        objc_msgSend(v10, "setVertexBytes:length:atIndex:", objc_msgSend(v19, "vertexAttributesBytes"), 64, 1);
        objc_msgSend(v10, "setFragmentBytes:length:atIndex:", objc_msgSend(v19, "uniformsBytes"), 32, 0);
        unint64_t numIndicies = self->_numIndicies;
        id v21 = objc_loadWeakRetained((id *)&self->_spriteIndexBuffer);
        [v10 drawIndexedPrimitives:3 indexCount:numIndicies indexType:0 indexBuffer:v21 indexBufferOffset:0];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }
}

- (ARUISpritesRenderer)initWithDeviceSPI:(id)a3 librarySPI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ARUISpritesRenderer;
  id v8 = [(ARUISpritesRenderer *)&v12 init];
  if (v8)
  {
    id v9 = [[ARUISpriteRenderState alloc] initWithPipelineLibrary:v7];
    spriteRenderState = v8->_spriteRenderState;
    v8->_spriteRenderState = v9;

    [(ARUISpritesRenderer *)v8 _sharedInitWithDevice:v6];
  }

  return v8;
}

- (void)_sharedInitWithDevice:(id)a3
{
  id v4 = a3;
  v5 = +[ARUISpritesStaticBufferFactory spritePositionsBufferWithDevice:v4];
  objc_storeWeak((id *)&self->_spriteVertexBuffer, v5);

  id v6 = +[ARUISpritesStaticBufferFactory spriteIndexBufferWithDevice:v4];

  objc_storeWeak((id *)&self->_spriteIndexBuffer, v6);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_spriteIndexBuffer);
  self->_unint64_t numIndicies = (unint64_t)[WeakRetained length] >> 1;

  id v8 = +[ARUISpriteUniformsCache defaultCache];
  cache = self->_cache;
  self->_cache = v8;

  MEMORY[0x270F9A758](v8, cache);
}

- (ARUISpritesRenderer)initWithDevice:(id)a3 library:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ARUISpritesRenderer;
  id v8 = [(ARUISpritesRenderer *)&v12 init];
  if (v8)
  {
    id v9 = [[ARUISpriteRenderState alloc] initWithDevice:v6 library:v7];
    spriteRenderState = v8->_spriteRenderState;
    v8->_spriteRenderState = v9;

    [(ARUISpritesRenderer *)v8 _sharedInitWithDevice:v6];
  }

  return v8;
}

+ (void)clearCaches
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_spriteRenderState, 0);
  objc_destroyWeak((id *)&self->_spriteIndexBuffer);

  objc_destroyWeak((id *)&self->_spriteVertexBuffer);
}

@end