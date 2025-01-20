@interface TDTextureAssetInfo
- (BOOL)flipped;
- (NSURL)fileURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)textureFace;
- (unint64_t)mipLevel;
- (void)dealloc;
- (void)setFileURL:(id)a3;
- (void)setFlipped:(BOOL)a3;
- (void)setMipLevel:(unint64_t)a3;
- (void)setTextureFace:(int64_t)a3;
@end

@implementation TDTextureAssetInfo

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[TDTextureAssetInfo allocWithZone:a3] init];
  [(TDTextureAssetInfo *)v4 setFileURL:[(TDTextureAssetInfo *)self fileURL]];
  [(TDTextureAssetInfo *)v4 setMipLevel:[(TDTextureAssetInfo *)self mipLevel]];
  [(TDTextureAssetInfo *)v4 setTextureFace:[(TDTextureAssetInfo *)self textureFace]];
  [(TDTextureAssetInfo *)v4 setFlipped:[(TDTextureAssetInfo *)self flipped]];
  return v4;
}

- (void)dealloc
{
  [(TDTextureAssetInfo *)self setFileURL:0];
  v3.receiver = self;
  v3.super_class = (Class)TDTextureAssetInfo;
  [(TDTextureAssetInfo *)&v3 dealloc];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)TDTextureAssetInfo;
  id v3 = [(TDTextureAssetInfo *)&v6 description];
  uint64_t v4 = [NSString stringWithFormat:@"fileURL:%@ mipLevel: %d textureFace: %d flipped: %d ", -[TDTextureAssetInfo fileURL](self, "fileURL"), -[TDTextureAssetInfo mipLevel](self, "mipLevel"), -[TDTextureAssetInfo textureFace](self, "textureFace"), -[TDTextureAssetInfo flipped](self, "flipped")];
  return (id)[NSString stringWithFormat:@"%@  %@", v3, v4];
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (unint64_t)mipLevel
{
  return self->_mipLevel;
}

- (void)setMipLevel:(unint64_t)a3
{
  self->_mipLevel = a3;
}

- (int64_t)textureFace
{
  return self->_textureFace;
}

- (void)setTextureFace:(int64_t)a3
{
  self->_textureFace = a3;
}

- (BOOL)flipped
{
  return self->_flipped;
}

- (void)setFlipped:(BOOL)a3
{
  self->_flipped = a3;
}

@end