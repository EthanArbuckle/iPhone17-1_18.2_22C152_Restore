@interface GTMTLReplaySharedResourcePool
- (GTMTLReplaySharedResourcePool)initWithDevice:(id)a3 bufferCapacity:(unint64_t)a4;
- (MTLDevice)device;
- (id)newBufferHeapWithLength:(unint64_t)a3;
- (id)newTextureWithDescriptor:(id)a3 error:(id *)a4;
- (unint64_t)defaultBufferCapacity;
- (void)dealloc;
- (void)reclaimAllocatedSize:(unint64_t)a3;
- (void)reclaimBuffer:(id)a3;
- (void)releasePooledBuffers;
- (void)setMaxPooledBuffers:(unint64_t)a3;
- (void)waitUntilCapacity;
@end

@implementation GTMTLReplaySharedResourcePool

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_pooledBuffers, 0);
}

- (unint64_t)defaultBufferCapacity
{
  return self->_defaultBufferCapacity;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)releasePooledBuffers
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  [(NSMutableArray *)self->_pooledBuffers removeAllObjects];

  pthread_mutex_unlock(p_mutex);
}

- (void)setMaxPooledBuffers:(unint64_t)a3
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  v6 = (char *)[(NSMutableArray *)self->_pooledBuffers count];
  if ((unint64_t)v6 > a3) {
    -[NSMutableArray removeObjectsInRange:](self->_pooledBuffers, "removeObjectsInRange:", a3, &v6[-a3]);
  }
  self->_maxPooledBuffers = a3;

  pthread_mutex_unlock(p_mutex);
}

- (void)reclaimAllocatedSize:(unint64_t)a3
{
}

- (void)reclaimBuffer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[v4 length];
  pthread_mutex_lock(&self->_mutex);
  if (v5 == self->_defaultBufferCapacity
    && (unint64_t)[(NSMutableArray *)self->_pooledBuffers count] < self->_maxPooledBuffers)
  {
    [(NSMutableArray *)self->_pooledBuffers addObject:v4];
  }
  pthread_mutex_unlock(&self->_mutex);

  atomic_fetch_add((atomic_ullong *volatile)&self->_usedSize, -v5);

  pthread_cond_broadcast(&self->_cond);
}

