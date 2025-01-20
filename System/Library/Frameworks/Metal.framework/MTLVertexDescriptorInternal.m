@interface MTLVertexDescriptorInternal
+ (id)vertexDescriptor;
- (BOOL)isEqual:(id)a3;
- (BOOL)validateWithVertexFunction:(id)a3 error:(id *)a4 renderPipelineDescriptor:(id)a5;
- (MTLVertexDescriptorInternal)init;
- (id)attributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)layouts;
- (id)newSerializedDescriptor;
- (unint64_t)hash;
- (void)dealloc;
- (void)reset;
@end

@implementation MTLVertexDescriptorInternal

- (id)newSerializedDescriptor
{
  v51[4] = *MEMORY[0x1E4F143B8];
  uint64_t v50 = 0;
  memset(v49, 0, sizeof(v49));
  _MTLMessageContextBegin_((uint64_t)v49, (uint64_t)"-[MTLVertexDescriptorInternal newSerializedDescriptor]", 743, 0, 5, (uint64_t)"Serialized Descriptor Creation");
  uint64_t v7 = 0;
  int v8 = 0;
  memset(v51, 0, 31);
  v9 = &OBJC_IVAR____MTLCommandBuffer__scheduledCond;
  descriptors = self->_vertexBufferArray->_descriptors;
  do
  {
    v11 = descriptors[v7];
    if (v11 && v11->_stride)
    {
      ++v8;
      *((unsigned char *)v51 + v7) = 1;
    }
    ++v7;
  }
  while (v7 != 31);
  uint64_t v12 = 0;
  int v13 = 0;
  v14 = &OBJC_IVAR____MTLCommandBuffer__scheduledCond;
  do
  {
    v15 = self->_attributeArray->_descriptors[v12];
    if (v15 && *(Class *)((char *)&v15->super.super.isa + v14[60]))
    {
      uint64_t v16 = *(uint64_t *)((char *)&self->_vertexBufferArray->super.super.isa + 8 * v15->_bufferIndex + v9[59]);
      v17 = v9;
      v18 = v14;
      validateVertexAttribute(v16, v12, (uint64_t)v15, (uint64_t)v49, v3, v4, v5, v6, v46);
      v14 = v18;
      v9 = v17;
      *((unsigned char *)v51 + v15->_bufferIndex) = 0;
      ++v13;
    }
    ++v12;
  }
  while (v12 != 31);
  if (v13)
  {
    uint64_t v19 = (16 * v8) | 8;
    __int16 v20 = ((v8 & 0x1F) << 6) | ((_WORD)v13 << 11);
    size_t v21 = v19 + 8 * v13;
    v22 = malloc_type_malloc(v21, 0x9DB263D6uLL);
    bzero(v22, v21);
    uint64_t v28 = 0;
    int v29 = 0;
    _WORD *v22 = v21;
    v22[1] = v20;
    size_t size = v21;
    v22[2] = 8;
    unsigned __int16 v47 = v19;
    v22[3] = v19;
    int v30 = v9[59];
    v31 = &OBJC_IVAR____MTLCommandBuffer__scheduledCond;
    do
    {
      vertexBufferArray = self->_vertexBufferArray;
      if (*((unsigned char *)v51 + v28))
      {
        _MTLMessageContextPush_((uint64_t)v49, 4, @"None of the attributes set bufferIndex to %d, but %s set buffer layout[%d].stride(%lu).", v23, v24, v25, v26, v27, v28);
        int v30 = v9[59];
        vertexBufferArray = self->_vertexBufferArray;
      }
      uint64_t v33 = *(uint64_t *)((char *)&vertexBufferArray->super.super.isa + 8 * v28 + v30);
      if (v33)
      {
        uint64_t v34 = *(void *)(v33 + v31[56]);
        if (v34)
        {
          uint64_t v35 = (uint64_t)&v22[8 * v29 + 4];
          *(void *)(v35 + 8) = v34;
          uint64_t v36 = *(unsigned int *)(v33 + 24);
          *(_DWORD *)(v35 + 4) = v36;
          v37 = (unsigned int *)(v35 + 4);
          *(_DWORD *)uint64_t v35 = *(_DWORD *)v35 & 0xFFFFFFE0 | v28;
          *(_DWORD *)uint64_t v35 = (32 * (unsigned __int16)*(_DWORD *)(v33 + 16)) | v28;
          unint64_t v38 = *(void *)(v33 + 16);
          if (v38 >= 5)
          {
            _MTLMessageContextPush_((uint64_t)v49, 4, @"stepFunction is not a valid MTLVertexStepFunction.", v23, v24, v25, v26, v27, v46);
            unint64_t v38 = *(void *)(v33 + 16);
            uint64_t v36 = *v37;
          }
          ++v29;
          validateFunctionStepRate(0, v38, v36, (uint64_t)v49);
          int v30 = v9[59];
          v31 = &OBJC_IVAR____MTLCommandBuffer__scheduledCond;
        }
      }
      ++v28;
    }
    while (v28 != 31);
    uint64_t v39 = 0;
    int v40 = 0;
    do
    {
      v41 = self->_attributeArray->_descriptors[v39];
      if (v41)
      {
        if (v41->_vertexFormat)
        {
          v42 = (unsigned int *)((char *)&v22[4 * v40++] + (v47 & 0xFFF8));
          unsigned int v43 = *v42 & 0xFFFFFFE0 | v39;
          unsigned int *v42 = v43;
          v42[1] = v41->_offset;
          unsigned int v44 = v43 & 0xFFFFFC1F | (32 * (v41->_bufferIndex & 0x1F));
          unsigned int *v42 = v44;
          unsigned int *v42 = v44 & 0x3FF | (LODWORD(v41->_vertexFormat) << 10);
        }
      }
      ++v39;
    }
    while (v39 != 31);
    _MTLMessageContextEnd((uint64_t)v49);
    return dispatch_data_create(v22, size, 0, (dispatch_block_t)*MEMORY[0x1E4F143F0]);
  }
  else
  {
    _MTLMessageContextEnd((uint64_t)v49);
    return 0;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    for (uint64_t i = 0; i != 31; ++i)
    {
      uint64_t v7 = self->_vertexBufferArray->_descriptors[i];
      if (v7) {
        *(void *)(v5[1] + 8 + i * 8) = [(MTLVertexBufferLayoutDescriptorInternal *)v7 copyWithZone:a3];
      }
    }
    for (uint64_t j = 0; j != 31; ++j)
    {
      v9 = self->_attributeArray->_descriptors[j];
      if (v9) {
        *(void *)(v5[2] + 8 + j * 8) = [(MTLVertexAttributeDescriptorInternal *)v9 copyWithZone:a3];
      }
    }
  }
  return v5;
}

