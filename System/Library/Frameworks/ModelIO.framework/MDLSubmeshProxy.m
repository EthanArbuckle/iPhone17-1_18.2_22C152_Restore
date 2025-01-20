@interface MDLSubmeshProxy
+ (BOOL)supportsSecureCoding;
- (MDLSubmeshProxy)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MDLSubmeshProxy

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend_appendString_(v3, v4, @"IndexBuffers: \n");
  objc_msgSend_appendFormat_(v3, v5, @"Name: %@\n", self->super._name);
  objc_msgSend_appendFormat_(v3, v6, @"IndexCount: %lu\n", self->super._indexCount);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = self->super._indexBuffer;
    uint64_t v10 = objc_msgSend_data(v7, v8, v9);
    objc_msgSend_appendString_(v3, v11, @"[ ");
    if (self->super._indexCount)
    {
      unint64_t v13 = 0;
      do
        objc_msgSend_appendFormat_(v3, v12, @" (%d), ", *(unsigned int *)(v10 + 4 * v13++));
      while (v13 < self->super._indexCount);
    }
    objc_msgSend_appendString_(v3, v12, @"]\n");
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  objc_msgSend_encodeObject_forKey_(v11, v4, (uint64_t)self->super._allocator, @"allocator");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend_encodeMeshBuffer_withCoder_forKey_(self->super._allocator, v5, (uint64_t)self->super._indexBuffer, v11, @"indexBuffer");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend_encodeMaterialWithCoder_allocator_(self->super._material, v6, (uint64_t)v11, self->super._allocator);
  }
  objc_msgSend_encodeTopologyWithCoder_allocator_(self->super._topology, v6, (uint64_t)v11, self->super._allocator);
  objc_msgSend_encodeObject_forKey_(v11, v7, (uint64_t)self->super._name, @"name");
  objc_msgSend_encodeInteger_forKey_(v11, v8, self->super._indexCount, @"indexCount");
  objc_msgSend_encodeInteger_forKey_(v11, v9, self->super._indexType, @"indexType");
  objc_msgSend_encodeInteger_forKey_(v11, v10, self->super._geometryType, @"geometryType");
}

- (MDLSubmeshProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"allocator");
  v7 = (MDLMeshBufferAllocator *)objc_claimAutoreleasedReturnValue();
  allocator = self->super._allocator;
  self->super._allocator = v7;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_decodeMeshBufferWithCoder_forKey_(self->super._allocator, v9, (uint64_t)v4, @"indexBuffer");
    uint64_t v10 = (MDLMeshBuffer *)objc_claimAutoreleasedReturnValue();
    indexBuffer = self->super._indexBuffer;
    self->super._indexBuffer = v10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_decodeMaterialWithCoder_allocator_(MDLMaterial, v12, (uint64_t)v4, self->super._allocator);
    unint64_t v13 = (MDLMaterial *)objc_claimAutoreleasedReturnValue();
    material = self->super._material;
    self->super._material = v13;
  }
  objc_msgSend_decodeTopologyWithCoder_allocator_(MDLSubmeshTopology, v12, (uint64_t)v4, self->super._allocator);
  v15 = (MDLSubmeshTopology *)objc_claimAutoreleasedReturnValue();
  topology = self->super._topology;
  self->super._topology = v15;

  uint64_t v17 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, @"name");
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->super._name;
  self->super._name = v19;

  self->super._indexCount = objc_msgSend_decodeIntegerForKey_(v4, v21, @"indexCount");
  self->super._indexType = objc_msgSend_decodeIntegerForKey_(v4, v22, @"indexType");
  self->super._geometryType = objc_msgSend_decodeIntegerForKey_(v4, v23, @"geometryType");

  return self;
}

@end