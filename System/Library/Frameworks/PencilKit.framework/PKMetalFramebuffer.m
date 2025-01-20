@interface PKMetalFramebuffer
- (PKMetalFramebuffer)init;
- (double)size;
- (id)initWithSize:(void *)a3 pixelFormat:(char)a4 device:(char)a5 memoryless:(void *)a6 backedByIOSurface:(int)a7 sampleCount:(double)a8 purgeable:(double)a9;
- (uint64_t)incrementNonPurgeableCount;
- (void)dealloc;
- (void)decrementNonPurgeableCount;
@end

@implementation PKMetalFramebuffer

- (PKMetalFramebuffer)init
{
}

- (id)initWithSize:(void *)a3 pixelFormat:(char)a4 device:(char)a5 memoryless:(void *)a6 backedByIOSurface:(int)a7 sampleCount:(double)a8 purgeable:(double)a9
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  if (a1)
  {
    v55.receiver = a1;
    v55.super_class = (Class)PKMetalFramebuffer;
    v19 = (id *)objc_msgSendSuper2(&v55, sel_init);
    a1 = v19;
    if (v19)
    {
      *((double *)v19 + 9) = ceil(a8);
      *((double *)v19 + 10) = ceil(a9);
      objc_storeStrong(v19 + 4, a3);
      *((unsigned char *)a1 + 18) = a4;
      *((unsigned char *)a1 + 19) = a5;
      a1[5] = a2;
      a1[6] = a6;
      if (a1[3])
      {
        if (a7)
        {
LABEL_5:
          BOOL v20 = *((unsigned char *)a1 + 18) == 0;
LABEL_32:
          *((unsigned char *)a1 + 17) = v20;
          *(_OWORD *)(a1 + 11) = 0u;
          *(_OWORD *)(a1 + 13) = 0u;
          a1[8] = (id)8;
          goto LABEL_33;
        }
      }
      else
      {
        int v21 = [a1[4] supportsFamily:1001];
        BOOL v22 = +[PKMetalUtility deviceSupportsFramebufferFetch:a1[4]];
        BOOL v23 = +[PKMetalUtility deviceSupportsMemorylessFramebuffers:a1[4]];
        v24 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:a1[5] width:(unint64_t)*((double *)a1 + 9) height:(unint64_t)*((double *)a1 + 10) mipmapped:0];
        v25 = v24;
        if ((unint64_t)a1[6] >= 2) {
          uint64_t v26 = 4;
        }
        else {
          uint64_t v26 = 2;
        }
        [v24 setTextureType:v26];
        [v25 setSampleCount:a1[6]];
        [v25 setUsage:4];
        if (!v21 || !v22) {
          objc_msgSend(v25, "setUsage:", objc_msgSend(v25, "usage") | 1);
        }
        if (!*((unsigned char *)a1 + 18)) {
          objc_msgSend(v25, "setUsage:", objc_msgSend(v25, "usage") | 1);
        }
        [v25 setStorageMode:2];
        if (v21)
        {
          if (*((unsigned char *)a1 + 18) && v23) {
            [v25 setStorageMode:3];
          }
        }
        if (*((unsigned char *)a1 + 19))
        {
          int v54 = a7;
          uint64_t v53 = [v25 storageMode];
          [v25 setStorageMode:0];
          double v28 = *((double *)a1 + 10);
          double v29 = floor(*((double *)a1 + 9));
          double v30 = floor(v28);
          unint64_t v31 = vcvtd_n_u64_f64(ceil(v29 * 4.0 * 0.0625), 4uLL);
          unint64_t v32 = v31 * vcvtmd_u64_f64(v28);
          if (a1[5] == (id)554) {
            v33 = &unk_1F200E7C0;
          }
          else {
            v33 = &unk_1F200E7D8;
          }
          v56[0] = *MEMORY[0x1E4F2F2C0];
          v34 = NSNumber;
          id v35 = v33;
          v36 = [v34 numberWithDouble:v29];
          *(void *)buf = v36;
          v56[1] = *MEMORY[0x1E4F2F0E8];
          v37 = [NSNumber numberWithDouble:v30];
          uint64_t v38 = *MEMORY[0x1E4F2F150];
          v58 = v37;
          id v59 = v35;
          uint64_t v39 = *MEMORY[0x1E4F2EFD8];
          v56[2] = v38;
          v56[3] = v39;
          v40 = [NSNumber numberWithUnsignedInteger:4];
          v60 = v40;
          v56[4] = *MEMORY[0x1E4F2EFE0];
          v41 = [NSNumber numberWithUnsignedInteger:v31];
          v61 = v41;
          v56[5] = *MEMORY[0x1E4F2EFB8];
          v42 = [NSNumber numberWithUnsignedInteger:v32];
          v56[6] = *MEMORY[0x1E4F2EFE8];
          v62 = v42;
          v63 = &unk_1F200E7F0;
          CFDictionaryRef v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v56 count:7];

          IOSurfaceRef v44 = IOSurfaceCreate(v43);
          a1[7] = v44;
          if (v44)
          {
            uint64_t v45 = [a1[4] newTextureWithDescriptor:v25 iosurface:v44 plane:0];
            id v46 = a1[3];
            a1[3] = (id)v45;

            a7 = v54;
          }
          else
          {
            v49 = os_log_create("com.apple.pencilkit", "");
            a7 = v54;
            if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1C44F8000, v49, OS_LOG_TYPE_FAULT, "Failed to allocate an IOSurface, falling back to a regular framebuffer to avoid crashing.", buf, 2u);
            }

            [v25 setStorageMode:v53];
            uint64_t v50 = [a1[4] newTextureWithDescriptor:v25];
            id v51 = a1[3];
            a1[3] = (id)v50;

            *((unsigned char *)a1 + 19) = 0;
          }
        }
        else
        {
          uint64_t v47 = [a1[4] newTextureWithDescriptor:v25];
          id v48 = a1[3];
          a1[3] = (id)v47;
        }
        if (a7) {
          goto LABEL_5;
        }
      }
      BOOL v20 = 0;
      goto LABEL_32;
    }
  }
