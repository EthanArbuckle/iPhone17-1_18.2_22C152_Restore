@interface FPItemID
+ (BOOL)supportsSecureCoding;
+ (id)coreSpotlightEncodedDomainIdentifier:(id)a3;
+ (id)csIdentifierFromFPIdentifier:(id)a3 domainIdentifier:(id)a4;
+ (id)fpIdentifierFromCoreSpotlightIdentifier:(id)a3 domainIdentifier:(id)a4;
+ (id)getFPIdentifierFromCoreSpotlightIdentifier:(id)a3;
+ (id)rootItemIDWithProviderDomainID:(id)a3;
+ (id)rootItemIDWithProviderIdentifier:(id)a3 domainIdentifier:(id)a4;
+ (id)stringByRemovingPrefix:(id)a3 fromIdentifier:(id)a4;
+ (void)getDomainIdentifier:(id *)a3 andIdentifier:(id *)a4 fromCoreSpotlightIdentifier:(id)a5;
- (BOOL)isDiskIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItemID:(id)a3;
- (BOOL)isPlaceholder;
- (FPItemID)initWithCoder:(id)a3;
- (FPItemID)initWithProviderDomainID:(id)a3 itemIdentifier:(id)a4;
- (FPItemID)initWithProviderID:(id)a3 domainIdentifier:(id)a4 coreSpotlightIdentifier:(id)a5;
- (FPItemID)initWithProviderID:(id)a3 domainIdentifier:(id)a4 itemIdentifier:(id)a5;
- (FPItemID)initWithSearchableItem:(id)a3;
- (NSString)domainIdentifier;
- (NSString)identifier;
- (NSString)providerDomainID;
- (NSString)providerID;
- (NSString)providerIdentifier;
- (id)coreSpotlightIdentifier;
- (id)description;
- (id)transformForMigratedCloudDocsProviderDomainIdentifier:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setProviderDomainID:(id)a3;
@end

@implementation FPItemID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_providerID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FPItemID *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(FPItemID *)self isEqualToItemID:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToItemID:(id)a3
{
  BOOL v6 = (FPItemID *)a3;
  v7 = v6;
  if (self != v6)
  {
    providerID = self->_providerID;
    v9 = [(FPItemID *)v6 providerID];
    if (providerID != v9)
    {
      v10 = self->_providerID;
      v4 = [(FPItemID *)v7 providerID];
      if (![(NSString *)v10 isEqualToString:v4])
      {
        char v11 = 0;
        goto LABEL_17;
      }
    }
    identifier = self->_identifier;
    v13 = [(FPItemID *)v7 identifier];
    if (identifier == v13
      || (v14 = self->_identifier,
          [(FPItemID *)v7 identifier],
          v3 = objc_claimAutoreleasedReturnValue(),
          [(NSString *)v14 isEqualToString:v3]))
    {
      domainIdentifier = self->_domainIdentifier;
      uint64_t v16 = [(FPItemID *)v7 domainIdentifier];
      if (domainIdentifier == (NSString *)v16)
      {

        char v11 = 1;
      }
      else
      {
        v17 = (void *)v16;
        uint64_t v18 = [(FPItemID *)v7 domainIdentifier];
        if (v18)
        {
          v19 = (void *)v18;
          v20 = self->_domainIdentifier;
          [(FPItemID *)v7 domainIdentifier];
          v21 = v23 = v4;
          char v11 = [(NSString *)v20 isEqualToString:v21];

          v4 = v23;
        }
        else
        {

          char v11 = 0;
        }
      }
      if (identifier == v13)
      {
LABEL_16:

        if (providerID == v9)
        {
LABEL_18:

          goto LABEL_19;
        }
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      char v11 = 0;
    }

    goto LABEL_16;
  }
  char v11 = 1;
LABEL_19:

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)providerID
{
  return self->_providerID;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (FPItemID)initWithProviderID:(id)a3 domainIdentifier:(id)a4 itemIdentifier:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FPItemID;
  v13 = [(FPItemID *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_providerID, a3);
    objc_storeStrong((id *)&v14->_identifier, a5);
    objc_storeStrong((id *)&v14->_domainIdentifier, a4);
    if (!v14->_domainIdentifier)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:v14 file:@"FPItem.m" lineNumber:124 description:@"domainIdentifier must not be nil"];
    }
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_providerID hash];
  NSUInteger v4 = [(NSString *)self->_identifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_domainIdentifier hash];
}

