@interface REMeshModelDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)validateWithParts:(id)a3 payloadSize:(FixedInlineArray<unsigned)long error:(8UL> *)a4;
- (MeshModel)meshModelWithMeshModelContext:(SEL)a3 inverseBindPoseBuffers:(void *)a4 allocator:(const void *)a5;
- (NSArray)lods;
- (NSArray)partIndices;
- (NSString)name;
- (REMeshBlendShapeModelDescriptor)blendShapeModel;
- (REMeshModelDescriptor)initWithCoder:(id)a3;
- (REMeshModelDescriptor)initWithMeshAssetModel:(const void *)a3 inverseBindPoseAttributes:(id)a4 deformerBuilders:(void *)a5 payloadBuilder:(void *)a6 deformationModelData:(void *)a7;
- (REMeshModelDescriptor)initWithName:(REMeshModelDescriptor *)self partIndices:(SEL)a2 skeletonCount:(id)a3 skinningModel:(id)a4 blendShapeModel:(unsigned int)a5 lods:(id)a6 boundingBoxMin:(id)a7 boundingBoxMax:(id)a8;
- (REMeshModelDescriptor)initWithResourceDefinitionModel:(const void *)a3 inverseBindPoseAttributes:(id)a4 deformerBuilders:(void *)a5 payloadBuilder:(void *)a6 levels:(DynamicArray<re:(void *)a8 :MeshResourceDefinition::Level> *)a7 deformationModelData:;
- (REMeshSkinningModelDescriptor)skinningModel;
- (__n128)boundingBoxMax;
- (__n128)boundingBoxMin;
- (unint64_t)estimateContainerSize;
- (unsigned)skeletonCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMeshModelDescriptor

- (REMeshModelDescriptor)initWithMeshAssetModel:(const void *)a3 inverseBindPoseAttributes:(id)a4 deformerBuilders:(void *)a5 payloadBuilder:(void *)a6 deformationModelData:(void *)a7
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v39 = a4;
  id v41 = objc_alloc_init(MEMORY[0x263EFF980]);
  v38 = a7;
  id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v10 = *((void *)a3 + 26);
  if (v10)
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    uint64_t v13 = 80;
    v14 = (long long *)MEMORY[0x263EF89A8];
    while (1)
    {
      unint64_t v15 = *((void *)a3 + 26);
      if (v15 <= v12)
      {
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v51 = 0u;
        os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136315906;
        v44 = "operator[]";
        __int16 v45 = 1024;
        int v46 = 797;
        __int16 v47 = 2048;
        unint64_t v48 = v12;
        __int16 v49 = 2048;
        unint64_t v50 = v15;
        _os_log_send_and_compose_impl();
        _os_crash_msg();
        __break(1u);
      }
      uint64_t v16 = *((void *)a3 + 28);
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      if (v12 >= *((void *)a3 + 21))
      {
        long long v21 = v14[1];
        long long v51 = *v14;
        long long v52 = v21;
        long long v22 = v14[3];
        long long v53 = v14[2];
        long long v54 = v22;
      }
      else
      {
        v17 = (_OWORD *)(*((void *)a3 + 23) + v11);
        long long v18 = v17[6];
        long long v19 = v17[7];
        long long v20 = v17[8];
        long long v51 = v17[5];
        long long v52 = v18;
        long long v53 = v19;
        long long v54 = v20;
      }
      v23 = [[REMeshPartDescriptor alloc] initWithMeshAssetPart:v16 + v13 - 80 partTransform:&v51 payloadBuilder:a6];
      if (!v23) {
        break;
      }
      uint64_t v24 = [*(id *)a6 count];
      v25 = [NSNumber numberWithUnsignedInteger:v24];
      [v41 addObject:v25];

      [*(id *)a6 addObject:v23];
      ++v12;
      v13 += 256;
      v11 += 144;
      if (v10 == v12) {
        goto LABEL_9;
      }
    }
    v28 = (id)*re::assetTypesLogObjects(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v36 = *(const char **)(v16 + v13);
      *(_DWORD *)buf = 136315138;
      v44 = v36;
      _os_log_error_impl(&dword_233120000, v28, OS_LOG_TYPE_ERROR, "Failed to create REMeshPartDescriptor for part %s", buf, 0xCu);
    }

    v29 = 0;
  }
  else
  {
LABEL_9:
    if ([v39 count] && *((void *)a3 + 21)) {
      v26 = -[REMeshSkinningModelDescriptor initWithMeshSkinningData:meshParts:inverseBindPoseAttributes:deformerBuilders:payloadBuilder:]([REMeshSkinningModelDescriptor alloc], "initWithMeshSkinningData:meshParts:inverseBindPoseAttributes:deformerBuilders:payloadBuilder:", (char *)a3 + 152, *((void *)a3 + 28), *((void *)a3 + 26), v39, a5, a6);
    }
    else {
      v26 = 0;
    }
    if (*((void *)a3 + 16)) {
      v27 = [[REMeshBlendShapeModelDescriptor alloc] initWithMeshBlendShapeData:(char *)a3 + 112 meshPartCount:*((void *)a3 + 26) payloadBuilder:a6 deformationModelData:v38];
    }
    else {
      v27 = 0;
    }
    uint64_t v30 = *((void *)a3 + 36);
    if (v30)
    {
      uint64_t v31 = *((void *)a3 + 38);
      uint64_t v32 = 12 * v30;
      do
      {
        v33 = [[REMeshLevelOfDetailDescriptor alloc] initWithLodLevelInfo:v31];
        [v42 addObject:v33];

        v31 += 12;
        v32 -= 12;
      }
      while (v32);
    }
    v34 = [NSString stringWithUTF8String:*((void *)a3 + 1)];
    self = -[REMeshModelDescriptor initWithName:partIndices:skeletonCount:skinningModel:blendShapeModel:lods:boundingBoxMin:boundingBoxMax:](self, "initWithName:partIndices:skeletonCount:skinningModel:blendShapeModel:lods:boundingBoxMin:boundingBoxMax:", v34, v41, [v39 count], v26, v27, v42, *((double *)a3 + 2), *((double *)a3 + 4));

    v29 = self;
  }

  return v29;
}

