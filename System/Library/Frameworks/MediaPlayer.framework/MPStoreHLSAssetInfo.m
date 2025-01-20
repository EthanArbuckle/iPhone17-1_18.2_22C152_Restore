@interface MPStoreHLSAssetInfo
- (BOOL)isiTunesStoreStream;
- (MPStoreHLSAssetInfo)initWithiTunesCloudStoreHLSAssetInfo:(id)a3;
- (NSNumber)keyServerAdamID;
- (NSString)keyServerProtocolType;
- (NSURL)alternateKeyCertificateURL;
- (NSURL)alternateKeyServerURL;
- (NSURL)alternatePlaylistURL;
- (NSURL)keyCertificateURL;
- (NSURL)keyServerURL;
- (NSURL)playlistURL;
@end

@implementation MPStoreHLSAssetInfo

- (void).cxx_destruct
{
}

- (BOOL)isiTunesStoreStream
{
  return [(ICStoreHLSAssetInfo *)self->_internalInfo isiTunesStoreStream];
}

- (NSURL)alternateKeyServerURL
{
  return (NSURL *)[(ICStoreHLSAssetInfo *)self->_internalInfo alternateKeyServerURL];
}

- (NSURL)alternateKeyCertificateURL
{
  return (NSURL *)[(ICStoreHLSAssetInfo *)self->_internalInfo alternateKeyCertificateURL];
}

- (NSURL)alternatePlaylistURL
{
  return (NSURL *)[(ICStoreHLSAssetInfo *)self->_internalInfo alternatePlaylistURL];
}

- (NSNumber)keyServerAdamID
{
  return (NSNumber *)[(ICStoreHLSAssetInfo *)self->_internalInfo keyServerAdamID];
}

- (NSString)keyServerProtocolType
{
  return (NSString *)[(ICStoreHLSAssetInfo *)self->_internalInfo keyServerProtocolType];
}

- (NSURL)keyServerURL
{
  return (NSURL *)[(ICStoreHLSAssetInfo *)self->_internalInfo keyServerURL];
}

- (NSURL)keyCertificateURL
{
  return (NSURL *)[(ICStoreHLSAssetInfo *)self->_internalInfo keyCertificateURL];
}

- (NSURL)playlistURL
{
  return (NSURL *)[(ICStoreHLSAssetInfo *)self->_internalInfo playlistURL];
}

- (MPStoreHLSAssetInfo)initWithiTunesCloudStoreHLSAssetInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPStoreHLSAssetInfo;
  v6 = [(MPStoreHLSAssetInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_internalInfo, a3);
  }

  return v7;
}

@end