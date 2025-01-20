@interface VCPFaceShapeModel
- (BOOL)fitOneImage:(float *)a3;
- (BOOL)isIdentityInit;
- (BOOL)optimizeProjectionMatrix:(int)a3 tracking:(BOOL)a4 firstPass:(BOOL)a5;
- (BOOL)trackFaceMesh:(float *)a3;
- (VCPFaceShapeModel)initWithMode:(int)a3;
- (__n64)getPose;
- (id)blendShapes;
- (int)detectionModeCounterShapeModel;
- (int)processingMode;
- (int)setCameraIntrinsics:(float)a3 uc:(float)a4 vc:(float)a5;
- (int)setupModel:(int)a3;
- (matrix<double,)getPoseParam;
- (uint64_t)meshVertices;
- (unint64_t)vertexCount;
- (void)calculateBlendshapeWeights:(float *)a3 prevWeights:(float *)a4 lmBlendshapes:(float *)a5 maxIter:(int)a6;
- (void)calculateIdentityCoefficients:(float *)a3 extrinsicMatrix:(float *)a4 pts2D:(float *)a5 exprWeights:(float *)a6 lm3DMeanBlendshapes:(float *)a7 lm3DComponents:(float *)a8 maxIter:(int)a9;
- (void)calculatePosePnpSolver:(int)a3;
- (void)dealloc;
- (void)getEulerAngle:(float *)a3;
- (void)getInternal3dLandmarksCoordinates:(const float *)a3 lm3dPos:(float *)a4;
- (void)getOneInternalLandmarkCoordinates:(const float *)a3 lmCoord:(const int *)a4 lmWeight:(const float *)a5 lm3dPos:(float *)a6;
- (void)moveBoundaryLandmarks:(const float *)a3 output:(float *)a4 isInput:(BOOL)a5;
- (void)project3Dto2D:(float *)a3 intrinsinc:(float *)a4 extrinsic:(float *)a5 numVert:(int)a6 out2dpts:(float *)a7;
- (void)projectAndUpdateBoundary;
- (void)reestimateProjectionMatrixPnP;
- (void)resetIdentityAndExpressions;
- (void)setDetectionModeCounterShapeModel:(int)a3;
- (void)setProcessingMode:(int)a3;
- (void)updateBoundary3dLandmarkBlendshapes:(const float *)a3 numBlendshapes:(int)a4 pts2D:(const float *)a5 lm2D:(const float *)a6 lmBlendshapes:(float *)a7;
- (void)updateBoundaryLandmarkCoordinates:(const float *)a3 pts2D:(const float *)a4 lm2D:(const float *)a5 lm3dPos:(float *)a6;
- (void)updateBoundaryLmForShapeOptimization;
- (void)updateFocalLengthInPixels:(float)a3;
- (void)updateIdentityShape:(float *)a3;
- (void)updateIntrinsic:(float)a3 vc:(float)a4;
- (void)updateMeshAndLm3dAfterExpressionChange;
- (void)updateMeshVertices;
- (void)updateShapeCoeff:(float *)a3 extrinsicMatrix:(float *)a4 pts2D:(float *)a5 exprWeights:(float *)a6 outputblendshapes:(float *)a7;
@end

@implementation VCPFaceShapeModel

- (VCPFaceShapeModel)initWithMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)VCPFaceShapeModel;
  v4 = [(VCPFaceShapeModel *)&v9 init];
  v5 = v4;
  if (v4 && [(VCPFaceShapeModel *)v4 setupModel:v3]) {
    v6 = 0;
  }
  else {
    v6 = v5;
  }
  v7 = v6;

  return v7;
}

- (BOOL)isIdentityInit
{
  if (self->_shapeUpdateInProgress && self->_processingMode != 1) {
    dispatch_group_wait((dispatch_group_t)self->_updateShapeGroup, 0xFFFFFFFFFFFFFFFFLL);
  }
  return self->_identityInit;
}

- (int)setCameraIntrinsics:(float)a3 uc:(float)a4 vc:(float)a5
{
  *(float *)&intrinsic_matrix = a3;
  *((float *)&intrinsic_matrix + 2) = a4;
  dword_1E9F94D28 = LODWORD(a3);
  dword_1E9F94D2C = LODWORD(a5);
  long long v6 = *(_OWORD *)&dword_1E9F94D28;
  *(_OWORD *)self->_intrinsicMatrix = intrinsic_matrix;
  *(_OWORD *)&self->_intrinsicMatrix[4] = v6;
  LODWORD(self->_intrinsicMatrix[8]) = dword_1E9F94D38;
  double v7 = self->_intrinsicMatrix[2];
  double v8 = self->_intrinsicMatrix[5];
  objc_super v9 = [VCPPnPSolver alloc];
  *(float *)&double v10 = self->_intrinsicMatrix[0];
  v11 = -[VCPPnPSolver initWithFocalLengthInPixels:principalPoint:cameraTowardsPositiveZ:](v9, "initWithFocalLengthInPixels:principalPoint:cameraTowardsPositiveZ:", 1, v10, v7, v8);
  poseSolver = self->_poseSolver;
  self->_poseSolver = v11;

  if (self->_poseSolver) {
    return 0;
  }
  else {
    return -108;
  }
}

- (void)updateIntrinsic:(float)a3 vc:(float)a4
{
  *((float *)&intrinsic_matrix + 2) = a3;
  dword_1E9F94D2C = LODWORD(a4);
  self->_intrinsicMatrix[2] = a3;
  self->_intrinsicMatrix[5] = a4;
  -[VCPPnPSolver updateIntrinsic:vc:](self->_poseSolver, "updateIntrinsic:vc:");
}

- (void)updateFocalLengthInPixels:(float)a3
{
  dword_1E9F94D28 = LODWORD(a3);
  *(float *)&intrinsic_matrix = a3;
  self->_intrinsicMatrix[4] = a3;
  self->_intrinsicMatrix[0] = a3;
  poseSolver = self->_poseSolver;
  if (poseSolver) {
    -[VCPPnPSolver updateFocalLengthInPixels:](poseSolver, "updateFocalLengthInPixels:");
  }
}