- (REMeshModelDescriptor)initWithResourceDefinitionModel:(const void *)a3 inverseBindPoseAttributes:(id)a4 deformerBuilders:(void *)a5 payloadBuilder:(void *)a6 levels:(DynamicArray<re:(void *)a8 :MeshResourceDefinition::Level> *)a7 deformationModelData:
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v32 = a4;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v30 = a6;
  id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (*((void *)a3 + 2))
  {
    int v12 = 0;
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = *((void *)a3 + 4) + 40 * v13;
      uint64_t v15 = *(void *)(v14 + 16);
      if (v15)
      {
        uint64_t v16 = *(unsigned int **)(v14 + 32);
        uint64_t v17 = 4 * v15;
        do
        {
          long long v18 = [NSNumber numberWithInt:*v16];
          [v11 addObject:v18];

          ++v16;
          v17 -= 4;
        }
        while (v17);
        uint64_t v15 = *(void *)(v14 + 16);
      }
      int v35 = 0;
      uint64_t v34 = 0;
      unint64_t var2 = a7->var2;
      if (var2 <= v13)
      {
        uint64_t v36 = 0;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v45 = 0u;
        os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        int v37 = 136315906;
        v38 = "operator[]";
        __int16 v39 = 1024;
        int v40 = 789;
        __int16 v41 = 2048;
        unint64_t v42 = v13;
        __int16 v43 = 2048;
        unint64_t v44 = var2;
        _os_log_send_and_compose_impl();
        _os_crash_msg();
        __break(1u);
      }
      v12 += v15;
      uint64_t v34 = *((void *)a7->var4 + v13);
      int v35 = v12;
      long long v20 = [[REMeshLevelOfDetailDescriptor alloc] initWithLodLevelInfo:&v34];
      [v33 addObject:v20];

      ++v13;
    }
    while (v13 < *((void *)a3 + 2));
  }
  uint64_t v21 = *((void *)a3 + 16);
  long long v22 = 0;
  if ([v32 count] && v21) {
    long long v22 = [[REMeshSkinningModelDescriptor alloc] initWithSkinningData:(char *)a3 + 112 inverseBindPoseAttributes:v32 deformerBuilders:a5 payloadBuilder:v30];
  }
  if (*((void *)a3 + 21)) {
    v23 = -[REMeshBlendShapeModelDescriptor initWithBlendShapeData:meshPartCount:payloadBuilder:deformationModelData:]([REMeshBlendShapeModelDescriptor alloc], "initWithBlendShapeData:meshPartCount:payloadBuilder:deformationModelData:", (char *)a3 + 152, [v11 count], v30, a8);
  }
  else {
    v23 = 0;
  }
  if (*((void *)a3 + 6)) {
    uint64_t v24 = (char *)*((void *)a3 + 7);
  }
  else {
    uint64_t v24 = (char *)a3 + 49;
  }
  v25 = [NSString stringWithUTF8String:v24];
  v26 = -[REMeshModelDescriptor initWithName:partIndices:skeletonCount:skinningModel:blendShapeModel:lods:boundingBoxMin:boundingBoxMax:](self, "initWithName:partIndices:skeletonCount:skinningModel:blendShapeModel:lods:boundingBoxMin:boundingBoxMax:", v25, v11, [v32 count], v22, v23, v33, *((double *)a3 + 10), *((double *)a3 + 12));

  return v26;
}

