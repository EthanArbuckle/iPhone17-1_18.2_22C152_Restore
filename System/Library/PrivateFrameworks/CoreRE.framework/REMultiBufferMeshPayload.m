@interface REMultiBufferMeshPayload
+ (BOOL)supportsSecureCoding;
- (BOOL)isLimitedRenderAsset;
- (BOOL)isShareable;
- (DRMemoryResource)privatePayload;
- (DRMemoryResource)sharedPayload;
- (FixedInlineArray<NS::SharedPtr<MTL::Buffer>,)meshPayloadBuffersWithDevice:(REMultiBufferMeshPayload *)self;
- (FixedInlineArray<unsigned)payloadBufferSizes;
- (NSArray)instances;
- (NSArray)models;
- (NSArray)parts;
- (NSArray)skeletons;
- (REMultiBufferMeshPayload)initWithCoder:(id)a3;
- (REMultiBufferMeshPayload)initWithPayload:(id)a3 privatePayload:(id)a4 parts:(id)a5 models:(id)a6 instances:(id)a7 skeletons:(id)a8 isLimitedRenderAsset:(BOOL)a9;
- (unint64_t)estimatePayloadContainerOverheadSize;
- (unint64_t)totalPayloadSize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMultiBufferMeshPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMultiBufferMeshPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v42.receiver = self;
    v42.super_class = (Class)REMultiBufferMeshPayload;
    self = [(RESharedResourcePayload *)&v42 initWithCoder:v4];
    if (self)
    {
      v6 = (void *)MEMORY[0x263EFFA08];
      uint64_t v7 = objc_opt_class();
      v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
      v9 = [v4 decodeObjectOfClasses:v8 forKey:@"parts"];
      parts = self->_parts;
      self->_parts = v9;

      v11 = (void *)MEMORY[0x263EFFA08];
      uint64_t v12 = objc_opt_class();
      v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
      v14 = [v4 decodeObjectOfClasses:v13 forKey:@"models"];
      models = self->_models;
      self->_models = v14;

      v16 = (void *)MEMORY[0x263EFFA08];
      uint64_t v17 = objc_opt_class();
      v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
      v19 = [v4 decodeObjectOfClasses:v18 forKey:@"instances"];
      instances = self->_instances;
      self->_instances = v19;

      v21 = (void *)MEMORY[0x263EFFA08];
      uint64_t v22 = objc_opt_class();
      v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
      v24 = [v4 decodeObjectOfClasses:v23 forKey:@"skeletons"];
      skeletons = self->_skeletons;
      self->_skeletons = v24;

      v26 = [v4 decodeXPCObjectOfType:MEMORY[0x263EF8708] forKey:@"private"];
      if (v26)
      {
        v27 = (DRMemoryResource *)DRMemoryResourceCreateFromXPC();
        privatePayload = self->_privatePayload;
        self->_privatePayload = v27;
      }
      else
      {
        privatePayload = self->_privatePayload;
        self->_privatePayload = 0;
      }

      v30 = [v4 decodeXPCObjectOfType:MEMORY[0x263EF8708] forKey:@"shared"];
      if (v30)
      {
        v31 = (DRMemoryResource *)DRMemoryResourceCreateFromXPC();
        sharedPayload = self->_sharedPayload;
        self->_sharedPayload = v31;
      }
      else
      {
        sharedPayload = self->_sharedPayload;
        self->_sharedPayload = 0;
      }

      self->_isLimitedRenderAsset = [v4 decodeBoolForKey:@"isLimitedRenderAsset"];
      if (!self->_privatePayload && !self->_sharedPayload {
        || !self->_parts
      }
        || !self->_models
        || !self->_instances
        || !self->_skeletons
        v29 = {;
        [v4 failWithError:v29];
        goto LABEL_22;
      }
      if (self->_privatePayload)
      {
        if ((DRMemoryResourceIsPrivateToProcess() & 1) == 0) {
          v29 = {;
        }
          [v4 failWithError:v29];
          goto LABEL_22;
        }
        uint64_t Bytes = DRMemoryResourceGetBytes();
        unint64_t Length = DRMemoryResourceGetLength();
          goto LABEL_20;
      }
      else
      {
        uint64_t v40 = DRMemoryResourceGetBytes();
        unint64_t v41 = DRMemoryResourceGetLength();
        {
          v29 = LABEL_20:;
          [v4 failWithError:v29];
          goto LABEL_22;
        }
      }
    }
    self = self;
    v38 = self;
    goto LABEL_23;
  v29 = };
  [v4 failWithError:v29];
