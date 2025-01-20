@interface MDLMeshBufferViewAllocator
- (id)decodeMeshBufferWithCoder:(id)a3 forKey:(id)a4;
- (id)decodeMeshBuffersWithCoder:(id)a3 forKey:(id)a4;
- (id)newBuffer:(unint64_t)a3 type:(unint64_t)a4;
- (id)newBufferFromZone:(id)a3 data:(id)a4 type:(unint64_t)a5;
- (id)newBufferFromZone:(id)a3 length:(unint64_t)a4 type:(unint64_t)a5;
- (id)newBufferViewAtRegionIndex:(int64_t)a3 type:(unint64_t)a4;
- (id)newBufferViewAtRegionIndex:(int64_t)a3 type:(unint64_t)a4 length:(int64_t)a5 offset:(int64_t)a6;
- (id)newBufferWithData:(id)a3 type:(unint64_t)a4;
- (id)newZone:(unint64_t)a3;
- (id)newZoneForBuffersWithSize:(id)a3 andType:(id)a4;
- (void)encodeMeshBuffer:(id)a3 withCoder:(id)a4 forKey:(id)a5;
- (void)encodeMeshBuffers:(id)a3 withCoder:(id)a4 forKey:(id)a5;
@end

@implementation MDLMeshBufferViewAllocator

- (id)newBufferViewAtRegionIndex:(int64_t)a3 type:(unint64_t)a4 length:(int64_t)a5 offset:(int64_t)a6
{
  if (!objc_msgSend__regionAtIndex_length_offset_(self, a2, a3, a5, a6)) {
    return 0;
  }
  BaseAddress = IOSurfaceGetBaseAddress(self->super._sharedRegions.__begin_[self->super._regionIndices.__begin_[a3]]);
  v12 = [MDLBufferView alloc];
  v14 = objc_msgSend_initWithBytesNoCopy_length_offset_regionIndex_allocator_(v12, v13, (uint64_t)BaseAddress, a5, a6, a3, self);
  v15 = [MDLMeshBufferView alloc];
  v17 = objc_msgSend_initWithBufferViewNoCopy_type_(v15, v16, (uint64_t)v14, a4);

  return v17;
}

- (id)newBufferViewAtRegionIndex:(int64_t)a3 type:(unint64_t)a4
{
  if (!objc_msgSend__regionAtIndex_(self, a2, a3)) {
    return 0;
  }
  v7 = self->super._sharedRegions.__begin_[self->super._regionIndices.__begin_[a3]];
  BaseAddress = IOSurfaceGetBaseAddress(v7);
  size_t AllocSize = IOSurfaceGetAllocSize(v7);
  v10 = [MDLBufferView alloc];
  v12 = objc_msgSend_initWithBytesNoCopy_length_offset_regionIndex_allocator_(v10, v11, (uint64_t)BaseAddress, AllocSize, 0, a3, self);
  v13 = [MDLMeshBufferView alloc];
  v15 = objc_msgSend_initWithBufferViewNoCopy_type_(v13, v14, (uint64_t)v12, a4);

  return v15;
}

- (void)encodeMeshBuffer:(id)a3 withCoder:(id)a4 forKey:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = v18;
    v12 = objc_msgSend_stringByAppendingString_(v9, v11, @".view");
    objc_msgSend_encodeBuffer_withCoder_forKey_(self, v13, (uint64_t)v10, v8, v12);

    uint64_t v14 = v10[7];
    v16 = objc_msgSend_stringByAppendingString_(v9, v15, @".type");
    objc_msgSend_encodeInteger_forKey_(v8, v17, v14, v16);
  }
}

- (void)encodeMeshBuffers:(id)a3 withCoder:(id)a4 forKey:(id)a5
{
  id v29 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_count(v29, v10, v11);
  uint64_t v14 = objc_msgSend_stringByAppendingString_(v9, v13, @".count");
  objc_msgSend_encodeInteger_forKey_(v8, v15, v12, v14);

  for (unint64_t i = 0; i < objc_msgSend_count(v29, v16, v17); ++i)
  {
    v20 = objc_msgSend_stringByAppendingFormat_(v9, v19, @"[%ld]", i);
    v22 = objc_msgSend_objectAtIndexedSubscript_(v29, v21, i);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v25 = objc_msgSend_objectAtIndexedSubscript_(v29, v24, i);
      v27 = objc_msgSend_stringByAppendingString_(v20, v26, @".view");
      objc_msgSend_encodeMeshBuffer_withCoder_forKey_(self, v28, (uint64_t)v25, v8, v27);
    }
  }
}

- (id)decodeMeshBuffersWithCoder:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v24 = a4;
  id v8 = objc_msgSend_stringByAppendingString_(v24, v7, @".count");
  uint64_t v10 = objc_msgSend_decodeIntegerForKey_(v6, v9, (uint64_t)v8);

  id v11 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v14 = objc_msgSend_initWithCapacity_(v11, v12, v10);
  if (v10 >= 1)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      v16 = objc_msgSend_stringByAppendingFormat_(v24, v13, @"[%ld]", i);
      id v18 = objc_msgSend_stringByAppendingString_(v16, v17, @".view");
      id v19 = v6;
      v21 = objc_msgSend_decodeMeshBufferWithCoder_forKey_(self, v20, (uint64_t)v6, v18);

      objc_msgSend_addObject_(v14, v22, (uint64_t)v21);
      id v6 = v19;
    }
  }

  return v14;
}

- (id)decodeMeshBufferWithCoder:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = objc_msgSend_stringByAppendingString_(v7, v8, @".view");
  id v11 = objc_msgSend_decodeBufferWithCoder_forKey_(self, v10, (uint64_t)v6, v9);

  v13 = objc_msgSend_stringByAppendingString_(v7, v12, @".type");
  uint64_t v15 = objc_msgSend_decodeIntegerForKey_(v6, v14, (uint64_t)v13);

  v16 = [MDLMeshBufferView alloc];
  id v18 = objc_msgSend_initWithBufferViewNoCopy_type_(v16, v17, (uint64_t)v11, v15);

  return v18;
}

- (id)newBuffer:(unint64_t)a3 type:(unint64_t)a4
{
  return 0;
}

- (id)newBufferFromZone:(id)a3 data:(id)a4 type:(unint64_t)a5
{
  return 0;
}

- (id)newBufferFromZone:(id)a3 length:(unint64_t)a4 type:(unint64_t)a5
{
  return 0;
}

- (id)newBufferWithData:(id)a3 type:(unint64_t)a4
{
  return 0;
}

- (id)newZone:(unint64_t)a3
{
  return 0;
}

- (id)newZoneForBuffersWithSize:(id)a3 andType:(id)a4
{
  return 0;
}

@end