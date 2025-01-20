@interface BWMetalColorCubeRendererParameters
+ (void)initialize;
- (BWColorLookupCache)colorLookupCache;
- (BWMetalColorCubeRendererParameters)initWithColorFilter:(id)a3 colorLookupCache:(id)a4;
- (CIFilter)colorFilter;
- (NSData)backgroundColorLookupTable;
- (NSData)foregroundColorLookupTable;
- (float)interpolationFractionComplete;
- (id)copyWithZone:(_NSZone *)a3;
- (int)prepareForRenderingWithInputVideoFormat:(id)a3;
- (signed)type;
- (void)dealloc;
- (void)setBackgroundColorLookupTable:(id)a3;
- (void)setColorFilter:(id)a3;
- (void)setForegroundColorLookupTable:(id)a3;
- (void)updateByInterpolatingFromParameters:(id)a3 toParameters:(id)a4 withFractionComplete:(float)a5;
@end

@implementation BWMetalColorCubeRendererParameters

+ (void)initialize
{
}

- (BWMetalColorCubeRendererParameters)initWithColorFilter:(id)a3 colorLookupCache:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BWMetalColorCubeRendererParameters;
  v6 = [(BWMetalColorCubeRendererParameters *)&v9 init];
  if (v6)
  {
    v6->_colorFilter = (CIFilter *)a3;
    v6->_colorLookupCache = (BWColorLookupCache *)a4;
    v7 = (void *)[a4 colorLookupTablesForFilter:a3];
    v6->_foregroundColorLookupTable = (NSData *)(id)[v7 foregroundColorLookupTable];
    v6->_backgroundColorLookupTable = (NSData *)(id)[v7 backgroundColorLookupTable];
    v6->_interpolationFractionComplete = 1.0;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWMetalColorCubeRendererParameters;
  [(BWMetalColorCubeRendererParameters *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [BWMetalColorCubeRendererParameters alloc];
  colorFilter = self->_colorFilter;
  colorLookupCache = self->_colorLookupCache;
  return [(BWMetalColorCubeRendererParameters *)v4 initWithColorFilter:colorFilter colorLookupCache:colorLookupCache];
}

- (signed)type
{
  return 5;
}

- (int)prepareForRenderingWithInputVideoFormat:(id)a3
{
  if (![(BWMetalColorCubeRendererParameters *)self foregroundColorLookupTable]
    && ![(BWMetalColorCubeRendererParameters *)self backgroundColorLookupTable])
  {
    id v4 = [(BWColorLookupCache *)[(BWMetalColorCubeRendererParameters *)self colorLookupCache] fetchColorLookupTablesForFilter:[(BWMetalColorCubeRendererParameters *)self colorFilter]];
    if (v4)
    {
      v5 = v4;
      -[BWMetalColorCubeRendererParameters setForegroundColorLookupTable:](self, "setForegroundColorLookupTable:", [v4 foregroundColorLookupTable]);
      -[BWMetalColorCubeRendererParameters setBackgroundColorLookupTable:](self, "setBackgroundColorLookupTable:", [v5 backgroundColorLookupTable]);
    }
  }
  return 0;
}

- (void)setColorFilter:(id)a3
{
  colorFilter = self->_colorFilter;
  if (colorFilter != a3)
  {

    self->_colorFilter = (CIFilter *)a3;
  }
}

- (void)updateByInterpolatingFromParameters:(id)a3 toParameters:(id)a4 withFractionComplete:(float)a5
{
  if (a3 && [a3 type] != 5 || a4 && objc_msgSend(a4, "type") != 5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
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
    id v16 = v15;
    if ((objc_msgSend((id)objc_msgSend(a3, "foregroundColorLookupTable"), "isEqual:", objc_msgSend(a4, "foregroundColorLookupTable")) & 1) == 0)
    {
      *(float *)&double v17 = a5;
      id v10 = [(BWColorLookupCache *)self->_colorLookupCache interpolatedColorLookupTableFromTable:v10 toTable:v12 fractionComplete:v17];
    }
    [(BWMetalColorCubeRendererParameters *)self setForegroundColorLookupTable:v10];
    *(float *)&double v18 = a5;
    [(BWMetalColorCubeRendererParameters *)self setBackgroundColorLookupTable:[(BWColorLookupCache *)self->_colorLookupCache interpolatedColorLookupTableFromTable:v14 toTable:v16 fractionComplete:v18]];
    self->_interpolationFractionComplete = a5;
  }
}

- (float)interpolationFractionComplete
{
  return self->_interpolationFractionComplete;
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

@end