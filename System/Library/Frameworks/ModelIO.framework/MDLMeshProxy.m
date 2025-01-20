@interface MDLMeshProxy
+ (BOOL)supportsSecureCoding;
- (MDLMeshProxy)initWithCoder:(id)a3;
- (MDLMeshProxy)initWithVertexBuffers:(id)a3 vertexCount:(unint64_t)a4 descriptor:(id)a5 submeshes:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MDLMeshProxy

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend_encodeObject_forKey_(v8, v4, (uint64_t)self->super._allocator, @"allocator");
  objc_msgSend_encodeInteger_forKey_(v8, v5, self->super._vertexCount, @"vertexCount");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend_encodeMeshBuffers_withCoder_forKey_(self->super._allocator, v6, (uint64_t)self->super._vertexBuffers, v8, @"vertexBuffers");
  }
  objc_msgSend_encodeVertexDescriptorWithCoder_(self->super._vertexDescriptor, v6, (uint64_t)v8);
  objc_msgSend_encodeObject_forKey_(v8, v7, (uint64_t)self->super._submeshes, @"submeshes");
}

- (MDLMeshProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v10 = objc_msgSend_setWithObjects_(v5, v9, v6, v7, v8, 0);
  uint64_t v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"allocator");
  v13 = (MDLMeshBufferAllocator *)objc_claimAutoreleasedReturnValue();
  allocator = self->super._allocator;
  self->super._allocator = v13;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_decodeMeshBuffersWithCoder_forKey_(self->super._allocator, v15, (uint64_t)v4, @"vertexBuffers");
    v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    vertexBuffers = self->super._vertexBuffers;
    self->super._vertexBuffers = v16;
  }
  self->super._vertexCount = objc_msgSend_decodeIntegerForKey_(v4, v15, @"vertexCount");
  objc_msgSend_decodeVertexDescriptorWithCoder_(MDLVertexDescriptor, v18, (uint64_t)v4);
  v19 = (MDLVertexDescriptor *)objc_claimAutoreleasedReturnValue();
  vertexDescriptor = self->super._vertexDescriptor;
  self->super._vertexDescriptor = v19;

  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v21, (uint64_t)v10, @"submeshes");
  v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  submeshes = self->super._submeshes;
  self->super._submeshes = v22;

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MDLMeshProxy)initWithVertexBuffers:(id)a3 vertexCount:(unint64_t)a4 descriptor:(id)a5 submeshes:(id)a6
{
  uint64_t v133 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v113 = a5;
  v111 = v9;
  id v112 = a6;
  v129.receiver = self;
  v129.super_class = (Class)MDLMeshProxy;
  v115 = [(MDLObject *)&v129 init];
  if (!v115)
  {
    v90 = 0;
    goto LABEL_48;
  }
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v10 = v9;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v125, v132, 16);
  if (!v14) {
    goto LABEL_13;
  }
  uint64_t v15 = *(void *)v126;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v126 != v15) {
        objc_enumerationMutation(v10);
      }
      v17 = *(void **)(*((void *)&v125 + 1) + 8 * i);
      v18 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v13);
      if ((objc_msgSend_isEqual_(v17, v19, (uint64_t)v18) & 1) == 0)
      {
        BOOL v22 = objc_msgSend_type(v17, v20, v21) == 1;

        if (v22) {
          continue;
        }
        v23 = (void *)MEMORY[0x263EFF940];
        v24 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v24);
        v25 = NSStringFromSelector(a2);
        objc_msgSend_raise_format_(v23, v26, @"ModelIOException", @"[%@ %@]: vertexBuffer.type must be MDLMeshBufferTypeVertex", v18, v25);
      }
    }
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v125, v132, 16);
  }
  while (v14);
