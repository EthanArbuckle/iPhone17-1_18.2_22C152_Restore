@interface REMeshPartDescriptor
+ (BOOL)supportsSecureCoding;
+ (NSArray)coreAttributeNames;
- (BOOL)isIndexed;
- (BOOL)validateAttribute:(id)a3 withName:(id)a4 payloadSize:(FixedInlineArray<unsigned)long required:(8UL> *)a5 error:(BOOL)a6;
- (BOOL)validateWithPayloadSize:(const void *)a3 error:(id *)a4;
- (MeshPart)meshPartWithPayloadBuffer:(SEL)a3 partIndexInModel:(const void *)a4;
- (NSDictionary)coreAttributes;
- (NSDictionary)customAttributes;
- (NSString)name;
- (REMeshPartDescriptor)initWithCoder:(id)a3;
- (REMeshPartDescriptor)initWithMeshAssetPart:(const void *)a3 partTransform:(id *)a4 payloadBuilder:(void *)a5;
- (REMeshPartDescriptor)initWithName:(__n128)a3 vertexCount:(__n128)a4 indexCount:(__n128)a5 instanceCount:(__n128)a6 attributes:(__n128)a7 materialIndex:(uint64_t)a8 boundingBoxMin:(void *)a9 boundingBoxMax:(unsigned int)a10 doubleSidedFlag:(unsigned int)a11 windingOrderIsCCW:(unsigned int)a12 transform:(void *)a13 preSplitVertexCount:(unsigned int)a14 patchCount:(unsigned __int8)a15;
- (REMeshPartDescriptor)initWithResourceDefinition:(const void *)a3 meshPart:(const void *)a4 payloadBuilder:(void *)a5;
- (__n128)boundingBoxMax;
- (__n128)boundingBoxMin;
- (__n128)transform;
- (unint64_t)estimateContainerSize;
- (unint64_t)indexBufferSize;
- (unint64_t)indexType;
- (unsigned)doubleSidedFlag;
- (unsigned)indexCount;
- (unsigned)indexPayloadOffset;
- (unsigned)instanceCount;
- (unsigned)materialIndex;
- (unsigned)patchCount;
- (unsigned)preSplitVertexCount;
- (unsigned)vertexCount;
- (unsigned)windingOrderIsCCW;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMeshPartDescriptor

- (REMeshPartDescriptor)initWithMeshAssetPart:(const void *)a3 partTransform:(id *)a4 payloadBuilder:(void *)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v43 = [NSString stringWithUTF8String:*((void *)a3 + 10)];
  v42 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v9 = *((void *)a3 + 2);
  if (!v9)
  {
LABEL_12:
    uint64_t v19 = *((unsigned int *)a3 + 58);
    if (v19)
    {
      uint64_t v20 = 0;
      v21 = (int *)(*((void *)a3 + 27) + 8);
      while (1)
      {
        int v22 = *v21;
        v21 += 20;
        if (v22 < 0) {
          break;
        }
        if (v19 == ++v20)
        {
          LODWORD(v20) = *((_DWORD *)a3 + 58);
          break;
        }
      }
    }
    else
    {
      LODWORD(v20) = 0;
    }
    if (v19 == v20)
    {
LABEL_37:
      char v35 = *((unsigned char *)a3 + 195) == 1;
      if (!*((unsigned char *)a3 + 194)) {
        char v35 = 2;
      }
      if (*((unsigned char *)a3 + 192)) {
        char v36 = *((unsigned char *)a3 + 193);
      }
      else {
        char v36 = 2;
      }
      HIDWORD(v40) = *((_DWORD *)a3 + 15);
      LODWORD(v41) = *((_DWORD *)a3 + 16);
      BYTE1(v40) = v35;
      LOBYTE(v40) = v36;
      v37 = -[REMeshPartDescriptor initWithName:vertexCount:indexCount:instanceCount:attributes:materialIndex:boundingBoxMin:boundingBoxMax:doubleSidedFlag:windingOrderIsCCW:transform:preSplitVertexCount:patchCount:](self, "initWithName:vertexCount:indexCount:instanceCount:attributes:materialIndex:boundingBoxMin:boundingBoxMax:doubleSidedFlag:windingOrderIsCCW:transform:preSplitVertexCount:patchCount:", v43, *((unsigned int *)a3 + 12), *((unsigned int *)a3 + 10), *((unsigned int *)a3 + 13), v8, *((unsigned __int16 *)a3 + 28), *((double *)a3 + 12), *((double *)a3 + 14), *(double *)v42, *((double *)v42 + 2), *((double *)v42 + 4), *((double *)v42 + 6), v40, v41);
      self = v37;
      goto LABEL_43;
    }
    uint64_t v23 = v20;
    uint64_t v24 = *((void *)a3 + 27);
    while (1)
    {
      uint64_t v25 = v24 + 80 * v23;
      if (*(unsigned char *)(v25 + 24)) {
        uint64_t v26 = *(void *)(v24 + 80 * v23 + 32);
      }
      else {
        uint64_t v26 = v24 + 80 * v23 + 25;
      }
      v27 = [NSString stringWithUTF8String:v26];
      if (*(unsigned char *)(v24 + 80 * v23 + 56)) {
        uint64_t v28 = *(void *)(v24 + 80 * v23 + 64);
      }
      else {
        uint64_t v28 = v25 + 57;
      }
      v29 = [NSString stringWithUTF8String:v28];
      v30 = [v8 objectForKeyedSubscript:v27];
      if (v30) {
        goto LABEL_29;
      }
      v31 = [v8 objectForKeyedSubscript:v29];
      BOOL v32 = v31 == 0;

      if (!v32) {
        break;
      }
LABEL_30:

      unsigned int v33 = *((_DWORD *)a3 + 58);
      uint64_t v24 = *((void *)a3 + 27);
      if (v33 <= (int)v20 + 1) {
        unsigned int v33 = v20 + 1;
      }
      while (1)
      {
        uint64_t v23 = (v20 + 1);
        if (v33 - 1 == v20) {
          break;
        }
        LODWORD(v20) = v20 + 1;
        unsigned int v34 = v23;
        if ((*(_DWORD *)(v24 + 80 * v23 + 8) & 0x80000000) != 0) {
          goto LABEL_36;
        }
      }
      unsigned int v34 = v33;
LABEL_36:
      LODWORD(v20) = v34;
      if (v19 == v34) {
        goto LABEL_37;
      }
    }
    v30 = [v8 objectForKeyedSubscript:v29];
    [v8 setObject:v30 forKeyedSubscript:v27];
LABEL_29:

    goto LABEL_30;
  }
  uint64_t v10 = *((void *)a3 + 4);
  uint64_t v11 = 80 * v9;
  while (1)
  {
    if (*(unsigned char *)(v10 + 8)) {
      uint64_t v12 = *(void *)(v10 + 16);
    }
    else {
      uint64_t v12 = v10 + 9;
    }
    v13 = [NSString stringWithUTF8String:v12];
    v14 = [v8 objectForKeyedSubscript:v13];
    BOOL v15 = v14 == 0;

    if (!v15)
    {
      v17 = *re::assetTypesLogObjects(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v46 = v43;
        __int16 v47 = 2112;
        v48 = v13;
        _os_log_error_impl(&dword_233120000, v17, OS_LOG_TYPE_ERROR, "Two attribute buffers in the same mesh part (%@) have the same name (%@)", buf, 0x16u);
      }
      goto LABEL_11;
    }
    v18 = [[REMeshAttributeDescriptor alloc] initWithMeshAssetBuffer:v10 payloadBuilder:a5];
    if (!v18) {
      break;
    }
    [v8 setObject:v18 forKeyedSubscript:v13];

LABEL_11:
    v10 += 80;
    v11 -= 80;
    if (!v11) {
      goto LABEL_12;
    }
  }
  v39 = *re::assetTypesLogObjects(0);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v13;
    _os_log_error_impl(&dword_233120000, v39, OS_LOG_TYPE_ERROR, "Failed to create REMeshAttributeDescriptor for attribute buffer %@", buf, 0xCu);
  }

  v37 = 0;