LABEL_22:

  v38 = 0;
LABEL_23:

  return v38;
}

- (REMultiBufferMeshPayload)initWithPayload:(id)a3 privatePayload:(id)a4 parts:(id)a5 models:(id)a6 instances:(id)a7 skeletons:(id)a8 isLimitedRenderAsset:(BOOL)a9
{
  id v34 = a3;
  id v33 = a4;
  id v37 = a5;
  id v36 = a6;
  id v16 = a7;
  id v35 = a8;
  v39.receiver = self;
  v39.super_class = (Class)REMultiBufferMeshPayload;
  uint64_t v17 = [(RESharedResourcePayload *)&v39 init];
  v18 = v17;
  if (v17)
  {
    p_privatePayload = (uint64_t *)&v17->_privatePayload;
    objc_storeStrong((id *)&v17->_privatePayload, a4);
    objc_storeStrong((id *)&v18->_sharedPayload, a3);
    uint64_t v20 = [v37 copy];
    parts = v18->_parts;
    v18->_parts = (NSArray *)v20;

    uint64_t v22 = [v36 copy];
    models = v18->_models;
    v18->_models = (NSArray *)v22;

    uint64_t v24 = [v16 copy];
    instances = v18->_instances;
    v18->_instances = (NSArray *)v24;

    uint64_t v26 = [v35 copy];
    skeletons = v18->_skeletons;
    v18->_skeletons = (NSArray *)v26;

    v18->_isLimitedRenderAsset = a9;
    uint64_t IsPrivateToProcess = *p_privatePayload;
    if (*p_privatePayload)
    {
      uint64_t IsPrivateToProcess = DRMemoryResourceIsPrivateToProcess();
      if ((IsPrivateToProcess & 1) == 0)
      {
        v29 = *re::assetTypesLogObjects((re *)IsPrivateToProcess);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v30 = "Private data is expected to be private";
LABEL_16:
          _os_log_fault_impl(&dword_233120000, v29, OS_LOG_TYPE_FAULT, v30, buf, 2u);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
    }
    else if (!v18->_sharedPayload)
    {
      v29 = *re::assetTypesLogObjects(0);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v30 = "Expected at least one of private and shared data to be non-nil";
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    if (!v18->_parts || !v18->_models || !v18->_instances || !v18->_skeletons)
    {
      v29 = *re::assetTypesLogObjects((re *)IsPrivateToProcess);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v30 = "Expected non-nil arrays for mesh parts, models, instances, and skeletons";
        goto LABEL_16;
      }
LABEL_17:
      v31 = 0;
      goto LABEL_18;
    }
  }
  v31 = v18;
LABEL_18:

  return v31;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    if (self->_privatePayload)
    {
      v6 = (void *)DRMemoryResourceCopyToXPC();
      [v4 encodeXPCObject:v6 forKey:@"private"];
    }
    if (self->_sharedPayload)
    {
      uint64_t v7 = (void *)DRMemoryResourceCopyToXPC();
      [v4 encodeXPCObject:v7 forKey:@"shared"];
    }
    [v4 encodeObject:self->_parts forKey:@"parts"];
    [v4 encodeObject:self->_models forKey:@"models"];
    [v4 encodeObject:self->_instances forKey:@"instances"];
    [v4 encodeObject:self->_skeletons forKey:@"skeletons"];
    [v4 encodeBool:self->_isLimitedRenderAsset forKey:@"isLimitedRenderAsset"];
  }
  else
  {
    v8 = *re::assetTypesLogObjects((re *)isKindOfClass);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_233120000, v8, OS_LOG_TYPE_FAULT, "REMultiBufferMeshPayload requires an NSXPCCoder", v9, 2u);
    }
  }
}

