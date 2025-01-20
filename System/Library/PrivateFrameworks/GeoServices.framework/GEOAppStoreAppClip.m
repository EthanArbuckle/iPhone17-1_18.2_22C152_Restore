@interface GEOAppStoreAppClip
- (GEOAppStoreAppClip)initWithBundleID:(id)a3 title:(id)a4 subtitle:(id)a5 appShortName:(id)a6 appClipURL:(id)a7 artworkURL:(id)a8 providerName:(id)a9;
- (NSString)appShortName;
- (NSString)bundleID;
- (NSString)provider;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)appClipURL;
- (NSURL)artworkURL;
- (id)description;
- (void)setAppClipURL:(id)a3;
- (void)setArtworkURL:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation GEOAppStoreAppClip

- (GEOAppStoreAppClip)initWithBundleID:(id)a3 title:(id)a4 subtitle:(id)a5 appShortName:(id)a6 appClipURL:(id)a7 artworkURL:(id)a8 providerName:(id)a9
{
  id v15 = a3;
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  uint64_t v19 = [v15 length];
  v20 = 0;
  if (v16 && v19)
  {
    v32.receiver = self;
    v32.super_class = (Class)GEOAppStoreAppClip;
    v21 = [(GEOAppStoreAppClip *)&v32 init];
    if (v21)
    {
      uint64_t v22 = [v15 copy];
      bundleID = v21->_bundleID;
      v21->_bundleID = (NSString *)v22;

      uint64_t v24 = [v31 copy];
      title = v21->_title;
      v21->_title = (NSString *)v24;

      uint64_t v26 = [v30 copy];
      subtitle = v21->_subtitle;
      v21->_subtitle = (NSString *)v26;

      objc_storeStrong((id *)&v21->_appClipURL, a7);
      objc_storeStrong((id *)&v21->_artworkURL, a8);
      objc_storeStrong((id *)&v21->_provider, a9);
      objc_storeStrong((id *)&v21->_appShortName, a6);
    }
    self = v21;
    v20 = self;
  }

  return v20;
}

- (id)description
{
  v3 = NSString;
  v4 = [(GEOAppStoreAppClip *)self title];
  v5 = [(GEOAppStoreAppClip *)self subtitle];
  v6 = [(GEOAppStoreAppClip *)self appClipURL];
  v7 = [v3 stringWithFormat:@"app clip with title=\"%@\", subtitle=\"%@\", url=\"%@\"", v4, v5, v6];

  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSURL)appClipURL
{
  return self->_appClipURL;
}

- (void)setAppClipURL:(id)a3
{
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
}

- (NSString)provider
{
  return self->_provider;
}

- (NSString)appShortName
{
  return self->_appShortName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appShortName, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_appClipURL, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end