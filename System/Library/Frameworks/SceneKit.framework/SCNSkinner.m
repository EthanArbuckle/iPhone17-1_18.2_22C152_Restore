@interface SCNSkinner
+ (BOOL)supportsSecureCoding;
+ (SCNSkinner)skinnerWithBaseGeometry:(SCNGeometry *)baseGeometry bones:(NSArray *)bones boneInverseBindTransforms:(NSArray *)boneInverseBindTransforms boneWeights:(SCNGeometrySource *)boneWeights boneIndices:(SCNGeometrySource *)boneIndices;
+ (SCNSkinner)skinnerWithSkinnerRef:(__C3DSkinner *)a3;
+ (__C3DSkinner)_createSkinnerWithBones:(id)a3 boneWeights:(id)a4 boneIndices:(id)a5 baseGeometry:(id)a6;
+ (__C3DSkinner)_createSkinnerWithCompressedData:(id)a3 bonesCount:(unint64_t)a4 vertexCount:(unint64_t)a5;
+ (id)_skinnerWithBaseGeometry:(id)a3 skinnableGeometry:(id)a4 bones:(id)a5 boneInverseBindTransforms:(id)a6 bindMatrix:(SCNMatrix4 *)a7;
- (BOOL)_bonesAndIndicesCompression;
- (BOOL)_setSkeleton:(id)a3;
- (NSArray)boneInverseBindTransforms;
- (NSArray)bones;
- (SCNGeometry)baseGeometry;
- (SCNGeometrySource)boneIndices;
- (SCNGeometrySource)boneWeights;
- (SCNMatrix4)baseGeometryBindTransform;
- (SCNNode)skeleton;
- (SCNSkinner)initWithCoder:(id)a3;
- (SCNSkinner)initWithSkinnerRef:(__C3DSkinner *)a3;
- (__C3DScene)sceneRef;
- (__C3DSkinner)skinnerRef;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)scene;
- (void)__CFObject;
- (void)_setBaseGeometry:(id)a3;
- (void)_syncObjCModel;
- (void)boneIndices;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBaseGeometry:(SCNGeometry *)baseGeometry;
- (void)setBaseGeometryBindTransform:(SCNMatrix4 *)baseGeometryBindTransform;
- (void)setBoneInverseBindTransforms:(id)a3;
- (void)setBones:(id)a3;
- (void)setSkeleton:(SCNNode *)skeleton;
- (void)set_bonesAndIndicesCompression:(BOOL)a3;
@end

@implementation SCNSkinner

- (SCNSkinner)initWithSkinnerRef:(__C3DSkinner *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNSkinner;
  v4 = [(SCNSkinner *)&v7 init];
  if (v4)
  {
    v5 = (__C3DSkinner *)CFRetain(a3);
    v4->_skinner = v5;
    if (v5) {
      C3DEntitySetObjCWrapper((uint64_t)v5, v4);
    }
    [(SCNSkinner *)v4 _syncObjCModel];
  }
  return v4;
}

+ (SCNSkinner)skinnerWithSkinnerRef:(__C3DSkinner *)a3
{
  result = (SCNSkinner *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
  {
    v6 = (void *)[objc_alloc((Class)a1) initWithSkinnerRef:a3];
    return (SCNSkinner *)v6;
  }
  return result;
}

- (void)dealloc
{
  skinner = self->_skinner;
  if (skinner)
  {
    C3DEntitySetObjCWrapper((uint64_t)skinner, 0);
    v4 = self->_skinner;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __21__SCNSkinner_dealloc__block_invoke;
    v6[3] = &__block_descriptor_40_e8_v16__0d8l;
    v6[4] = v4;
    +[SCNTransaction postCommandWithContext:0 object:0 applyBlock:v6];
  }
  objc_storeWeak((id *)&self->_skeleton, 0);

  v5.receiver = self;
  v5.super_class = (Class)SCNSkinner;
  [(SCNSkinner *)&v5 dealloc];
}

void __21__SCNSkinner_dealloc__block_invoke(uint64_t a1)
{
  C3DSkinnerSetJoints(*(void *)(a1 + 32), 0);
  C3DSkinnerSetSkeleton(*(void *)(a1 + 32), 0);
  v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  Copy = (const void *)C3DSkinnerCreateCopy((uint64_t)self->_skinner);
  objc_super v5 = [[SCNSkinner alloc] initWithSkinnerRef:Copy];
  CFRelease(Copy);
  [(SCNSkinner *)v5 _setSkeleton:[(SCNSkinner *)self skeleton]];
  [(SCNSkinner *)v5 _setBaseGeometry:self->_baseGeometry];
  [(SCNSkinner *)v5 set_bonesAndIndicesCompression:self->_bonesAndIndicesCompression];
  return v5;
}

- (id)copy
{
  return [(SCNSkinner *)self copyWithZone:0];
}

- (__C3DSkinner)skinnerRef
{
  return self->_skinner;
}

- (SCNNode)skeleton
{
  return (SCNNode *)objc_loadWeak((id *)&self->_skeleton);
}

- (BOOL)_setSkeleton:(id)a3
{
  p_skeleton = &self->_skeleton;
  id Weak = objc_loadWeak((id *)&self->_skeleton);
  if (Weak != a3) {
    objc_storeWeak((id *)p_skeleton, a3);
  }
  return Weak != a3;
}

- (void)_syncObjCModel
{
  uint64_t MTLVertexFormat = C3DMeshSourceGetMTLVertexFormat((uint64_t)self->_skinner);
  if (MTLVertexFormat)
  {
    v4 = +[SCNNode nodeWithNodeRef:MTLVertexFormat];
  }
  else
  {
    v4 = (SCNNode *)_commonAncessor_0([(SCNSkinner *)self bones]);
    if (!v4) {
      return;
    }
  }

  [(SCNSkinner *)self _setSkeleton:v4];
}

- (void)setSkeleton:(SCNNode *)skeleton
{
  objc_super v5 = [(SCNSkinner *)self skeleton];
  if ([(SCNSkinner *)self _setSkeleton:skeleton])
  {
    if (self->_skinner)
    {
      v6 = [(SCNSkinner *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __26__SCNSkinner_setSkeleton___block_invoke;
      v7[3] = &unk_264006138;
      v7[4] = self;
      v7[5] = skeleton;
      v7[6] = v5;
      +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
    }
  }
}

double __26__SCNSkinner_setSkeleton___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) skinnerRef];
  v3 = *(void **)(a1 + 40);
  if (!v3) {
    goto LABEL_11;
  }
  char v4 = C3DSkinnerSkeletonNeedsRetargeting(v2, [v3 nodeRef]);
  objc_super v5 = *(void **)(a1 + 40);
  if (v4)
  {
    if (!C3DSkinnerTransposeSkeleton(v2, (void *)[v5 nodeRef])
      && !C3DSkinnerTransposeSkeletonUsingNodeNames(v2, (void *)[*(id *)(a1 + 40) nodeRef]))
    {
      objc_super v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v8 = *(void *)(a1 + 48);
        int v12 = 138412546;
        uint64_t v13 = v8;
        __int16 v14 = 2112;
        uint64_t v15 = v9;
        _os_log_impl(&dword_20B249000, v7, OS_LOG_TYPE_DEFAULT, "Warning: Failed to transpose skeleton\nold skeleton: %@\nnew skeleton: %@", (uint8_t *)&v12, 0x16u);
      }
    }
    return result;
  }
  if (!v5)
  {
    C3DSkinnerSetJoints(v2, 0);
LABEL_11:
    uint64_t v11 = v2;
    v10 = 0;
    goto LABEL_12;
  }
  v10 = (void *)[v5 nodeRef];
  uint64_t v11 = v2;
