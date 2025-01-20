@interface MTLBufferDescriptor
- (BOOL)isEqual:(id)a3;
- (BOOL)noCopy;
- (MTLBufferDescriptor)init;
- (MTLResourceAddressRangeArray)addressRanges;
- (__IOSurface)iosurface;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deallocator;
- (unint64_t)alignment;
- (unint64_t)cpuCacheMode;
- (unint64_t)hash;
- (unint64_t)hazardTrackingMode;
- (unint64_t)length;
- (unint64_t)parentGPUAddress;
- (unint64_t)parentGPUSize;
- (unint64_t)pinnedGPUAddress;
- (unint64_t)pointerTag;
- (unint64_t)resourceOptions;
- (unint64_t)storageMode;
- (void)contents;
- (void)dealloc;
- (void)setAddressRanges:(id)a3;
- (void)setAlignment:(unint64_t)a3;
- (void)setContents:(void *)a3;
- (void)setCpuCacheMode:(unint64_t)a3;
- (void)setDeallocator:(id)a3;
- (void)setHazardTrackingMode:(unint64_t)a3;
- (void)setIosurface:(__IOSurface *)a3;
- (void)setLength:(unint64_t)a3;
- (void)setNoCopy:(BOOL)a3;
- (void)setParentGPUAddress:(unint64_t)a3;
- (void)setParentGPUSize:(unint64_t)a3;
- (void)setPinnedGPUAddress:(unint64_t)a3;
- (void)setPointerTag:(unint64_t)a3;
- (void)setResourceOptions:(unint64_t)a3;
- (void)setStorageMode:(unint64_t)a3;
@end

@implementation MTLBufferDescriptor

- (unint64_t)pinnedGPUAddress
{
  return self->_pinnedGPUAddress;
}

