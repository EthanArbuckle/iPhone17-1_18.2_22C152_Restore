@interface MDLBufferViewAllocator
+ (BOOL)supportsSecureCoding;
- (MDLBufferViewAllocator)initWithCoder:(id)a3;
- (MDLBufferViewAllocator)initWithSharedRegionsNoCopy:(id)a3;
- (__IOSurface)_regionAtIndex:(int64_t)a3;
- (__IOSurface)_regionAtIndex:(int64_t)a3 length:(int64_t)a4 offset:(int64_t)a5;
- (id).cxx_construct;
- (id)decodeBufferWithCoder:(id)a3 forKey:(id)a4;
- (id)decodeBuffersWithCoder:(id)a3 forKey:(id)a4;
- (id)newBufferViewAtRegionIndex:(int64_t)a3;
- (id)newBufferViewAtRegionIndex:(int64_t)a3 length:(int64_t)a4 offset:(int64_t)a5;
- (void)dealloc;
- (void)encodeBuffer:(id)a3 withCoder:(id)a4 forKey:(id)a5;
- (void)encodeBuffers:(id)a3 withCoder:(id)a4 forKey:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MDLBufferViewAllocator

- (__IOSurface)_regionAtIndex:(int64_t)a3
{
  if (a3 < 0)
  {
    NSLog(&cfstr_RegionindexMus.isa, a2);
  }
  else
  {
    begin = self->_regionIndices.__begin_;
    if (a3 >= (unint64_t)(self->_regionIndices.__end_ - begin))
    {
      NSLog(&cfstr_RequestedRegio.isa, a2, a3);
    }
    else
    {
      int64_t v4 = begin[a3];
      result = self->_sharedRegions.__begin_[v4];
      if (result) {
        return result;
      }
      NSLog(&cfstr_RegionAtIndexL.isa, a2, v4);
    }
  }
  return 0;
}

- (__IOSurface)_regionAtIndex:(int64_t)a3 length:(int64_t)a4 offset:(int64_t)a5
{
  v8 = (__IOSurface *)objc_msgSend__regionAtIndex_(self, a2, a3);
  v9 = v8;
  if (v8)
  {
    if (a4 <= 0)
    {
      NSLog(&cfstr_LengthLdIsInva.isa, a4);
      return 0;
    }
    if (a5 < 0)
    {
      NSLog(&cfstr_OffsetLdIsInva.isa, a5);
      return 0;
    }
    size_t AllocSize = IOSurfaceGetAllocSize(v8);
    if (a5 + a4 > AllocSize)
    {
      NSLog(&cfstr_RequestedLengt.isa, a4, a5, AllocSize, a3);
      return 0;
    }
  }
  return v9;
}

