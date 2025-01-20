@interface INImageNoteContent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INImage)image;
- (INImageNoteContent)initWithCoder:(id)a3;
- (id)_dictionaryRepresentation;
- (id)_initWithImage:(id)a3;
- (id)_intents_cacheableObjects;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (unint64_t)hash;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)_setImage:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INImageNoteContent

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, void *, void *))a3;
  id v7 = a4;
  if (v7)
  {
    v8 = (void *)[(INImageNoteContent *)self copy];
    v9 = [(INImageNoteContent *)self image];
    if (v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __80__INImageNoteContent_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
      v10[3] = &unk_1E551E2D0;
      v10[4] = v8;
      id v11 = v7;
      v6[2](v6, v9, v10);
    }
    else
    {
      (*((void (**)(id, void *))v7 + 2))(v7, v8);
    }
  }
}

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  return INLocalizedStringWithLocalizer(@"an image", @"an image", a3);
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(INImageNoteContent *)self image];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(INImageNoteContent *)self image];
    id v7 = [v6 _identifier];
    v8 = [v13 cacheableObjectForIdentifier:v7];

    if (v8)
    {
      v9 = [(INImageNoteContent *)self image];
      v10 = [v9 _identifier];
      id v11 = [v13 cacheableObjectForIdentifier:v10];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [(INImageNoteContent *)self image];
        [v11 _imageSize];
        objc_msgSend(v12, "_setImageSize:");
      }
    }
  }
}

- (id)_intents_cacheableObjects
{
  v2 = [(INImageNoteContent *)self image];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
}

- (void)_setImage:(id)a3
{
}

- (INImage)image
{
  return self->_image;
}

- (id)_dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"image";
  image = self->_image;
  v3 = image;
  if (!image)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v7[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (!image) {

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (INImageNoteContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];

  v6 = (INImageNoteContent *)[objc_alloc((Class)objc_opt_class()) initWithImage:v5];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    image = self->_image;
    BOOL v7 = image == (INImage *)v5[1] || -[INImage isEqual:](image, "isEqual:");
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(INImage *)self->_image hash];
}

- (id)_initWithImage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INImageNoteContent;
  v6 = [(INImageNoteContent *)&v9 init];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_image, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __80__INImageNoteContent_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _setImage:a2];
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

@end