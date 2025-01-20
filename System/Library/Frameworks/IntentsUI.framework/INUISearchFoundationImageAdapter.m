@interface INUISearchFoundationImageAdapter
+ (id)_sharedImageLoader;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (INImage)intentsImage;
- (INUISearchFoundationImageAdapter)initWithIntentsImage:(id)a3;
- (INUISearchFoundationImageAdapter)initWithPayloadImage:(id)a3;
- (id)payloadImage;
- (int)source;
- (unint64_t)hash;
- (void)setIntentsImage:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation INUISearchFoundationImageAdapter

+ (id)_sharedImageLoader
{
  if (_sharedImageLoader_onceToken != -1) {
    dispatch_once(&_sharedImageLoader_onceToken, &__block_literal_global_1583);
  }
  v2 = (void *)_sharedImageLoader_sSharedImageLoader;

  return v2;
}

uint64_t __54__INUISearchFoundationImageAdapter__sharedImageLoader__block_invoke()
{
  uint64_t v0 = +[INUIImageLoader registeredImageLoaderWithScreenDelegate];
  uint64_t v1 = _sharedImageLoader_sSharedImageLoader;
  _sharedImageLoader_sSharedImageLoader = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (void)initialize
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___INUISearchFoundationImageAdapter;
  objc_msgSendSuper2(&v4, sel_initialize);
  if ((id)objc_opt_class() == a1) {
    id v3 = (id)[a1 _sharedImageLoader];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentsImage, 0);

  objc_storeStrong((id *)&self->_sizeValue, 0);
}

- (void)setIntentsImage:(id)a3
{
}

- (INImage)intentsImage
{
  return self->_intentsImage;
}

- (CGSize)size
{
  if (self->_sizeValue)
  {
    sizeValue = self->_sizeValue;
    [(NSValue *)sizeValue CGSizeValue];
  }
  else
  {
    v5 = [(INUISearchFoundationImageAdapter *)self intentsImage];
    [v5 _imageSize];
    double v7 = v6;
    double v9 = v8;

    double v3 = v7;
    double v4 = v9;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  sizeValue = self->_sizeValue;
  if (!sizeValue
    || (([(NSValue *)sizeValue CGSizeValue], v8 == width) ? (BOOL v9 = v7 == height) : (BOOL v9 = 0), !v9))
  {
    objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", width, height);
    v10 = (NSValue *)objc_claimAutoreleasedReturnValue();
    v11 = self->_sizeValue;
    self->_sizeValue = v10;
    MEMORY[0x270F9A758](v10, v11);
  }
}

- (int)source
{
  return 2;
}

- (id)payloadImage
{
  v2 = (void *)[(INUISearchFoundationImageAdapter *)self copy];
  double v3 = INIntentSlotValueTransformToImageValue();
  double v4 = [v3 data];
  [v2 setImageData:v4];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (INUISearchFoundationImageAdapter *)v4;
    double v6 = v5;
    if (self == v5)
    {
      char v12 = 1;
    }
    else
    {
      intentsImage = self->_intentsImage;
      uint64_t v8 = [(INUISearchFoundationImageAdapter *)v5 intentsImage];
      if (intentsImage == (INImage *)v8)
      {
        char v12 = 1;
      }
      else
      {
        BOOL v9 = (INImage *)v8;
        v10 = self->_intentsImage;
        v11 = [(INUISearchFoundationImageAdapter *)v6 intentsImage];
        char v12 = [(INImage *)v10 isEqual:v11];

        intentsImage = v9;
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  return [(INImage *)self->_intentsImage hash];
}

- (INUISearchFoundationImageAdapter)initWithIntentsImage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)INUISearchFoundationImageAdapter;
  v5 = [(INUISearchFoundationImageAdapter *)&v8 init];
  double v6 = v5;
  if (v5) {
    [(INUISearchFoundationImageAdapter *)v5 setIntentsImage:v4];
  }

  return v6;
}

- (INUISearchFoundationImageAdapter)initWithPayloadImage:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)INUISearchFoundationImageAdapter;
  v5 = [(INUISearchFoundationImageAdapter *)&v18 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F10110]);
    double v7 = [v4 imageData];
    objc_super v8 = (void *)[v6 initWithData:v7];
    uint64_t v9 = INIntentSlotValueTransformFromImageValue();
    intentsImage = v5->_intentsImage;
    v5->_intentsImage = (INImage *)v9;

    -[INUISearchFoundationImageAdapter setIsTemplate:](v5, "setIsTemplate:", [v4 isTemplate]);
    -[INUISearchFoundationImageAdapter setCornerRoundingStyle:](v5, "setCornerRoundingStyle:", [v4 cornerRoundingStyle]);
    [v4 scale];
    -[INUISearchFoundationImageAdapter setScale:](v5, "setScale:");
    [v4 size];
    -[INUISearchFoundationImageAdapter setSize:](v5, "setSize:");
    v11 = [v4 contentType];
    char v12 = (void *)[v11 copy];
    [(INUISearchFoundationImageAdapter *)v5 setContentType:v12];

    v13 = [v4 keyColor];
    v14 = (void *)[v13 copy];
    [(INUISearchFoundationImageAdapter *)v5 setKeyColor:v14];

    v15 = [v4 identifier];
    v16 = (void *)[v15 copy];
    [(INUISearchFoundationImageAdapter *)v5 setIdentifier:v16];

    -[INUISearchFoundationImageAdapter setSource:](v5, "setSource:", [v4 source]);
  }

  return v5;
}

@end