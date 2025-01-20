@interface MKVKImageSourceKeyImageResult
- (BOOL)hasSameFullBleedColors;
- (MKVKImageSourceCalculationParameters)parameters;
- (MKVKImageSourceKeyImageResult)initWithParameters:(id)a3;
- (NSArray)fullBleedColors;
- (NSArray)images;
- (NSMutableArray)mutableImages;
- (NSMutableArray)triedKeys;
- (NSMutableSet)imageDatas;
- (void)addFullBleedColor:(id)a3;
- (void)setImageDatas:(id)a3;
- (void)setMutableImages:(id)a3;
- (void)setTriedKeys:(id)a3;
@end

@implementation MKVKImageSourceKeyImageResult

- (MKVKImageSourceKeyImageResult)initWithParameters:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MKVKImageSourceKeyImageResult;
  v6 = [(MKVKImageSourceKeyImageResult *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parameters, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    triedKeys = v7->_triedKeys;
    v7->_triedKeys = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableFullBleedColors = v7->_mutableFullBleedColors;
    v7->_mutableFullBleedColors = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableImages = v7->_mutableImages;
    v7->_mutableImages = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    imageDatas = v7->_imageDatas;
    v7->_imageDatas = v14;

    v7->_sameFullBleedColors = 1;
  }

  return v7;
}

- (NSArray)fullBleedColors
{
  v2 = (void *)[(NSMutableArray *)self->_mutableFullBleedColors copy];

  return (NSArray *)v2;
}

- (NSArray)images
{
  v2 = (void *)[(NSMutableArray *)self->_mutableImages copy];

  return (NSArray *)v2;
}

- (void)addFullBleedColor:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    if (self->_sameFullBleedColors && [(NSMutableArray *)self->_mutableFullBleedColors count])
    {
      id v5 = [(NSMutableArray *)self->_mutableFullBleedColors lastObject];
      self->_sameFullBleedColors = [v5 isEqual:v6];
    }
    [(NSMutableArray *)self->_mutableFullBleedColors addObject:v6];
    id v4 = v6;
  }
}

- (MKVKImageSourceCalculationParameters)parameters
{
  return self->_parameters;
}

- (BOOL)hasSameFullBleedColors
{
  return self->_sameFullBleedColors;
}

- (NSMutableArray)triedKeys
{
  return self->_triedKeys;
}

- (void)setTriedKeys:(id)a3
{
}

- (NSMutableArray)mutableImages
{
  return self->_mutableImages;
}

- (void)setMutableImages:(id)a3
{
}

- (NSMutableSet)imageDatas
{
  return self->_imageDatas;
}

- (void)setImageDatas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDatas, 0);
  objc_storeStrong((id *)&self->_mutableImages, 0);
  objc_storeStrong((id *)&self->_triedKeys, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_mutableFullBleedColors, 0);
}

@end