LABEL_12:

  *(void *)&double result = C3DSkinnerSetSkeleton(v11, v10).n128_u64[0];
  return result;
}

- (BOOL)_bonesAndIndicesCompression
{
  return self->_bonesAndIndicesCompression;
}

- (void)set_bonesAndIndicesCompression:(BOOL)a3
{
  self->_bonesAndIndicesCompression = a3;
}

- (SCNGeometry)baseGeometry
{
  return self->_baseGeometry;
}

- (void)setBaseGeometry:(SCNGeometry *)baseGeometry
{
  v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[SCNSkinner setBaseGeometry:]();
  }
}

- (void)_setBaseGeometry:(id)a3
{
  if (a3)
  {
    baseGeometry = self->_baseGeometry;
    if (baseGeometry != a3)
    {

      self->_baseGeometry = (SCNGeometry *)a3;
    }
  }
}

+ (__C3DSkinner)_createSkinnerWithBones:(id)a3 boneWeights:(id)a4 boneIndices:(id)a5 baseGeometry:(id)a6
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v9 = [a3 count];
  __int16 v10 = v9;
  if (v9 < 2)
  {
    v19 = (size_t *)C3DSkinCreateWith(0, (__int16)v9, 0, (const void *)objc_msgSend(a6, "__CFObject"));
    C3DSkinSetMaxInfluencesPerVertex((uint64_t)v19, 1);
  }
  else
  {
    unint64_t v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a6, "geometrySourcesForSemantic:", @"kGeometrySourceSemanticVertex"), "firstObject"), "vectorCount");
    unint64_t v12 = objc_msgSend((id)objc_msgSend(a4, "data"), "length");
    unint64_t v13 = [a4 bytesPerComponent];
    unint64_t v14 = objc_msgSend((id)objc_msgSend(a5, "data"), "length");
    unint64_t v15 = [a5 bytesPerComponent];
    uint64_t v16 = [a5 vectorCount];
    if (v16 != [a4 vectorCount] || (unint64_t v17 = v12 / v11 / v13, v14 / v11 / v15 != v17))
    {
      v21 = scn_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[SCNSkinner _createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:].cold.5();
      }
      return 0;
    }
    if (![a4 floatComponents] || objc_msgSend(a4, "bytesPerComponent") != 4)
    {
      v23 = scn_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        +[SCNSkinner _createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:].cold.4();
      }
      return 0;
    }
    if ([a5 bytesPerComponent] >= 3)
    {
      v18 = scn_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[SCNSkinner _createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:]();
      }
      return 0;
    }
    uint64_t v24 = [a5 dataStride];
    uint64_t v25 = [a5 componentsPerVector];
    if (v24 != [a5 bytesPerComponent] * v25)
    {
      v41 = scn_default_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        +[SCNSkinner _createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:]();
      }
      return 0;
    }
    uint64_t v26 = [a4 dataStride];
    uint64_t v27 = [a4 componentsPerVector];
    if (v26 != [a4 bytesPerComponent] * v27)
    {
      v42 = scn_default_log();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        +[SCNSkinner _createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:]();
      }
      return 0;
    }
    uint64_t v28 = v17 * v11;
    v19 = (size_t *)C3DSkinCreateWith(v11, v10, v17 * v11, (const void *)objc_msgSend(a6, "__CFObject"));
    C3DSkinSetMaxInfluencesPerVertex((uint64_t)v19, v17);
    uint64_t v44 = 0;
    v45 = 0;
    uint64_t v43 = 0;
    C3DSkinGetVertexWeightsPointers(v19, &v45, &v44, &v43);
    v29 = v45;
    if (v45 && (v11 & 0x8000000000000000) == 0)
    {
      uint64_t v30 = 0;
      unint64_t v31 = v11 + 1;
      do
      {
        *v29++ = v30 * v17;
        ++v30;
        --v31;
      }
      while (v31);
    }
    uint64_t v32 = objc_msgSend((id)objc_msgSend(a5, "data"), "bytes");
    uint64_t v33 = objc_msgSend((id)objc_msgSend(a5, "data"), "bytes");
    uint64_t v34 = objc_msgSend((id)objc_msgSend(a4, "data"), "bytes");
    uint64_t v35 = [a5 bytesPerComponent];
    if (v28 >= 1)
    {
      uint64_t v36 = v35;
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (v36 == 1) {
          __int16 v38 = *(unsigned __int8 *)(v32 + i);
        }
        else {
          __int16 v38 = *(_WORD *)(v33 + 2 * i);
        }
        *(_WORD *)(v44 + 2 * i) = v38;
        if (v43) {
          *(_DWORD *)(v43 + 4 * i) = *(_DWORD *)(v34 + 4 * i);
        }
        if (v38 < 0)
        {
          v39 = scn_default_log();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            int v40 = *(__int16 *)(v44 + 2 * i);
            *(_DWORD *)buf = 67109120;
            int v47 = v40;
            _os_log_error_impl(&dword_20B249000, v39, OS_LOG_TYPE_ERROR, "Error: skinner: invalid index (%d)", buf, 8u);
          }
          *(_WORD *)(v44 + 2 * i) = -1;
        }
      }
    }
    C3DSkinPackWeightAndIndices(v19);
  }
  v20 = (__C3DSkinner *)C3DSkinnerCreateWithSkin(v19);
  CFRelease(v19);
  return v20;
}

