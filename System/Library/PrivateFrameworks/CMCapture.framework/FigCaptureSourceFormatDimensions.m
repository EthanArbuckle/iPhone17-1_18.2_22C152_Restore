@interface FigCaptureSourceFormatDimensions
+ (id)identifyDimensionsFromFlavor:(int)a3 availableHighResStillImageDimensions:(id)a4;
+ (id)identifySourceFormatDimensionsFromDimensions:(id)a3 availableHighResStillImageDimensions:(id)a4;
+ (int)identifyResolutionFlavorFromDimensions:(id)a3 availableHighResStillImageDimensions:(id)a4;
- ($2825F4736939C4A6D3AD43837233062D)deferredPhotoProxyDimensions;
- ($2825F4736939C4A6D3AD43837233062D)dimensions;
- ($2825F4736939C4A6D3AD43837233062D)maxUpscalingDimensions;
- (BOOL)dimensionsAreEqualToDimensions:(id)a3;
- (BOOL)isPrivate;
- (FigCaptureSourceFormatDimensions)initWithDimensions:(id)a3 deferredPhotoProxyDimensions:(id)a4 isPrivate:(BOOL)a5 flavor:(int)a6 maxUpscalingDimensions:(id)a7;
- (id)description;
- (int)flavor;
@end

@implementation FigCaptureSourceFormatDimensions

- (FigCaptureSourceFormatDimensions)initWithDimensions:(id)a3 deferredPhotoProxyDimensions:(id)a4 isPrivate:(BOOL)a5 flavor:(int)a6 maxUpscalingDimensions:(id)a7
{
  v13.receiver = self;
  v13.super_class = (Class)FigCaptureSourceFormatDimensions;
  result = [(FigCaptureSourceFormatDimensions *)&v13 init];
  if (result)
  {
    result->_dimensions = ($470D365275581EF16070F5A11344F73E)a3;
    result->_deferredPhotoProxyDimensions = ($470D365275581EF16070F5A11344F73E)a4;
    result->_isPrivate = a5;
    result->_flavor = a6;
    result->_maxUpscalingDimensions = ($470D365275581EF16070F5A11344F73E)a7;
  }
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)dimensions
{
  objc_copyStruct(&dest, &self->_dimensions, 8, 1, 0);
  return dest;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (int)flavor
{
  return self->_flavor;
}

+ (int)identifyResolutionFlavorFromDimensions:(id)a3 availableHighResStillImageDimensions:(id)a4
{
  v4 = (void *)[a1 identifySourceFormatDimensionsFromDimensions:a3 availableHighResStillImageDimensions:a4];
  if (v4)
  {
    LODWORD(v4) = [v4 flavor];
  }
  return (int)v4;
}

+ (id)identifySourceFormatDimensionsFromDimensions:(id)a3 availableHighResStillImageDimensions:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(a4);
    }
    v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if ([v10 dimensionsAreEqualToDimensions:a3]) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)dimensionsAreEqualToDimensions:(id)a3
{
  return self->_dimensions.width == a3.var0 && self->_dimensions.height == a3.var1;
}

- ($2825F4736939C4A6D3AD43837233062D)deferredPhotoProxyDimensions
{
  objc_copyStruct(&dest, &self->_deferredPhotoProxyDimensions, 8, 1, 0);
  return dest;
}

- (id)description
{
  if (FigCaptureVideoDimensionsAreValid(*(void *)&self->_deferredPhotoProxyDimensions)) {
    v3 = (__CFString *)[NSString stringWithFormat:@"proxy dims: %d x %d, ", self->_deferredPhotoProxyDimensions.width, self->_deferredPhotoProxyDimensions.height];
  }
  else {
    v3 = &stru_1EFA403E0;
  }
  v4 = &stru_1EFA403E0;
  if (FigCaptureVideoDimensionsAreValid(*(void *)&self->_maxUpscalingDimensions)) {
    v4 = (__CFString *)[NSString stringWithFormat:@"max upscaling dims: %d x %d, ", self->_maxUpscalingDimensions.width, self->_maxUpscalingDimensions.height];
  }
  v5 = NSString;
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t width = self->_dimensions.width;
  uint64_t height = self->_dimensions.height;
  uint64_t v10 = FigCaptureSourceFormatHighResolutionFlavorToShortString(self->_flavor);
  if (self->_isPrivate) {
    v11 = @" *Private";
  }
  else {
    v11 = &stru_1EFA403E0;
  }
  return (id)[v5 stringWithFormat:@"<%@ %p> %d x %d, %@%@flavor: %@%@", v7, self, width, height, v3, v4, v10, v11];
}

+ (id)identifyDimensionsFromFlavor:(int)a3 availableHighResStillImageDimensions:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(a4);
    }
    uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if ([v10 flavor] == a3) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- ($2825F4736939C4A6D3AD43837233062D)maxUpscalingDimensions
{
  objc_copyStruct(&dest, &self->_maxUpscalingDimensions, 8, 1, 0);
  return dest;
}

@end