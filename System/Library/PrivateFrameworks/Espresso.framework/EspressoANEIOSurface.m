@interface EspressoANEIOSurface
- (BOOL)checkIfMatches:(__CVBuffer *)a3;
- (BOOL)checkIfMatchesIOSurface:(__IOSurface *)a3;
- (EspressoANEIOSurface)initWithIOSurfaceProperties:(id)a3 andPixelFormats:(id)a4;
- (__IOSurface)createIOSurfaceWithExtraProperties:(id)a3;
- (__IOSurface)ioSurfaceForMultiBufferFrame:(unint64_t)a3;
- (__IOSurface)ioSurfaceForMultiBufferFrameNoLazyForTesting:(unint64_t)a3;
- (id).cxx_construct;
- (id)ane_io_surfaceForMultiBufferFrame:(unint64_t)a3;
- (id)metalBufferWithDevice:(id)a3 multiBufferFrame:(unint64_t)a4;
- (shared_ptr<Espresso::blob<unsigned)external_storage_blob_for_aliasing_mem;
- (unint64_t)nFrames;
- (unsigned)pixelFormat;
- (void)cleanup;
- (void)doNonLazyAllocation:(id)a3;
- (void)lazilyAutoCreateSurfaceForFrame:(unint64_t)a3;
- (void)resizeForMultipleAsyncBuffers:(unint64_t)a3;
- (void)restoreInternalStorage:(unint64_t)a3;
- (void)restoreInternalStorageForAllMultiBufferFrames;
- (void)setExternalStorage:(unint64_t)a3 ioSurface:(__IOSurface *)a4;
- (void)setExternal_storage_blob_for_aliasing_mem:(shared_ptr<Espresso:(1>>)a3 :blob<unsigned)char;
@end

@implementation EspressoANEIOSurface

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  return self;
}

- (void)setExternal_storage_blob_for_aliasing_mem:(shared_ptr<Espresso:(1>>)a3 :blob<unsigned)char
{
  v4 = *(void **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_external_storage_blob_for_aliasing_mem.__cntrl_;
  self->_external_storage_blob_for_aliasing_mem.__ptr_ = v4;
  self->_external_storage_blob_for_aliasing_mem.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
}

- (void)doNonLazyAllocation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->created_with_lazy_iosurface)
  {
    id v10 = v4;
    v6 = [(EspressoANEIOSurface *)self createIOSurfaceWithExtraProperties:v4];
    *((void *)self->multiple_buffer_io_surfaces.__begin_ + 2) = v6;
    uint64_t v7 = [MEMORY[0x1E4F4E048] objectWithIOSurface:v6];
    begin = self->multiple_buffer_io_surfaces.__begin_;
    v9 = (void *)*((void *)begin + 1);
    *((void *)begin + 1) = v7;

    self->created_with_lazy_iosurface = 0;
    id v5 = v10;
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (__IOSurface)createIOSurfaceWithExtraProperties:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->params_dict];
    [(NSDictionary *)v5 addEntriesFromDictionary:v4];
  }
  else
  {
    id v5 = self->params_dict;
  }
  if (self->ane_surface_use_cvpixelbuffer)
  {
    CVPixelBufferRef pixelBufferOut = 0;
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], self->width, self->height, self->_pixelFormat, (CFDictionaryRef)v5, &pixelBufferOut))
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Error creating CVPixelBuffer");
    }
    else
    {
      IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(pixelBufferOut);
      uint64_t v7 = IOSurface;
      if (IOSurface)
      {
        CFRetain(IOSurface);
        CVBufferRelease(pixelBufferOut);
        goto LABEL_9;
      }
      CVBufferRelease(pixelBufferOut);
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Could not get an IOSurface from the pixel buffer");
    }
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  uint64_t v7 = IOSurfaceCreate((CFDictionaryRef)v5);
  if (!v7)
  {
    id v10 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v10, "Error creating IOSurface");
    __cxa_throw(v10, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
LABEL_9:

  return v7;
}

- (unint64_t)nFrames
{
  return 0xCCCCCCCCCCCCCCCDLL
       * ((self->multiple_buffer_io_surfaces.__end_ - self->multiple_buffer_io_surfaces.__begin_) >> 3);
}

- (__IOSurface)ioSurfaceForMultiBufferFrame:(unint64_t)a3
{
  uint64_t v3 = [(EspressoANEIOSurface *)self ane_io_surfaceForMultiBufferFrame:a3];
  id v4 = (__IOSurface *)[v3 ioSurface];

  return v4;
}