+ (__C3DSkinner)_createSkinnerWithCompressedData:(id)a3 bonesCount:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  if ([a3 count] != 3)
  {
    if ([a3 count] != 1)
    {
      v18 = scn_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        +[SCNSkinner _createSkinnerWithCompressedData:bonesCount:vertexCount:](v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    unint64_t v11 = (void *)[a3 objectAtIndexedSubscript:0];
    uint64_t v12 = [v11 length];
    uint64_t v8 = 0;
    __int16 v10 = 0;
    int v17 = 1;
    goto LABEL_14;
  }
  uint64_t v8 = (void *)[a3 objectAtIndexedSubscript:0];
  if ([v8 length] == a5)
  {
    LOWORD(v9) = 1;
    __int16 v10 = (void *)[a3 objectAtIndexedSubscript:1];
    unint64_t v11 = (void *)[a3 objectAtIndexedSubscript:2];
    uint64_t v12 = [v11 length];
    if (!v8)
    {
      int v17 = 1;
      goto LABEL_15;
    }
    unint64_t v13 = (unsigned __int8 *)[v8 bytes];
    if (a5)
    {
      unint64_t v9 = 1;
      unint64_t v14 = a5;
      do
      {
        unsigned int v16 = *v13++;
        unint64_t v15 = v16;
        if (v9 <= v16) {
          unint64_t v9 = v15;
        }
        --v14;
      }
      while (v14);
      int v17 = 0;
LABEL_15:
      uint64_t v26 = (void *)C3DSkinCreateWith(a5, (__int16)a4, v12, 0);
      C3DSkinSetMaxInfluencesPerVertex((uint64_t)v26, v9);
      if (a4 < 2)
      {
LABEL_56:
        uint64_t v32 = (__C3DSkinner *)C3DSkinnerCreateWithSkin(v26);
        CFRelease(v26);
        return v32;
      }
      v58 = 0;
      v59 = 0;
      v57 = 0;
      C3DSkinGetVertexWeightsPointers(v26, &v59, &v58, &v57);
      if (v17)
      {
        if (a5)
        {
          uint64_t v27 = 0;
          uint64_t v28 = v59;
          unint64_t v29 = a5;
          do
          {
            if (v27 >= v12) {
              uint64_t v30 = v12 - 1;
            }
            else {
              uint64_t v30 = v27;
            }
            if (v27 < v12) {
              ++v27;
            }
            *v28++ = v30;
            --v29;
          }
          while (v29);
          goto LABEL_34;
        }
      }
      else
      {
        uint64_t v33 = (unsigned __int8 *)[v8 bytes];
        if (a5)
        {
          uint64_t v27 = 0;
          uint64_t v34 = v59;
          unint64_t v35 = a5;
          do
          {
            *v34++ = v27;
            unsigned int v36 = *v33++;
            v27 += v36;
            --v35;
          }
          while (v35);
          goto LABEL_34;
        }
      }
      uint64_t v27 = 0;
LABEL_34:
      v59[a5] = v27;
      v37 = (unsigned __int8 *)[v11 bytes];
      if (v10)
      {
        unint64_t v38 = [v10 length] / (unint64_t)v12;
        if (v38 == 2)
        {
          int v47 = (unsigned __int16 *)[v10 bytes];
          if (v12 >= 1)
          {
            v49 = v57;
            uint64_t v48 = v58;
            do
            {
              __int16 v50 = *v37++;
              *v48++ = v50;
              unsigned int v51 = *v47++;
              *v49++ = (float)v51 / 65535.0;
              --v12;
            }
            while (v12);
          }
        }
        else if (v38 == 1)
        {
          v39 = (unsigned __int8 *)[v10 bytes];
          if (v12 >= 1)
          {
            v41 = v57;
            int v40 = v58;
            do
            {
              __int16 v42 = *v37++;
              *v40++ = v42;
              unsigned int v43 = *v39++;
              *v41++ = (float)v43 / 255.0;
              --v12;
            }
            while (v12);
          }
        }
        else
        {
          v52 = scn_default_log();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
            +[SCNSkinner _createSkinnerWithCompressedData:bonesCount:vertexCount:]();
          }
          if (v12 >= 1)
          {
            v54 = v57;
            v53 = v58;
            do
            {
              __int16 v55 = *v37++;
              *v53++ = v55;
              *v54++ = 1.0;
              --v12;
            }
            while (v12);
          }
        }
      }
      else if (v12 >= 1)
      {
        v45 = v57;
        uint64_t v44 = v58;
        do
        {
          __int16 v46 = *v37++;
          *v44++ = v46;
          *v45++ = 1.0;
          --v12;
        }
        while (v12);
      }
      C3DSkinPackWeightAndIndices(v26);
      goto LABEL_56;
    }
    int v17 = 0;
LABEL_14:
    LOWORD(v9) = 1;
    goto LABEL_15;
  }
  unint64_t v31 = scn_default_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    +[SCNSkinner _createSkinnerWithCompressedData:bonesCount:vertexCount:]();
  }
  return 0;
}

