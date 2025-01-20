@interface FigCaptureSourceStreamsContainer
- (uint64_t)_populateStreamsFromDeviceVendorForPosition:(uint64_t)a3 baseZoomFactorOverrides:(uint64_t)a4 clientBaseZoomFactorsByPortType:;
- (uint64_t)portTypesSupportingDepth;
- (uint64_t)streamProvidingSDOFRenderingParameters;
- (uint64_t)switchOverZoomFactors;
- (void)dealloc;
- (void)initWithDeviceType:(uint64_t)a3 position:(int)a4 stillImageDepthDataType:(void *)a5 device:(uint64_t)a6 baseZoomFactorOverrides:(uint64_t)a7 clientBaseZoomFactorsByPortType:;
- (void)zoomFactorsForDepth;
@end

@implementation FigCaptureSourceStreamsContainer

- (void)initWithDeviceType:(uint64_t)a3 position:(int)a4 stillImageDepthDataType:(void *)a5 device:(uint64_t)a6 baseZoomFactorOverrides:(uint64_t)a7 clientBaseZoomFactorsByPortType:
{
  if (!a1) {
    return 0;
  }
  v16.receiver = a1;
  v16.super_class = (Class)FigCaptureSourceStreamsContainer;
  id v13 = objc_msgSendSuper2(&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    *((_DWORD *)v13 + 2) = a2;
    *((_DWORD *)v13 + 3) = a4;
    *((void *)v13 + 2) = a5;
    if (-[FigCaptureSourceStreamsContainer _populateStreamsFromDeviceVendorForPosition:baseZoomFactorOverrides:clientBaseZoomFactorsByPortType:]((uint64_t)v14, a3, a6, a7))
    {
      FigDebugAssert3();

      return 0;
    }
  }
  return v14;
}

- (uint64_t)_populateStreamsFromDeviceVendorForPosition:(uint64_t)a3 baseZoomFactorOverrides:(uint64_t)a4 clientBaseZoomFactorsByPortType:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v7 = result;
    unsigned int v26 = 0;
    v8 = FigCaptureSourceUnderlyingDeviceTypes(*(_DWORD *)(result + 8));
    v9 = (void *)[MEMORY[0x1E4F1CA48] array];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([v8 count])
    {
      unint64_t v11 = 0;
      do
      {
        objc_msgSend(v9, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", a2));
        ++v11;
      }
      while ([v8 count] > v11);
    }
    v12 = objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "copyStreamsFromDevice:positions:deviceTypes:deviceClientPriority:allowsStreamControlLoss:error:", *(void *)(v7 + 16), v9, v8, 3, 0, &v26);
    *(void *)(v7 + 24) = v12;
    if (v26)
    {
      FigDebugAssert3();
    }
    else
    {
      *(void *)(v7 + 32) = (id)[v12 firstObject];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v13 = *(void **)(v7 + 24);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v13);
            }
            objc_msgSend(v10, "setObject:forKeyedSubscript:", *(void *)(*((void *)&v22 + 1) + 8 * i), objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "portType"));
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v15);
      }
      *(void *)(v7 + 40) = [v10 copy];
      unsigned int v18 = *(_DWORD *)(v7 + 8);
      if (v18 <= 9 && ((1 << v18) & 0x310) != 0)
      {
        v19 = (void *)[*(id *)(v7 + 16) copySynchronizedStreamsGroupForStreams:*(void *)(v7 + 24) error:&v26];
        if (v26)
        {
          FigDebugAssert3();
        }
        else
        {
          v20 = [[BWFigVideoCaptureSynchronizedStreamsGroup alloc] initWithSynchronizedStreamsGroup:v19 activeStreams:*(void *)(v7 + 24) readOnly:1 baseZoomFactorOverrides:a3 clientBaseZoomFactorsByPortType:a4 error:&v26];

          if (v26)
          {
            FigDebugAssert3();
          }
          else
          {
            v21 = [(BWFigVideoCaptureSynchronizedStreamsGroup *)v20 clientBaseZoomFactorsByPortType];
            if (!v21) {
              v21 = [(BWFigVideoCaptureSynchronizedStreamsGroup *)v20 baseZoomFactorsByPortType];
            }
            *(void *)(v7 + 48) = v21;
          }
        }
      }
    }

    return v26;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSourceStreamsContainer;
  [(FigCaptureSourceStreamsContainer *)&v3 dealloc];
}

