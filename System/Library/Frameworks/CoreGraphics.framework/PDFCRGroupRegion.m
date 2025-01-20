@interface PDFCRGroupRegion
- (CRNormalizedQuad)boundingQuad;
- (NSArray)children;
- (NSArray)subregions;
- (PDFCRGroupRegion)initWithBoundingQuad:(id)a3 layoutDirection:(unint64_t)a4 subregions:(id)a5 parent:(id)a6;
- (PDFCRGroupRegion)parent;
- (unint64_t)layoutDirection;
- (unsigned)type;
- (void)addChild:(id)a3;
- (void)insertChildren:(id)a3 atIndex:(unint64_t)a4;
- (void)removeChild:(id)a3;
- (void)removeSubregion:(id)a3;
- (void)setChildren:(id)a3;
- (void)setParent:(id)a3;
- (void)setType:(unsigned int)a3;
@end

@implementation PDFCRGroupRegion

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_subregions, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);

  objc_storeStrong((id *)&self->_children, 0);
}

- (void)setChildren:(id)a3
{
}

- (NSArray)children
{
  return &self->_children->super;
}

- (void)setParent:(id)a3
{
}

- (PDFCRGroupRegion)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (PDFCRGroupRegion *)WeakRetained;
}

- (NSArray)subregions
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 24, 1);
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)insertChildren:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)removeChild:(id)a3
{
}

- (void)addChild:(id)a3
{
}

- (void)removeSubregion:(id)a3
{
  id v7 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_subregions];
  [v4 removeObject:v7];
  if ([v4 count])
  {
    v5 = v4;
    subregions = self->_subregions;
    self->_subregions = v5;
  }
  else
  {
    subregions = objc_loadWeakRetained((id *)&self->_parent);
    [subregions removeChild:self];
  }
}

- (PDFCRGroupRegion)initWithBoundingQuad:(id)a3 layoutDirection:(unint64_t)a4 subregions:(id)a5 parent:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PDFCRGroupRegion;
  v14 = [(PDFCRGroupRegion *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_boundingQuad, a3);
    v15->_layoutDirection = a4;
    objc_storeStrong((id *)&v15->_subregions, a5);
    uint64_t v16 = objc_opt_new();
    children = v15->_children;
    v15->_children = (NSMutableArray *)v16;

    objc_storeWeak((id *)&v15->_parent, v13);
    v15->_type = 5;
  }

  return v15;
}

@end