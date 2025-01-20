@interface GKBrushList
+ (id)brushListWithBrushes:(id)a3;
- (NSArray)brushList;
- (id)copyWithZone:(_NSZone *)a3;
- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5;
- (void)setBrushList:(id)a3;
@end

@implementation GKBrushList

+ (id)brushListWithBrushes:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setBrushList:v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKBrushList;
  id v4 = [(GKThemeBrush *)&v7 copyWithZone:a3];
  v5 = [(GKBrushList *)self brushList];
  [v4 setBrushList:v5];

  return v4;
}

- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v11 = a5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v12 = [(GKBrushList *)self brushList];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v28;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v27 + 1) + 8 * v17);
        -[GKBrushList drawRectForBrushAtIndex:fromRect:input:](self, "drawRectForBrushAtIndex:fromRect:input:", v15 + v17, v11, x, y, width, height);
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        -[GKBrushList willDrawRect:withBrushAtIndex:input:](self, "willDrawRect:withBrushAtIndex:input:", v15 + v17, v11);
        objc_msgSend(v18, "drawInRect:withContext:input:", a4, v11, v20, v22, v24, v26);
        -[GKBrushList didDrawRect:withBrushAtIndex:input:](self, "didDrawRect:withBrushAtIndex:input:", v15 + v17++, v11, v20, v22, v24, v26);
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      v15 += v17;
    }
    while (v14);
  }
}

- (NSArray)brushList
{
  return self->_brushList;
}

- (void)setBrushList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end