@interface INDefaultCardTemplate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INDefaultCardTemplate)initWithCoder:(id)a3;
- (INDefaultCardTemplate)initWithTitle:(NSString *)title;
- (INImage)image;
- (NSString)subtitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4;
- (unint64_t)hash;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setImage:(INImage *)image;
- (void)setSubtitle:(NSString *)subtitle;
- (void)setTitle:(NSString *)title;
@end

@implementation INDefaultCardTemplate

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = (void *)[(INDefaultCardTemplate *)self copy];
    id v9 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    v10 = INImageProxyInjectionQueue();
    [v9 setUnderlyingQueue:v10];

    [v9 setMaxConcurrentOperationCount:1];
    [v9 setSuspended:1];
    v11 = (void *)MEMORY[0x1E4F28B48];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __83__INDefaultCardTemplate_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
    v16[3] = &unk_1E551F740;
    v16[4] = v8;
    id v17 = v7;
    v12 = [v11 blockOperationWithBlock:v16];
    v13 = [(INDefaultCardTemplate *)self image];
    if (v13)
    {
      v14 = objc_alloc_init(INImageProxyInjectionOperation);
      [(INImageProxyInjectionOperation *)v14 setInjector:v13];
      [(INImageProxyInjectionOperation *)v14 setImageProxyRequestBlock:v6];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __83__INDefaultCardTemplate_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2;
      v15[3] = &unk_1E551E178;
      v15[4] = v8;
      [(INImageProxyInjectionOperation *)v14 setCopyReturnBlock:v15];
      [v12 addDependency:v14];
      [v9 addOperation:v14];
    }
    [v9 addOperation:v12];
    [v9 setSuspended:0];
  }
}

uint64_t __83__INDefaultCardTemplate_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __83__INDefaultCardTemplate_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) setImage:a2];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setImage:(INImage *)image
{
}

- (INImage)image
{
  return self->_image;
}

- (void)setSubtitle:(NSString *)subtitle
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(NSString *)title
{
}

- (NSString)title
{
  return self->_title;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v5 encodeObject:self->_image forKey:@"image"];
}

- (INDefaultCardTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)INDefaultCardTemplate;
  id v5 = [(INDefaultCardTemplate *)&v20 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    image = v5->_image;
    v5->_image = (INImage *)v16;

    v18 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INDefaultCardTemplate *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      title = self->_title;
      uint64_t v7 = [(INDefaultCardTemplate *)v5 title];
      if (title == (NSString *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        uint64_t v9 = self->_title;
        v10 = [(INDefaultCardTemplate *)v5 title];
        LODWORD(v9) = [(NSString *)v9 isEqualToString:v10];

        if (!v9) {
          goto LABEL_11;
        }
      }
      subtitle = self->_subtitle;
      uint64_t v13 = [(INDefaultCardTemplate *)v5 subtitle];
      if (subtitle == (NSString *)v13)
      {
      }
      else
      {
        uint64_t v14 = (void *)v13;
        v15 = self->_subtitle;
        uint64_t v16 = [(INDefaultCardTemplate *)v5 subtitle];
        LODWORD(v15) = [(NSString *)v15 isEqualToString:v16];

        if (!v15)
        {
LABEL_11:
          char v11 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      image = self->_image;
      uint64_t v18 = [(INDefaultCardTemplate *)v5 image];
      if (image == (INImage *)v18)
      {
        char v11 = 1;
      }
      else
      {
        v19 = (INImage *)v18;
        objc_super v20 = self->_image;
        v21 = [(INDefaultCardTemplate *)v5 image];
        char v11 = [(INImage *)v20 isEqual:v21];

        image = v19;
      }

      goto LABEL_17;
    }
    char v11 = 0;
  }
LABEL_18:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_subtitle hash] ^ v3;
  return v4 ^ [(INImage *)self->_image hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(INDefaultCardTemplate *)self title];
  id v6 = (void *)[v4 initWithTitle:v5];

  uint64_t v7 = [(INDefaultCardTemplate *)self subtitle];
  [v6 setSubtitle:v7];

  v8 = [(INDefaultCardTemplate *)self image];
  [v6 setImage:v8];

  return v6;
}

- (INDefaultCardTemplate)initWithTitle:(NSString *)title
{
  NSUInteger v4 = title;
  v10.receiver = self;
  v10.super_class = (Class)INDefaultCardTemplate;
  id v5 = [(INDefaultCardTemplate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [(NSString *)v4 copy];
    uint64_t v7 = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  return INKeyImageUtilitiesDefaultCompareSubProducers(a3, a4);
}

@end