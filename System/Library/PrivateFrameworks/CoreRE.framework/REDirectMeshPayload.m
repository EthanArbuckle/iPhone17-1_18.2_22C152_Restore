@interface REDirectMeshPayload
+ (BOOL)supportsSecureCoding;
- (AABB)aabb;
- (BOOL)isLimitedRenderAsset;
- (BOOL)isShareable;
- (DRMesh)directMesh;
- (FixedInlineArray<NS::SharedPtr<MTL::Buffer>,)meshPayloadBuffersWithDevice:(REDirectMeshPayload *)self;
- (FixedInlineArray<unsigned)payloadBufferSizes;
- (MeshCollection)makeMeshCollection:(SEL)a3;
- (NSArray)instances;
- (NSArray)models;
- (NSArray)parts;
- (NSArray)skeletons;
- (REDirectMeshPayload)initWithCoder:(id)a3;
- (REDirectMeshPayload)initWithDirectMesh:(id)a3;
- (const)identifier;
- (unint64_t)estimatePayloadContainerOverheadSize;
- (unint64_t)totalPayloadSize;
- (void)encodeWithCoder:(id)a3;
- (void)makeBoundingBoxes:(void *)a3 perPartPerInstanceBoundingBoxes:(void *)a4;
- (void)setDirectMesh:(id)a3;
@end

@implementation REDirectMeshPayload

- (AABB)aabb
{
  *(void *)&long long v4 = 0x7F0000007FLL;
  *((void *)&v4 + 1) = 0x7F0000007FLL;
  *(int32x4_t *)&retstr->var0.var0.var0.var0 = vdupq_n_s32(0x7F800000u);
  *(_OWORD *)&retstr->var1.var0.var1[1] = v4;
  v5 = [(REDirectMeshPayload *)self directMesh];
  if (v5)
  {
    uint64_t PartCount = DRMeshGetPartCount();
    v17.i32[2] = 0;
    v17.i64[0] = 0;
    v16.i32[2] = 0;
    v16.i64[0] = 0;
    if (PartCount)
    {
      uint64_t v7 = 0;
      v8.i64[0] = 0x7F0000007FLL;
      v8.i64[1] = 0x7F0000007FLL;
      float32x4_t v14 = v8;
      float32x4_t v15 = (float32x4_t)vdupq_n_s32(0x7F800000u);
      do
      {
        if (DRMeshGetPartAt())
        {
          float32x4_t v10 = v16;
          float32x4_t v9 = v17;
          float32x4_t v12 = v14;
          float32x4_t v11 = v15;
          v11.i32[3] = 0;
          v9.i32[3] = 0;
          v12.i32[3] = 0;
          v10.i32[3] = 0;
          float32x4_t v14 = vmaxnmq_f32(v12, v10);
          float32x4_t v15 = vminnmq_f32(v11, v9);
          *(float32x4_t *)&retstr->var0.var0.var0.var0 = v15;
          *(float32x4_t *)&retstr->var1.var0.var1[1] = v14;
        }
        ++v7;
      }
      while (PartCount != v7);
    }
  }

  return result;
}

