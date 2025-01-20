@interface MKVKImageSourceCalculationParameters
- (MKVKImageSourceCalculationParameters)initWithImageSourceKeys:(id)a3 scale:(double)a4;
- (NSArray)imageSourceKeys;
- (double)scale;
@end

@implementation MKVKImageSourceCalculationParameters

- (MKVKImageSourceCalculationParameters)initWithImageSourceKeys:(id)a3 scale:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKVKImageSourceCalculationParameters;
  v7 = [(MKVKImageSourceCalculationParameters *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    imageSourceKeys = v7->_imageSourceKeys;
    v7->_imageSourceKeys = (NSArray *)v8;

    v7->_scale = a4;
  }

  return v7;
}

- (NSArray)imageSourceKeys
{
  return self->_imageSourceKeys;
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
}

@end