- (MeshModel)meshModelWithMeshModelContext:(SEL)a3 inverseBindPoseBuffers:(void *)a4 allocator:(const void *)a5
{
  uint64_t v124 = *MEMORY[0x263EF8340];
  v6 = [(REMeshModelDescriptor *)self partIndices];
  long long v101 = 0uLL;
  v102 = 0;
  re::FixedArray<re::MeshPart>::init<>((uint64_t)&v101, (uint64_t)a6, [v6 count]);

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  v7 = [(REMeshModelDescriptor *)self partIndices];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v97 objects:v118 count:16];
  if (v8)
  {
    int v9 = 0;
    unint64_t v10 = *(void *)v98;
    do
    {
      uint64_t v11 = 0;
      int v76 = v9;
      uint64_t v12 = v9;
      uint64_t v13 = 560 * v9;
      do
      {
        if (*(void *)v98 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = objc_msgSend(*(id *)a4, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((void *)&v97 + 1) + 8 * v11), "unsignedIntegerValue"));
        uint64_t v15 = v14;
        uint64_t v16 = (_OWORD *)(v12 + v11);
        if (v14) {
          [v14 meshPartWithPayloadBuffer:(char *)a4 + 8 partIndexInModel:v12 + v11];
        }
        else {
          bzero(&v116, 0x230uLL);
        }
        uint64_t v17 = (_OWORD *)*((void *)&v101 + 1);
        if (*((void *)&v101 + 1) <= (unint64_t)v16)
        {
          *(void *)&long long v95 = 0;
          long long v108 = 0u;
          long long v109 = 0u;
          long long v107 = 0u;
          memset(v106, 0, sizeof(v106));
          uint64_t v22 = &_os_log_internal;
          os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          *(_DWORD *)v119 = 136315906;
          *(void *)&v119[4] = "operator[]";
          *(_WORD *)&v119[12] = 1024;
          *(_DWORD *)&v119[14] = 468;
          __int16 v120 = 2048;
          unint64_t v121 = v11 + v76;
          __int16 v122 = 2048;
          v123 = v17;
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
LABEL_61:
          *(void *)v119 = 0;
          memset(&v116, 0, 80);
          os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          LODWORD(v106[0]) = 136315906;
          *(void *)((char *)v16 + 4) = "operator[]";
          WORD6(v106[0]) = 1024;
          *(_DWORD *)((char *)v16 + 14) = 468;
          WORD1(v106[1]) = 2048;
          *(void *)((char *)v16 + 20) = v22 + (int)v10;
          WORD6(v106[1]) = 2048;
          *(void *)((char *)v16 + 30) = v15;
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
LABEL_62:
          uint64_t v103 = 0;
          long long v108 = 0u;
          long long v109 = 0u;
          long long v107 = 0u;
          memset(v106, 0, sizeof(v106));
          os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          *(_DWORD *)v119 = 136315906;
          *(void *)&v119[4] = "operator[]";
          *(_WORD *)&v119[12] = 1024;
          *(_DWORD *)&v119[14] = 468;
          __int16 v120 = 2048;
          unint64_t v121 = v10;
          __int16 v122 = 2048;
          v123 = v16;
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
        }
        re::MeshPart::operator=((uint64_t *)((char *)v102 + v13), (uint64_t *)&v116);
        re::StringID::destroyString((re::StringID *)&v116.var0[12].var0.var1.var0.var0.var0[16]);
        re::FixedArray<re::StringID>::deinit(&v116.var0[8].var0.var1.var0.var0.var0[8]);
        re::AttributeTable::~AttributeTable((re::AttributeTable *)&v116);

        ++v11;
        v13 += 560;
      }
      while (v8 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v97 objects:v118 count:16];
      int v9 = v12 + v11;
    }
    while (v8);
  }

  long long v18 = [(REMeshModelDescriptor *)self lods];
  long long v95 = 0uLL;
  v96 = 0;
  re::FixedArray<re::MeshLodLevelInfo>::init<>((uint64_t *)&v95, (uint64_t)a6, [v18 count]);

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v19 = [(REMeshModelDescriptor *)self lods];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v91 objects:v117 count:16];
  uint64_t v16 = v106;
  if (v20)
  {
    unint64_t v10 = 0;
    uint64_t v21 = *(void *)v92;
    do
    {
      uint64_t v22 = 0;
      uint64_t v23 = 12 * (int)v10;
      do
      {
        if (*(void *)v92 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = [*(id *)(*((void *)&v91 + 1) + 8 * v22) lodLevelInfo];
        uint64_t v15 = (void *)*((void *)&v95 + 1);
        if (*((void *)&v95 + 1) <= (unint64_t)((int)v10 + v22)) {
          goto LABEL_61;
        }
        v26 = &v96[v23];
        *(void *)v26 = v24;
        *((_DWORD *)v26 + 2) = v25;
        ++v22;
        v23 += 12;
      }
      while (v20 != v22);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v91 objects:v117 count:16];
      unint64_t v10 = (int)v10 + v22;
    }
    while (v20);
  }

  for (uint64_t i = 0; i != 720; i += 40)
  {
    v28 = (DeformationModelData *)((char *)&v116 + i);
    v28->var0[0].var0.var0 = 0;
    v28->var0[0].var0.var1.var0.var1 = 0;
  }
  v29 = [(REMeshModelDescriptor *)self skinningModel];
  BOOL v30 = v29 == 0;

  if (!v30)
  {
    DWORD2(v107) = 1;
    *(void *)&long long v109 = 0;
    long long v108 = 0uLL;
    DWORD2(v109) = 0;
    v110[1] = 0;
    v110[0] = 0;
    int v111 = 1;
    uint64_t v114 = 0;
    uint64_t v112 = 0;
    uint64_t v113 = 0;
    int v115 = 0;
    *(void *)&long long v107 = 0;
    *(void *)&v106[0] = a6;
    *((void *)&v106[1] + 1) = 0;
    *(_OWORD *)((char *)v106 + 8) = *(_OWORD *)a5;
    re::BucketArray<re::SkinningModelBuilder::RawSkinnedMeshPartData,4ul>::init((uint64_t)&v106[1] + 8, (uint64_t)a6, 1uLL);
    re::BucketArray<re::SkinningModelBuilder::PreparedSkinnedMeshPartData,4ul>::init((uint64_t)v110, (uint64_t)a6, 1uLL);
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    uint64_t v31 = [(REMeshModelDescriptor *)self skinningModel];
    id v32 = [v31 skinningParts];

    uint64_t v33 = [v32 countByEnumeratingWithState:&v87 objects:v105 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v88 != v34) {
            objc_enumerationMutation(v32);
          }
          [*(id *)(*((void *)&v87 + 1) + 8 * j) addToSkinningModelBuilder:v106 payloadBuffers:(char *)a4 + 8];
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v87 objects:v105 count:16];
      }
      while (v33);
    }

    *(void *)v119 = 0;
    re::SkinningModelBuilder::buildDeformationModel((re::SkinningModelBuilder *)v106, (id *)v119, &v116);

    re::BucketArray<re::SkinningModelBuilder::PreparedSkinnedMeshPartData,4ul>::~BucketArray((uint64_t)v110);
    re::BucketArray<re::SkinningModelBuilder::RawSkinnedMeshPartData,4ul>::~BucketArray((uint64_t)&v106[1] + 8);
  }
  uint64_t v36 = [(REMeshModelDescriptor *)self blendShapeModel];
  BOOL v37 = v36 == 0;

  v38 = self;
  if (!v37)
  {
    uint64_t v84 = 0;
    v85 = 0;
    uint64_t v86 = 0;
    __int16 v39 = [(REMeshModelDescriptor *)self blendShapeModel];
    int v40 = [v39 perMeshPartBlendShapeBufferIndex];
    re::FixedArray<int>::init<>(&v84, (uint64_t)a6, [v40 count]);

    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    __int16 v41 = [(REMeshModelDescriptor *)self blendShapeModel];
    unint64_t v42 = [v41 perMeshPartBlendShapeBufferIndex];

    uint64_t v43 = [v42 countByEnumeratingWithState:&v80 objects:v104 count:16];
    if (v43)
    {
      unint64_t v10 = 0;
      uint64_t v44 = *(void *)v81;
      do
      {
        for (uint64_t k = 0; k != v43; ++k)
        {
          if (*(void *)v81 != v44) {
            objc_enumerationMutation(v42);
          }
          int v46 = [*(id *)(*((void *)&v80 + 1) + 8 * k) unsignedIntValue];
          uint64_t v16 = v85;
          if ((unint64_t)v85 <= v10) {
            goto LABEL_62;
          }
          *(_DWORD *)(v86 + 4 * v10++) = v46;
        }
        uint64_t v43 = [v42 countByEnumeratingWithState:&v80 objects:v104 count:16];
      }
      while (v43);
    }

    long long v47 = [(REMeshModelDescriptor *)self blendShapeModel];
    BOOL v48 = [v47 blendShapeIndexType] != 0;

    *(void *)v119 = 0;
    long long v49 = [(REMeshModelDescriptor *)self blendShapeModel];
    uint64_t v50 = [v49 blendShapeBuffers];
    re::BlendShapeModelBuilder::BlendShapeModelBuilder(v106, (uint64_t)a6, (id *)v119, [v50 count], v48, (uint64_t)&v84, (uint64_t *)&v116);

    long long v51 = [(REMeshModelDescriptor *)self blendShapeModel];
    long long v52 = [v51 blendShapeBuffers];
    uint64_t v53 = [v52 count];

    if (v53)
    {
      for (uint64_t m = 0; m != v53; ++m)
      {
        long long v55 = [(REMeshModelDescriptor *)self blendShapeModel];
        uint64_t v56 = [v55 blendShapeBuffers];
        v57 = [v56 objectAtIndexedSubscript:m];

        v58 = [(REMeshModelDescriptor *)self blendShapeModel];
        v59 = [v58 blendShapeGroupNames];
        v60 = [v59 objectAtIndexedSubscript:m];

        if (v60)
        {
          v61 = (_anonymous_namespace_ *)[v60 UTF8String];
          *(void *)v119 = 0;
          *(void *)&v119[8] = "";
        }
        else
        {
          re::StringID::invalid((re::StringID *)v119);
        }
        [v57 addToBlendShapeModelBuilder:v106 blendShapeIndex:m blendShapeGroupName:v119 payloadBuffers:(char *)a4 + 8];
        re::StringID::destroyString((re::StringID *)v119);
      }
    }

    if (v84 && v85) {
      (*(void (**)(void))(*(void *)v84 + 40))();
    }
    v38 = self;
  }
  id v62 = [(REMeshModelDescriptor *)v38 name];
  v63 = (_anonymous_namespace_ *)[v62 UTF8String];
  *(void *)&retstr->var0.var0 = 0;
  retstr->var0.var1 = "";
  [(REMeshModelDescriptor *)self boundingBoxMin];
  long long v79 = v64;
  [(REMeshModelDescriptor *)self boundingBoxMax];
  uint64_t v65 = 0;
  *(_OWORD *)&retstr->var1.var0.var0.var0.var0 = v79;
  *(_OWORD *)&retstr->var1.var1.var0.var1[1] = v66;
  *(_OWORD *)&retstr->var2.var1 = v101;
  v67 = v102;
  v102 = 0;
  long long v101 = 0uLL;
  retstr->var3.var0 = v67;
  *(_OWORD *)&retstr->var3.var1 = v95;
  v68 = v96;
  *((void *)&v95 + 1) = 0;
  v96 = 0;
  retstr->var4.var0[0].var0.var0 = v68;
  *(void *)&long long v95 = 0;
  do
  {
    var0 = v116.var0[v65].var0.var0;
    v116.var0[v65].var0.var0 = 0;
    *(void *)retstr->var4.var0[v65].var0.var1.var0.var0.var0 = var0;
    std::__function::__value_func<void ()(void *)>::__value_func[abi:nn180100]((uint64_t)&retstr->var4.var0[v65].var0.var1.var0.var0.var0[8], (uint64_t)&v116.var0[v65].var0.var1);
    ++v65;
  }
  while (v65 != 18);

  for (uint64_t n = 680; n != -40; n -= 40)
    std::unique_ptr<void,std::function<void ()(void *)>>::~unique_ptr[abi:nn180100]((uint64_t *)((char *)&v116 + n));
  if ((void)v95) {
    BOOL v71 = *((void *)&v95 + 1) == 0;
  }
  else {
    BOOL v71 = 1;
  }
  if (!v71) {
    (*(void (**)(void))(*(void *)v95 + 40))();
  }
  return (MeshModel *)re::FixedArray<re::MeshPart>::deinit(&v101);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMeshModelDescriptor)initWithName:(REMeshModelDescriptor *)self partIndices:(SEL)a2 skeletonCount:(id)a3 skinningModel:(id)a4 blendShapeModel:(unsigned int)a5 lods:(id)a6 boundingBoxMin:(id)a7 boundingBoxMax:(id)a8
{
  long long v29 = v8;
  long long v30 = v9;
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v31.receiver = self;
  v31.super_class = (Class)REMeshModelDescriptor;
  uint64_t v21 = [(REMeshModelDescriptor *)&v31 init];
  if (v21)
  {
    uint64_t v22 = [v16 copy];
    name = v21->_name;
    v21->_name = (NSString *)v22;

    uint64_t v24 = [v17 copy];
    partIndices = v21->_partIndices;
    v21->_partIndices = (NSArray *)v24;

    v21->_skeletonCount = a5;
    objc_storeStrong((id *)&v21->_skinningModel, a6);
    objc_storeStrong((id *)&v21->_blendShapeModel, a7);
    uint64_t v26 = [v20 copy];
    lods = v21->_lods;
    v21->_lods = (NSArray *)v26;

    *(_OWORD *)v21->_boundingBoxMiuint64_t n = v29;
    *(_OWORD *)v21->_boundingBoxMax = v30;
  }

  return v21;
}