- (MDLBufferViewAllocator)initWithSharedRegionsNoCopy:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v56 = a3;
  v66.receiver = self;
  v66.super_class = (Class)MDLBufferViewAllocator;
  int64_t v4 = [(MDLBufferViewAllocator *)&v66 init];
  if (!v4) {
    goto LABEL_66;
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v56;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v62, v67, 16);
  if (!v6) {
    goto LABEL_62;
  }
  uint64_t v7 = 0;
  p_sharedRegions = &v4->_sharedRegions;
  uint64_t v8 = *(void *)v63;
  uint64_t p_end_cap = (uint64_t)&v4->_regionIndices.__end_cap_;
  p_begin = (void **)&v4->_regionIndices.__begin_;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v63 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(*((void *)&v62 + 1) + 8 * i);
      if (objc_opt_respondsToSelector())
      {
        id v11 = v10;
        if (objc_msgSend_iosurface(v11, v12, v13))
        {
          uint64_t v16 = objc_msgSend_iosurface(v11, v14, v15);
          uint64_t v17 = v16;
          end = v4->_sharedRegions.__end_;
          value = v4->_sharedRegions.__end_cap_.__value_;
          if (end >= value)
          {
            uint64_t v30 = (__IOSurface **)end - p_sharedRegions->__begin_;
            if ((unint64_t)(v30 + 1) >> 61) {
              sub_20B05D0BC();
            }
            uint64_t v31 = (char *)value - (char *)p_sharedRegions->__begin_;
            uint64_t v32 = v31 >> 2;
            if (v31 >> 2 <= (unint64_t)(v30 + 1)) {
              uint64_t v32 = v30 + 1;
            }
            if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v33 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v33 = v32;
            }
            if (v33) {
              v34 = (char *)sub_20B0602EC((uint64_t)&v4->_sharedRegions.__end_cap_, v33);
            }
            else {
              v34 = 0;
            }
            v37 = (__IOSurface **)&v34[8 * v30];
            *v37 = (__IOSurface *)v17;
            v20 = v37 + 1;
            begin = v4->_sharedRegions.__begin_;
            v38 = v4->_sharedRegions.__end_;
            if (v38 != begin)
            {
              do
              {
                v40 = *--v38;
                *--v37 = v40;
              }
              while (v38 != begin);
              v38 = p_sharedRegions->__begin_;
            }
            v4->_sharedRegions.__begin_ = v37;
            v4->_sharedRegions.__end_ = v20;
            v4->_sharedRegions.__end_cap_.__value_ = (__IOSurface **)&v34[8 * v33];
            if (v38) {
              operator delete(v38);
            }
          }
          else
          {
            void *end = v16;
            v20 = (__IOSurface **)(end + 1);
          }
          v4->_sharedRegions.__end_ = v20;
          v42 = v4->_regionIndices.__end_;
          v41 = v4->_regionIndices.__end_cap_.__value_;
          if (v42 >= v41)
          {
            v44 = (int64_t *)*p_begin;
            uint64_t v45 = ((char *)v42 - (unsigned char *)*p_begin) >> 3;
            unint64_t v46 = v45 + 1;
            if ((unint64_t)(v45 + 1) >> 61) {
              sub_20B05D0BC();
            }
            uint64_t v47 = (char *)v41 - (char *)v44;
            if (v47 >> 2 > v46) {
              unint64_t v46 = v47 >> 2;
            }
            if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v48 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v48 = v46;
            }
            if (v48)
            {
              v49 = (char *)sub_20B0602EC(p_end_cap, v48);
              v44 = v4->_regionIndices.__begin_;
              v42 = v4->_regionIndices.__end_;
            }
            else
            {
              v49 = 0;
            }
            v50 = (int64_t *)&v49[8 * v45];
            int64_t *v50 = v7;
            v43 = v50 + 1;
            while (v42 != v44)
            {
              int64_t v51 = *--v42;
              *--v50 = v51;
            }
            v4->_regionIndices.__begin_ = v50;
            v4->_regionIndices.__end_ = v43;
            v4->_regionIndices.__end_cap_.__value_ = (int64_t *)&v49[8 * v48];
            if (v44) {
              operator delete(v44);
            }
          }
          else
          {
            int64_t *v42 = v7;
            v43 = v42 + 1;
          }
          v4->_regionIndices.__end_ = v43;

          uint64_t v7 = (v7 + 1);
          goto LABEL_60;
        }
      }
      NSLog(&cfstr_WarningCannotF.isa, v7);
      v22 = v4->_regionIndices.__end_;
      v21 = v4->_regionIndices.__end_cap_.__value_;
      if (v22 >= v21)
      {
        v24 = (int64_t *)*p_begin;
        uint64_t v25 = ((char *)v22 - (unsigned char *)*p_begin) >> 3;
        unint64_t v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 61) {
          sub_20B05D0BC();
        }
        uint64_t v27 = (char *)v21 - (char *)v24;
        if (v27 >> 2 > v26) {
          unint64_t v26 = v27 >> 2;
        }
        if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v28 = v26;
        }
        if (v28)
        {
          v29 = (char *)sub_20B0602EC(p_end_cap, v28);
          v24 = v4->_regionIndices.__begin_;
          v22 = v4->_regionIndices.__end_;
        }
        else
        {
          v29 = 0;
        }
        v35 = (int64_t *)&v29[8 * v25];
        int64_t *v35 = -1;
        v23 = v35 + 1;
        while (v22 != v24)
        {
          int64_t v36 = *--v22;
          *--v35 = v36;
        }
        v4->_regionIndices.__begin_ = v35;
        v4->_regionIndices.__end_ = v23;
        v4->_regionIndices.__end_cap_.__value_ = (int64_t *)&v29[8 * v28];
        if (v24) {
          operator delete(v24);
        }
      }
      else
      {
        int64_t *v22 = -1;
        v23 = v22 + 1;
      }
      v4->_regionIndices.__end_ = v23;
