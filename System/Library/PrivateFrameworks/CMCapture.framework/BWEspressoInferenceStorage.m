@interface BWEspressoInferenceStorage
+ (void)initialize;
- ($FD4688982923A924290ECB669CAF1EC2)tensorForRequirement:(id)a3;
- (BWEspressoInferenceStorage)initWithBindingNameByRequirement:(id)a3 requirementsNeedingPixelBuffers:(id)a4 requirementsNeedingPixelBufferPools:(id)a5 requirementsNeedingTensors:(id)a6;
- (id)bindingNameForRequirement:(id)a3;
- (id)newMetadataDictionarySatisfyingRequirement:(id)a3;
- (opaqueCMSampleBuffer)newSampleBufferSatisfyingRequirement:(id)a3 withPropagationSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)addPixelBufferInUseRequirement:(id)a3;
- (void)addTensorInUseRequirement:(id)a3;
- (void)clear;
- (void)dealloc;
@end

@implementation BWEspressoInferenceStorage

+ (void)initialize
{
}

- (BWEspressoInferenceStorage)initWithBindingNameByRequirement:(id)a3 requirementsNeedingPixelBuffers:(id)a4 requirementsNeedingPixelBufferPools:(id)a5 requirementsNeedingTensors:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)BWEspressoInferenceStorage;
  v8 = [(BWInferenceProviderStorage *)&v22 initWithRequirementsNeedingPixelBuffers:a4 requirementsNeedingPixelBufferPools:a5];
  if (v8)
  {
    v8->_bindingNameByRequirement = (NSDictionary *)[a3 copy];
    uint64_t v9 = [MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:0];
    uint64_t v10 = [MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:259];
    v8->_tensorByRequirement = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E10]), "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v9, v10, objc_msgSend(a6, "count"));
    v8->_requirementsUsingTensors = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v8->_requirementsUsingPixelBuffers = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = [a6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(a6);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
          v16 = malloc_type_malloc(0xA8uLL, 0x10800403DA0D3ADuLL);
          _OWORD *v16 = 0u;
          v16[1] = 0u;
          v16[2] = 0u;
          v16[3] = 0u;
          v16[4] = 0u;
          v16[5] = 0u;
          v16[6] = 0u;
          v16[7] = 0u;
          v16[8] = 0u;
          v16[9] = 0u;
          *((void *)v16 + 20) = 0;
          [(NSMapTable *)v8->_tensorByRequirement setObject:v16 forKey:v15];
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [a6 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWEspressoInferenceStorage;
  [(BWInferenceProviderStorage *)&v3 dealloc];
}

- (void)clear
{
  v3.receiver = self;
  v3.super_class = (Class)BWEspressoInferenceStorage;
  [(BWInferenceProviderStorage *)&v3 clear];
  [(NSMutableSet *)self->_requirementsUsingTensors removeAllObjects];
  [(NSMutableSet *)self->_requirementsUsingPixelBuffers removeAllObjects];
}

- (id)bindingNameForRequirement:(id)a3
{
  return [(NSDictionary *)self->_bindingNameByRequirement objectForKeyedSubscript:a3];
}

- ($FD4688982923A924290ECB669CAF1EC2)tensorForRequirement:(id)a3
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)[(NSMapTable *)self->_tensorByRequirement objectForKey:a3];
}

- (void)addTensorInUseRequirement:(id)a3
{
}

- (void)addPixelBufferInUseRequirement:(id)a3
{
}

