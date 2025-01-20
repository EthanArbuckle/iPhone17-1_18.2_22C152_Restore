@interface REMeshBlendShapeBufferDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBitangents;
- (BOOL)hasNormals;
- (BOOL)hasTangents;
- (BOOL)validateWithPayloadSize:(const void *)a3 error:(id *)a4;
- (NSArray)blendShapeNames;
- (REAttributeDescriptor)blendShapeConstantsBuffer;
- (REAttributeDescriptor)coefficientIndexBuffer;
- (REAttributeDescriptor)floatDeltaBuffer;
- (REAttributeDescriptor)floatSliceBuffer;
- (REAttributeDescriptor)indexBuffer;
- (REAttributeDescriptor)renormalizationBuffer;
- (REMeshBlendShapeBufferDescriptor)initWithBlendShapeBufferPayload:(void *)a3 indexType:(unint64_t)a4 payloadBuilder:(void *)a5;
- (REMeshBlendShapeBufferDescriptor)initWithBlendShapeNames:(id)a3 floatDeltaBuffer:(id)a4 blendShapeConstantsBuffer:(id)a5 indexBuffer:(id)a6 floatSliceBuffer:(id)a7 coefficientIndexBuffer:(id)a8 renormalizationBuffer:(id)a9 hasNormals:(BOOL)a10 hasTangents:(BOOL)a11 hasBitangents:(BOOL)a12;
- (REMeshBlendShapeBufferDescriptor)initWithCoder:(id)a3;
- (unint64_t)estimateContainerSize;
- (void)addToBlendShapeModelBuilder:(BlendShapeModelBuilder *)a3 blendShapeIndex:(unint64_t)a4 blendShapeGroupName:(const StringID *)a5 payloadBuffers:(const void *)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMeshBlendShapeBufferDescriptor

- (REMeshBlendShapeBufferDescriptor)initWithBlendShapeBufferPayload:(void *)a3 indexType:(unint64_t)a4 payloadBuilder:(void *)a5
{
  if (a4) {
    unint64_t v7 = 4;
  }
  else {
  v8 = v20 = v21 = unint64_t v7 = 2;
  }
  v11 = v10 = v9 = objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_new();
  uint64_t v13 = *((void *)a3 + 3);
  if (v13)
  {
    v14 = (void *)(*((void *)a3 + 4) + 8);
    uint64_t v15 = 16 * v13;
    do
    {
      v16 = [NSString stringWithUTF8String:*v14];
      [v12 addObject:v16];

      v14 += 2;
      v15 -= 16;
    }
    while (v15);
  }
  *(_WORD *)((char *)&v19 + 1) = *(_WORD *)((char *)a3 + 13);
  LOBYTE(v19) = *((unsigned char *)a3 + 12);
  v17 = -[REMeshBlendShapeBufferDescriptor initWithBlendShapeNames:floatDeltaBuffer:blendShapeConstantsBuffer:indexBuffer:floatSliceBuffer:coefficientIndexBuffer:renormalizationBuffer:hasNormals:hasTangents:hasBitangents:](self, "initWithBlendShapeNames:floatDeltaBuffer:blendShapeConstantsBuffer:indexBuffer:floatSliceBuffer:coefficientIndexBuffer:renormalizationBuffer:hasNormals:hasTangents:hasBitangents:", v12, v20, v21, v8, v9, v10, v11, v19);

  return v17;
}

