@interface PHPhotoLibraryOpenOptions
- (BOOL)allowsUpgrade;
- (NSURL)libraryURL;
- (id)debugDescription;
- (unint64_t)internalCreateOptions;
- (unint64_t)internalUpgradeOptions;
- (void)setAllowsUpgrade:(BOOL)a3;
- (void)setInternalCreateOptions:(unint64_t)a3;
- (void)setInternalUpgradeOptions:(unint64_t)a3;
- (void)setLibraryURL:(id)a3;
@end

@implementation PHPhotoLibraryOpenOptions

- (void).cxx_destruct
{
}

- (void)setInternalCreateOptions:(unint64_t)a3
{
  self->_internalCreateOptions = a3;
}

- (unint64_t)internalCreateOptions
{
  return self->_internalCreateOptions;
}

- (void)setInternalUpgradeOptions:(unint64_t)a3
{
  self->_internalUpgradeOptions = a3;
}

- (unint64_t)internalUpgradeOptions
{
  return self->_internalUpgradeOptions;
}

- (void)setLibraryURL:(id)a3
{
}

- (NSURL)libraryURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAllowsUpgrade:(BOOL)a3
{
  self->_allowsUpgrade = a3;
}

- (BOOL)allowsUpgrade
{
  return self->_allowsUpgrade;
}

- (id)debugDescription
{
  if ([(PHPhotoLibraryOpenOptions *)self internalUpgradeOptions])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"upgradeOpts[%d] ", -[PHPhotoLibraryOpenOptions internalUpgradeOptions](self, "internalUpgradeOptions"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1EEAC1950;
  }
  if ([(PHPhotoLibraryOpenOptions *)self internalCreateOptions])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"createOpts[%d] ", -[PHPhotoLibraryOpenOptions internalCreateOptions](self, "internalCreateOptions"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1EEAC1950;
  }
  v10.receiver = self;
  v10.super_class = (Class)PHPhotoLibraryOpenOptions;
  v5 = [(PHPhotoLibraryOpenOptions *)&v10 description];
  BOOL v6 = [(PHPhotoLibraryOpenOptions *)self allowsUpgrade];
  v7 = @"N";
  if (v6) {
    v7 = @"Y";
  }
  v8 = [v5 stringByAppendingFormat:@": upgrade:[%@] %@%@", v7, v4, v3];

  return v8;
}

@end