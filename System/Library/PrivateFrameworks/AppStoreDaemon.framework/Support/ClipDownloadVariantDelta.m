@interface ClipDownloadVariantDelta
- (BOOL)deltaUpdate;
- (NSString)assetToken;
- (NSString)description;
- (NSString)md5;
- (NSURL)assetURL;
@end

@implementation ClipDownloadVariantDelta

- (BOOL)deltaUpdate
{
  return 1;
}

- (NSString)description
{
  v10[0] = @"assetToken";
  v10[1] = @"assetURL";
  assetURL = self->_assetURL;
  CFStringRef assetToken = (const __CFString *)self->_assetToken;
  if (!assetToken) {
    CFStringRef assetToken = @"<null>";
  }
  if (!assetURL) {
    assetURL = (NSURL *)@"<null>";
  }
  v11[0] = assetToken;
  v11[1] = assetURL;
  v10[2] = @"md5";
  v10[3] = @"fromAssetToken";
  CFStringRef md5 = (const __CFString *)self->_md5;
  CFStringRef fromAssetToken = (const __CFString *)self->_fromAssetToken;
  if (!md5) {
    CFStringRef md5 = @"<null>";
  }
  if (!fromAssetToken) {
    CFStringRef fromAssetToken = @"<null>";
  }
  v11[2] = md5;
  v11[3] = fromAssetToken;
  v10[4] = @"previousExternalVersionId";
  previousExternalVersionID = self->_previousExternalVersionID;
  if (!previousExternalVersionID) {
    previousExternalVersionID = (NSNumber *)@"<null>";
  }
  v11[4] = previousExternalVersionID;
  v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];
  v8 = [v7 description];

  return (NSString *)v8;
}

- (NSURL)assetURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)assetToken
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)md5
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousExternalVersionID, 0);
  objc_storeStrong((id *)&self->_fromAssetToken, 0);
  objc_storeStrong((id *)&self->_md5, 0);
  objc_storeStrong((id *)&self->_assetToken, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
}

@end