@interface DKDrawingStroke
+ (DKDrawingStroke)drawingStrokeWithData:(id)a3 count:(unint64_t)a4;
- (DKDrawingStroke)init;
- (NSMutableArray)strokePoints;
- (id)_decodeDKEncodedDrawingPointDataAsArray:(id)a3 count:(int64_t)a4;
- (id)_encodePointsDrawingPointData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodedBrushStroke;
@end

@implementation DKDrawingStroke

- (DKDrawingStroke)init
{
  v6.receiver = self;
  v6.super_class = (Class)DKDrawingStroke;
  v2 = [(DKDrawingStroke *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    strokePoints = v2->_strokePoints;
    v2->_strokePoints = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = objc_alloc(MEMORY[0x263EFF980]);
  objc_super v6 = [(DKDrawingStroke *)self strokePoints];
  uint64_t v7 = [v5 initWithArray:v6 copyItems:1];
  v8 = (void *)v4[1];
  v4[1] = v7;

  return v4;
}

- (id)encodedBrushStroke
{
  return [(DKDrawingStroke *)self _encodePointsDrawingPointData:self->_strokePoints];
}

+ (DKDrawingStroke)drawingStrokeWithData:(id)a3 count:(unint64_t)a4
{
  id v5 = a3;
  objc_super v6 = objc_alloc_init(DKDrawingStroke);
  uint64_t v7 = [(DKDrawingStroke *)v6 _decodeDKEncodedDrawingPointDataAsArray:v5 count:a4];

  v8 = [(DKDrawingStroke *)v6 strokePoints];
  [v8 addObjectsFromArray:v7];

  return v6;
}

- (id)_encodePointsDrawingPointData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  id v5 = (void *)(32 * v4);
  if (32 * v4)
  {
    int v6 = v4;
    uint64_t v7 = malloc_type_malloc(32 * v4, 0xB1CD9CFCuLL);
    if (v7)
    {
      v8 = v7;
      if (v6 >= 1)
      {
        uint64_t v9 = 0;
        uint64_t v10 = v6;
        v11 = v7 + 2;
        do
        {
          v12 = [v3 objectAtIndex:v9];
          [v12 location];
          uint64_t v14 = v13;
          uint64_t v16 = v15;
          [v12 velocity];
          uint64_t v18 = v17;
          [v12 force];
          *(v11 - 2) = v14;
          *(v11 - 1) = v16;
          void *v11 = v18;
          v11[1] = v19;
          v11 += 4;

          ++v9;
        }
        while (v10 != v9);
      }
      id v5 = [MEMORY[0x263EFF8F8] dataWithBytes:v8 length:v5];
      free(v8);
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)_decodeDKEncodedDrawingPointDataAsArray:(id)a3 count:(int64_t)a4
{
  id v5 = a3;
  int v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = [v5 length];
  if (a4 >= 1 && v7)
  {
    v8 = (double *)([v5 bytes] + 16);
    do
    {
      double v9 = *(v8 - 2);
      double v10 = *(v8 - 1);
      double v11 = *v8;
      double v12 = v8[1];
      v8 += 4;
      uint64_t v13 = objc_alloc_init(DKDrawingStrokePoint);
      -[DKDrawingStrokePoint setLocation:](v13, "setLocation:", v9, v10);
      [(DKDrawingStrokePoint *)v13 setVelocity:v11];
      [(DKDrawingStrokePoint *)v13 setForce:v12];
      [v6 addObject:v13];

      --a4;
    }
    while (a4);
  }

  return v6;
}

- (NSMutableArray)strokePoints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end