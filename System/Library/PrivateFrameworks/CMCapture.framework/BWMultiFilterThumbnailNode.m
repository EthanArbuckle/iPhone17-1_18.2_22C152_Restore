@interface BWMultiFilterThumbnailNode
+ (void)initialize;
- (BWMultiFilterThumbnailNode)initWithFilters:(id)a3 thumbnailSize:(CGSize)a4 maxLossyCompressionLevel:(int)a5;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_loadAndConfigureFilterBundle;
- (void)_releaseResources;
- (void)_supportedPixelFormats;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWMultiFilterThumbnailNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (self) {
    output = self->super._output;
  }
  else {
    output = 0;
  }
  v7 = objc_alloc_init(BWVideoFormatRequirements);
  [(BWVideoFormatRequirements *)v7 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedHWAccess]];
  if ([a3 colorSpaceProperties])
  {
    v9[0] = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    uint64_t v8 = 0;
  }
  [(BWVideoFormatRequirements *)v7 setSupportedColorSpaceProperties:v8];
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v7, "setSupportedPixelFormats:", -[BWMultiFilterThumbnailNode _supportedPixelFormats]((uint64_t)self));
  [(BWVideoFormatRequirements *)v7 setWidth:(unint64_t)self->_thumbnailSize.width];
  [(BWVideoFormatRequirements *)v7 setHeight:(unint64_t)(self->_thumbnailSize.height * (double)([(NSArray *)self->_filters count] + 1))];
  [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)output primaryMediaConfiguration] setFormatRequirements:v7];
}

- (id)nodeType
{
  return @"Effect";
}

- (BWMultiFilterThumbnailNode)initWithFilters:(id)a3 thumbnailSize:(CGSize)a4 maxLossyCompressionLevel:(int)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v17.receiver = self;
  v17.super_class = (Class)BWMultiFilterThumbnailNode;
  v9 = [(BWNode *)&v17 init];
  v10 = v9;
  if (v9)
  {
    v9->_thumbnailSize.CGFloat width = width;
    v9->_thumbnailSize.CGFloat height = height;
    v9->_filters = (NSArray *)[a3 copy];
    v10->_maxLossyCompressionLevel = a5;
    v11 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v10 index:0];
    v12 = -[BWMultiFilterThumbnailNode _supportedPixelFormats]((uint64_t)v10);
    v13 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v13 setSupportedPixelFormats:v12];
    [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v11 primaryMediaConfiguration] setFormatRequirements:v13];
    [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v11 primaryMediaConfiguration] setPassthroughMode:0];
    [(BWNode *)v10 addInput:v11];

    v14 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v10];
    v15 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v15 setSupportedPixelFormats:v12];
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v14 primaryMediaConfiguration] setFormatRequirements:v15];
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v14 primaryMediaConfiguration] setPassthroughMode:0];
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v14 primaryMediaConfiguration] setIndexOfInputWhichDrivesThisOutput:0];
    [(BWNode *)v10 addOutput:v14];

    v10->_colorLookupCache = objc_alloc_init(BWColorLookupCache);
  }
  return v10;
}