LABEL_43:

  return v37;
}

- (REMeshPartDescriptor)initWithResourceDefinition:(const void *)a3 meshPart:(const void *)a4 payloadBuilder:(void *)a5
{
  v39 = (_anonymous_namespace_ *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v8 = *((void *)a3 + 7);
  unint64_t v9 = *((void *)a3 + 5);
  uint64_t v10 = (int *)*((void *)a4 + 4);
  v37 = (char *)a4;
  unint64_t v11 = *((void *)a4 + 2);
  if (v42)
  {
    uint64_t v12 = v43;
    v13 = &v43[7 * v42];
    v14 = (char *)a5 + 64;
    BOOL v15 = (char *)a5 + 8;
    while (1)
    {
      v16 = [NSString stringWithUTF8String:*v12];
      v17 = *v12;
      v40[0] = 0;
      v40[1] = "";
      uint64_t v19 = (uint64_t)((re::bufferIdentifierForMeshAttribute((re *)v40, v18) & 0xFFFFFFFC) == 4 ? v14 : v15);
      re::StringID::destroyString((re::StringID *)v40);
      v21 = v12[4];
      if (!v21) {
        break;
      }
      int v22 = (uint64_t *)v12[5];
      if (v21 != (const char *)1)
      {
        uint64_t v24 = &v22[2 * (void)v21];
        uint64_t v25 = v22 + 2;
        do
        {
          v25 += 2;
        }
        while (v25 != v24);
      }
      uint64_t v26 = [[REMeshAttributeDescriptor alloc] initWithVertexAttributeDescriptor:v12 payloadOffset:v23 count:*((unsigned int *)v12 + 4)];
      [(_anonymous_namespace_ *)v39 setObject:v26 forKeyedSubscript:v16];

      v12 += 7;
      if (v12 == v13) {
        goto LABEL_11;
      }
    }
    re::internal::assertLog((re::internal *)6, v20, "assertion failure: '%s' (%s:line %i) Index out of range. index = %zu, size = %zu", "index < size()", "operator[]", 251, 0, 0);
    result = (REMeshPartDescriptor *)_os_crash();
    __break(1u);
  }
  else
  {
LABEL_11:
    if (v37[114]) {
      char v27 = v37[115] == 1;
    }
    else {
      char v27 = 2;
    }
    uint64_t v28 = [NSString stringWithUTF8String:"indexTriangles"];
    v29 = [(_anonymous_namespace_ *)v39 objectForKeyedSubscript:v28];

    if (v29) {
      [v29 count];
    }
    if (*((void *)v37 + 6)) {
      v30 = (char *)*((void *)v37 + 7);
    }
    else {
      v30 = v37 + 49;
    }
    v31 = [NSString stringWithUTF8String:v30];
    if (v37[112]) {
      char v32 = v37[113];
    }
    else {
      char v32 = 2;
    }
    HIDWORD(v35) = *((_DWORD *)v37 + 30);
    LODWORD(v36) = 0;
    BYTE1(v35) = v27;
    LOBYTE(v35) = v32;
    unsigned int v33 = -[REMeshPartDescriptor initWithName:vertexCount:indexCount:instanceCount:attributes:materialIndex:boundingBoxMin:boundingBoxMax:doubleSidedFlag:windingOrderIsCCW:transform:preSplitVertexCount:patchCount:](self, "initWithName:vertexCount:indexCount:instanceCount:attributes:materialIndex:boundingBoxMin:boundingBoxMax:doubleSidedFlag:windingOrderIsCCW:transform:preSplitVertexCount:patchCount:", v31, *((double *)v37 + 10), *((double *)v37 + 12), *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48), v35, v36);

    re::FixedArray<re::MeshVertexAttributeBuffers::Attribute>::deinit(&v41);
    return v33;
  }
  return result;
}