- (id)newTextureWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MTLDevice *)self->_device heapTextureSizeAndAlignWithDescriptor:v6];
  uint64_t v8 = (uint64_t)v7;
  if (v7)
  {
    atomic_fetch_add((atomic_ullong *volatile)&self->_usedSize, (unint64_t)v7);
    id v9 = [(MTLDevice *)self->_device newTextureWithDescriptor:v6];
  }
  else
  {
    v10 = (char *)[v6 pixelFormat];
    if (v10 == (unsigned char *)&stru_1F8.addr + 4) {
      int v11 = 875704438;
    }
    else {
      int v11 = 0;
    }
    unsigned int v12 = [v6 width];
    unsigned int v13 = [v6 height];
    if (v12)
    {
      unsigned int v14 = v13;
      if (v13)
      {
        if (v10 == (unsigned char *)&stru_1F8.addr + 4)
        {
          uint64_t v8 = MinBytesPerRow(v11, v12);
          if (v8)
          {
            if (IsBiplanar(v11))
            {
              unsigned int v15 = (v12 + 1) >> 1;
              unsigned int v16 = MinBytesPerRow(826486840, v12);
              unsigned int v17 = MinBytesPerRow(843264056, v15);
              if (v16 <= v17) {
                unsigned int v18 = v17;
              }
              else {
                unsigned int v18 = v16;
              }
              uint64_t v8 = (v14 + ((v14 + 1) >> 1)) * ((v18 + 15) & 0xFFFFFFF0);
            }
            else
            {
              uint64_t v8 = ((v8 + 15) & 0x1FFFFFFF0) * v12;
            }
          }
        }
      }
    }
    atomic_fetch_add((atomic_ullong *volatile)&self->_usedSize, v8);
    unsigned int v19 = [v6 width];
    unsigned int v20 = [v6 height];
    unint64_t v21 = 0;
    if (v19)
    {
      unsigned int v22 = v20;
      if (v20)
      {
        if (v10 == (unsigned char *)&stru_1F8.addr + 4)
        {
          unint64_t v21 = MinBytesPerRow(v11, v19);
          if (v21)
          {
            v66 = a4;
            Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            LODWORD(valuePtr) = v19;
            CFNumberRef v24 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
            CFDictionarySetValue(Mutable, kIOSurfaceWidth, v24);
            CFRelease(v24);
            LODWORD(valuePtr) = v22;
            CFNumberRef v25 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
            CFDictionarySetValue(Mutable, kIOSurfaceHeight, v25);
            CFRelease(v25);
            LODWORD(valuePtr) = v11;
            CFNumberRef v26 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
            CFDictionarySetValue(Mutable, kIOSurfacePixelFormat, v26);
            CFRelease(v26);
            if (IsBiplanar(v11))
            {
              unsigned int v62 = BytesPerElement(826486840);
              unsigned int v65 = BytesPerElement(843264056);
              unsigned int v63 = ElementWidth(826486840);
              unsigned int v64 = ElementWidth(843264056);
              unsigned int v27 = MinBytesPerRow(826486840, v19);
              unsigned int v28 = MinBytesPerRow(843264056, (v19 + 1) >> 1);
              if (v27 <= v28) {
                unsigned int v29 = v28;
              }
              else {
                unsigned int v29 = v27;
              }
              unsigned int v30 = (v29 + 15) & 0xFFFFFFF0;
              LODWORD(valuePtr) = v30;
              CFNumberRef v31 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
              CFDictionarySetValue(Mutable, kIOSurfaceBytesPerRow, v31);
              CFRelease(v31);
              LODWORD(valuePtr) = (v22 + ((v22 + 1) >> 1)) * v30;
              CFNumberRef v32 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
              CFDictionarySetValue(Mutable, kIOSurfaceAllocSize, v32);
              CFRelease(v32);
              CFMutableDictionaryRef v33 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              CFMutableDictionaryRef valuePtr = v33;
              unsigned int v67 = v19;
              CFNumberRef v34 = CFNumberCreate(0, kCFNumberIntType, &v67);
              CFDictionarySetValue(v33, kIOSurfacePlaneWidth, v34);
              CFRelease(v34);
              unsigned int v67 = v22;
              CFNumberRef v35 = CFNumberCreate(0, kCFNumberIntType, &v67);
              CFDictionarySetValue(v33, kIOSurfacePlaneHeight, v35);
              CFRelease(v35);
              CFStringRef v61 = kIOSurfacePlaneOffset;
              unsigned int v67 = 0;
              CFNumberRef v36 = CFNumberCreate(0, kCFNumberIntType, &v67);
              CFDictionarySetValue(v33, kIOSurfacePlaneOffset, v36);
              CFRelease(v36);
              unsigned int v67 = v30;
              CFNumberRef v37 = CFNumberCreate(0, kCFNumberIntType, &v67);
              CFDictionarySetValue(v33, kIOSurfacePlaneBytesPerRow, v37);
              CFRelease(v37);
              unsigned int v67 = v62;
              CFNumberRef v38 = CFNumberCreate(0, kCFNumberIntType, &v67);
              CFDictionarySetValue(v33, kIOSurfacePlaneBytesPerElement, v38);
              CFRelease(v38);
              unsigned int v67 = v63;
              CFNumberRef v39 = CFNumberCreate(0, kCFNumberIntType, &v67);
              CFDictionarySetValue(v33, kIOSurfacePlaneElementWidth, v39);
              CFRelease(v39);
              v40 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              v71 = v40;
              unsigned int v67 = (v19 + 1) >> 1;
              CFNumberRef v41 = CFNumberCreate(0, kCFNumberIntType, &v67);
              CFDictionarySetValue(v40, kIOSurfacePlaneWidth, v41);
              CFRelease(v41);
              unsigned int v67 = (v22 + 1) >> 1;
              CFNumberRef v42 = CFNumberCreate(0, kCFNumberIntType, &v67);
              CFDictionarySetValue(v40, kIOSurfacePlaneHeight, v42);
              CFRelease(v42);
              unsigned int v67 = v30 * v22;
              CFNumberRef v43 = CFNumberCreate(0, kCFNumberIntType, &v67);
              CFDictionarySetValue(v40, kIOSurfacePlaneOffset, v43);
              CFRelease(v43);
              unsigned int v67 = v30;
              CFDictionaryRef v44 = Mutable;
              CFNumberRef v45 = CFNumberCreate(0, kCFNumberIntType, &v67);
              CFDictionarySetValue(v40, kIOSurfacePlaneBytesPerRow, v45);
              CFRelease(v45);
              unsigned int v67 = v65;
              CFNumberRef v46 = CFNumberCreate(0, kCFNumberIntType, &v67);
              CFDictionarySetValue(v40, kIOSurfacePlaneBytesPerElement, v46);
              CFRelease(v46);
              unsigned int v67 = v64;
              CFNumberRef v47 = CFNumberCreate(0, kCFNumberIntType, &v67);
              CFDictionarySetValue(v40, kIOSurfacePlaneElementWidth, v47);
              CFRelease(v47);
              CFArrayRef v48 = CFArrayCreate(0, (const void **)&valuePtr, 2, &kCFTypeArrayCallBacks);
              CFDictionarySetValue(Mutable, kIOSurfacePlaneInfo, v48);
              CFRelease(v48);
              CFRelease(valuePtr);
              CFNumberRef v49 = v71;
            }
            else
            {
              LODWORD(valuePtr) = (v21 + 15) & 0xFFFFFFF0;
              CFNumberRef v50 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
              CFDictionaryRef v44 = Mutable;
              CFDictionarySetValue(Mutable, kIOSurfaceBytesPerRow, v50);
              CFRelease(v50);
              unint64_t v51 = ElementWidth(v11);
              if (v51 >= 2)
              {
                LODWORD(valuePtr) = v51;
                CFNumberRef v52 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
                CFDictionarySetValue(Mutable, kIOSurfaceElementWidth, v52);
                CFRelease(v52);
              }
              LODWORD(valuePtr) = BytesPerElement(v11);
              CFNumberRef v53 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
              CFDictionarySetValue(Mutable, kIOSurfaceBytesPerElement, v53);
              CFNumberRef v49 = v53;
            }
            CFRelease(v49);
            a4 = v66;
            unint64_t v21 = (unint64_t)IOSurfaceCreate(v44);
            CFRelease(v44);
          }
        }
      }
    }
    id v9 = -[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v6, v21, 0, v61);
  }
  v54 = v9;
  if (v9)
  {
    v55 = [[GTMTLReplaySharedTexture alloc] initWithAllocatedSize:v8 resourcePool:self];
    objc_setAssociatedObject(v54, &AssociatedObjectKey, v55, (char *)&def_1C1270 + 1);
    id v56 = v54;
  }
  else
  {
    CFStringRef v68 = @"GTErrorKeyMTLTextureDescriptor";
    v57 = SerializeMTLTextureDescriptorToDictionary(v6);
    v69 = v57;
    v58 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];

    GTMTLReplay_fillError(a4, 101, v58);
    if (a4) {
      id v59 = *a4;
    }
    else {
      id v59 = 0;
    }
    GTMTLReplay_handleNSError(v59);
  }
  return v54;
}

