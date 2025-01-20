@interface SCNMTLMesh
- (id)description;
- (uint64_t)bufferForAttribute:(uint64_t)a1;
- (uint64_t)buffers;
- (uint64_t)elements;
- (uint64_t)setMutabilityTimestamp:(uint64_t)result;
- (uint64_t)setVertexDescriptor:(uint64_t)result;
- (uint64_t)setVerticesCount:(uint64_t)result;
- (uint64_t)setVolatileOffset:(uint64_t)result;
- (uint64_t)setVolatileSize:(uint64_t)result;
- (uint64_t)setVolatileStride:(uint64_t)result;
- (uint64_t)vertexDescriptorHash;
- (uint64_t)verticesCount;
- (uint64_t)volatileBuffer;
- (uint64_t)volatileOffset;
- (uint64_t)volatileStride;
- (void)buildTessellationVertexDescriptorIfNeeded;
- (void)dealloc;
- (void)setBuffers:(void *)a1;
- (void)setElements:(void *)a1;
- (void)setVolatileBuffer:(void *)a1;
- (void)tessellationVertexDescriptor;
- (void)tessellationVertexDescriptorHash;
- (void)vertexDescriptorHash;
@end

@implementation SCNMTLMesh

- (uint64_t)buffers
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (uint64_t)verticesCount
{
  if (result) {
    return *(void *)(result + 104);
  }
  return result;
}

- (uint64_t)setVolatileStride:(uint64_t)result
{
  if (result) {
    *(void *)(result + 88) = a2;
  }
  return result;
}

- (uint64_t)setVerticesCount:(uint64_t)result
{
  if (result) {
    *(void *)(result + 104) = a2;
  }
  return result;
}

- (uint64_t)setVertexDescriptor:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    v4 = *(void **)(result + 16);
    if (v4 != a2)
    {

      *(void *)(v3 + 16) = [a2 copy];
      result = [a2 hash];
      *(void *)(v3 + 32) = result;
    }
  }
  return result;
}

- (void)setElements:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 56);
  }
}

- (void)setBuffers:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 48);
  }
}

- (uint64_t)vertexDescriptorHash
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 16))
    {
      v2 = scn_default_log();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
        [(SCNMTLMesh *)v2 vertexDescriptorHash];
      }
    }
    return *(void *)(v1 + 32);
  }
  return result;
}

- (uint64_t)volatileBuffer
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (uint64_t)elements
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (void)buildTessellationVertexDescriptorIfNeeded
{
  if (!self->_tessellationVertexDescriptor)
  {
    if (!self->_vertexDescriptor)
    {
      uint64_t v3 = scn_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
        [(SCNMTLMesh *)v3 vertexDescriptorHash];
      }
    }
    uint64_t v11 = 0;
    self->_tessellationVertexDescriptor = (MTLVertexDescriptor *)[(MTLVertexDescriptor *)self->_vertexDescriptor copy];
    do
      [[(MTLVertexBufferLayoutDescriptorArray *)[(MTLVertexDescriptor *)self->_tessellationVertexDescriptor layouts] objectAtIndexedSubscript:v11++] setStepFunction:4];
    while (v11 != 31);
    self->_tessellationVertexDescriptorHash = [(MTLVertexDescriptor *)self->_tessellationVertexDescriptor hash];
  }
}

- (void)tessellationVertexDescriptor
{
  if (result)
  {
    uint64_t v1 = result;
    [result buildTessellationVertexDescriptorIfNeeded];
    return (void *)v1[3];
  }
  return result;
}

- (void)tessellationVertexDescriptorHash
{
  if (result)
  {
    uint64_t v1 = result;
    [result buildTessellationVertexDescriptorIfNeeded];
    return (void *)v1[5];
  }
  return result;
}

- (id)description
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"<SCNMTLMesh: %p\n", self);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  buffers = self->_buffers;
  uint64_t v5 = [(NSArray *)buffers countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(buffers);
        }
        [v3 appendFormat:@"\tbuffer[%d] : %@\n", v7 + i, *(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v6 = [(NSArray *)buffers countByEnumeratingWithState:&v21 objects:v26 count:16];
      uint64_t v7 = (v7 + i);
    }
    while (v6);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  elements = self->_elements;
  uint64_t v11 = [(NSArray *)elements countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(elements);
        }
        [v3 appendFormat:@"\telement[%d] : %@\n", v13 + j, *(void *)(*((void *)&v17 + 1) + 8 * j)];
      }
      uint64_t v12 = [(NSArray *)elements countByEnumeratingWithState:&v17 objects:v25 count:16];
      uint64_t v13 = (v13 + j);
    }
    while (v12);
  }
  [v3 appendString:@">"];
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLMesh;
  [(SCNMTLMesh *)&v3 dealloc];
}

- (uint64_t)bufferForAttribute:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "attributes"), "objectAtIndexedSubscript:", a2), "bufferIndex");
  uint64_t v4 = v3 - 18;
  if (v3 < 18) {
    return 0;
  }
  uint64_t v5 = *(void **)(a1 + 48);

  return [v5 objectAtIndexedSubscript:v4];
}

- (void)setVolatileBuffer:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 72);
  }
}

- (uint64_t)volatileOffset
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

- (uint64_t)setVolatileOffset:(uint64_t)result
{
  if (result) {
    *(void *)(result + 80) = a2;
  }
  return result;
}

- (uint64_t)volatileStride
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

- (uint64_t)setVolatileSize:(uint64_t)result
{
  if (result) {
    *(void *)(result + 96) = a2;
  }
  return result;
}

- (uint64_t)setMutabilityTimestamp:(uint64_t)result
{
  if (result) {
    *(void *)(result + 8) = a2;
  }
  return result;
}

- (void)vertexDescriptorHash
{
}

@end