LABEL_13:

  v29 = v113;
  if (!v113)
  {
    v30 = (void *)MEMORY[0x263EFF940];
    v31 = (objc_class *)objc_opt_class();
    v32 = NSStringFromClass(v31);
    v33 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v30, v34, @"ModelIOException", @"[%@ %@]: No descriptor supplied", v32, v33);

    v29 = 0;
  }
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  v35 = objc_msgSend_attributes(v29, v27, v28);
  uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v121, v131, 16);
  if (v39)
  {
    uint64_t v40 = *(void *)v122;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v122 != v40) {
          objc_enumerationMutation(v35);
        }
        v42 = *(void **)(*((void *)&v121 + 1) + 8 * j);
        v43 = objc_msgSend_null(MEMORY[0x263EFF9D0], v37, v38);
        char isEqual = objc_msgSend_isEqual_(v42, v44, (uint64_t)v43);

        if ((isEqual & 1) == 0)
        {
          unint64_t v46 = objc_msgSend_bufferIndex(v42, v37, v38);
          if (v46 > objc_msgSend_count(v10, v47, v48))
          {
            v49 = (void *)MEMORY[0x263EFF940];
            v50 = (objc_class *)objc_opt_class();
            v51 = NSStringFromClass(v50);
            v52 = NSStringFromSelector(a2);
            objc_msgSend_raise_format_(v49, v53, @"ModelIOException", @"[%@ %@]: Buffer index out of range", v51, v52);
          }
        }
      }
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v37, (uint64_t)&v121, v131, 16);
    }
    while (v39);
  }

  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v54 = v10;
  v56 = 0;
  uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v117, v130, 16);
  if (v59)
  {
    uint64_t v60 = *(void *)v118;
    do
    {
      for (uint64_t k = 0; k != v59; ++k)
      {
        if (*(void *)v118 != v60) {
          objc_enumerationMutation(v54);
        }
        if (!v56)
        {
          v62 = *(void **)(*((void *)&v117 + 1) + 8 * k);
          v63 = objc_msgSend_null(MEMORY[0x263EFF9D0], v57, v58);
          if (objc_msgSend_isEqual_(v62, v64, (uint64_t)v63))
          {
          }
          else
          {
            v67 = objc_msgSend_allocator(v62, v65, v66);
            BOOL v68 = v67 == 0;

            if (!v68)
            {
              v56 = objc_msgSend_allocator(v62, v57, v58);
              continue;
            }
          }
          v56 = 0;
        }
      }
      uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v57, (uint64_t)&v117, v130, 16);
    }
    while (v59);
  }

  for (unint64_t m = 0; objc_msgSend_count(v54, v69, v70) > m; ++m)
  {
    v73 = objc_msgSend_objectAtIndexedSubscript_(v54, v72, m);
    v76 = objc_msgSend_null(MEMORY[0x263EFF9D0], v74, v75);
    char v78 = objc_msgSend_isEqual_(v73, v77, (uint64_t)v76);

    if ((v78 & 1) == 0)
    {
      v79 = objc_msgSend_objectAtIndexedSubscript_(v54, v69, m);
      v82 = objc_msgSend_allocator(v79, v80, v81);
      BOOL v83 = v82 == v56;

      if (!v83)
      {
        v84 = (void *)MEMORY[0x263EFF940];
        v85 = (objc_class *)objc_opt_class();
        v86 = NSStringFromClass(v85);
        v87 = NSStringFromSelector(a2);
        objc_msgSend_raise_format_(v84, v88, @"ModelIOException", @"[%@ %@]: Allocators on supplied vertexBuffers do not all match, but they must", v86, v87);
      }
    }
  }
  v116.receiver = v115;
  v116.super_class = (Class)MDLMeshProxy;
  v89 = [(MDLObject *)&v116 init];
  v90 = v89;
  if (v89)
  {
    __asm { FMOV            V1.4S, #-1.0 }
    *(_OWORD *)v89->super._anon_50 = _Q1;
    *(_OWORD *)&v89->super._anon_50[16] = 0u;
    objc_storeStrong((id *)&v89->super._allocator, v56);
    v90->super._vertexCount = a4;
    id v96 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v98 = objc_msgSend_initWithArray_(v96, v97, (uint64_t)v54);
    vertexBuffers = v90->super._vertexBuffers;
    v90->super._vertexBuffers = (NSMutableArray *)v98;

    uint64_t v100 = MEMORY[0x2105306E0]();
    uint64_t v102 = objc_msgSend_copyWithZone_(v113, v101, v100);
    vertexDescriptor = v90->super._vertexDescriptor;
    v90->super._vertexDescriptor = (MDLVertexDescriptor *)v102;

    id v104 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v106 = objc_msgSend_initWithArray_(v104, v105, (uint64_t)v112);
    submeshes = v90->super._submeshes;
    v90->super._submeshes = (NSMutableArray *)v106;

    v108 = v90;
  }

LABEL_48:
  return v90;
}

@end