- (int)setupModel:(int)a3
{
  self->_processingMode = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  v5 = [v4 resourceURL];

  v78 = [MEMORY[0x1E4F1CB10] URLWithString:@"face_model_tensor.dat" relativeToURL:v5];
  id v6 = [v78 path];
  double v7 = fopen((const char *)[v6 UTF8String], "rb");

  double v8 = [MEMORY[0x1E4F1CB10] URLWithString:@"face_model_landmark_coordinates.dat" relativeToURL:v5];
  id v9 = [v8 path];
  double v10 = fopen((const char *)[v9 UTF8String], "rb");

  v11 = [MEMORY[0x1E4F1CB10] URLWithString:@"face_model_boundary.dat" relativeToURL:v5];
  id v12 = [v11 path];
  v13 = fopen((const char *)[v12 UTF8String], "rb");

  int v14 = -23;
  if (v7 && v10 && v13)
  {
    v15 = [[VCPFaceTensorModel alloc] initWithModelFile:v7];
    tensorModel = self->_tensorModel;
    self->_tensorModel = v15;

    v17 = self->_tensorModel;
    if (!v17)
    {
      int v14 = -108;
      goto LABEL_82;
    }
    self->_uint64_t numVertices = [(VCPFaceTensorModel *)v17 numVertices];
    self->_uint64_t numBoundaryLms = 11;
    self->_numInternalLms = 52;
    int __ptr = 0;
    if (fread(&__ptr, 4uLL, 1uLL, v10) != 1 || __ptr != self->_numInternalLms) {
      goto LABEL_80;
    }
    v77 = v8;
    size_t v18 = 3 * __ptr;
    if (__ptr < 0) {
      size_t v19 = -1;
    }
    else {
      size_t v19 = 12 * __ptr;
    }
    v20 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
    v21 = (int *)operator new[](v19, MEMORY[0x1E4FBA2D0]);
    self->_lmCoord = v21;
    v22 = (float *)operator new[](v19, v20);
    self->_lmWeight = v22;
    int v14 = -108;
    if (!v21) {
      goto LABEL_86;
    }
    double v8 = v77;
    if (!v22) {
      goto LABEL_82;
    }
    if (fread(v21, 4uLL, v18, v10) != v18 || fread(self->_lmWeight, 4uLL, v18, v10) != v18) {
      goto LABEL_80;
    }
    uint64_t numBoundaryLms = self->_numBoundaryLms;
    if ((int)numBoundaryLms < 0) {
      size_t v24 = -1;
    }
    else {
      size_t v24 = 4 * numBoundaryLms;
    }
    v25 = (int *)operator new[](v24, MEMORY[0x1E4FBA2D0]);
    self->_boundaryLmIndices = v25;
    if (!v25) {
      goto LABEL_82;
    }
    if (fread(&self->_numBoundaryVertices, 4uLL, 1uLL, v13) != 1) {
      goto LABEL_80;
    }
    unint64_t numBoundaryVertices = self->_numBoundaryVertices;
    if ((numBoundaryVertices & 0x80000000) != 0) {
      size_t v27 = -1;
    }
    else {
      size_t v27 = 4 * numBoundaryVertices;
    }
    v28 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
    v29 = (int *)operator new[](v27, MEMORY[0x1E4FBA2D0]);
    self->_boundaryVertices = v29;
    if (is_mul_ok(numBoundaryVertices, 0xCuLL)) {
      size_t v30 = 12 * numBoundaryVertices;
    }
    else {
      size_t v30 = -1;
    }
    v31 = ($18698D32E93F98CA3BC0140E41567ABB *)operator new[](v30, v28);
    self->_chPts = v31;
    v32 = (BOOL *)operator new[](numBoundaryVertices, v28);
    v33 = v29;
    self->_chPtSelected = v32;
    int v14 = -108;
    if (!v33) {
      goto LABEL_86;
    }
    double v8 = v77;
    if (!v31 || !v32) {
      goto LABEL_82;
    }
    size_t v34 = fread(v33, 4uLL, numBoundaryVertices, v13);
    uint64_t v35 = self->_numBoundaryVertices;
    if (v34 != v35) {
      goto LABEL_80;
    }
    size_t v36 = self->_numBoundaryLms * (uint64_t)(int)v35;
    v37 = (BOOL *)operator new[](v36, MEMORY[0x1E4FBA2D0]);
    self->_boundaryLandmarkValidity = v37;
    if (!v37) {
      goto LABEL_82;
    }
    if (fread(v37, 1uLL, v36, v13) != self->_numBoundaryVertices * (uint64_t)self->_numBoundaryLms)
    {
LABEL_80:
      int v14 = -19;
      goto LABEL_82;
    }
    self->_boundaryLmUpdated = 0;
    v38 = (float *)operator new[](0x7D4uLL, MEMORY[0x1E4FBA2D0]);
    v39 = v38;
    if (v38) {
      bzero(v38, 0x7D4uLL);
    }
    self->_curCoeff = v39;
    v40 = operator new[](0xCCuLL, MEMORY[0x1E4FBA2D0]);
    if (v40)
    {
      *(_OWORD *)((char *)v40 + 188) = 0u;
      v40[10] = 0u;
      v40[11] = 0u;
      v40[8] = 0u;
      v40[9] = 0u;
      v40[6] = 0u;
      v40[7] = 0u;
      v40[4] = 0u;
      v40[5] = 0u;
      v40[2] = 0u;
      v40[3] = 0u;
      _OWORD *v40 = 0u;
      v40[1] = 0u;
    }
    v75 = v40;
    v76 = v39;
    self->_curExprWeights = (float *)v40;
    v41 = operator new[](0xCCuLL, MEMORY[0x1E4FBA2D0]);
    v42 = v41;
    if (v41)
    {
      *(_OWORD *)((char *)v41 + 188) = 0u;
      v41[10] = 0u;
      v41[11] = 0u;
      v41[8] = 0u;
      v41[9] = 0u;
      v41[6] = 0u;
      v41[7] = 0u;
      v41[4] = 0u;
      v41[5] = 0u;
      v41[2] = 0u;
      v41[3] = 0u;
      _OWORD *v41 = 0u;
      v41[1] = 0u;
    }
    self->_prevExprWeights = (float *)v41;
    v43 = (float *)operator new[](0xF51E4uLL, MEMORY[0x1E4FBA2D0]);
    v44 = v43;
    if (v43) {
      bzero(v43, 0xF51E4uLL);
    }
    self->_exprWeightDiagMatrix = v44;
    v45 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
    v74 = (float *)operator new[](0x9990uLL, MEMORY[0x1E4FBA2D0]);
    self->_lm3dMeanBlendshapes = v74;
    uint64_t numVertices = self->_numVertices;
    if (1503 * (int)numVertices < 0) {
      size_t v47 = -1;
    }
    else {
      size_t v47 = 6012 * numVertices;
    }
    v73 = (float *)operator new[](v47, v45);
    self->_lm3dBlendshapeComponents = v73;
    v72 = (float *)operator new[](0x9990uLL, v45);
    self->_lm3dBlendshapes = v72;
    if ((int)numVertices < 0) {
      size_t v48 = -1;
    }
    else {
      size_t v48 = 12 * numVertices;
    }
    if ((int)numVertices < 0) {
      size_t v49 = -1;
    }
    else {
      size_t v49 = 8 * numVertices;
    }
    __dst = (float *)operator new[](v48, v45);
    self->_curMesh = __dst;
    v50 = (float *)operator new[](v49, v45);
    self->_cur2D = v50;
    if (156 * (int)numVertices < 0) {
      size_t v51 = -1;
    }
    else {
      size_t v51 = 624 * numVertices;
    }
    v52 = (float *)operator new[](v51, v45);
    self->_curBlendshapes = v52;
    int v14 = -108;
    if (!v76) {
      goto LABEL_86;
    }
    double v8 = v77;
    if (!v75 || !v42 || !v74 || !v73 || !v72 || !__dst || !v50 || !v52) {
      goto LABEL_82;
    }
    v53 = (float *)operator new[](0x7D4uLL, MEMORY[0x1E4FBA2D0]);
    v54 = v53;
    if (v53) {
      bzero(v53, 0x7D4uLL);
    }
    self->_transformedCoeff = v54;
    v55 = (float *)operator new[](0x2F4uLL, MEMORY[0x1E4FBA2D0]);
    if (v55)
    {
      v56 = v55;
      bzero(v55, 0x2F4uLL);
      self->_blendShapeDelta = v56;
      if (v54)
      {
        memcpy(__dst, [(VCPFaceTensorModel *)self->_tensorModel meanBlendshape], 12 * self->_numVertices);
        memcpy(self->_curBlendshapes, [(VCPFaceTensorModel *)self->_tensorModel meanBlendshape], 624 * self->_numVertices);
        int v57 = 156 * self->_numVertices;
        if (v57 < 0) {
          size_t v58 = -1;
        }
        else {
          size_t v58 = 4 * v57;
        }
        v59 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
        v60 = (float *)operator new[](v58, MEMORY[0x1E4FBA2D0]);
        self->_asyncBlendshapes = v60;
        v61 = (float *)operator new[](0x9990uLL, v59);
        self->_asyncLmBlendshapes = v61;
        int v14 = -108;
        if (v60)
        {
          double v8 = v77;
          if (v61)
          {
            v62 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mediaanalysisd.VCPFaceShapeUpdate", 0);
            updateShapeQueue = self->_updateShapeQueue;
            self->_updateShapeQueue = v62;

            v64 = (OS_dispatch_group *)dispatch_group_create();
            updateShapeGroup = self->_updateShapeGroup;
            self->_updateShapeGroup = v64;

            uint64_t v66 = 0;
            for (uint64_t i = 0; i != 156; i += 3)
            {
              [(VCPFaceShapeModel *)self getInternal3dLandmarksCoordinates:[(VCPFaceTensorModel *)self->_tensorModel meanBlendshape]+ 4 * (int)i * self->_numVertices lm3dPos:&self->_lm3dMeanBlendshapes[v66]];
              v66 += 189;
            }
            uint64_t v68 = 0;
            for (uint64_t j = 0; j != 1503; j += 3)
            {
              [(VCPFaceShapeModel *)self getInternal3dLandmarksCoordinates:[(VCPFaceTensorModel *)self->_tensorModel componentsBlendshape]+ 4 * (int)j * self->_numVertices lm3dPos:&self->_lm3dBlendshapeComponents[v68]];
              v68 += 189;
            }
            memcpy(self->_lm3dBlendshapes, self->_lm3dMeanBlendshapes, 0x9990uLL);
            memcpy(self->_LM3D, self->_lm3dMeanBlendshapes, 12 * self->_numInternalLms);
            self->_detectionModeCounterShapeModel = 0;
            self->_numFrmsSinceLastShapeUpdate = 41;
            self->_identityInit = 0;
            self->_shapeUpdateInProgress = 0;
            self->_eulerAngle[0] = 0.0;
            *(void *)&self->_eulerAngle[1] = 0;
            self->_vertexCount = 1220;
            operator new[]();
          }
          goto LABEL_82;
        }
LABEL_86:
        double v8 = v77;
        goto LABEL_82;
      }
    }
    else
    {
      self->_blendShapeDelta = 0;
    }
    int v14 = -108;
    goto LABEL_86;
  }
  if (!v7)
  {
    if (!v10) {
      goto LABEL_77;
    }
    goto LABEL_76;
  }
LABEL_82:
  fclose(v7);
  if (v10) {
LABEL_76:
  }
    fclose(v10);
LABEL_77:
  if (v13) {
    fclose(v13);
  }

  return v14;
}

