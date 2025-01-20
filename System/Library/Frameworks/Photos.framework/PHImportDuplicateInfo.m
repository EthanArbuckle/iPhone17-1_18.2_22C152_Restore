@interface PHImportDuplicateInfo
- (BOOL)hasVideoComplement;
- (BOOL)isInTrash;
- (BOOL)isLegacy;
- (NSDate)alternateImportImageDate;
- (NSDate)imageDate;
- (NSMutableDictionary)info;
- (NSNumber)fileSize;
- (NSString)avchdFingerprint;
- (NSString)fileName;
- (NSString)fingerprint;
- (NSString)uuid;
- (PHImportDuplicateInfo)initWithAssetInfo:(id)a3;
- (double)timezoneOffset;
- (id)description;
- (id)objectID;
- (id)originatingAssetIdentifier;
- (void)setAlternateImportImageDate:(id)a3;
- (void)setInfo:(id)a3;
@end

@implementation PHImportDuplicateInfo

- (void).cxx_destruct
{
}

- (void)setInfo:(id)a3
{
}

- (NSMutableDictionary)info
{
  return self->_info;
}

- (double)timezoneOffset
{
  v2 = [(NSMutableDictionary *)self->_info objectForKeyedSubscript:@"timeZoneOffset"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (id)originatingAssetIdentifier
{
  return (id)[(NSMutableDictionary *)self->_info objectForKeyedSubscript:@"originatingAssetIdentifier"];
}

- (NSString)avchdFingerprint
{
  return (NSString *)[(NSMutableDictionary *)self->_info objectForKeyedSubscript:@"avchdFingerprint"];
}

- (NSString)fingerprint
{
  return (NSString *)[(NSMutableDictionary *)self->_info objectForKeyedSubscript:@"originalStableHash"];
}

- (BOOL)isInTrash
{
  v2 = [(NSMutableDictionary *)self->_info objectForKeyedSubscript:@"asset.trashedState"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasVideoComplement
{
  v2 = [(NSMutableDictionary *)self->_info objectForKeyedSubscript:@"hasVideoComplement"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSNumber)fileSize
{
  return (NSNumber *)[(NSMutableDictionary *)self->_info objectForKeyedSubscript:@"originalFilesize"];
}

- (void)setAlternateImportImageDate:(id)a3
{
}

- (NSDate)alternateImportImageDate
{
  return (NSDate *)[(NSMutableDictionary *)self->_info objectForKeyedSubscript:@"alternateImportImageDate"];
}

- (NSDate)imageDate
{
  return (NSDate *)[(NSMutableDictionary *)self->_info objectForKeyedSubscript:@"asset.dateCreated"];
}

- (NSString)fileName
{
  return (NSString *)[(NSMutableDictionary *)self->_info objectForKeyedSubscript:@"originalFilename"];
}

- (NSString)uuid
{
  return (NSString *)[(NSMutableDictionary *)self->_info objectForKeyedSubscript:@"asset.uuid"];
}

- (id)objectID
{
  return (id)[(NSMutableDictionary *)self->_info objectForKeyedSubscript:@"asset"];
}

- (id)description
{
  char v3 = NSString;
  double v4 = [(PHImportDuplicateInfo *)self uuid];
  v5 = [(PHImportDuplicateInfo *)self fileSize];
  v6 = [(PHImportDuplicateInfo *)self fileName];
  v7 = [(PHImportDuplicateInfo *)self imageDate];
  v8 = [(PHImportDuplicateInfo *)self alternateImportImageDate];
  if (v8)
  {
    v9 = NSString;
    v10 = [(PHImportDuplicateInfo *)self alternateImportImageDate];
    v11 = [v9 stringWithFormat:@" (alt: %@)", v10];
    v12 = [v3 stringWithFormat:@"uuid: %@, size: %@, name: %@, date: %@%@", v4, v5, v6, v7, v11];
  }
  else
  {
    v12 = [v3 stringWithFormat:@"uuid: %@, size: %@, name: %@, date: %@%@", v4, v5, v6, v7, &stru_1EEAC1950];
  }

  return v12;
}

- (BOOL)isLegacy
{
  v2 = [(PHImportDuplicateInfo *)self alternateImportImageDate];
  BOOL v3 = v2 == 0;

  return v3;
}

- (PHImportDuplicateInfo)initWithAssetInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(PHImportDuplicateInfo *)self init];
    v6 = v5;
    if (v5) {
      [(PHImportDuplicateInfo *)v5 setInfo:v4];
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end