- (MeshCollection)makeMeshCollection:(SEL)a3
{
  uint64_t v117 = *MEMORY[0x263EF8340];
  v5 = [(REDirectMeshPayload *)self directMesh];
  v51 = (_anonymous_namespace_ *)DRMeshCopyDescriptor();
  long long v64 = 0uLL;
  uint64_t v65 = 0;
  unint64_t PartCount = DRMeshGetPartCount();
  id v7 = v5;
  float32x4_t v8 = (void *)DRMeshCopyDescriptor();
  uint64_t v63 = 0;
  v60[1] = 0;
  unint64_t v61 = 0;
  v60[0] = 0;
  int v62 = 0;
  VertexAttributeCount = (_anonymous_namespace_ *)DRMeshDescriptorGetVertexAttributeCount();
  if (VertexAttributeCount != (_anonymous_namespace_ *)-1) {
    VertexAttributeCount = (_anonymous_namespace_ *)re::DynamicArray<re::NamedVertexBuffer>::setCapacity(v60, (unint64_t)VertexAttributeCount + 1);
  }
  uint64_t IndexType = DRMeshDescriptorGetIndexType();
  if (IndexType == 1) {
    char v11 = 36;
  }
  else {
    char v11 = 0;
  }
  if (!IndexType) {
    char v11 = 49;
  }
  LOBYTE(v69[0]) = v11;
  BYTE1(v69[0]) = 1;
  float32x4_t v12 = (void *)*((void *)a4 + 4);
  v69[1] = 0;
  v69[1] = v12;
  *(void *)&long long v70 = 0;
  DWORD2(v70) = 0;
  uint64_t v13 = DRMeshDescriptorGetIndexType();
  int v14 = 4 * (v13 == 1);
  if (!v13) {
    int v14 = 2;
  }
  HIDWORD(v70) = v14;
  re::DynamicArray<re::NamedVertexBuffer>::add((_anonymous_namespace_ *)v60, (uint64_t)v67);
  if (v69[1])
  {

    v69[1] = 0;
  }
  v49 = retstr;
  if (v67[0] && ((uint64_t)v67[1] & 1) != 0) {
    (*(void (**)(void))(*(void *)v67[0] + 40))();
  }
  uint64_t v15 = DRMeshDescriptorGetVertexAttributeCount();
  if (v15)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      LODWORD(v59) = 0;
      *(void *)&long long v112 = 0;
      *(void *)__str = 0;
      *(void *)v111 = 0;
      *(void *)&long long v55 = 0;
      *(void *)&long long v54 = 0;
      uint64_t v66 = 0;
      if (DRMeshDescriptorGetVertexAttributeFormat())
      {
        VertexLayout = (_anonymous_namespace_ *)DRMeshDescriptorGetVertexLayout();
        if (VertexLayout)
        {
          v18 = (void *)*((void *)a4 + v55);
          v19 = (const char *)*((void *)*(&off_264BE2B28 + (int)v59) + 1);
          LOBYTE(v69[0]) = v112;
          BYTE1(v69[0]) = 1;
          v69[1] = 0;
          v69[1] = v18;
          *(void *)&long long v70 = v54;
          *((void *)&v70 + 1) = __PAIR64__(v66, *(unsigned int *)v111);
          re::DynamicArray<re::NamedVertexBuffer>::add((_anonymous_namespace_ *)v60, (uint64_t)v67);
          if (v69[1])
          {

            v69[1] = 0;
          }
          if (v67[0] && ((uint64_t)v67[1] & 1) != 0) {
            (*(void (**)(void))(*(void *)v67[0] + 40))();
          }
        }
      }
    }
  }

  if (v61)
  {
    v20 = (void **)(v63 + 40);
    unint64_t v21 = v61 << 6;
    while (1)
    {
      v22 = ((unint64_t)*(v20 - 4) & 1) != 0 ? (const char *)*(v20 - 3) : (char *)v20 - 31;
      if (!strcmp(v22, "indexTriangles")) {
        break;
      }
      v20 += 8;
      v21 -= 64;
      if (!v21) {
        goto LABEL_32;
      }
    }
    uint64_t v23 = DRMeshGetPartCount();
    if (v23)
    {
      uint64_t v24 = 0;
      unint64_t v25 = 0;
      int32x4_t v50 = vdupq_n_s32(0x7F800000u);
      do
      {
        uint64_t v58 = 0;
        uint64_t v59 = 0;
        uint64_t v56 = 0;
        uint64_t v57 = 0;
        DWORD2(v55) = 0;
        *(void *)&long long v55 = 0;
        DWORD2(v54) = 0;
        *(void *)&long long v54 = 0;
        if (DRMeshGetPartAt())
        {
          uint64_t v26 = v23;
          id v27 = v7;
          v28 = (void *)*((void *)a4 + 4);
          int v30 = v58;
          int v29 = v59;
          uint64_t v31 = DRMeshDescriptorGetIndexType();
          v67[0] = 0;
          id v32 = v28;
          int v33 = 4 * (v31 == 1);
          if (!v31) {
            int v33 = 2;
          }
          v67[0] = v32;
          LODWORD(v67[1]) = v29;
          HIDWORD(v67[1]) = v33 * v30;
          NS::SharedPtr<MTL::Texture>::operator=(v20, v67);
          v20[1] = v67[1];
          id v7 = v27;
          uint64_t v23 = v26;
          if (v67[0]) {

          }
          v34 = (_anonymous_namespace_ *)snprintf(__str, 0x40uLL, "Part%zu", v25);
          v53[0] = 0;
          v53[1] = (uint64_t)"";
          size_t v35 = strlen(__str);
          *(_OWORD *)v111 = v55;
          *(_OWORD *)&v111[16] = v54;
          long long v112 = xmmword_23435FD50;
          long long v113 = xmmword_23435FD60;
          long long v114 = xmmword_23435FD80;
          long long v115 = xmmword_23435FBB0;
          WORD2(v66) = 0;
          LODWORD(v66) = 0;
          re::MeshPart::MeshPart((uint64_t)v67, v53, v57, v63, v61, v58, v58, 1, v111, v25, &v112, (re::MeshPartFlags *)&v66, -1, 0);
          re::StringID::destroyString((re::StringID *)v53);
          char v102 = v56;
          uint64_t v36 = *((void *)&v64 + 1);
          if (*((void *)&v64 + 1) <= v25)
          {
            uint64_t v66 = 0;
            long long v115 = 0u;
            long long v116 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            long long v112 = 0u;
            os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            *(_DWORD *)v111 = 136315906;
            *(void *)&v111[4] = "operator[]";
            *(_WORD *)&v111[12] = 1024;
            *(_DWORD *)&v111[14] = 468;
            *(_WORD *)&v111[18] = 2048;
            *(void *)&v111[20] = v25;
            *(_WORD *)&v111[28] = 2048;
            *(void *)&v111[30] = v36;
            _os_log_send_and_compose_impl();
            _os_crash_msg();
            __break(1u);
LABEL_51:
            *(void *)v111 = 0;
            long long v115 = v37;
            long long v116 = v37;
            long long v113 = v37;
            long long v114 = v37;
            long long v112 = v37;
            os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            *(_DWORD *)__str = 136315906;
            *(void *)&__str[4] = "operator[]";
            __int16 v105 = 1024;
            int v106 = 468;
            __int16 v107 = 2048;
            unint64_t v108 = v25;
            __int16 v109 = 2048;
            uint64_t v110 = v36;
            _os_log_send_and_compose_impl();
            _os_crash_msg();
            __break(1u);
LABEL_52:
            re::internal::assertLog((re::internal *)4, v43, "assertion failure: '%s' (%s:line %i) ", "!isInitialized() || m_allocator == other.m_allocator", "operator=", 296);
            _os_crash();
            __break(1u);
          }
        }
        else
        {
          long long v37 = 0uLL;
          long long v87 = 0u;
          uint64_t v84 = 0;
          long long v82 = 0uLL;
          long long v80 = 1uLL;
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          int32x4_t v68 = 0u;
          *(_OWORD *)v69 = 0u;
          *(_OWORD *)v67 = 0u;
          long long v81 = 0uLL;
          long long v83 = 0uLL;
          long long v85 = 0u;
          memset(v86, 0, sizeof(v86));
          memset(v88, 0, 24);
          long long v89 = xmmword_23435FD50;
          long long v90 = xmmword_23435FD60;
          long long v91 = xmmword_23435FD80;
          long long v92 = xmmword_23435FBB0;
          *(void *)&long long v38 = 0x7F0000007FLL;
          *((void *)&v38 + 1) = 0x7F0000007FLL;
          int32x4_t v93 = v50;
          long long v94 = v38;
          __int16 v97 = 0;
          char v96 = 0;
          uint64_t v95 = 0;
          v101[0] = 0;
          v101[1] = "";
          v101[3] = 0;
          char v102 = 3;
          uint64_t v103 = 0x180197E00000001;
          uint64_t v98 = -1;
          uint64_t v99 = -1;
          uint64_t v100 = -1;
          uint64_t v36 = *((void *)&v64 + 1);
          if (*((void *)&v64 + 1) <= v25) {
            goto LABEL_51;
          }
        }
        re::MeshPart::operator=((uint64_t *)(v65 + v24), (uint64_t *)v67);
        re::StringID::destroyString((re::StringID *)v101);
        re::FixedArray<re::StringID>::deinit(v88);
        re::AttributeTable::~AttributeTable((re::AttributeTable *)v67);
        ++v25;
        v24 += 560;
      }
      while (v23 != v25);
    }
    uint64_t v39 = 0;
    v67[0] = 0;
    v67[1] = "";
    *(void *)&long long v40 = 0x7F0000007FLL;
    *((void *)&v40 + 1) = 0x7F0000007FLL;
    int32x4_t v68 = vdupq_n_s32(0x7F800000u);
    *(_OWORD *)v69 = v40;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    do
    {
      v41 = &v67[v39];
      v41[12] = 0;
      v41[16] = 0;
      v39 += 5;
    }
    while (v39 != 90);
    re::StringID::destroyString((re::StringID *)v67);
    v67[0] = (id)149034514;
    v67[1] = "Model";
    v42 = [(REDirectMeshPayload *)self aabb];
    int32x4_t v68 = (int32x4_t)v112;
    *(_OWORD *)v69 = v113;
    uint64_t v44 = v70;
    if ((void)v70 && (void)v70 != (void)v64) {
      goto LABEL_52;
    }
    uint64_t v45 = *((void *)&v70 + 1);
    uint64_t v46 = v71;
    long long v70 = v64;
    *(void *)&long long v64 = v44;
    *((void *)&v64 + 1) = v45;
    *(void *)&long long v71 = v65;
    uint64_t v65 = v46;
    v49->var0.var4 = 0;
    v49->var0.var1 = 0;
    v49->var0.var2 = 0;
    v49->var0.var3 = 0;
    re::DynamicArray<re::MeshModel>::setCapacity(v49, 1uLL);
    ++v49->var0.var3;
    re::DynamicArray<re::MeshModel>::add((_anonymous_namespace_ *)v49, (uint64_t *)v67);
    re::MeshModel::~MeshModel((re::MeshModel *)v67);
  }
  else
  {
LABEL_32:
    v49->var0.var4 = 0;
    v49->var0.var1 = 0;
    v49->var0.var2 = 0;
    v49->var0.var0 = 0;
    v49->var0.var3 = 0;
  }
  re::DynamicArray<re::NamedVertexBuffer>::deinit((uint64_t)v60);
  re::FixedArray<re::MeshPart>::deinit(&v64);

  return result;
}