- (MeshPart)meshPartWithPayloadBuffer:(SEL)a3 partIndexInModel:(const void *)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  result = (MeshPart *)[(REMeshPartDescriptor *)self materialIndex];
  if (result < 0x10000)
  {
    __int16 v47 = (__int16)result;
    uint64_t v68 = 0;
    v65[1] = 0;
    unint64_t v66 = 0;
    int v67 = 0;
    re::DynamicArray<re::NamedVertexBuffer>::setCapacity(v65, 0);
    ++v67;
    if ([(REMeshPartDescriptor *)self isIndexed])
    {
      unint64_t v11 = a5;
      uint64_t v12 = [(REMeshPartDescriptor *)self indexType];
      if (v12 == 1) {
        char v13 = 36;
      }
      else {
        char v13 = 0;
      }
      if ((_BYTE)v12) {
        unsigned __int8 v14 = v13;
      }
      else {
        unsigned __int8 v14 = 49;
      }
      LOWORD(v63) = v14;
      BOOL v15 = (void *)*((void *)a4 + 4);
      unsigned int v16 = [(REMeshPartDescriptor *)self indexPayloadOffset];
      unsigned int v17 = [(REMeshPartDescriptor *)self indexBufferSize];
      *((void *)&v63 + 1) = 0;
      *((void *)&v63 + 1) = v15;
      *(void *)&long long v64 = __PAIR64__(v17, v16);
      *((void *)&v64 + 1) = 0xFFFFFFFF00000000;
      re::DynamicArray<re::NamedVertexBuffer>::add((_anonymous_namespace_ *)v65, (uint64_t)v62);
      a5 = v11;
      if (*((void *)&v63 + 1))
      {

        *((void *)&v63 + 1) = 0;
      }
      if (*(void *)&v62[0] && (BYTE8(v62[0]) & 1) != 0) {
        (*(void (**)(void))(**(void **)&v62[0] + 40))();
      }
    }
    unint64_t v46 = a5;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v59 = 0u;
    long long v58 = 0u;
    v18 = +[REMeshPartDescriptor coreAttributeNames];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v59 != v20) {
            objc_enumerationMutation(v18);
          }
          int v22 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          unint64_t v23 = [(REMeshPartDescriptor *)self coreAttributes];
          uint64_t v24 = [v23 objectForKeyedSubscript:v22];

          if (v24) {
            objc_msgSend(v24, "addBufferToArray:name:payloadBuffer:", v65, objc_msgSend(v22, "UTF8String"), a4);
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v58 objects:v70 count:16];
      }
      while (v19);
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v25 = [(REMeshPartDescriptor *)self customAttributes];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v54 objects:v69 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v55 != v27) {
            objc_enumerationMutation(v25);
          }
          v29 = *(void **)(*((void *)&v54 + 1) + 8 * j);
          v30 = [(REMeshPartDescriptor *)self customAttributes];
          v31 = [v30 objectForKeyedSubscript:v29];

          objc_msgSend(v31, "addBufferToArray:name:payloadBuffer:", v65, objc_msgSend(v29, "UTF8String"), a4);
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v54 objects:v69 count:16];
      }
      while (v26);
    }

    [(REMeshPartDescriptor *)self boundingBoxMin];
    long long v45 = v32;
    [(REMeshPartDescriptor *)self boundingBoxMax];
    v53[0] = v45;
    v53[1] = v33;
    v49[0] = 0;
    char v50 = 0;
    char v52 = 0;
    if ([(REMeshPartDescriptor *)self doubleSidedFlag] != 2)
    {
      v49[0] = 1;
      v49[1] = [(REMeshPartDescriptor *)self doubleSidedFlag] == 1;
    }
    if ([(REMeshPartDescriptor *)self windingOrderIsCCW] != 2)
    {
      char v50 = 1;
      BOOL v51 = [(REMeshPartDescriptor *)self windingOrderIsCCW] == 1;
    }
    id v34 = [(REMeshPartDescriptor *)self name];
    uint64_t v35 = (_anonymous_namespace_ *)[v34 UTF8String];
    v48[0] = 0;
    v48[1] = (uint64_t)"";
    uint64_t v36 = v68;
    unint64_t v37 = v66;
    int v38 = [(REMeshPartDescriptor *)self indexCount];
    int v39 = [(REMeshPartDescriptor *)self vertexCount];
    int v40 = [(REMeshPartDescriptor *)self instanceCount];
    [(REMeshPartDescriptor *)self transform];
    v62[0] = v41;
    v62[1] = v42;
    long long v63 = v43;
    long long v64 = v44;
    re::MeshPart::MeshPart((uint64_t)retstr, v48, v47, v36, v37, v38, v39, v40, v53, v46, v62, (re::MeshPartFlags *)v49, [(REMeshPartDescriptor *)self preSplitVertexCount], [(REMeshPartDescriptor *)self patchCount]);
    re::StringID::destroyString((re::StringID *)v48);

    return (MeshPart *)re::DynamicArray<re::NamedVertexBuffer>::deinit((uint64_t)v65);
  }
  else
  {
    *(_OWORD *)&retstr->var0.var4.var5.var2 = 0u;
    *(_OWORD *)&retstr->var0.var4.var5.var4 = 0u;
    *(_OWORD *)&retstr->var0.var4.var4.var3 = 0u;
    *(_OWORD *)&retstr->var0.var4.var5.var0 = 0u;
    *(_OWORD *)&retstr->var0.var4.var3.var2 = 0u;
    *(_OWORD *)&retstr->var0.var4.var4.var1 = 0u;
    *(_OWORD *)&retstr->var0.var4.var3.var0.var2.var0 = 0u;
    *(_OWORD *)&retstr->var0.var4.var3.var0.var3.var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var4.var2.var3 = 0u;
    *(_OWORD *)&retstr->var0.var4.var3.var0.var0 = 0u;
    *(_OWORD *)&retstr->var0.var4.var1.var4 = 0u;
    *(_OWORD *)&retstr->var0.var4.var2.var1 = 0u;
    *(_OWORD *)&retstr->var0.var4.var1.var0 = 0u;
    *(_OWORD *)&retstr->var0.var4.var1.var2 = 0u;
    *(_OWORD *)&retstr->var0.var4.var0.var4 = 0u;
    *(_OWORD *)&retstr->var0.var4.var0.var6 = 0u;
    *(_OWORD *)&retstr->var0.var4.var0.var2 = 0u;
    *(_OWORD *)&retstr->var0.var2 = 0u;
    *(_OWORD *)&retstr->var0.var3.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0.var0 = 0u;
    *(_OWORD *)&retstr->var0.var4.var0.var0 = 0u;
    retstr->var0.var4.var3.var0.var2.var1 = 1;
    retstr->var0.var4.var3.var0.var3.var1.var0 = 0;
    retstr->var0.var4.var3.var0.var3.var0[1] = 0;
    retstr->var0.var4.var3.var1 = 0;
    retstr->var0.var4.var3.var2 = 0;
    retstr->var0.var4.var4.var0 = 0;
    retstr->var0.var4.var4.var1 = 0;
    retstr->var0.var4.var4.var2 = 0;
    retstr->var0.var4.var4.var3 = 0;
    *(_OWORD *)&retstr->var0.var4.var4.var4 = 0u;
    *(_OWORD *)&retstr->var0.var4.var5.var1 = 0u;
    retstr->var0.var4.var5.var3 = 0;
    retstr->var1.var1 = 0;
    retstr->var1.var2 = 0;
    retstr->var1.var0 = 0;
    *(_OWORD *)&retstr->var2.var0.var5[2] = xmmword_23435FD50;
    *(_OWORD *)&retstr->var2.var0.var5[6] = xmmword_23435FD60;
    *(_OWORD *)&retstr->var2.var0.var5[10] = xmmword_23435FD80;
    *(_OWORD *)&retstr->var2.var0.var5[14] = xmmword_23435FBB0;
    *(void *)&long long v10 = 0x7F0000007FLL;
    *((void *)&v10 + 1) = 0x7F0000007FLL;
    *(int32x4_t *)&retstr->var3.var0.var0.var1[2] = vdupq_n_s32(0x7F800000u);
    *(_OWORD *)&retstr->var4 = v10;
    *(_WORD *)&retstr->var8.var0[14] = 0;
    retstr->var8.var0[12] = 0;
    *(void *)&retstr->var8.var0[4] = 0;
    retstr->var10 = 0;
    *(void *)&retstr->var11 = "";
    *(void *)&retstr->var15.var0 = 0;
    LOBYTE(retstr[1].var0.var0.var0) = 3;
    *(CachedVertexFetchFunction **)((char *)&retstr[1].var0.var0.var0 + 4) = (CachedVertexFetchFunction *)0x180197E00000001;
    *(void *)&retstr->var8.var0[16] = -1;
    *((void *)&retstr->var8 + 3) = -1;
    *(void *)(&retstr->var9.var0 + 1) = -1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSArray)coreAttributeNames
{
  if (qword_26AF7DF90 != -1) {
    dispatch_once(&qword_26AF7DF90, &__block_literal_global_3);
  }
  v2 = (void *)_MergedGlobals_103;
  return (NSArray *)v2;
}