- (id)newBufferHeapWithLength:(unint64_t)a3
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  atomic_fetch_add((atomic_ullong *volatile)&self->_usedSize, a3);
  if (self->_defaultBufferCapacity != a3)
  {
    pthread_mutex_unlock(p_mutex);
    goto LABEL_5;
  }
  id v6 = [(NSMutableArray *)self->_pooledBuffers lastObject];
  [(NSMutableArray *)self->_pooledBuffers removeLastObject];
  pthread_mutex_unlock(p_mutex);
  if (!v6)
  {
LABEL_5:
    id result = [(MTLDevice *)self->_device newBufferWithLength:a3 options:256];
    id v6 = result;
    if (!result) {
      return result;
    }
  }
  uint64_t v8 = [[GTMTLReplaySharedBufferHeap alloc] initWithBuffer:v6 resourcePool:self];

  return v8;
}

- (void)waitUntilCapacity
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  unint64_t maxSize = self->_maxSize;
  unint64_t v5 = atomic_load(&self->_usedSize);
  if (maxSize < v5)
  {
    do
    {
      pthread_cond_wait(&self->_cond, p_mutex);
      unint64_t v6 = self->_maxSize;
      unint64_t v7 = atomic_load(&self->_usedSize);
    }
    while (v6 < v7);
  }

  pthread_mutex_unlock(p_mutex);
}

- (void)dealloc
{
  pthread_cond_destroy(&self->_cond);
  pthread_mutex_destroy(&self->_mutex);
  v3.receiver = self;
  v3.super_class = (Class)GTMTLReplaySharedResourcePool;
  [(GTMTLReplaySharedResourcePool *)&v3 dealloc];
}

- (GTMTLReplaySharedResourcePool)initWithDevice:(id)a3 bufferCapacity:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GTMTLReplaySharedResourcePool;
  uint64_t v8 = [(GTMTLReplaySharedResourcePool *)&v13 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v9->_defaultBufferCapacity = a4;
    pthread_mutex_init(&v9->_mutex, 0);
    pthread_cond_init(&v9->_cond, 0);
    v9->_maxPooledBuffers = 8;
    v10 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v9->_maxPooledBuffers];
    pooledBuffers = v9->_pooledBuffers;
    v9->_pooledBuffers = v10;

    v9->_unint64_t maxSize = (unint64_t)(unsigned __int16)word_773138 << 20;
  }

  return v9;
}

@end