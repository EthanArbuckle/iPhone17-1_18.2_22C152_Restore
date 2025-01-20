@interface BCSBusinessEmailItem
+ (BOOL)supportsSecureCoding;
+ (id)itemFromStatement:(sqlite3_stmt *)a3;
- (BCSBusinessEmailItem)initWithCoder:(id)a3;
- (BCSBusinessEmailItem)initWithEmail:(id)a3 localizedNames:(id)a4;
- (BCSBusinessEmailItem)initWithEmail:(id)a3 localizedNames:(id)a4 localizedDisplayNames:(id)a5 businessId:(id)a6 companyId:(id)a7;
- (BCSBusinessEmailItem)initWithEmailMessage:(id)a3;
- (BCSBusinessEmailItem)initWithIdentifier:(id)a3 defaultsDictionary:(id)a4;
- (BCSBusinessEmailItemIdentifier)identifier;
- (BCSEmailMetadataParquetMessage)message;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesItemIdentifying:(id)a3;
- (NSDictionary)localizedDisplayNames;
- (NSDictionary)localizedNames;
- (NSString)businessId;
- (NSString)companyId;
- (NSString)email;
- (NSString)name;
- (NSURL)logoURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)displayName;
- (id)itemIdentifier;
- (int64_t)truncatedHash;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMessage:(id)a3;
- (void)updateStatementValues:(sqlite3_stmt *)a3 withItemIdentifier:(id)a4;
@end

@implementation BCSBusinessEmailItem

- (BCSBusinessEmailItem)initWithEmail:(id)a3 localizedNames:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)BCSBusinessEmailItem;
  v8 = [(BCSItem *)&v25 init];
  if (v8)
  {
    v9 = objc_alloc_init(BCSEmailMetadataParquetMessage);
    message = v8->_message;
    v8->_message = v9;

    [(BCSEmailMetadataParquetMessage *)v8->_message setKey:v6];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          -[BCSEmailMetadataParquetMessage addName:](v8->_message, "addName:", *(void *)(*((void *)&v21 + 1) + 8 * v15++), (void)v21);
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v13);
    }

    v16 = [BCSBusinessEmailItemIdentifier alloc];
    v17 = [(BCSEmailMetadataParquetMessage *)v8->_message key];
    v18 = (BCSBusinessEmailItemIdentifier *)-[BCSBusinessEmailItemIdentifier initWithEmail:](v16, v17);
    identifier = v8->_identifier;
    v8->_identifier = v18;
  }
  return v8;
}

- (BCSBusinessEmailItem)initWithEmail:(id)a3 localizedNames:(id)a4 localizedDisplayNames:(id)a5 businessId:(id)a6 companyId:(id)a7
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v44.receiver = self;
  v44.super_class = (Class)BCSBusinessEmailItem;
  v17 = [(BCSItem *)&v44 init];
  if (v17)
  {
    v18 = objc_alloc_init(BCSEmailMetadataParquetMessage);
    message = v17->_message;
    v17->_message = v18;

    id v35 = v12;
    [(BCSEmailMetadataParquetMessage *)v17->_message setKey:v12];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v20 = v13;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v41;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v41 != v23) {
            objc_enumerationMutation(v20);
          }
          [(BCSEmailMetadataParquetMessage *)v17->_message addName:*(void *)(*((void *)&v40 + 1) + 8 * v24++)];
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v22);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v25 = v14;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v37;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(v25);
          }
          [(BCSEmailMetadataParquetMessage *)v17->_message addDisplayName:*(void *)(*((void *)&v36 + 1) + 8 * v29++)];
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v27);
    }

    [(BCSEmailMetadataParquetMessage *)v17->_message setBusinessId:v15];
    [(BCSEmailMetadataParquetMessage *)v17->_message setCompanyId:v16];
    v30 = [BCSBusinessEmailItemIdentifier alloc];
    v31 = [(BCSEmailMetadataParquetMessage *)v17->_message key];
    v32 = (BCSBusinessEmailItemIdentifier *)-[BCSBusinessEmailItemIdentifier initWithEmail:](v30, v31);
    identifier = v17->_identifier;
    v17->_identifier = v32;

    id v12 = v35;
  }

  return v17;
}

- (BCSBusinessEmailItem)initWithEmailMessage:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BCSBusinessEmailItem;
  v5 = [(BCSItem *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    message = v5->_message;
    v5->_message = (BCSEmailMetadataParquetMessage *)v6;

    v8 = [BCSBusinessEmailItemIdentifier alloc];
    v9 = [(BCSEmailMetadataParquetMessage *)v5->_message key];
    v10 = (BCSBusinessEmailItemIdentifier *)-[BCSBusinessEmailItemIdentifier initWithEmail:](v8, v9);
    identifier = v5->_identifier;
    v5->_identifier = v10;
  }
  return v5;
}

- (BCSBusinessEmailItem)initWithIdentifier:(id)a3 defaultsDictionary:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(BCSEmailLocalizedString);
  [(BCSEmailLocalizedString *)v8 setLocale:@"en-US"];
  v9 = [v6 objectForKeyedSubscript:@"name"];
  [(BCSEmailLocalizedString *)v8 setText:v9];

  [(BCSEmailLocalizedString *)v8 setIsDefault:1];
  v10 = [v7 email];

  v18[0] = v8;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  v17 = v8;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  objc_super v13 = [v6 objectForKeyedSubscript:@"businessId"];
  id v14 = [v6 objectForKeyedSubscript:@"companyId"];

  id v15 = [(BCSBusinessEmailItem *)self initWithEmail:v10 localizedNames:v11 localizedDisplayNames:v12 businessId:v13 companyId:v14];
  return v15;
}