- (id)ane_io_surfaceForMultiBufferFrame:(unint64_t)a3
{
  -[EspressoANEIOSurface lazilyAutoCreateSurfaceForFrame:](self, "lazilyAutoCreateSurfaceForFrame:");
  id v5 = (void *)*((void *)self->multiple_buffer_io_surfaces.__begin_ + 5 * a3 + 1);

  return v5;
}

- (void)lazilyAutoCreateSurfaceForFrame:(unint64_t)a3
{
  if (!*((void *)self->multiple_buffer_io_surfaces.__begin_ + 5 * a3 + 1))
  {
    id v5 = Espresso::espresso_os_log_subsystem((Espresso *)self, a2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v11 = 0;
      _os_log_debug_impl(&dword_1920CB000, v5, OS_LOG_TYPE_DEBUG, "EspressoANEIOSurface::lazilyAutoCreateSurfaceForFrame", v11, 2u);
    }

    v6 = [(EspressoANEIOSurface *)self createIOSurfaceWithExtraProperties:0];
    unint64_t v7 = 5 * a3;
    *((void *)self->multiple_buffer_io_surfaces.__begin_ + v7 + 2) = v6;
    uint64_t v8 = [MEMORY[0x1E4F4E048] objectWithIOSurface:v6];
    v9 = (char *)self->multiple_buffer_io_surfaces.__begin_ + 8 * v7;
    id v10 = (void *)*((void *)v9 + 1);
    *((void *)v9 + 1) = v8;
  }
}

- (EspressoANEIOSurface)initWithIOSurfaceProperties:(id)a3 andPixelFormats:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)EspressoANEIOSurface;
  uint64_t v8 = [(EspressoANEIOSurface *)&v24 init];
  v9 = (EspressoANEIOSurface *)v8;
  if (v8)
  {
    v8[40] = 1;
    id v10 = v8 + 16;
    std::vector<Espresso::ANERuntimeEngine::surface_and_buffer>::resize((char **)v8 + 2, 1uLL);
    v11 = *(void **)(*(void *)v10 + 8);
    *(void *)(*(void *)v10 + 8) = 0;

    uint64_t v12 = [v6 copy];
    params_dict = v9->params_dict;
    v9->params_dict = (NSDictionary *)v12;

    uint64_t v14 = *MEMORY[0x1E4F24D70];
    v15 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F24D70]];
    v9->ane_surface_use_cvpixelbuffer = v15 != 0;

    if (v9->ane_surface_use_cvpixelbuffer)
    {
      v16 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F24E10]];
      v9->width = [v16 unsignedIntValue];

      v17 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F24D08]];
      v9->height = [v17 unsignedIntValue];

      v18 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F24C98]];
      v9->rowBytes = [v18 unsignedIntValue];

      v19 = [v6 objectForKeyedSubscript:v14];
      v9->_pixelFormat = [v19 unsignedIntValue];
    }
    else
    {
      v20 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2F2C0]];
      v9->width = [v20 unsignedIntValue];

      v21 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2F0E8]];
      v9->height = [v21 unsignedIntValue];

      v19 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2EFE0]];
      v9->rowBytes = [v19 unsignedIntValue];
    }

    objc_storeStrong((id *)&v9->valid_pixel_formats, a4);
    v22 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
  cntrl = self->_external_storage_blob_for_aliasing_mem.__cntrl_;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->valid_pixel_formats, 0);
  begin = self->multiple_buffer_io_surfaces.__begin_;
  if (begin)
  {
    end = (void **)self->multiple_buffer_io_surfaces.__end_;
    id v6 = self->multiple_buffer_io_surfaces.__begin_;
    if (end != (void **)begin)
    {
      do
      {
        end -= 5;
        std::allocator<Espresso::ANERuntimeEngine::surface_and_buffer>::destroy[abi:ne180100](end);
      }
      while (end != (void **)begin);
      id v6 = self->multiple_buffer_io_surfaces.__begin_;
    }
    self->multiple_buffer_io_surfaces.__end_ = begin;
    operator delete(v6);
  }

  objc_storeStrong((id *)&self->params_dict, 0);
}