- (void)makeBoundingBoxes:(void *)a3 perPartPerInstanceBoundingBoxes:(void *)a4
{
  [(REDirectMeshPayload *)self aabb];
  if (!*((void *)a3 + 1)) {
    goto LABEL_8;
  }
  id v7 = (_OWORD *)*((void *)a3 + 2);
  *id v7 = v14;
  v7[1] = v15;
  float32x4_t v8 = [(REDirectMeshPayload *)self directMesh];
  unint64_t PartCount = DRMeshGetPartCount();

  if (PartCount)
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    while (1)
    {
      [(REDirectMeshPayload *)self aabb];
      if (*((void *)a4 + 1) <= v12) {
        break;
      }
      uint64_t v13 = (_OWORD *)(*((void *)a4 + 2) + v11);
      *uint64_t v13 = v14;
      v13[1] = v15;
      ++v12;
      v11 += 32;
      if (PartCount == v12) {
        return;
      }
    }
    os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_8:
    os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (const)identifier
{
  return (const unsigned __int8 (*)[16])self->_identifier;
}

- (REDirectMeshPayload)initWithDirectMesh:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REDirectMeshPayload;
  v5 = [(RESharedResourcePayload *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(REDirectMeshPayload *)v5 setDirectMesh:v4];
    id v7 = DRMeshAsResource();
    DRResourceGetIdentifier();
  }
  return v6;
}

