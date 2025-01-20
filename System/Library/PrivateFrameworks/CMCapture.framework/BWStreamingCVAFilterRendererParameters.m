@interface BWStreamingCVAFilterRendererParameters
+ (void)initialize;
- (BWColorLookupCache)colorLookupCache;
- (BWStreamingCVAFilterRendererParameters)initWithColorFilter:(id)a3 colorLookupCache:(id)a4 studioAndContourRenderingEnabled:(BOOL)a5 stageRenderingEnabled:(BOOL)a6;
- (CIFilter)colorFilter;
- (NSData)backgroundColorLookupTable;
- (NSData)foregroundColorLookupTable;
- (NSString)description;
- (float)interpolationFractionComplete;
- (id)copyWithZone:(_NSZone *)a3;
- (int)prepareForRenderingWithInputVideoFormat:(id)a3;
- (int64_t)renderingStrategy;
- (signed)type;
- (uint64_t)_ensureParametersForColorFilter:(uint64_t *)a3 outputRenderingStrategy:;
- (void)dealloc;
- (void)setBackgroundColorLookupTable:(id)a3;
- (void)setColorFilter:(id)a3;
- (void)setForegroundColorLookupTable:(id)a3;
- (void)updateByInterpolatingFromParameters:(id)a3 toParameters:(id)a4 withFractionComplete:(float)a5;
@end

@implementation BWStreamingCVAFilterRendererParameters

+ (void)initialize
{
}

- (BWStreamingCVAFilterRendererParameters)initWithColorFilter:(id)a3 colorLookupCache:(id)a4 studioAndContourRenderingEnabled:(BOOL)a5 stageRenderingEnabled:(BOOL)a6
{
  v13.receiver = self;
  v13.super_class = (Class)BWStreamingCVAFilterRendererParameters;
  v10 = [(BWStreamingCVAFilterRendererParameters *)&v13 init];
  if (v10)
  {
    v10->_colorFilter = (CIFilter *)a3;
    v10->_colorLookupCache = (BWColorLookupCache *)a4;
    v11 = (void *)[a4 colorLookupTablesForFilter:a3];
    v10->_foregroundColorLookupTable = (NSData *)(id)[v11 foregroundColorLookupTable];
    v10->_backgroundColorLookupTable = (NSData *)(id)[v11 backgroundColorLookupTable];
    v10->_interpolationFractionComplete = 1.0;
    v10->_studioAndContourRenderingEnabled = a5;
    v10->_stageRenderingEnabled = a6;
    -[BWStreamingCVAFilterRendererParameters _ensureParametersForColorFilter:outputRenderingStrategy:]((uint64_t)v10, a3, &v10->_renderingStrategy);
  }
  return v10;
}