LABEL_33:

  return a1;
}

- (void)dealloc
{
  ioSurface = self->_ioSurface;
  if (ioSurface)
  {
    CFRelease(ioSurface);
    self->_ioSurface = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PKMetalFramebuffer;
  [(PKMetalFramebuffer *)&v4 dealloc];
}

- (uint64_t)incrementNonPurgeableCount
{
  if (!a1) {
    return 0;
  }
  if (a1[17])
  {
    v1 = a1;
    objc_sync_enter(v1);
    ++*((void *)v1 + 1);
    if (v1[16])
    {
      v2 = (__IOSurface *)*((void *)v1 + 7);
      if (v2)
      {
        uint32_t oldState = 0;
        IOSurfaceSetPurgeable(v2, 0, &oldState);
        if (oldState == 2)
        {
          IOSurfaceSetPurgeable(*((IOSurfaceRef *)v1 + 7), 1u, 0);
          goto LABEL_10;
        }
      }
      else if ([*((id *)v1 + 3) setPurgeableState:2] == 4)
      {
        goto LABEL_10;
      }
      v1[16] = 0;
    }
LABEL_10:
    BOOL v3 = v1[16] == 0;
    objc_sync_exit(v1);

    return v3;
  }
  return 1;
}

- (void)decrementNonPurgeableCount
{
  if (a1 && a1[17])
  {
    obj = a1;
    objc_sync_enter(obj);
    uint64_t v1 = *((void *)obj + 1) - 1;
    *((void *)obj + 1) = v1;
    if (obj[16]) {
      BOOL v2 = 0;
    }
    else {
      BOOL v2 = v1 == 0;
    }
    if (v2)
    {
      obj[16] = 1;
      BOOL v3 = (__IOSurface *)*((void *)obj + 7);
      if (v3) {
        IOSurfaceSetPurgeable(v3, 1u, 0);
      }
      else {
        [*((id *)obj + 3) setPurgeableState:3];
      }
    }
    objc_sync_exit(obj);
  }
}

- (double)size
{
  if (a1) {
    return *(double *)(a1 + 72);
  }
  else {
    return 0.0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_colorTexture, 0);
}

@end