LABEL_60:
    }
    uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v52, (uint64_t)&v62, v67, 16);
  }
  while (v6);
LABEL_62:

  if (v4->_sharedRegions.__end_ != v4->_sharedRegions.__begin_)
  {
    unint64_t v53 = 0;
    do
    {
      char v61 = 0;
      sub_20B09572C((uint64_t)&v4->_owned, &v61);
      ++v53;
    }
    while (v53 < v4->_sharedRegions.__end_ - v4->_sharedRegions.__begin_);
  }
  v54 = v4;
LABEL_66:

  return v4;
}

- (void)dealloc
{
  begin = self->_sharedRegions.__begin_;
  end = self->_sharedRegions.__end_;
  if (end != begin)
  {
    unint64_t v5 = 0;
    do
    {
      unint64_t v6 = self->_regionIndices.__begin_[v5];
      if ((*(unint64_t *)((char *)self->_owned.__begin_ + ((v6 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v6))
      {
        uint64_t v7 = begin[v6];
        if (v7)
        {
          CFRelease(v7);
          begin = self->_sharedRegions.__begin_;
          end = self->_sharedRegions.__end_;
        }
      }
      ++v5;
    }
    while (v5 < end - begin);
  }
  v8.receiver = self;
  v8.super_class = (Class)MDLBufferViewAllocator;
  [(MDLBufferViewAllocator *)&v8 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  objc_msgSend_encodeInteger_forKey_(v16, v4, self->_sharedRegions.__end_ - self->_sharedRegions.__begin_, @"sharedRegions.count");
  if (self->_sharedRegions.__end_ != self->_sharedRegions.__begin_)
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = objc_msgSend_stringWithFormat_(NSString, v5, @"sharedRegions[%zu]", v6);
      xpc_object_t XPCObject = IOSurfaceCreateXPCObject(self->_sharedRegions.__begin_[v6]);
      id v10 = objc_msgSend_stringByAppendingFormat_(v7, v9, @".iosurface");
      objc_msgSend_encodeXPCObject_forKey_(v16, v11, (uint64_t)XPCObject, v10);

      ++v6;
    }
    while (v6 < self->_sharedRegions.__end_ - self->_sharedRegions.__begin_);
  }
  objc_msgSend_encodeInteger_forKey_(v16, v5, self->_regionIndices.__end_ - self->_regionIndices.__begin_, @"regionIndices.count");
  if (self->_regionIndices.__end_ != self->_regionIndices.__begin_)
  {
    unint64_t v13 = 0;
    do
    {
      v14 = objc_msgSend_stringWithFormat_(NSString, v12, @"regionIndices[%zu]", v13);
      objc_msgSend_encodeInteger_forKey_(v16, v15, v13, v14);

      ++v13;
    }
    while (v13 < self->_regionIndices.__end_ - self->_regionIndices.__begin_);
  }
}

- (MDLBufferViewAllocator)initWithCoder:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)MDLBufferViewAllocator;
  unint64_t v6 = [(MDLBufferViewAllocator *)&v52 init];
  if (v6)
  {
    uint64_t v8 = objc_msgSend_decodeIntegerForKey_(v4, v5, @"sharedRegions.count");
    if (v8 >= 1)
    {
      uint64_t v9 = 0;
      p_sharedRegions = &v6->_sharedRegions;
      do
      {
        id v11 = objc_msgSend_stringWithFormat_(NSString, v7, @"sharedRegions[%zu]", v9);
        unint64_t v13 = objc_msgSend_stringByAppendingFormat_(v11, v12, @".iosurface");
        uint64_t v15 = objc_msgSend_decodeXPCObjectForKey_(v4, v14, (uint64_t)v13);

        char v51 = 1;
        sub_20B09572C((uint64_t)&v6->_owned, &v51);
        IOSurfaceRef v16 = IOSurfaceLookupFromXPCObject(v15);
        IOSurfaceRef v17 = v16;
        end = v6->_sharedRegions.__end_;
        value = v6->_sharedRegions.__end_cap_.__value_;
        if (end >= value)
        {
          uint64_t v21 = end - p_sharedRegions->__begin_;
          if ((unint64_t)(v21 + 1) >> 61) {
            sub_20B05D0BC();
          }
          uint64_t v22 = (char *)value - (char *)p_sharedRegions->__begin_;
          uint64_t v23 = v22 >> 2;
          if (v22 >> 2 <= (unint64_t)(v21 + 1)) {
            uint64_t v23 = v21 + 1;
          }
          if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v24 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v24 = v23;
          }
          if (v24) {
            uint64_t v25 = (char *)sub_20B0602EC((uint64_t)&v6->_sharedRegions.__end_cap_, v24);
          }
          else {
            uint64_t v25 = 0;
          }
          unint64_t v26 = (__IOSurface **)&v25[8 * v21];
          *unint64_t v26 = v17;
          v20 = v26 + 1;
          begin = v6->_sharedRegions.__begin_;
          uint64_t v27 = v6->_sharedRegions.__end_;
          if (v27 != begin)
          {
            do
            {
              v29 = *--v27;
              *--unint64_t v26 = v29;
            }
            while (v27 != begin);
            uint64_t v27 = p_sharedRegions->__begin_;
          }
          v6->_sharedRegions.__begin_ = v26;
          v6->_sharedRegions.__end_ = v20;
          v6->_sharedRegions.__end_cap_.__value_ = (__IOSurface **)&v25[8 * v24];
          if (v27) {
            operator delete(v27);
          }
        }
        else
        {
          void *end = v16;
          v20 = end + 1;
        }
        v6->_sharedRegions.__end_ = v20;

        ++v9;
      }
      while (v9 != v8);
    }
    uint64_t v31 = objc_msgSend_decodeIntegerForKey_(v4, v7, @"regionIndices.count");
    if (v31 >= 1)
    {
      uint64_t v32 = 0;
      p_begin = (void **)&v6->_regionIndices.__begin_;
      do
      {
        v34 = objc_msgSend_stringWithFormat_(NSString, v30, @"regionIndices[%zu]", v32);
        uint64_t v36 = objc_msgSend_decodeIntegerForKey_(v4, v35, (uint64_t)v34);
        uint64_t v37 = v36;
        v39 = v6->_regionIndices.__end_;
        v38 = v6->_regionIndices.__end_cap_.__value_;
        if (v39 >= v38)
        {
          v41 = (int64_t *)*p_begin;
          uint64_t v42 = ((char *)v39 - (unsigned char *)*p_begin) >> 3;
          unint64_t v43 = v42 + 1;
          if ((unint64_t)(v42 + 1) >> 61) {
            sub_20B05D0BC();
          }
          uint64_t v44 = (char *)v38 - (char *)v41;
          if (v44 >> 2 > v43) {
            unint64_t v43 = v44 >> 2;
          }
          if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v45 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v45 = v43;
          }
          if (v45)
          {
            unint64_t v46 = (char *)sub_20B0602EC((uint64_t)&v6->_regionIndices.__end_cap_, v45);
            v41 = v6->_regionIndices.__begin_;
            v39 = v6->_regionIndices.__end_;
          }
          else
          {
            unint64_t v46 = 0;
          }
          uint64_t v47 = (int64_t *)&v46[8 * v42];
          *uint64_t v47 = v37;
          v40 = v47 + 1;
          while (v39 != v41)
          {
            int64_t v48 = *--v39;
            *--uint64_t v47 = v48;
          }
          v6->_regionIndices.__begin_ = v47;
          v6->_regionIndices.__end_ = v40;
          v6->_regionIndices.__end_cap_.__value_ = (int64_t *)&v46[8 * v45];
          if (v41) {
            operator delete(v41);
          }
        }
        else
        {
          int64_t *v39 = v36;
          v40 = v39 + 1;
        }
        v6->_regionIndices.__end_ = v40;

        ++v32;
      }
      while (v32 != v31);
    }
    v49 = v6;
  }

  return v6;
}