+ (id)fpIdentifierFromCoreSpotlightIdentifier:(id)a3 domainIdentifier:(id)a4
{
  id v6 = a3;
  v7 = [a1 coreSpotlightEncodedDomainIdentifier:a4];
  v8 = [a1 stringByRemovingPrefix:v7 fromIdentifier:v6];

  return v8;
}

+ (id)stringByRemovingPrefix:(id)a3 fromIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5 || ![v6 hasPrefix:v5])
  {
    id v9 = v7;
    goto LABEL_6;
  }
  unint64_t v8 = [v7 length];
  if (v8 > [v5 length] + 1)
  {
    objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v5, "length") + 1);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    id v10 = v9;
    goto LABEL_7;
  }
  id v10 = 0;
LABEL_7:

  return v10;
}

+ (id)coreSpotlightEncodedDomainIdentifier:(id)a3
{
  if (a3) {
    NSUInteger v3 = (__CFString *)a3;
  }
  else {
    NSUInteger v3 = @"NSFileProviderDomainDefaultIdentifier";
  }
  NSUInteger v4 = v3;
  if ([(__CFString *)v4 isEqualToString:@"NSFileProviderDomainDefaultIdentifier"])
  {
    id v5 = (id)defaultDomainPrefix;
  }
  else
  {
    id v6 = [(__CFString *)v4 dataUsingEncoding:4];
    v7 = [v6 base64EncodedStringWithOptions:0];

    id v5 = [(id)domainPrefix stringByAppendingPathComponent:v7];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  providerID = self->_providerID;
  id v5 = a3;
  [v5 encodeObject:providerID forKey:@"_providerIdentifier"];
  [v5 encodeObject:self->_identifier forKey:@"_identifier"];
  [v5 encodeObject:self->_domainIdentifier forKey:@"_domainIdentifier"];
}

+ (id)rootItemIDWithProviderDomainID:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "fp_toProviderID");
  id v6 = objc_msgSend(v4, "fp_toDomainIdentifier");

  v7 = [a1 rootItemIDWithProviderIdentifier:v5 domainIdentifier:v6];

  return v7;
}

+ (id)rootItemIDWithProviderIdentifier:(id)a3 domainIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = (void *)[objc_alloc((Class)a1) initWithProviderID:v7 domainIdentifier:v6 itemIdentifier:@"NSFileProviderRootContainerItemIdentifier"];

  return v8;
}

- (NSString)providerDomainID
{
  return (NSString *)objc_msgSend(NSString, "fp_providerDomainIDFromProviderID:domainIdentifier:", self->_providerID, self->_domainIdentifier);
}

- (FPItemID)initWithProviderDomainID:(id)a3 itemIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = objc_msgSend(v7, "fp_toProviderID");
  id v9 = objc_msgSend(v7, "fp_toDomainIdentifier");

  id v10 = [(FPItemID *)self initWithProviderID:v8 domainIdentifier:v9 itemIdentifier:v6];
  return v10;
}

- (BOOL)isPlaceholder
{
  NSUInteger v3 = [(FPItemID *)self identifier];
  id v4 = [v3 pathComponents];
  unint64_t v5 = [v4 count];

  if (v5 < 2) {
    return 0;
  }
  id v6 = [(FPItemID *)self identifier];
  id v7 = [v6 pathComponents];
  unint64_t v8 = [v7 objectAtIndexedSubscript:0];
  char v9 = [v8 isEqualToString:@"__fp"];

  return v9;
}

- (BOOL)isDiskIdentifier
{
  return [(NSString *)self->_identifier hasPrefix:@"__fp/fs/"];
}