+ (SCNSkinner)skinnerWithBaseGeometry:(SCNGeometry *)baseGeometry bones:(NSArray *)bones boneInverseBindTransforms:(NSArray *)boneInverseBindTransforms boneWeights:(SCNGeometrySource *)boneWeights boneIndices:(SCNGeometrySource *)boneIndices
{
  if (!bones || ![(NSArray *)bones count])
  {
    v18 = scn_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[SCNSkinner skinnerWithBaseGeometry:bones:boneInverseBindTransforms:boneWeights:boneIndices:]();
    }
    return 0;
  }
  if (!baseGeometry)
  {
    uint64_t v19 = scn_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[SCNSkinner skinnerWithBaseGeometry:bones:boneInverseBindTransforms:boneWeights:boneIndices:]();
    }
    return 0;
  }
  NSUInteger v13 = [(NSArray *)bones count];
  if (v13 != [(NSArray *)boneInverseBindTransforms count])
  {
    uint64_t v20 = scn_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[SCNSkinner skinnerWithBaseGeometry:bones:boneInverseBindTransforms:boneWeights:boneIndices:]();
    }
    return 0;
  }
  uint64_t v14 = [a1 _createSkinnerWithBones:bones boneWeights:boneWeights boneIndices:boneIndices baseGeometry:baseGeometry];
  if (!v14) {
    return 0;
  }
  unint64_t v15 = (const void *)v14;
  unsigned int v16 = (void *)[objc_alloc((Class)a1) initWithSkinnerRef:v14];
  CFRelease(v15);
  [v16 setBones:bones];
  [v16 setBoneInverseBindTransforms:boneInverseBindTransforms];
  [v16 _setBaseGeometry:baseGeometry];
  [v16 _setSkeleton:_commonAncessor_0(bones)];

  return (SCNSkinner *)v16;
}

+ (id)_skinnerWithBaseGeometry:(id)a3 skinnableGeometry:(id)a4 bones:(id)a5 boneInverseBindTransforms:(id)a6 bindMatrix:(SCNMatrix4 *)a7
{
  uint64_t Mesh = C3DGeometryGetMesh([a4 geometryRef]);
  id result = (id)C3DSkinCreateWithSkinnableMesh(Mesh, (__int16)[a5 count]);
  if (result)
  {
    id v14 = result;
    unint64_t v15 = (const void *)C3DSkinnerCreateWithSkin(result);
    CFRelease(v14);
    unsigned int v16 = (void *)[objc_alloc((Class)a1) initWithSkinnerRef:v15];
    CFRelease(v15);
    [v16 setBones:a5];
    [v16 setBoneInverseBindTransforms:a6];
    long long v17 = *(_OWORD *)&a7->m21;
    v19[0] = *(_OWORD *)&a7->m11;
    v19[1] = v17;
    long long v18 = *(_OWORD *)&a7->m41;
    v19[2] = *(_OWORD *)&a7->m31;
    v19[3] = v18;
    [v16 setBaseGeometryBindTransform:v19];
    [v16 _setBaseGeometry:a3];
    [v16 _setSkeleton:_commonAncessor_0(a5)];
    return v16;
  }
  return result;
}

