@interface WFDropboxMetadata
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
+ (id)clientModifiedDateJSONTransformer;
- (BOOL)isDirectory;
- (BOOL)isEqual:(id)a3;
- (NSDate)clientModifiedDate;
- (NSDate)serverModifiedDate;
- (NSNumber)fileSize;
- (NSString)contentHash;
- (NSString)identifier;
- (NSString)itemKind;
- (NSString)name;
- (NSString)path;
- (NSString)revision;
- (NSString)wfName;
- (id)wfFileType;
- (id)wfLastModifiedDate;
- (unint64_t)hash;
- (void)setItemKind:(id)a3;
@end

@implementation WFDropboxMetadata

- (id)wfFileType
{
  BOOL v3 = [(WFDropboxMetadata *)self wfIsDirectory];
  v4 = (void *)MEMORY[0x263F852B8];
  if (v3)
  {
    v5 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DAB0]];
  }
  else
  {
    v6 = [(WFDropboxMetadata *)self name];
    v5 = [v4 typeFromFilename:v6];
  }
  return v5;
}

- (id)wfLastModifiedDate
{
  BOOL v3 = [(WFDropboxMetadata *)self clientModifiedDate];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(WFDropboxMetadata *)self serverModifiedDate];
  }
  v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemKind, 0);
  objc_storeStrong((id *)&self->_serverModifiedDate, 0);
  objc_storeStrong((id *)&self->_clientModifiedDate, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_contentHash, 0);
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setItemKind:(id)a3
{
}

- (NSString)itemKind
{
  return self->_itemKind;
}

- (NSDate)serverModifiedDate
{
  return self->_serverModifiedDate;
}

- (NSDate)clientModifiedDate
{
  return self->_clientModifiedDate;
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (NSString)contentHash
{
  return self->_contentHash;
}

- (NSString)revision
{
  return self->_revision;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)wfName
{
  v2 = [(WFDropboxMetadata *)self name];
  BOOL v3 = [v2 stringByDeletingPathExtension];

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFDropboxMetadata *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(WFDropboxMetadata *)self identifier];
      v6 = [(WFDropboxMetadata *)v4 identifier];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(WFDropboxMetadata *)self identifier];
  unint64_t v3 = [v2 hash] ^ 0x89ABCDEFLL;

  return v3;
}

- (BOOL)isDirectory
{
  v2 = [(WFDropboxMetadata *)self itemKind];
  char v3 = [v2 isEqualToString:@"folder"];

  return v3;
}

+ (id)clientModifiedDateJSONTransformer
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  char v3 = (void *)MEMORY[0x263F08D50];
  v4 = [MEMORY[0x263EFFA18] timeZoneWithName:@"UTC"];
  id v5 = objc_msgSend(v3, "mtl_dateTransformerWithDateFormat:calendar:locale:timeZone:defaultDate:", @"yyyy-MM-dd'T'HH:mm:ss'Z'", 0, v2, v4, 0);

  return v5;
}

+ (id)JSONKeyPathsByPropertyKey
{
  v5[9] = *MEMORY[0x263EF8340];
  v4[0] = @"name";
  v4[1] = @"path";
  v5[0] = @"name";
  v5[1] = @"path_display";
  v4[2] = @"identifier";
  v4[3] = @"revision";
  v5[2] = @"id";
  v5[3] = @"rev";
  v4[4] = @"contentHash";
  v4[5] = @"fileSize";
  v5[4] = @"content_hash";
  v5[5] = @"size";
  v4[6] = @"clientModifiedDate";
  v4[7] = @"serverModifiedDate";
  v5[6] = @"client_modified";
  v5[7] = @"server_modified";
  v4[8] = @"itemKind";
  v5[8] = @"\\.tag";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:9];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end