- (NSString)email
{
  return [(BCSEmailMetadataParquetMessage *)self->_message key];
}

- (NSString)name
{
  v2 = [(BCSEmailMetadataParquetMessage *)self->_message names];
  v3 = [v2 defaultLocalizedStringsValue];

  return (NSString *)v3;
}

- (id)displayName
{
  v2 = [(BCSEmailMetadataParquetMessage *)self->_message displayNames];
  v3 = [v2 defaultLocalizedStringsValue];

  return v3;
}

- (NSDictionary)localizedNames
{
  v2 = [(BCSEmailMetadataParquetMessage *)self->_message names];
  v3 = [v2 localizedStringsToDictionary];

  return (NSDictionary *)v3;
}

- (NSString)businessId
{
  return [(BCSEmailMetadataParquetMessage *)self->_message businessId];
}

- (NSString)companyId
{
  return [(BCSEmailMetadataParquetMessage *)self->_message companyId];
}

- (NSDictionary)localizedDisplayNames
{
  v2 = [(BCSEmailMetadataParquetMessage *)self->_message displayNames];
  v3 = [v2 localizedStringsToDictionary];

  return (NSDictionary *)v3;
}

- (NSURL)logoURL
{
  return 0;
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = [(BCSBusinessEmailItem *)self description];
  v5 = [(BCSBusinessEmailItem *)self email];
  id v6 = [(BCSBusinessEmailItem *)self name];
  id v7 = [(BCSBusinessEmailItem *)self displayName];
  v8 = [(BCSBusinessEmailItem *)self businessId];
  v9 = [(BCSBusinessEmailItem *)self companyId];
  v10 = [v3 stringWithFormat:@"<%@ { email: %@, name: %@, displayName: %@, businessId: %@, companyId: %@>", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(BCSBusinessEmailItem *)self matchesItemIdentifying:v4];

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BCSEmailMetadataParquetMessage *)self->_message hash];
  return [(BCSBusinessEmailItemIdentifier *)self->_identifier hash] ^ v3;
}

- (id)itemIdentifier
{
  v2 = [(BCSBusinessEmailItem *)self identifier];
  unint64_t v3 = [v2 itemIdentifier];

  return v3;
}

- (int64_t)truncatedHash
{
  v2 = [(BCSBusinessEmailItem *)self identifier];
  int64_t v3 = [v2 truncatedHash];

  return v3;
}

- (int64_t)type
{
  v2 = [(BCSBusinessEmailItem *)self identifier];
  int64_t v3 = [v2 type];

  return v3;
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BCSBusinessEmailItem *)self identifier];
  char v6 = [v5 matchesItemIdentifying:v4];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    char v6 = [(BCSBusinessEmailItem *)self message];
    uint64_t v7 = [v6 copyWithZone:a3];
    v8 = (void *)v5[3];
    v5[3] = v7;

    v9 = [(BCSBusinessEmailItem *)self identifier];
    uint64_t v10 = [v9 copyWithZone:a3];
    id v11 = (void *)v5[2];
    v5[2] = v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(BCSBusinessEmailItem *)self message];
  BOOL v5 = [v6 data];
  [v4 encodeObject:v5 forKey:@"Message"];
}

- (BCSBusinessEmailItem)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Message"];

  id v6 = [[BCSEmailMetadataParquetMessage alloc] initWithData:v5];
  if (v6)
  {
    self = [(BCSBusinessEmailItem *)self initWithEmailMessage:v6];
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BCSBusinessEmailItemIdentifier)identifier
{
  return self->_identifier;
}

- (BCSEmailMetadataParquetMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)itemFromStatement:(sqlite3_stmt *)a3
{
  sqlite3_column_int64(a3, 0);
  id v4 = BCSEmailStoreDataFromStatement(a3);
  sqlite3_int64 v5 = sqlite3_column_int64(a3, 2);
  id v6 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", sqlite3_column_double(a3, 3));
  uint64_t v7 = 0;
  if (v4 && v5 == 1)
  {
    v8 = [[BCSEmailMetadataParquetMessage alloc] initWithData:v4];
    if (v8)
    {
      v9 = [[BCSBusinessEmailItem alloc] initWithEmailMessage:v8];
      uint64_t v7 = v9;
      if (v9)
      {
        [(BCSItem *)v9 setExpirationDate:v6];
        uint64_t v10 = v7;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (void)updateStatementValues:(sqlite3_stmt *)a3 withItemIdentifier:(id)a4
{
  sqlite3_bind_int64(a3, 1, [a4 truncatedHash]);
  id v6 = [(BCSBusinessEmailItem *)self message];
  uint64_t v7 = [v6 data];

  id v10 = v7;
  sqlite3_bind_blob(a3, 2, (const void *)[v10 bytes], objc_msgSend(v10, "length"), 0);
  sqlite3_bind_int64(a3, 3, 1);
  v8 = [(BCSItem *)self expirationDate];
  [v8 timeIntervalSince1970];
  sqlite3_bind_double(a3, 4, v9);
}

@end