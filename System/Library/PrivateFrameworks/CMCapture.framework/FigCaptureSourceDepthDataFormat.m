@interface FigCaptureSourceDepthDataFormat
- ($2825F4736939C4A6D3AD43837233062D)depthEngineOutputDimensions;
- (BOOL)RGBIRStereoFusionSupported;
- (BOOL)gainMapSupported;
- (BOOL)isStillImageOnlyDepthData;
- (float)fieldOfView;
- (id)copyWithNewPixelFormat:(unsigned int)a3;
- (id)highResStillImageDimensions;
- (unsigned)mediaType;
@end

@implementation FigCaptureSourceDepthDataFormat

- (id)copyWithNewPixelFormat:(unsigned int)a3
{
  if (!self->super._formatDictionary) {
    return 0;
  }
  uint64_t v3 = *(void *)&a3;
  v5 = [FigCaptureSourceDepthDataFormat alloc];
  formatDictionary = self->super._formatDictionary;
  return [(FigCaptureSourceFormat *)v5 initWithFigCaptureStreamFormatDictionary:formatDictionary pixelFormatOverride:v3];
}

- (unsigned)mediaType
{
  return 1685091432;
}

- (BOOL)isStillImageOnlyDepthData
{
  BOOL v3 = FigCaptureVideoDimensionsAreValid([(FigCaptureSourceFormat *)self dimensions]);
  return objc_msgSend(-[FigCaptureSourceDepthDataFormat highResStillImageDimensions](self, "highResStillImageDimensions"), "count")&& !v3;
}

- (id)highResStillImageDimensions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  unsigned int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"HighResStillWidth"), "intValue");
  uint64_t v4 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"HighResStillHeight"), "intValue");
  v6[0] = [[FigCaptureSourceFormatDimensions alloc] initWithDimensions:v3 | (unint64_t)(v4 << 32) deferredPhotoProxyDimensions:v3 | (unint64_t)(v4 << 32) isPrivate:0 flavor:0 maxUpscalingDimensions:0];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
}

- (float)fieldOfView
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:*MEMORY[0x1E4F55C70]];
  [v2 floatValue];
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)depthEngineOutputDimensions
{
  unsigned int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"DepthEngineOutputWidth"), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"DepthEngineOutputHeight"), "intValue") << 32));
}

- (BOOL)RGBIRStereoFusionSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"RGBIRStereoFusionSupported"];
  return [v2 BOOLValue];
}

- (BOOL)gainMapSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"GainMapSupported"];
  return [v2 BOOLValue];
}

@end