- (void)dealloc
{
  lmCoord = self->_lmCoord;
  if (lmCoord) {
    MEMORY[0x1C186C790](lmCoord, 0x1000C8052888210);
  }
  lmWeight = self->_lmWeight;
  if (lmWeight) {
    MEMORY[0x1C186C790](lmWeight, 0x1000C8052888210);
  }
  boundaryLmIndices = self->_boundaryLmIndices;
  if (boundaryLmIndices) {
    MEMORY[0x1C186C790](boundaryLmIndices, 0x1000C8052888210);
  }
  boundaryVertices = self->_boundaryVertices;
  if (boundaryVertices) {
    MEMORY[0x1C186C790](boundaryVertices, 0x1000C8052888210);
  }
  chPts = self->_chPts;
  if (chPts) {
    MEMORY[0x1C186C790](chPts, 0x1000C803E1C8BA9);
  }
  chPtSelected = self->_chPtSelected;
  if (chPtSelected) {
    MEMORY[0x1C186C790](chPtSelected, 0x1000C8077774924);
  }
  boundaryLandmarkValidity = self->_boundaryLandmarkValidity;
  if (boundaryLandmarkValidity) {
    MEMORY[0x1C186C790](boundaryLandmarkValidity, 0x1000C8077774924);
  }
  curCoeff = self->_curCoeff;
  if (curCoeff) {
    MEMORY[0x1C186C790](curCoeff, 0x1000C8052888210);
  }
  curExprWeights = self->_curExprWeights;
  if (curExprWeights) {
    MEMORY[0x1C186C790](curExprWeights, 0x1000C8052888210);
  }
  prevExprWeights = self->_prevExprWeights;
  if (prevExprWeights) {
    MEMORY[0x1C186C790](prevExprWeights, 0x1000C8052888210);
  }
  exprWeightDiagMatrix = self->_exprWeightDiagMatrix;
  if (exprWeightDiagMatrix) {
    MEMORY[0x1C186C790](exprWeightDiagMatrix, 0x1000C8052888210);
  }
  lm3dMeanBlendshapes = self->_lm3dMeanBlendshapes;
  if (lm3dMeanBlendshapes) {
    MEMORY[0x1C186C790](lm3dMeanBlendshapes, 0x1000C8052888210);
  }
  lm3dBlendshapeComponents = self->_lm3dBlendshapeComponents;
  if (lm3dBlendshapeComponents) {
    MEMORY[0x1C186C790](lm3dBlendshapeComponents, 0x1000C8052888210);
  }
  lm3dBlendshapes = self->_lm3dBlendshapes;
  if (lm3dBlendshapes) {
    MEMORY[0x1C186C790](lm3dBlendshapes, 0x1000C8052888210);
  }
  curMesh = self->_curMesh;
  if (curMesh) {
    MEMORY[0x1C186C790](curMesh, 0x1000C8052888210);
  }
  cur2D = self->_cur2D;
  if (cur2D) {
    MEMORY[0x1C186C790](cur2D, 0x1000C8052888210);
  }
  curBlendshapes = self->_curBlendshapes;
  if (curBlendshapes) {
    MEMORY[0x1C186C790](curBlendshapes, 0x1000C8052888210);
  }
  transformedCoeff = self->_transformedCoeff;
  if (transformedCoeff) {
    MEMORY[0x1C186C790](transformedCoeff, 0x1000C8052888210);
  }
  blendShapeDelta = self->_blendShapeDelta;
  if (blendShapeDelta) {
    MEMORY[0x1C186C790](blendShapeDelta, 0x1000C8052888210);
  }
  asyncBlendshapes = self->_asyncBlendshapes;
  if (asyncBlendshapes) {
    MEMORY[0x1C186C790](asyncBlendshapes, 0x1000C8052888210);
  }
  asyncLmBlendshapes = self->_asyncLmBlendshapes;
  if (asyncLmBlendshapes) {
    MEMORY[0x1C186C790](asyncLmBlendshapes, 0x1000C8052888210);
  }
  uint64_t v24 = *(void *)self->_meshVertices;
  if (v24) {
    MEMORY[0x1C186C790](v24, 0x1000C80451B5BE8);
  }
  v25.receiver = self;
  v25.super_class = (Class)VCPFaceShapeModel;
  [(VCPFaceShapeModel *)&v25 dealloc];
}

