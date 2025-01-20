@interface PHMediaFormatConversionAssetBundleSource
+ (Class)requestClass;
+ (id)sourceForFileURL:(id)a3;
- (id)fileType;
@end

@implementation PHMediaFormatConversionAssetBundleSource

- (id)fileType
{
  return @"com.apple.photos.asset-bundle";
}

+ (Class)requestClass
{
  return (Class)objc_opt_class();
}

+ (id)sourceForFileURL:(id)a3
{
  id v5 = a3;
  if (![v5 isFileURL]
    || ([v5 pathExtension],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 lowercaseString],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqualToString:@"photosasset"],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"PHMediaFormatConversion.m", 532, @"Invalid parameter not satisfying: %@", @"[fileURL isFileURL] && [[[fileURL pathExtension] lowercaseString] isEqualToString:ASSET_BUNDLE_PATH_EXTENSION]" object file lineNumber description];
  }
  v10 = objc_msgSend(a1, "sourceForFileURL:mediaType:imageDimensions:", v5, 4, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

  return v10;
}

@end