void __42__REMeshPartDescriptor_coreAttributeNames__block_invoke()
{
  v7[5] = *MEMORY[0x263EF8340];
  v0 = [NSString stringWithUTF8String:"vertexPosition"];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "vertexUV", v0);
  v7[1] = v1;
  v2 = [NSString stringWithUTF8String:"vertexNormal"];
  v7[2] = v2;
  v3 = [NSString stringWithUTF8String:"vertexBitangent"];
  v7[3] = v3;
  v4 = [NSString stringWithUTF8String:"vertexColor"];
  v7[4] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:5];
  v6 = (void *)_MergedGlobals_103;
  _MergedGlobals_103 = v5;
}

- (REMeshPartDescriptor)initWithName:(__n128)a3 vertexCount:(__n128)a4 indexCount:(__n128)a5 instanceCount:(__n128)a6 attributes:(__n128)a7 materialIndex:(uint64_t)a8 boundingBoxMin:(void *)a9 boundingBoxMax:(unsigned int)a10 doubleSidedFlag:(unsigned int)a11 windingOrderIsCCW:(unsigned int)a12 transform:(void *)a13 preSplitVertexCount:(unsigned int)a14 patchCount:(unsigned __int8)a15
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v52 = a9;
  id v53 = a13;
  v58.receiver = a1;
  v58.super_class = (Class)REMeshPartDescriptor;
  uint64_t v24 = [(REMeshPartDescriptor *)&v58 init];
  if (!v24)
  {
LABEL_18:
    long long v42 = v24;
    goto LABEL_19;
  }
  uint64_t v25 = [v52 copy];
  unsigned int v45 = a14;
  name = v24->_name;
  v24->_name = (NSString *)v25;

  uint64_t v27 = (void *)[v53 mutableCopy];
  v29 = uint64_t v28 = [NSString stringWithUTF8String:"indexTriangles"];

  v24->_indexPayloadOffset = 0;
  v24->_indexCount = 0;
  v24->_isIndexed = 0;
  v24->_indexType = 0;
  if (!v29)
  {
LABEL_8:
    v24->_vertexCount = a10;
    v24->_instanceCount = a12;
    id v33 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v34 = +[REMeshPartDescriptor coreAttributeNames];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v55 != v36) {
            objc_enumerationMutation(v34);
          }
          v39 = int v38 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          if (v39) {
            [v33 setObject:v39 forKeyedSubscript:v38];
          }
        }
        uint64_t v35 = [v34 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v35);
    }

    objc_storeStrong((id *)&v24->_coreAttributes, v33);
    uint64_t v40 = [v27 copy];
    customAttributes = v24->_customAttributes;
    v24->_customAttributes = (NSDictionary *)v40;

    v24->_materialIndex = v45;
    *(__n128 *)v24->_boundingBoxMin = a2;
    *(__n128 *)v24->_boundingBoxMax = a3;
    v24->_doubleSidedFlag = a15;
    v24->_windingOrderIsCCW = a16;
    *(__n128 *)&v24[1].super.isa = a4;
    *(__n128 *)&v24[1]._indexCount = a5;
    *(__n128 *)&v24[1]._instanceCount = a6;
    *(__n128 *)&v24[1]._indexType = a7;
    v24->_preSplitVertexCount = a17;
    v24->_patchCount = a18;

    goto LABEL_18;
  }
  uint64_t v30 = [v29 format];
  v31 = (re *)[v29 payloadOffset];
  v24->_indexPayloadOffset = v31;
  v24->_indexCount = a11;
  v24->_isIndexed = 1;
  if (v30 == 36)
  {
    uint64_t v32 = 1;
    goto LABEL_7;
  }
  if (v30 == 49)
  {
    uint64_t v32 = 0;
LABEL_7:
    v24->_indexType = v32;
    goto LABEL_8;
  }
  long long v44 = *re::assetTypesLogObjects(v31);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v61 = v30;
    _os_log_fault_impl(&dword_233120000, v44, OS_LOG_TYPE_FAULT, "Unknown MTLVertexFormat (%d) for index buffer", buf, 8u);
  }

  long long v42 = 0;
