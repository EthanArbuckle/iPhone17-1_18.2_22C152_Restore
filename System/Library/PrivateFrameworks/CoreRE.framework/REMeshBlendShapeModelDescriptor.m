@interface REMeshBlendShapeModelDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)validateWithPayloadSize:(const void *)a3 partCount:(unint64_t)a4 error:(id *)a5;
- (NSArray)blendShapeBuffers;
- (NSArray)blendShapeGroupNames;
- (NSArray)perMeshPartBlendShapeBufferIndex;
- (REMeshBlendShapeModelDescriptor)initWithBlendShapeData:(const void *)a3 meshPartCount:(unint64_t)a4 payloadBuilder:(void *)a5 deformationModelData:(void *)a6;
- (REMeshBlendShapeModelDescriptor)initWithBlendShapeIndexType:(unint64_t)a3 blendShapeBuffers:(id)a4 perMeshPartBlendShapeBufferIndex:(id)a5 blendGroupNames:(id)a6;
- (REMeshBlendShapeModelDescriptor)initWithCoder:(id)a3;
- (REMeshBlendShapeModelDescriptor)initWithMeshBlendShapeData:(const void *)a3 meshPartCount:(unint64_t)a4 payloadBuilder:(void *)a5 deformationModelData:(void *)a6;
- (unint64_t)blendShapeIndexType;
- (unint64_t)estimateContainerSize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMeshBlendShapeModelDescriptor

- (REMeshBlendShapeModelDescriptor)initWithMeshBlendShapeData:(const void *)a3 meshPartCount:(unint64_t)a4 payloadBuilder:(void *)a5 deformationModelData:(void *)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  *(void *)&v40[0] = 0;
  unint64_t v27 = a4;

  if (*((void *)a3 + 2))
  {
    unint64_t v10 = 0;
    uint64_t v11 = 48;
    do
    {
      re::BlendShapeModelBuilder::addBlendShapeGroup((uint64_t)v31, *((void *)a3 + 4) + v11 - 48, *(unsigned __int16 *)(*((void *)a3 + 4) + v11), v10++, 0);
      v11 += 56;
    }
    while (v10 < *((void *)a3 + 2));
  }
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
  v12 = *(void **)a6;
  uint64_t v13 = **(unsigned __int8 **)a6;
  if (v12[2])
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    uint64_t v16 = 8;
    do
    {
      v17 = [[REMeshBlendShapeBufferDescriptor alloc] initWithBlendShapeBufferPayload:v12[3] + v14 indexType:v13 payloadBuilder:a5];
      [v30 addObject:v17];
      unint64_t v18 = v12[8];
      if (v18 <= v15)
      {
        v31[2] = 0;
        memset(v40, 0, sizeof(v40));
        os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        int v32 = 136315906;
        v33 = "operator[]";
        __int16 v34 = 1024;
        int v35 = 468;
        __int16 v36 = 2048;
        unint64_t v37 = v15;
        __int16 v38 = 2048;
        unint64_t v39 = v18;
        _os_log_send_and_compose_impl();
        _os_crash_msg();
        __break(1u);
      }
      v19 = [NSString stringWithUTF8String:*(void *)(v12[9] + v16)];
      [v29 addObject:v19];

      ++v15;
      v16 += 16;
      v14 += 184;
    }
    while (v15 < v12[2]);
  }
  v20 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v27];
  uint64_t v21 = v12[5];
  if (v21)
  {
    v22 = (unsigned int *)v12[6];
    uint64_t v23 = 4 * v21;
    do
    {
      v24 = [NSNumber numberWithUnsignedInt:*v22];
      [v20 addObject:v24];

      ++v22;
      v23 -= 4;
    }
    while (v23);
  }
  v25 = [(REMeshBlendShapeModelDescriptor *)self initWithBlendShapeIndexType:v13 blendShapeBuffers:v30 perMeshPartBlendShapeBufferIndex:v20 blendGroupNames:v29];

  return v25;
}

