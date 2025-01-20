@interface VCPFaceTensorModel
- (VCPFaceTensorModel)initWithModelFile:(__sFILE *)a3;
- (float)componentsBlendshape;
- (float)meanBlendshape;
- (float)tensorCoeff;
- (int)blendshapeComponentIndex;
- (int)numVertices;
- (void)calculateMesh:(float *)a3 numVertices:(int)a4 blendshapes:(float *)a5 outputMesh:(float *)a6;
- (void)calculateModelBlendshapes:(float *)a3 outputBlendshapes:(float *)a4;
- (void)dealloc;
@end

@implementation VCPFaceTensorModel

- (VCPFaceTensorModel)initWithModelFile:(__sFILE *)a3
{
  v34.receiver = self;
  v34.super_class = (Class)VCPFaceTensorModel;
  v4 = [(VCPFaceTensorModel *)&v34 init];
  v5 = v4;
  if (v4)
  {
    p_numBlendshapePlusOne = &v4->_numBlendshapePlusOne;
    if (fread(&v4->_numBlendshapePlusOne, 4uLL, 1uLL, a3) != 1) {
      goto LABEL_46;
    }
    if (fread(&v5->_numComponents, 4uLL, 1uLL, a3) != 1) {
      goto LABEL_46;
    }
    if (fread(&v5->_numIdentities, 4uLL, 1uLL, a3) != 1) {
      goto LABEL_46;
    }
    if (fread(&v5->_numVertices, 4uLL, 1uLL, a3) != 1) {
      goto LABEL_46;
    }
    if (*p_numBlendshapePlusOne != 51) {
      goto LABEL_46;
    }
    if (v5->_numComponents != 501) {
      goto LABEL_46;
    }
    if (v5->_numIdentities != 501) {
      goto LABEL_46;
    }
    v5->_numBlendshapePlusOne = 52;
    v7 = (int *)operator new[](0xD0uLL, MEMORY[0x1E4FBA2D0]);
    v5->_blendshapeComponentIndex = v7;
    if (!v7) {
      goto LABEL_46;
    }
    size_t v8 = fread(v7, 4uLL, 0x34uLL, a3);
    uint64_t v9 = *p_numBlendshapePlusOne;
    if (v8 != v9) {
      goto LABEL_46;
    }
    int v10 = 3 * v9 * v5->_numVertices;
    if (v10 < 0) {
      size_t v11 = -1;
    }
    else {
      size_t v11 = 4 * v10;
    }
    v12 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
    v13 = (float *)operator new[](v11, MEMORY[0x1E4FBA2D0]);
    v5->_meanBlendshape = v13;
    v14 = (float *)operator new[](v11, v12);
    v15 = v14;
    if (v13) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16)
    {
      if (!v14) {
        goto LABEL_46;
      }
    }
    else if (fread(v14, 4uLL, v10, a3) == v10)
    {
      vcp_matrix_transpose(v15, v5->_meanBlendshape, 3 * v5->_numVertices, v5->_numBlendshapePlusOne);
      size_t v18 = v5->_numComponents * (uint64_t)v5->_numIdentities;
      size_t v19 = (v18 & 0x80000000) != 0 ? -1 : 4 * v18;
      v20 = (float *)operator new[](v19, MEMORY[0x1E4FBA2D0]);
      v5->_tensorCoeff = v20;
      if (v20)
      {
        if (fread(v20, 4uLL, v18, a3) == v18)
        {
          int numComponents = v5->_numComponents;
          size_t v22 = 3 * v5->_numVertices * (uint64_t)numComponents;
          size_t v23 = (v22 & 0x80000000) != 0 ? -1 : 12 * v5->_numVertices * (uint64_t)numComponents;
          v24 = (float *)operator new[](v23, MEMORY[0x1E4FBA2D0]);
          v5->_componentsBlendshape = v24;
          if (v24)
          {
            if (fread(v24, 4uLL, v22, a3) == v22)
            {
              v25 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
              v26 = (float *)operator new[](0x7D4uLL, MEMORY[0x1E4FBA2D0]);
              v5->_transformedCoeff = v26;
              int numVertices = v5->_numVertices;
              if (numVertices < 0) {
                size_t v28 = -1;
              }
              else {
                size_t v28 = 12 * numVertices;
              }
              v29 = (float *)operator new[](v28, v25);
              v5->_blendShapeDelta = v29;
              if (v26) {
                BOOL v30 = v29 == 0;
              }
              else {
                BOOL v30 = 1;
              }
              char v31 = !v30;
              MEMORY[0x1C186C790](v15, 0x1000C8052888210);
              if (v31) {
                v32 = v5;
              }
              else {
                v32 = 0;
              }
              goto LABEL_47;
            }
          }
        }
      }
    }
    MEMORY[0x1C186C790](v15, 0x1000C8052888210);
LABEL_46:
    v32 = 0;
LABEL_47:
    v17 = v32;
    goto LABEL_48;
  }
  v17 = 0;
LABEL_48:

  return v17;
}

- (void)dealloc
{
  meanBlendshape = self->_meanBlendshape;
  if (meanBlendshape) {
    MEMORY[0x1C186C790](meanBlendshape, 0x1000C8052888210);
  }
  tensorCoeff = self->_tensorCoeff;
  if (tensorCoeff) {
    MEMORY[0x1C186C790](tensorCoeff, 0x1000C8052888210);
  }
  componentsBlendshape = self->_componentsBlendshape;
  if (componentsBlendshape) {
    MEMORY[0x1C186C790](componentsBlendshape, 0x1000C8052888210);
  }
  blendshapeComponentIndex = self->_blendshapeComponentIndex;
  if (blendshapeComponentIndex) {
    MEMORY[0x1C186C790](blendshapeComponentIndex, 0x1000C8052888210);
  }
  transformedCoeff = self->_transformedCoeff;
  if (transformedCoeff) {
    MEMORY[0x1C186C790](transformedCoeff, 0x1000C8052888210);
  }
  blendShapeDelta = self->_blendShapeDelta;
  if (blendShapeDelta) {
    MEMORY[0x1C186C790](blendShapeDelta, 0x1000C8052888210);
  }
  v9.receiver = self;
  v9.super_class = (Class)VCPFaceTensorModel;
  [(VCPFaceTensorModel *)&v9 dealloc];
}

- (void)calculateModelBlendshapes:(float *)a3 outputBlendshapes:(float *)a4
{
}

- (void)calculateMesh:(float *)a3 numVertices:(int)a4 blendshapes:(float *)a5 outputMesh:(float *)a6
{
  v6 = a6;
  v7 = a5;
  int v9 = 3 * a4;
  matrix_multiplication(a3, &a5[v9], a6, 1, self->_numBlendshapePlusOne - 1, v9);
  if (a4 >= 1)
  {
    if (v9 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v9;
    }
    do
    {
      float v11 = *v7++;
      float *v6 = v11 + *v6;
      ++v6;
      --v10;
    }
    while (v10);
  }
}

- (int)numVertices
{
  return self->_numVertices;
}

- (float)meanBlendshape
{
  return self->_meanBlendshape;
}

- (float)tensorCoeff
{
  return self->_tensorCoeff;
}

- (float)componentsBlendshape
{
  return self->_componentsBlendshape;
}

- (int)blendshapeComponentIndex
{
  return self->_blendshapeComponentIndex;
}

@end