LABEL_19:

  return v42;
}

- (REMeshPartDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = self->_name;
  self->_name = v5;

  long long v57 = self->_name;
  uint64_t v59 = [v4 decodeIntegerForKey:@"vertexCount"];
  self->_vertexCount = v59;
  uint64_t v58 = [v4 decodeIntegerForKey:@"instanceCount"];
  self->_instanceCount = v58;
  uint64_t v7 = [v4 decodeIntegerForKey:@"preSplitVertexCount"];
  self->_preSplitVertexCount = v7;
  uint64_t v8 = [v4 decodeIntegerForKey:@"patchCount"];
  self->_patchCount = v8;
  unint64_t v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  char v13 = [v4 decodeObjectOfClasses:v12 forKey:@"coreAttributes"];
  coreAttributes = self->_coreAttributes;
  self->_coreAttributes = v13;

  BOOL v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
  uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"customAttributes"];
  customAttributes = self->_customAttributes;
  self->_customAttributes = v19;

  uint64_t v21 = [v4 decodeIntegerForKey:@"indexPayloadOffset"];
  self->_indexPayloadOffset = v21;
  uint64_t v22 = [v4 decodeIntegerForKey:@"indexCount"];
  self->_indexCount = v22;
  self->_isIndexed = [v4 decodeBoolForKey:@"isIndexed"];
  BOOL v23 = validateMTLIndexType((re *)[v4 decodeIntegerForKey:@"indexType"], (MTLIndexType *)&self->_indexType);
  if (v57) {
    BOOL v24 = v23;
  }
  else {
    BOOL v24 = 0;
  }
  uint64_t v25 = [v4 decodeIntegerForKey:@"materialIndex"];
  *(void *)self->_boundingBoxMin = 0;
  self->_materialIndex = v25;
  BOOL v26 = (v25 | v21 | v22 | v8 | v7 | v58 | (unint64_t)v59) >> 32 != 0;
  *(void *)&self->_boundingBoxMin[8] = 0;
  [v4 decodeFloatForKey:@"boundingBoxMin.x"];
  *(_DWORD *)self->_boundingBoxMin = v27;
  [v4 decodeFloatForKey:@"boundingBoxMin.y"];
  *(_DWORD *)&self->_boundingBoxMin[4] = v28;
  [v4 decodeFloatForKey:@"boundingBoxMin.z"];
  *(void *)self->_boundingBoxMax = 0;
  *(_DWORD *)&self->_boundingBoxMin[8] = v29;
  *(void *)&self->_boundingBoxMax[8] = 0;
  [v4 decodeFloatForKey:@"boundingBoxMax.x"];
  *(_DWORD *)self->_boundingBoxMax = v30;
  [v4 decodeFloatForKey:@"boundingBoxMax.y"];
  *(_DWORD *)&self->_boundingBoxMax[4] = v31;
  [v4 decodeFloatForKey:@"boundingBoxMax.z"];
  *(_DWORD *)&self->_boundingBoxMax[8] = v32;
  BOOL v33 = validateMeshPartOptionalFlag((re *)[v4 decodeIntegerForKey:@"doubleSidedFlag"], (char *)&self->_doubleSidedFlag);
  BOOL v34 = validateMeshPartOptionalFlag((re *)[v4 decodeIntegerForKey:@"windingOrderIsCCW"], (char *)&self->_windingOrderIsCCW);
  uint64_t v60 = 0;
  id v35 = v4;
  uint64_t v36 = (long long *)[v35 decodeBytesForKey:@"transform" returnedLength:&v60];
  if (v60 != 64)
  {
    if (!v26)
    {
      long long v55 = LABEL_40:;
      [v35 failWithError:v55];
LABEL_43:

      long long v54 = 0;
      goto LABEL_44;
    }
    goto LABEL_42;
  }
  long long v38 = *v36;
  long long v39 = v36[1];
  LODWORD(v40) = HIDWORD(*v36);
  BOOL v41 = (*v36 & 0x7FFFFFFF) <= 0x7F7FFFFF
     && (DWORD1(v38) & 0x7FFFFFFFu) <= 0x7F7FFFFF
     && (DWORD2(v38) & 0x7FFFFFFFu) <= 0x7F7FFFFF
     && (LODWORD(v40) & 0x7FFFFFFFu) < 0x7F800000;
  long long v42 = v36[2];
  BOOL v43 = (v39 & 0x7FFFFFFF) <= 0x7F7FFFFF
     && (DWORD1(v39) & 0x7FFFFFFFu) <= 0x7F7FFFFF
     && (DWORD2(v39) & 0x7FFFFFFFu) <= 0x7F7FFFFF
     && (HIDWORD(v39) & 0x7FFFFFFFu) < 0x7F800000;
  long long v44 = v36[3];
  BOOL v45 = (v42 & 0x7FFFFFFF) <= 0x7F7FFFFF
     && (DWORD1(v42) & 0x7FFFFFFFu) <= 0x7F7FFFFF
     && (DWORD2(v42) & 0x7FFFFFFFu) <= 0x7F7FFFFF
     && (HIDWORD(v42) & 0x7FFFFFFFu) < 0x7F800000;
  BOOL v46 = (v44 & 0x7FFFFFFF) <= 0x7F7FFFFF
     && (DWORD1(v44) & 0x7FFFFFFFu) <= 0x7F7FFFFF
     && (DWORD2(v44) & 0x7FFFFFFFu) <= 0x7F7FFFFF
     && (HIDWORD(v44) & 0x7FFFFFFFu) < 0x7F800000;
  BOOL v47 = v40 == 0.0;
  float v48 = fabsf(v40);
  if (v48 < (float)((float)(v48 + 1.0) * 0.00001)) {
    BOOL v47 = 1;
  }
  BOOL v49 = *((float *)&v39 + 3) == 0.0;
  float v50 = fabsf(*((float *)&v39 + 3));
  if (v50 < (float)((float)(v50 + 1.0) * 0.00001)) {
    BOOL v49 = 1;
  }
  BOOL v51 = *((float *)&v42 + 3) == 0.0;
  float v52 = fabsf(*((float *)&v42 + 3));
  if (v52 < (float)((float)(v52 + 1.0) * 0.00001)) {
    BOOL v51 = 1;
  }
  if (*((float *)&v44 + 3) != 1.0
    && fabsf(*((float *)&v44 + 3) + -1.0) >= (float)((float)((float)(fabsf(*((float *)&v44 + 3)) + 1.0) + 1.0) * 0.00001))
  {
    BOOL v51 = 0;
  }
  if (v51 && v49 && v47 && v46 && v45 && v43 && v41)
  {
    *(_OWORD *)&self[1].super.isa = v38;
    *(_OWORD *)&self[1]._indexCount = v39;
    int v53 = v34 && v33;
    *(_OWORD *)&self[1]._instanceCount = v42;
    *(_OWORD *)&self[1]._indexType = v44;
    if (!v26) {
      goto LABEL_38;
    }
    long long v55 = LABEL_42:;
    [v35 failWithError:v55];
    goto LABEL_43;
  }
  int v53 = 0;
  *(_OWORD *)&self[1]._instanceCount = 0u;
  *(_OWORD *)&self[1]._indexType = 0u;
  *(_OWORD *)&self[1].super.isa = 0u;
  *(_OWORD *)&self[1]._indexCount = 0u;
  if (v26) {
    goto LABEL_42;
  }
