@interface MTLStageInputOutputDescriptorInternal
+ (id)vertexDescriptor;
- (BOOL)isEqual:(id)a3;
- (BOOL)validateWithVertexFunction:(id)a3 error:(id *)a4 renderPipelineDescriptor:(id)a5;
- (MTLStageInputOutputDescriptorInternal)init;
- (id)attributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)layouts;
- (id)newSerializedDescriptor;
- (unint64_t)hash;
- (unint64_t)indexBufferIndex;
- (unint64_t)indexType;
- (void)dealloc;
- (void)reset;
- (void)setIndexBufferIndex:(unint64_t)a3;
- (void)setIndexType:(unint64_t)a3;
@end

@implementation MTLStageInputOutputDescriptorInternal

- (MTLStageInputOutputDescriptorInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)MTLStageInputOutputDescriptorInternal;
  v2 = [(MTLStageInputOutputDescriptorInternal *)&v4 init];
  if (v2)
  {
    v2->_vertexBufferArray = objc_alloc_init(MTLBufferLayoutDescriptorArrayInternal);
    v2->_attributeArray = objc_alloc_init(MTLAttributeDescriptorArrayInternal);
  }
  return v2;
}

- (id)layouts
{
  return self->_vertexBufferArray;
}

- (id)attributes
{
  return self->_attributeArray;
}

- (unint64_t)indexType
{
  return self->_indexType;
}

- (void)setIndexType:(unint64_t)a3
{
  self->_indexType = a3;
}

- (unint64_t)indexBufferIndex
{
  return self->_indexBufferIndex;
}

- (void)setIndexBufferIndex:(unint64_t)a3
{
  self->_indexBufferIndex = a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLStageInputOutputDescriptorInternal;
  [(MTLStageInputOutputDescriptorInternal *)&v3 dealloc];
}

- (id)formattedDescription:(unint64_t)a3
{
  v5 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTLStageInputOutputDescriptorInternal;
  id v6 = [(MTLStageInputOutputDescriptorInternal *)&v8 description];
  return (id)[v5 stringWithFormat:@"%@%@", v6, MTLStageInputOutputDescriptorDescription((uint64_t)self, a3)];
}

- (id)description
{
  return [(MTLStageInputOutputDescriptorInternal *)self formattedDescription:0];
}

- (void)reset
{
  for (uint64_t i = 0; i != 31; ++i)
  {
    objc_super v3 = self->_vertexBufferArray->_descriptors[i];
    if (v3)
    {
      v3->_stride = 0;
      v3->_stepFunction = 1;
      v3->_instanceStepRate = 1;
    }
  }
  for (uint64_t j = 0; j != 31; ++j)
  {
    v5 = self->_attributeArray->_descriptors[j];
    if (v5)
    {
      v5->_vertexFormat = 0;
      v5->_bufferIndex = 0;
      v5->_offset = 0;
    }
  }
}

+ (id)vertexDescriptor
{
  v2 = objc_alloc_init(MTLStageInputOutputDescriptorInternal);

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    for (uint64_t i = 0; i != 31; ++i)
    {
      v7 = self->_vertexBufferArray->_descriptors[i];
      if (v7) {
        *(void *)(v5[1] + 8 + i * 8) = [(MTLBufferLayoutDescriptorInternal *)v7 copyWithZone:a3];
      }
    }
    for (uint64_t j = 0; j != 31; ++j)
    {
      v9 = self->_attributeArray->_descriptors[j];
      if (v9) {
        *(void *)(v5[2] + 8 + j * 8) = [(MTLAttributeDescriptorInternal *)v9 copyWithZone:a3];
      }
    }
    v5[3] = self->_indexBufferIndex;
    v5[4] = self->_indexType;
  }
  return v5;
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
    v7 = &v14[v2];
    *((void *)v7 + 1) = stepFunction;
    *((void *)v7 + 2) = instanceStepRate;
    v2 += 6;
    ++descriptors;
  }
  while (v2 != 186);
  objc_super v8 = self->_attributeArray->_descriptors;
  for (uint64_t i = 190; i != 376; i += 6)
  {
    v10 = *v8;
    if (*v8)
    {
      unint64_t vertexFormat = v10->_vertexFormat;
      *(void *)&v14[i - 2] = v10->_bufferIndex;
      v10 = (MTLAttributeDescriptorInternal *)v10->_offset;
    }
    else
    {
      unint64_t vertexFormat = 0;
      *(void *)&v14[i - 2] = 0;
    }
    v12 = &v14[i];
    *((void *)v12 - 2) = vertexFormat;
    *(void *)v12 = v10;
    ++v8;
  }
  unint64_t indexBufferIndex = self->_indexBufferIndex;
  unint64_t indexType = self->_indexType;
  return _MTLHashState(v14, 0x5E0uLL);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  if (Class != object_getClass(a3)) {
    return 0;
  }
  for (uint64_t i = 0; i != 31; ++i)
  {
    objc_super v8 = self->_vertexBufferArray->_descriptors[i];
    v9 = *(MTLBufferLayoutDescriptorInternal **)(*((void *)a3 + 1) + 8 + i * 8);
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
  }
  for (uint64_t j = 0; j != 31; ++j)
  {
    v12 = self->_attributeArray->_descriptors[j];
    v13 = *(MTLAttributeDescriptorInternal **)(*((void *)a3 + 2) + 8 + j * 8);
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
  }
  return self->_indexBufferIndex == *((void *)a3 + 3) && self->_indexType == *((void *)a3 + 4);
}

