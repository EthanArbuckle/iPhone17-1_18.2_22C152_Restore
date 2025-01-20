@interface TDAssetPack
- (BOOL)isEqual:(id)a3;
- (BOOL)wasModified;
- (CUIMutableCommonAssetStorage)assetStore;
- (NSSet)tags;
- (NSString)assetPackIdentifier;
- (NSString)outputPath;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)setAssetPackIdentifier:(id)a3;
- (void)setAssetStore:(id)a3;
- (void)setOutputPath:(id)a3;
- (void)setTags:(id)a3;
- (void)setWasModified:(BOOL)a3;
@end

@implementation TDAssetPack

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setTags:", -[TDAssetPack tags](self, "tags"));
  objc_msgSend(v4, "setOutputPath:", -[TDAssetPack outputPath](self, "outputPath"));
  objc_msgSend(v4, "setAssetPackIdentifier:", -[TDAssetPack assetPackIdentifier](self, "assetPackIdentifier"));
  objc_msgSend(v4, "setWasModified:", -[TDAssetPack wasModified](self, "wasModified"));
  return v4;
}

- (void)dealloc
{
  [(TDAssetPack *)self setTags:0];
  [(TDAssetPack *)self setOutputPath:0];
  [(TDAssetPack *)self setAssetStore:0];
  [(TDAssetPack *)self setAssetPackIdentifier:0];
  v3.receiver = self;
  v3.super_class = (Class)TDAssetPack;
  [(TDAssetPack *)&v3 dealloc];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSSet *)[(TDAssetPack *)self tags] hash];
  return [(NSString *)[(TDAssetPack *)self assetPackIdentifier] hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !objc_msgSend((id)objc_msgSend(a3, "tags"), "isEqualToSet:", -[TDAssetPack tags](self, "tags")))
  {
    return 0;
  }
  v5 = (void *)[a3 assetPackIdentifier];
  v6 = [(TDAssetPack *)self assetPackIdentifier];

  return [v5 isEqualToString:v6];
}

- (NSSet)tags
{
  return self->tags;
}

- (void)setTags:(id)a3
{
}

- (NSString)outputPath
{
  return self->outputPath;
}

- (void)setOutputPath:(id)a3
{
}

- (CUIMutableCommonAssetStorage)assetStore
{
  return (CUIMutableCommonAssetStorage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAssetStore:(id)a3
{
}

- (BOOL)wasModified
{
  return self->wasModified;
}

- (void)setWasModified:(BOOL)a3
{
  self->wasModified = a3;
}

- (NSString)assetPackIdentifier
{
  return self->assetPackIdentifier;
}

- (void)setAssetPackIdentifier:(id)a3
{
}

@end