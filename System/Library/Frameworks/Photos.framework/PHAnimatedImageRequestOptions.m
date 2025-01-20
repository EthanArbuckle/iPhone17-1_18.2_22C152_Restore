@interface PHAnimatedImageRequestOptions
- (BOOL)allowPreCaching;
- (BOOL)useSharedImageDecoding;
- (PHAnimatedImageRequestOptions)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAllowPreCaching:(BOOL)a3;
- (void)setUseSharedImageDecoding:(BOOL)a3;
@end

@implementation PHAnimatedImageRequestOptions

- (void)setUseSharedImageDecoding:(BOOL)a3
{
  self->_useSharedImageDecoding = a3;
}

- (BOOL)useSharedImageDecoding
{
  return self->_useSharedImageDecoding;
}

- (void)setAllowPreCaching:(BOOL)a3
{
  self->_allowPreCaching = a3;
}

- (BOOL)allowPreCaching
{
  return self->_allowPreCaching;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHAnimatedImageRequestOptions;
  id v4 = [(PHImageRequestOptions *)&v6 copyWithZone:a3];
  [v4 setAllowPreCaching:self->_allowPreCaching];
  [v4 setUseSharedImageDecoding:self->_useSharedImageDecoding];
  return v4;
}

- (PHAnimatedImageRequestOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHAnimatedImageRequestOptions;
  result = [(PHImageRequestOptions *)&v3 init];
  if (result)
  {
    result->_allowPreCaching = 1;
    result->_useSharedImageDecoding = 0;
  }
  return result;
}

@end