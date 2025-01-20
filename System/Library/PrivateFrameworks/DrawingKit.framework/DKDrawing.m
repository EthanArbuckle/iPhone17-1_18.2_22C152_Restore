@interface DKDrawing
+ (BOOL)supportsSecureCoding;
+ (id)copyOfDrawing:(id)a3 toFitInBounds:(CGRect)a4;
+ (void)resizeDrawing:(id)a3 toFitInBounds:(CGRect)a4;
- (CGRect)canvasBounds;
- (CGRect)strokesFrame;
- (DKDrawing)init;
- (DKDrawing)initWithCoder:(id)a3;
- (NSArray)strokes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodedBrushStrokesWithArchiverEncodedBrushStrokes:(id)a3;
- (id)encodeBrushStrokesForArchiving;
- (id)mutableStrokes;
- (int64_t)totalPoints;
- (void)addBrushStroke:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)setCanvasBounds:(CGRect)a3;
- (void)setStrokes:(id)a3;
- (void)setStrokesFrame:(CGRect)a3;
@end

@implementation DKDrawing

- (DKDrawing)init
{
  v7.receiver = self;
  v7.super_class = (Class)DKDrawing;
  v2 = [(DKDrawing *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    strokes = v2->_strokes;
    v2->_strokes = (NSMutableArray *)v3;

    CGSize v5 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    v2->_strokesFrame.origin = (CGPoint)*MEMORY[0x263F001A8];
    v2->_strokesFrame.size = v5;
  }
  return v2;
}

- (void)reset
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  strokes = self->_strokes;
  self->_strokes = v3;

  CGSize v5 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->_strokesFrame.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->_strokesFrame.size = v5;
}

- (int64_t)totalPoints
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(DKDrawing *)self strokes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) strokePoints];
        v5 += [v8 count];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(DKDrawing);
  uint64_t v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithArray:self->_strokes copyItems:1];
  strokes = v4->_strokes;
  v4->_strokes = (NSMutableArray *)v5;

  CGSize size = self->_strokesFrame.size;
  v4->_strokesFrame.origin = self->_strokesFrame.origin;
  v4->_strokesFrame.CGSize size = size;
  CGSize v8 = self->_canvasBounds.size;
  v4->_canvasBounds.origin = self->_canvasBounds.origin;
  v4->_canvasBounds.CGSize size = v8;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DKDrawing)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DKDrawing *)self init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    CFDictionaryRef v10 = [v4 decodeObjectOfClasses:v9 forKey:@"sb1"];

    CGRectMakeWithDictionaryRepresentation(v10, &v5->_strokesFrame);
    long long v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    CFDictionaryRef v15 = [v4 decodeObjectOfClasses:v14 forKey:@"cb1"];

    CGRectMakeWithDictionaryRepresentation(v15, &v5->_canvasBounds);
    v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v16, "setWithObjects:", v17, v18, v19, objc_opt_class(), 0);
    v21 = [v4 decodeObjectOfClasses:v20 forKey:@"st1"];

    uint64_t v22 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v21, "count"));
    strokes = v5->_strokes;
    v5->_strokes = (NSMutableArray *)v22;

    uint64_t v24 = [(DKDrawing *)v5 decodedBrushStrokesWithArchiverEncodedBrushStrokes:v21];
    v25 = v5->_strokes;
    v5->_strokes = (NSMutableArray *)v24;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v7 = [(DKDrawing *)self encodeBrushStrokesForArchiving];
  [v4 encodeObject:v7 forKey:@"st1"];
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(self->_strokesFrame);
  [v4 encodeObject:DictionaryRepresentation forKey:@"sb1"];
  CFDictionaryRef v6 = CGRectCreateDictionaryRepresentation(self->_canvasBounds);

  [v4 encodeObject:v6 forKey:@"cb1"];
}