- (void)addToBlendShapeModelBuilder:(BlendShapeModelBuilder *)a3 blendShapeIndex:(unint64_t)a4 blendShapeGroupName:(const StringID *)a5 payloadBuffers:(const void *)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  memset(v40, 0, sizeof(v40));
  v9 = [(REMeshBlendShapeBufferDescriptor *)self floatDeltaBuffer];

  v10 = [(REMeshBlendShapeBufferDescriptor *)self blendShapeConstantsBuffer];

  v11 = [(REMeshBlendShapeBufferDescriptor *)self indexBuffer];

  v12 = [(REMeshBlendShapeBufferDescriptor *)self floatSliceBuffer];

  uint64_t v13 = [(REMeshBlendShapeBufferDescriptor *)self coefficientIndexBuffer];

  v14 = [(REMeshBlendShapeBufferDescriptor *)self renormalizationBuffer];

  v16 = [(REMeshBlendShapeBufferDescriptor *)self blendShapeNames];
  unint64_t v17 = [v16 count];
  re::StringID::invalid((re::StringID *)v50);
  uint64_t v37 = 0;
  unint64_t v38 = 0;
  uint64_t v39 = 0;
  re::StringID::destroyString((re::StringID *)v50);

  v18 = [(REMeshBlendShapeBufferDescriptor *)self blendShapeNames];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    uint64_t v20 = 0;
    for (unint64_t i = 0; i != v19; ++i)
    {
      v22 = [(REMeshBlendShapeBufferDescriptor *)self blendShapeNames];
      id v23 = [v22 objectAtIndexedSubscript:i];
      v24 = (_anonymous_namespace_ *)[v23 UTF8String];
      uint64_t v35 = 0;
      v36 = "";
      unint64_t v25 = v38;
      if (v38 <= i)
      {
        uint64_t v41 = 0;
        memset(v50, 0, sizeof(v50));
        os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        int v42 = 136315906;
        v43 = "operator[]";
        __int16 v44 = 1024;
        int v45 = 468;
        __int16 v46 = 2048;
        unint64_t v47 = i;
        __int16 v48 = 2048;
        unint64_t v49 = v25;
        _os_log_send_and_compose_impl();
        _os_crash_msg();
        __break(1u);
      }
      v26 = (void *)(v39 + v20);
      uint64_t v27 = v35;
      v28 = v36;
      uint64_t v35 = 0;
      v36 = "";
      v29 = *(char **)(v39 + v20 + 8);
      unint64_t v30 = v27 & 0xFFFFFFFFFFFFFFFELL | *(void *)(v39 + v20) & 1;
      v26[1] = v28;
      *(void *)&v50[0].var0 = v30;
      v50[0].var1 = v29;
      void *v26 = v27;
      re::StringID::destroyString((re::StringID *)v50);
      re::StringID::destroyString((re::StringID *)&v35);

      v20 += 16;
    }
  }
  re::BlendShapeModelBuilder::addBlendShapeGroup((uint64_t)a3, a4, (uint64_t)v40, (uint64_t *)a5, (uint64_t)&v37, [(REMeshBlendShapeBufferDescriptor *)self hasNormals], [(REMeshBlendShapeBufferDescriptor *)self hasTangents], [(REMeshBlendShapeBufferDescriptor *)self hasBitangents]);
  re::FixedArray<re::StringID>::deinit(&v37);
  for (uint64_t j = 5; j != -1; --j)
  {
    v32 = *(void **)&v40[j];
    if (v32)
    {

      *(void *)&v40[j] = 0;
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMeshBlendShapeBufferDescriptor)initWithBlendShapeNames:(id)a3 floatDeltaBuffer:(id)a4 blendShapeConstantsBuffer:(id)a5 indexBuffer:(id)a6 floatSliceBuffer:(id)a7 coefficientIndexBuffer:(id)a8 renormalizationBuffer:(id)a9 hasNormals:(BOOL)a10 hasTangents:(BOOL)a11 hasBitangents:(BOOL)a12
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v18 = a8;
  id v19 = a9;
  v30.receiver = self;
  v30.super_class = (Class)REMeshBlendShapeBufferDescriptor;
  uint64_t v20 = [(REMeshBlendShapeBufferDescriptor *)&v30 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_floatDeltaBuffer, a4);
    objc_storeStrong((id *)&v21->_blendShapeConstantsBuffer, a5);
    objc_storeStrong((id *)&v21->_indexBuffer, a6);
    objc_storeStrong((id *)&v21->_floatSliceBuffer, a7);
    objc_storeStrong((id *)&v21->_coefficientIndexBuffer, a8);
    objc_storeStrong((id *)&v21->_renormalizationBuffer, a9);
    uint64_t v22 = [v29 copy];
    blendShapeNames = v21->_blendShapeNames;
    v21->_blendShapeNames = (NSArray *)v22;

    v21->_hasNormals = a10;
    v21->_hasTangents = a11;
    v21->_hasBitangents = a12;
  }

  return v21;
}

- (REMeshBlendShapeBufferDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"floatDeltaBuffer"];
  floatDeltaBuffer = self->_floatDeltaBuffer;
  self->_floatDeltaBuffer = v5;

  unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blendShapeConstantsBuffer"];
  blendShapeConstantsBuffer = self->_blendShapeConstantsBuffer;
  self->_blendShapeConstantsBuffer = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"indexBuffer"];
  indexBuffer = self->_indexBuffer;
  self->_indexBuffer = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"floatSliceBuffer"];
  floatSliceBuffer = self->_floatSliceBuffer;
  self->_floatSliceBuffer = v11;

  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coefficientIndexBuffer"];
  coefficientIndexBuffer = self->_coefficientIndexBuffer;
  self->_coefficientIndexBuffer = v13;

  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"renormalizationBuffer"];
  renormalizationBuffer = self->_renormalizationBuffer;
  self->_renormalizationBuffer = v15;

  unint64_t v17 = (void *)MEMORY[0x263EFFA08];
  uint64_t v18 = objc_opt_class();
  id v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"blendShapeNames"];
  blendShapeNames = self->_blendShapeNames;
  self->_blendShapeNames = v20;

  self->_hasNormals = [v4 decodeBoolForKey:@"hasNormals"];
  self->_hasTangents = [v4 decodeBoolForKey:@"hasTangents"];
  self->_hasBitangents = [v4 decodeBoolForKey:@"hasBitangents"];

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeBool:self->_hasNormals forKey:@"hasNormals"];
  [v4 encodeBool:self->_hasTangents forKey:@"hasTangents"];
  [v4 encodeBool:self->_hasBitangents forKey:@"hasBitangents"];
  [v4 encodeObject:self->_floatDeltaBuffer forKey:@"floatDeltaBuffer"];
  [v4 encodeObject:self->_blendShapeConstantsBuffer forKey:@"blendShapeConstantsBuffer"];
  [v4 encodeObject:self->_indexBuffer forKey:@"indexBuffer"];
  [v4 encodeObject:self->_floatSliceBuffer forKey:@"floatSliceBuffer"];
  [v4 encodeObject:self->_coefficientIndexBuffer forKey:@"coefficientIndexBuffer"];
  [v4 encodeObject:self->_renormalizationBuffer forKey:@"renormalizationBuffer"];
  [v4 encodeObject:self->_blendShapeNames forKey:@"blendShapeNames"];
}

- (BOOL)validateWithPayloadSize:(const void *)a3 error:(id *)a4
{
  floatDeltaBuffer = self->_floatDeltaBuffer;
  if (!floatDeltaBuffer)
  {
    return 0;
  }
  {
    return 0;
  }
  renormalizationBuffer = self->_renormalizationBuffer;
}