- (void)getEulerAngle:(float *)a3
{
  uint64_t v3 = *(void *)self->_eulerAngle;
  a3[2] = self->_eulerAngle[2];
  *(void *)a3 = v3;
  float v4 = dbl_1BC281DB0[a3[2] < 0.0] + a3[2];
  a3[2] = v4;
}

- (void)project3Dto2D:(float *)a3 intrinsinc:(float *)a4 extrinsic:(float *)a5 numVert:(int)a6 out2dpts:(float *)a7
{
  LODWORD(v8) = a6;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  matrix_multiplication(a4, a5, __C, 3, 3, 4);
  if ((int)v8 >= 1)
  {
    uint64_t v8 = v8;
    do
    {
      uint64_t __B = *(void *)a3;
      int v16 = *((_DWORD *)a3 + 2);
      int v17 = 1065353216;
      matrix_multiplication(__C, (const float *)&__B, (float *)&v13, 3, 4, 1);
      double v10 = (const float *)&v14;
      float32x2_t v11 = vld1_dup_f32(v10);
      *(float32x2_t *)a7 = vdiv_f32(v13, v11);
      a7 += 2;
      a3 += 3;
      --v8;
    }
    while (v8);
  }
}

- (void)getOneInternalLandmarkCoordinates:(const float *)a3 lmCoord:(const int *)a4 lmWeight:(const float *)a5 lm3dPos:(float *)a6
{
  uint64_t v6 = 0;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = *(void *)a4;
  int v12 = a4[2];
  uint64_t v9 = *(void *)a5;
  int v10 = *((_DWORD *)a5 + 2);
  do
  {
    uint64_t v7 = 0;
    a6[v6] = 0.0;
    float v8 = 0.0;
    do
    {
      float v8 = v8 + (float)(a3[3 * *(_DWORD *)((char *)&v11 + v7) + (int)v6] * *(float *)((char *)&v9 + v7));
      a6[v6] = v8;
      v7 += 4;
    }
    while (v7 != 12);
    ++v6;
  }
  while (v6 != 3);
}

- (void)updateBoundaryLandmarkCoordinates:(const float *)a3 pts2D:(const float *)a4 lm2D:(const float *)a5 lm3dPos:(float *)a6
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (!self->_boundaryLmUpdated)
  {
    uint64_t v7 = (char *)v16 - ((12 * self->_numBoundaryVertices + 15) & 0x1FFFFFFFF0);
    uint64_t numBoundaryVertices = self->_numBoundaryVertices;
    if ((int)numBoundaryVertices >= 1)
    {
      uint64_t v9 = 0;
      boundaryVertices = self->_boundaryVertices;
      uint64_t v11 = v7 + 8;
      do
      {
        *((void *)v11 - 1) = *(void *)&a4[2 * boundaryVertices[v9]];
        _DWORD *v11 = v9;
        v11 += 3;
        ++v9;
      }
      while (numBoundaryVertices != v9);
    }
    getExtendedFaceHull(v7, numBoundaryVertices, (uint64_t)self->_chPts);
  }
  if (self->_numBoundaryLms >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      uint64_t v13 = &a6[3 * (int)v12 + 3 * self->_numInternalLms];
      uint64_t v14 = &a3[3 * self->_boundaryLmIndices[v12]];
      uint64_t v15 = *(void *)v14;
      v13[2] = v14[2];
      *(void *)uint64_t v13 = v15;
      ++v12;
    }
    while (v12 < self->_numBoundaryLms);
  }
}

- (void)getInternal3dLandmarksCoordinates:(const float *)a3 lm3dPos:(float *)a4
{
  if (self->_numInternalLms >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      [(VCPFaceShapeModel *)self getOneInternalLandmarkCoordinates:a3 lmCoord:&self->_lmCoord[v7] lmWeight:&self->_lmWeight[v7] lm3dPos:&a4[v7]];
      ++v8;
      v7 += 3;
    }
    while (v8 < self->_numInternalLms);
  }
}

- (void)updateBoundary3dLandmarkBlendshapes:(const float *)a3 numBlendshapes:(int)a4 pts2D:(const float *)a5 lm2D:(const float *)a6 lmBlendshapes:(float *)a7
{
  if (a4 >= 1)
  {
    uint64_t v20 = v12;
    uint64_t v21 = v11;
    uint64_t v22 = v10;
    uint64_t v23 = v9;
    uint64_t v24 = v8;
    uint64_t v25 = v7;
    uint64_t v26 = v13;
    uint64_t v27 = v14;
    int v17 = a4;
    do
    {
      -[VCPFaceShapeModel updateBoundaryLandmarkCoordinates:pts2D:lm2D:lm3dPos:](self, "updateBoundaryLandmarkCoordinates:pts2D:lm2D:lm3dPos:", a3, self->_cur2D, a6, a7, v20, v21, v22, v23, v24, v25, v26, v27);
      a3 += 3 * self->_numVertices;
      a7 += 189;
      --v17;
    }
    while (v17);
  }
}

- (void)moveBoundaryLandmarks:(const float *)a3 output:(float *)a4 isInput:(BOOL)a5
{
  BOOL v5 = a5;
  memcpy(a4, a3, 0x140uLL);
  uint64_t v9 = a4 + 80;
  if (v5)
  {
    long long v10 = *(_OWORD *)(a3 + 106);
    *(_OWORD *)uint64_t v9 = *(_OWORD *)(a3 + 102);
    *((_OWORD *)a4 + 21) = v10;
    long long v11 = *(_OWORD *)(a3 + 110);
    long long v12 = *(_OWORD *)(a3 + 114);
    long long v13 = *(_OWORD *)(a3 + 122);
    *((_OWORD *)a4 + 24) = *(_OWORD *)(a3 + 118);
    *((_OWORD *)a4 + 25) = v13;
    *((_OWORD *)a4 + 22) = v11;
    *((_OWORD *)a4 + 23) = v12;
    uint64_t v14 = &a4[2 * self->_numInternalLms];
    size_t v15 = 8 * self->_numBoundaryLms;
    memcpy(v14, a3 + 80, v15);
  }
  else
  {
    memcpy(v9, &a3[2 * self->_numInternalLms], 8 * self->_numBoundaryLms);
    long long v16 = *((_OWORD *)a3 + 21);
    *(_OWORD *)(a4 + 102) = *((_OWORD *)a3 + 20);
    *(_OWORD *)(a4 + 106) = v16;
    long long v17 = *((_OWORD *)a3 + 25);
    long long v19 = *((_OWORD *)a3 + 22);
    long long v18 = *((_OWORD *)a3 + 23);
    *(_OWORD *)(a4 + 118) = *((_OWORD *)a3 + 24);
    *(_OWORD *)(a4 + 122) = v17;
    *(_OWORD *)(a4 + 110) = v19;
    *(_OWORD *)(a4 + 114) = v18;
  }
}

