@interface CAIOSurfaceCodingProxy
+ (BOOL)supportsSecureCoding;
- (CAIOSurfaceCodingProxy)initWithCoder:(id)a3;
- (CAIOSurfaceCodingProxy)initWithObject:(id)a3;
- (id)decodedObject;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CAIOSurfaceCodingProxy

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (self->_locked) {
    IOSurfaceUnlock(self->_surface, 1u, 0);
  }
  surface = self->_surface;
  if (surface) {
    CFRelease(surface);
  }
  v4.receiver = self;
  v4.super_class = (Class)CAIOSurfaceCodingProxy;
  [(CAIOSurfaceCodingProxy *)&v4 dealloc];
}

- (CAIOSurfaceCodingProxy)initWithCoder:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v50.receiver = self;
  v50.super_class = (Class)CAIOSurfaceCodingProxy;
  objc_super v4 = [(CAIOSurfaceCodingProxy *)&v50 init];
  if (v4)
  {
    context = (void *)MEMORY[0x185324A30]();
    if (iosurface_info_classes(void)::once[0] != -1) {
      dispatch_once(iosurface_info_classes(void)::once, &__block_literal_global_527);
    }
    uint64_t v5 = (void *)[a3 decodeObjectOfClasses:iosurface_info_classes(void)::classes forKey:@"IOSurfaceInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (iosurface_keys_allow_list(void)::once != -1) {
        dispatch_once(&iosurface_keys_allow_list(void)::once, &__block_literal_global_521);
      }
      v6 = (void *)iosurface_keys_allow_list(void)::keys;
      if (iosurface_plane_keys_allow_list(void)::once[0] != -1) {
        dispatch_once(iosurface_plane_keys_allow_list(void)::once, &__block_literal_global_523);
      }
      v7 = (void *)iosurface_plane_keys_allow_list(void)::keys;
      v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
      id v42 = a3;
      v43 = v4;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      uint64_t v9 = [v6 countByEnumeratingWithState:&v72 objects:v71 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v73 != v10) {
              objc_enumerationMutation(v6);
            }
            uint64_t v12 = *(void *)(*((void *)&v72 + 1) + 8 * i);
            uint64_t v13 = [v5 objectForKeyedSubscript:v12];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v8 setObject:v13 forKeyedSubscript:v12];
            }
          }
          uint64_t v9 = [v6 countByEnumeratingWithState:&v72 objects:v71 count:16];
        }
        while (v9);
      }
      uint64_t v41 = *MEMORY[0x1E4F2F238];
      a3 = v42;
      objc_super v4 = v43;
      v14 = objc_msgSend(v5, "objectForKeyedSubscript:");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v67 objects:v66 count:16];
        v48 = v8;
        if (!v15) {
          goto LABEL_27;
        }
        uint64_t v16 = *(void *)v68;
        int v17 = 1;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v68 != v16) {
              objc_enumerationMutation(v14);
            }
            objc_opt_class();
            v17 &= objc_opt_isKindOfClass();
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v67 objects:v66 count:16];
        }
        while (v15);
        v8 = v48;
        if (v17)
        {
LABEL_27:
          v47 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v14, "count"));
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          uint64_t v19 = [v14 countByEnumeratingWithState:&v62 objects:v61 count:16];
          if (v19)
          {
            v45 = v14;
            uint64_t v46 = *(void *)v63;
            do
            {
              uint64_t v20 = 0;
              uint64_t v49 = v19;
              do
              {
                if (*(void *)v63 != v46) {
                  objc_enumerationMutation(v14);
                }
                v21 = *(void **)(*((void *)&v62 + 1) + 8 * v20);
                v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
                long long v59 = 0u;
                long long v60 = 0u;
                long long v57 = 0u;
                long long v58 = 0u;
                uint64_t v23 = [v7 countByEnumeratingWithState:&v57 objects:v56 count:16];
                if (v23)
                {
                  uint64_t v24 = *(void *)v58;
                  do
                  {
                    for (uint64_t k = 0; k != v23; ++k)
                    {
                      if (*(void *)v58 != v24) {
                        objc_enumerationMutation(v7);
                      }
                      uint64_t v26 = *(void *)(*((void *)&v57 + 1) + 8 * k);
                      uint64_t v27 = [v21 objectForKeyedSubscript:v26];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        [v22 setObject:v27 forKeyedSubscript:v26];
                      }
                    }
                    uint64_t v23 = [v7 countByEnumeratingWithState:&v57 objects:v56 count:16];
                  }
                  while (v23);
                }
                [v47 addObject:v22];
                v8 = v48;
                v14 = v45;
                ++v20;
              }
              while (v20 != v49);
              uint64_t v19 = [v45 countByEnumeratingWithState:&v62 objects:v61 count:16];
            }
            while (v19);
          }
          [v8 setObject:v47 forKeyedSubscript:v41];
          a3 = v42;
          objc_super v4 = v43;
        }
      }
      IOSurfaceRef v28 = IOSurfaceCreate((CFDictionaryRef)v8);
      v4->_surface = v28;
      if (!v28) {
        goto LABEL_70;
      }
    }
    else if (!v4->_surface)
    {
LABEL_70:
      return v4;
    }
    if (IOSurfaceGetCompressionTypeOfPlane() - 1 > 1) {
      goto LABEL_74;
    }
    if (CADeviceSupportsUniversalCompression::once != -1) {
      dispatch_once(&CADeviceSupportsUniversalCompression::once, &__block_literal_global_37_12054);
    }
    if (CADeviceSupportsUniversalCompression::universal)
    {
      CFRelease(v4->_surface);
      v4->_surface = 0;
    }
    else
    {
LABEL_74:
      if (v4->_surface)
      {
        v29 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"IOSurfaceData"];
        v30 = v29;
        if (v29)
        {
          size_t v31 = [v29 length];
          if (v31 >= IOSurfaceGetAllocSize(v4->_surface)) {
            size_t AllocSize = IOSurfaceGetAllocSize(v4->_surface);
          }
          else {
            size_t AllocSize = [v30 length];
          }
          size_t v33 = AllocSize;
          IOSurfaceLock(v4->_surface, 0, 0);
          BaseAddress = IOSurfaceGetBaseAddress(v4->_surface);
          memcpy(BaseAddress, (const void *)[v30 bytes], v33);
          IOSurfaceUnlock(v4->_surface, 0, 0);
        }
        if (iosurface_property_classes(void)::once[0] != -1) {
          dispatch_once(iosurface_property_classes(void)::once, &__block_literal_global_529);
        }
        v35 = (void *)[a3 decodeObjectOfClasses:iosurface_property_classes(void)::classes forKey:@"IOSurfaceProperties"];
        v36 = v35;
        if (v35)
        {
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          uint64_t v37 = [v35 countByEnumeratingWithState:&v52 objects:v51 count:16];
          if (v37)
          {
            uint64_t v38 = *(void *)v53;
            do
            {
              for (uint64_t m = 0; m != v37; ++m)
              {
                if (*(void *)v53 != v38) {
                  objc_enumerationMutation(v36);
                }
                IOSurfaceSetValue(v4->_surface, *(CFStringRef *)(*((void *)&v52 + 1) + 8 * m), (CFTypeRef)[v36 objectForKey:*(void *)(*((void *)&v52 + 1) + 8 * m)]);
              }
              uint64_t v37 = [v36 countByEnumeratingWithState:&v52 objects:v51 count:16];
            }
            while (v37);
          }
        }
        if ([a3 decodeIntForKey:@"IOSurfaceYCbCrMatrixInt"]) {
          IOSurfaceSetYCbCrMatrix();
        }
      }
    }
    goto LABEL_70;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (self->_surface)
  {
    if (CADeviceIsVirtualized::once != -1) {
      dispatch_once(&CADeviceIsVirtualized::once, &__block_literal_global_280);
    }
    if (!CADeviceIsVirtualized::is_virtualized)
    {
      context = (void *)MEMORY[0x185324A30]();
      if (!self->_locked)
      {
        IOSurfaceLock(self->_surface, 1u, 0);
        self->_locked = 1;
      }
      CFDictionaryRef v5 = IOSurfaceCopyAllValues(self->_surface);
      v6 = (void *)[(__CFDictionary *)v5 objectForKeyedSubscript:@"CreationProperties"];
      if (iosurface_keys_allow_list(void)::once != -1) {
        dispatch_once(&iosurface_keys_allow_list(void)::once, &__block_literal_global_521);
      }
      v7 = (void *)iosurface_keys_allow_list(void)::keys;
      v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend((id)iosurface_keys_allow_list(void)::keys, "count") + 1);
      CFDictionaryRef v33 = v5;
      id v35 = a3;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v51 objects:v50 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v52 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v51 + 1) + 8 * i);
            uint64_t v13 = [v6 objectForKeyedSubscript:v12];
            if (v13) {
              [v8 setObject:v13 forKeyedSubscript:v12];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v51 objects:v50 count:16];
        }
        while (v9);
      }
      size_t PlaneCount = IOSurfaceGetPlaneCount(self->_surface);
      if (PlaneCount)
      {
        if (iosurface_plane_keys_allow_list(void)::once[0] != -1) {
          dispatch_once(iosurface_plane_keys_allow_list(void)::once, &__block_literal_global_523);
        }
        v14 = (void *)iosurface_plane_keys_allow_list(void)::keys;
        v36 = (void *)[v6 objectForKeyedSubscript:@"IOSurfacePlaneInfo"];
        uint64_t v37 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:PlaneCount];
        uint64_t v15 = 0;
        do
        {
          uint64_t v16 = (void *)[v36 objectAtIndexedSubscript:v15];
          int v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
          uint64_t v39 = v15;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          uint64_t v18 = [v14 countByEnumeratingWithState:&v46 objects:v45 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v47;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v47 != v19) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v21 = *(void *)(*((void *)&v46 + 1) + 8 * j);
                uint64_t v22 = [v16 objectForKeyedSubscript:v21];
                if (v22) {
                  [v17 setObject:v22 forKeyedSubscript:v21];
                }
              }
              uint64_t v18 = [v14 countByEnumeratingWithState:&v46 objects:v45 count:16];
            }
            while (v18);
          }
          [v37 addObject:v17];
          uint64_t v15 = v39 + 1;
        }
        while (v39 + 1 != PlaneCount);
        [v8 setObject:v37 forKey:*MEMORY[0x1E4F2F238]];
      }

      uint64_t v23 = v35;
      [v35 encodeObject:v8 forKey:@"IOSurfaceInfo"];
      if (iosurface_property_names(void)::once[0] != -1) {
        dispatch_once(iosurface_property_names(void)::once, &__block_literal_global_525);
      }
      uint64_t v24 = (void *)iosurface_property_names(void)::names;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v25 = [(id)iosurface_property_names(void)::names countByEnumeratingWithState:&v41 objects:v40 count:16];
      if (v25)
      {
        uint64_t v26 = 0;
        uint64_t v27 = *(void *)v42;
        do
        {
          for (uint64_t k = 0; k != v25; ++k)
          {
            if (*(void *)v42 != v27) {
              objc_enumerationMutation(v24);
            }
            CFStringRef v29 = *(const __CFString **)(*((void *)&v41 + 1) + 8 * k);
            CFTypeRef v30 = IOSurfaceCopyValue(self->_surface, v29);
            if (v30)
            {
              if (!v26) {
                uint64_t v26 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
              }
              [v26 setObject:v30 forKey:v29];
              CFRelease(v30);
            }
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v40 count:16];
        }
        while (v25);
        uint64_t v23 = v35;
        if (v26) {
          [v35 encodeObject:v26 forKey:@"IOSurfaceProperties"];
        }
      }
      size_t v31 = (void *)MEMORY[0x1E4F1C9B8];
      BaseAddress = IOSurfaceGetBaseAddress(self->_surface);
      objc_msgSend(v23, "encodeObject:forKey:", objc_msgSend(v31, "dataWithBytesNoCopy:length:freeWhenDone:", BaseAddress, IOSurfaceGetAllocSize(self->_surface), 0), @"IOSurfaceData");
      IOSurfaceGetYCbCrMatrix();
    }
  }
}