- (REMeshBlendShapeModelDescriptor)initWithBlendShapeData:(const void *)a3 meshPartCount:(unint64_t)a4 payloadBuilder:(void *)a5 deformationModelData:(void *)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  *(void *)&v40[0] = 0;
  unint64_t v27 = a4;

  if (*((void *)a3 + 2))
  {
    unint64_t v10 = 0;
    uint64_t v11 = 48;
    do
    {
      re::BlendShapeModelBuilder::addBlendShapeGroup((uint64_t)v31, *((void *)a3 + 4) + v11 - 48, *(unsigned __int16 *)(*((void *)a3 + 4) + v11), v10++, 0);
      v11 += 56;
    }
    while (v10 < *((void *)a3 + 2));
  }
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
  v12 = *(void **)a6;
  uint64_t v13 = **(unsigned __int8 **)a6;
  if (v12[2])
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    uint64_t v16 = 8;
    do
    {
      v17 = [[REMeshBlendShapeBufferDescriptor alloc] initWithBlendShapeBufferPayload:v12[3] + v14 indexType:v13 payloadBuilder:a5];
      [v30 addObject:v17];
      unint64_t v18 = v12[8];
      if (v18 <= v15)
      {
        v31[2] = 0;
        memset(v40, 0, sizeof(v40));
        os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        int v32 = 136315906;
        v33 = "operator[]";
        __int16 v34 = 1024;
        int v35 = 468;
        __int16 v36 = 2048;
        unint64_t v37 = v15;
        __int16 v38 = 2048;
        unint64_t v39 = v18;
        _os_log_send_and_compose_impl();
        _os_crash_msg();
        __break(1u);
      }
      v19 = [NSString stringWithUTF8String:*(void *)(v12[9] + v16)];
      [v29 addObject:v19];

      ++v15;
      v16 += 16;
      v14 += 184;
    }
    while (v15 < v12[2]);
  }
  v20 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v27];
  uint64_t v21 = v12[5];
  if (v21)
  {
    v22 = (unsigned int *)v12[6];
    uint64_t v23 = 4 * v21;
    do
    {
      v24 = [NSNumber numberWithUnsignedInt:*v22];
      [v20 addObject:v24];

      ++v22;
      v23 -= 4;
    }
    while (v23);
  }
  v25 = [(REMeshBlendShapeModelDescriptor *)self initWithBlendShapeIndexType:v13 blendShapeBuffers:v30 perMeshPartBlendShapeBufferIndex:v20 blendGroupNames:v29];

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMeshBlendShapeModelDescriptor)initWithBlendShapeIndexType:(unint64_t)a3 blendShapeBuffers:(id)a4 perMeshPartBlendShapeBufferIndex:(id)a5 blendGroupNames:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)REMeshBlendShapeModelDescriptor;
  uint64_t v13 = [(REMeshBlendShapeModelDescriptor *)&v22 init];
  uint64_t v14 = v13;
  if (v13)
  {
    v13->_blendShapeIndexType = a3;
    uint64_t v15 = [v10 copy];
    blendShapeBuffers = v14->_blendShapeBuffers;
    v14->_blendShapeBuffers = (NSArray *)v15;

    uint64_t v17 = [v11 copy];
    perMeshPartBlendShapeBufferIndex = v14->_perMeshPartBlendShapeBufferIndex;
    v14->_perMeshPartBlendShapeBufferIndex = (NSArray *)v17;

    uint64_t v19 = [v12 copy];
    blendShapeGroupNames = v14->_blendShapeGroupNames;
    v14->_blendShapeGroupNames = (NSArray *)v19;
  }
  return v14;
}

- (REMeshBlendShapeModelDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"blendShapeBuffers"];
  blendShapeBuffers = self->_blendShapeBuffers;
  self->_blendShapeBuffers = v8;

  BOOL v10 = validateMTLIndexType((re *)[v4 decodeIntegerForKey:@"blendShapeIndexType"], (MTLIndexType *)&self->_blendShapeIndexType);
  id v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"perMeshPartBlendShapeBufferIndex"];
  perMeshPartBlendShapeBufferIndex = self->_perMeshPartBlendShapeBufferIndex;
  self->_perMeshPartBlendShapeBufferIndex = v14;

  uint64_t v16 = (void *)MEMORY[0x263EFFA08];
  uint64_t v17 = objc_opt_class();
  unint64_t v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"blendShapeGroupNames"];
  blendShapeGroupNames = self->_blendShapeGroupNames;
  self->_blendShapeGroupNames = v19;

  NSUInteger v21 = [(NSArray *)self->_blendShapeGroupNames count];
  if (v21 == [(NSArray *)self->_blendShapeBuffers count] && v10)
  {
    v24 = self;
  }
  else {
    v25 = {;
  }
    [v4 failWithError:v25];

    v24 = 0;
  }

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_blendShapeBuffers forKey:@"blendShapeBuffers"];
  [v4 encodeInteger:self->_blendShapeIndexType forKey:@"blendShapeIndexType"];
  [v4 encodeObject:self->_perMeshPartBlendShapeBufferIndex forKey:@"perMeshPartBlendShapeBufferIndex"];
  [v4 encodeObject:self->_blendShapeGroupNames forKey:@"blendShapeGroupNames"];
}

- (BOOL)validateWithPayloadSize:(const void *)a3 partCount:(unint64_t)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if ([(NSArray *)self->_perMeshPartBlendShapeBufferIndex count] > a4)
  {
    v8 = @"REMeshBlendShapeModelDescriptor: blend shape index per mesh part out of range";
    goto LABEL_26;
  }
  unint64_t v9 = [(NSArray *)self->_blendShapeBuffers count];
  if ([(NSArray *)self->_blendShapeGroupNames count] != v9)
  {
    v8 = @"REMeshBlendShapeModelDescriptor: blend shape group name count does not match blend shape count";
LABEL_26:
    return 0;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v10 = self->_perMeshPartBlendShapeBufferIndex;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v10);
        }
        unsigned int v14 = [*(id *)(*((void *)&v28 + 1) + 8 * i) unsignedIntValue];
        if (v14 != -1 && v9 < v14)
        {

          return 0;
        }
      }
      uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v11);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v16 = self->_blendShapeBuffers;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v25;
    while (2)
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v16);
        }
        id v20 = *(id *)(*((void *)&v24 + 1) + 8 * j);
        int v21 = objc_msgSend(v20, "validateWithPayloadSize:error:", a3, a5, (void)v24);

        if (!v21)
        {
          BOOL v22 = 0;
          goto LABEL_30;
        }
      }
      uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  BOOL v22 = 1;