- (REDirectMeshPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)REDirectMeshPayload;
  v5 = [(RESharedResourcePayload *)&v14 initWithCoder:v4];
  if (!v5) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    uint64_t v11 = {;
  }
    [v4 failWithError:v11];

LABEL_8:
    float32x4_t v10 = 0;
    goto LABEL_9;
  }
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  objc_super v9 = v7;
  if (!v7) {
    unint64_t v12 = {;
  }
    [v4 failWithError:v12];

    goto LABEL_8;
  }
  [v7 getUUIDBytes:v5->_identifier];

LABEL_5:
  float32x4_t v10 = v5;
LABEL_9:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:self->_identifier];
    [v4 encodeObject:v6 forKey:@"identifier"];
  }
  else
  {
    id v7 = *re::assetTypesLogObjects((re *)isKindOfClass);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)float32x4_t v8 = 0;
      _os_log_fault_impl(&dword_233120000, v7, OS_LOG_TYPE_FAULT, "REDirectMeshPayload requires an NSXPCCoder", v8, 2u);
    }
  }
}

- (FixedInlineArray<unsigned)payloadBufferSizes
{
  id v4 = (void *)DRMeshCopyDescriptor();
  DRMeshDescriptorCalculateBufferSizes();

  retstr->var0[6] = 0;
  retstr->var0[7] = 0;
  retstr->var0[4] = 0;
  retstr->var0[5] = 0;
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[2] = 0u;
  return result;
}