- (REMeshModelDescriptor)initWithCoder:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = self->_name;
  self->_name = v5;

  v7 = self->_name;
  long long v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  unint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"partIndices"];
  partIndices = self->_partIndices;
  self->_partIndices = v11;

  unint64_t v13 = [v4 decodeIntegerForKey:@"skeletonCount"];
  char v14 = HIDWORD(v13) != 0;
  self->_skeletonCount = v13;
  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"skinningModel"];
  skinningModel = self->_skinningModel;
  self->_skinningModel = v15;

  id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blendShapeModel"];
  blendShapeModel = self->_blendShapeModel;
  self->_blendShapeModel = v17;

  id v19 = (void *)MEMORY[0x263EFFA08];
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"lods"];
  lods = self->_lods;
  self->_lods = v22;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v24 = self->_partIndices;
  uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(v24);
        }
        v14 |= (unint64_t)[*(id *)(*((void *)&v39 + 1) + 8 * i) unsignedIntegerValue] >> 32 != 0;
      }
      uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v25);
  }

  *(void *)self->_boundingBoxMiuint64_t n = 0;
  *(void *)&self->_boundingBoxMin[8] = 0;
  [v4 decodeFloatForKey:@"boundingBoxMin.x"];
  *(_DWORD *)self->_boundingBoxMiuint64_t n = v28;
  [v4 decodeFloatForKey:@"boundingBoxMin.y"];
  *(_DWORD *)&self->_boundingBoxMin[4] = v29;
  [v4 decodeFloatForKey:@"boundingBoxMin.z"];
  *(void *)self->_boundingBoxMax = 0;
  *(_DWORD *)&self->_boundingBoxMin[8] = v30;
  *(void *)&self->_boundingBoxMax[8] = 0;
  [v4 decodeFloatForKey:@"boundingBoxMax.x"];
  *(_DWORD *)self->_boundingBoxMax = v31;
  [v4 decodeFloatForKey:@"boundingBoxMax.y"];
  *(_DWORD *)&self->_boundingBoxMax[4] = v32;
  [v4 decodeFloatForKey:@"boundingBoxMax.z"];
  *(_DWORD *)&self->_boundingBoxMax[8] = v34;
  if (v14) {
    int v35 = {;
  }
    [v4 failWithError:v35];

LABEL_13:
    uint64_t v36 = 0;
    goto LABEL_14;
  }
  if (!v7) {
    BOOL v37 = {;
  }
    [v4 failWithError:v37];

    goto LABEL_13;
  }
  uint64_t v36 = self;