- (void)projectAndUpdateBoundary
{
  [(VCPFaceShapeModel *)self project3Dto2D:self->_curMesh intrinsinc:self->_intrinsicMatrix extrinsic:self->_extrinsicMatrix numVert:self->_numVertices out2dpts:self->_cur2D];
  self->_boundaryLmUpdated = 0;
  curMesh = self->_curMesh;
  cur2D = self->_cur2D;
  [(VCPFaceShapeModel *)self updateBoundaryLandmarkCoordinates:curMesh pts2D:cur2D lm2D:self->_LM2D lm3dPos:self->_LM3D];
}

- (void)updateMeshAndLm3dAfterExpressionChange
{
  [(VCPFaceTensorModel *)self->_tensorModel calculateMesh:self->_curExprWeights numVertices:self->_numVertices blendshapes:self->_curBlendshapes outputMesh:self->_curMesh];
  tensorModel = self->_tensorModel;
  curExprWeights = self->_curExprWeights;
  lm3dBlendshapes = self->_lm3dBlendshapes;
  [(VCPFaceTensorModel *)tensorModel calculateMesh:curExprWeights numVertices:63 blendshapes:lm3dBlendshapes outputMesh:self->_LM3D];
}

- (void)resetIdentityAndExpressions
{
  bzero(self->_curCoeff, 0x7D4uLL);
  curExprWeights = self->_curExprWeights;
  *(_OWORD *)(curExprWeights + 47) = 0u;
  *((_OWORD *)curExprWeights + 10) = 0u;
  *((_OWORD *)curExprWeights + 11) = 0u;
  *((_OWORD *)curExprWeights + 8) = 0u;
  *((_OWORD *)curExprWeights + 9) = 0u;
  *((_OWORD *)curExprWeights + 6) = 0u;
  *((_OWORD *)curExprWeights + 7) = 0u;
  *((_OWORD *)curExprWeights + 4) = 0u;
  *((_OWORD *)curExprWeights + 5) = 0u;
  *((_OWORD *)curExprWeights + 2) = 0u;
  *((_OWORD *)curExprWeights + 3) = 0u;
  *(_OWORD *)curExprWeights = 0u;
  *((_OWORD *)curExprWeights + 1) = 0u;
  memcpy(self->_curMesh, [(VCPFaceTensorModel *)self->_tensorModel meanBlendshape], 12 * self->_numVertices);
  memcpy(self->_curBlendshapes, [(VCPFaceTensorModel *)self->_tensorModel meanBlendshape], 624 * self->_numVertices);
  memcpy(self->_lm3dBlendshapes, self->_lm3dMeanBlendshapes, 0x9990uLL);
  memcpy(self->_LM3D, self->_lm3dMeanBlendshapes, 12 * self->_numInternalLms);
  self->_identityInit = 0;
  self->_detectionModeCounterShapeModel = 0;
  self->_numFrmsSinceLastShapeUpdate = 41;
  self->_eulerAngle[0] = 0.0;
  *(void *)&self->_eulerAngle[1] = 0;
}

- (void)updateIdentityShape:(float *)a3
{
  if (fabsf(self->_eulerAngle[0]) <= 20.0
    && fabsf(self->_eulerAngle[1]) <= 20.0
    && self->_numFrmsSinceLastShapeUpdate >= 41
    && !self->_shapeUpdateInProgress)
  {
    [(VCPFaceShapeModel *)self updateBoundaryLmForShapeOptimization];
    memcpy(self->_asyncBlendshapes, self->_curBlendshapes, 624 * self->_numVertices);
    memcpy(self->_asyncLmBlendshapes, self->_lm3dBlendshapes, 0x9990uLL);
    *(_OWORD *)self->_asyncExtMat = *(_OWORD *)self->_extrinsicMatrix;
    long long v5 = *(_OWORD *)&self->_extrinsicMatrix[8];
    *(_OWORD *)&self->_asyncExtMat[4] = *(_OWORD *)&self->_extrinsicMatrix[4];
    *(_OWORD *)&self->_asyncExtMat[8] = v5;
    memcpy(self->_asyncLm2d, a3, sizeof(self->_asyncLm2d));
    curExprWeights = self->_curExprWeights;
    *(_OWORD *)self->_asyncWeights = *(_OWORD *)curExprWeights;
    long long v7 = *((_OWORD *)curExprWeights + 4);
    long long v9 = *((_OWORD *)curExprWeights + 1);
    long long v8 = *((_OWORD *)curExprWeights + 2);
    *(_OWORD *)&self->_asyncWeights[12] = *((_OWORD *)curExprWeights + 3);
    *(_OWORD *)&self->_asyncWeights[16] = v7;
    *(_OWORD *)&self->_asyncWeights[4] = v9;
    *(_OWORD *)&self->_asyncWeights[8] = v8;
    long long v10 = *((_OWORD *)curExprWeights + 8);
    long long v12 = *((_OWORD *)curExprWeights + 5);
    long long v11 = *((_OWORD *)curExprWeights + 6);
    *(_OWORD *)&self->_asyncWeights[28] = *((_OWORD *)curExprWeights + 7);
    *(_OWORD *)&self->_asyncWeights[32] = v10;
    *(_OWORD *)&self->_asyncWeights[20] = v12;
    *(_OWORD *)&self->_asyncWeights[24] = v11;
    long long v14 = *((_OWORD *)curExprWeights + 10);
    long long v13 = *((_OWORD *)curExprWeights + 11);
    long long v15 = *((_OWORD *)curExprWeights + 9);
    *(_OWORD *)&self->_asyncWeights[47] = *(_OWORD *)(curExprWeights + 47);
    *(_OWORD *)&self->_asyncWeights[40] = v14;
    *(_OWORD *)&self->_asyncWeights[44] = v13;
    *(_OWORD *)&self->_asyncWeights[36] = v15;
    if (self->_processingMode == 2)
    {
      -[VCPFaceShapeModel updateShapeCoeff:extrinsicMatrix:pts2D:exprWeights:outputblendshapes:](self, "updateShapeCoeff:extrinsicMatrix:pts2D:exprWeights:outputblendshapes:", self->_asyncLmBlendshapes, self->_asyncExtMat, self->_asyncLm2d);
      memcpy(self->_curBlendshapes, self->_asyncBlendshapes, 624 * self->_numVertices);
      memcpy(self->_lm3dBlendshapes, self->_asyncLmBlendshapes, 0x9990uLL);
    }
    else
    {
      updateShapeGroup = self->_updateShapeGroup;
      updateShapeQueue = self->_updateShapeQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__VCPFaceShapeModel_updateIdentityShape___block_invoke;
      block[3] = &unk_1E6296FF8;
      block[4] = self;
      dispatch_group_async(updateShapeGroup, updateShapeQueue, block);
    }
    self->_numFrmsSinceLastShapeUpdate = 0;
  }
}

