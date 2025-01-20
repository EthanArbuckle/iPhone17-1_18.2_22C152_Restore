@interface REMeshSkinningModelDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)validateWithPayloadSize:(const void *)a3 parts:(id)a4 partIndices:(id)a5 skeletonCount:(unint64_t)a6 error:(id *)a7;
- (NSArray)inverseBindPoseAttributes;
- (NSArray)skinningParts;
- (REMeshSkinningModelDescriptor)initWithCoder:(id)a3;
- (REMeshSkinningModelDescriptor)initWithInverseBindPoseAttributes:(id)a3 skinningParts:(id)a4;
- (REMeshSkinningModelDescriptor)initWithMeshSkinningData:(const void *)a3 meshParts:(Slice<re:(id)a5 :(void *)a6 MeshAssetPart>)a4 inverseBindPoseAttributes:(void *)a7 deformerBuilders:payloadBuilder:;
- (REMeshSkinningModelDescriptor)initWithSkinningAttributeDescriptor:(const void *)a3 inverseBindPoseAttributes:(id)a4 payloadBuilder:(void *)a5;
- (REMeshSkinningModelDescriptor)initWithSkinningData:(const void *)a3 inverseBindPoseAttributes:(id)a4 deformerBuilders:(void *)a5 payloadBuilder:(void *)a6;
- (unint64_t)estimateContainerSize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMeshSkinningModelDescriptor

- (REMeshSkinningModelDescriptor)initWithMeshSkinningData:(const void *)a3 meshParts:(Slice<re:(id)a5 :(void *)a6 MeshAssetPart>)a4 inverseBindPoseAttributes:(void *)a7 deformerBuilders:payloadBuilder:
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v33 = (_anonymous_namespace_ *)a5;
  *((void *)a6 + 1) = 0;
  *((void *)a6 + 2) = 0;
  v37 = (char *)a6 + 24;
  v32 = (uint64_t *)a6;
  uint64_t v36 = *((void *)a3 + 2);
  if (v36)
  {
    unint64_t v10 = 0;
    v11 = "simplifiedAnimationSkinningInfluences";
    v35 = a3;
    do
    {
      if (*((void *)a3 + 2) <= v10)
      {
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v44 = 0u;
        os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        _os_log_send_and_compose_impl();
        _os_crash_msg();
        __break(1u);
LABEL_20:
        re::internal::assertLog((re::internal *)6, v9, "assertion failure: '%s' (%s:line %i) Index out of range. index = %zu, size = %zu", "index < size()", "operator[]", 251, a4.var1, a4.var1);
        _os_crash();
        __break(1u);
      }
      if (v10 == a4.var1) {
        goto LABEL_20;
      }
      uint64_t v42 = *((void *)a3 + 4);
      v12 = (char *)a4.var0 + 256 * v10;
      uint64_t v13 = *((void *)v12 + 2);
      if (v13)
      {
        unint64_t v14 = 0;
        uint64_t v15 = 0;
        unint64_t v16 = 0;
        uint64_t v17 = 0;
        v18 = (uint64_t *)(*((void *)v12 + 4) + 64);
        uint64_t v19 = 80 * v13;
        do
        {
          if (*(v18 - 7)) {
            v20 = (const char *)*(v18 - 6);
          }
          else {
            v20 = (char *)v18 - 55;
          }
          if (!strcmp(v20, "simplifiedAnimationInfluenceEndIndices"))
          {
            uint64_t v15 = *v18;
            unint64_t v14 = (unint64_t)*(v18 - 2) >> 2;
          }
          else if (!strcmp(v20, v11))
          {
            uint64_t v17 = *v18;
            unint64_t v16 = (unint64_t)*(v18 - 2) >> 3;
          }
          v18 += 10;
          v19 -= 80;
        }
        while (v19);
      }
      else
      {
        uint64_t v17 = 0;
        unint64_t v16 = 0;
        uint64_t v15 = 0;
        unint64_t v14 = 0;
      }
      unint64_t v40 = v16;
      int v39 = *(_DWORD *)(v42 + 144 * v10);
      v21 = (void *)(v42 + 144 * v10);
      uint64_t v23 = v21[2];
      uint64_t v22 = v21[3];
      uint64_t v24 = v17;
      v25 = v11;
      uint64_t v26 = v21[5];
      uint64_t v27 = v21[6];
      uint64_t v41 = v21[8];
      uint64_t v43 = v21[9];
      uint64_t v28 = re::BucketArray<re::SkinningModelBuilder::RawSkinnedMeshPartData,4ul>::addUninitialized((uint64_t)v37);
      *(_DWORD *)uint64_t v28 = v39;
      *(void *)(v28 + 8) = v22;
      *(void *)(v28 + 16) = v23;
      *(void *)(v28 + 24) = v27;
      *(void *)(v28 + 32) = v26;
      v11 = v25;
      *(void *)(v28 + 40) = v24;
      *(void *)(v28 + 48) = v40;
      *(void *)(v28 + 56) = v15;
      *(void *)(v28 + 64) = v14;
      ++v10;
      *(void *)(v28 + 72) = v43;
      *(void *)(v28 + 80) = v41;
      a3 = v35;
    }
    while (v10 != v36);
  }
  *(void *)&long long v46 = 0;
  long long v44 = 0u;
  long long v45 = 0u;
  re::SkinningModelBuilder::buildAttributeDescriptor(v32, (uint64_t)&v44);
  v29 = [(REMeshSkinningModelDescriptor *)self initWithSkinningAttributeDescriptor:&v44 inverseBindPoseAttributes:v33 payloadBuilder:a7];
  re::FixedArray<re::SkinningModelBuilder::AttributeDescriptor::SkinnedPartAttribute>::deinit(&v45);

  return v29;
}

