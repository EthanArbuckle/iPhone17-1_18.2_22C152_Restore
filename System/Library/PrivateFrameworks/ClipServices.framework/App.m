@interface App
- (App)initWithBundleID:(id)a3;
- (NSNumber)itemID;
- (NSString)bundleID;
- (NSURL)downloadedURL;
- (NSURL)ipaLink;
- (void)setBundleID:(id)a3;
- (void)setDownloadedURL:(id)a3;
- (void)setIpaLink:(id)a3;
- (void)setItemID:(id)a3;
@end

@implementation App

- (App)initWithBundleID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)App;
  v5 = [(App *)&v10 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    bundleID = v5->_bundleID;
    v5->_bundleID = v6;

    v8 = v5;
  }

  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (NSURL)ipaLink
{
  return self->_ipaLink;
}

- (void)setIpaLink:(id)a3
{
}

- (NSURL)downloadedURL
{
  return self->_downloadedURL;
}

- (void)setDownloadedURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadedURL, 0);
  objc_storeStrong((id *)&self->_ipaLink, 0);
  objc_storeStrong((id *)&self->_itemID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end