- (id)newBufferViewAtRegionIndex:(int64_t)a3 length:(int64_t)a4 offset:(int64_t)a5
{
  id result = (id)objc_msgSend__regionAtIndex_length_offset_(self, a2, a3);
  if (result)
  {
    BaseAddress = IOSurfaceGetBaseAddress((IOSurfaceRef)result);
    id v11 = [MDLBufferView alloc];
    return (id)objc_msgSend_initWithBytesNoCopy_length_offset_regionIndex_allocator_(v11, v12, (uint64_t)BaseAddress, a4, a5, a3, self);
  }
  return result;
}

- (id)newBufferViewAtRegionIndex:(int64_t)a3
{
  id result = (id)objc_msgSend__regionAtIndex_(self, a2, a3);
  if (result)
  {
    unint64_t v6 = (__IOSurface *)result;
    BaseAddress = IOSurfaceGetBaseAddress((IOSurfaceRef)result);
    size_t AllocSize = IOSurfaceGetAllocSize(v6);
    uint64_t v9 = [MDLBufferView alloc];
    return (id)objc_msgSend_initWithBytesNoCopy_length_offset_regionIndex_allocator_(v9, v10, (uint64_t)BaseAddress, AllocSize, 0, a3, self);
  }
  return result;
}

- (void)encodeBuffer:(id)a3 withCoder:(id)a4 forKey:(id)a5
{
  id v22 = a3;
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = v22;
    uint64_t v10 = v9[4];
    v12 = objc_msgSend_stringByAppendingString_(v8, v11, @".regionIndex");
    objc_msgSend_encodeInteger_forKey_(v7, v13, v10, v12);

    uint64_t v14 = v9[3];
    IOSurfaceRef v16 = objc_msgSend_stringByAppendingString_(v8, v15, @".offset");
    objc_msgSend_encodeInteger_forKey_(v7, v17, v14, v16);

    uint64_t v18 = v9[2];
    v20 = objc_msgSend_stringByAppendingString_(v8, v19, @".length");
    objc_msgSend_encodeInteger_forKey_(v7, v21, v18, v20);
  }
}