- (unint64_t)totalPayloadSize
{
  v2 = (void *)DRMeshCopyDescriptor();
  DRMeshDescriptorCalculateBufferSizes();

  v3.i64[0] = 0;
  return vaddvq_s64(vaddq_s64((int64x2_t)0, vaddq_s64((int64x2_t)0, v3)));
}

- (FixedInlineArray<NS::SharedPtr<MTL::Buffer>,)meshPayloadBuffersWithDevice:(REDirectMeshPayload *)self
{
  result = (FixedInlineArray<NS::SharedPtr<MTL::Buffer>, 8UL> *)self->_directMesh;
  *(_OWORD *)&retstr->var0[0].var0 = 0u;
  *(_OWORD *)&retstr->var0[2].var0 = 0u;
  *(_OWORD *)&retstr->var0[4].var0 = 0u;
  *(_OWORD *)&retstr->var0[6].var0 = 0u;
  if (result)
  {
    v6 = DRMeshReadIndicesUsing();
    id v12 = v6;
    id v7 = v6;
    NS::SharedPtr<MTL::Texture>::operator=((void **)&retstr->var0[4].var0, &v12);
    if (v12)
    {

      id v12 = 0;
    }

    uint64_t v8 = 0;
    objc_super v9 = retstr;
    do
    {
      float32x4_t v10 = DRMeshReadVerticesUsing();
      id v12 = v10;
      id v11 = v10;
      NS::SharedPtr<MTL::Texture>::operator=((void **)v9, &v12);
      if (v12)
      {

        id v12 = 0;
      }

      ++v8;
      objc_super v9 = (FixedInlineArray<NS::SharedPtr<MTL::Buffer>, 8UL> *)((char *)v9 + 8);
    }
    while (v8 != 4);
  }
  return result;
}

- (unint64_t)estimatePayloadContainerOverheadSize
{
  return 0;
}

- (BOOL)isShareable
{
  return 1;
}

- (BOOL)isLimitedRenderAsset
{
  return 0;
}

- (NSArray)parts
{
  re::internal::assertLog((re::internal *)4, (uint64_t)a2, "assertion failure: '%s' (%s:line %i) ", "!\"Unreachable code\", "-[REDirectMeshPayload parts]"", 171);
  result = (NSArray *)_os_crash();
  __break(1u);
  return result;
}

- (NSArray)models
{
  re::internal::assertLog((re::internal *)4, (uint64_t)a2, "assertion failure: '%s' (%s:line %i) ", "!\"Unreachable code\", "-[REDirectMeshPayload models]"", 177);
  result = (NSArray *)_os_crash();
  __break(1u);
  return result;
}

- (NSArray)instances
{
  v6[1] = *MEMORY[0x263EF8340];
  if (self->_directMesh)
  {
    v2 = [REMeshInstanceDescriptor alloc];
    int64x2_t v3 = [(REMeshInstanceDescriptor *)v2 initWithName:@"Model", 0, 0x3F80000000000000, *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48) modelIndex transform lodSelectOptions];
    v6[0] = v3;
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x263EFFA68];
  }
  return (NSArray *)v4;
}

- (NSArray)skeletons
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (DRMesh)directMesh
{
  return self->_directMesh;
}

- (void)setDirectMesh:(id)a3
{
}

- (void).cxx_destruct
{
}

@end