LABEL_38:
  if ((v53 & v24 & 1) == 0) {
    goto LABEL_40;
  }
  long long v54 = self;
LABEL_44:

  return v54;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  [v10 encodeObject:self->_name forKey:@"name"];
  [v10 encodeInteger:self->_vertexCount forKey:@"vertexCount"];
  [v10 encodeInteger:self->_instanceCount forKey:@"instanceCount"];
  [v10 encodeInteger:self->_preSplitVertexCount forKey:@"preSplitVertexCount"];
  [v10 encodeInteger:self->_patchCount forKey:@"patchCount"];
  [v10 encodeObject:self->_coreAttributes forKey:@"coreAttributes"];
  [v10 encodeObject:self->_customAttributes forKey:@"customAttributes"];
  [v10 encodeInteger:self->_indexPayloadOffset forKey:@"indexPayloadOffset"];
  [v10 encodeInteger:self->_indexCount forKey:@"indexCount"];
  [v10 encodeBool:self->_isIndexed forKey:@"isIndexed"];
  [v10 encodeInteger:self->_indexType forKey:@"indexType"];
  [v10 encodeInteger:self->_materialIndex forKey:@"materialIndex"];
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
  [v10 encodeInteger:self->_doubleSidedFlag forKey:@"doubleSidedFlag"];
  [v10 encodeInteger:self->_windingOrderIsCCW forKey:@"windingOrderIsCCW"];
  [v10 encodeBytes:&self[1] length:64 forKey:@"transform"];
}