- (SCNMatrix4)baseGeometryBindTransform
{
  *retstr = SCNMatrix4Identity;
  objc_super v5 = [(SCNSkinner *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    C3DSceneLock((uint64_t)v5);
  }
  id result = (SCNMatrix4 *)C3DGeometryGetOverrideMaterial((uint64_t)self->_skinner);
  if (result)
  {
    uint64_t DefaultShapeMatrix = C3DSkinGetDefaultShapeMatrix((uint64_t)result);
    C3DMatrix4x4ToSCNMatrix4(DefaultShapeMatrix, retstr);
  }
  if (v6)
  {
    return (SCNMatrix4 *)C3DSceneUnlock(v6);
  }
  return result;
}

- (void)setBaseGeometryBindTransform:(SCNMatrix4 *)baseGeometryBindTransform
{
  objc_super v5 = [(SCNSkinner *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    C3DSceneLock((uint64_t)v5);
  }
  uint64_t OverrideMaterial = C3DGeometryGetOverrideMaterial((uint64_t)self->_skinner);
  if (OverrideMaterial)
  {
    uint64_t v8 = OverrideMaterial;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    C3DMatrix4x4FromSCNMatrix4(&v10, (uint64_t)baseGeometryBindTransform);
    v9[0] = v10;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v13;
    C3DSkinSetDefaultShapeMatrix(v8, v9);
  }
  if (v6) {
    C3DSceneUnlock(v6);
  }
}

- (SCNGeometrySource)boneWeights
{
  v3 = [(SCNSkinner *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  if (C3DSkinnerHasOnlyOneJoint((uint64_t)self->_skinner))
  {
    objc_super v5 = 0;
    if (!v4) {
      return v5;
    }
    goto LABEL_27;
  }
  uint64_t v26 = v4;
  uint64_t OverrideMaterial = (void *)C3DGeometryGetOverrideMaterial((uint64_t)self->_skinner);
  uint64_t MTLVertexFormat = C3DMeshSourceGetMTLVertexFormat((uint64_t)OverrideMaterial);
  uint64_t MaxInfluencesPerVertex = (int)C3DSkinGetMaxInfluencesPerVertex((uint64_t)OverrideMaterial);
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  C3DSkinGetVertexWeightsPointers(OverrideMaterial, &v28, 0, &v29);
  unint64_t v9 = (float *)malloc_type_malloc(4 * MTLVertexFormat * MaxInfluencesPerVertex, 0xBF73991AuLL);
  if (MTLVertexFormat >= 1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    long long v13 = v28;
    uint64_t v27 = v29;
    uint64_t v14 = *v28;
    do
    {
      uint64_t v15 = v14;
      uint64_t v14 = v13[++v12];
      uint64_t v16 = v14 - v15;
      if (v14 - v15 >= MaxInfluencesPerVertex) {
        uint64_t v17 = MaxInfluencesPerVertex;
      }
      else {
        uint64_t v17 = v14 - v15;
      }
      if (v17 < 1)
      {
        uint64_t v17 = 0;
        float v19 = 0.0;
      }
      else
      {
        long long v18 = (float *)(v27 + 4 * v10);
        float v19 = 0.0;
        uint64_t v20 = v17;
        do
        {
          float v21 = *v18++;
          float v19 = v19 + v21;
          v9[v11++] = v21;
          --v20;
        }
        while (v20);
        v10 += v17;
      }
      if (MaxInfluencesPerVertex > v17)
      {
        bzero(&v9[v11], 4 * (MaxInfluencesPerVertex - v17));
        uint64_t v11 = v11 + MaxInfluencesPerVertex - v17;
      }
      if (v16 > MaxInfluencesPerVertex && v19 > 0.0 && (int)MaxInfluencesPerVertex >= 1)
      {
        uint64_t v23 = &v9[v11 - MaxInfluencesPerVertex];
        uint64_t v24 = MaxInfluencesPerVertex;
        do
        {
          float *v23 = *v23 / v19;
          ++v23;
          --v24;
        }
        while (v24);
      }
    }
    while (v12 != MTLVertexFormat);
  }
  objc_super v5 = +[SCNGeometrySource geometrySourceWithData:semantic:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:](SCNGeometrySource, "geometrySourceWithData:semantic:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:", [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v9 length:4 * MTLVertexFormat * MaxInfluencesPerVertex freeWhenDone:1], @"kGeometrySourceSemanticBoneWeights", MTLVertexFormat, 1, MaxInfluencesPerVertex, 4, 0, 0);
  uint64_t v4 = v26;
  if (v26) {
LABEL_27:
  }
    C3DSceneUnlock(v4);
  return v5;
}

- (SCNGeometrySource)boneIndices
{
  v3 = [(SCNSkinner *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  if (C3DSkinnerHasOnlyOneJoint((uint64_t)self->_skinner))
  {
    objc_super v5 = 0;
    if (!v4) {
      return v5;
    }
    goto LABEL_28;
  }
  uint64_t v40 = v4;
  uint64_t OverrideMaterial = (void *)C3DGeometryGetOverrideMaterial((uint64_t)self->_skinner);
  uint64_t MaxInfluencesPerVertex = (int)C3DSkinGetMaxInfluencesPerVertex((uint64_t)OverrideMaterial);
  uint64_t MTLVertexFormat = C3DMeshSourceGetMTLVertexFormat((uint64_t)OverrideMaterial);
  v41 = 0;
  uint64_t v42 = 0;
  uint64_t v39 = (uint64_t)OverrideMaterial;
  C3DSkinGetVertexWeightsPointers(OverrideMaterial, &v41, &v42, 0);
  unint64_t v9 = malloc_type_malloc(2 * MaxInfluencesPerVertex * MTLVertexFormat, 0x31752252uLL);
  if (MTLVertexFormat < 1)
  {
    uint64_t v11 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    long long v13 = v41;
    uint64_t v14 = v42;
    uint64_t v15 = *v41;
    do
    {
      uint64_t v16 = v15;
      uint64_t v15 = v13[++v12];
      uint64_t v17 = v15 - v16;
      if (v17 >= MaxInfluencesPerVertex) {
        uint64_t v18 = MaxInfluencesPerVertex;
      }
      else {
        uint64_t v18 = v17;
      }
      if (v18 < 1)
      {
        uint64_t v18 = 0;
      }
      else
      {
        float v19 = (__int16 *)(v14 + 2 * v10);
        uint64_t v20 = v18;
        do
        {
          __int16 v21 = *v19++;
          v9[v11++] = v21;
          --v20;
        }
        while (v20);
        v10 += v18;
      }
      if (MaxInfluencesPerVertex > v18)
      {
        bzero(&v9[v11], 2 * (MaxInfluencesPerVertex - v18));
        uint64_t v11 = v11 + MaxInfluencesPerVertex - v18;
      }
    }
    while (v12 != MTLVertexFormat);
  }
  if (v10 > C3DSkinGetWeightsCount(v39))
  {
    uint64_t v22 = scn_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      [(SCNSkinner *)v22 boneIndices];
    }
  }
  if (v11 != MTLVertexFormat * MaxInfluencesPerVertex)
  {
    uint64_t v30 = scn_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
      [(SCNSkinner *)v30 boneIndices];
    }
  }
  objc_super v5 = +[SCNGeometrySource _geometrySourceWithData:semantic:vectorCount:componentType:componentCount:dataOffset:dataStride:](SCNGeometrySource, "_geometrySourceWithData:semantic:vectorCount:componentType:componentCount:dataOffset:dataStride:", [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v9 length:2 * MTLVertexFormat * MaxInfluencesPerVertex freeWhenDone:1], @"kGeometrySourceSemanticBoneIndices", MTLVertexFormat, 14, MaxInfluencesPerVertex, 0, 0);
  uint64_t v4 = v40;
  if (v40) {
LABEL_28:
  }
    C3DSceneUnlock(v4);
  return v5;
}

- (NSArray)boneInverseBindTransforms
{
  v3 = [(SCNSkinner *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  uint64_t OverrideMaterial = C3DGeometryGetOverrideMaterial((uint64_t)self->_skinner);
  uint64_t v6 = (NSArray *)OverrideMaterial;
  if (OverrideMaterial)
  {
    LODWORD(v7) = C3DSkinGetJointsCount(OverrideMaterial);
    uint64_t InverseBindMatricesPtr = C3DSkinGetInverseBindMatricesPtr((uint64_t)v6);
    uint64_t v6 = (NSArray *)[MEMORY[0x263EFF980] arrayWithCapacity:(int)v7];
    if ((int)v7 >= 1)
    {
      uint64_t v7 = (unsigned __int16)v7;
      do
      {
        long long v13 = 0u;
        long long v14 = 0u;
        long long v11 = 0u;
        long long v12 = 0u;
        C3DMatrix4x4ToSCNMatrix4(InverseBindMatricesPtr, &v11);
        v10[0] = v11;
        v10[1] = v12;
        v10[2] = v13;
        v10[3] = v14;
        -[NSArray addObject:](v6, "addObject:", [MEMORY[0x263F08D40] valueWithSCNMatrix4:v10]);
        InverseBindMatricesPtr += 64;
        --v7;
      }
      while (v7);
    }
  }
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return v6;
}

- (void)setBoneInverseBindTransforms:(id)a3
{
  objc_super v5 = [(SCNSkinner *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5)
  {
    C3DSceneLock((uint64_t)v5);
    uint64_t OverrideMaterial = C3DGeometryGetOverrideMaterial((uint64_t)self->_skinner);
    if (!OverrideMaterial)
    {
LABEL_13:
      C3DSceneUnlock(v6);
      return;
    }
  }
  else
  {
    uint64_t OverrideMaterial = C3DGeometryGetOverrideMaterial((uint64_t)self->_skinner);
    if (!OverrideMaterial) {
      return;
    }
  }
  uint64_t JointsCount = (int)C3DSkinGetJointsCount(OverrideMaterial);
  if ([a3 count] == JointsCount)
  {
    uint64_t InverseBindMatricesPtr = C3DSkinGetInverseBindMatricesPtr(OverrideMaterial);
    if (JointsCount)
    {
      uint64_t v10 = (_OWORD *)InverseBindMatricesPtr;
      for (uint64_t i = 0; i != JointsCount; ++i)
      {
        long long v12 = objc_msgSend(a3, "objectAtIndex:", i, 0, 0, 0, 0, 0, 0, 0, 0);
        if (v12) {
          [v12 SCNMatrix4Value];
        }
        else {
          memset(v14, 0, sizeof(v14));
        }
        C3DMatrix4x4FromSCNMatrix4(v10, (uint64_t)v14);
        v10 += 4;
      }
    }
    C3DSkinInverseBindMatricesHaveChanged(OverrideMaterial);
    if (v6) {
      goto LABEL_13;
    }
  }
  else
  {
    long long v13 = scn_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(SCNSkinner *)JointsCount setBoneInverseBindTransforms:v13];
    }
  }
}

- (NSArray)bones
{
  v3 = [(SCNSkinner *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  objc_super v5 = (void *)[(id)C3DSkinnerGetJoints((uint64_t)self->_skinner) copy];
  uint64_t v6 = [v5 count];
  uint64_t v7 = (NSArray *)[MEMORY[0x263EFF980] arrayWithCapacity:v6];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
      -[NSArray addObject:](v7, "addObject:", +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", [v5 objectAtIndex:i]));
  }

  if (v4) {
    C3DSceneUnlock(v4);
  }
  return v7;
}

- (void)setBones:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v5, "addObject:", objc_msgSend(v10, "nodeRef"));
        [v10 setIsJoint:1];
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  long long v11 = [(SCNSkinner *)self sceneRef];
  if (v11)
  {
    uint64_t v12 = (uint64_t)v11;
    C3DSceneLock((uint64_t)v11);
    C3DSkinnerSetJoints((uint64_t)self->_skinner, v5);
    C3DSceneUnlock(v12);
  }
  else
  {
    C3DSkinnerSetJoints((uint64_t)self->_skinner, v5);
  }
}

- (void)__CFObject
{
  return self->_skinner;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNSkinner skeleton](self, "skeleton"), @"skeleton");
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNSkinner baseGeometry](self, "baseGeometry"), @"baseGeometry");
  if (self) {
    [(SCNSkinner *)self baseGeometryBindTransform];
  }
  else {
    memset(v39, 0, sizeof(v39));
  }
  SCNEncodeSCNMatrix4(a3, (const char *)@"baseGeometryBindTransform", (uint64_t)v39);
  objc_super v5 = [(SCNSkinner *)self bones];
  [a3 encodeObject:v5 forKey:@"bones"];
  if ([(NSArray *)v5 count] >= 2)
  {
    if (self->_bonesAndIndicesCompression)
    {
      uint64_t OverrideMaterial = (void *)C3DGeometryGetOverrideMaterial((uint64_t)self->_skinner);
      uint64_t MTLVertexFormat = C3DMeshSourceGetMTLVertexFormat((uint64_t)OverrideMaterial);
      uint64_t WeightsCount = C3DSkinGetWeightsCount((uint64_t)OverrideMaterial);
      int MaxInfluencesPerVertex = C3DSkinGetMaxInfluencesPerVertex((uint64_t)OverrideMaterial);
      uint64_t v37 = 0;
      unint64_t v38 = 0;
      uint64_t v36 = 0;
      C3DSkinGetVertexWeightsPointers(OverrideMaterial, &v37, &v36, &v38);
      uint64_t v10 = (void *)[MEMORY[0x263EFF990] dataWithLength:WeightsCount];
      uint64_t v11 = [v10 bytes];
      if (WeightsCount >= 1)
      {
        uint64_t v12 = v11;
        for (uint64_t i = 0; i != WeightsCount; ++i)
        {
          uint64_t v14 = v36;
          if (*(unsigned __int16 *)(v36 + 2 * i) >= 0x100u)
          {
            long long v15 = scn_default_log();
            BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
            uint64_t v14 = v36;
            if (v16)
            {
              int v17 = *(__int16 *)(v36 + 2 * i);
              *(_DWORD *)buf = 67109120;
              int v41 = v17;
              _os_log_error_impl(&dword_20B249000, v15, OS_LOG_TYPE_ERROR, "Error: Bones index too large for compressed representation : %d", buf, 8u);
              uint64_t v14 = v36;
            }
          }
          *(unsigned char *)(v12 + i) = *(_WORD *)(v14 + 2 * i);
        }
      }
      if (MaxInfluencesPerVertex <= 1)
      {
        uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObject:v10];
      }
      else
      {
        uint64_t v18 = (void *)[MEMORY[0x263EFF990] dataWithLength:MTLVertexFormat];
        uint64_t v19 = [v18 bytes];
        if (MTLVertexFormat >= 1)
        {
          for (uint64_t j = 0; j != MTLVertexFormat; ++j)
            *(unsigned char *)(v19 + j) = *(_DWORD *)(v37 + 8 * j + 8) - *(void *)(v37 + 8 * j);
        }
        __int16 v21 = (void *)[MEMORY[0x263EFF990] dataWithLength:2 * WeightsCount];
        uint64_t v22 = (_WORD *)[v21 bytes];
        if (WeightsCount >= 1)
        {
          uint64_t v23 = v38;
          do
          {
            float v24 = *v23++;
            int v25 = (int)rintf(v24 * 65535.0);
            if (v25 >= 0xFFFF) {
              int v25 = 0xFFFF;
            }
            *v22++ = v25 & ~(unsigned __int16)(v25 >> 31);
            --WeightsCount;
          }
          while (WeightsCount);
        }
        uint64_t v26 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v18, v21, v10, 0);
      }
      uint64_t v27 = (SCNGeometrySource *)v26;
      uint64_t v28 = @"compressedSkinData";
    }
    else
    {
      objc_msgSend(a3, "encodeObject:forKey:", -[SCNSkinner boneWeights](self, "boneWeights"), @"boneWeights");
      uint64_t v27 = [(SCNSkinner *)self boneIndices];
      uint64_t v28 = @"boneIndices";
    }
    [a3 encodeObject:v27 forKey:v28];
  }
  uint64_t v29 = [(SCNSkinner *)self boneInverseBindTransforms];
  uint64_t v30 = [(NSArray *)v29 count];
  if (v30)
  {
    uint64_t v31 = v30;
    for (uint64_t k = 0; k != v31; ++k)
    {
      uint64_t v33 = (const char *)objc_msgSend(NSString, "stringWithFormat:", @"baseGeometryBindTransform-%d", k);
      id v34 = [(NSArray *)v29 objectAtIndex:k];
      if (v34) {
        [v34 SCNMatrix4Value];
      }
      else {
        memset(v35, 0, sizeof(v35));
      }
      SCNEncodeSCNMatrix4(a3, v33, (uint64_t)v35);
    }
  }
}