- (FPItemID)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FPItemID;
  unint64_t v5 = [(FPItemID *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_providerIdentifier"];
    providerID = v5->_providerID;
    v5->_providerID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_domainIdentifier"];
    domainIdentifier = v5->_domainIdentifier;
    v5->_domainIdentifier = (NSString *)v8;

    if (!v5->_domainIdentifier) {
      objc_storeStrong((id *)&v5->_domainIdentifier, @"NSFileProviderDomainDefaultIdentifier");
    }
    id v10 = objc_msgSend(NSString, "fp_providerDomainIDFromProviderID:domainIdentifier:", v5->_providerID);
    int v11 = objc_msgSend(v4, "fp_checkProviderIdentifier:", v10);

    if (!v11)
    {
      v14 = 0;
      goto LABEL_8;
    }
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;
  }
  v14 = v5;
LABEL_8:

  return v14;
}

- (id)description
{
  if ([(NSString *)self->_domainIdentifier isEqualToString:@"NSFileProviderDomainDefaultIdentifier"])
  {
    domainIdentifier = 0;
  }
  else
  {
    domainIdentifier = self->_domainIdentifier;
  }
  id v4 = domainIdentifier;
  if ([(NSString *)self->_identifier isEqualToString:@"NSFileProviderRootContainerItemIdentifier"])
  {
    unint64_t v5 = @"root";
  }
  else if ([(NSString *)self->_identifier isEqualToString:@"NSFileProviderTrashContainerItemIdentifier"])
  {
    unint64_t v5 = @"trash";
  }
  else
  {
    unint64_t v5 = self->_identifier;
  }
  uint64_t v6 = NSString;
  uint64_t v7 = [(NSString *)self->_providerID fp_fpIdentifier];
  uint64_t v8 = (void *)v7;
  if (v4)
  {
    char v9 = [(NSString *)v4 fp_obfuscatedFilename];
    id v10 = [v6 stringWithFormat:@"%@/%@/%@", v8, v9, v5];
  }
  else
  {
    id v10 = [v6 stringWithFormat:@"%@/%@", v7, v5];
  }

  return v10;
}

- (NSString)providerIdentifier
{
  return self->_providerID;
}

- (void)setProviderDomainID:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "fp_toProviderID");
  unint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  providerID = self->_providerID;
  self->_providerID = v5;

  objc_msgSend(v4, "fp_toDomainIdentifier");
  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  domainIdentifier = self->_domainIdentifier;
  self->_domainIdentifier = v7;
}

- (id)transformForMigratedCloudDocsProviderDomainIdentifier:(id)a3
{
  id v5 = a3;
  if (([(NSString *)self->_providerID isEqual:@"com.apple.CloudDocs.MobileDocumentsFileProvider"] & 1) == 0
    && ![(NSString *)self->_providerID isEqual:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"])
  {
    goto LABEL_9;
  }
  uint64_t v6 = objc_msgSend(v5, "fp_toProviderID");
  char v7 = objc_msgSend(v6, "fp_isiCloudDriveOrCloudDocsIdentifier");

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = objc_msgSend(v5, "fp_toProviderID");
    char v9 = objc_msgSend(v8, "fp_isiCloudDriveOrCloudDocsIdentifier");

    if ((v9 & 1) == 0)
    {
      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"FPItem.m", 265, @"wrong migrated identifier %@", v5 object file lineNumber description];
    }
  }
  id v10 = [(NSString *)self->_identifier UTF8String];
  int v11 = *v10;
  if (v11 == 100)
  {
    unint64_t v15 = strtoul(v10 + 1, 0, 16);
    v13 = [FPItemID alloc];
    objc_msgSend(NSString, "stringWithFormat:", @"__fp/fs/docID(%u)", v15);
    goto LABEL_11;
  }
  if (v11 != 105)
  {
LABEL_9:
    v14 = self;
    goto LABEL_12;
  }
  unint64_t v12 = strtoull(v10 + 1, 0, 16);
  v13 = [FPItemID alloc];
  objc_msgSend(NSString, "stringWithFormat:", @"__fp/fs/fileID(%llu)", v12);
  objc_super v16 = LABEL_11:;
  v14 = [(FPItemID *)v13 initWithProviderDomainID:v5 itemIdentifier:v16];

LABEL_12:

  return v14;
}

