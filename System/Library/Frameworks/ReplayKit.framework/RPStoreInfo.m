@interface RPStoreInfo
- (NSString)appName;
- (NSString)author;
- (NSString)bundleID;
- (NSURL)appArtworkURL;
- (NSURL)itemURL;
- (id)dictionary;
- (void)setAppArtworkURL:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setItemURL:(id)a3;
@end

@implementation RPStoreInfo

- (id)dictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKeyedSubscript:@"RPStoreInfoBundleIDKey"];
  }
  appName = self->_appName;
  if (appName) {
    [v4 setObject:appName forKeyedSubscript:@"RPStoreInfoAppNameKey"];
  }
  author = self->_author;
  if (author) {
    [v4 setObject:author forKeyedSubscript:@"RPStoreInfoAuthorKey"];
  }
  itemURL = self->_itemURL;
  if (itemURL) {
    [v4 setObject:itemURL forKeyedSubscript:@"RPStoreInfoItemURLKey"];
  }

  return v4;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
}

- (NSURL)appArtworkURL
{
  return self->_appArtworkURL;
}

- (void)setAppArtworkURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appArtworkURL, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_appName, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end