- (SCNSkinner)initWithCoder:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)SCNSkinner;
  uint64_t v4 = [(SCNSkinner *)&v26 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"skeleton"];
    uint64_t v7 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"baseGeometry"];
    uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "geometrySourcesForSemantic:", @"kGeometrySourceSemanticVertex"), "firstObject"), "vectorCount");
    unint64_t v9 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"bones");
    uint64_t v10 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"compressedSkinData");
    if (v10)
    {
      v4->_bonesAndIndicesCompression = 1;
      uint64_t v11 = objc_msgSend((id)objc_opt_class(), "_createSkinnerWithCompressedData:bonesCount:vertexCount:", v10, objc_msgSend(v9, "count"), v8);
    }
    else
    {
      uint64_t v12 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"boneWeights"];
      uint64_t v13 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"boneIndices"];
      uint64_t v11 = [(id)objc_opt_class() _createSkinnerWithBones:v9 boneWeights:v12 boneIndices:v13 baseGeometry:v7];
    }
    v4->_skinner = (__C3DSkinner *)v11;
    if (v11)
    {
      uint64_t v14 = (void *)[MEMORY[0x263EFF980] array];
      uint64_t v15 = [v9 count];
      if (v15)
      {
        uint64_t v16 = v15;
        for (uint64_t i = 0; i != v16; ++i)
        {
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          SCNDecodeSCNMatrix4(a3, objc_msgSend(NSString, "stringWithFormat:", @"baseGeometryBindTransform-%d", i), &v22);
          v21[0] = v22;
          v21[1] = v23;
          v21[2] = v24;
          v21[3] = v25;
          objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNMatrix4:", v21));
        }
      }
      [(SCNSkinner *)v4 _setBaseGeometry:v7];
      [(SCNSkinner *)v4 setBones:v9];
      SCNDecodeSCNMatrix4(a3, @"baseGeometryBindTransform", v20);
      v19[0] = v20[0];
      v19[1] = v20[1];
      v19[2] = v20[2];
      v19[3] = v20[3];
      [(SCNSkinner *)v4 setBaseGeometryBindTransform:v19];
      [(SCNSkinner *)v4 setBoneInverseBindTransforms:v14];
      [(SCNSkinner *)v4 setSkeleton:v6];
      +[SCNTransaction setImmediateMode:v5];
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__C3DScene)sceneRef
{
  uint64_t v2 = [(SCNSkinner *)self __CFObject];

  return (__C3DScene *)C3DGetScene(v2);
}