- (void)encodeBuffers:(id)a3 withCoder:(id)a4 forKey:(id)a5
{
  id v37 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v11 = objc_msgSend_count(v37, v9, v10);
  unint64_t v13 = objc_msgSend_stringByAppendingString_(v8, v12, @".count");
  objc_msgSend_encodeInteger_forKey_(v7, v14, v11, v13);

  for (unint64_t i = 0; i < objc_msgSend_count(v37, v15, v16); ++i)
  {
    v19 = objc_msgSend_stringByAppendingFormat_(v8, v18, @"[%ld]", i);
    uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(v37, v20, i);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      unint64_t v24 = objc_msgSend_objectAtIndexedSubscript_(v37, v23, i);
      uint64_t v25 = v24[4];
      uint64_t v27 = objc_msgSend_stringByAppendingString_(v19, v26, @".regionIndex");
      objc_msgSend_encodeInteger_forKey_(v7, v28, v25, v27);

      uint64_t v29 = v24[3];
      uint64_t v31 = objc_msgSend_stringByAppendingString_(v19, v30, @".offset");
      objc_msgSend_encodeInteger_forKey_(v7, v32, v29, v31);

      uint64_t v33 = v24[2];
      v35 = objc_msgSend_stringByAppendingString_(v19, v34, @".length");
      objc_msgSend_encodeInteger_forKey_(v7, v36, v33, v35);
    }
  }
}