- (FixedInlineArray<NS::SharedPtr<MTL::Buffer>,)meshPayloadBuffersWithDevice:(REMultiBufferMeshPayload *)self
{
  id v6 = a4;
  {
    *(_OWORD *)&retstr->var0[4].var0 = 0u;
    *(_OWORD *)&retstr->var0[6].var0 = 0u;
    *(_OWORD *)&retstr->var0[0].var0 = 0u;
    *(_OWORD *)&retstr->var0[2].var0 = 0u;
    goto LABEL_23;
  }
  id v16 = 0;
  id v17 = 0;
  sharedPayload = self->_sharedPayload;
  if (self->_privatePayload)
  {
    if (sharedPayload)
    {
      v8 = (void *)DRMemoryResourceCopyBuffer();
      id v15 = v8;
      NS::SharedPtr<MTL::Texture>::operator=(&v17, &v15);
      if (v15)
      {

        id v15 = 0;
      }

      v9 = (void *)DRMemoryResourceCopyBuffer();
      id v15 = 0;
      id v15 = v9;
      NS::SharedPtr<MTL::Texture>::operator=(&v16, &v15);
      if (v15)
      {

        id v15 = 0;
      }

LABEL_13:
      uint64_t v11 = 0;
      *(_OWORD *)&retstr->var0[4].var0 = 0u;
      *(_OWORD *)&retstr->var0[6].var0 = 0u;
      *(_OWORD *)&retstr->var0[0].var0 = 0u;
      *(_OWORD *)&retstr->var0[2].var0 = 0u;
      uint64_t v12 = retstr;
      do
      {
        if ((v11 & 0xFFFFFFFC) == 4) {
          v13 = &v17;
        }
        else {
          v13 = &v16;
        }
        NS::SharedPtr<MTL::Texture>::operator=((void **)v12, v13);
        ++v11;
        uint64_t v12 = (FixedInlineArray<NS::SharedPtr<MTL::Buffer>, 8UL> *)((char *)v12 + 8);
      }
      while (v11 != 8);
      if (v16) {

      }
      goto LABEL_21;
    }
LABEL_11:
    id v15 = (id)DRMemoryResourceCopyBuffer();
    v10 = NS::SharedPtr<MTL::Texture>::operator=(&v16, &v15);
    NS::SharedPtr<MTL::Texture>::operator=(&v17, v10);
    if (v15) {

    }
    goto LABEL_13;
  }
  if (sharedPayload) {
    goto LABEL_11;
  }
  *(_OWORD *)&retstr->var0[4].var0 = 0u;
  *(_OWORD *)&retstr->var0[6].var0 = 0u;
  *(_OWORD *)&retstr->var0[0].var0 = 0u;
  *(_OWORD *)&retstr->var0[2].var0 = 0u;
LABEL_21:
  if (v17) {

  }
LABEL_23:
  return result;
}

