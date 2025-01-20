@interface ClipDownloadData
- (id)description;
@end

@implementation ClipDownloadData

- (id)description
{
  CFStringRef appID = (const __CFString *)self->_appID;
  appName = self->_appName;
  if (!appID) {
    CFStringRef appID = @"<null>";
  }
  v16[0] = @"appID";
  v16[1] = @"appName";
  if (appName) {
    CFStringRef v4 = (const __CFString *)appName;
  }
  else {
    CFStringRef v4 = @"<null>";
  }
  v17[0] = appID;
  v17[1] = v4;
  CFStringRef artistName = (const __CFString *)self->_artistName;
  bundleID = self->_bundleID;
  if (!artistName) {
    CFStringRef artistName = @"<null>";
  }
  v16[2] = @"artistName";
  v16[3] = @"bundleID";
  if (bundleID) {
    CFStringRef v7 = (const __CFString *)bundleID;
  }
  else {
    CFStringRef v7 = @"<null>";
  }
  v17[2] = artistName;
  v17[3] = v7;
  v16[4] = @"externalVersionID";
  v16[5] = @"parentBundleID";
  externalVersionID = self->_externalVersionID;
  CFStringRef parentBundleID = (const __CFString *)self->_parentBundleID;
  if (!externalVersionID) {
    externalVersionID = (NSNumber *)@"<null>";
  }
  if (!parentBundleID) {
    CFStringRef parentBundleID = @"<null>";
  }
  v17[4] = externalVersionID;
  v17[5] = parentBundleID;
  v16[6] = @"ratingLabel";
  v16[7] = @"ratingRank";
  CFStringRef ratingLabel = (const __CFString *)self->_ratingLabel;
  ratingRank = self->_ratingRank;
  if (!ratingLabel) {
    CFStringRef ratingLabel = @"<null>";
  }
  if (!ratingRank) {
    ratingRank = (NSNumber *)@"<null>";
  }
  v17[6] = ratingLabel;
  v17[7] = ratingRank;
  v16[8] = @"variant";
  variant = self->_variant;
  if (!variant) {
    variant = (ClipDownloadVariant *)@"<null>";
  }
  v17[8] = variant;
  v13 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:9];
  v14 = [v13 description];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantDescriptor, 0);
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_ratingRank, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
  objc_storeStrong((id *)&self->_parentBundleID, 0);
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appID, 0);
}

@end