- (id)decodeBuffersWithCoder:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = objc_msgSend_stringByAppendingString_(v7, v8, @".count");
  uint64_t v11 = objc_msgSend_decodeIntegerForKey_(v6, v10, (uint64_t)v9);

  id v12 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v15 = objc_msgSend_initWithCapacity_(v12, v13, v11);
  if (v11 >= 1)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      IOSurfaceRef v17 = objc_msgSend_stringByAppendingFormat_(v7, v14, @"[%ld]", i);
      uint64_t v18 = objc_alloc_init(MDLBufferView);
      v20 = objc_msgSend_stringByAppendingString_(v17, v19, @".regionIndex");
      v18->_regionIndex = objc_msgSend_decodeIntegerForKey_(v6, v21, (uint64_t)v20);

      v18->_data = IOSurfaceGetBaseAddress(self->_sharedRegions.__begin_[self->_regionIndices.__begin_[v18->_regionIndex]]);
      uint64_t v23 = objc_msgSend_stringByAppendingString_(v17, v22, @".offset");
      v18->_offset = objc_msgSend_decodeIntegerForKey_(v6, v24, (uint64_t)v23);

      unint64_t v26 = objc_msgSend_stringByAppendingString_(v17, v25, @".length");
      v18->_length = objc_msgSend_decodeIntegerForKey_(v6, v27, (uint64_t)v26);

      objc_storeStrong((id *)&v18->_allocator, self);
      objc_msgSend_addObject_(v15, v28, (uint64_t)v18);
    }
  }

  return v15;
}

- (id)decodeBufferWithCoder:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MDLMeshBufferView);
  uint64_t v10 = objc_msgSend_stringByAppendingString_(v7, v9, @".regionIndex");
  v8->super._unint64_t regionIndex = objc_msgSend_decodeIntegerForKey_(v6, v11, (uint64_t)v10);

  unint64_t regionIndex = v8->super._regionIndex;
  if ((regionIndex & 0x8000000000000000) != 0
    || (begin = self->_regionIndices.__begin_, regionIndex >= self->_regionIndices.__end_ - begin)
    || (unint64_t v14 = begin[regionIndex], (v14 & 0x8000000000000000) != 0)
    || (uint64_t v15 = self->_sharedRegions.__begin_, v14 >= self->_sharedRegions.__end_ - v15))
  {
    v8->super._data = 0;
    v8->super._length = 0;
    v8->super._offset = 0;
    allocator = v8->super._allocator;
    v8->super._allocator = 0;
  }
  else
  {
    v8->super._data = IOSurfaceGetBaseAddress(v15[v14]);
    IOSurfaceRef v17 = objc_msgSend_stringByAppendingString_(v7, v16, @".offset");
    v8->super._offset = objc_msgSend_decodeIntegerForKey_(v6, v18, (uint64_t)v17);

    v20 = objc_msgSend_stringByAppendingString_(v7, v19, @".length");
    v8->super._length = objc_msgSend_decodeIntegerForKey_(v6, v21, (uint64_t)v20);

    id v22 = self;
    allocator = v8->super._allocator;
    v8->super._allocator = v22;
  }

  return v8;
}

- (void).cxx_destruct
{
  begin = self->_regionIndices.__begin_;
  if (begin)
  {
    self->_regionIndices.__end_ = begin;
    operator delete(begin);
  }
  id v4 = self->_owned.__begin_;
  if (v4) {
    operator delete(v4);
  }
  unint64_t v5 = self->_sharedRegions.__begin_;
  if (v5)
  {
    self->_sharedRegions.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end