- (unint64_t)estimatePayloadContainerOverheadSize
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v3 = (objc_class *)objc_opt_class();
  size_t InstanceSize = class_getInstanceSize(v3);
  id v4 = self;
  v5 = (objc_class *)objc_opt_class();
  size_t v39 = class_getInstanceSize(v5);
  id v6 = (objc_class *)objc_opt_class();
  size_t v7 = class_getInstanceSize(v6);
  v8 = (objc_class *)objc_opt_class();
  size_t v9 = class_getInstanceSize(v8);
  v10 = (objc_class *)objc_opt_class();
  size_t v11 = class_getInstanceSize(v10);
  uint64_t v12 = [(REMultiBufferMeshPayload *)v4 parts];
  uint64_t v13 = [v12 count];

  v14 = [(REMultiBufferMeshPayload *)v4 models];
  uint64_t v15 = [v14 count];

  id v16 = [(REMultiBufferMeshPayload *)v4 instances];
  uint64_t v17 = [v16 count];

  v18 = [(REMultiBufferMeshPayload *)v4 skeletons];
  uint64_t v19 = [v18 count];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v20 = [(REMultiBufferMeshPayload *)v4 parts];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v52 objects:v59 count:16];
  uint64_t v22 = v7 + v39 + v9 + v11 + 8 * (v15 + v13 + v17) + 8 * v19;
  if (v21)
  {
    uint64_t v23 = *(void *)v53;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v53 != v23) {
          objc_enumerationMutation(v20);
        }
        v22 += objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * v24++), "estimateContainerSize", InstanceSize);
      }
      while (v21 != v24);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v52 objects:v59 count:16];
    }
    while (v21);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v25 = [(REMultiBufferMeshPayload *)v4 models];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v49;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v49 != v27) {
          objc_enumerationMutation(v25);
        }
        v22 += objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * v28++), "estimateContainerSize", InstanceSize);
      }
      while (v26 != v28);
      uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v26);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v29 = [(REMultiBufferMeshPayload *)v4 instances];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v44 objects:v57 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v45;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(v29);
        }
        v22 += objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * v32++), "estimateContainerSize", InstanceSize);
      }
      while (v30 != v32);
      uint64_t v30 = [v29 countByEnumeratingWithState:&v44 objects:v57 count:16];
    }
    while (v30);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v33 = [(REMultiBufferMeshPayload *)v4 skeletons];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v40 objects:v56 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v41;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v41 != v35) {
          objc_enumerationMutation(v33);
        }
        v22 += objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * v36++), "estimateContainerSize", InstanceSize);
      }
      while (v34 != v36);
      uint64_t v34 = [v33 countByEnumeratingWithState:&v40 objects:v56 count:16];
    }
    while (v34);
  }

  return v22 + InstanceSize;
}

- (FixedInlineArray<unsigned)payloadBufferSizes
{
  *(_OWORD *)&retstr->var0[4] = 0u;
  *(_OWORD *)&retstr->var0[6] = 0u;
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[2] = 0u;
  if (self->_sharedPayload || (result = (FixedInlineArray<unsigned long, 8UL> *)self->_privatePayload) != 0)
  {
    unint64_t Length = DRMemoryResourceGetLength();
    result = (FixedInlineArray<unsigned long, 8UL> *)DRMemoryResourceGetLength();
    uint64_t v6 = 0;
    int8x16_t v7 = (int8x16_t)vdupq_n_s64((unint64_t)result);
    int64x2_t v8 = (int64x2_t)xmmword_234361D20;
    int8x16_t v9 = (int8x16_t)vdupq_n_s64(Length);
    int8x16_t v10 = (int8x16_t)vdupq_n_s64(0xFFFFFFFCuLL);
    int64x2_t v11 = vdupq_n_s64(4uLL);
    int64x2_t v12 = vdupq_n_s64(2uLL);
    do
    {
      *(int8x16_t *)&retstr->var0[v6] = vbslq_s8((int8x16_t)vceqq_s64((int64x2_t)vandq_s8((int8x16_t)v8, v10), v11), v7, v9);
      int64x2_t v8 = vaddq_s64(v8, v12);
      v6 += 2;
    }
    while (v6 != 8);
  }
  return result;
}

- (unint64_t)totalPayloadSize
{
  if (self->_sharedPayload) {
    uint64_t Length = DRMemoryResourceGetLength();
  }
  else {
    uint64_t Length = 0;
  }
  uint64_t privatePayload = (uint64_t)self->_privatePayload;
  if (privatePayload) {
    uint64_t privatePayload = DRMemoryResourceGetLength();
  }
  return privatePayload + Length;
}

- (BOOL)isShareable
{
  return 1;
}

- (NSArray)parts
{
  return self->_parts;
}

- (NSArray)models
{
  return self->_models;
}

- (NSArray)instances
{
  return self->_instances;
}

- (NSArray)skeletons
{
  return self->_skeletons;
}

- (BOOL)isLimitedRenderAsset
{
  return self->_isLimitedRenderAsset;
}

- (DRMemoryResource)privatePayload
{
  return self->_privatePayload;
}

- (DRMemoryResource)sharedPayload
{
  return self->_sharedPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skeletons, 0);
  objc_storeStrong((id *)&self->_instances, 0);
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_parts, 0);
  objc_storeStrong((id *)&self->_sharedPayload, 0);
  objc_storeStrong((id *)&self->_privatePayload, 0);
}

@end