- (BOOL)validateAttribute:(id)a3 withName:(id)a4 payloadSize:(FixedInlineArray<unsigned)long required:(8UL> *)a5 error:(BOOL)a6
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  unsigned __int8 v14 = v13;
  if (!v12)
  {
    if (!v8) {
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  BOOL v15 = (_anonymous_namespace_ *)[v13 UTF8String];
  uint64_t v25 = 0;
  BOOL v26 = "";
  unsigned int v17 = re::bufferIdentifierForMeshAttribute((re *)&v25, v16);
  re::StringID::destroyString((re::StringID *)&v25);
  if (v17 < 8)
  {
    if ([v12 validateWithPayloadSize:a5->var0[v17] error:a7])
    {
      uint64_t v19 = [v12 stepFunction];
      if (v19 == 3)
      {
        unsigned int v21 = [v12 count];
        unsigned int patchCount = self->_patchCount;
      }
      else
      {
        if (v19 != 1)
        {
          if (v19)
          {
            uint64_t v20 = @"REMeshAttributeDescriptor: unsupported vertex step function";
            goto LABEL_17;
          }
          if (![v12 count])
          {
            uint64_t v20 = @"REMeshAttributeDescriptor: vertex count is 0";
LABEL_17:
            goto LABEL_18;
          }
          goto LABEL_15;
        }
        unsigned int v21 = [v12 count];
        unsigned int patchCount = self->_vertexCount;
      }
      if (v21 < patchCount)
      {
        uint64_t v20 = @"REMeshAttributeDescriptor: attribute buffer is too small";
        goto LABEL_17;
      }
LABEL_15:
      BOOL v23 = 1;
LABEL_19:

      return v23;
    }
LABEL_18:
    BOOL v23 = 0;
    goto LABEL_19;
  }
  re::internal::assertLog((re::internal *)6, v18, "assertion failure: '%s' (%s:line %i) Index out of range. index = %zu, size = %zu", "index < N", "operator[]", 234, v17, 8, v25, v26);
  BOOL result = _os_crash();
  __break(1u);
  return result;
}

- (BOOL)validateWithPayloadSize:(const void *)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (self->_isIndexed)
  {
    if (self->_indexCount == -1)
    {
      double v9 = @"REMeshPartDescriptor: index count is UINT32_MAX";
      goto LABEL_12;
    }
    unint64_t indexPayloadOffset = self->_indexPayloadOffset;
    unint64_t v7 = [(REMeshPartDescriptor *)self indexBufferSize];
    if (__CFADD__(indexPayloadOffset, v7)
      || (unint64_t v8 = *((void *)a3 + 4), v8 <= indexPayloadOffset)
      || indexPayloadOffset + v7 > v8)
    {
      double v9 = @"REMeshPartDescriptor: index buffer payload range is invalid";
      goto LABEL_12;
    }
  }
  if (self->_vertexCount + 1 <= 1)
  {
    double v9 = @"REMeshPartDescriptor: vertex count must be between 1 and UINT32_MAX";
LABEL_12:
    return 0;
  }
  if (self->_instanceCount + 1 <= 1)
  {
    double v9 = @"REMeshPartDescriptor: instance count must be between 1 and UINT32_MAX";
    goto LABEL_12;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = +[REMeshPartDescriptor coreAttributeNames];
  uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v42;
    LOBYTE(v13) = 1;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(obj);
        }
        BOOL v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v16 = [NSString stringWithUTF8String:"vertexPosition"];
        uint64_t v17 = [v15 isEqualToString:v16];

        if (v13)
        {
          uint64_t v18 = [(NSDictionary *)self->_coreAttributes objectForKeyedSubscript:v15];
          long long v19 = *((_OWORD *)a3 + 1);
          v40[0] = *(_OWORD *)a3;
          v40[1] = v19;
          long long v20 = *((_OWORD *)a3 + 3);
          void v40[2] = *((_OWORD *)a3 + 2);
          v40[3] = v20;
          BOOL v13 = [(REMeshPartDescriptor *)self validateAttribute:v18 withName:v15 payloadSize:v40 required:v17 error:a4];
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v11);
  }
  else
  {
    BOOL v13 = 1;
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obja = self->_customAttributes;
  uint64_t v21 = [(NSDictionary *)obja countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(obja);
        }
        uint64_t v24 = *(void *)(*((void *)&v36 + 1) + 8 * j);
        uint64_t v25 = +[REMeshPartDescriptor coreAttributeNames];
        int v26 = [v25 containsObject:v24];

        if ((v26 & v13) == 1)
        {
          int v27 = [NSString stringWithFormat:@"REMeshPartDescriptor: custom attribute %@ is also in core attributes list", v24];

          int v28 = 0;
        }
        else
        {
          int v28 = (v26 ^ 1) & v13;
        }
        int v29 = [(NSDictionary *)self->_customAttributes objectForKeyedSubscript:v24];
        if (v28)
        {
          long long v30 = *((_OWORD *)a3 + 1);
          v35[0] = *(_OWORD *)a3;
          v35[1] = v30;
          long long v31 = *((_OWORD *)a3 + 3);
          v35[2] = *((_OWORD *)a3 + 2);
          v35[3] = v31;
          BOOL v13 = [(REMeshPartDescriptor *)self validateAttribute:v29 withName:v24 payloadSize:v35 required:1 error:a4];
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      uint64_t v21 = [(NSDictionary *)obja countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v21);
  }

  if (!v13) {
    return 0;
  }
  if (self->_materialIndex >= 0xFFFF)
  {
    return 0;
  }
  return 1;
}

