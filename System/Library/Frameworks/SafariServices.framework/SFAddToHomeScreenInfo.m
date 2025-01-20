@interface SFAddToHomeScreenInfo
- (BEWebAppManifest)manifest;
- (NSArray)websiteCookies;
- (SFAddToHomeScreenInfo)initWithManifest:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setWebsiteCookies:(id)a3;
@end

@implementation SFAddToHomeScreenInfo

- (SFAddToHomeScreenInfo)initWithManifest:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFAddToHomeScreenInfo;
  v6 = [(SFAddToHomeScreenInfo *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_manifest, a3);
    websiteCookies = v7->_websiteCookies;
    v7->_websiteCookies = (NSArray *)MEMORY[0x1E4F1CBF0];

    v9 = v7;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithManifest:", self->_manifest);
  uint64_t v5 = [(NSArray *)self->_websiteCookies copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (BEWebAppManifest)manifest
{
  return self->_manifest;
}

- (NSArray)websiteCookies
{
  return self->_websiteCookies;
}

- (void)setWebsiteCookies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_websiteCookies, 0);

  objc_storeStrong((id *)&self->_manifest, 0);
}

@end