- (void)_supportedPixelFormats
{
  if (!a1) {
    return 0;
  }
  v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  v3 = (void *)[*(id *)(a1 + 8) format];
  if (!v3)
  {
    [v2 addObject:&unk_1EFAFF210];
    int v8 = 1;
    goto LABEL_8;
  }
  v4 = v3;
  char IsFullRange = FigCapturePixelFormatIsFullRange([v3 pixelFormat]);
  int v6 = FigCapturePixelFormatIsFullRange([v4 pixelFormat]);
  char v7 = v6;
  if ((IsFullRange & 1) == 0)
  {
    [v2 addObject:&unk_1EFAFF210];
    int v8 = 1;
    if ((v7 & 1) == 0)
    {
      int v9 = 0;
      goto LABEL_9;
    }
LABEL_8:
    [v2 addObject:&unk_1EFAFF228];
    int v9 = 1;
    goto LABEL_9;
  }
  int v8 = 0;
  int v9 = 0;
  if (v6) {
    goto LABEL_8;
  }
LABEL_9:
  if (FigCapturePlatformSupportsUniversalCompression()) {
    objc_msgSend(v2, "addObjectsFromArray:", FigCaptureSupportedCompressedPixelFormatsForSettings(4, *(_DWORD *)(a1 + 120), v8, v9, 0, 1, 0, 0));
  }
  return v2;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  -[BWMultiFilterThumbnailNode _loadAndConfigureFilterBundle]((uint64_t)self);
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", -[BWColorLookupCache identityColorLookupTable](self->_colorLookupCache, "identityColorLookupTable"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  filters = self->_filters;
  uint64_t v5 = [(NSArray *)filters countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(filters);
      }
      uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
      id v10 = [(BWColorLookupCache *)self->_colorLookupCache colorLookupTablesForFilter:v9];
      if (!v10)
      {
        id v10 = [(BWColorLookupCache *)self->_colorLookupCache fetchColorLookupTablesForFilter:v9];
        if (!v10) {
          break;
        }
      }
      objc_msgSend(v3, "addObject:", objc_msgSend(v10, "foregroundColorLookupTable"));
      if (v6 == ++v8)
      {
        uint64_t v6 = [(NSArray *)filters countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    *(unsigned char *)([(FigColorCubeMetalFilter *)self->_filter filterDescriptor] + 8) = 0;
    int v11 = [(NSArray *)self->_filters count] + 1;
    *(_DWORD *)([(FigColorCubeMetalFilter *)self->_filter filterDescriptor] + 4) = v11;
    *(_DWORD *)[(FigColorCubeMetalFilter *)self->_filter filterDescriptor] = 32;
    if (![(FigColorCubeMetalFilter *)self->_filter prepareToProcess:0]) {
      [(FigColorCubeMetalFilter *)self->_filter setForegroundCubesWithNames:0 data:v3];
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)BWMultiFilterThumbnailNode;
  [(BWNode *)&v12 prepareForCurrentConfigurationToBecomeLive];
}

+ (void)initialize
{
}

- (void)dealloc
{
  mostRecentFormatDescription = self->_mostRecentFormatDescription;
  if (mostRecentFormatDescription) {
    CFRelease(mostRecentFormatDescription);
  }
  -[BWMultiFilterThumbnailNode _releaseResources]((id *)&self->super.super.isa);
  v4.receiver = self;
  v4.super_class = (Class)BWMultiFilterThumbnailNode;
  [(BWNode *)&v4 dealloc];
}

- (void)_releaseResources
{
  if (a1)
  {

    a1[16] = 0;
    a1[17] = 0;

    a1[14] = 0;
  }
}

- (id)nodeSubType
{
  return @"MultiFilterThumbnail";
}

- (uint64_t)_loadAndConfigureFilterBundle
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v5 = 0;
    v2 = (void *)[MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/VideoProcessors/MetalFilter.bundle"];
    if (!v2)
    {
      fig_log_get_emitter();
LABEL_10:
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
    v3 = v2;
    if ([v2 loadAndReturnError:&v5])
    {
      uint64_t v4 = objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "classNamed:", @"FigColorCubeMetalFilter")), "initWithCommandQueue:", 0);
      *(void *)(v1 + 136) = v4;
      if (v4) {
        return 0;
      }
      fig_log_get_emitter();
      goto LABEL_10;
    }
    return 4294954510;
  }
  return result;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  CFTypeRef cf = 0;
  BWSampleBufferRemoveAttachedMedia(a3, @"Depth");
  if (a3
    && (CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3)) != 0
    && (CVImageBufferRef v7 = ImageBuffer,
        (uint64_t v8 = [(BWPixelBufferPool *)[(BWNodeOutput *)[(BWNode *)self output] livePixelBufferPool] newPixelBuffer]) != 0))
  {
    uint64_t v9 = v8;
    [(FigColorCubeMetalFilter *)self->_filter setInputPixelBuffer:v7];
    [(FigColorCubeMetalFilter *)self->_filter setMattePixelbuffer:0];
    [(FigColorCubeMetalFilter *)self->_filter setOutputPixelBuffer:v9];
    if (![(FigColorCubeMetalFilter *)self->_filter process]
      && ![(FigColorCubeMetalFilter *)self->_filter finishProcessing]
      && !BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v9, (CFTypeRef *)&self->_mostRecentFormatDescription, (CMSampleBufferRef *)&cf))
    {
      [(BWNodeOutput *)self->super._output emitSampleBuffer:cf];
    }
    CFRelease(v9);
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  -[BWMultiFilterThumbnailNode _releaseResources]((id *)&self->super.super.isa);
  v5.receiver = self;
  v5.super_class = (Class)BWMultiFilterThumbnailNode;
  [(BWNode *)&v5 didReachEndOfDataForInput:a3];
}

@end