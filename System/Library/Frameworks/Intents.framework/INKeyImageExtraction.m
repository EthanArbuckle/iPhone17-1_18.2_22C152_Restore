@interface INKeyImageExtraction
+ (BOOL)supportsSecureCoding;
- (BOOL)canStoreImage:(id)a3;
- (INImage)keyImage;
- (INKeyImageExtraction)init;
- (INKeyImageExtraction)initWithCoder:(id)a3;
- (NSDictionary)keyImagesByType;
- (NSString)proxyIdentifier;
- (NSString)serviceIdentifier;
- (id)retrieveImageSynchronouslyForIdentifier:(id)a3 error:(id *)a4;
- (id)storeImage:(id)a3 scaled:(BOOL)a4 qualityOfService:(unsigned int)a5 storeType:(unint64_t)a6 error:(id *)a7;
- (id)storeImageSynchronously:(id)a3 error:(id *)a4;
- (int64_t)_imageTypeToStore;
- (unint64_t)servicePriority;
- (void)_setImageTypeToStore:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)purgeImageWithIdentifier:(id)a3 completion:(id)a4;
- (void)retrieveImageWithIdentifier:(id)a3 completion:(id)a4;
- (void)setKeyImage:(id)a3;
- (void)setKeyImagesByType:(id)a3;
- (void)setProxyIdentifier:(id)a3;
@end

@implementation INKeyImageExtraction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyIdentifier, 0);

  objc_storeStrong((id *)&self->_keyImagesByType, 0);
}

- (void)setKeyImagesByType:(id)a3
{
}

- (void)setProxyIdentifier:(id)a3
{
}

- (NSString)proxyIdentifier
{
  return self->_proxyIdentifier;
}

- (void)_setImageTypeToStore:(int64_t)a3
{
  self->_imageTypeToStore = a3;
}

- (int64_t)_imageTypeToStore
{
  return self->_imageTypeToStore;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(INKeyImageExtraction *)self proxyIdentifier];
  [v4 encodeObject:v5 forKey:@"proxyIdentifier"];

  id v6 = [(INKeyImageExtraction *)self keyImagesByType];
  [v4 encodeObject:v6 forKey:@"keyImagesByType"];
}

- (INKeyImageExtraction)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(INKeyImageExtraction *)self init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyIdentifier"];
    [(INKeyImageExtraction *)v5 setProxyIdentifier:v6];

    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v10 = +[INImage _classesInCluster];
    v11 = [v9 setByAddingObjectsFromArray:v10];
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"keyImage"];
    [(INKeyImageExtraction *)v5 setKeyImagesByType:v12];

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    v14 = +[INImage _classesInCluster];
    v15 = [v13 setWithArray:v14];
    v16 = [v4 decodeObjectOfClasses:v15 forKey:@"keyImage"];

    if (v16) {
      [(INKeyImageExtraction *)v5 setKeyImage:v16];
    }
  }
  return v5;
}

- (unint64_t)servicePriority
{
  return 25;
}

- (NSString)serviceIdentifier
{
  v2 = NSString;
  v3 = [(INKeyImageExtraction *)self proxyIdentifier];
  id v4 = [v2 stringWithFormat:@"com.apple.INKeyImageExtraction-%@", v3];

  return (NSString *)v4;
}

- (id)retrieveImageSynchronouslyForIdentifier:(id)a3 error:(id *)a4
{
  v5 = objc_msgSend(a3, "componentsSeparatedByString:", @"|", a4);
  id v6 = [v5 firstObject];
  v7 = [(INKeyImageExtraction *)self proxyIdentifier];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    if ([v5 count] == 2)
    {
      v9 = [v5 objectAtIndex:1];
      uint64_t v10 = [v9 integerValue];

      keyImagesByType = self->_keyImagesByType;
      v12 = [NSNumber numberWithInteger:v10];
      v13 = [(NSMutableDictionary *)keyImagesByType objectForKey:v12];
    }
    else
    {
      v13 = [(INKeyImageExtraction *)self keyImage];
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)storeImageSynchronously:(id)a3 error:(id *)a4
{
  keyImagesByType = self->_keyImagesByType;
  id v6 = NSNumber;
  id v7 = a3;
  int v8 = objc_msgSend(v6, "numberWithInteger:", -[INKeyImageExtraction _imageTypeToStore](self, "_imageTypeToStore"));
  [(NSMutableDictionary *)keyImagesByType setObject:v7 forKeyedSubscript:v8];

  v9 = NSString;
  uint64_t v10 = [(INKeyImageExtraction *)self proxyIdentifier];
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[INKeyImageExtraction _imageTypeToStore](self, "_imageTypeToStore"));
  v12 = [v9 stringWithFormat:@"%@|%@", v10, v11];

  return v12;
}

- (void)purgeImageWithIdentifier:(id)a3 completion:(id)a4
{
  v15 = (void (**)(id, void *))a4;
  id v6 = [a3 componentsSeparatedByString:@"|"];
  id v7 = [v6 firstObject];
  int v8 = [(INKeyImageExtraction *)self proxyIdentifier];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    if ([v6 count] == 2)
    {
      uint64_t v10 = [v6 objectAtIndex:1];
      uint64_t v11 = [v10 integerValue];

      keyImagesByType = self->_keyImagesByType;
      v13 = [NSNumber numberWithInteger:v11];
      [(NSMutableDictionary *)keyImagesByType removeObjectForKey:v13];
    }
    else
    {
      [(INKeyImageExtraction *)self setKeyImage:0];
    }
    v14 = 0;
  }
  else
  {
    v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IntentsErrorDomain" code:6000 userInfo:0];
  }
  if (v15) {
    v15[2](v15, v14);
  }
}

- (void)retrieveImageWithIdentifier:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v9 = 0;
    id v6 = (void (**)(id, void *, id))a4;
    id v7 = [(INKeyImageExtraction *)self retrieveImageSynchronouslyForIdentifier:a3 error:&v9];
    id v8 = v9;
    v6[2](v6, v7, v8);
  }
}

- (id)storeImage:(id)a3 scaled:(BOOL)a4 qualityOfService:(unsigned int)a5 storeType:(unint64_t)a6 error:(id *)a7
{
  return -[INKeyImageExtraction storeImageSynchronously:error:](self, "storeImageSynchronously:error:", a3, a7, *(void *)&a5, a6);
}

- (BOOL)canStoreImage:(id)a3
{
  return a3 != 0;
}

- (NSDictionary)keyImagesByType
{
  v2 = (void *)[(NSMutableDictionary *)self->_keyImagesByType copy];

  return (NSDictionary *)v2;
}

- (INImage)keyImage
{
  return (INImage *)[(NSMutableDictionary *)self->_keyImagesByType objectForKey:&unk_1EDBA7198];
}

- (void)setKeyImage:(id)a3
{
}

- (INKeyImageExtraction)init
{
  v8.receiver = self;
  v8.super_class = (Class)INKeyImageExtraction;
  v2 = [(INKeyImageExtraction *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    id v4 = [v3 UUIDString];
    [(INKeyImageExtraction *)v2 setProxyIdentifier:v4];

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    keyImagesByType = v2->_keyImagesByType;
    v2->_keyImagesByType = (NSMutableDictionary *)v5;

    v2->_imageTypeToStore = 0;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end