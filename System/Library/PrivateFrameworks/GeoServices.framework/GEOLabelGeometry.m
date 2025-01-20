@interface GEOLabelGeometry
- (BOOL)hasSelectionPolygon;
- (GEOLabelGeometry)initWithGEOPDLabelGeometry:(id)a3;
- (GEOLabelGeometry)initWithLabelShape:(id)a3 hasSelectionPolygon:(BOOL)a4;
- (NSArray)labelShape;
@end

@implementation GEOLabelGeometry

- (GEOLabelGeometry)initWithLabelShape:(id)a3 hasSelectionPolygon:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOLabelGeometry;
  v7 = [(GEOLabelGeometry *)&v11 init];
  if (v7)
  {
    if ([v6 count])
    {
      uint64_t v8 = [v6 copy];
      labelShape = v7->_labelShape;
      v7->_labelShape = (NSArray *)v8;
    }
    v7->_hasSelectionPolygon = a4;
  }

  return v7;
}

- (GEOLabelGeometry)initWithGEOPDLabelGeometry:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  v5 = (id *)a3;
  id v6 = objc_alloc_init(v4);
  v7 = -[GEOPDLabelGeometry labelShapes](v5);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__GEOLabelGeometry_initWithGEOPDLabelGeometry___block_invoke;
  v12[3] = &unk_1E53ECE00;
  id v13 = v6;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v12];

  if (v5) {
    BOOL v9 = *((unsigned char *)v5 + 24) != 0;
  }
  else {
    BOOL v9 = 0;
  }

  v10 = [(GEOLabelGeometry *)self initWithLabelShape:v8 hasSelectionPolygon:v9];
  return v10;
}

void __47__GEOLabelGeometry_initWithGEOPDLabelGeometry___block_invoke(uint64_t a1, id *a2)
{
  v2 = *(void **)(a1 + 32);
  -[GEOPDLineString points](a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];
}

- (NSArray)labelShape
{
  return self->_labelShape;
}

- (BOOL)hasSelectionPolygon
{
  return self->_hasSelectionPolygon;
}

- (void).cxx_destruct
{
}

@end