- (REMeshSkinningModelDescriptor)initWithSkinningData:(const void *)a3 inverseBindPoseAttributes:(id)a4 deformerBuilders:(void *)a5 payloadBuilder:(void *)a6
{
  v21 = (_anonymous_namespace_ *)a4;
  *((void *)a5 + 1) = 0;
  *((void *)a5 + 2) = 0;
  uint64_t v9 = *((void *)a3 + 2);
  if (v9)
  {
    unint64_t v10 = (int *)*((void *)a3 + 4);
    v11 = &v10[14 * v9];
    do
    {
      int v12 = *v10;
      long long v22 = *(_OWORD *)(v10 + 2);
      uint64_t v13 = *((void *)v10 + 3);
      uint64_t v14 = *((void *)v10 + 4);
      uint64_t v16 = *((void *)v10 + 5);
      uint64_t v15 = *((void *)v10 + 6);
      uint64_t v17 = re::BucketArray<re::SkinningModelBuilder::RawSkinnedMeshPartData,4ul>::addUninitialized((uint64_t)a5 + 24);
      *(_DWORD *)uint64_t v17 = v12;
      *(_OWORD *)(v17 + 8) = v22;
      *(void *)(v17 + 24) = v13;
      *(void *)(v17 + 32) = v14;
      *(_OWORD *)(v17 + 40) = 0u;
      *(_OWORD *)(v17 + 56) = 0u;
      v10 += 14;
      *(void *)(v17 + 72) = v16;
      *(void *)(v17 + 80) = v15;
    }
    while (v10 != v11);
  }
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  re::SkinningModelBuilder::buildAttributeDescriptor((uint64_t *)a5, (uint64_t)&v23);
  v18 = [(REMeshSkinningModelDescriptor *)self initWithSkinningAttributeDescriptor:&v23 inverseBindPoseAttributes:v21 payloadBuilder:a6];
  re::FixedArray<re::SkinningModelBuilder::AttributeDescriptor::SkinnedPartAttribute>::deinit(&v24);

  return v18;
}

- (REMeshSkinningModelDescriptor)initWithSkinningAttributeDescriptor:(const void *)a3 inverseBindPoseAttributes:(id)a4 payloadBuilder:(void *)a5
{
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v10 = *((void *)a3 + 3);
  if (v10)
  {
    uint64_t v11 = *((void *)a3 + 4);
    uint64_t v12 = 56 * v10;
    do
    {
      uint64_t v13 = [[REMeshSkinningPartDescriptor alloc] initWithAttributeDescriptor:v11 payloadBuilder:a5];
      [v9 addObject:v13];

      v11 += 56;
      v12 -= 56;
    }
    while (v12);
  }
  uint64_t v14 = [(REMeshSkinningModelDescriptor *)self initWithInverseBindPoseAttributes:v8 skinningParts:v9];

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMeshSkinningModelDescriptor)initWithInverseBindPoseAttributes:(id)a3 skinningParts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMeshSkinningModelDescriptor;
  id v8 = [(REMeshSkinningModelDescriptor *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    inverseBindPoseAttributes = v8->_inverseBindPoseAttributes;
    v8->_inverseBindPoseAttributes = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    skinningParts = v8->_skinningParts;
    v8->_skinningParts = (NSArray *)v11;
  }
  return v8;
}

