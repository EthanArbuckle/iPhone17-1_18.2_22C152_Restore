@interface BWMetalColorCubeRenderer
+ (id)bundle;
+ (void)initialize;
- (BOOL)adjustsMetadata;
- (BOOL)mixingColorCubesInGammaDomain;
- (BOOL)supportsAnimation;
- (BWMetalColorCubeRenderer)initWithMetalCommandQueue:(id)a3 mixInGammaDomain:(BOOL)a4;
- (NSString)displayName;
- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5;
- (signed)type;
- (uint64_t)_loadAndConfigureFilterBundle;
- (void)_attachFiltersForZoomPIPWithInputBuffer:(void *)a3 rendererParameters:;
- (void)_interpolatedLookupTableForEntry:(void *)a3 inputLookupTable:(float)a4 strength:;
- (void)dealloc;
- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8;
@end

@implementation BWMetalColorCubeRenderer

+ (void)initialize
{
}

- (BWMetalColorCubeRenderer)initWithMetalCommandQueue:(id)a3 mixInGammaDomain:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)BWMetalColorCubeRenderer;
  v6 = [(BWMetalColorCubeRenderer *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_mtlCommandQueue = (MTLCommandQueue *)a3;
    v6->_previousInterpolationFractionComplete = 1.0;
    if (!-[BWMetalColorCubeRenderer _loadAndConfigureFilterBundle]((uint64_t)v6))
    {
      uint64_t v8 = 16;
      while (1)
      {
        *(unsigned char *)([*(id *)((char *)&v7->super.isa + v8) filterDescriptor] + 8) = 1;
        *(_DWORD *)([*(id *)((char *)&v7->super.isa + v8) filterDescriptor] + 4) = 1;
        *(_DWORD *)[*(id *)((char *)&v7->super.isa + v8) filterDescriptor] = 32;
        *(_DWORD *)([*(id *)((char *)&v7->super.isa + v8) filterDescriptor] + 12) = 0;
        *(unsigned char *)([*(id *)((char *)&v7->super.isa + v8) filterDescriptor] + 16) = a4;
        v7->_mixingColorCubesInGammaDomain = a4;
        if ([*(id *)((char *)&v7->super.isa + v8) prepareToProcess:0]) {
          break;
        }
        v8 += 8;
        if (v8 == 56)
        {
          v7->_colorLookupCache = objc_alloc_init(BWColorLookupCache);
          return v7;
        }
      }
    }

    return 0;
  }
  return v7;
}