- (id)encodeBrushStrokesForArchiving
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](self->_strokes, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_strokes;
  uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v9 = [v8 encodedBrushStroke];
        CFDictionaryRef v10 = [v8 strokePoints];
        uint64_t v11 = [v10 count];

        v20[1] = @"ct1";
        v21[0] = v9;
        v20[0] = @"bt1";
        uint64_t v12 = [NSNumber numberWithInt:v11];
        v21[1] = v12;
        uint64_t v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
        [v3 addObject:v13];
      }
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)decodedBrushStrokesWithArchiverEncodedBrushStrokes:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v17 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        CFDictionaryRef v10 = [v9 objectForKey:@"bt1"];
        uint64_t v11 = [v9 objectForKey:@"ct1"];
        int v12 = [v11 intValue];

        if ([v10 length]) {
          BOOL v13 = v12 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (v13)
        {
          NSLog(&cfstr_EncodedStrokeH.isa, [v10 length], v12);
        }
        else
        {
          uint64_t v14 = +[DKDrawingStroke drawingStrokeWithData:v10 count:v12];
          CFDictionaryRef v15 = (void *)v14;
          if (v14) {
            [v17 addObject:v14];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  return v17;
}

- (id)mutableStrokes
{
  return self->_strokes;
}

- (void)addBrushStroke:(id)a3
{
}

+ (id)copyOfDrawing:(id)a3 toFitInBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v8 = (void *)[a3 copy];
  objc_msgSend((id)objc_opt_class(), "resizeDrawing:toFitInBounds:", v8, x, y, width, height);
  return v8;
}

+ (void)resizeDrawing:(id)a3 toFitInBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [v6 strokesFrame];
  double v8 = v7;
  [v6 strokesFrame];
  double v10 = v9;
  [v6 strokesFrame];
  double v12 = width / v11;
  [v6 strokesFrame];
  long long v59 = 0u;
  long long v60 = 0u;
  if (v12 >= height / v13) {
    double v12 = height / v13;
  }
  long long v61 = 0uLL;
  long long v62 = 0uLL;
  uint64_t v14 = [v6 strokes];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v60 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v20 = [v19 strokePoints];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v55 objects:v65 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v56;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v56 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v55 + 1) + 8 * j);
              [v25 location];
              double v27 = v26 - v8;
              [v25 location];
              objc_msgSend(v25, "setLocation:", v27, v28 - v10);
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v55 objects:v65 count:16];
          }
          while (v22);
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v59 objects:v66 count:16];
    }
    while (v16);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v29 = [v6 strokes];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v51 objects:v64 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v52;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v52 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v51 + 1) + 8 * k);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        v35 = objc_msgSend(v34, "strokePoints", 0);
        uint64_t v36 = [v35 countByEnumeratingWithState:&v47 objects:v63 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v48;
          do
          {
            for (uint64_t m = 0; m != v37; ++m)
            {
              if (*(void *)v48 != v38) {
                objc_enumerationMutation(v35);
              }
              v40 = *(void **)(*((void *)&v47 + 1) + 8 * m);
              [v40 location];
              double v42 = v12 * v41;
              [v40 location];
              objc_msgSend(v40, "setLocation:", v42, v12 * v43);
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v47 objects:v63 count:16];
          }
          while (v37);
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v51 objects:v64 count:16];
    }
    while (v31);
  }

  [v6 strokesFrame];
  double v45 = v12 * v44;
  [v6 strokesFrame];
  objc_msgSend(v6, "setStrokesFrame:", 0.0, 0.0, v45, v12 * v46);
}

- (NSArray)strokes
{
  return &self->_strokes->super;
}

- (void)setStrokes:(id)a3
{
}

- (CGRect)canvasBounds
{
  double x = self->_canvasBounds.origin.x;
  double y = self->_canvasBounds.origin.y;
  double width = self->_canvasBounds.size.width;
  double height = self->_canvasBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCanvasBounds:(CGRect)a3
{
  self->_canvasBounds = a3;
}

- (CGRect)strokesFrame
{
  double x = self->_strokesFrame.origin.x;
  double y = self->_strokesFrame.origin.y;
  double width = self->_strokesFrame.size.width;
  double height = self->_strokesFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setStrokesFrame:(CGRect)a3
{
  self->_strokesFrame = a3;
}

- (void).cxx_destruct
{
}

@end