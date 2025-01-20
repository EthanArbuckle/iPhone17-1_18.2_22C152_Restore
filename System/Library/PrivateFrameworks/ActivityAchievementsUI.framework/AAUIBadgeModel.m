@interface AAUIBadgeModel
- ($2FE3C3292E52C4A5B67D27538456EAD9)vertices;
- (AAUIBadgeModel)initWithPath:(id)a3;
- (int)groupCount;
- (int)groups;
- (int)indexCount;
- (int)materials;
- (int)vertexCount;
- (unsigned)indices;
- (void)_loadModelAtPath:(id)a3 intoVertices:(id *)a4 indices:(unsigned int *)a5 groups:(int *)a6 materials:(int *)a7 vertexCount:(int *)a8 indexCount:(int *)a9 groupCount:(int *)a10;
- (void)dealloc;
- (void)setGroupCount:(int)a3;
- (void)setGroups:(int *)a3;
- (void)setIndexCount:(int)a3;
- (void)setIndices:(unsigned int *)a3;
- (void)setMaterials:(int *)a3;
- (void)setVertexCount:(int)a3;
- (void)setVertices:(id *)a3;
@end

@implementation AAUIBadgeModel

- (void)dealloc
{
  free(self->_materials);
  free(self->_groups);
  free(self->_vertices);
  free(self->_indices);
  v3.receiver = self;
  v3.super_class = (Class)AAUIBadgeModel;
  [(AAUIBadgeModel *)&v3 dealloc];
}

- (int)groups
{
  return self->_groups;
}

- (int)groupCount
{
  return self->_groupCount;
}

- (int)materials
{
  return self->_materials;
}

- ($2FE3C3292E52C4A5B67D27538456EAD9)vertices
{
  return self->_vertices;
}

- (int)vertexCount
{
  return self->_vertexCount;
}

- (AAUIBadgeModel)initWithPath:(id)a3
{
  id v4 = a3;
  v15 = 0;
  v16 = 0;
  v14 = 0;
  uint64_t v12 = 0;
  v13 = 0;
  int v11 = 0;
  v10.receiver = self;
  v10.super_class = (Class)AAUIBadgeModel;
  v5 = [(AAUIBadgeModel *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(AAUIBadgeModel *)v5 _loadModelAtPath:v4 intoVertices:&v16 indices:&v15 groups:&v14 materials:&v13 vertexCount:(char *)&v12 + 4 indexCount:&v12 groupCount:&v11];
    v7 = v15;
    v6->_vertices = v16;
    v6->_indices = v7;
    v8 = v13;
    v6->_groups = v14;
    v6->_materials = v8;
    LODWORD(v8) = v12;
    v6->_vertexCount = HIDWORD(v12);
    v6->_indexCount = (int)v8;
    v6->_groupCount = v11;
  }

  return v6;
}

- (unsigned)indices
{
  return self->_indices;
}

- (int)indexCount
{
  return self->_indexCount;
}

- (void)_loadModelAtPath:(id)a3 intoVertices:(id *)a4 indices:(unsigned int *)a5 groups:(int *)a6 materials:(int *)a7 vertexCount:(int *)a8 indexCount:(int *)a9 groupCount:(int *)a10
{
  *(void *)&size[1] = *MEMORY[0x263EF8340];
  objc_super v10 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:a3];
  [v10 getBytes:v25 length:12];
  size_t v12 = v25[0];
  size_t v11 = v25[1];
  size_t v13 = size[0];
  v14 = (int *)malloc_type_calloc(4uLL, size[0], 0x449065CDuLL);
  objc_msgSend(v10, "getBytes:range:", v14, 12, 4 * v13);
  uint64_t v15 = 4 * v13 + 12;
  v16 = (int *)malloc_type_calloc(4uLL, v13, 0xDECCA63CuLL);
  objc_msgSend(v10, "getBytes:range:", v16, v15, 4 * v13);
  size_t v17 = v15 + 4 * v13;
  v18 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(0x20uLL, v12, 0x30225939uLL);
  objc_msgSend(v10, "getBytes:range:", v18, v17, 32 * v12);
  v11 *= 3;
  v19 = (unsigned int *)malloc_type_calloc(4uLL, v11, 0xAF7A0BA4uLL);
  objc_msgSend(v10, "getBytes:range:", v19, v17 + 32 * v12, 4 * v11);
  *a8 = v12;
  *a9 = v11;
  *a10 = v13;
  *a4 = v18;
  *a5 = v19;
  *a6 = v16;
  *a7 = v14;
}

- (void)setVertices:(id *)a3
{
  self->_vertices = a3;
}

- (void)setIndices:(unsigned int *)a3
{
  self->_indices = a3;
}

- (void)setGroups:(int *)a3
{
  self->_groups = a3;
}

- (void)setMaterials:(int *)a3
{
  self->_materials = a3;
}

- (void)setVertexCount:(int)a3
{
  self->_vertexCount = a3;
}

- (void)setIndexCount:(int)a3
{
  self->_indexCount = a3;
}

- (void)setGroupCount:(int)a3
{
  self->_groupCount = a3;
}

@end