- (FPItemID)initWithSearchableItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 attributeSet];
  uint64_t v6 = [v5 fileProviderID];
  char v7 = [v4 attributeSet];
  uint64_t v8 = [v7 fileProviderDomainIdentifier];
  char v9 = [v4 uniqueIdentifier];

  id v10 = [(FPItemID *)self initWithProviderID:v6 domainIdentifier:v8 coreSpotlightIdentifier:v9];
  return v10;
}

- (FPItemID)initWithProviderID:(id)a3 domainIdentifier:(id)a4 coreSpotlightIdentifier:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v16 = 0;
  id v17 = 0;
  id v10 = a3;
  +[FPItemID getDomainIdentifier:&v17 andIdentifier:&v16 fromCoreSpotlightIdentifier:v9];
  id v11 = v17;
  id v12 = v16;
  if (([v11 isEqual:v8] & 1) == 0)
  {
    v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "-[FPItemID(CSSearchableItem) initWithProviderID:domainIdentifier:coreSpotlightIdentifier:]";
      __int16 v20 = 2112;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v12;
      _os_log_impl(&dword_1A33AE000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] %{public}s called with a domain identifier %@ that does not match the corresponding csIdentifier %@ (inferred %@)", buf, 0x2Au);
    }
  }
  v14 = [[FPItemID alloc] initWithProviderID:v10 domainIdentifier:v11 itemIdentifier:v12];

  return v14;
}

- (id)coreSpotlightIdentifier
{
  NSUInteger v3 = [(FPItemID *)self identifier];
  id v4 = [(FPItemID *)self domainIdentifier];
  id v5 = +[FPItemID csIdentifierFromFPIdentifier:v3 domainIdentifier:v4];

  return v5;
}

+ (void)getDomainIdentifier:(id *)a3 andIdentifier:(id *)a4 fromCoreSpotlightIdentifier:(id)a5
{
  id v7 = a5;
  id v16 = v7;
  if (a3)
  {
    *a3 = @"NSFileProviderDomainDefaultIdentifier";
    id v7 = v16;
  }
  if (a4)
  {
    *a4 = v16;
    id v7 = v16;
  }
  id v8 = [v7 pathComponents];
  id v9 = [v8 firstObject];
  id v10 = v9;
  if (v9)
  {
    if ([v9 isEqualToString:@"__fpdefault"])
    {
      id v11 = @"NSFileProviderDomainDefaultIdentifier";
      unint64_t v12 = 1;
    }
    else
    {
      if (![v10 isEqualToString:domainPrefix])
      {
        id v11 = 0;
LABEL_20:

        goto LABEL_21;
      }
      v13 = [v8 objectAtIndexedSubscript:1];
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v13 options:0];
      if (v14) {
        id v11 = (__CFString *)[[NSString alloc] initWithData:v14 encoding:4];
      }
      else {
        id v11 = 0;
      }

      unint64_t v12 = 2;
    }
    if ([v8 count] >= v12 && v11)
    {
      if (a3) {
        *a3 = v11;
      }
      if (a4)
      {
        unint64_t v15 = objc_msgSend(v8, "subarrayWithRange:", v12, objc_msgSend(v8, "count") - v12);
        *a4 = [v15 componentsJoinedByString:@"/"];
      }
    }
    goto LABEL_20;
  }
LABEL_21:
}

+ (id)getFPIdentifierFromCoreSpotlightIdentifier:(id)a3
{
  id v5 = 0;
  +[FPItemID getDomainIdentifier:0 andIdentifier:&v5 fromCoreSpotlightIdentifier:a3];
  id v3 = v5;

  return v3;
}

+ (id)csIdentifierFromFPIdentifier:(id)a3 domainIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [a1 coreSpotlightEncodedDomainIdentifier:a4];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 stringByAppendingPathComponent:v6];
  }
  else
  {
    id v9 = v6;
  }
  id v10 = v9;

  return v10;
}

@end