- (void)setResourceOptions:(unint64_t)a3
{
  self->_resourceOptions = a3;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (unint64_t)resourceOptions
{
  return self->_resourceOptions;
}

- (unint64_t)pointerTag
{
  return self->_pointerTag;
}

- (unint64_t)parentGPUSize
{
  return self->_parentGPUSize;
}

- (unint64_t)parentGPUAddress
{
  return self->_parentGPUAddress;
}

- (BOOL)noCopy
{
  return self->_noCopy;
}

- (unint64_t)length
{
  return self->_length;
}

- (__IOSurface)iosurface
{
  return self->_iosurface;
}

- (void)contents
{
  return self->_contents;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (MTLResourceAddressRangeArray)addressRanges
{
  return self->_addressRanges;
}

- (unint64_t)storageMode
{
  return self->_resourceOptions >> 4;
}

- (void)dealloc
{
  id deallocator = self->_deallocator;
  if (deallocator) {
    _Block_release(deallocator);
  }

  self->_addressRanges = 0;
  v4.receiver = self;
  v4.super_class = (Class)MTLBufferDescriptor;
  [(MTLBufferDescriptor *)&v4 dealloc];
}

- (MTLBufferDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLBufferDescriptor;
  result = [(MTLBufferDescriptor *)&v3 init];
  if (result)
  {
    result->_noCopy = 0;
    result->_contents = 0;
    result->_id deallocator = 0;
    result->_length = 0;
    *(_OWORD *)&result->_alignment = xmmword_1828F1510;
    result->_iosurface = 0;
    *(_OWORD *)&result->_pinnedGPUAddress = 0u;
    *(_OWORD *)&result->_parentGPUSize = 0u;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_opt_new();
  v5 = v4;
  if (v4)
  {
    [v4 setLength:self->_length];
    [v5 setNoCopy:self->_noCopy];
    [v5 setResourceOptions:self->_resourceOptions];
    [v5 setAlignment:self->_alignment];
    [v5 setParentGPUAddress:self->_parentGPUAddress];
    [v5 setParentGPUSize:self->_parentGPUSize];
    [v5 setPinnedGPUAddress:self->_pinnedGPUAddress];
    [v5 setPointerTag:self->_pointerTag];
    [v5 setDeallocator:self->_deallocator];
    [v5 setContents:self->_contents];
    v5[11] = [(MTLResourceAddressRangeArray *)self->_addressRanges copy];
    [v5 setIosurface:self->_iosurface];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v23) = 1;
  }
  else
  {
    uint64_t v26 = v5;
    uint64_t v27 = v4;
    uint64_t v28 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    unint64_t length = self->_length;
    if (length != [a3 length]) {
      goto LABEL_17;
    }
    unint64_t alignment = self->_alignment;
    if (alignment != [a3 alignment]) {
      goto LABEL_17;
    }
    unint64_t resourceOptions = self->_resourceOptions;
    if (resourceOptions != [a3 resourceOptions]) {
      goto LABEL_17;
    }
    contents = self->_contents;
    if (contents != (void *)[a3 contents]) {
      goto LABEL_17;
    }
    int noCopy = self->_noCopy;
    if (noCopy == [a3 noCopy]
      && (id deallocator = self->_deallocator, deallocator == (id)[a3 deallocator])
      && (unint64_t pinnedGPUAddress = self->_pinnedGPUAddress, pinnedGPUAddress == [a3 pinnedGPUAddress])
      && (unint64_t pointerTag = self->_pointerTag, pointerTag == [a3 pointerTag])
      && (unint64_t parentGPUAddress = self->_parentGPUAddress, parentGPUAddress == [a3 parentGPUAddress])
      && (unint64_t parentGPUSize = self->_parentGPUSize, parentGPUSize == [a3 parentGPUSize])
      && (BOOL v21 = self->_addressRanges != 0, v21 != ([a3 addressRanges] == 0)))
    {
      addressRanges = self->_addressRanges;
      if (!addressRanges
        || (BOOL v23 = -[MTLResourceAddressRangeArray isEqual:](addressRanges, "isEqual:", [a3 addressRanges])))
      {
        iosurface = self->_iosurface;
        LOBYTE(v23) = iosurface == (__IOSurface *)objc_msgSend(a3, "iosurface", v6, v26, v27, v28, v7, v8);
      }
    }
    else
    {
LABEL_17:
      LOBYTE(v23) = 0;
    }
  }
  return v23;
}

- (unint64_t)hash
{
  bzero(v5, 0x58uLL);
  v5[0] = [(MTLBufferDescriptor *)self length];
  v5[1] = [(MTLBufferDescriptor *)self resourceOptions];
  BOOL v6 = [(MTLBufferDescriptor *)self noCopy];
  uint64_t v7 = [(MTLBufferDescriptor *)self contents];
  id v8 = [(MTLBufferDescriptor *)self deallocator];
  unint64_t v9 = [(MTLBufferDescriptor *)self alignment];
  unint64_t v11 = [(MTLBufferDescriptor *)self parentGPUAddress];
  unint64_t v12 = [(MTLBufferDescriptor *)self parentGPUSize];
  unint64_t v10 = [(MTLBufferDescriptor *)self pinnedGPUAddress];
  unint64_t v13 = [(MTLBufferDescriptor *)self pointerTag];
  v14 = [(MTLBufferDescriptor *)self iosurface];
  unsigned int v3 = _MTLHashState((int *)v5, 0x58uLL);
  return [(MTLResourceAddressRangeArray *)self->_addressRanges hash] + v3;
}

- (void)setDeallocator:(id)a3
{
  id deallocator = self->_deallocator;
  if (deallocator != a3)
  {
    if (deallocator) {
      _Block_release(deallocator);
    }
    self->_id deallocator = _Block_copy(a3);
  }
}

- (void)setCpuCacheMode:(unint64_t)a3
{
  self->_unint64_t resourceOptions = self->_resourceOptions & 0xFFFFFFFFFFFFFFF0 | a3;
}

- (unint64_t)cpuCacheMode
{
  return self->_resourceOptions & 0xF;
}

- (void)setHazardTrackingMode:(unint64_t)a3
{
  self->_unint64_t resourceOptions = self->_resourceOptions & 0xFFFFFFFFFFFFFCFFLL | (a3 << 8);
}

- (unint64_t)hazardTrackingMode
{
  return (self->_resourceOptions >> 8) & 3;
}

- (void)setStorageMode:(unint64_t)a3
{
  self->_unint64_t resourceOptions = self->_resourceOptions & 0xFFFFFFFFFFFFFF0FLL | (16 * a3);
}

- (void)setContents:(void *)a3
{
  self->_contents = a3;
}

- (void)setNoCopy:(BOOL)a3
{
  self->_int noCopy = a3;
}

- (id)deallocator
{
  return self->_deallocator;
}

- (void)setPinnedGPUAddress:(unint64_t)a3
{
  self->_unint64_t pinnedGPUAddress = a3;
}

- (void)setParentGPUAddress:(unint64_t)a3
{
  self->_unint64_t parentGPUAddress = a3;
}

- (void)setParentGPUSize:(unint64_t)a3
{
  self->_unint64_t parentGPUSize = a3;
}

- (void)setPointerTag:(unint64_t)a3
{
  self->_unint64_t pointerTag = a3;
}

- (void)setAddressRanges:(id)a3
{
}

- (void)setIosurface:(__IOSurface *)a3
{
  self->_iosurface = a3;
}

@end