- (uint64_t)portTypesSupportingDepth
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    switch(*(_DWORD *)(result + 12))
    {
      case 1:
      case 2:
      case 8:
        int v4 = *(_DWORD *)(result + 8);
        switch(v4)
        {
          case 9:
            uint64_t v5 = *MEMORY[0x1E4F52DF0];
            uint64_t v8 = *MEMORY[0x1E4F52DD8];
            uint64_t v9 = v5;
            v1 = (void *)MEMORY[0x1E4F1C978];
            v2 = &v8;
            uint64_t v3 = 2;
            goto LABEL_5;
          case 8:
            uint64_t v10 = *MEMORY[0x1E4F52DD8];
            v1 = (void *)MEMORY[0x1E4F1C978];
            v2 = &v10;
            break;
          case 4:
            uint64_t v11 = *MEMORY[0x1E4F52DF0];
            v1 = (void *)MEMORY[0x1E4F1C978];
            v2 = &v11;
            break;
          default:
            goto LABEL_11;
        }
        goto LABEL_4;
      case 3:
        uint64_t v12 = *MEMORY[0x1E4F52E00];
        v1 = (void *)MEMORY[0x1E4F1C978];
        v2 = &v12;
        goto LABEL_4;
      case 4:
      case 5:
      case 6:
      case 9:
        uint64_t v7 = [*(id *)(result + 32) portType];
        v1 = (void *)MEMORY[0x1E4F1C978];
        v2 = &v7;
        goto LABEL_4;
      case 7:
        uint64_t v6 = *MEMORY[0x1E4F52DE0];
        v1 = (void *)MEMORY[0x1E4F1C978];
        v2 = &v6;
LABEL_4:
        uint64_t v3 = 1;
LABEL_5:
        result = objc_msgSend(v1, "arrayWithObjects:count:", v2, v3, v6, v7, v8, v9, v10, v11, v12, v13);
        break;
      default:
LABEL_11:
        result = 0;
        break;
    }
  }
  return result;
}

- (void)zoomFactorsForDepth
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v1 = a1;
  v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = (id)-[FigCaptureSourceStreamsContainer portTypesSupportingDepth](v1);
  uint64_t v32 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v32)
  {
    uint64_t v30 = *(void *)v43;
    uint64_t v31 = v1;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v43 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v42 + 1) + 8 * v3);
        unsigned int v5 = *(_DWORD *)(v1 + 8);
        BOOL v6 = v5 > 9;
        int v7 = (1 << v5) & 0x310;
        BOOL v8 = v6 || v7 == 0;
        uint64_t v33 = v3;
        if (v8)
        {
          float v10 = 1.0;
        }
        else
        {
          objc_msgSend((id)objc_msgSend(*(id *)(v1 + 48), "objectForKeyedSubscript:", v4), "floatValue");
          float v10 = v9;
        }
        uint64_t v11 = (void *)[MEMORY[0x1E4F1CA80] set];
        uint64_t v12 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 40), "objectForKeyedSubscript:", v4), "getProperty:error:", @"SupportedFormatsArray", 0);
        if ([v12 count])
        {
          unint64_t v14 = 0;
          do
          {
            long long v40 = 0u;
            long long v41 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            uint64_t v15 = csu_secondaryNativeResolutionZoomFactorsForFormatIndex(v12, v14);
            uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v39;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v39 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  v20 = NSNumber;
                  [*(id *)(*((void *)&v38 + 1) + 8 * i) floatValue];
                  *(float *)&double v22 = v10 * v21;
                  objc_msgSend(v11, "addObject:", objc_msgSend(v20, "numberWithFloat:", v22));
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
              }
              while (v17);
            }
            ++v14;
          }
          while ([v12 count] > v14);
        }
        *(float *)&double v13 = v10;
        objc_msgSend(v2, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v13));
        long long v23 = objc_msgSend((id)objc_msgSend(v11, "allObjects"), "sortedArrayUsingSelector:", sel_compare_);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v46 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v35;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v35 != v26) {
                objc_enumerationMutation(v23);
              }
              [v2 addObject:*(void *)(*((void *)&v34 + 1) + 8 * j)];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v46 count:16];
          }
          while (v25);
        }
        uint64_t v3 = v33 + 1;
        uint64_t v1 = v31;
      }
      while (v33 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v32);
  }
  return v2;
}

- (uint64_t)streamProvidingSDOFRenderingParameters
{
  if (result)
  {
    uint64_t v1 = *(void **)(result + 40);
    uint64_t v2 = [(id)-[FigCaptureSourceStreamsContainer portTypesSupportingDepth](result) firstObject];
    return [v1 objectForKeyedSubscript:v2];
  }
  return result;
}

- (uint64_t)switchOverZoomFactors
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    int v2 = *(_DWORD *)(result + 8);
    switch(v2)
    {
      case 9:
        v6[0] = [*(id *)(result + 48) objectForKeyedSubscript:*MEMORY[0x1E4F52DD8]];
        v6[1] = [*(id *)(v1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F52DF0]];
        uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v4 = v6;
        uint64_t v5 = 2;
        return [v3 arrayWithObjects:v4 count:v5];
      case 8:
        uint64_t v7 = [*(id *)(result + 48) objectForKeyedSubscript:*MEMORY[0x1E4F52DD8]];
        uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v4 = &v7;
        goto LABEL_8;
      case 4:
        v8[0] = [*(id *)(result + 48) objectForKeyedSubscript:*MEMORY[0x1E4F52DF0]];
        uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v4 = v8;
LABEL_8:
        uint64_t v5 = 1;
        return [v3 arrayWithObjects:v4 count:v5];
    }
    return 0;
  }
  return result;
}

@end