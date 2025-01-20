@interface MPStoreRadioStreamAssetInfo
- (BOOL)isITunesStoreStream;
- (BOOL)isiTunesStoreStream;
- (MPStoreRadioStreamAssetInfo)initWithiTunesCloudStoreRadioStreamAssetInfo:(id)a3;
- (NSURL)keyCertificateURL;
- (NSURL)keyServerURL;
- (NSURL)streamURL;
- (int64_t)MPStoreRadioStreamFlavorFromICStoreRadioStreamFlavor:(int64_t)a3;
- (int64_t)MPStoreRadioStreamProtocolFromICStoreRadioStreamProtocol:(int64_t)a3;
- (int64_t)flavor;
- (int64_t)streamProtocol;
- (void)setITunesStoreStream:(BOOL)a3;
@end

@implementation MPStoreRadioStreamAssetInfo

- (void).cxx_destruct
{
}

- (void)setITunesStoreStream:(BOOL)a3
{
  self->_iTunesStoreStream = a3;
}

- (BOOL)isiTunesStoreStream
{
  return self->_iTunesStoreStream;
}

- (int64_t)MPStoreRadioStreamProtocolFromICStoreRadioStreamProtocol:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3 == 2) {
    int64_t v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

- (int64_t)MPStoreRadioStreamFlavorFromICStoreRadioStreamFlavor:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3 != 1) {
    int64_t v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

- (BOOL)isITunesStoreStream
{
  return [(ICStoreRadioStreamAssetInfo *)self->_internalInfo isiTunesStoreStream];
}

- (NSURL)keyServerURL
{
  return (NSURL *)[(ICStoreRadioStreamAssetInfo *)self->_internalInfo keyServerURL];
}

- (NSURL)keyCertificateURL
{
  return (NSURL *)[(ICStoreRadioStreamAssetInfo *)self->_internalInfo keyCertificateURL];
}

- (NSURL)streamURL
{
  return (NSURL *)[(ICStoreRadioStreamAssetInfo *)self->_internalInfo streamURL];
}

- (int64_t)streamProtocol
{
  uint64_t v3 = [(ICStoreRadioStreamAssetInfo *)self->_internalInfo streamProtocol];

  return [(MPStoreRadioStreamAssetInfo *)self MPStoreRadioStreamProtocolFromICStoreRadioStreamProtocol:v3];
}

- (int64_t)flavor
{
  uint64_t v3 = [(ICStoreRadioStreamAssetInfo *)self->_internalInfo flavor];

  return [(MPStoreRadioStreamAssetInfo *)self MPStoreRadioStreamFlavorFromICStoreRadioStreamFlavor:v3];
}

- (MPStoreRadioStreamAssetInfo)initWithiTunesCloudStoreRadioStreamAssetInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPStoreRadioStreamAssetInfo;
  v6 = [(MPStoreRadioStreamAssetInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_internalInfo, a3);
  }

  return v7;
}

@end