LABEL_14:

  return v36;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  [v10 encodeObject:self->_name forKey:@"name"];
  [v10 encodeObject:self->_partIndices forKey:@"partIndices"];
  [v10 encodeInt:self->_skeletonCount forKey:@"skeletonCount"];
  [v10 encodeObject:self->_skinningModel forKey:@"skinningModel"];
  [v10 encodeObject:self->_blendShapeModel forKey:@"blendShapeModel"];
  [v10 encodeObject:self->_lods forKey:@"lods"];
  LODWORD(v4) = *(_DWORD *)self->_boundingBoxMin;
  [v10 encodeFloat:@"boundingBoxMin.x" forKey:v4];
  LODWORD(v5) = *(_DWORD *)&self->_boundingBoxMin[4];
  [v10 encodeFloat:@"boundingBoxMin.y" forKey:v5];
  LODWORD(v6) = *(_DWORD *)&self->_boundingBoxMin[8];
  [v10 encodeFloat:@"boundingBoxMin.z" forKey:v6];
  LODWORD(v7) = *(_DWORD *)self->_boundingBoxMax;
  [v10 encodeFloat:@"boundingBoxMax.x" forKey:v7];
  LODWORD(v8) = *(_DWORD *)&self->_boundingBoxMax[4];
  [v10 encodeFloat:@"boundingBoxMax.y" forKey:v8];
  LODWORD(v9) = *(_DWORD *)&self->_boundingBoxMax[8];
  [v10 encodeFloat:@"boundingBoxMax.z" forKey:v9];
}