- (id)scene
{
  id result = [(SCNSkinner *)self sceneRef];
  if (result)
  {
    return C3DEntityGetObjCWrapper((id *)result);
  }
  return result;
}

- (void)setBaseGeometry:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: SCNSkinner setBaseGeometry is deprecated on iOS10 and OS X 10.12 and has no effect", v2, v3, v4, v5, v6);
}

+ (void)_createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: SCNSkinner: bone indices must be uint8 or uint16 (maximum of 2 bytes)", v2, v3, v4, v5, v6);
}

+ (void)_createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: SCNSkinner: bone weights stride must be equal to componentsPerVector * bytesPerComponent", v2, v3, v4, v5, v6);
}

+ (void)_createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: SCNSkinner: bone indices stride must be equal to componentsPerVector * bytesPerComponent", v2, v3, v4, v5, v6);
}

+ (void)_createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:.cold.4()
{
  OUTLINED_FUNCTION_2();
}

+ (void)_createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: SCNSkinner: there must be the same number of bone weights and bone indices", v2, v3, v4, v5, v6);
}

+ (void)_createSkinnerWithCompressedData:bonesCount:vertexCount:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Unsupported bytes per weight", v2, v3, v4, v5, v6);
}

+ (void)_createSkinnerWithCompressedData:bonesCount:vertexCount:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: mismatch between the vertex count and the number of bones per vertex", v2, v3, v4, v5, v6);
}

+ (void)_createSkinnerWithCompressedData:(uint64_t)a3 bonesCount:(uint64_t)a4 vertexCount:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)skinnerWithBaseGeometry:bones:boneInverseBindTransforms:boneWeights:boneIndices:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: can't create a skinner with no bones", v2, v3, v4, v5, v6);
}

+ (void)skinnerWithBaseGeometry:bones:boneInverseBindTransforms:boneWeights:boneIndices:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: can't create a skinner with no base geometry", v2, v3, v4, v5, v6);
}

+ (void)skinnerWithBaseGeometry:bones:boneInverseBindTransforms:boneWeights:boneIndices:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: bones count and bind transform count don't match", v2, v3, v4, v5, v6);
}

- (void)boneIndices
{
}

- (void)setBoneInverseBindTransforms:(NSObject *)a3 .cold.1(__int16 a1, void *a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 67109376;
  v4[1] = a1;
  __int16 v5 = 1024;
  int v6 = [a2 count];
  _os_log_error_impl(&dword_20B249000, a3, OS_LOG_TYPE_ERROR, "Error: number of transforms (%d) doesn't match the number of joints (%d)", (uint8_t *)v4, 0xEu);
}

@end