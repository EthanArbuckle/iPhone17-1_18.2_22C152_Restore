@interface ClipDownloadVariant
- (BOOL)deltaUpdate;
- (NSString)assetToken;
- (NSString)description;
- (NSString)md5;
- (NSURL)assetURL;
@end

@implementation ClipDownloadVariant

- (BOOL)deltaUpdate
{
  return 0;
}

- (NSString)description
{
  v11[0] = @"assetToken";
  v11[1] = @"assetURL";
  assetURL = self->_assetURL;
  CFStringRef assetToken = (const __CFString *)self->_assetToken;
  if (!assetToken) {
    CFStringRef assetToken = @"<null>";
  }
  if (!assetURL) {
    assetURL = (NSURL *)@"<null>";
  }
  v12[0] = assetToken;
  v12[1] = assetURL;
  v11[2] = @"md5";
  v11[3] = @"variantDescriptors";
  CFStringRef md5 = (const __CFString *)self->_md5;
  variantDeltas = self->_variantDeltas;
  if (!md5) {
    CFStringRef md5 = @"<null>";
  }
  variantDescriptors = self->_variantDescriptors;
  if (!variantDescriptors) {
    variantDescriptors = (NSArray *)@"<null>";
  }
  v12[2] = md5;
  v12[3] = variantDescriptors;
  v11[4] = @"variantDeltas";
  if (variantDeltas) {
    CFStringRef v7 = (const __CFString *)variantDeltas;
  }
  else {
    CFStringRef v7 = @"<null>";
  }
  v12[4] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5];
  v9 = [v8 description];

  return (NSString *)v9;
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
  objc_storeStrong((id *)&self->_variantDescriptors, 0);
  objc_storeStrong((id *)&self->_variantDeltas, 0);
  objc_storeStrong((id *)&self->_md5, 0);
  objc_storeStrong((id *)&self->_assetToken, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
}

@end