@interface PHLivePhotoExportSessionOptions
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)format;
- (void)setFormat:(int64_t)a3;
@end

@implementation PHLivePhotoExportSessionOptions

- (void)setFormat:(int64_t)a3
{
  self->_format = a3;
}

- (int64_t)format
{
  return self->_format;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v4[1] = [(PHLivePhotoExportSessionOptions *)self format];
  return v4;
}

@end