- (MTLVertexDescriptorInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)MTLVertexDescriptorInternal;
  v2 = [(MTLVertexDescriptorInternal *)&v4 init];
  if (v2)
  {
    v2->_vertexBufferArray = objc_alloc_init(MTLVertexBufferLayoutDescriptorArrayInternal);
    v2->_attributeArray = objc_alloc_init(MTLVertexAttributeDescriptorArrayInternal);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLVertexDescriptorInternal;
  [(MTLVertexDescriptorInternal *)&v3 dealloc];
}

- (id)attributes
{
  return self->_attributeArray;
}

- (id)layouts
{
  return self->_vertexBufferArray;
}

- (unint64_t)hash
{
  uint64_t v2 = 0;
  descriptors = self->_vertexBufferArray->_descriptors;
  do
  {
    objc_super v4 = *descriptors;
    if (*descriptors)
    {
      *(void *)&v14[v2] = v4->_stride;
      uint64_t stepFunction = v4->_stepFunction;
      uint64_t instanceStepRate = v4->_instanceStepRate;
    }
    else
    {
      *(void *)&v14[v2] = 0;
      uint64_t stepFunction = 1;
      uint64_t instanceStepRate = 1;
    }
    uint64_t v7 = &v14[v2];
    *((void *)v7 + 1) = stepFunction;
    *((void *)v7 + 2) = instanceStepRate;
    v2 += 6;
    ++descriptors;
  }
  while (v2 != 186);
  int v8 = self->_attributeArray->_descriptors;
  for (uint64_t i = 190; i != 376; i += 6)
  {
    v10 = *v8;
    if (*v8)
    {
      unint64_t vertexFormat = v10->_vertexFormat;
      *(void *)&v14[i - 2] = v10->_bufferIndex;
      v10 = (MTLVertexAttributeDescriptorInternal *)v10->_offset;
    }
    else
    {
      unint64_t vertexFormat = 0;
      *(void *)&v14[i - 2] = 0;
    }
    uint64_t v12 = &v14[i];
    *((void *)v12 - 2) = vertexFormat;
    *(void *)uint64_t v12 = v10;
    ++v8;
  }
  return _MTLHashState(v14, 0x5D0uLL);
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v5 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTLVertexDescriptorInternal;
  id v6 = [(MTLVertexDescriptorInternal *)&v8 description];
  return (id)[v5 stringWithFormat:@"%@%@", v6, MTLVertexDescriptorDescription((uint64_t)self, a3)];
}