- (uint64_t)_ensureParametersForColorFilter:(uint64_t *)a3 outputRenderingStrategy:
{
  if (result && a2)
  {
    uint64_t v5 = result;
    result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", @"CIPortraitEffectStudio");
    if ((result & 1) != 0
      || (result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", @"CIPortraitEffectStudioV2"),
          result))
    {
      BOOL v6 = *(unsigned char *)(v5 + 40) == 0;
      uint64_t v7 = 1;
    }
    else
    {
      result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", @"CIPortraitEffectContour");
      if ((result & 1) != 0
        || (result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", @"CIPortraitEffectContourV2"),
            result))
      {
        BOOL v6 = *(unsigned char *)(v5 + 40) == 0;
        uint64_t v7 = 3;
      }
      else
      {
        result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", @"CIPortraitEffectStage");
        if ((result & 1) != 0
          || (result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", @"CIPortraitEffectStageV2"),
              result))
        {
          BOOL v6 = *(unsigned char *)(v5 + 41) == 0;
          uint64_t v7 = 5;
        }
        else
        {
          result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", @"CIPortraitEffectStageMono");
          if ((result & 1) != 0
            || (result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", @"CIPortraitEffectStageMonoV2"), result))
          {
            BOOL v6 = *(unsigned char *)(v5 + 41) == 0;
            uint64_t v7 = 7;
          }
          else
          {
            result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", @"CIPortraitEffectStageWhite");
            if (!result)
            {
              uint64_t v7 = 0;
              if (!a3) {
                return result;
              }
              goto LABEL_18;
            }
            BOOL v6 = *(unsigned char *)(v5 + 41) == 0;
            uint64_t v7 = 9;
          }
        }
      }
    }
    if (v6) {
      ++v7;
    }
    if (a3) {
LABEL_18:
    }
      *a3 = v7;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStreamingCVAFilterRendererParameters;
  [(BWStreamingCVAFilterRendererParameters *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p> studio&contour:%d, stage:%d strategy:%ld, fractionComplete:%.3f, fgLUT:%d, bgLUT:%d, colorFilter:%@", objc_opt_class(), self, self->_studioAndContourRenderingEnabled, self->_stageRenderingEnabled, self->_renderingStrategy, self->_interpolationFractionComplete, self->_foregroundColorLookupTable != 0, self->_backgroundColorLookupTable != 0, self->_colorFilter];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[BWStreamingCVAFilterRendererParameters alloc] initWithColorFilter:self->_colorFilter colorLookupCache:self->_colorLookupCache studioAndContourRenderingEnabled:self->_studioAndContourRenderingEnabled stageRenderingEnabled:self->_stageRenderingEnabled];

  v4->_foregroundColorLookupTable = [(BWStreamingCVAFilterRendererParameters *)self foregroundColorLookupTable];
  v4->_backgroundColorLookupTable = [(BWStreamingCVAFilterRendererParameters *)self backgroundColorLookupTable];
  v4->_renderingStrategy = [(BWStreamingCVAFilterRendererParameters *)self renderingStrategy];
  [(BWStreamingCVAFilterRendererParameters *)self interpolationFractionComplete];
  v4->_interpolationFractionComplete = v5;
  return v4;
}

- (signed)type
{
  return 0;
}

- (int)prepareForRenderingWithInputVideoFormat:(id)a3
{
  if (![(BWStreamingCVAFilterRendererParameters *)self foregroundColorLookupTable]
    && ![(BWStreamingCVAFilterRendererParameters *)self backgroundColorLookupTable])
  {
    id v4 = [(BWColorLookupCache *)[(BWStreamingCVAFilterRendererParameters *)self colorLookupCache] fetchColorLookupTablesForFilter:[(BWStreamingCVAFilterRendererParameters *)self colorFilter]];
    if (v4)
    {
      float v5 = v4;
      -[BWStreamingCVAFilterRendererParameters setForegroundColorLookupTable:](self, "setForegroundColorLookupTable:", [v4 foregroundColorLookupTable]);
      -[BWStreamingCVAFilterRendererParameters setBackgroundColorLookupTable:](self, "setBackgroundColorLookupTable:", [v5 backgroundColorLookupTable]);
    }
  }
  return 0;
}

- (void)updateByInterpolatingFromParameters:(id)a3 toParameters:(id)a4 withFractionComplete:(float)a5
{
  if ([a3 type] || objc_msgSend(a4, "type"))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    self->_unint64_t renderingStrategy = [a4 renderingStrategy];
    if ([a3 colorFilter]) {
      id v9 = (id)[a3 foregroundColorLookupTable];
    }
    else {
      id v9 = [(BWColorLookupCache *)self->_colorLookupCache identityColorLookupTable];
    }
    id v10 = v9;
    if ([a4 colorFilter]) {
      id v11 = (id)[a4 foregroundColorLookupTable];
    }
    else {
      id v11 = [(BWColorLookupCache *)self->_colorLookupCache identityColorLookupTable];
    }
    id v12 = v11;
    if ([a3 colorFilter]) {
      id v13 = (id)[a3 backgroundColorLookupTable];
    }
    else {
      id v13 = [(BWColorLookupCache *)self->_colorLookupCache identityColorLookupTable];
    }
    id v14 = v13;
    if ([a4 colorFilter]) {
      id v15 = (id)[a4 backgroundColorLookupTable];
    }
    else {
      id v15 = [(BWColorLookupCache *)self->_colorLookupCache identityColorLookupTable];
    }
    unint64_t renderingStrategy = self->_renderingStrategy;
    if (renderingStrategy <= 0xA)
    {
      if (((1 << renderingStrategy) & 0x555) != 0)
      {
        if (v15) {
          id v18 = v15;
        }
        else {
          id v18 = v12;
        }
        if (!v14) {
          id v14 = v10;
        }
        *(float *)&double v16 = a5;
        [(BWStreamingCVAFilterRendererParameters *)self setForegroundColorLookupTable:[(BWColorLookupCache *)self->_colorLookupCache interpolatedColorLookupTableFromTable:v10 toTable:v12 fractionComplete:v16]];
        *(float *)&double v19 = a5;
        [(BWStreamingCVAFilterRendererParameters *)self setBackgroundColorLookupTable:[(BWColorLookupCache *)self->_colorLookupCache interpolatedColorLookupTableFromTable:v14 toTable:v18 fractionComplete:v19]];
        self->_interpolationFractionComplete = 1.0;
      }
      else
      {
        if (((1 << renderingStrategy) & 0x2A) == 0) {
          -[BWStreamingCVAFilterRendererParameters setForegroundColorLookupTable:](self, "setForegroundColorLookupTable:", [a4 foregroundColorLookupTable]);
        }
        self->_interpolationFractionComplete = a5;
      }
    }
  }
}

- (void)setColorFilter:(id)a3
{
  colorFilter = self->_colorFilter;
  if (colorFilter != a3)
  {

    self->_colorFilter = (CIFilter *)a3;
    -[BWStreamingCVAFilterRendererParameters _ensureParametersForColorFilter:outputRenderingStrategy:]((uint64_t)self, a3, &self->_renderingStrategy);
  }
}

- (CIFilter)colorFilter
{
  return self->_colorFilter;
}

- (BWColorLookupCache)colorLookupCache
{
  return self->_colorLookupCache;
}

- (NSData)foregroundColorLookupTable
{
  return self->_foregroundColorLookupTable;
}

- (void)setForegroundColorLookupTable:(id)a3
{
}

- (NSData)backgroundColorLookupTable
{
  return self->_backgroundColorLookupTable;
}

- (void)setBackgroundColorLookupTable:(id)a3
{
}

- (float)interpolationFractionComplete
{
  return self->_interpolationFractionComplete;
}

- (int64_t)renderingStrategy
{
  return self->_renderingStrategy;
}

@end