void *__41__VCPFaceShapeModel_updateIdentityShape___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1636) = 1;
  [*(id *)(a1 + 32) updateShapeCoeff:*(void *)(*(void *)(a1 + 32) + 1672) extrinsicMatrix:*(void *)(a1 + 32) + 1680 pts2D:*(void *)(a1 + 32) + 1728 exprWeights:*(void *)(a1 + 32) + 2232 outputblendshapes:*(void *)(*(void *)(a1 + 32) + 1664)];
  memcpy(*(void **)(*(void *)(a1 + 32) + 128), *(const void **)(*(void *)(a1 + 32) + 1664), 624 * *(int *)(*(void *)(a1 + 32) + 16));
  result = memcpy(*(void **)(*(void *)(a1 + 32) + 1608), *(const void **)(*(void *)(a1 + 32) + 1672), 0x9990uLL);
  *(unsigned char *)(*(void *)(a1 + 32) + 1636) = 0;
  return result;
}

- (BOOL)trackFaceMesh:(float *)a3
{
  LM2D = self->_LM2D;
  [(VCPFaceShapeModel *)self moveBoundaryLandmarks:a3 output:self->_LM2D isInput:1];
  [(VCPFaceTensorModel *)self->_tensorModel calculateMesh:self->_curExprWeights numVertices:self->_numVertices blendshapes:self->_curBlendshapes outputMesh:self->_curMesh];
  [(VCPFaceShapeModel *)self projectAndUpdateBoundary];
  BOOL v6 = [(VCPFaceShapeModel *)self optimizeProjectionMatrix:2 tracking:1 firstPass:1];
  if (v6)
  {
    [(VCPFaceShapeModel *)self projectAndUpdateBoundary];
    [(VCPFaceShapeModel *)self optimizeProjectionMatrix:4 tracking:1 firstPass:0];
    [(VCPFaceShapeModel *)self project3Dto2D:self->_curMesh intrinsinc:self->_intrinsicMatrix extrinsic:self->_extrinsicMatrix numVert:self->_numVertices out2dpts:self->_cur2D];
    self->_boundaryLmUpdated = 0;
    [(VCPFaceShapeModel *)self updateBoundary3dLandmarkBlendshapes:self->_curBlendshapes numBlendshapes:52 pts2D:self->_cur2D lm2D:LM2D lmBlendshapes:self->_lm3dBlendshapes];
    [(VCPFaceShapeModel *)self calculateBlendshapeWeights:self->_curExprWeights prevWeights:self->_prevExprWeights lmBlendshapes:self->_lm3dBlendshapes maxIter:5];
    curExprWeights = self->_curExprWeights;
    prevExprWeights = self->_prevExprWeights;
    long long v9 = *((_OWORD *)curExprWeights + 4);
    long long v11 = *((_OWORD *)curExprWeights + 1);
    long long v10 = *((_OWORD *)curExprWeights + 2);
    *((_OWORD *)prevExprWeights + 3) = *((_OWORD *)curExprWeights + 3);
    *((_OWORD *)prevExprWeights + 4) = v9;
    *((_OWORD *)prevExprWeights + 1) = v11;
    *((_OWORD *)prevExprWeights + 2) = v10;
    long long v12 = *((_OWORD *)curExprWeights + 8);
    long long v14 = *((_OWORD *)curExprWeights + 5);
    long long v13 = *((_OWORD *)curExprWeights + 6);
    *((_OWORD *)prevExprWeights + 7) = *((_OWORD *)curExprWeights + 7);
    *((_OWORD *)prevExprWeights + 8) = v12;
    *((_OWORD *)prevExprWeights + 5) = v14;
    *((_OWORD *)prevExprWeights + 6) = v13;
    long long v16 = *((_OWORD *)curExprWeights + 10);
    long long v15 = *((_OWORD *)curExprWeights + 11);
    long long v17 = *((_OWORD *)curExprWeights + 9);
    *(_OWORD *)(prevExprWeights + 47) = *(_OWORD *)(curExprWeights + 47);
    *((_OWORD *)prevExprWeights + 10) = v16;
    *((_OWORD *)prevExprWeights + 11) = v15;
    *((_OWORD *)prevExprWeights + 9) = v17;
    *(_OWORD *)prevExprWeights = *(_OWORD *)curExprWeights;
    [(VCPFaceShapeModel *)self updateMeshAndLm3dAfterExpressionChange];
    [(VCPFaceShapeModel *)self projectAndUpdateBoundary];
    [(VCPFaceShapeModel *)self optimizeProjectionMatrix:1 tracking:1 firstPass:0];
    [(VCPFaceShapeModel *)self projectAndUpdateBoundary];
    [(VCPFaceShapeModel *)self project3Dto2D:self->_LM3D intrinsinc:self->_intrinsicMatrix extrinsic:self->_extrinsicMatrix numVert:63 out2dpts:LM2D];
    [(VCPFaceShapeModel *)self moveBoundaryLandmarks:LM2D output:a3 isInput:0];
    ++self->_numFrmsSinceLastShapeUpdate;
  }
  return v6;
}

- (void)updateShapeCoeff:(float *)a3 extrinsicMatrix:(float *)a4 pts2D:(float *)a5 exprWeights:(float *)a6 outputblendshapes:(float *)a7
{
  LODWORD(v10) = 5;
  [(VCPFaceShapeModel *)self calculateIdentityCoefficients:self->_curCoeff extrinsicMatrix:a4 pts2D:a5 exprWeights:a6 lm3DMeanBlendshapes:self->_lm3dMeanBlendshapes lm3DComponents:self->_lm3dBlendshapeComponents maxIter:v10];
  [(VCPFaceTensorModel *)self->_tensorModel calculateModelBlendshapes:self->_curCoeff outputBlendshapes:a7];
  CalculateBlendshapes(self->_curCoeff, self->_transformedCoeff, self->_blendShapeDelta, 63, 501, 52, [(VCPFaceTensorModel *)self->_tensorModel tensorCoeff], self->_lm3dMeanBlendshapes, self->_lm3dBlendshapeComponents, [(VCPFaceTensorModel *)self->_tensorModel blendshapeComponentIndex], a3);
  self->_identityInit = 1;
}

- (void)updateBoundaryLmForShapeOptimization
{
  [(VCPFaceShapeModel *)self updateBoundary3dLandmarkBlendshapes:[(VCPFaceTensorModel *)self->_tensorModel meanBlendshape] numBlendshapes:52 pts2D:self->_cur2D lm2D:self->_LM2D lmBlendshapes:self->_lm3dMeanBlendshapes];
  [(VCPFaceShapeModel *)self updateBoundary3dLandmarkBlendshapes:self->_curBlendshapes numBlendshapes:52 pts2D:self->_cur2D lm2D:self->_LM2D lmBlendshapes:self->_lm3dBlendshapes];
  uint64_t v3 = [(VCPFaceTensorModel *)self->_tensorModel componentsBlendshape];
  cur2D = self->_cur2D;
  lm3dBlendshapeComponents = self->_lm3dBlendshapeComponents;
  [(VCPFaceShapeModel *)self updateBoundary3dLandmarkBlendshapes:v3 numBlendshapes:501 pts2D:cur2D lm2D:self->_LM2D lmBlendshapes:lm3dBlendshapeComponents];
}

- (void)reestimateProjectionMatrixPnP
{
  [(VCPFaceShapeModel *)self calculatePosePnpSolver:self->_numInternalLms];
  [(VCPFaceShapeModel *)self projectAndUpdateBoundary];
  [(VCPFaceShapeModel *)self calculatePosePnpSolver:63];
}