- (opaqueCMSampleBuffer)newSampleBufferSatisfyingRequirement:(id)a3 withPropagationSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  CMSampleBufferRef v43 = 0;
  int v7 = -[NSMutableSet containsObject:](self->_requirementsUsingTensors, "containsObject:");
  int v8 = [(NSMutableSet *)self->_requirementsUsingPixelBuffers containsObject:a3];
  if ((v7 & 1) == 0 && !v8) {
    return v43;
  }
  uint64_t v9 = [a3 videoFormat];
  if (!v9) {
    return v43;
  }
  uint64_t v10 = (void *)v9;
  uint64_t v11 = [(BWInferenceProviderStorage *)self pixelBufferForRequirement:a3];
  if (!v11) {
    return v43;
  }
  uint64_t v12 = v11;
  if (v7)
  {
    uint64_t v13 = [(BWEspressoInferenceStorage *)self tensorForRequirement:a3];
    if (!v13) {
      return v43;
    }
    uint64_t v14 = v13;
    size_t Height = CVPixelBufferGetHeight(v12);
    size_t v16 = CVPixelBufferGetBytesPerRow(v12) * Height;
    int var14 = v14->var14;
    uint64_t v18 = 4;
    if (var14 <= 131079)
    {
      if (var14 == 65552)
      {
        uint64_t v18 = 2;
LABEL_16:
        if (v16 == v14->var4 * v18 * v14->var5)
        {
          if ([v10 deviceOriented]
            && [v10 pixelFormat] == 1278226534
            && ((long long v19 = (void *)CMGetAttachment(a4, @"UprightExifOrientation", 0)) != 0
             || (long long v19 = objc_msgSend((id)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53248])) != 0)&& (LOBYTE(v41) = 0, (v20 = FigCaptureRotationDegreesAndMirroringFromExifOrientation(objc_msgSend(v19, "intValue"), (char *)&v41)) != 0))
          {
            int v21 = v20;
            CVPixelBufferLockBaseAddress(v12, 0);
            if (v21 != 360)
            {
              int v22 = 360 - v21;
              var0 = v14->var0;
              unint64_t var4 = v14->var4;
              unint64_t var5 = v14->var5;
              unint64_t var10 = v14->var10;
              uint64_t v25 = 4 * var10;
              size_t Width = CVPixelBufferGetWidth(v12);
              size_t v27 = CVPixelBufferGetHeight(v12);
              size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v12);
              BaseAddress = (char *)CVPixelBufferGetBaseAddress(v12);
              switch(v22)
              {
                case 270:
                  uint64_t v31 = (uint64_t)var0 + 4 * var4 - 4;
                  uint64_t v32 = -4;
                  int v30 = 4 * var10;
                  break;
                case 180:
                  uint64_t v31 = (uint64_t)var0 + 4 * var4 + v25 * (var5 - 1) - 4;
                  uint64_t v32 = -4 * (int)var10;
                  int v30 = -4;
                  break;
                case 90:
                  int v30 = -4 * var10;
                  uint64_t v31 = (uint64_t)var0 + v25 * (var5 - 1);
                  uint64_t v32 = 4;
                  break;
                default:
                  CVPixelBufferUnlockBaseAddress(v12, 0);
                  fig_log_get_emitter();
LABEL_45:
                  FigDebugAssert3();
                  return v43;
              }
              if (v27)
              {
                for (uint64_t i = 0; i != v27; ++i)
                {
                  if (Width)
                  {
                    uint64_t v37 = 0;
                    v38 = (_DWORD *)v31;
                    do
                    {
                      *(_DWORD *)&BaseAddress[4 * v37++] = *v38;
                      v38 = (_DWORD *)((char *)v38 + v30);
                    }
                    while (Width != v37);
                  }
                  BaseAddress += BytesPerRow;
                  v31 += v32;
                }
              }
              goto LABEL_29;
            }
          }
          else
          {
            CVPixelBufferLockBaseAddress(v12, 0);
          }
          v33 = CVPixelBufferGetBaseAddress(v12);
          memcpy(v33, v14->var0, v16);
LABEL_29:
          CVPixelBufferUnlockBaseAddress(v12, 0);
          goto LABEL_30;
        }
        fig_log_get_emitter();
        goto LABEL_45;
      }
      if (var14 == 65568) {
        goto LABEL_16;
      }
    }
    else
    {
      switch(var14)
      {
        case 131080:
          goto LABEL_11;
        case 131104:
          goto LABEL_16;
        case 262152:
LABEL_11:
          uint64_t v18 = 1;
          goto LABEL_16;
      }
    }
    uint64_t v18 = 0;
    goto LABEL_16;
  }
LABEL_30:
  CFTypeRef v34 = (CFTypeRef)objc_msgSend((id)objc_msgSend(v10, "underlyingVideoFormat"), "formatDescription");
  if (v34) {
    CFTypeRef v34 = CFRetain(v34);
  }
  CFTypeRef cf = v34;
  long long v41 = *MEMORY[0x1E4F1F9F8];
  uint64_t v42 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  BWSampleBufferCreateFromPixelBuffer(v12, (uint64_t)&v41, &cf, &v43);
  if (cf) {
    CFRelease(cf);
  }
  return v43;
}

- (id)newMetadataDictionarySatisfyingRequirement:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = (void *)[a3 metadataKeys];
  int v7 = [(BWEspressoInferenceStorage *)self tensorForRequirement:a3];
  if (!v7 || (int v8 = v7, !v7->var0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return v5;
  }
  unint64_t v9 = v7->var5 * v7->var4 * v7->var6 * v7->var7 * v7->var8;
  int v10 = [a3 mappingOption];
  int v11 = v10;
  if (!v10 || v10 == 2)
  {
    unint64_t v18 = [v6 count];
    if (v18 >= v9) {
      unint64_t v19 = v9;
    }
    else {
      unint64_t v19 = v18;
    }
    if (v19)
    {
      unint64_t v20 = v18;
      for (uint64_t i = 0; i != v19; ++i)
      {
        uint64_t v22 = [v6 objectAtIndexedSubscript:i];
        LODWORD(v23) = *((_DWORD *)v8->var0 + i);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v23), v22);
      }
      if (v11 == 2 && v20 < v9)
      {
        uint64_t v24 = [v6 objectAtIndexedSubscript:v19 - 1];
        uint64_t v25 = [v5 objectForKeyedSubscript:v24];
        uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v25, 0);
        do
        {
          LODWORD(v26) = *((_DWORD *)v8->var0 + v19);
          objc_msgSend(v12, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v26));
          ++v19;
        }
        while (v9 != v19);
        size_t v16 = v5;
        v17 = v12;
        uint64_t v15 = v24;
LABEL_21:
        [v16 setObject:v17 forKeyedSubscript:v15];
      }
    }
  }
  else if (v10 == 1)
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
    if (v9)
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        LODWORD(v13) = *((_DWORD *)v8->var0 + j);
        objc_msgSend(v12, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v13));
      }
    }
    uint64_t v15 = [v6 firstObject];
    size_t v16 = v5;
    v17 = v12;
    goto LABEL_21;
  }
  return v5;
}

@end