- (id)description
{
  return [(MTLVertexDescriptorInternal *)self formattedDescription:0];
}

- (void)reset
{
  for (uint64_t i = 0; i != 31; ++i)
  {
    objc_super v3 = self->_vertexBufferArray->_descriptors[i];
    if (v3)
    {
      v3->_stride = 0;
      v3->_uint64_t stepFunction = 1;
      v3->_uint64_t instanceStepRate = 1;
    }
  }
  for (uint64_t j = 0; j != 31; ++j)
  {
    uint64_t v5 = self->_attributeArray->_descriptors[j];
    if (v5)
    {
      v5->_unint64_t vertexFormat = 0;
      v5->_bufferIndex = 0;
      v5->_offset = 0;
    }
  }
}

+ (id)vertexDescriptor
{
  uint64_t v2 = objc_alloc_init(MTLVertexDescriptorInternal);

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  if (Class == object_getClass(a3))
  {
    uint64_t v7 = 0;
    while (1)
    {
      objc_super v8 = self->_vertexBufferArray->_descriptors[v7];
      v9 = *(MTLVertexBufferLayoutDescriptorInternal **)(*((void *)a3 + 1) + 8 + v7 * 8);
      if (v8 != v9)
      {
        if (v8) {
          BOOL v10 = v9 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (v10)
        {
          if (v8 && (v8->_stride || v8->_stepFunction != 1 || v8->_instanceStepRate != 1)
            || v9 && (v9->_stride || v9->_stepFunction != 1 || v9->_instanceStepRate != 1))
          {
            return 0;
          }
        }
        else if (v8->_stride != v9->_stride {
               || v8->_stepFunction != v9->_stepFunction
        }
               || v8->_instanceStepRate != v9->_instanceStepRate)
        {
          return 0;
        }
      }
      if (++v7 == 31)
      {
        uint64_t v11 = 0;
        BOOL result = 1;
        while (1)
        {
          uint64_t v12 = self->_attributeArray->_descriptors[v11];
          int v13 = *(MTLVertexAttributeDescriptorInternal **)(*((void *)a3 + 2) + 8 + v11 * 8);
          if (v12 != v13)
          {
            if (v12) {
              BOOL v14 = v13 == 0;
            }
            else {
              BOOL v14 = 1;
            }
            if (v14)
            {
              if (v12 && (v12->_vertexFormat || v12->_bufferIndex || v12->_offset)
                || v13 && (v13->_vertexFormat || v13->_bufferIndex || v13->_offset))
              {
                return 0;
              }
            }
            else if (v12->_vertexFormat != v13->_vertexFormat {
                   || v12->_bufferIndex != v13->_bufferIndex
            }
                   || v12->_offset != v13->_offset)
            {
              return 0;
            }
          }
          if (++v11 == 31) {
            return result;
          }
        }
      }
    }
  }
  return 0;
}

- (BOOL)validateWithVertexFunction:(id)a3 error:(id *)a4 renderPipelineDescriptor:(id)a5
{
  id v5 = a3;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v60 = 0;
  memset(v59, 0, sizeof(v59));
  _MTLMessageContextBegin_((uint64_t)v59, (uint64_t)"-[MTLVertexDescriptorInternal validateWithVertexFunction:error:renderPipelineDescriptor:]", 904, [a3 device], 4, (uint64_t)"Vertex Descriptor Validation");
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v7 = (void *)[v5 vertexAttributes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v56;
    id v51 = v5;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v56 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v55 + 1) + 8 * v11);
        uint64_t v13 = [v12 attributeIndex];
        if ([v12 isActive])
        {
          v18 = self->_attributeArray->_descriptors[v13];
          if (!v18 || !v18->_vertexFormat)
          {
            int v30 = a4;
            if (a4)
            {
              uint64_t v31 = [v12 name];
              v32 = @"Vertex attribute %@(%d) is missing from the vertex descriptor";
              _MTLMessageContextPush_((uint64_t)v59, 2, @"Vertex attribute %@(%d) is missing from the vertex descriptor", v33, v34, v35, v36, v37, v31);
              uint64_t v38 = [v12 name];
              goto LABEL_38;
            }
LABEL_39:
            _MTLMessageContextEnd((uint64_t)v59);
            return 0;
          }
          descriptors = self->_vertexBufferArray->_descriptors;
          unint64_t bufferIndex = v18->_bufferIndex;
          size_t v21 = descriptors[bufferIndex];
          if (!v21)
          {
            int v30 = a4;
            if (a4)
            {
              uint64_t v39 = [v12 name];
              v32 = @"Vertex attribute %@(%d) references a vertex buffer at index %d, but there is no buffer layout set for that index";
              _MTLMessageContextPush_((uint64_t)v59, 2, @"Vertex attribute %@(%d) references a vertex buffer at index %d, but there is no buffer layout set for that index", v40, v41, v42, v43, v44, v39);
              uint64_t v38 = [v12 name];
              unint64_t v49 = v18->_bufferIndex;
LABEL_38:
              *int v30 = (id)compilerErrorWithMessage(&v32->isa, v38, v13, v49);
            }
            goto LABEL_39;
          }
          validateVertexAttribute((uint64_t)descriptors[bufferIndex], v13, (uint64_t)v18, (uint64_t)v59, v14, v15, v16, v17, v48);
          validateFunctionStepRate(v5, v21->_stepFunction, v21->_instanceStepRate, (uint64_t)v59);
          unint64_t v22 = [v12 attributeType];
          if (v22 < gAttributeTypesCount)
          {
            unint64_t v23 = v22;
            int v24 = [a5 openGLModeEnabled];
            if (v23 || !v24 || byte_1E8F5BDE4)
            {
              int v54 = 0;
              BOOL v53 = 0;
              int v25 = isVertexFormatInteger((MTLAttributeFormat)v18->_vertexFormat, &v54, &v53);
              if ((BYTE3(attributeTypes[3 * v23 + 2]) & 1) == 0)
              {
                if (v54 == 4) {
                  char v26 = v25 ^ 1;
                }
                else {
                  char v26 = 1;
                }
                goto LABEL_24;
              }
              if (v25
                && ((BYTE3(attributeTypes[3 * v23 + 2]) & 2) == 0 || v53)
                && ((BYTE3(attributeTypes[3 * v23 + 2]) & 2) != 0 || !v53))
              {
                [a5 openGLModeEnabled];
              }
              else
              {
                char v26 = 0;
LABEL_24:
                char v27 = [a5 openGLModeEnabled];
                if ((v26 & 1) == 0 && (v27 & 1) == 0)
                {
                  if (a4)
                  {
                    uint64_t v45 = [v12 name];
                    uint64_t v46 = attributeTypes[3 * v23 + 1];
                    unsigned __int16 v47 = MTLAttributeFormatString((MTLAttributeFormat)v18->_vertexFormat);
                    *a4 = (id)compilerErrorWithMessage(&cfstr_VertexAttribut_2.isa, v45, v13, v46, v47);
                  }
                  goto LABEL_39;
                }
              }
              id v5 = v51;
            }
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v28 = [v7 countByEnumeratingWithState:&v55 objects:v61 count:16];
      uint64_t v9 = v28;
    }
    while (v28);
  }
  if (a4) {
    *a4 = 0;
  }
  _MTLMessageContextEnd((uint64_t)v59);
  return *(void *)&v59[0] == 0;
}

@end