- (BOOL)fitOneImage:(float *)a3
{
  ++self->_detectionModeCounterShapeModel;
  LM2D = self->_LM2D;
  [(VCPFaceShapeModel *)self moveBoundaryLandmarks:a3 output:self->_LM2D isInput:1];
  int detectionModeCounterShapeModel = self->_detectionModeCounterShapeModel;
  if (detectionModeCounterShapeModel > 3)
  {
    if (detectionModeCounterShapeModel != 4) {
      [(VCPFaceShapeModel *)self reestimateProjectionMatrixPnP];
    }
  }
  else if (!self->_identityInit)
  {
    [(VCPFaceShapeModel *)self reestimateProjectionMatrixPnP];
    [(VCPFaceShapeModel *)self projectAndUpdateBoundary];
    BOOL v6 = [(VCPFaceShapeModel *)self optimizeProjectionMatrix:2 tracking:0 firstPass:1];
    BOOL result = 0;
    if (!v6) {
      return result;
    }
    [(VCPFaceShapeModel *)self projectAndUpdateBoundary];
    BOOL v8 = [(VCPFaceShapeModel *)self optimizeProjectionMatrix:5 tracking:0 firstPass:0];
    BOOL result = 0;
    if (!v8) {
      return result;
    }
    return 1;
  }
  [(VCPFaceShapeModel *)self projectAndUpdateBoundary];
  BOOL v9 = [(VCPFaceShapeModel *)self optimizeProjectionMatrix:2 tracking:0 firstPass:0];
  BOOL result = 0;
  if (v9)
  {
    [(VCPFaceShapeModel *)self projectAndUpdateBoundary];
    BOOL v10 = [(VCPFaceShapeModel *)self optimizeProjectionMatrix:5 tracking:0 firstPass:0];
    BOOL result = 0;
    if (v10)
    {
      [(VCPFaceShapeModel *)self project3Dto2D:self->_curMesh intrinsinc:self->_intrinsicMatrix extrinsic:self->_extrinsicMatrix numVert:self->_numVertices out2dpts:self->_cur2D];
      self->_boundaryLmUpdated = 0;
      [(VCPFaceShapeModel *)self updateBoundary3dLandmarkBlendshapes:self->_curBlendshapes numBlendshapes:52 pts2D:self->_cur2D lm2D:LM2D lmBlendshapes:self->_lm3dBlendshapes];
      [(VCPFaceShapeModel *)self calculateBlendshapeWeights:self->_curExprWeights prevWeights:0 lmBlendshapes:self->_lm3dBlendshapes maxIter:15];
      curExprWeights = self->_curExprWeights;
      prevExprWeights = self->_prevExprWeights;
      long long v13 = *((_OWORD *)curExprWeights + 4);
      long long v15 = *((_OWORD *)curExprWeights + 1);
      long long v14 = *((_OWORD *)curExprWeights + 2);
      *((_OWORD *)prevExprWeights + 3) = *((_OWORD *)curExprWeights + 3);
      *((_OWORD *)prevExprWeights + 4) = v13;
      *((_OWORD *)prevExprWeights + 1) = v15;
      *((_OWORD *)prevExprWeights + 2) = v14;
      long long v16 = *((_OWORD *)curExprWeights + 8);
      long long v18 = *((_OWORD *)curExprWeights + 5);
      long long v17 = *((_OWORD *)curExprWeights + 6);
      *((_OWORD *)prevExprWeights + 7) = *((_OWORD *)curExprWeights + 7);
      *((_OWORD *)prevExprWeights + 8) = v16;
      *((_OWORD *)prevExprWeights + 5) = v18;
      *((_OWORD *)prevExprWeights + 6) = v17;
      long long v20 = *((_OWORD *)curExprWeights + 10);
      long long v19 = *((_OWORD *)curExprWeights + 11);
      long long v21 = *((_OWORD *)curExprWeights + 9);
      *(_OWORD *)(prevExprWeights + 47) = *(_OWORD *)(curExprWeights + 47);
      *((_OWORD *)prevExprWeights + 10) = v20;
      *((_OWORD *)prevExprWeights + 11) = v19;
      *((_OWORD *)prevExprWeights + 9) = v21;
      *(_OWORD *)prevExprWeights = *(_OWORD *)curExprWeights;
      [(VCPFaceShapeModel *)self updateMeshAndLm3dAfterExpressionChange];
      [(VCPFaceShapeModel *)self projectAndUpdateBoundary];
      [(VCPFaceShapeModel *)self optimizeProjectionMatrix:2 tracking:0 firstPass:0];
      [(VCPFaceShapeModel *)self project3Dto2D:self->_curMesh intrinsinc:self->_intrinsicMatrix extrinsic:self->_extrinsicMatrix numVert:self->_numVertices out2dpts:self->_cur2D];
      self->_boundaryLmUpdated = 0;
      if (!self->_identityInit) {
        [(VCPFaceShapeModel *)self updateIdentityShape:LM2D];
      }
      return 1;
    }
  }
  return result;
}

- (void)calculateBlendshapeWeights:(float *)a3 prevWeights:(float *)a4 lmBlendshapes:(float *)a5 maxIter:(int)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  matrix_multiplication(self->_intrinsicMatrix, self->_extrinsicMatrix, __C, 3, 3, 4);
  if (a4) {
    BOOL v10 = a4;
  }
  else {
    BOOL v10 = a3;
  }
  BOOL v11 = a4 != 0;
  long long v12 = operator new(0x38uLL);
  *long long v12 = &unk_1F159EF98;
  LM2D = self->_LM2D;
  v12[1] = LossFuncExpr;
  v12[2] = v10;
  v12[3] = a5;
  v12[4] = __C;
  v12[5] = LM2D;
  *((unsigned char *)v12 + 48) = v11;
  long long v17 = v12;
  long long v14 = operator new(0x38uLL);
  *long long v14 = &unk_1F159EE90;
  v14[1] = CloseFormDerivativeLossExpr;
  v14[2] = v10;
  v14[3] = a5;
  v14[4] = __C;
  v14[5] = LM2D;
  *((unsigned char *)v14 + 48) = v11;
  long long v16 = v14;
  long long v15 = &unk_1F159ED78;
  operator new[]();
}