- (BOOL)validateWithParts:(id)a3 payloadSize:(FixedInlineArray<unsigned)long error:(8UL> *)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  double v8 = (_anonymous_namespace_ *)a3;
  v27 = v8;
  unint64_t v9 = [(_anonymous_namespace_ *)v8 count];
  int v37 = 1;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  v36[1] = 0;
  re::DynamicOverflowArray<unsigned long long,3ul>::setCapacity(v36, 0);
  v37 += 2;
  if ((v9 & 0x3F) != 0) {
    unint64_t v10 = (v9 >> 6) + 1;
  }
  else {
    unint64_t v10 = v9 >> 6;
  }
  unint64_t v40 = v9;
  uint64_t v41 = 0;
  re::DynamicOverflowArray<unsigned long long,3ul>::resize((_anonymous_namespace_ *)v36, v10, &v41);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v11 = self->_partIndices;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v32 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v33;
    char v14 = @"REMeshModelDescriptor: mesh part index overflow";
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v11);
        }
        unint64_t v16 = [*(id *)(*((void *)&v32 + 1) + 8 * i) unsignedIntegerValue];
        unint64_t v17 = v16;
        if (HIDWORD(v16)) {
          goto LABEL_29;
        }
        if (v16 >= v9)
        {
          char v14 = @"REMeshModelDescriptor: mesh part index out of range";
LABEL_29:
          goto LABEL_34;
        }
        if (re::DynamicBitset<unsigned long long,256ul>::getBit((uint64_t)v36, v16))
        {
          goto LABEL_34;
        }
        re::DynamicBitset<unsigned long long,256ul>::setBit((uint64_t)v36, v17);
      }
      uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v32 objects:v43 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  skinningModel = self->_skinningModel;
  if (skinningModel
    && ![(REMeshSkinningModelDescriptor *)skinningModel validateWithPayloadSize:a4 parts:v27 partIndices:self->_partIndices skeletonCount:self->_skeletonCount error:a5]|| (blendShapeModel = self->_blendShapeModel) != 0&& ![(REMeshBlendShapeModelDescriptor *)blendShapeModel validateWithPayloadSize:a4 partCount:v9 error:a5])
  {
    BOOL v25 = 0;
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v11 = self->_lods;
    uint64_t v20 = [(NSArray *)v11 countByEnumeratingWithState:&v28 objects:v42 count:16];
    if (v20)
    {
      unsigned int v21 = 0;
      uint64_t v22 = *(void *)v29;
LABEL_20:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v11);
        }
        uint64_t v24 = *(void **)(*((void *)&v28 + 1) + 8 * v23);
        if (([v24 validateWithPartCount:v9 error:a5] & 1) == 0) {
          break;
        }
        if (v21 >= [v24 meshPartEndIndex])
        {
          break;
        }
        unsigned int v21 = [v24 meshPartEndIndex];
        if (v20 == ++v23)
        {
          uint64_t v20 = [(NSArray *)v11 countByEnumeratingWithState:&v28 objects:v42 count:16];
          BOOL v25 = 1;
          if (v20) {
            goto LABEL_20;
          }
          goto LABEL_35;
        }
      }