- (id)newSerializedDescriptor
{
  v51[4] = *MEMORY[0x1E4F143B8];
  uint64_t v50 = 0;
  memset(v49, 0, sizeof(v49));
  _MTLMessageContextBegin_((uint64_t)v49, (uint64_t)"-[MTLStageInputOutputDescriptorInternal newSerializedDescriptor]", 743, 0, 5, (uint64_t)"Serialized Descriptor Creation");
  uint64_t v7 = 0;
  int v8 = 0;
  memset(v51, 0, 31);
  unint64_t v9 = 0x1E8F57000uLL;
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
  unint64_t v14 = 0x1E8F57000uLL;
  do
  {
    v15 = self->_attributeArray->_descriptors[v12];
    if (v15 && *(Class *)((char *)&v15->super.super.isa + *(int *)(v14 + 2956)))
    {
      uint64_t v16 = *(uint64_t *)((char *)&self->_vertexBufferArray->super.super.isa + 8 * v15->_bufferIndex
                                                                            + *(int *)(v9 + 2952));
      unint64_t v17 = v9;
      unint64_t v18 = v14;
      validateVertexAttribute(v16, v12, (uint64_t)v15, (uint64_t)v49, v3, v4, v5, v6, v46);
      unint64_t v14 = v18;
      unint64_t v9 = v17;
      *((unsigned char *)v51 + v15->_bufferIndex) = 0;
      ++v13;
    }
    ++v12;
  }
  while (v12 != 31);
  if (v13)
  {
    uint64_t v19 = (16 * v8) | 8;
    size_t v20 = v19 + 8 * v13;
    __int16 v21 = ((v8 & 0x1F) << 6) | ((_WORD)v13 << 11) | (2 * (self->_indexBufferIndex & 0x1F)) | self->_indexType & 1;
    v22 = malloc_type_malloc(v20, 0x9DB263D6uLL);
    bzero(v22, v20);
    uint64_t v28 = 0;
    int v29 = 0;
    _WORD *v22 = v20;
    v22[1] = v21;
    size_t size = v20;
    v22[2] = 8;
    unsigned __int16 v47 = v19;
    v22[3] = v19;
    int v30 = *(_DWORD *)(v9 + 2952);
    unint64_t v31 = 0x1E8F57000uLL;
    do
    {
      vertexBufferArray = self->_vertexBufferArray;
      if (*((unsigned char *)v51 + v28))
      {
        _MTLMessageContextPush_((uint64_t)v49, 4, @"None of the attributes set bufferIndex to %d, but %s set buffer layout[%d].stride(%lu).", v23, v24, v25, v26, v27, v28);
        int v30 = *(_DWORD *)(v9 + 2952);
        vertexBufferArray = self->_vertexBufferArray;
      }
      uint64_t v33 = *(uint64_t *)((char *)&vertexBufferArray->super.super.isa + 8 * v28 + v30);
      if (v33)
      {
        uint64_t v34 = *(void *)(v33 + *(int *)(v31 + 2940));
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
          if (v38 >= 9)
          {
            _MTLMessageContextPush_((uint64_t)v49, 4, @"stepFunction is not a valid MTLStepFunction.", v23, v24, v25, v26, v27, v46);
            unint64_t v38 = *(void *)(v33 + 16);
            uint64_t v36 = *v37;
          }
          ++v29;
          validateFunctionStepRate(v38, v36, (uint64_t)v49, v23, v24, v25, v26, v27, v46);
          int v30 = *(_DWORD *)(v9 + 2952);
          unint64_t v31 = 0x1E8F57000;
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

- (BOOL)validateWithVertexFunction:(id)a3 error:(id *)a4 renderPipelineDescriptor:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t v67 = 0;
  memset(v66, 0, sizeof(v66));
  _MTLMessageContextBegin_((uint64_t)v66, (uint64_t)"-[MTLStageInputOutputDescriptorInternal validateWithVertexFunction:error:renderPipelineDescriptor:]", 904, [a3 device], 4, (uint64_t)"Vertex Descriptor Validation");
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v7 = (void *)[a3 vertexAttributes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v62 objects:v68 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v63;
    unint64_t v11 = 0x1E8F57000uLL;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v63 != v10) {
          objc_enumerationMutation(v7);
        }
        int v13 = *(void **)(*((void *)&v62 + 1) + 8 * v12);
        uint64_t v14 = [v13 attributeIndex];
        if ([v13 isActive])
        {
          uint64_t v19 = self->_attributeArray->_descriptors[v14];
          if (!v19 || !v19->_vertexFormat)
          {
            uint64_t v36 = a4;
            if (a4)
            {
              uint64_t v37 = [v13 name];
              unint64_t v38 = @"Vertex attribute %@(%d) is missing from the vertex descriptor";
              _MTLMessageContextPush_((uint64_t)v66, 2, @"Vertex attribute %@(%d) is missing from the vertex descriptor", v39, v40, v41, v42, v43, v37);
              uint64_t v44 = [v13 name];
              goto LABEL_38;
            }
LABEL_39:
            _MTLMessageContextEnd((uint64_t)v66);
            return 0;
          }
          descriptors = self->_vertexBufferArray->_descriptors;
          uint64_t v21 = *(uint64_t *)((char *)&v19->super.super.isa + *(int *)(v11 + 2964));
          v22 = descriptors[v21];
          if (!v22)
          {
            uint64_t v36 = a4;
            if (a4)
            {
              uint64_t v45 = [v13 name];
              unint64_t v46 = v11;
              unint64_t v38 = @"Vertex attribute %@(%d) references a vertex buffer at index %d, but there is no buffer layout set for that index";
              _MTLMessageContextPush_((uint64_t)v66, 2, @"Vertex attribute %@(%d) references a vertex buffer at index %d, but there is no buffer layout set for that index", v47, v48, v49, v50, v51, v45);
              uint64_t v44 = [v13 name];
              uint64_t v57 = *(uint64_t *)((char *)&v19->super.super.isa + *(int *)(v46 + 2964));
LABEL_38:
              *uint64_t v36 = (id)compilerErrorWithMessage(&v38->isa, v44, v14, v57);
            }
            goto LABEL_39;
          }
          validateVertexAttribute((uint64_t)descriptors[v21], v14, (uint64_t)v19, (uint64_t)v66, v15, v16, v17, v18, v55);
          validateFunctionStepRate(v22->_stepFunction, v22->_instanceStepRate, (uint64_t)v66, v23, v24, v25, v26, v27, v56);
          unint64_t v28 = [v13 attributeType];
          if (v28 < gAttributeTypesCount)
          {
            unint64_t v29 = v28;
            int v30 = [a5 openGLModeEnabled];
            if (v29 || !v30 || byte_1E8F5BDE4)
            {
              int v61 = 0;
              BOOL v60 = 0;
              int v31 = isVertexFormatInteger((MTLAttributeFormat)v19->_vertexFormat, &v61, &v60);
              if ((BYTE3(attributeTypes[3 * v29 + 2]) & 1) == 0)
              {
                if (v61 == 4) {
                  char v32 = v31 ^ 1;
                }
                else {
                  char v32 = 1;
                }
                goto LABEL_24;
              }
              if (v31
                && ((BYTE3(attributeTypes[3 * v29 + 2]) & 2) == 0 || v60)
                && ((BYTE3(attributeTypes[3 * v29 + 2]) & 2) != 0 || !v60))
              {
                [a5 openGLModeEnabled];
              }
              else
              {
                char v32 = 0;
LABEL_24:
                char v33 = [a5 openGLModeEnabled];
                if ((v32 & 1) == 0 && (v33 & 1) == 0)
                {
                  if (a4)
                  {
                    uint64_t v52 = [v13 name];
                    v53 = attributeTypes[3 * v29 + 1];
                    v54 = MTLAttributeFormatString((MTLAttributeFormat)v19->_vertexFormat);
                    *a4 = (id)compilerErrorWithMessage(&cfstr_VertexAttribut_2.isa, v52, v14, v53, v54);
                  }
                  goto LABEL_39;
                }
              }
              unint64_t v11 = 0x1E8F57000;
            }
          }
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v34 = [v7 countByEnumeratingWithState:&v62 objects:v68 count:16];
      uint64_t v9 = v34;
    }
    while (v34);
  }
  if (a4) {
    *a4 = 0;
  }
  _MTLMessageContextEnd((uint64_t)v66);
  return *(void *)&v66[0] == 0;
}

@end