- (shared_ptr<Espresso::blob<unsigned)external_storage_blob_for_aliasing_mem
{
  cntrl = self->_external_storage_blob_for_aliasing_mem.__cntrl_;
  *v2 = self->_external_storage_blob_for_aliasing_mem.__ptr_;
  v2[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (id)metalBufferWithDevice:(id)a3 multiBufferFrame:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)*((void *)self->multiple_buffer_io_surfaces.__begin_ + 5 * a4);
  if (!v7)
  {
    uint64_t v8 = objc_msgSend(v6, "newBufferWithIOSurface:", -[EspressoANEIOSurface ioSurfaceForMultiBufferFrame:](self, "ioSurfaceForMultiBufferFrame:", a4));
    begin = self->multiple_buffer_io_surfaces.__begin_;
    unint64_t v10 = 5 * a4;
    v11 = (void *)*((void *)begin + v10);
    *((void *)begin + v10) = v8;

    id v7 = (void *)*((void *)self->multiple_buffer_io_surfaces.__begin_ + v10);
  }
  id v12 = v7;

  return v12;
}

- (void)restoreInternalStorageForAllMultiBufferFrames
{
  if (self->multiple_buffer_io_surfaces.__end_ != self->multiple_buffer_io_surfaces.__begin_)
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    do
    {
      [(EspressoANEIOSurface *)self restoreInternalStorage:v3 >> 32];
      ++v4;
      v3 += 0x100000000;
    }
    while (v4 < 0xCCCCCCCCCCCCCCCDLL
               * ((self->multiple_buffer_io_surfaces.__end_ - self->multiple_buffer_io_surfaces.__begin_) >> 3));
  }
}

- (void)restoreInternalStorage:(unint64_t)a3
{
  begin = self->multiple_buffer_io_surfaces.__begin_;
  unint64_t v4 = (char *)begin + 40 * a3;
  int v6 = v4[24];
  id v5 = v4 + 24;
  if (v6)
  {
    objc_storeStrong((id *)begin + 5 * a3 + 1, *((id *)begin + 5 * a3 + 4));
    *id v5 = 0;
  }
}

- (void)setExternalStorage:(unint64_t)a3 ioSurface:(__IOSurface *)a4
{
  uint64_t PixelFormat = IOSurfaceGetPixelFormat(a4);
  if ([(NSSet *)self->valid_pixel_formats count])
  {
    valid_pixel_formats = self->valid_pixel_formats;
    v9 = [NSNumber numberWithUnsignedInt:PixelFormat];
    unint64_t v10 = [(NSSet *)valid_pixel_formats member:v9];

    if (!v10) {
      Espresso::throw_exception_selector<Espresso::invalid_argument_error>("Bad pixel format");
    }
  }
  begin = self->multiple_buffer_io_surfaces.__begin_;
  id v12 = (char *)begin + 40 * a3;
  int v14 = v12[24];
  v13 = v12 + 24;
  if (!v14)
  {
    objc_storeStrong((id *)begin + 5 * a3 + 4, *((id *)begin + 5 * a3 + 1));
    unsigned char *v13 = 1;
  }
  v15 = (char *)begin + 40 * a3;
  uint64_t v16 = [MEMORY[0x1E4F4E048] objectWithIOSurface:a4];
  v17 = (void *)*((void *)v15 + 1);
  *((void *)v15 + 1) = v16;

  v18 = *(void **)v15;
  *(void *)v15 = 0;

  self->_pixelFormat = PixelFormat;
}

- (void)cleanup
{
  begin = self->multiple_buffer_io_surfaces.__begin_;
  if (self->multiple_buffer_io_surfaces.__end_ != begin)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      int v6 = *(const void **)((char *)begin + v4 + 16);
      if (v6)
      {
        CFRelease(v6);
        begin = self->multiple_buffer_io_surfaces.__begin_;
      }
      id v7 = (char *)begin + v4;
      uint64_t v8 = (void *)*((void *)v7 + 1);
      *((void *)v7 + 1) = 0;

      v9 = self->multiple_buffer_io_surfaces.__begin_;
      unint64_t v10 = *(void **)((char *)v9 + v4);
      *(void *)((char *)v9 + v4) = 0;

      ++v5;
      begin = self->multiple_buffer_io_surfaces.__begin_;
      v4 += 40;
    }
    while (v5 < 0xCCCCCCCCCCCCCCCDLL * ((self->multiple_buffer_io_surfaces.__end_ - begin) >> 3));
  }
}

- (__IOSurface)ioSurfaceForMultiBufferFrameNoLazyForTesting:(unint64_t)a3
{
  return (__IOSurface *)[*((id *)self->multiple_buffer_io_surfaces.__begin_ + 5 * a3 + 1) ioSurface];
}

- (BOOL)checkIfMatchesIOSurface:(__IOSurface *)a3
{
  return 0;
}