- (id)decodedObject
{
  return self->_surface;
}

- (CAIOSurfaceCodingProxy)initWithObject:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)CAIOSurfaceCodingProxy;
  objc_super v4 = [(CAIOSurfaceCodingProxy *)&v13 init];
  CFDictionaryRef v5 = v4;
  if (a3 && v4)
  {
    CFTypeID v6 = CFGetTypeID(a3);
    if (CAMachPortGetTypeID::once[0] != -1) {
      dispatch_once(CAMachPortGetTypeID::once, &__block_literal_global_5766);
    }
    if (v6 != CAMachPortGetTypeID::type)
    {
      CFTypeID v9 = CFGetTypeID(a3);
      if (v9 == CVPixelBufferGetTypeID())
      {
        IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)a3);
        if (!IOSurface) {
          return v5;
        }
      }
      else
      {
        CFTypeID v11 = CFGetTypeID(a3);
        if (CAImageQueueGetTypeID::once != -1) {
          dispatch_once(&CAImageQueueGetTypeID::once, &__block_literal_global_14584);
        }
        IOSurface = a3;
        if (v11 == CAImageQueueGetTypeID::type)
        {
          v8 = CAImageQueueCopyLastIOSurface((uint64_t)a3);
          goto LABEL_16;
        }
      }
      v8 = (__IOSurface *)CFRetain(IOSurface);
      goto LABEL_16;
    }
    mach_port_t v7 = *((_DWORD *)a3 + 4);
    if (v7)
    {
      v8 = IOSurfaceLookupFromMachPort(v7);
LABEL_16:
      v5->_surface = v8;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end