- (unint64_t)indexBufferSize
{
  unint64_t indexType = self->_indexType;
  if (!indexType)
  {
    unsigned int v3 = 2;
    return v3 * (unint64_t)self->_indexCount;
  }
  if (indexType == 1)
  {
    unsigned int v3 = 4;
    return v3 * (unint64_t)self->_indexCount;
  }
  re::internal::assertLog((re::internal *)5, (uint64_t)a2, "assertion failure: '%s' (%s:line %i) Invalid index type: %d", "false", "-[REMeshPartDescriptor indexBufferSize]", 685, self->_indexType);
  unint64_t result = _os_crash();
  __break(1u);
  return result;
}

- (unint64_t)estimateContainerSize
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  unsigned int v3 = (objc_class *)objc_opt_class();
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
  if (self->_coreAttributes)
  {
    double v9 = (objc_class *)objc_opt_class();
    size_t v10 = class_getInstanceSize(v9);
    coreAttributes = self->_coreAttributes;
  }
  else
  {
    coreAttributes = 0;
    size_t v10 = 0;
  }
  uint64_t v12 = [(NSDictionary *)coreAttributes count];
  NSUInteger v13 = [(NSDictionary *)self->_coreAttributes count];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  unsigned __int8 v14 = [(NSDictionary *)self->_coreAttributes allKeys];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v56 objects:v63 count:16];
  uint64_t v16 = v8 + InstanceSize + v10 + 8 * v12 + 8 * v13;
  if (v15)
  {
    uint64_t v17 = *(void *)v57;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v57 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v56 + 1) + 8 * v18);
        if (v19)
        {
          long long v20 = (objc_class *)objc_opt_class();
          v16 += class_getInstanceSize(v20);
          uint64_t v21 = [v19 lengthOfBytesUsingEncoding:4] + 1;
        }
        else
        {
          uint64_t v21 = 0;
        }
        v16 += v21;
        ++v18;
      }
      while (v15 != v18);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v56 objects:v63 count:16];
    }
    while (v15);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v22 = [(NSDictionary *)self->_coreAttributes allValues];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v53;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v53 != v24) {
          objc_enumerationMutation(v22);
        }
        v16 += [*(id *)(*((void *)&v52 + 1) + 8 * v25++) estimateContainerSize];
      }
      while (v23 != v25);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v52 objects:v62 count:16];
    }
    while (v23);
  }

  if (self->_customAttributes)
  {
    int v26 = (objc_class *)objc_opt_class();
    size_t v27 = class_getInstanceSize(v26);
    customAttributes = self->_customAttributes;
  }
  else
  {
    customAttributes = 0;
    size_t v27 = 0;
  }
  uint64_t v29 = [(NSDictionary *)customAttributes count];
  NSUInteger v30 = [(NSDictionary *)self->_customAttributes count];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v31 = [(NSDictionary *)self->_customAttributes allKeys];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v48 objects:v61 count:16];
  unint64_t v33 = v27 + v16 + 8 * v29 + 8 * v30;
  if (v32)
  {
    uint64_t v34 = *(void *)v49;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v49 != v34) {
          objc_enumerationMutation(v31);
        }
        long long v36 = *(void **)(*((void *)&v48 + 1) + 8 * v35);
        if (v36)
        {
          long long v37 = (objc_class *)objc_opt_class();
          v33 += class_getInstanceSize(v37);
          uint64_t v38 = [v36 lengthOfBytesUsingEncoding:4] + 1;
        }
        else
        {
          uint64_t v38 = 0;
        }
        v33 += v38;
        ++v35;
      }
      while (v32 != v35);
      uint64_t v32 = [v31 countByEnumeratingWithState:&v48 objects:v61 count:16];
    }
    while (v32);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v39 = [(NSDictionary *)self->_customAttributes allValues];
  uint64_t v40 = [v39 countByEnumeratingWithState:&v44 objects:v60 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v45;
    do
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void *)v45 != v41) {
          objc_enumerationMutation(v39);
        }
        v33 += [*(id *)(*((void *)&v44 + 1) + 8 * v42++) estimateContainerSize];
      }
      while (v40 != v42);
      uint64_t v40 = [v39 countByEnumeratingWithState:&v44 objects:v60 count:16];
    }
    while (v40);
  }

  return v33;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)indexPayloadOffset
{
  return self->_indexPayloadOffset;
}

- (unsigned)indexCount
{
  return self->_indexCount;
}

- (BOOL)isIndexed
{
  return self->_isIndexed;
}

- (unint64_t)indexType
{
  return self->_indexType;
}

- (unsigned)vertexCount
{
  return self->_vertexCount;
}

- (NSDictionary)coreAttributes
{
  return self->_coreAttributes;
}

- (NSDictionary)customAttributes
{
  return self->_customAttributes;
}

- (unsigned)preSplitVertexCount
{
  return self->_preSplitVertexCount;
}

- (unsigned)patchCount
{
  return self->_patchCount;
}

- (unsigned)instanceCount
{
  return self->_instanceCount;
}

- (unsigned)materialIndex
{
  return self->_materialIndex;
}

- (__n128)boundingBoxMin
{
  return a1[5];
}

- (__n128)boundingBoxMax
{
  return a1[6];
}

- (unsigned)doubleSidedFlag
{
  return self->_doubleSidedFlag;
}

- (unsigned)windingOrderIsCCW
{
  return self->_windingOrderIsCCW;
}

- (__n128)transform
{
  return a1[7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customAttributes, 0);
  objc_storeStrong((id *)&self->_coreAttributes, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end