@interface NTKExtragalacticGlyphShapes
- (NSMutableDictionary)glyphLayers;
- (NTKExtragalacticGlyphShapes)init;
- (void)removeAllPaths;
- (void)setGlyphLayers:(id)a3;
- (void)setPath:(id)a3 forGlyphColor:(unint64_t)a4;
- (void)setPosition:(CGPoint)a3;
- (void)setShapeFrame:(CGRect)a3;
- (void)setShapeLayer:(id)a3 atGlyphColor:(unint64_t)a4;
@end

@implementation NTKExtragalacticGlyphShapes

- (NTKExtragalacticGlyphShapes)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKExtragalacticGlyphShapes;
  v2 = [(NTKExtragalacticGlyphShapes *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
    glyphLayers = v2->_glyphLayers;
    v2->_glyphLayers = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)setPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(NSMutableDictionary *)self->_glyphLayers allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setPosition:", x, y);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setShapeFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v17 = *MEMORY[0x263EF8340];
  self->_shapeFrame = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(NSMutableDictionary *)self->_glyphLayers allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setFrame:", x, y, width, height);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)setShapeLayer:(id)a3 atGlyphColor:(unint64_t)a4
{
  glyphLayers = self->_glyphLayers;
  uint64_t v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)glyphLayers setObject:v7 forKeyedSubscript:v8];
}

- (void)setPath:(id)a3 forGlyphColor:(unint64_t)a4
{
  glyphLayers = self->_glyphLayers;
  uint64_t v6 = NSNumber;
  id v7 = a3;
  id v11 = [v6 numberWithUnsignedInteger:a4];
  id v8 = [(NSMutableDictionary *)glyphLayers objectForKeyedSubscript:v11];
  id v9 = v7;
  uint64_t v10 = [v9 CGPath];

  [v8 setPath:v10];
}

- (void)removeAllPaths
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMutableDictionary *)self->_glyphLayers allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setPath:0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSMutableDictionary)glyphLayers
{
  return self->_glyphLayers;
}

- (void)setGlyphLayers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end