- (REMeshSkinningModelDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"inverseBindPoseAttributes"];
  inverseBindPoseAttributes = self->_inverseBindPoseAttributes;
  self->_inverseBindPoseAttributes = v8;

  uint64_t v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"skinningParts"];
  skinningParts = self->_skinningParts;
  self->_skinningParts = v13;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_inverseBindPoseAttributes forKey:@"inverseBindPoseAttributes"];
  [v4 encodeObject:self->_skinningParts forKey:@"skinningParts"];
}

- (BOOL)validateWithPayloadSize:(const void *)a3 parts:(id)a4 partIndices:(id)a5 skeletonCount:(unint64_t)a6 error:(id *)a7
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v31 = a4;
  id v32 = a5;
  v33 = self;
  if ([(NSArray *)self->_inverseBindPoseAttributes count] > a6)
  {
LABEL_14:
    char v17 = 0;
    goto LABEL_15;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v12 = self->_inverseBindPoseAttributes;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v12);
        }
        if (([*(id *)(*((void *)&v34 + 1) + 8 * i) validateWithPayloadSize:*(void *)a3 error:a7] & 1) == 0)
        {

          goto LABEL_14;
        }
      }
      uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  unint64_t v16 = [(NSArray *)v33->_skinningParts count];
  if (v16 > [v32 count])
  {
    goto LABEL_14;
  }
  uint64_t v19 = [(NSArray *)v33->_skinningParts count];
  if (v19)
  {
    uint64_t v20 = 0;
    uint64_t v30 = v19 - 1;
    do
    {
      v21 = -[NSArray objectAtIndexedSubscript:](v33->_skinningParts, "objectAtIndexedSubscript:", v20, v30);
      long long v22 = [v32 objectAtIndexedSubscript:v20];
      long long v23 = objc_msgSend(v31, "objectAtIndexedSubscript:", objc_msgSend(v22, "unsignedLongLongValue"));
      long long v24 = [NSString stringWithUTF8String:"simplifiedVertexPositions"];
      uint64_t v25 = [v23 customAttributes];
      uint64_t v26 = [v25 objectForKey:v24];

      if (v26) {
        unsigned int v27 = [v26 count];
      }
      else {
        unsigned int v27 = 0;
      }
      char v17 = objc_msgSend(v21, "validateWithPayloadSize:skeletonCount:vertexCount:simplifiedVertexCount:error:", a3, -[NSArray count](v33->_inverseBindPoseAttributes, "count"), objc_msgSend(v23, "vertexCount"), v27, a7);

      if (v30 == v20++) {
        char v29 = 0;
      }
      else {
        char v29 = v17;
      }
    }
    while ((v29 & 1) != 0);
  }
  else
  {
    char v17 = 1;
  }
LABEL_15:

  return v17;
}

- (unint64_t)estimateContainerSize
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v3 = (objc_class *)objc_opt_class();
  size_t InstanceSize = class_getInstanceSize(v3);
  if (self->_inverseBindPoseAttributes)
  {
    v5 = (objc_class *)objc_opt_class();
    size_t v6 = class_getInstanceSize(v5);
  }
  else
  {
    size_t v6 = 0;
  }
  if (self->_skinningParts)
  {
    id v7 = (objc_class *)objc_opt_class();
    size_t v8 = class_getInstanceSize(v7);
  }
  else
  {
    size_t v8 = 0;
  }
  NSUInteger v9 = [(NSArray *)self->_inverseBindPoseAttributes count];
  NSUInteger v10 = [(NSArray *)self->_skinningParts count];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v11 = self->_inverseBindPoseAttributes;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
  unint64_t v13 = v6 + InstanceSize + v8 + 8 * v9 + 8 * v10;
  if (v12)
  {
    uint64_t v14 = *(void *)v26;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        v13 += [*(id *)(*((void *)&v25 + 1) + 8 * v15++) estimateContainerSize];
      }
      while (v12 != v15);
      uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v12);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v16 = self->_skinningParts;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v16);
        }
        v13 += objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v19++), "estimateContainerSize", (void)v21);
      }
      while (v17 != v19);
      uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v17);
  }

  return v13;
}

- (NSArray)inverseBindPoseAttributes
{
  return self->_inverseBindPoseAttributes;
}

- (NSArray)skinningParts
{
  return self->_skinningParts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skinningParts, 0);
  objc_storeStrong((id *)&self->_inverseBindPoseAttributes, 0);
}

@end