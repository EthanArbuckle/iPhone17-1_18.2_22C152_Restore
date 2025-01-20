@interface MDLMeshBufferAllocatorDefault
- (id)newBuffer:(unint64_t)a3 type:(unint64_t)a4;
- (id)newBufferFromZone:(id)a3 data:(id)a4 type:(unint64_t)a5;
- (id)newBufferFromZone:(id)a3 length:(unint64_t)a4 type:(unint64_t)a5;
- (id)newBufferWithData:(id)a3 type:(unint64_t)a4;
- (id)newZone:(unint64_t)a3;
- (id)newZoneForBuffersWithSize:(id)a3 andType:(id)a4;
@end

@implementation MDLMeshBufferAllocatorDefault

- (id)newZone:(unint64_t)a3
{
  v4 = [MDLMeshBufferZoneDefault alloc];

  return (id)MEMORY[0x270F9A6D0](v4, sel_initWithCapacity_allocator_, a3);
}

- (id)newBuffer:(unint64_t)a3 type:(unint64_t)a4
{
  v7 = [MDLMeshBufferData alloc];
  id result = (id)objc_msgSend_initWithLength_data_allocator_zone_(v7, v8, a3, 0, self, 0);
  *((void *)result + 6) = a4;
  return result;
}

- (id)newBufferWithData:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v7 = [MDLMeshBufferData alloc];
  uint64_t v10 = objc_msgSend_length(v6, v8, v9);
  v12 = objc_msgSend_initWithLength_data_allocator_zone_(v7, v11, v10, v6, self, 0);
  v12[6] = a4;

  return v12;
}

- (id)newBufferFromZone:(id)a3 length:(unint64_t)a4 type:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = [MDLMeshBufferData alloc];
  v11 = objc_msgSend_initWithLength_data_allocator_zone_(v9, v10, a4, 0, self, v8);
  v11[6] = a5;

  return v11;
}

- (id)newBufferFromZone:(id)a3 data:(id)a4 type:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [MDLMeshBufferData alloc];
  uint64_t v13 = objc_msgSend_length(v9, v11, v12);
  v15 = objc_msgSend_initWithLength_data_allocator_zone_(v10, v14, v13, v9, self, v8);
  v15[6] = a5;

  return v15;
}

- (id)newZoneForBuffersWithSize:(id)a3 andType:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_count(v6, v8, v9);
  if (v10 == objc_msgSend_count(v7, v11, v12))
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v6;
    uint64_t v15 = 0;
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v24, v28, 16);
    if (v18)
    {
      uint64_t v19 = *(void *)v25;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v13);
          }
          v15 += objc_msgSend_unsignedIntegerValue(*(void **)(*((void *)&v24 + 1) + 8 * v20++), v16, v17, (void)v24);
        }
        while (v18 != v20);
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v24, v28, 16);
      }
      while (v18);
    }

    v22 = objc_msgSend_newZone_(self, v21, v15);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end