- (unint64_t)estimateContainerSize
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v3 = (objc_class *)objc_opt_class();
  size_t InstanceSize = class_getInstanceSize(v3);
  floatDeltaBuffer = self->_floatDeltaBuffer;
  if (floatDeltaBuffer) {
    uint64_t v29 = [(REAttributeDescriptor *)floatDeltaBuffer estimateContainerSize];
  }
  else {
    uint64_t v29 = 0;
  }
  blendShapeConstantsBuffer = self->_blendShapeConstantsBuffer;
  if (blendShapeConstantsBuffer) {
    uint64_t v7 = [(REAttributeDescriptor *)blendShapeConstantsBuffer estimateContainerSize];
  }
  else {
    uint64_t v7 = 0;
  }
  indexBuffer = self->_indexBuffer;
  if (indexBuffer) {
    uint64_t v9 = [(REAttributeDescriptor *)indexBuffer estimateContainerSize];
  }
  else {
    uint64_t v9 = 0;
  }
  floatSliceBuffer = self->_floatSliceBuffer;
  if (floatSliceBuffer) {
    uint64_t v11 = [(REAttributeDescriptor *)floatSliceBuffer estimateContainerSize];
  }
  else {
    uint64_t v11 = 0;
  }
  coefficientIndexBuffer = self->_coefficientIndexBuffer;
  if (coefficientIndexBuffer) {
    uint64_t v13 = [(REAttributeDescriptor *)coefficientIndexBuffer estimateContainerSize];
  }
  else {
    uint64_t v13 = 0;
  }
  renormalizationBuffer = self->_renormalizationBuffer;
  if (renormalizationBuffer) {
    uint64_t v15 = [(REAttributeDescriptor *)renormalizationBuffer estimateContainerSize];
  }
  else {
    uint64_t v15 = 0;
  }
  if (self->_blendShapeNames)
  {
    v16 = (objc_class *)objc_opt_class();
    size_t v17 = class_getInstanceSize(v16);
    blendShapeNames = self->_blendShapeNames;
  }
  else
  {
    blendShapeNames = 0;
    size_t v17 = 0;
  }
  uint64_t v19 = [(NSArray *)blendShapeNames count];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v20 = self->_blendShapeNames;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
  unint64_t v22 = InstanceSize + 48 + v29 + v7 + v9 + v11 + v13 + v15 + v17 + 8 * v19;
  if (v21)
  {
    uint64_t v23 = *(void *)v31;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v30 + 1) + 8 * v24);
        if (v25)
        {
          id v26 = (objc_class *)objc_opt_class();
          v22 += class_getInstanceSize(v26);
          uint64_t v27 = [v25 lengthOfBytesUsingEncoding:4] + 1;
        }
        else
        {
          uint64_t v27 = 0;
        }
        v22 += v27;
        ++v24;
      }
      while (v21 != v24);
      uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v21);
  }

  return v22;
}

- (REAttributeDescriptor)floatDeltaBuffer
{
  return self->_floatDeltaBuffer;
}

- (REAttributeDescriptor)blendShapeConstantsBuffer
{
  return self->_blendShapeConstantsBuffer;
}

- (REAttributeDescriptor)indexBuffer
{
  return self->_indexBuffer;
}

- (REAttributeDescriptor)floatSliceBuffer
{
  return self->_floatSliceBuffer;
}

- (REAttributeDescriptor)coefficientIndexBuffer
{
  return self->_coefficientIndexBuffer;
}

- (REAttributeDescriptor)renormalizationBuffer
{
  return self->_renormalizationBuffer;
}

- (NSArray)blendShapeNames
{
  return self->_blendShapeNames;
}

- (BOOL)hasNormals
{
  return self->_hasNormals;
}

- (BOOL)hasTangents
{
  return self->_hasTangents;
}

- (BOOL)hasBitangents
{
  return self->_hasBitangents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendShapeNames, 0);
  objc_storeStrong((id *)&self->_renormalizationBuffer, 0);
  objc_storeStrong((id *)&self->_coefficientIndexBuffer, 0);
  objc_storeStrong((id *)&self->_floatSliceBuffer, 0);
  objc_storeStrong((id *)&self->_indexBuffer, 0);
  objc_storeStrong((id *)&self->_blendShapeConstantsBuffer, 0);
  objc_storeStrong((id *)&self->_floatDeltaBuffer, 0);
}

@end