LABEL_30:

  return v22;
}

- (unint64_t)estimateContainerSize
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  v3 = (objc_class *)objc_opt_class();
  size_t InstanceSize = class_getInstanceSize(v3);
  if (self->_perMeshPartBlendShapeBufferIndex)
  {
    v5 = (objc_class *)objc_opt_class();
    size_t v6 = class_getInstanceSize(v5);
    perMeshPartBlendShapeBufferIndex = self->_perMeshPartBlendShapeBufferIndex;
  }
  else
  {
    perMeshPartBlendShapeBufferIndex = 0;
    size_t v6 = 0;
  }
  uint64_t v8 = [(NSArray *)perMeshPartBlendShapeBufferIndex count];
  unint64_t v9 = (objc_class *)objc_opt_class();
  size_t v10 = class_getInstanceSize(v9);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v11 = self->_perMeshPartBlendShapeBufferIndex;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v49 objects:v55 count:16];
  uint64_t v13 = v6 + InstanceSize + 8 * v8;
  if (v12)
  {
    uint64_t v14 = *(void *)v50;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(v11);
        }
        if (*(void *)(*((void *)&v49 + 1) + 8 * v15)) {
          size_t v16 = v10;
        }
        else {
          size_t v16 = 0;
        }
        v13 += v16;
        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v12);
  }

  if (self->_blendShapeBuffers)
  {
    uint64_t v17 = (objc_class *)objc_opt_class();
    size_t v18 = class_getInstanceSize(v17);
    blendShapeBuffers = self->_blendShapeBuffers;
  }
  else
  {
    blendShapeBuffers = 0;
    size_t v18 = 0;
  }
  uint64_t v20 = [(NSArray *)blendShapeBuffers count];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  int v21 = self->_blendShapeBuffers;
  uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v45 objects:v54 count:16];
  uint64_t v23 = v18 + v13 + 8 * v20;
  if (v22)
  {
    uint64_t v24 = *(void *)v46;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v46 != v24) {
          objc_enumerationMutation(v21);
        }
        v23 += [*(id *)(*((void *)&v45 + 1) + 8 * v25++) estimateContainerSize];
      }
      while (v22 != v25);
      uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v22);
  }

  if (self->_blendShapeGroupNames)
  {
    long long v26 = (objc_class *)objc_opt_class();
    size_t v27 = class_getInstanceSize(v26);
    blendShapeGroupNames = self->_blendShapeGroupNames;
  }
  else
  {
    blendShapeGroupNames = 0;
    size_t v27 = 0;
  }
  uint64_t v29 = [(NSArray *)blendShapeGroupNames count];
  long long v30 = (objc_class *)objc_opt_class();
  size_t v31 = class_getInstanceSize(v30);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  int v32 = self->_blendShapeGroupNames;
  uint64_t v33 = [(NSArray *)v32 countByEnumeratingWithState:&v41 objects:v53 count:16];
  unint64_t v34 = v27 + v23 + 8 * v29;
  if (v33)
  {
    uint64_t v35 = *(void *)v42;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v42 != v35) {
          objc_enumerationMutation(v32);
        }
        unint64_t v37 = *(void **)(*((void *)&v41 + 1) + 8 * v36);
        if (v37) {
          size_t v38 = v31;
        }
        else {
          size_t v38 = 0;
        }
        if (v37) {
          uint64_t v39 = objc_msgSend(v37, "lengthOfBytesUsingEncoding:", 4, (void)v41) + 1;
        }
        else {
          uint64_t v39 = 0;
        }
        v34 += v38 + v39;
        ++v36;
      }
      while (v33 != v36);
      uint64_t v33 = [(NSArray *)v32 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v33);
  }

  return v34;
}

- (unint64_t)blendShapeIndexType
{
  return self->_blendShapeIndexType;
}

- (NSArray)perMeshPartBlendShapeBufferIndex
{
  return self->_perMeshPartBlendShapeBufferIndex;
}

- (NSArray)blendShapeBuffers
{
  return self->_blendShapeBuffers;
}

- (NSArray)blendShapeGroupNames
{
  return self->_blendShapeGroupNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendShapeGroupNames, 0);
  objc_storeStrong((id *)&self->_blendShapeBuffers, 0);
  objc_storeStrong((id *)&self->_perMeshPartBlendShapeBufferIndex, 0);
}

@end