LABEL_34:
      BOOL v25 = 0;
    }
    else
    {
      BOOL v25 = 1;
    }
LABEL_35:
  }
  if (v36[0] && (v37 & 1) == 0) {
    (*(void (**)(void))(*(void *)v36[0] + 40))();
  }

  return v25;
}

- (unint64_t)estimateContainerSize
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v3 = (objc_class *)objc_opt_class();
  size_t InstanceSize = class_getInstanceSize(v3);
  if (self->_name
    && (double v5 = (objc_class *)objc_opt_class(), v6 = class_getInstanceSize(v5),
                                             name = self->_name,
                                             InstanceSize += v6,
                                             name))
  {
    uint64_t v8 = [(NSString *)name lengthOfBytesUsingEncoding:4] + 1;
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (self->_partIndices)
  {
    unint64_t v9 = (objc_class *)objc_opt_class();
    size_t v10 = class_getInstanceSize(v9);
    partIndices = self->_partIndices;
  }
  else
  {
    partIndices = 0;
    size_t v10 = 0;
  }
  uint64_t v12 = [(NSArray *)partIndices count];
  uint64_t v13 = (objc_class *)objc_opt_class();
  size_t v14 = class_getInstanceSize(v13);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v15 = self->_partIndices;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v37 objects:v42 count:16];
  uint64_t v17 = v8 + InstanceSize + v10 + 8 * v12;
  if (v16)
  {
    uint64_t v18 = *(void *)v38;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(v15);
        }
        if (*(void *)(*((void *)&v37 + 1) + 8 * v19)) {
          size_t v20 = v14;
        }
        else {
          size_t v20 = 0;
        }
        v17 += v20;
        ++v19;
      }
      while (v16 != v19);
      uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v16);
  }

  unint64_t v21 = [(REMeshSkinningModelDescriptor *)self->_skinningModel estimateContainerSize];
  unint64_t v22 = [(REMeshBlendShapeModelDescriptor *)self->_blendShapeModel estimateContainerSize];
  if (self->_lods)
  {
    uint64_t v23 = (objc_class *)objc_opt_class();
    size_t v24 = class_getInstanceSize(v23);
    lods = self->_lods;
  }
  else
  {
    lods = 0;
    size_t v24 = 0;
  }
  uint64_t v26 = [(NSArray *)lods count];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v27 = self->_lods;
  uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v33 objects:v41 count:16];
  unint64_t v29 = v21 + v17 + v22 + v24 + 8 * v26;
  if (v28)
  {
    uint64_t v30 = *(void *)v34;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v34 != v30) {
          objc_enumerationMutation(v27);
        }
        v29 += objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v31++), "estimateContainerSize", (void)v33);
      }
      while (v28 != v31);
      uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v28);
  }

  return v29;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)partIndices
{
  return self->_partIndices;
}

- (unsigned)skeletonCount
{
  return self->_skeletonCount;
}

- (REMeshSkinningModelDescriptor)skinningModel
{
  return self->_skinningModel;
}

- (REMeshBlendShapeModelDescriptor)blendShapeModel
{
  return self->_blendShapeModel;
}

- (NSArray)lods
{
  return self->_lods;
}

- (__n128)boundingBoxMin
{
  return a1[4];
}

- (__n128)boundingBoxMax
{
  return a1[5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lods, 0);
  objc_storeStrong((id *)&self->_blendShapeModel, 0);
  objc_storeStrong((id *)&self->_skinningModel, 0);
  objc_storeStrong((id *)&self->_partIndices, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end