- (uint64_t)_loadAndConfigureFilterBundle
{
  if (!a1) {
    return 0;
  }
  id v2 = (id)[(id)objc_opt_class() bundle];
  *(void *)(a1 + 8) = v2;
  if (!v2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  uint64_t v3 = 16;
  while (1)
  {
    uint64_t v4 = [objc_alloc(NSClassFromString(&cfstr_Figcolorcubeme.isa)) initWithCommandQueue:*(void *)(a1 + 384)];
    *(void *)(a1 + v3) = v4;
    if (!v4) {
      break;
    }
    v3 += 8;
    if (v3 == 56) {
      return 0;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  uint64_t v5 = FigSignalErrorAt();
  if (v5)
  {

    *(void *)(a1 + 8) = 0;
    for (uint64_t i = 16; i != 56; i += 8)
    {

      *(void *)(a1 + i) = 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  interpolatedForegroundColorLookupTables = self->_interpolatedForegroundColorLookupTables;
  p_interpolatedTable = &self->_interpolatedBackgroundColorLookupTables[0].interpolatedTable;
  uint64_t v5 = -40;
  do
  {

    v6 = *p_interpolatedTable;
    p_interpolatedTable += 3;

    v5 += 8;
  }
  while (v5);

  v7.receiver = self;
  v7.super_class = (Class)BWMetalColorCubeRenderer;
  [(BWMetalColorCubeRenderer *)&v7 dealloc];
}

- (signed)type
{
  return 5;
}

- (NSString)displayName
{
  return (NSString *)@"Color Cube Renderer";
}

- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  BOOL v8 = [a4 colorSpaceProperties] - 5 < 0xFFFFFFFE;
  for (uint64_t i = 16; i != 56; i += 8)
    *(_DWORD *)([*(id *)((char *)&self->super.isa + i) filterDescriptor] + 12) = v8;
  objc_super v10 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  [a3 prepareForRenderingWithInputVideoFormat:a4];
  v11 = self->_filters[0];
  v17[0] = objc_msgSend((id)objc_msgSend(a3, "colorFilter"), "name");
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  uint64_t v16 = [a3 foregroundColorLookupTable];
  int v13 = -[FigColorCubeMetalFilter setForegroundCubesWithNames:data:](v11, "setForegroundCubesWithNames:data:", v12, [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1]);
  if (!v13) {
    int v13 = -[FigColorCubeMetalFilter setBackgroundCubeWithName:data:](self->_filters[0], "setBackgroundCubeWithName:data:", objc_msgSend((id)objc_msgSend(a3, "colorFilter"), "name"), objc_msgSend(a3, "backgroundColorLookupTable"));
  }
  int v14 = v13;
  if (*v10 == 1) {
    kdebug_trace();
  }
  return v14;
}

- (void)_interpolatedLookupTableForEntry:(void *)a3 inputLookupTable:(float)a4 strength:
{
  if (!a1) {
    return 0;
  }
  if (*(void **)a2 != a3 || *(float *)(a2 + 8) != a4)
  {
    if (a4 == 0.0)
    {
      uint64_t v7 = [*(id *)(a1 + 376) identityColorLookupTable];
    }
    else
    {
      BOOL v8 = a3;
      if (a4 == 1.0)
      {
LABEL_10:

        *(void *)a2 = a3;
        *(float *)(a2 + 8) = a4;
        *(void *)(a2 + 16) = v8;
        return v8;
      }
      v9 = *(void **)(a1 + 376);
      uint64_t v10 = [v9 identityColorLookupTable];
      *(float *)&double v11 = a4;
      uint64_t v7 = [v9 interpolatedColorLookupTableFromTable:v10 toTable:a3 fractionComplete:v11];
    }
    BOOL v8 = (void *)v7;
    goto LABEL_10;
  }
  return *(void **)(a2 + 16);
}

- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8
{
  v52[1] = *MEMORY[0x1E4F143B8];
  -[BWMetalColorCubeRenderer _attachFiltersForZoomPIPWithInputBuffer:rendererParameters:]((uint64_t)self, a5, a3);
  [a3 interpolationFractionComplete];
  v45 = self;
  uint64_t v12 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (v13 != self->_previousInterpolationFractionComplete)
  {
    [a3 interpolationFractionComplete];
    self->_previousInterpolationFractionComplete = v14;
    v15 = self->_filters[0];
    v52[0] = objc_msgSend((id)objc_msgSend(a3, "colorFilter"), "name");
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
    uint64_t v51 = [a3 foregroundColorLookupTable];
    if (-[FigColorCubeMetalFilter setForegroundCubesWithNames:data:](v15, "setForegroundCubesWithNames:data:", v16, [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1])|| -[FigColorCubeMetalFilter setBackgroundCubeWithName:data:](v45->_filters[0], "setBackgroundCubeWithName:data:", objc_msgSend((id)objc_msgSend(a3, "colorFilter"), "name"), objc_msgSend(a3, "backgroundColorLookupTable")))
    {
      uint64_t v38 = 0;
      goto LABEL_31;
    }
  }
  ImageBuffer = (void *)CMGetAttachment(a5, @"PortraitStillImageFaceAdjustedBlurMap", 0);
  if (ImageBuffer) {
    goto LABEL_5;
  }
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, 0x1EFA74460);
  if (!AttachedMedia)
  {
    ImageBuffer = 0;
LABEL_5:
    v40 = 0;
    goto LABEL_8;
  }
  v18 = AttachedMedia;
  ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  v40 = (void *)CMGetAttachment(v18, @"PersonSegmentationMaskToMainImageRotationDegrees", 0);
LABEL_8:
  v19 = (void *)CMGetAttachment(a5, @"FiltersAndRegionArray", 0);
  v20 = v19;
  id v39 = a8;
  if (!v19)
  {
    [(FigColorCubeMetalFilter *)v45->_filters[0] setInputPixelBuffer:a4];
    [(FigColorCubeMetalFilter *)v45->_filters[0] setMattePixelbuffer:ImageBuffer];
    [(FigColorCubeMetalFilter *)v45->_filters[0] setOutputPixelBuffer:a7];
    -[FigColorCubeMetalFilter setTargetRectangle:](v45->_filters[0], "setTargetRectangle:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    -[FigColorCubeMetalFilter setMatteToInputPixelBufferRotationDegrees:](v45->_filters[0], "setMatteToInputPixelBufferRotationDegrees:", [v40 intValue]);
    if (*v12 == 1) {
      kdebug_trace();
    }
    if ([(FigColorCubeMetalFilter *)v45->_filters[0] process])
    {
      uint64_t v38 = 0;
      goto LABEL_31;
    }
    goto LABEL_27;
  }
  if (![v19 count])
  {
LABEL_27:
    if ([v20 count]) {
      uint64_t v37 = [v20 count] - 1;
    }
    else {
      uint64_t v37 = 0;
    }
    a8 = v39;
    uint64_t v12 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    uint64_t v38 = 2 * ([(FigColorCubeMetalFilter *)v45->_filters[v37] finishProcessing] == 0);
    goto LABEL_31;
  }
  uint64_t v21 = 0;
  currentForegroundColorLookupTables = v45->_currentForegroundColorLookupTables;
  filters = v45->_filters;
  currentBackgroundColorLookupTables = v45->_currentBackgroundColorLookupTables;
  unsigned int v25 = 1;
  while (1)
  {
    v26 = objc_msgSend((id)objc_msgSend(v20, "objectAtIndexedSubscript:", v21), "objectForKeyedSubscript:", 0x1EFA73DE0);
    if (![v26 count]) {
      break;
    }
    v27 = objc_msgSend((id)objc_msgSend(v20, "objectAtIndexedSubscript:", v21), "objectForKeyedSubscript:", 0x1EFA73E20);
    unsigned int v46 = v25;
    if (v27)
    {
      [v27 floatValue];
      float v29 = v28;
    }
    else
    {
      float v29 = 1.0;
    }
    id v30 = -[BWColorLookupCache colorLookupTablesForFilter:](v45->_colorLookupCache, "colorLookupTablesForFilter:", [v26 objectAtIndexedSubscript:0]);
    v31 = (void *)[v30 foregroundColorLookupTable];
    v32 = (void *)[v30 backgroundColorLookupTable];
    v33 = (NSData *)-[BWMetalColorCubeRenderer _interpolatedLookupTableForEntry:inputLookupTable:strength:]((uint64_t)v45, (uint64_t)&v45->_interpolatedForegroundColorLookupTables[v21], v31, v29);
    v34 = (NSData *)-[BWMetalColorCubeRenderer _interpolatedLookupTableForEntry:inputLookupTable:strength:]((uint64_t)v45, (uint64_t)&v45->_interpolatedBackgroundColorLookupTables[v21], v32, v29);
    if (currentForegroundColorLookupTables[v21] != v33)
    {
      v44 = filters[v21];
      uint64_t v50 = objc_msgSend((id)objc_msgSend(v26, "objectAtIndexedSubscript:", 0), "name");
      uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
      v49 = v33;
      if (-[FigColorCubeMetalFilter setForegroundCubesWithNames:data:](v44, "setForegroundCubesWithNames:data:", v35, [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1]))break; {

      }
      currentForegroundColorLookupTables[v21] = v33;
    }
    if (currentBackgroundColorLookupTables[v21] != v34)
    {
      if (-[FigColorCubeMetalFilter setBackgroundCubeWithName:data:](filters[v21], "setBackgroundCubeWithName:data:", objc_msgSend((id)objc_msgSend(v26, "objectAtIndexedSubscript:", 0), "name"), v34))break; {

      }
      currentBackgroundColorLookupTables[v21] = v34;
    }
    long long v36 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v47 = *MEMORY[0x1E4F1DB28];
    long long v48 = v36;
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "objectAtIndexedSubscript:", v21), "objectForKeyedSubscript:", 0x1EFA73E00), "getValue:", &v47);
    [(FigColorCubeMetalFilter *)filters[v21] setInputPixelBuffer:a4];
    [(FigColorCubeMetalFilter *)filters[v21] setMattePixelbuffer:ImageBuffer];
    [(FigColorCubeMetalFilter *)filters[v21] setOutputPixelBuffer:a7];
    -[FigColorCubeMetalFilter setTargetRectangle:](filters[v21], "setTargetRectangle:", v47, v48);
    -[FigColorCubeMetalFilter setMatteToInputPixelBufferRotationDegrees:](filters[v21], "setMatteToInputPixelBufferRotationDegrees:", [v40 intValue]);
    if ([(FigColorCubeMetalFilter *)filters[v21] process]) {
      break;
    }
    uint64_t v21 = v25++;
    if ([v20 count] <= (unint64_t)v46) {
      goto LABEL_27;
    }
  }
  uint64_t v38 = 0;
  a8 = v39;
  uint64_t v12 = (_DWORD *)MEMORY[0x1E4F1EBA8];
LABEL_31:
  if (*v12 == 1) {
    kdebug_trace();
  }
  if (a8) {
    (*((void (**)(id, uint64_t, void))a8 + 2))(a8, v38, 0);
  }
}

- (void)_attachFiltersForZoomPIPWithInputBuffer:(void *)a3 rendererParameters:
{
  if (a1)
  {
    AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a2, 0x1EFA74680);
    if (AttachedMedia)
    {
      v6 = AttachedMedia;
      uint64_t v7 = (void *)CMGetAttachment(AttachedMedia, @"FiltersForZoomPIPOverlay", 0);
      if (!v7) {
        uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
      }
      BOOL v8 = (void *)CMGetAttachment(a2, @"FiltersAndRegionArray", 0);
      if (v8)
      {
        v9 = v8;
        if ([v8 count])
        {
          uint64_t v10 = 0;
          double v11 = 0;
          float v12 = 0.0;
          unsigned int v13 = 1;
          float v14 = (long long *)MEMORY[0x1E4F1DB28];
          do
          {
            uint64_t v15 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v10), "objectForKeyedSubscript:", 0x1EFA73DE0);
            if (v15)
            {
              uint64_t v16 = (void *)v15;
              long long v17 = v14[1];
              long long v26 = *v14;
              long long v27 = v17;
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v10), "objectForKeyedSubscript:", 0x1EFA73E00), "getValue:", &v26);
              float v18 = *(double *)&v27 * *((double *)&v27 + 1);
              if (v12 < v18)
              {
                double v11 = v16;
                float v12 = *(double *)&v27 * *((double *)&v27 + 1);
              }
            }
            uint64_t v10 = v13;
          }
          while ([v9 count] > (unint64_t)v13++);
        }
        else
        {
          double v11 = 0;
        }
        v20 = (void *)[v11 objectAtIndexedSubscript:0];
        NSClassFromString(&cfstr_Cicolorcubesmi.isa);
        if (objc_opt_isKindOfClass()) {
          uint64_t v22 = [v20 cube1Data];
        }
        else {
          uint64_t v22 = 0;
        }
        if (!v20) {
          goto LABEL_30;
        }
      }
      else
      {
        v20 = (void *)[a3 colorFilter];
        if ([a3 backgroundColorLookupTable]) {
          uint64_t v21 = [a3 backgroundColorLookupTable];
        }
        else {
          uint64_t v21 = [a3 foregroundColorLookupTable];
        }
        uint64_t v22 = v21;
        if (!v20) {
          goto LABEL_30;
        }
      }
      NSClassFromString(&cfstr_Cicolorcubesmi.isa);
      if (objc_opt_isKindOfClass())
      {
        v23 = (void *)[MEMORY[0x1E4F1E040] colorCubeWithColorSpaceFilter];
        objc_msgSend(v23, "setName:", objc_msgSend(v20, "name"));
        [v20 cubeDimension];
        objc_msgSend(v23, "setCubeDimension:");
        objc_msgSend(v23, "setColorSpace:", objc_msgSend(v20, "colorSpace"));
      }
      else
      {
        NSClassFromString(&cfstr_Ciphotoeffect3_1.isa);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          NSClassFromString(&cfstr_Ciphotoeffect.isa);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v24 = v7;
            unsigned int v25 = v20;
            goto LABEL_29;
          }
        }
        v23 = (void *)[MEMORY[0x1E4F1E040] colorCubeWithColorSpaceFilter];
        objc_msgSend(v23, "setName:", objc_msgSend(v20, "name"));
        [v23 setCubeDimension:8589936700.0];
      }
      [v23 setCubeData:v22];
      v24 = v7;
      unsigned int v25 = v23;
LABEL_29:
      [v24 addObject:v25];
LABEL_30:
      if ([v7 count]) {
        CMSetAttachment(v6, @"FiltersForZoomPIPOverlay", v7, 1u);
      }
    }
  }
}

+ (id)bundle
{
  id v2 = (void *)[MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/VideoProcessors/MetalFilter.bundle"];
  uint64_t v3 = v2;
  if (!v2)
  {
    fig_log_get_emitter();
LABEL_6:
    FigDebugAssert3();
    FigSignalErrorAt();
    return v3;
  }
  uint64_t v5 = 0;
  if (([v2 loadAndReturnError:&v5] & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_6;
  }
  return v3;
}

- (BOOL)supportsAnimation
{
  return 1;
}

- (BOOL)adjustsMetadata
{
  return 0;
}

- (BOOL)mixingColorCubesInGammaDomain
{
  return self->_mixingColorCubesInGammaDomain;
}

@end