- (void)calculateIdentityCoefficients:(float *)a3 extrinsicMatrix:(float *)a4 pts2D:(float *)a5 exprWeights:(float *)a6 lm3DMeanBlendshapes:(float *)a7 lm3DComponents:(float *)a8 maxIter:(int)a9
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  matrix_multiplication(self->_intrinsicMatrix, a4, __C, 3, 3, 4);
  bzero(self->_exprWeightDiagMatrix, 0xF51E4uLL);
  uint64_t v15 = 0;
  int v16 = 0;
  while (1)
  {
    if (v15) {
      float v17 = a6[(v15 - 1)];
    }
    else {
      float v17 = 1.0;
    }
    int v18 = [(VCPFaceTensorModel *)self->_tensorModel blendshapeComponentIndex][4 * v15];
    if (v18 >= 1)
    {
      uint64_t v19 = &self->_exprWeightDiagMatrix[502 * v16];
      v16 += v18;
      do
      {
        *uint64_t v19 = v17;
        v19 += 502;
        --v18;
      }
      while (v18);
    }
    if (++v15 == 52)
    {
      long long v20 = [(VCPFaceTensorModel *)self->_tensorModel tensorCoeff];
      long long v21 = [(VCPFaceTensorModel *)self->_tensorModel blendshapeComponentIndex];
      uint64_t v22 = operator new(0x60uLL);
      void *v22 = &unk_1F159EF40;
      v22[1] = LossFuncIdentity;
      v22[2] = a6;
      v22[3] = __C;
      v22[4] = a5;
      v22[5] = a3;
      *((_OWORD *)v22 + 3) = *(_OWORD *)&self->_transformedCoeff;
      v22[8] = v20;
      v22[9] = v21;
      v22[10] = a7;
      v22[11] = a8;
      uint64_t v23 = [(VCPFaceTensorModel *)self->_tensorModel tensorCoeff];
      uint64_t v24 = [(VCPFaceTensorModel *)self->_tensorModel blendshapeComponentIndex];
      long long v27 = *(_OWORD *)&self->_transformedCoeff;
      exprWeightDiagMatrix = self->_exprWeightDiagMatrix;
      uint64_t v26 = operator new(0x68uLL);
      *uint64_t v26 = &unk_1F159EE38;
      v26[1] = CloseFormDerivativeLossIdentity;
      v26[2] = a6;
      v26[3] = __C;
      v26[4] = a5;
      v26[5] = a3;
      *((_OWORD *)v26 + 3) = v27;
      v26[8] = v23;
      v26[9] = v24;
      v26[10] = a7;
      v26[11] = a8;
      v26[12] = exprWeightDiagMatrix;
      operator new[]();
    }
  }
}

- (matrix<double,)getPoseParam
{
  *(float64x2_t *)retstr->var0.var0 = vcvtq_f64_f32(*(float32x2_t *)((char *)&self[6].var0.var0[1] + 4));
  double v3 = *(float *)&self[5].var0.var0[3];
  retstr->var0.var0[2] = *((float *)&self[6].var0.var0[2] + 1);
  retstr->var0.var0[3] = v3;
  double v4 = *(float *)&self[6].var0.var0[1];
  retstr->var0.var0[4] = *(float *)&self[5].var0.var0[5];
  retstr->var0.var0[5] = v4;
  return self;
}

- (BOOL)optimizeProjectionMatrix:(int)a3 tracking:(BOOL)a4 firstPass:(BOOL)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(VCPFaceShapeModel *)self getPoseParam];
  BOOL v6 = operator new(0x20uLL);
  void *v6 = &unk_1F159EEE8;
  v6[1] = LossFuncProjectionMatrix;
  v6[2] = self->_LM2D;
  v6[3] = self->_LM3D;
  BOOL v9 = v6;
  dlib::matrix<double,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::matrix<dlib::matrix<double,6l,1l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>(v8);
}

- (void)calculatePosePnpSolver:(int)a3
{
  if (![(VCPPnPSolver *)self->_poseSolver estimateExtrinsicsWith:self->_LM2D andPoints3D:self->_LM3D andNumPoints:*(void *)&a3])
  {
    [(VCPPnPSolver *)self->_poseSolver pose];
    self->_extrinsicMatrix[0] = v4;
    [(VCPPnPSolver *)self->_poseSolver pose];
    self->_extrinsicMatrix[1] = v5;
    [(VCPPnPSolver *)self->_poseSolver pose];
    self->_extrinsicMatrix[2] = v6;
    [(VCPPnPSolver *)self->_poseSolver pose];
    self->_extrinsicMatrix[3] = v7;
    [(VCPPnPSolver *)self->_poseSolver pose];
    self->_extrinsicMatrix[4] = v8;
    [(VCPPnPSolver *)self->_poseSolver pose];
    self->_extrinsicMatrix[5] = v9;
    [(VCPPnPSolver *)self->_poseSolver pose];
    self->_extrinsicMatrix[6] = v10;
    [(VCPPnPSolver *)self->_poseSolver pose];
    self->_extrinsicMatrix[7] = v11;
    [(VCPPnPSolver *)self->_poseSolver pose];
    self->_extrinsicMatrix[8] = v12;
    [(VCPPnPSolver *)self->_poseSolver pose];
    self->_extrinsicMatrix[9] = v13;
    [(VCPPnPSolver *)self->_poseSolver pose];
    self->_extrinsicMatrix[10] = v14;
    [(VCPPnPSolver *)self->_poseSolver pose];
    self->_extrinsicMatrix[11] = v15;
    *(void *)self->_rotMatrix = *(void *)self->_extrinsicMatrix;
    self->_rotMatrix[2] = self->_extrinsicMatrix[2];
    *(void *)&self->_rotMatrix[3] = *(void *)&self->_extrinsicMatrix[4];
    self->_rotMatrix[5] = self->_extrinsicMatrix[6];
    *(void *)&self->_rotMatrix[6] = *(void *)&self->_extrinsicMatrix[8];
    self->_rotMatrix[8] = self->_extrinsicMatrix[10];
    GetEulerAngleFromMatrix(self->_rotMatrix, (float32x2_t *)self->_eulerAngle);
  }
}

- (__n64)getPose
{
  result.n64_u32[0] = *(_DWORD *)(a1 + 252);
  result.n64_u32[1] = *(_DWORD *)(a1 + 268);
  return result;
}

- (id)blendShapes
{
  if (self->_curExprWeights)
  {
    double v3 = [MEMORY[0x1E4F1CA60] dictionary];
    for (unint64_t i = 0; i != 51; ++i)
    {
      float v5 = VCPBlendShapeLocationFromIndex(i);
      if (v5)
      {
        *(float *)&double v6 = self->_curExprWeights[i];
        float v7 = [NSNumber numberWithFloat:v6];
        [v3 setObject:v7 forKeyedSubscript:v5];
      }
    }
  }
  else
  {
    double v3 = 0;
  }
  return v3;
}

- (void)updateMeshVertices
{
  uint64_t v2 = 0;
  uint64_t v3 = 0x3FFFFFFFFFFFF1B4;
  do
  {
    *(float *)(*(void *)self->_meshVertices + v2) = self->_curMesh[v3 + 3660] / 1000.0;
    *(float *)(*(void *)self->_meshVertices + v2 + 4) = self->_curMesh[v3 + 3661] / 1000.0;
    *(float *)(*(void *)self->_meshVertices + v2 + 8) = self->_curMesh[v3 + 3662] / 1000.0;
    v2 += 16;
    v3 += 3;
  }
  while (v3 * 4);
}

- (int)processingMode
{
  return self->_processingMode;
}

- (void)setProcessingMode:(int)a3
{
  self->_processingMode = a3;
}

- (uint64_t)meshVertices
{
  return *(void *)(a1 + 2448);
}

- (unint64_t)vertexCount
{
  return self->_vertexCount;
}

- (int)detectionModeCounterShapeModel
{
  return self->_detectionModeCounterShapeModel;
}

- (void)setDetectionModeCounterShapeModel:(int)a3
{
  self->_int detectionModeCounterShapeModel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateShapeQueue, 0);
  objc_storeStrong((id *)&self->_updateShapeGroup, 0);
  objc_storeStrong((id *)&self->_poseSolver, 0);
  objc_storeStrong((id *)&self->_tensorModel, 0);
}

@end