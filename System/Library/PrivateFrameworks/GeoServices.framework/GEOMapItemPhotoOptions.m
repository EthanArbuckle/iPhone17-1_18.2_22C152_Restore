@interface GEOMapItemPhotoOptions
+ (id)defaultPhotoOptionsWithAllowSmaller:(BOOL)a3;
+ (id)defaultPhotoOptionsWithCropStyle:(int64_t)a3;
- (BOOL)allowSmaller;
- (GEOMapItemPhotoOptions)initWithAllowSmaller:(BOOL)a3 cropStyle:(int64_t)a4 format:(int64_t)a5;
- (int64_t)preferredCropStyle;
- (int64_t)preferredFormat;
@end

@implementation GEOMapItemPhotoOptions

+ (id)defaultPhotoOptionsWithAllowSmaller:(BOOL)a3
{
  v3 = [[GEOMapItemPhotoOptions alloc] initWithAllowSmaller:a3 cropStyle:0 format:0];

  return v3;
}

- (GEOMapItemPhotoOptions)initWithAllowSmaller:(BOOL)a3 cropStyle:(int64_t)a4 format:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)GEOMapItemPhotoOptions;
  result = [(GEOMapItemPhotoOptions *)&v9 init];
  if (result)
  {
    result->_allowSmaller = a3;
    result->_preferredCropStyle = a4;
    result->_preferredFormat = a5;
  }
  return result;
}

- (int64_t)preferredFormat
{
  return self->_preferredFormat;
}

- (int64_t)preferredCropStyle
{
  return self->_preferredCropStyle;
}

- (BOOL)allowSmaller
{
  return self->_allowSmaller;
}

+ (id)defaultPhotoOptionsWithCropStyle:(int64_t)a3
{
  v3 = [[GEOMapItemPhotoOptions alloc] initWithAllowSmaller:1 cropStyle:a3 format:0];

  return v3;
}

@end