- (BOOL)checkIfMatches:(__CVBuffer *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (CVPixelBufferGetIOSurface(a3))
  {
    size_t Height = CVPixelBufferGetHeight(a3);
    if (self->ane_surface_use_cvpixelbuffer)
    {
      size_t Width = CVPixelBufferGetWidth(a3);
      PixelFormatType = (Espresso *)CVPixelBufferGetPixelFormatType(a3);
      int v10 = (int)PixelFormatType;
      if (self->width != Width || self->height != Height)
      {
        v11 = Espresso::espresso_os_log_subsystem(PixelFormatType, v9);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v12 = self->width;
          unint64_t v13 = self->height;
          unsigned int pixelFormat = self->_pixelFormat;
          int v24 = 134219264;
          unint64_t v25 = v12;
          __int16 v26 = 2048;
          size_t v27 = Width;
          __int16 v28 = 2048;
          unint64_t v29 = v13;
          __int16 v30 = 2048;
          size_t v31 = Height;
          __int16 v32 = 1024;
          unsigned int v33 = pixelFormat;
          __int16 v34 = 1024;
          int v35 = v10;
          v15 = "Mismatching CVPixelBuffer Params: width: expected:%zu != client:%zu; height: expected:%zu != client:%zu;"
                " pixel format expected:%x != client:%x";
          uint64_t v16 = v11;
          uint32_t v17 = 54;
LABEL_14:
          _os_log_debug_impl(&dword_1920CB000, v16, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v24, v17);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
    }
    else
    {
      BytesPerRow = (Espresso *)CVPixelBufferGetBytesPerRow(a3);
      v20 = BytesPerRow;
      if (self->height != Height || (Espresso *)self->rowBytes != BytesPerRow)
      {
        v11 = Espresso::espresso_os_log_subsystem(BytesPerRow, v19);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v22 = self->height;
          unint64_t rowBytes = self->rowBytes;
          int v24 = 134218752;
          unint64_t v25 = v22;
          __int16 v26 = 2048;
          size_t v27 = Height;
          __int16 v28 = 2048;
          unint64_t v29 = rowBytes;
          __int16 v30 = 2048;
          size_t v31 = (size_t)v20;
          v15 = "Mismatching IOSurface Params: height: expected:%zu != client:%zu || rowBytes expected:%zu != client:%zu";
          uint64_t v16 = v11;
          uint32_t v17 = 42;
          goto LABEL_14;
        }
        goto LABEL_15;
      }
    }
    return 1;
  }
  v11 = Espresso::espresso_os_log_subsystem(0, v5);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v24) = 0;
    v15 = "Could not get IOSurface from cvpixelbuffer";
    uint64_t v16 = v11;
    uint32_t v17 = 2;
    goto LABEL_14;
  }
LABEL_15:

  return 0;
}

- (void)resizeForMultipleAsyncBuffers:(unint64_t)a3
{
  p_multiple_buffer_io_surfaces = &self->multiple_buffer_io_surfaces;
  if (0xCCCCCCCCCCCCCCCDLL
     * ((self->multiple_buffer_io_surfaces.__end_ - self->multiple_buffer_io_surfaces.__begin_) >> 3) < a3)
  {
    std::vector<Espresso::ANERuntimeEngine::surface_and_buffer>::resize((char **)&self->multiple_buffer_io_surfaces, a3);
    if (a3 >= 2)
    {
      uint64_t v6 = 0;
      unint64_t v7 = a3 - 1;
      do
      {
        begin = p_multiple_buffer_io_surfaces->__begin_;
        if (!*(void *)((char *)p_multiple_buffer_io_surfaces->__begin_ + v6 + 48))
        {
          if (!self->created_with_lazy_iosurface)
          {
            v9 = [(EspressoANEIOSurface *)self createIOSurfaceWithExtraProperties:0];
            *(void *)((char *)self->multiple_buffer_io_surfaces.__begin_ + v6 + 56) = v9;
            uint64_t v10 = [MEMORY[0x1E4F4E048] objectWithIOSurface:v9];
            v11 = (char *)self->multiple_buffer_io_surfaces.__begin_ + v6;
            unint64_t v12 = (void *)*((void *)v11 + 6);
            *((void *)v11 + 6) = v10;

            begin = self->multiple_buffer_io_surfaces.__begin_;
          }
          unint64_t v13 = (char *)begin + v6;
          int v14 = (void *)*((void *)v13 + 5);
          *((void *)v13 + 5) = 0;
        }
        v6 += 40;
        --v7;
      }
      while (v7);
    }
  }
}

@end