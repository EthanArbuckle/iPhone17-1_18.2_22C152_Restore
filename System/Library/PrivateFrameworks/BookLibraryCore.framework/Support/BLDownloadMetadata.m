@interface BLDownloadMetadata
+ (void)bl_setDownloadPolicyCellularResult:(id)a3 toDictionary:(id)a4;
- (BOOL)bl_isPurchaseRedownload;
- (NSNumber)bl_assetFileSize;
- (NSNumber)bl_downloadPolicyCellularResult;
- (NSNumber)bl_downloaderAccountIdentifier;
- (NSNumber)bl_purchaserAccountIdentifier;
- (id)_bl_copySinfValueWithField:(int64_t)a3;
- (void)bl_setDownloadPolicyCellularResult:(id)a3;
@end

@implementation BLDownloadMetadata

- (NSNumber)bl_purchaserAccountIdentifier
{
  return (NSNumber *)[(BLDownloadMetadata *)self _bl_copySinfValueWithField:2];
}

- (NSNumber)bl_downloaderAccountIdentifier
{
  return (NSNumber *)[(BLDownloadMetadata *)self _bl_copySinfValueWithField:3];
}

- (id)_bl_copySinfValueWithField:(int64_t)a3
{
  v4 = [(BLDownloadMetadata *)self sinfs];
  if ([v4 count])
  {
    v5 = [[BLDownloadDRM alloc] initWithSinfArray:v4];
    v6 = [(BLDownloadDRM *)v5 sinfsArray];
    v7 = v6;
    if (v6) {
      id v8 = [v6 copyValueForField:a3 error:0];
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSNumber)bl_downloadPolicyCellularResult
{
  return (NSNumber *)[(BLDownloadMetadata *)self valueForMetadataKey:@"BLDownloadMetadataDownloadPolicyCellularResultKey"];
}

- (void)bl_setDownloadPolicyCellularResult:(id)a3
{
}

- (NSNumber)bl_assetFileSize
{
  v3 = [(BLDownloadMetadata *)self valueForFirstAvailableKey:@"file-size", 0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [(BLDownloadMetadata *)self valueForMetadataKey:@"asset-info"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v4 objectForKeyedSubscript:@"file-size"];

      v3 = (void *)v5;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v3;
  }
  else {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (BOOL)bl_isPurchaseRedownload
{
  v2 = [(BLDownloadMetadata *)self valueForFirstAvailableKey:@"is-purchased-redownload", 0];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v3 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

+ (void)bl_setDownloadPolicyCellularResult:(id)a3 toDictionary:(id)a4
{
}

@end